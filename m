Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA717773A7
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Aug 2023 11:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233826AbjHJJFX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Aug 2023 05:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234555AbjHJJFV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Aug 2023 05:05:21 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2107.outbound.protection.outlook.com [40.107.113.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD8F2123;
        Thu, 10 Aug 2023 02:05:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmciIPOBkx/KVvKB1h19wuFaYe3DKtNFjUXJ/yOVR2w3p132wgntLgI6//DQOYQ/2Eryye/iPzUcw37EcPDliRah3dfzWyW0+34dv8eDF9HxFGHkfuqmHy6bJnM5WKehgFUkRLuZJiQhZrHefKWtXjBFVtJeINaEyllAChaukw1mm0cARynTvPHdUq3TYlxisisdq1w5JcFYa9Sk7uOibWPW0npAzu9Zens1CTxjfYP7GM0cVjx0nEwivBn/XtFOJpZ/IEeKvnlsHG6YSXGiDMrcO/gYDNGDZkAowcObMlRz1ZKAwu2nPf1O14nVCvG22Ls574qBtxoXbcYtPWOYZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLl+zSjBNaV70pG2UUTYnQ0g1nQhGJ0X7X0IlQpgyvw=;
 b=bj4N6ZK2f2g2C1Cs+rQGqqT8FTyZCEri+5DdmGYd8/P6bzzEshay3CGJl3saRqXAexgYjTvTvw5SQSnudsXFzLcwBwV5gs/LtgEVPO+oC/ASpmeFVeskJlGjPetRV16lm+cpGzEDvQQ6gxHSCMiw68GL0vO9rx97ZPN2NnJZAUk+c/IsBwxpLXGf4Shc4MxtOOjAIKwpMpROXGgcWiVz/qxuUxp/S3RpfhHNBf5klLj8ZYTa0F4xcF63lLUEacCNRwYmeSm+k8S6qiEiqUZujCMAIQZqEWKMBjoXEcDQ6kZo3d+zduckVa1dk/ShA/jfHG0fd1xFkk4C5nYD33SMSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLl+zSjBNaV70pG2UUTYnQ0g1nQhGJ0X7X0IlQpgyvw=;
 b=G1YTueZX2Fmr5VeKX7GQWE9EK3FMkhyXh20z0u8x4SFW9cANJGn3ZF8+QgfmbpwZbo8bxIekGlakoya1QwEhlosW/AkAp3ZzlPvbY8Zw+1h2yanEst2FsKCsauIF03X6t4SrBpggJksI4ac94ixmxdC8qAxe5AJp4xTNga6GnrA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8581.jpnprd01.prod.outlook.com (2603:1096:400:154::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 09:05:13 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f4c1:5f6e:abd1:2bf9]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f4c1:5f6e:abd1:2bf9%6]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 09:05:10 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jonathan Cameron <jic23@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
Thread-Index: AQHZxu8xqdWpTKFxl0mrPmlP0GQCwa/b6UAAgAADvoCAAVlKAIABqeGAgABf2wCAAQcZAIAB6BqAgAED5pA=
Date:   Thu, 10 Aug 2023 09:05:10 +0000
Message-ID: <OS0PR01MB59221A1ADB67E96E9E39D0198613A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
        <20230805174036.129ffbc2@jic23-huawei>
        <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
        <20230806142950.6c409600@jic23-huawei>  <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
        <ZNFV+C1HCIRJpbdC@google.com>   <ZNIyrG/2h/PeS9Oz@smile.fi.intel.com>
 <20230809182551.7eca502e@jic23-huawei>
