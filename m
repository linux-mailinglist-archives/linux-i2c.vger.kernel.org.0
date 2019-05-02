Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5136E12388
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2019 22:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbfEBUkL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 May 2019 16:40:11 -0400
Received: from mail-eopbgr50078.outbound.protection.outlook.com ([40.107.5.78]:2742
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726231AbfEBUkL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 May 2019 16:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2Ce54qPjkVW3KuC6NSWsGm67GRGUOrJJXkrsmW0r9A=;
 b=qLBqTHJswUiFLV+1yU2tusI53HhcWsJFHYZEJEIW1WQGV5sd0XhZx+9/pn1KisQxBmXZUkf352IefuHOOH7Er7ZzEtbIz43svesXiDbLBJ2+irAP0rBiIJvq1C5XZ1p8RB4OotMrneulW9HXP6Zo+B19YywLodX0+4d29i3Cooc=
Received: from VI1PR05MB6239.eurprd05.prod.outlook.com (20.178.124.30) by
 VI1PR05MB6031.eurprd05.prod.outlook.com (20.178.127.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Thu, 2 May 2019 20:40:06 +0000
Received: from VI1PR05MB6239.eurprd05.prod.outlook.com
 ([fe80::cd72:ad84:2379:1f55]) by VI1PR05MB6239.eurprd05.prod.outlook.com
 ([fe80::cd72:ad84:2379:1f55%2]) with mapi id 15.20.1856.008; Thu, 2 May 2019
 20:40:06 +0000
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     "minyard@acm.org" <minyard@acm.org>
CC:     Vadim Pasternak <vadimp@mellanox.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        Michael Shych <michaelsh@mellanox.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: RE: [PATCH v4 0/1] Add support for IPMB driver
Thread-Topic: [PATCH v4 0/1] Add support for IPMB driver
Thread-Index: AQHU/36JYRxgAz5nX0+eYBy40WDgaqZVNzOAgAEMmbCAAf2jAIAAAKaQ
Date:   Thu, 2 May 2019 20:40:06 +0000
Message-ID: <VI1PR05MB6239E3C9B9BBBA226DCFDD12DA340@VI1PR05MB6239.eurprd05.prod.outlook.com>
References: <cover.1556645340.git.Asmaa@mellanox.com>
 <AM6PR05MB5224FCACBD4EF55F3890EC6AA23A0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <VI1PR05MB62392EDC0FD3C960519C91ABDA340@VI1PR05MB6239.eurprd05.prod.outlook.com>
 <20190502194954.GJ6623@minyard.net>
In-Reply-To: <20190502194954.GJ6623@minyard.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Asmaa@mellanox.com; 
x-originating-ip: [216.156.69.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0530439a-58b4-483e-5e3b-08d6cf3e5ca0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:VI1PR05MB6031;
x-ms-traffictypediagnostic: VI1PR05MB6031:
x-microsoft-antispam-prvs: <VI1PR05MB6031A2A69BCF50D9FC84AA5DDA340@VI1PR05MB6031.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(366004)(346002)(136003)(376002)(39860400002)(199004)(189003)(13464003)(305945005)(256004)(66066001)(7736002)(8936002)(6436002)(81156014)(1730700003)(80792005)(81166006)(6116002)(316002)(3846002)(25786009)(54906003)(229853002)(6246003)(76116006)(73956011)(4326008)(99286004)(8676002)(2351001)(7696005)(33656002)(6916009)(14444005)(14454004)(68736007)(52536014)(66946007)(26005)(66446008)(64756008)(66556008)(66476007)(2501003)(55016002)(71190400001)(476003)(5660300002)(71200400001)(102836004)(86362001)(186003)(2906002)(486006)(74316002)(76176011)(446003)(5640700003)(53936002)(6506007)(53546011)(72206003)(11346002)(9686003)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB6031;H:VI1PR05MB6239.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xwyOFiBfbslTiuJqtgAo2Ew3BaSy6LC24/BXZ09Kk01gbwrvG4UHBEC4fLvJAjn6qzQaCuzpwwjICm0RwtMFhgXySZS51hY4DyD//6HKtV9uwYNstDdWFQ1KmUQdJIp6keN0L/0RdEBRj0c+OY7NSVYTYF8f1snkRGPaLxmNSAVKFg/KjtaOF3gMdh1BxWcrA4ek1mI8TAm4j+n+RMkzyjGcH7KRjm3ZrxnbrP+8jgNEs0aGb8wh/SGreNIT0jKi9rVdHTnOFaCgwMZetXIjGPo4893bDgwQH+vkt9+LwDsTUVA0VZpfJ/jgCKF3a3f+09YxmucT6Ce+HBLS+Tk9Cb97DU/Wpw/7F4oQBZOJdljocJ1Xu8XBhnj+uWVSOX+QcstBbzTGwYhql/mpm4QvxO4CY5zi9Hdv7qjzRrif3ZY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0530439a-58b4-483e-5e3b-08d6cf3e5ca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 20:40:06.7168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6031
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Corey,

Please see inline response.
-----Original Message-----
From: Corey Minyard <tcminyard@gmail.com> On Behalf Of Corey Minyard
Sent: Thursday, May 2, 2019 3:50 PM
To: Asmaa Mnebhi <Asmaa@mellanox.com>
Cc: Vadim Pasternak <vadimp@mellanox.com>; wsa@the-dreams.de; Michael Shych=
 <michaelsh@mellanox.com>; linux-kernel@vger.kernel.org; linux-i2c@vger.ker=
nel.org
Subject: Re: [PATCH v4 0/1] Add support for IPMB driver

On Thu, May 02, 2019 at 06:06:12PM +0000, Asmaa Mnebhi wrote:
> Hi Vadim, Hi Corey,
>=20
> Please find inline comments answering your questions.
>=20
> -----Original Message-----
> From: Vadim Pasternak
> Sent: Tuesday, April 30, 2019 5:24 PM
> To: Asmaa Mnebhi <Asmaa@mellanox.com>; minyard@acm.org;=20
> wsa@the-dreams.de; Michael Shych <michaelsh@mellanox.com>
> Cc: Asmaa Mnebhi <Asmaa@mellanox.com>; linux-kernel@vger.kernel.org;=20
> linux-i2c@vger.kernel.org
> Subject: RE: [PATCH v4 0/1] Add support for IPMB driver
>=20
>=20
>=20
> > -----Original Message-----
> > From: Asmaa Mnebhi <Asmaa@mellanox.com>
> > Sent: Tuesday, April 30, 2019 8:59 PM
> > To: minyard@acm.org; wsa@the-dreams.de; Vadim Pasternak=20
> > <vadimp@mellanox.com>; Michael Shych <michaelsh@mellanox.com>
> > Cc: Asmaa Mnebhi <Asmaa@mellanox.com>; linux-kernel@vger.kernel.org;=20
> > linux-i2c@vger.kernel.org
> > Subject: [PATCH v4 0/1] Add support for IPMB driver
> >=20
> > Thank you for your feedback Vadim. I have addressed your comments.
>=20
> Hi Asmaa,
>=20
> Thank you for your comments and added doc.
>=20
> >=20
> > 1) You are correct. This driver is not specific to Mellanox so I=20
> > have removed the Mellanox attribute.
> >=20
> > 2) I have added a documentation file called IPMB.txt which explains=20
> > how this module works and how it should be instantiated. It is very=20
> > similar to the existing linux i2c-slave-eeprom module.
> >=20
> > The HW for my testing works as follows:
> > A BMC is connected to a Satellite MC via I2C (I2C is equivalent to=20
> > IPMB). The BMC initiates the IPMB requests and sends them via I2C.
> > Obviously the BMC needs its own driver to do this which I haven't=20
> > included in this code. We have no intent of upstreaming that at the mom=
ent.
>=20
> >> I believe you are going to do it at some point, right?
> @Vadim Pasternak: I would.
> @Corey: The ipmb-dev-int driver is not responsible for sending requests v=
ia I2C (unlike for example the ipmi_ssif driver). It is only responsible fo=
r receiving those requests and passing them to a user space program. Once a=
 response is received from user space, it will forward that response back t=
o the requester So in my testing for example, the source requester is the B=
MC, so I issue ipmitool commands from the BMC itself.
>=20
> The driver that I have on my BMC (which I primarily designed for testing =
ipmb-dev-int) works hand in hand with the ipmi_msghandler and ipmi_devint t=
o create the /dev/ipmi0 device file to enable the use of ipmitool program o=
n the BMC. Once an ipmitool command is issued on the BMC,  the request mess=
age is sent to the Satellite MC. Once the BMC driver gets the response back=
 from the Satellite MC, it will pass it to the ipmitool program which will =
display the output to the user.=20
>=20
> Please note that this ipmb-dev-int driver does not need ipmi_msghandler n=
or does it need ipmi_devintf to be loaded.

Ah, I misunderstood.  I thought you were talking about the IPMB driver on t=
he BMC.  So what you have is something like:

    Host                   BMC              Sat MC
    ----                   ---              ------
                       ipmb-dev-int <----> ipmb-dev-int
    Linux IPMI drv <---> ipmi-host-int

I assume you can use the same ipmb-dev-int on the BMC and satellite MCs (as=
suming Linux runs on both).  You have another driver that runs on the BMC t=
hat talks to the host system through some sort of semi-custom interface, an=
d then another driver that's on the Linux host that sits under ipmi_msghand=
ler and provides the host access to that interface.

That's a separate issue, as you said.

-corey

Yes exactly! What you have described above is an IPMB bridged request from =
a host to the Satellite MC, the BMC playing the role of the controller. And=
 yes, in that case we can definitely use the ipmb-dev-int on the BMC as wel=
l to receive messages from the host and send the response back.=20
In my testing, I took a short cut and wrote a customized driver that I load=
 on the BMC, which allows me to issue ipmitool commands on the BMC itself a=
s opposed to from a host.

Thanks,
Asmaa

>=20
> > This ipmb-dev-int driver is to be loaded and instantiated on the=20
> > Satellite MC to be able to receive IPMB requests. These IPMB request=20
> > messages will be picked up by a user space program such (in my case=20
> > it is OpenIPMI) to handle the request and generate a response.
> > The response will be then passed from the user program back to kernel s=
pace.
> > Then this driver would send that response back to the BMC.
> >=20
> > 3) You asked the following:
> >=20
> > "Is it expected to be zero in vaid case?"
> > The 8 least significant bits of the sum is always expected to be 0=20
> > in the case where the checksum is valid. I have added a comment for cla=
rifications.
>=20
>=20
> >=20
> > "why do you need this cast?"
> > buf[++ipmb_dev_p->msg_idx]=3D(u8)(client->addr<<1)
> > This is because client->addr is of type unsigned short which is
> > 2 bytes so it is safer to typecast it to u8 (u8* buf)
>=20
> >>Better, if you can avoid cast.
> >>Would compiler warn if you use for example rol16(client->addr, 1) & GEN=
MASK(7, 0); or something like it?
> I thought it wouldn't be too much of an issue to use typecast here since =
other existing ipmi drivers use typecasting: bt-bmc.c, kcs_bmc_aspeed.c, kc=
s_bmc_npcm7xx.c all use (u8) typecasting.=20
> But if you really think it is worth it, I could do that.
> I just think it is not as straight forward to read this code as using a s=
imple typecast. Some might wonder why a GENMASK is needed in this case.
>=20
>=20
>=20
> >=20
> > "It could be only single ipmb-dev within the system? Couldn't it be=20
> > few, like master/slave for example?"
> > My understanding of your question is that: what if we have multiple=20
> > instances of ipmb-dev-int, that we register it under different addresse=
s?
> > This driver only works as a slave so it will only be instantiated=20
> > once on the Satellite MC under one slave address.
>=20
> >>I mentioned some config like:
> >>BMC1 (master)  -- busA --|
> >>			Satellite
> >>BMC2 (standby)	-- busB --|=20
>=20
> >>Since this is not Mellanox specific driver, maybe it would be good to s=
upport multiple instances of it.
>=20
> I see, I understand now. That sounds good.
> I added support to instantiate several ipmb devices for the purpose of ha=
ving multiple BMC masters for one Satellite MC. The design consists in nami=
ng each instantiated device with the IPMBus/I2C bus number associated with =
it. For example, :
> BMC1 -----I2C/IPMB bus 1 ----- Satellite MC (/dev/ipmb-1)
> BMC2 -----I2C/IPMB bus 2 ----- Satellite MC (/dev/ipmb-2)
>=20
> I added documentation for that as well.
>=20
> >
> > Asmaa Mnebhi (1):
> >   Add support for IPMB driver
> >=20
> >  Documentation/IPMB.txt           |  53 ++++++
> >  drivers/char/ipmi/Kconfig        |   8 +
> >  drivers/char/ipmi/Makefile       |   1 +
> >  drivers/char/ipmi/ipmb_dev_int.c | 381
> > +++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 443 insertions(+)
> >  create mode 100644 Documentation/IPMB.txt  create mode 100644=20
> > drivers/char/ipmi/ipmb_dev_int.c
> >=20
> > --
> > 2.1.2
>=20
