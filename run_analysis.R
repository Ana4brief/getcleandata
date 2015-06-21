all_train$dataset<-rep("train",dim(all_train)[1])
all<-rbind(all_train,all_test)
#task 4
features<-read.table("features.txt")
names(all)<-c("subject_id",as.character(features[,2]),"activity","dataset")
#task 3
activities<-read.table("activity_labels.txt")
for(i in activities[,1]){
all$activity[all$activity==i]<-as.character(activities[i,2])
}
#task 2
all_meanstd<-all[,c(1,grep("mean|std",features[,2])+1,dim(all)[2]-1,dim(all)[2])]
#task 5
i<-interaction(as.factor(all_meanstd$subject_id),as.factor(all_meanstd$activity))
i<-as.character(i)
all_subjectactivitymeans<-data.frame(matrix(0,length(levels(as.factor(i))),dim(all_meanstd)[2]-1))
names(all_subjectactivitymeans)<-names(all_meanstd)[1:(dim(all_meanstd)[2]-1)]
for(k in seq(2,dim(all_meanstd)[2]-2)){
t<-tapply(all_meanstd[,k],list(as.factor(all_meanstd$subject_id),as.factor(all_meanstd$activity)),mean)
all_subjectactivitymeans[,k]<-matrix(t,length(unique(all_meanstd$subject_id))*length(unique(all_meanstd$activity)),1)
}
for(j in seq(1,length(levels(as.factor(i))))){
all_subjectactivitymeans$subject_id[j]<-strsplit(i,"\\.")[j][[1]][1]
all_subjectactivitymeans$activity[j]<-strsplit(i,"\\.")[j][[1]][2]
}
#save
write.table(all_subjectactivitymeans,"all_subjectactivitymeans.txt",row.name=FALSE)
