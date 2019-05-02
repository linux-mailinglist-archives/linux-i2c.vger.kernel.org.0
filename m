Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74A2C121A0
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2019 20:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbfEBSGT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 May 2019 14:06:19 -0400
Received: from mail-eopbgr40060.outbound.protection.outlook.com ([40.107.4.60]:52836
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725962AbfEBSGT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 May 2019 14:06:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adBeJlgzs88ftsQpQuMeyw/XjOUOE/vjmHFU5hrIirI=;
 b=DETiqvG14q06YfZu+SKJURh5M0aCjS+CcVksGzkQgkirAbq3keAWVy5fxTeA6ky/exigLQHGAi163MF5M7jrpsWoUl92un8kBjJ3pArm/m7unqL26pem3chB8O2ZsbMadlvenjMkbtMBA0cnMwh1I/ZExfPyp3aD3Vy6uqXL0AQ=
Received: from VI1PR05MB6239.eurprd05.prod.outlook.com (20.178.124.30) by
 VI1PR05MB5984.eurprd05.prod.outlook.com (20.178.127.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Thu, 2 May 2019 18:06:13 +0000
Received: from VI1PR05MB6239.eurprd05.prod.outlook.com
 ([fe80::cd72:ad84:2379:1f55]) by VI1PR05MB6239.eurprd05.prod.outlook.com
 ([fe80::cd72:ad84:2379:1f55%2]) with mapi id 15.20.1856.008; Thu, 2 May 2019
 18:06:12 +0000
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     Vadim Pasternak <vadimp@mellanox.com>,
        "minyard@acm.org" <minyard@acm.org>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Michael Shych <michaelsh@mellanox.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v4 0/1] Add support for IPMB driver
Thread-Topic: [PATCH v4 0/1] Add support for IPMB driver
Thread-Index: AQHU/36JYRxgAz5nX0+eYBy40WDgaqZVNzOAgAEMmbA=
Date:   Thu, 2 May 2019 18:06:12 +0000
Message-ID: <VI1PR05MB62392EDC0FD3C960519C91ABDA340@VI1PR05MB6239.eurprd05.prod.outlook.com>
References: <cover.1556645340.git.Asmaa@mellanox.com>
 <AM6PR05MB5224FCACBD4EF55F3890EC6AA23A0@AM6PR05MB5224.eurprd05.prod.outlook.com>
In-Reply-To: <AM6PR05MB5224FCACBD4EF55F3890EC6AA23A0@AM6PR05MB5224.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: vadimp@mellanox.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Asmaa@mellanox.com; 
x-originating-ip: [216.156.69.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ebd4a25-100e-4258-5311-08d6cf28dccc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR05MB5984;
x-ms-traffictypediagnostic: VI1PR05MB5984:
x-microsoft-antispam-prvs: <VI1PR05MB59843858C33E2CA3F11D891CDA340@VI1PR05MB5984.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(39860400002)(366004)(396003)(346002)(13464003)(199004)(189003)(305945005)(7736002)(256004)(2501003)(68736007)(55016002)(33656002)(76116006)(66446008)(7696005)(316002)(66556008)(6636002)(9686003)(99286004)(14454004)(66476007)(64756008)(73956011)(86362001)(66066001)(72206003)(71200400001)(71190400001)(2201001)(74316002)(14444005)(54906003)(110136005)(66946007)(229853002)(81156014)(4326008)(6436002)(81166006)(25786009)(52536014)(2906002)(6246003)(53936002)(5660300002)(102836004)(478600001)(6116002)(3846002)(8676002)(6506007)(80792005)(53546011)(486006)(26005)(11346002)(476003)(8936002)(186003)(446003)(76176011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB5984;H:VI1PR05MB6239.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6c4nkOvZxU8DL826iod4Fd14Dqlx+nhjIjgowQSH7J/YPB2TCnY9RU8cvVqQuy2/j2h6Th0Oa6++SdJd/mgPdh2LiOE8gEoSWNMavLZy+3QMfFcN3qBYu8Uj88OdPSYxOq6N4M/pZnY/8Lza7R4iH5hQsT6sGjUHtAPXfTDuthTFXn5HZrHUIJU246Ar5z4HNNYFioIzDpaqMGv8NhgwAUDNFYt7YGj2mmsL9wTHAZCTQ/zZpfynabUD2JwRMMz9vmbUDZsBxpvhNVO1cWEtUDOFA8c98LrILd6JU2ZV2K8DjMDPC2yxHahRtr0TmeFcsS58LXYZ6BbMyYLVDUnzARco1b6xfQHawQr0ckkuOEWTk9LWP8ADaf+203Xmx4hersaHWfh1TOv6wgFu0r695HRfTV1Jzp0man8X23X8l9c=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ebd4a25-100e-4258-5311-08d6cf28dccc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 18:06:12.6491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5984
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Vadim, Hi Corey,

Please find inline comments answering your questions.

-----Original Message-----
From: Vadim Pasternak=20
Sent: Tuesday, April 30, 2019 5:24 PM
To: Asmaa Mnebhi <Asmaa@mellanox.com>; minyard@acm.org; wsa@the-dreams.de; =
Michael Shych <michaelsh@mellanox.com>
Cc: Asmaa Mnebhi <Asmaa@mellanox.com>; linux-kernel@vger.kernel.org; linux-=
i2c@vger.kernel.org
Subject: RE: [PATCH v4 0/1] Add support for IPMB driver



> -----Original Message-----
> From: Asmaa Mnebhi <Asmaa@mellanox.com>
> Sent: Tuesday, April 30, 2019 8:59 PM
> To: minyard@acm.org; wsa@the-dreams.de; Vadim Pasternak=20
> <vadimp@mellanox.com>; Michael Shych <michaelsh@mellanox.com>
> Cc: Asmaa Mnebhi <Asmaa@mellanox.com>; linux-kernel@vger.kernel.org;=20
> linux-i2c@vger.kernel.org
> Subject: [PATCH v4 0/1] Add support for IPMB driver
>=20
> Thank you for your feedback Vadim. I have addressed your comments.

Hi Asmaa,

Thank you for your comments and added doc.

>=20
> 1) You are correct. This driver is not specific to Mellanox so I have=20
> removed the Mellanox attribute.
>=20
> 2) I have added a documentation file called IPMB.txt which explains=20
> how this module works and how it should be instantiated. It is very=20
> similar to the existing linux i2c-slave-eeprom module.
>=20
> The HW for my testing works as follows:
> A BMC is connected to a Satellite MC via I2C (I2C is equivalent to=20
> IPMB). The BMC initiates the IPMB requests and sends them via I2C.
> Obviously the BMC needs its own driver to do this which I haven't=20
> included in this code. We have no intent of upstreaming that at the momen=
t.

>> I believe you are going to do it at some point, right?
@Vadim Pasternak: I would.
@Corey: The ipmb-dev-int driver is not responsible for sending requests via=
 I2C (unlike for example the ipmi_ssif driver). It is only responsible for =
receiving those requests and passing them to a user space program. Once a r=
esponse is received from user space, it will forward that response back to =
the requester So in my testing for example, the source requester is the BMC=
, so I issue ipmitool commands from the BMC itself.

The driver that I have on my BMC (which I primarily designed for testing ip=
mb-dev-int) works hand in hand with the ipmi_msghandler and ipmi_devint to =
create the /dev/ipmi0 device file to enable the use of ipmitool program on =
the BMC. Once an ipmitool command is issued on the BMC,  the request messag=
e is sent to the Satellite MC. Once the BMC driver gets the response back f=
rom the Satellite MC, it will pass it to the ipmitool program which will di=
splay the output to the user.=20

Please note that this ipmb-dev-int driver does not need ipmi_msghandler nor=
 does it need ipmi_devintf to be loaded.

> This ipmb-dev-int driver is to be loaded and instantiated on the=20
> Satellite MC to be able to receive IPMB requests. These IPMB request=20
> messages will be picked up by a user space program such (in my case it=20
> is OpenIPMI) to handle the request and generate a response.
> The response will be then passed from the user program back to kernel spa=
ce.
> Then this driver would send that response back to the BMC.
>=20
> 3) You asked the following:
>=20
> "Is it expected to be zero in vaid case?"
> The 8 least significant bits of the sum is always expected to be 0 in=20
> the case where the checksum is valid. I have added a comment for clarific=
ations.