In-Reply-To: <20230809182551.7eca502e@jic23-huawei>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8581:EE_
x-ms-office365-filtering-correlation-id: 4b13a60f-3b15-4624-1e67-08db9980e6c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uqXjEOEs3z+seNmsEVd4ssjoAUx6Zm3hiBH105DOef3Spc4iVdRlJnPB1RHLsN2TScOVEYHPsyrhyvypJN3M/kRiTHia7EAfUnomZYwC2BEEhrEfjACVhk0BguXSiZ148CI2oVnpGNY2r0Yc6Mg58OkFhJsjH8Jo0SpEGdpMA1pu29jU57OxO8ynOZETYRSEkEY6TqyKSNgMPjtHxN8z0DZWlH9gtQK+C5Eb/TYlyv3x/BPN034qmU3QRtqgf9jT118c0j7EAI6wHHzb/54QazrXh5TyhMnUP4tu5lgNErXbmfjNO9DRMwHJCv217qDF9usgMsLyR7T2KQjr0WFKwW+4aXMwiY5OR2WuQjOkdbiKrEU9Cx8wlAT4Qrvyrjf7T3mSvCtLXtSIq6k362zixLUdaBKYAC2J7RxkoI5sOtxJVEbWM/m9CEkx0AuOyGRNb0qe+FKBo+FEWV7tTic1hIwPp8AwpTHBxPFZ9k9dfwDRPbfhkxa90NoRW+mb5URrgRmzl5DMi0swBFCWjtBuKxSrN9+pXG7OoFdi3M4CLbNBot0IRWrEVB2lmIlSDbNvv6FzTLY5z4QZef4JaTLv1no1a+4FpZ19axhJKbqSDhTeJO3rgp1r8KedMjoqvyX7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(396003)(136003)(346002)(451199021)(1800799006)(186006)(86362001)(110136005)(33656002)(478600001)(71200400001)(26005)(66946007)(66476007)(54906003)(6506007)(76116006)(66446008)(64756008)(66556008)(4326008)(7696005)(9686003)(2906002)(41300700001)(316002)(7416002)(8936002)(8676002)(122000001)(5660300002)(52536014)(38100700002)(38070700005)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VtGB9u7GdXY5lapbfHoFGy88AsG8PFNgk/wF3FNsrLtQc0nfWQHkm5329VOY?=
 =?us-ascii?Q?uz4ZOso60Ytsi8FppruqwRw4SjPXlwGMmmCXzU4hwP90CVR7U3QhTXuZsRFa?=
 =?us-ascii?Q?tFgsZO0Kf9duI8piKiU/yTT4/+snKiKi3FDbua2PI6hJdRFZFOphOvYecHze?=
 =?us-ascii?Q?UIOHcAxDyUuqr2IjGtJ5AzJa+FoRmdZygQm5K+PrPZ9BmVj4/m4xZ6mt/ATo?=
 =?us-ascii?Q?sdwXFv+4Z5UpLcVc3TgXRH/7Ee3lQhgHl5Z/OOUpQ7ZUJEHqh4RsnTCmZnpV?=
 =?us-ascii?Q?E8dHYRtuo6qvKSYsESzDI74v1CK+aaYn743ILphc7DNBL4ZUn0rL2Tgc1lgM?=
 =?us-ascii?Q?Gd35/S9nl2Ocuw0SyIN5AJ1yRtWkHSX+/gNHY/7zPL/IG3N393z5znnlN+Rm?=
 =?us-ascii?Q?haf1OWea1xklWpyAjzEizDP6tiL0uXg5iqtj853kJohK0nhX8K17ZfJTjFvX?=
 =?us-ascii?Q?6Le9eDAd9fp9WbwQugWUA0kHcZWI8cwI2zzhS7sqMwlrqmQJxAN2/YRqsFoY?=
 =?us-ascii?Q?/V+J1GI0dRemS6Oml3YXCaUWUvGl0eJaoG6Ge5GReLhIZ/Ks4H+F0N5xWdTM?=
 =?us-ascii?Q?r9I+C8xjtfDJI/TTA9r/r9v7Yw/ba6ujbFfQ1wNhpR4eeQe+6DkoFXPerVmv?=
 =?us-ascii?Q?udav78M+U5HXV4KJv4OJYEdgwyvMitEIeyN1D8hSLkoQ5Nn95sFT9gcTisBx?=
 =?us-ascii?Q?dM0HUZYRfhIl94BJh7RrY8XA6G1rRBz42I03A4Tb8KM/oS4nvT1GqNzGyPHk?=
 =?us-ascii?Q?6YxOlZr2U7D5LD/i3+cssZR2QP9d1/261MdbysHd95G3nFOseBwD4uSdvfjF?=
 =?us-ascii?Q?MO1J+UJRYWnmymGcNe3U0KtnwHENTfhOeVlBAa6CNS8QGlLzmV3K+jeoK9Uf?=
 =?us-ascii?Q?4mywn7Qto+jt6UQ+dvieRNnxfvv+SVvzHvl1G9sqXntbuXSNSN8jWPmFt3l5?=
 =?us-ascii?Q?me5k7AukIhzZ3Fjojrh+jY99v/3iDYO3E4S8Qzj8H6fkjP/r5bvoPsLwHXa7?=
 =?us-ascii?Q?RczSV2ypDHbeaJPNNL0HhrRchQ2IGYz+ke+LfRP5v+KqK0G4lCrZ6BTuHD9R?=
 =?us-ascii?Q?+FeesYmff9CvFLTryPhThY2ud2DMFzRHLig7vshcw+DfjIUGFb3HEExDgp+i?=
 =?us-ascii?Q?mMd97bJS9gEF7vQvapRQIPsDg69Dz/X8VwakpgXSj9Td3zDj3O1uQ2OOh0fN?=
 =?us-ascii?Q?Ouw9G8dLPWpqkVP5xQCh8TauKtKxkG5XfnXKU5lrNXZbTqP3edSQ9HV0J+Wj?=
 =?us-ascii?Q?sVpsy9jdNLvHv7tfN6IYCILLvG4cr6gw5RRczaY2yFev0A/25Jxnn7DmYCV2?=
 =?us-ascii?Q?BGuYZUDnkhXBUqr6jyKwjCVDJB2Cyu0uIKVdUrZRlyonGqeLH/u5pBPHL+sl?=
 =?us-ascii?Q?VLKEWKyqSR3UjiS0ZRAxq33FHgqTxS6HvYhRhLMfl0uDrbh+N5KIhI1mW1we?=
 =?us-ascii?Q?FsHYz0AW/sMU5p3Ejh+wWmCD1xbjuFkZMGVWXH/g24r1w1ZZlf4lpVDsMOeZ?=
 =?us-ascii?Q?yPUuFXb3ouU8eNe3OQ4iisfQVB7C+xi4zrLbPGG1ijBoL/FgH068FbeqDGqG?=
 =?us-ascii?Q?l7KOGfMLCKefSeIQ3z/dw9ND2KnDmTzRjyML4HpG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b13a60f-3b15-4624-1e67-08db9980e6c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2023 09:05:10.9168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k48BC70e0nh2f30DUgoRA1lGPOBsnwMp1DQk+Cuqp6s9/8pbAOhw/zDut/pjKpTRK8v8EEcY2KEq2Y78PK7Ar6YhiybWevQMStHchbrTtII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8581
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

> Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct
> bus_type
>=20
> On Tue, 8 Aug 2023 15:18:52 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>=20
> > On Mon, Aug 07, 2023 at 01:37:12PM -0700, Dmitry Torokhov wrote:
> > > On Mon, Aug 07, 2023 at 05:54:07PM +0300, Andy Shevchenko wrote:
> > > > On Sun, Aug 06, 2023 at 02:29:50PM +0100, Jonathan Cameron wrote:
> > > > > On Sat, 5 Aug 2023 17:42:21 +0000 Biju Das
> > > > > <biju.das.jz@bp.renesas.com> wrote:
> > > > > > > On Fri,  4 Aug 2023 17:17:24 +0100 Biju Das
> > > > > > > <biju.das.jz@bp.renesas.com> wrote:
> >
> > ...
> >
> > > > > > + * Besides the fact that some drivers abuse the device ID
> > > > > > + driver_data type
> > > > > > + * and claim it to be integer, for the bus specific ID tables
> > > > > > + the driver_data
> > > > > > + * may be defined as kernel_ulong_t. For these tables 0 is a
> > > > > > + valid response,
> > > > > > + * but not for this function. It's recommended to convert
> > > > > > + those either to avoid
> > > > > > + * 0 or use a real pointer to the predefined driver data.
> > > >
> > > > > We still need to maintain consistency across the two tables,
> > > > > which is a stronger requirement than avoiding 0.
> > > >
> > > > True. Any suggestion how to amend the above comment? Because the
> > > > documentation makes sense on its own (may be split from the
> series?).
> > > >
> > > > > Some drivers already do that by forcing the enum used to start
> > > > > at 1 which doesn't solver the different data types issue.
> > > >
> > > > And some maintainers do not want to see non-enum values in i2c ID
> table.
> > > > *Shrug*.
> > >
> > > So in legacy ID lookup path we can safely assume that values below
> > > 4096 are scalars and return NULL from the new
> > > device_get_match_data(). This way current drivers using the values
> > > as indices or doing direct comparisons against them can continue
> > > doing manual look up and using them as they see fit. And we can
> convert the drivers at our leisure.
> >
> > It's a good idea, but I believe will be received as hack.
> > But why not to try? We indeed have an error pointers for the last page
> > and NULL (which is only up to 16 IIRC) and reserved space in the first
> > page. To be more robust I would check all enums that are being used in
> > I2C ID tables for maximum value and if that is less than 16, use
> > ZERO_OR_NULL_PTR() instead of custom stuff.
> >
> See iio/adc/max1363 example that has 37ish.
>=20
> Could tidy that one up first and hopefully not find any others that are i=
n
> subsystems not keen on the move away from enums.

If there is no objection, I can fix this using i2c_get_match_data() for iio=
/adc/max1363

and=20

device_match_data() will return ZERO_OR_NULL_PTR() if max enum ID in the ID=
 lookup table is less than 16.

and the drivers that use legacy ID's will fallback to ID lookup.

So that there won't be any regression.

Cheers,
Biju

