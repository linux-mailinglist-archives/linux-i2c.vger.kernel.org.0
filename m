Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB2B677C832
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Aug 2023 08:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235301AbjHOG7H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Aug 2023 02:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235338AbjHOG6s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Aug 2023 02:58:48 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2099.outbound.protection.outlook.com [40.107.113.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DA210F0;
        Mon, 14 Aug 2023 23:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b49TTgEHpCs8mLtgwxBNil2lMqeRWejf32s3u8v+JO18gp6A69LqUmHbfStxnRJtx9Y/tzboK6gAHBsAnMU0Cg3LrznGKSPffx6OgozaZEs9TSnt1zA3XMLKk3J2dpP5WuutIsppVmcXNmpoKsckvWJGP0RL5qLraa8Qa2LxwWrYRp+rQIuLZxRGXzVGxinC99zDBWdnJp+iuqNDXbUlC+R1EObaTSRNPMZXGF2FhLZG7dpq/tp8KE/Eqxdv5gMLfINcGKJSR3z7r8V9/FJBssqI9IfbszploRgGB1wdtMUq1cW1WcV0qpThLd3KGLd5NLtqIEoq4t9x250RXa9ljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enIiOwoMPpZWCX1g0GVpGG6HkB8PTm/E7rUF5UZs/Ps=;
 b=K6wPVVyzYODC1DJ4BPi7FSKxMNTlHhv1XjxJkI07NQdZ1pD6BPG2P/s2PzjmZGskQsSfA1y0FokNHyo6FtAjrosdsYuFkvZJZDN61XABA8S7Y1Tumx6ImhzUtpL1bvQ3V6iSZntITm/5v42UyzGQtPCznoawq9MkUBV/K9QmP/y/usTl1ZPQaj0AV6KFmWDjdQOCU77u/h6rKLAx0WyXoMbOjIjzTyrzKXqsvlfuva/EPUtANsfr/z8Xd40WfV9+zTFfUtNGCwsEVZcZPHypjE3J1vNUBORTKuIXlLJIa7n7ClE2DQID1eueqdrXZXPhgDYO6tqw2khcKXqiunBuSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enIiOwoMPpZWCX1g0GVpGG6HkB8PTm/E7rUF5UZs/Ps=;
 b=NE7MJztov44dkfWU0Rbyh5Emu+0K3I9RhzYRALILL7IIOBeGoBn6KHuMHTaKeFnOh8lI/KiDzpbDUFDLAkY+mNfuYh1GYNxQkBAsa6jyGQx6fDjjrEH/1YRi3nU3M7xxyWoNyGl0IRdKH0xlICwfKgz3hqQPr05AakWHp6YadzU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8507.jpnprd01.prod.outlook.com (2603:1096:604:199::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 06:58:41 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%6]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 06:58:41 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Jonathan Cameron <jic23@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
Thread-Topic: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
Thread-Index: AQHZxu8xqdWpTKFxl0mrPmlP0GQCwa/b6UAAgAADvoCAAVlKAIABqeGAgABf2wCAAQcZAIAB6BqAgAED5pCAAGj8gIABdEDwgAASZ4CAAALG8IAFxH+AgAADBNA=
Date:   Tue, 15 Aug 2023 06:58:41 +0000
Message-ID: <OS0PR01MB592231608697B4FB0D142CCD8614A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230806142950.6c409600@jic23-huawei>
 <ZNEFjyAloqlkMWn7@smile.fi.intel.com> <ZNFV+C1HCIRJpbdC@google.com>
 <ZNIyrG/2h/PeS9Oz@smile.fi.intel.com> <20230809182551.7eca502e@jic23-huawei>
 <OS0PR01MB59221A1ADB67E96E9E39D0198613A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNT+NY99n7y3abwa@smile.fi.intel.com>
 <OS0PR01MB5922DD3C809B78F1E9C5949B8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNZF6cjx5N+ZsIJx@smile.fi.intel.com>
 <OS0PR01MB5922E09340CDCFF54A9A6CBA8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNsez3oWNcT72PGy@smile.fi.intel.com>
In-Reply-To: <ZNsez3oWNcT72PGy@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB8507:EE_
x-ms-office365-filtering-correlation-id: d447ebc4-f482-417e-3d1b-08db9d5d0ef3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7X7pJwzCDlkp3aS2lJnHx/t1M/bLlp3EB1b/sB1XS5V4dc+ysoNjOQRzo43A04JhE8eaIvOgBfU98JTbk7vOui/XqMwuxUIAx361mOVvVISbBao4pzkxcCPrEQAfXsnhNK3NfvPULIuKhpjVnCDrZxlKSQ5hboFQO1FwdxodlTU1H19wEaivKQhdIHtfSBMskEk8rK9Ep1LAVNQk17RtRLeYKQNk5J4UTu4fgDyK45RL62kIq24QQA+0i3EP0UnJT8tTzsd8EsPE6FnuMIyh2x/ZUoVUw045grr3HdlAae+ssOKxshfEa8SrJKC+ht0E2cDxcTu3OEm8g7iCnerzGw84BxOGIObAUYYDB/xqfF9ZcNc8kh8Mxjc5pkLHcWDoU9jKQimVehpPrifUCu9uDjkcIoa38/yNm46+3K4Lo4BZJMY21M6Wmsa3wEzDmW1T0DoYN5jDv9dpQghtjdjCY+wQBP+/u79NLTaYNuZMBLMum1AS9XF41T0FXDsBPn2981FqRdjfb7l1yJ37fUxpiz9Ou5n6L6ex3jE8X5IJI75v9oOcY58n590elMBc18fe10valwVjknbbxeMj4smWp1lrRfGKRA5+rT60rIc0pEl8SmxtuWMfH3Rp7uaCnBxb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(39860400002)(396003)(136003)(451199021)(1800799006)(186006)(2906002)(6506007)(26005)(55016003)(38100700002)(478600001)(38070700005)(41300700001)(52536014)(5660300002)(7696005)(8936002)(8676002)(71200400001)(33656002)(54906003)(86362001)(316002)(9686003)(66946007)(66446008)(66556008)(66476007)(64756008)(76116006)(4326008)(6916009)(122000001)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r9C3sXTKkO79yOmUBfYCpQ/4CLV2x7UfKMcdNCURiy7I3GNtKh0tjS/8OQke?=
 =?us-ascii?Q?ozUAT82zrxEo9JScFgA6Yo+8vLUUnEfDBcHRRN59BMtbeV3481riqcq0jWQP?=
 =?us-ascii?Q?LqovxMEOkfDjf3GcYX/GBOy8p4pXwAhvT4XEmoNZxNs32yz9fs87124Pifma?=
 =?us-ascii?Q?oy79W9Ifjl47+6iqlh2mocsk2zIoSAIfJS7ceDufh7e0PmLpdm+lnI2t7FhT?=
 =?us-ascii?Q?v13DsRXh9CXUxI2OJpy5u7bQ/7Y3SoZRwx665OvEs7bPsjMSVRCCmGFNFx6v?=
 =?us-ascii?Q?6+pYCZeptlvDIIFI1f6FGV0TnIlC7jp2mEDj4rx6L+nrDxUAYi84PTy05iqZ?=
 =?us-ascii?Q?Rnc7UIACYknuGZyxW90R5CEgwXWkfesPtsww6CiV9Zx8PBFh+GCvhtSJ2XAf?=
 =?us-ascii?Q?ScvN/JIsFDVBUXPsTgpYvWgGBx0qsq1urGuiv1b3OzV5Sy2EnMWWJrhG7ZIJ?=
 =?us-ascii?Q?l92DpVJmcsxJHyx2qXNMG2VhOGxBT0M4vwIxqVITQc8NnzJyqRF/oBp9bW+Z?=
 =?us-ascii?Q?l/7x/WCgVriTnNWU/2TGEOuiZ9ZVWhk5QZg4SVjnArUI93feLa9H2inpQ5ap?=
 =?us-ascii?Q?14MLSje05a0auvSlyTBf+rmrnRnUdOK5Db8f3cjYhR0jY0mgTKC6j47jD5Lw?=
 =?us-ascii?Q?50YARJXEJSglbxgPeeb7sBwstkhd1ZvuBkROZr+bksp1gOcowd5TnOKQfiy/?=
 =?us-ascii?Q?YUUnPldHSkGHpR0rPsIG6BDpRnEqjX1RloR+MVxu7TuKufAG6xZJ5eWX8JVT?=
 =?us-ascii?Q?f9NclPj8v7Vzx1dwLgefFBkkZvxnpRyfsl823NGwdwuo9/CIZvyScAGv9iel?=
 =?us-ascii?Q?Za1zHiGEdJDBjckB5u0wX38Ew3k+Kvee8+FgjhDaDEwtUnA5jRFQCLBJ7f2l?=
 =?us-ascii?Q?ncrhPGH0i42bUhXIx3bE3aiAmj0pFuIyga9aNvAT18GeNbV16VSv/TtatmBF?=
 =?us-ascii?Q?M8JuDueO5meLD5qbdZP6wfVUc/q0JecaS4ntv21Q1kvkbtDYWOij67m3Gock?=
 =?us-ascii?Q?uEXQlegOw7EeI0Zbg2rWz3YWXKTnQ9FGAu0T/XKuB2LnM5wGAK5/sdAIDsmt?=
 =?us-ascii?Q?nVamvuELYG2rb8gl1rSzLy52ozc9zg7DM+UHQfAdVIuDCiVxfbrUHp3nM8yH?=
 =?us-ascii?Q?y1NZiIPl9XYs6QVJcr4w28y9sY5lsttOssFdP7uGs9Wst/o4IShZmtIH9VKT?=
 =?us-ascii?Q?8TwPYhdYdXAhDIBoYhuIL/tARRoEFiY8/lyCz7gDYBvgH1VV7O6ymfnIbeMM?=
 =?us-ascii?Q?CLgLt18nd2mgKoSJk3xa89QBbtc6JgRJeymRefv0g1sI27bKRLOqY8Y90YxO?=
 =?us-ascii?Q?5biNavxYMy1mGx3VnZuPeoxUNWNyq9XV02gbhbQk+5LWqo7OEHCzcpCgM8Sw?=
 =?us-ascii?Q?gBK1Hcad5LMA8ALTXIwi5zmqCjDk9ybKXq4XXqFEaX7BsYeU1ucXJj2RK2Jc?=
 =?us-ascii?Q?wcIp6Uf0KrBVB44F+0r1YRnUvIQju6d+iUDriev9xk2X7YIkoTnOpI6DI/ll?=
 =?us-ascii?Q?jXdmZwadr6vUfKfma+MjhNIRiYX19MlS/cQNiKaFHseIC7CNB/H4N8QyKtAE?=
 =?us-ascii?Q?8hJ2xGd12/u8haDthEBMUrskE/Ycqrs0kr7rxyYE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d447ebc4-f482-417e-3d1b-08db9d5d0ef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 06:58:41.0936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Flyw+i9AGCzRYF9+3sndhbLm8f4NjbQpZf6w7sVE5eQnfqe3A4tn5fC0Htr0Q87dcpmT0TlWEauFSQe2Q80a/amF+2mX4/sjI1K+dy1YDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8507
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Hi Andy Shevchenko,

Thanks for the feedback.

> Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct
> bus_type
>=20
> On Fri, Aug 11, 2023 at 02:46:10PM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct
> > > bus_type On Fri, Aug 11, 2023 at 01:27:36PM +0000, Biju Das wrote:
> > > > > On Thu, Aug 10, 2023 at 09:05:10AM +0000, Biju Das wrote:
>=20
> ...
>=20
> > > > > I'm good with this approach, but make sure you checked the whole
> > > > > kernel source tree for a such.
> > > >
> > > > Checking against 16 is too short I guess??
> > > >
> > > > drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h has 18 enums.
> > >
> > > So, what does prevent us from moving that tables to use pointers?
> >
> > I think that will lead to ABI breakage(client->name vs id->name)
> >
> > 	match =3D device_get_match_data(&client->dev);
> > 	if (match) {
> > 		chip_type =3D (uintptr_t)match;
> > 		name =3D client->name;
> > 	} else if (id) {
> > 		chip_type =3D (enum inv_devices)
> > 			id->driver_data;
> > 		name =3D id->name;
> > 	} else {
> > 		return -ENOSYS;
> > 	}
>=20
>=20
> It's easy to work around (may be better fix can be found, haven't checked=
,
> just what first comes to my mind):
>=20
> 	match ...
> 	name =3D match->name;

