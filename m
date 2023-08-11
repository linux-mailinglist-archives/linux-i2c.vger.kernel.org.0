Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4062779222
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Aug 2023 16:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233314AbjHKOqQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Aug 2023 10:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjHKOqQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Aug 2023 10:46:16 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2099.outbound.protection.outlook.com [40.107.113.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A74E2702;
        Fri, 11 Aug 2023 07:46:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbm99udhlYFQ/JXWkpB7sJqZK4zfTYBgsE+d/yRikkpcHE9A7epWebEliDw8U0Ft6jEHlpR/F9Ns1HeNzK0pXh6qwwlOv+KLSbAgVV3qI4W418wZE3lDXMtI5ibt/PxzJv7NtOwZWkHYo2UefVvMFaUGW4z9t3WTe74ZzvmBoiRaUXH/MXih9fQCk/GgWTPOUB5n0pexnkpXmfHv2MvegnRYQAY6HVKFcNbVE4oF42dGYsNgJ1shfB4/Z60sY3voN3XTAkAeiBwKRBPlKVbjqz5ILPfWyrP6CGXvZ76EjUo2N6PZoV+uWHDJSu0PFr94QwbP19ftXmBRURl1OeRwdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uml59PKaLPRzvN/WhPHPPXUxRsGryNbNvRe2zz7fk8c=;
 b=UsdWF0opJfWtsAo6hUXX/OnKkmImDOH5Tt03nEvYwrwZ8nRneZmTAPAIc/Qz8VrHNPqH3Oy0evAT7+XW4EItka9FdZt02h0zBohBEPDf9Wj9O8bKLPI3R12bJl2ipphf5RbKYRiliJBUrSAyGAFC5ziP7G0Nhi90ZgpChpdu/smUuJJ0rq9zLdSH9tRaK6RBHymOd6nVZQ14U4lj3TaYf6sE+j6cjKUn1nrAHFr50Rhz26LzGdEw+2IRmWxP01nXSArKx+lSAzk32LxSklgQHWDV3D9ezZ5N4EnUTb3iiW+fYZ0pbHZNz/2qhuSPxoDlJ+J1YsVvmXzTwhhnvNc2wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uml59PKaLPRzvN/WhPHPPXUxRsGryNbNvRe2zz7fk8c=;
 b=kemM0u5n3MHf0vIEN02Re1Y6e2QsSGWgI/cKcTDb/KLHq7xiQDmUabksgibfHl6VdGrdDMbv/Wczc1/s0QYdTei4QyJHXnLYbuwGAhiZwZuKt8n7K2Z+rQ8qfDlKT2tQPekkZTn8MF0zEZAegxlcpopS9irp41bkHo9zhkoY3qA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10329.jpnprd01.prod.outlook.com (2603:1096:400:249::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 14:46:11 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f4c1:5f6e:abd1:2bf9]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f4c1:5f6e:abd1:2bf9%6]) with mapi id 15.20.6652.031; Fri, 11 Aug 2023
 14:46:10 +0000
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
Thread-Index: AQHZxu8xqdWpTKFxl0mrPmlP0GQCwa/b6UAAgAADvoCAAVlKAIABqeGAgABf2wCAAQcZAIAB6BqAgAED5pCAAGj8gIABdEDwgAASZ4CAAALG8A==
Date:   Fri, 11 Aug 2023 14:46:10 +0000
Message-ID: <OS0PR01MB5922E09340CDCFF54A9A6CBA8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230805174036.129ffbc2@jic23-huawei>
 <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230806142950.6c409600@jic23-huawei> <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
 <ZNFV+C1HCIRJpbdC@google.com> <ZNIyrG/2h/PeS9Oz@smile.fi.intel.com>
 <20230809182551.7eca502e@jic23-huawei>
 <OS0PR01MB59221A1ADB67E96E9E39D0198613A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNT+NY99n7y3abwa@smile.fi.intel.com>
 <OS0PR01MB5922DD3C809B78F1E9C5949B8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNZF6cjx5N+ZsIJx@smile.fi.intel.com>
