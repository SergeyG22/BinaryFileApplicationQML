#include "include/Application/Backend/backend.h"



QVariantMap BackendOperations::binaryFindOperation(QString pathA, QString pathB){

        std::string folderA = pathA.toStdString();
        std::string folderB = pathB.toStdString();

        boost::iostreams::mapped_file_source fileA;
        boost::iostreams::mapped_file_source fileB;

        int position = 0;
        QVariantMap lines;
        QSet<QString>duplicatePaths;

        if (boost::filesystem::exists(boost::filesystem::path(folderA)) &&
            boost::filesystem::exists(boost::filesystem::path(folderB))) {

            for(auto firstIt = boost::filesystem::recursive_directory_iterator(folderA);
                firstIt != boost::filesystem::recursive_directory_iterator(); ++firstIt) {

                if (!boost::filesystem::is_directory(firstIt->path())) {
                    if (boost::filesystem::file_size(firstIt->path())) {
                        fileA.close();
                        fileA.open(firstIt->path());
                    }
                    else {
                        fileA.close();
                    }

                }
                else {
                    fileA.close();
                }

                for(auto secondIt = boost::filesystem::recursive_directory_iterator(folderB);
                    secondIt != boost::filesystem::recursive_directory_iterator(); ++secondIt) {

                    if (!boost::filesystem::is_directory(secondIt->path())) {
                        if (boost::filesystem::file_size(secondIt->path())) {
                            fileB.close();
                            fileB.open(secondIt->path());
                        }
                        else {
                            fileB.close();
                        }

                    }
                    else {
                        fileB.close();
                    }


                    bool exclude = false;
                    for(auto& duplicate : duplicatePaths){
                        if(duplicate == secondIt->path().string().c_str()){
                            exclude = true;
                            break;
                        }
                    }

                    if(exclude){
                        continue;
                    }

                    if (fileA.size() && fileB.size()) {
                        if ((fileA.data() != nullptr) || (fileB.data() != nullptr)) {

                            if (fileA.size() == fileB.size() && boost::algorithm::equal(fileA.data(), fileA.data() + fileA.size(), fileB.data(),
                                fileB.data() + fileB.size())) {

                              QString duplicate = QString::fromUtf8(secondIt->path().string().c_str());
                              duplicatePaths.insert(duplicate);

                                QString item = QString::fromUtf8(firstIt->path().filename().string().c_str())
                                                 + " [EQUIALENT] " +
                                                 QString::fromUtf8(secondIt->path().filename().string().c_str());
                                lines.insert(QString::number(position),item);
                                position++;
                                break;
                            }
                        }
                    }
                }

            }

        }


  return lines;
}
