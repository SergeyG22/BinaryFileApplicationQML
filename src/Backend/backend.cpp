#include "include/Application/Backend/backend.h"



QVariantMap BackendOperations::binaryFindOperation(QString pathA, QString pathB){

        std::string folderA = pathA.toStdString();
        std::string folderB = pathB.toStdString();

        boost::iostreams::mapped_file_source fileA;
        boost::iostreams::mapped_file_source fileB;

        QVariantMap lines;
        int position = 0;

        if (boost::filesystem::exists(boost::filesystem::path(folderA)) &&
            boost::filesystem::exists(boost::filesystem::path(folderB))) {

            for (auto& firstIt : boost::filesystem::directory_iterator(folderA)) {
                if (!boost::filesystem::is_directory(firstIt.path())) {
                    if (boost::filesystem::file_size(firstIt.path())) {
                        fileA.close();
                        fileA.open(firstIt.path());
                    }
                    else {
                        fileA.close();
                    }

                }
                else {
                    fileA.close();
                }


                for (auto& secondIt : boost::filesystem::directory_iterator(folderB)) {
                    if (!boost::filesystem::is_directory(secondIt.path())) {
                        if (boost::filesystem::file_size(secondIt.path())) {
                            fileB.close();
                            fileB.open(secondIt.path());
                        }
                        else {
                            fileB.close();
                        }

                    }
                    else {
                        fileB.close();
                    }

                    if (fileA.size() && fileB.size()) {
                        if ((fileA.data() != nullptr) || (fileB.data() != nullptr)) {

                            if (fileA.size() == fileB.size() && boost::algorithm::equal(fileA.data(), fileA.data() + fileA.size(), fileB.data(),
                                fileB.data() + fileB.size())) {
                                  QString item = QString::fromUtf8(firstIt.path().filename().string().c_str())
                                                 + " [EQUIALENT] " +
                                                 QString::fromUtf8(secondIt.path().filename().string().c_str());
                                  lines.insert(QString::number(position),item);
                                  position++;
                            }
                        }
                    }
                }

            }

        }

  return lines;
}