In-Reply-To: <ZNZF6cjx5N+ZsIJx@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10329:EE_
x-ms-office365-filtering-correlation-id: f3af2495-c026-45c3-2c93-08db9a79b437
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9sDqKlHu77O2VDdcBqNDQv9ny7Fs7JxTDahZdwQAK4jCtt9Oytg8qTPPIt3Vklroy4HnfbPTifN3l5aumdSaXat5H98yzr5Eeq3L3gnrA1QubkH8MOyd48MOCHHG+S4uAl8H+8BLdd8U5hwKWIrSAri1Mzq0ew8rs/2rZ2H8KoR2St3I+phz4Ej45teWF0FJgIHDIYUtsIVO4XXwJ+gISWG6iMPdglkd4yUHm3spfnPCF+YjTRvuZEZ6auO++QMQdK1Q6ywP8kukzQJPZf27yZqlrXUl3O6BRyuax862YGMATRRDNpDOCcHL0F1JZW5hKpkD8I11ejgKuuZ7xlb7vg51UsDKWpEoYEIcHuSdz2fv1yRK2WfqLOLkD+kZxXyk0iKH2fuJcE9cCFTJEPT3HYi1oR92v99qU03gSOF4AOww41czconuPRugOF2d7fjhvWoM/55mVQ25INVqKnaDQLc1CsozQaXjGxpKRe0iOPvsnj+Tb+5o2x9RQ+T3y/S0zi+qFh8WTCRDZRe9Zqtr9WXtRSqLiIw5Edm4LYnXkjkLWqOnqMX/Z2mu5Vc/UfSMH3hK8eKjYmBHMjx7MvQ9U1kEwE0osUpDEK5XrG7pmzB/ukXf9zcRPMxaW8yqjJjx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199021)(1800799006)(186006)(38100700002)(26005)(6506007)(7696005)(9686003)(86362001)(33656002)(8936002)(38070700005)(122000001)(55016003)(2906002)(41300700001)(54906003)(8676002)(7416002)(76116006)(6916009)(66446008)(66946007)(66556008)(64756008)(5660300002)(66476007)(52536014)(4326008)(316002)(71200400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W5h1KB3ibIivw+pSRT0RpaxEgGNf9QDLg9GOo1qcaH2KAoik3iuuPGm8NvXk?=
 =?us-ascii?Q?R+7J8azHxSfuiLGsE0w6h1gl/owUkyZpcNOQgd/kGeMPAe+oURd4OaSpPrpL?=
 =?us-ascii?Q?vO0ZyVJOxpSRKngSPIiOc6vQRM3PWSlJIvtWkGWSRTzmOVcejSNomU6lwLG9?=
 =?us-ascii?Q?x9CjuB/gomkQ/N1K/UbGgJz0jlK4Sl1NY7IxABxAF3FJiLnodK0jxXJnzvRS?=
 =?us-ascii?Q?Deix5+XKjiN4gqDB/sqVCd4YMLvd8PAW22miXQw9n+7zHwVT+3j7p8NbjPAM?=
 =?us-ascii?Q?i9GI27OX6i61OxAOtfrL3brouJOU4PDyuJZN+OjQH80S9/XKBFSATfe5OBO6?=
 =?us-ascii?Q?Gs+LpkHbwP0qSRvjbGCDV7iNjscTr5K6ARzuMcVGYv+JKkMGXdRW8MM6ctZb?=
 =?us-ascii?Q?m9kPfHQk4nY2JSxkQ9upk/VDGrFjoonF7wGg+IWyyqDv0/7Q2cwBq3RzpJDJ?=
 =?us-ascii?Q?0hr+iZuAWBt/LR6fhDPcs9302pBrxKmoVe1cUJ6/UAi5taN6x9vNd1jGVVjs?=
 =?us-ascii?Q?TUUKCsdaNudEV2g1FsIkRnCWwYH1c0wu9m9qybeu/Lx1srKnYcadPoqsI1H6?=
 =?us-ascii?Q?bTwKu0jEGzm31k7wM4/xoePsFMblMOfrBXbiveavFO3f1SHnlVY6g+SedgzC?=
 =?us-ascii?Q?LiPovwY57gfEODMrw0Zfi3k/DFhtt9IUdeR7L720sO6oORUFPyp7KEiot7Sb?=
 =?us-ascii?Q?pq7WOhMHtyDiXHWZ3AtBNv8aogrVbAZCtZMY1LXiCL9V3WFpi+xf9d6l4tYp?=
 =?us-ascii?Q?WLwWqDRy+lq5YeBsKo9try+IbLcyBn5C2ixmgGFipw2K0//a4/EsvA66vTf1?=
 =?us-ascii?Q?0Vop80pmmSHpHxnFruhHA37PedIVFi8F7Akh1WKq8rH8PNABrPcsJJV0k21F?=
 =?us-ascii?Q?w+nBQpxjHVFnNEsqAPM5hpqYiGpZOUiTZyI7yfpXb7+h1quVBm2SulOMdEgX?=
 =?us-ascii?Q?tvV19bsafcqM+pTW5HyjLarqbk66sOC+N6BBS95Eks6NxtwvGW0WhkOYK4zM?=
 =?us-ascii?Q?pZq+UYOvQSIblPQFxl9/F3OQOT1cp+COs7d2WgkXeNz+olLxdgcMVP1TBApo?=
 =?us-ascii?Q?/3JHPCt44dwG2XDopKnCjSEr3EAPBMj+c/GtgK+7F9xzoJO48IBVdZWLD/Qy?=
 =?us-ascii?Q?j06ZgDhkkFmIOzoIgmFolOhbnc1suNM6qQEgQdO16vRWgDZYMfUjxWqAjvVB?=
 =?us-ascii?Q?WwfMRLDz9zTLYfIAEzg6kcno9ayIr3Jxyz8cPBG6583uVMyt/kXQBK+JwYwA?=
 =?us-ascii?Q?8zbG7zaLJBAWZQby2ozfjRtTByxrLwmk9n7F4q6i+AN+43zoIPew6+1bd+uM?=
 =?us-ascii?Q?EhYIhX7A2h38NwMfbIuJIF4uz6QR95lfvAdpgYZuzUsqfNUhthMx2OCYvhJL?=
 =?us-ascii?Q?sybhBTKEfrZiIWNfCG68CQdSBgb/lF4luVyGeP1V8aBuhXXhhALtpNMMFJw6?=
 =?us-ascii?Q?QawDK5z/D2NMeqUqOTyiVTs4/4nxJBZwN1s6wFKc3YlV4f/1c5fd97PTLukr?=
 =?us-ascii?Q?VrIOg2cuMB8mnewTIDiPqtSQ5NQaXNsfTzdAnrtVuVWHzvztSX6BAOXn1b7y?=
 =?us-ascii?Q?KK4ZHOwaI5X5dtDIT2xsn+SSIUlQk4he0wLbb1pi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3af2495-c026-45c3-2c93-08db9a79b437
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2023 14:46:10.7998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tcNdqSp+YERQC/pINPaolCII+OcU4l7TXHbt9E3MINLK3w6hGVBRIQpynlgIgM/JVz62XAhmyIcO3oe+zz6OoFHsAoe3sujH7BhiZcLwj88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10329
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

> Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct
> bus_type
>=20
> On Fri, Aug 11, 2023 at 01:27:36PM +0000, Biju Das wrote:
> > > On Thu, Aug 10, 2023 at 09:05:10AM +0000, Biju Das wrote:
>=20
> ...
>=20
> > > I'm good with this approach, but make sure you checked the whole
> > > kernel source tree for a such.
> >
> > Checking against 16 is too short I guess??
> >
> > drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h has 18 enums.
>=20
> So, what does prevent us from moving that tables to use pointers?

I think that will lead to ABI breakage(client->name vs id->name)

	match =3D device_get_match_data(&client->dev);
	if (match) {
		chip_type =3D (uintptr_t)match;
		name =3D client->name;
	} else if (id) {
		chip_type =3D (enum inv_devices)
			id->driver_data;
		name =3D id->name;
	} else {
		return -ENOSYS;
	}

>=20
> > /*device enum */
> > enum inv_devices {
> > 	INV_MPU6050,
> > 	INV_MPU6500,
> > 	INV_MPU6515,
> > 	INV_MPU6880,
> > 	INV_MPU6000,
> > 	INV_MPU9150,
> > 	INV_MPU9250,
> > 	INV_MPU9255,
> > 	INV_ICM20608,
> > 	INV_ICM20608D,
> > 	INV_ICM20609,
> > 	INV_ICM20689,
> > 	INV_ICM20600,
> > 	INV_ICM20602,
> > 	INV_ICM20690,
> > 	INV_IAM20680,
> > 	INV_NUM_PARTS
> > };
> >
> > The new helper function
>=20
> You mean for debugging? We don't need that in production.

That is sample code for iterating through id table to find max enum
and check against ZERO_OR_NULL_PTR

>=20
> I think what you need is a coccinelle script to find these.

I need to explore using coccinelle script as I have n't tried before.

Cheers,
Biju=20

