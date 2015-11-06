sig Str{}

sig User{

	email: one Str,
	
}

sig Driver{

	email: one Str,
	available: one Int,

}{

	available>=0
	available<=1
	//0 unavailable, 1 available
}

sig Zone{

	queue: one Queue,

}

sig Queue{

	head: one Driver,
	tail: one Driver,

}

sig Notification{

	notReq: one Request,
	driverNot: one Driver,

}

sig Request{

	user: one User,
	zone: one Zone,

}


fact notOnlyToAvailable{

	all n: Notification | n.driver.available = 1 

}

fact notOnlytoHead{

	all n: Notification | n.notRequest.driver = n.notReq.zone.queue.head

}