The device_get_match_data()API returns matched data, so we cannot use that =
one here.

Maybe??

/* If enumerated via ID lookup, fix the ABI */
if (!dev_fwnode())
	name =3D id->name;

Cheers,
Biju

>=20
> 	/* If enumerated via firmware node, fix the ABI */
> 	if (dev_fwnode())
> 		client->name
>=20
> > > > /*device enum */
> > > > enum inv_devices {
> > > > 	INV_MPU6050,
> > > > 	INV_MPU6500,
> > > > 	INV_MPU6515,
> > > > 	INV_MPU6880,
> > > > 	INV_MPU6000,
> > > > 	INV_MPU9150,
> > > > 	INV_MPU9250,
> > > > 	INV_MPU9255,
> > > > 	INV_ICM20608,
> > > > 	INV_ICM20608D,
> > > > 	INV_ICM20609,
> > > > 	INV_ICM20689,
> > > > 	INV_ICM20600,
> > > > 	INV_ICM20602,
> > > > 	INV_ICM20690,
> > > > 	INV_IAM20680,
> > > > 	INV_NUM_PARTS
> > > > };
> > > >
> > > > The new helper function
> > >
> > > You mean for debugging? We don't need that in production.
> >
> > That is sample code for iterating through id table to find max enum
> > and check against ZERO_OR_NULL_PTR
>=20
> Much better with a coccinelle. You will find all or almost all occurrence=
s
> without too much effort done.
>=20
> > > I think what you need is a coccinelle script to find these.
> >
> > I need to explore using coccinelle script as I have n't tried before.
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