>=20
> "why do you need this cast?"
> buf[++ipmb_dev_p->msg_idx]=3D(u8)(client->addr<<1)
> This is because client->addr is of type unsigned short which is
> 2 bytes so it is safer to typecast it to u8 (u8* buf)

>>Better, if you can avoid cast.
>>Would compiler warn if you use for example rol16(client->addr, 1) & GENMA=
SK(7, 0); or something like it?
I thought it wouldn't be too much of an issue to use typecast here since ot=
her existing ipmi drivers use typecasting: bt-bmc.c, kcs_bmc_aspeed.c, kcs_=
bmc_npcm7xx.c all use (u8) typecasting.=20
But if you really think it is worth it, I could do that.
I just think it is not as straight forward to read this code as using a sim=
ple typecast. Some might wonder why a GENMASK is needed in this case.



>=20
> "It could be only single ipmb-dev within the system? Couldn't it be=20
> few, like master/slave for example?"
> My understanding of your question is that: what if we have multiple=20
> instances of ipmb-dev-int, that we register it under different addresses?
> This driver only works as a slave so it will only be instantiated once=20
> on the Satellite MC under one slave address.

>>I mentioned some config like:
>>BMC1 (master)  -- busA --|
>>			Satellite
>>BMC2 (standby)	-- busB --|=20

>>Since this is not Mellanox specific driver, maybe it would be good to sup=
port multiple instances of it.

I see, I understand now. That sounds good.
I added support to instantiate several ipmb devices for the purpose of havi=
ng multiple BMC masters for one Satellite MC. The design consists in naming=
 each instantiated device with the IPMBus/I2C bus number associated with it=
. For example, :
BMC1 -----I2C/IPMB bus 1 ----- Satellite MC (/dev/ipmb-1)
BMC2 -----I2C/IPMB bus 2 ----- Satellite MC (/dev/ipmb-2)

I added documentation for that as well.

>
> Asmaa Mnebhi (1):
>   Add support for IPMB driver
>=20
>  Documentation/IPMB.txt           |  53 ++++++
>  drivers/char/ipmi/Kconfig        |   8 +
>  drivers/char/ipmi/Makefile       |   1 +
>  drivers/char/ipmi/ipmb_dev_int.c | 381
> +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 443 insertions(+)
>  create mode 100644 Documentation/IPMB.txt  create mode 100644=20
> drivers/char/ipmi/ipmb_dev_int.c
>=20
> --
> 2.1.2

