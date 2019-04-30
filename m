Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 149CE101C1
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 23:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfD3VYe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 17:24:34 -0400
Received: from mail-eopbgr20056.outbound.protection.outlook.com ([40.107.2.56]:29437
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726048AbfD3VYe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Apr 2019 17:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcG9tKEREUX4INHzyaf5ixzH/r2uvK7+5Rcb8yyWIK0=;
 b=qDmDOVJu2aAiqQeQqt2spClUWuFuhpPmsqRDARZ1xHBNvWtyagEKb05i5uBQBJ4I8OSRX/nutDUPoVOII54ioXnwG6cOONOEsRtDsXnTosEpfqF6/FSmVD0ITP1/3eQa41dXnXq/WMvcx42p2G1heFluQgcvWnVTuWCJ2IFdKog=
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com (20.177.196.210) by
 AM6PR05MB5702.eurprd05.prod.outlook.com (20.178.86.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 30 Apr 2019 21:24:29 +0000
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::61f4:6de4:5401:5f56]) by AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::61f4:6de4:5401:5f56%2]) with mapi id 15.20.1856.008; Tue, 30 Apr 2019
 21:24:29 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Asmaa Mnebhi <Asmaa@mellanox.com>,
        "minyard@acm.org" <minyard@acm.org>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Michael Shych <michaelsh@mellanox.com>
CC:     Asmaa Mnebhi <Asmaa@mellanox.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v4 0/1] Add support for IPMB driver
Thread-Topic: [PATCH v4 0/1] Add support for IPMB driver
Thread-Index: AQHU/35gob0SSpnmDUiPba8AHw4raaZVL7ug
Date:   Tue, 30 Apr 2019 21:24:29 +0000
Message-ID: <AM6PR05MB5224FCACBD4EF55F3890EC6AA23A0@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <cover.1556645340.git.Asmaa@mellanox.com>
In-Reply-To: <cover.1556645340.git.Asmaa@mellanox.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [84.108.218.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c4b7f41-a2fb-4daf-d986-08d6cdb23b1d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM6PR05MB5702;
x-ms-traffictypediagnostic: AM6PR05MB5702:
x-microsoft-antispam-prvs: <AM6PR05MB5702298C9D61861EF9ECD327A23A0@AM6PR05MB5702.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(346002)(136003)(396003)(39860400002)(376002)(13464003)(199004)(189003)(14454004)(476003)(110136005)(256004)(53936002)(186003)(2501003)(6246003)(55016002)(66066001)(26005)(11346002)(2201001)(14444005)(446003)(86362001)(6506007)(53546011)(5660300002)(7696005)(102836004)(478600001)(68736007)(6436002)(9686003)(4326008)(486006)(8936002)(76176011)(74316002)(229853002)(33656002)(8676002)(52536014)(99286004)(3846002)(7736002)(305945005)(2906002)(66446008)(76116006)(66556008)(66946007)(66476007)(71200400001)(71190400001)(6636002)(64756008)(25786009)(73956011)(54906003)(6116002)(81156014)(316002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB5702;H:AM6PR05MB5224.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: D7xE1IIPqT+xjPRab9M55SfmOm980C+ZnonqepN7SVPhyd+ryhL+ElT8qQO93K921CmKAgg+ApSyMhufrCBY6gvxcX/qiegozODAcB8hEIISq7ppLBtQj3qMv4fkEFIEM1aK/qValJGupNcTFfYQ6PJ20Z80sHbtFNjNZfaz/ETwY3oK1Y5kEZf5BnkVb3dm6aXsJP89K3f2BfC+oiZzoPPVU8TUES08JgQTH98nq7EFKa9CkPARjc9Beap3PGkrzo3BcflbTvj6YitwBoDMwoBeABsdoBeMQF8h9sD8pA7Ykj+8Zkv5AT9zyxsFdcQWX4by0w+x0Rru08RT97h1YzCwMrgft3DoKsZQ87MFNGSvyIR3tJ3ly3olo6WbGAsy980PmH9Zq9wLUeMe2MFXOJxDYRB8M6gXkaVnfKTJbfI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4b7f41-a2fb-4daf-d986-08d6cdb23b1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 21:24:29.6256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5702
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> -----Original Message-----
> From: Asmaa Mnebhi <Asmaa@mellanox.com>
> Sent: Tuesday, April 30, 2019 8:59 PM
> To: minyard@acm.org; wsa@the-dreams.de; Vadim Pasternak
> <vadimp@mellanox.com>; Michael Shych <michaelsh@mellanox.com>
> Cc: Asmaa Mnebhi <Asmaa@mellanox.com>; linux-kernel@vger.kernel.org;
> linux-i2c@vger.kernel.org
> Subject: [PATCH v4 0/1] Add support for IPMB driver
>=20
> Thank you for your feedback Vadim. I have addressed your comments.

Hi Asmaa,

Thank you for your comments and added doc.

>=20
> 1) You are correct. This driver is not specific to Mellanox so I have rem=
oved the
> Mellanox attribute.
>=20
> 2) I have added a documentation file called IPMB.txt which explains how t=
his
> module works and how it should be instantiated. It is very similar to the=
 existing
> linux i2c-slave-eeprom module.
>=20
> The HW for my testing works as follows:
> A BMC is connected to a Satellite MC via I2C (I2C is equivalent to IPMB).=
 The
> BMC initiates the IPMB requests and sends them via I2C.
> Obviously the BMC needs its own driver to do this which I haven't include=
d in this
> code. We have no intent of upstreaming that at the moment.

I believe you are going to do it at some point, right?

> This ipmb-dev-int driver is to be loaded and instantiated on the Satellit=
e MC to
> be able to receive IPMB requests. These IPMB request messages will be pic=
ked
> up by a user space program such (in my case it is OpenIPMI) to handle the
> request and generate a response.
> The response will be then passed from the user program back to kernel spa=
ce.
> Then this driver would send that response back to the BMC.
>=20
> 3) You asked the following:
>=20
> "Is it expected to be zero in vaid case?"
> The 8 least significant bits of the sum is always expected to be 0 in the=
 case
> where the checksum is valid. I have added a comment for clarifications.


>=20
> "why do you need this cast?"
> buf[++ipmb_dev_p->msg_idx]=3D(u8)(client->addr<<1)
> This is because client->addr is of type unsigned short which is
> 2 bytes so it is safer to typecast it to u8 (u8* buf)

Better, if you can avoid cast.
Would compiler warn if you use for example
rol16(client->addr, 1) & GENMASK(7, 0);
or something like it?


>=20
> "It could be only single ipmb-dev within the system? Couldn't it be few, =
like
> master/slave for example?"
> My understanding of your question is that: what if we have multiple insta=
nces of
> ipmb-dev-int, that we register it under different addresses?
> This driver only works as a slave so it will only be instantiated once on=
 the
> Satellite MC under one slave address.

I mentioned some config like:
BMC1 (master)  -- busA --|
			Satellite
BMC2 (standby)	-- busB --|=20

Since this is not Mellanox specific driver, maybe it would be good to suppo=
rt
multiple instances of it.

>=20
> Asmaa Mnebhi (1):
>   Add support for IPMB driver
>=20
>  Documentation/IPMB.txt           |  53 ++++++
>  drivers/char/ipmi/Kconfig        |   8 +
>  drivers/char/ipmi/Makefile       |   1 +
>  drivers/char/ipmi/ipmb_dev_int.c | 381
> +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 443 insertions(+)
>  create mode 100644 Documentation/IPMB.txt  create mode 100644
> drivers/char/ipmi/ipmb_dev_int.c
>=20
> --
> 2.1.2

