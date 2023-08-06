Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BCBF77160B
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Aug 2023 18:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbjHFQ1e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Aug 2023 12:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjHFQ1e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Aug 2023 12:27:34 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2092.outbound.protection.outlook.com [40.107.113.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDCD113;
        Sun,  6 Aug 2023 09:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aL5ryWxrr3oP+tMcwhktodzseHdQH4YJnwJXHFBjV/CB1WOCQqM5W14phpb1oeNEjtHJdUiNLyA/pcLo6/P8uVLfe54483Cx4V5LkBRLljmdURVQbFLtIZ0OJ3ny6rje7uG1U+6mVr9EUg8cc6TOFHrBT0ApVdRWwBahUQurnV1kNj80uVbNmR5ERnihv0Eiw3c7vsFM2yamqW9wX+sCx45xxPBzSdPDrFFx++qjRdDhqatLnIZL2+W38CDP7vDYDfq6J/Hncif30fKOtUwF1bAmOue0Z2LrMYhqAaYiARS8lp3apj3RgS76kFgxBeUb1VmgND0MmHMfHWZspXld+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Io27IInJORWOSQvjQzYMdLE6WerY8+akoMkEU9MBodM=;
 b=j/hUmoUJKKZKS8oAmM5CGIiKRxWzk4uTp6C3aa3pLVUX0E13cu9wt1ObC8qUCJ7P6DXIXrJ7wPmR6bH8/EDj+TykO47cFQSjdCyFYAdr21uDwTySEfiaNYwyCQW5cT9v2j82L9XqRGAeuKfxd1LuNSJ7uzTEXh8clLHhFSOjCxomrZwY7AhdaUlGwLSUFap2pOvt3uFjQ9EfrJUSwChiu7JbcYnlfbH2yrQKi7Jj/cKRjveCfQxMM6oongc+9Bfu7114lDDSDxWWHTc8AVnhufrik7LY31TarK1x9MDjdLyPsCPXwxMOWP3KURlnAqbX0IeX1oq9IjS3GBLSuDVp+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Io27IInJORWOSQvjQzYMdLE6WerY8+akoMkEU9MBodM=;
 b=sdsdk6sBY1R0OhVLjy0rQqEnd+yjgjBeYxBUTWWyM9ex3osHWbVyyhoyCv8hXDmoC0mSoRZHvybSNaMRZfOBi42FC20GFhQvApwQ9TBac4XLDyp2ZjDlbEWW05DU7z6amv4/57vsGTASvpheOO37RrakThYenhjpm/0a338PtUY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB8329.jpnprd01.prod.outlook.com (2603:1096:400:165::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Sun, 6 Aug
 2023 16:27:26 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f4c1:5f6e:abd1:2bf9]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f4c1:5f6e:abd1:2bf9%6]) with mapi id 15.20.6652.026; Sun, 6 Aug 2023
 16:27:23 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jonathan Cameron <jic23@kernel.org>
CC:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
Thread-Topic: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
Thread-Index: AQHZxu8xqdWpTKFxl0mrPmlP0GQCwa/b6UAAgAADvoCAAVlKAIAAKnvg
Date:   Sun, 6 Aug 2023 16:27:23 +0000
Message-ID: <OS0PR01MB59221F2A65AFEF6DFFECFBF4860FA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
        <20230805174036.129ffbc2@jic23-huawei>
        <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230806142950.6c409600@jic23-huawei>
In-Reply-To: <20230806142950.6c409600@jic23-huawei>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB8329:EE_
x-ms-office365-filtering-correlation-id: 28e89540-2654-4a3b-be4c-08db969a038e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bZpIytL+X87FGkW2+UOQAm2l0RkPYqkObOa7isAzcCowlnvlVnSopZBTLQr3bhsS3J3EODsXcpsxE4c7Lp/JXNeJpluVGhFo8SY72iLn1uWqAMr5OANaaQfg7SMK2arxjXPOeisf0afIsFSxsLo3Xu848ckMVxys58NghvrMi7On+h3aVlvH0Ba3y0Lk5rJIhq1e7zAnTUaguza4aRBP0Fc681iI5U4RpRVhpW9kFTcEpdBbDFtjtqqhKY+a7RBSrsNMSCXWFHQ0k6unDnufAzpjByziH6sl/U4+yAV4xkTNjf49P2FwKWApV2P9PlYL+SnGI8sXyRNVMHs0kqGIqd0bscfO8fZtjtQmUBgJM6oBnJDd1UashOP00c5Ebg4fh0V/1xJKoYedtg0tzShsQadweLtvwnn28J6i9oaMjXEdyt3Q1ZTP0+cblI6l+FKdG8wVNThmK98HdOw1DisnqST9SenjEPHdzlKsUqvwhyLJl5QuTzl1Qr5jsyVMKSHZnZST25NaulCplsJngWJ+UiCbhmlSy9R/AAYuSKF24i12YD/VXKykiXWIsgR1s+YmTgFvMGfkSjkRPCrUj1CImtlgt0xuEaEUM0Nvym9Ks30=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199021)(186006)(1800799003)(83380400001)(55016003)(71200400001)(54906003)(4326008)(6916009)(2906002)(38100700002)(5660300002)(316002)(7416002)(38070700005)(52536014)(8936002)(8676002)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(33656002)(478600001)(966005)(86362001)(9686003)(122000001)(7696005)(41300700001)(6506007)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8aBNNSW+N+A3loMUwFvOsQOOUg/GujX36x+tvUV9sl+FDjuYMok9FxycTDfz?=
 =?us-ascii?Q?Ji4OAOyiMny6KO/F4sdeD2jcG86Q0AVi5ik9E5ujJNTB6x8bLEAou8hDCXNj?=
 =?us-ascii?Q?TRLuLx/al/nD1tP4Bz6jzgd+LWCHRd4qrmmebqJrNq8RtfEakf8KQpPq6SGT?=
 =?us-ascii?Q?J+B+YrFDJ6DIxYMatpe/szbO/IZHQP98EGYQbeW9zG9AmGcZIdYlDScypxKL?=
 =?us-ascii?Q?YB4P0oG4DSvugwYYd7t+tzj+IUejJIBmuLCzvGPPuj3xlvZG2LywV9j9Gcpp?=
 =?us-ascii?Q?JhewHzhTtWVc9ZVcbsHxBW7qm3nVA7yA9K7IKR2q4J4kBcL+t+dvL1uKToiM?=
 =?us-ascii?Q?0HrIee2dJutDG2XHjpsQM/aMm3mSmuCHpPG7eTokYt7Y6oo/rEBPt5O0uEQQ?=
 =?us-ascii?Q?xFCdiWfA39V0gtPuKy8eQ5PXuJmz643b9LzysEWvJbNnvXZxD+9xz6i2CSl6?=
 =?us-ascii?Q?pDi4lKudOSxwyuI+ODVRbjPwnEnbNzV/lOhpqPx5KZ1QsOGRK262YJjl1wPx?=
 =?us-ascii?Q?yxZ8k+bHrDl1+a8kxad7D69WcZSmkFklOeb1G8N/bxu09PazyrZy5mcb28H2?=
 =?us-ascii?Q?dGYql54XBUy/woEDiJKRa/eHOOWLz3F2m8wu6t6AOWMzJfCGKmLX81EKslVy?=
 =?us-ascii?Q?IRLkKrvce2U90L4IjP+vAD8HwxPL7xoJ6V08Ihu8wYdoG7ic+OdZ7TMANV8U?=
 =?us-ascii?Q?Tt/YPa0HpLFAMIjdNr+AA+VOFo5ffb9BZgxhGeFR+oMBGDbgmLUx5SHpsyNF?=
 =?us-ascii?Q?ZwY3SKq03pF+EFPr0S9AYdXxvngW6RnHOjx13GfoMMdeVAfyEKSc/RlUe28z?=
 =?us-ascii?Q?DE9z2LZrlSsrFZpnfzj31ZKhtxiqgkSHK0p+HKx0+l5RlIB8nRUVbou3DVeI?=
 =?us-ascii?Q?s/4mxSV1Bmcoa2Svz8Hq3RbDt0uix966DjpRPSCX79SrnQsUiHr+s+86MZSv?=
 =?us-ascii?Q?r/a81bsmXZYytMIig4wqqUJz8WbWzTJCv4MS85/DNIzq4JbtS8f+rloFziH3?=
 =?us-ascii?Q?yqetJv7EPJGfrU/QZlxKq0+iQFKt0T+14pjADPnZ3P9BG4Wi/uIKGz72ybXj?=
 =?us-ascii?Q?Ia6VGTux/KiT6w+mSGaky8+v6QARl9woqzavB5NUoDtb0kU6znINXu+WGMA+?=
 =?us-ascii?Q?napE5FBtthDmcQolv/rXN2LKg6vb37NwYxkbdV4Of3HMRyXN0oZIe3AWqm2U?=
 =?us-ascii?Q?AlEljYxzZHgzzT+Idqz5MpHRZkqIIqaCIgt7RJbCbJiKPrr/63NTgbIASdcv?=
 =?us-ascii?Q?gNkE6nhXRqDQY6DLJVix67x9lON4HzsDMr299laet6LW86NHy/j/bbBNfYKT?=
 =?us-ascii?Q?ncSMIrvKr1xiJCcNiI2G63ItfvoQtlpigUdZx8jl1bn8BhYNhzJybtJpaLGv?=
 =?us-ascii?Q?YuQzy284Yx1Dzbf3yPeiWmjLNJZIQe/MDoxRopFenMR+5cWMFD61Jvl8w7EC?=
 =?us-ascii?Q?M/S87Yy8ZHM4yR5td62m7L/bPNQdQFj+q+AHCn80FUvXCYHA4QZoL2FkzA8M?=
 =?us-ascii?Q?zH0caaALWaj5WkD5LH/Gofa5szyzF6nebQ8JZH+yjL5dY9xF7SmT+cUPri+F?=
 =?us-ascii?Q?Jiea6FBD4BGN4FXcfTuNiP7vIG1h9ExPWqwaKRX0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e89540-2654-4a3b-be4c-08db969a038e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2023 16:27:23.1342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PX5nvF1m9XIaDU/V/VguI5ZnFyk4SUcKRiW4yDKpazkIwMD7pFXvIZDRe5P9K19H+jQmDHBZjK5k8TYTq12MfeiFya/ZGlam+dWEaXmmYjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8329
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jonathan Cameron,

Thanks for the feedback.

> Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct
> bus_type
>=20
> On Sat, 5 Aug 2023 17:42:21 +0000
> Biju Das <biju.das.jz@bp.renesas.com> wrote:
> >
> > > Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct
> > > bus_type
> > >
> > > On Fri,  4 Aug 2023 17:17:24 +0100
> > > Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > >
> > > > This patch series extend device_get_match_data() to struct
> > > > bus_type, so that buses like I2C can get matched data.
> > > >
> > > > There is a plan to replace
> > > > i2c_get_match_data()->device_get_match_data()
> > > > later, once this patch hits mainline as it is redundant.
> > >
> > > Are we sure we don't have any instances left of the pattern that
> > > used to be common (typically for drivers where dt tables were added
> > > later) of
> > >
> > > 	chip_info =3D device_get_match_data();
> > > 	if (!chip_info) {
> > > 		chip_info =3D arrayofchipinfo[id->driver_data];
> > > 	}
> > >
> > > Looks like the first driver I checked, iio/adc/max1363.c does this
> > > still and will I think break with this series.
> > >
> > > Or am I missing some reason this isn't a problem?
> >
> > Good catch, this will break.
> > we need to make I2C table like OF/ACPI tables.
> >
> > Yes, before adding callback support to i2c_device_get_match_data(), We
> > need to make similar table for OF/ACPI/I2C for all i2c drivers that
> > use device_get_match_data()or of_get_device_match_data().
>=20
> To throw another option out there, could we make the I2C subsystem use th=
e
> of_device_id table in place of the i2c_device_id table?

+ device tree

Not sure that require bindings to be updated as we are replacing name->comp=
atible, and I guess 'check patch' will complain undocumented compatible as =
all the names in 'i2c_device_id' are not mapped to compatible in 'of_device=
_id'. for eg: drivers/rtc/ rtc-isl1208.c[1]??

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/dr=
ivers/rtc/rtc-isl1208.c?h=3Dnext-20230804#n111

Cheers,
Biju

> That is perform matches based only on the of_device_id table in all
> drivers (with some glue code making that work for the less common paths,
> remaining board files etc). The ACPI PRP0001 magic is doing similar
> already.
>=20
> I can't immediately see why that wouldn't work other than being a bit of =
a
> large job to implement in all drivers.
>=20
> Getting rid of the duplication would be good.  Probably some rough corner=
s
> to make it possible to do this in a gradual process. In particular some o=
f
> the naming used for i2c_device_id table entries won't be 'valid'
> DT compatibles (minus the vendor id)
>=20
> >
> > May be first intermediate step is to use i2c_get_match_data() For such
> > table conversion. Once all table conversion is done then we can add
> > i2c_device_get_match_data() callback.
> >
> > The below one is the recommendation from Andy.
> >
> > + * Besides the fact that some drivers abuse the device ID driver_data
> > + type
> > + * and claim it to be integer, for the bus specific ID tables the
> > + driver_data
> > + * may be defined as kernel_ulong_t. For these tables 0 is a valid
> > + response,
> > + * but not for this function. It's recommended to convert those
> > + either to avoid
> > + * 0 or use a real pointer to the predefined driver data.
> > + */
>=20
> We still need to maintain consistency across the two tables, which is a
> stronger requirement than avoiding 0.  Some drivers already do that by
> forcing the enum used to start at 1 which doesn't solver the different
> data types issue.
>=20
> Jonathan
>=20
> >
> > >
> > > Clearly this only matters if we get to the bus callback, but
> > > enabling that is the whole point of this series.  Hence I think a
> > > lot of auditing is needed before this can be safely applied.
> >
> > Sure.
> >
> > Cheers,
> > Biju
> >
> > >
> > > Jonathan
> > >
> > > > v6->v7:
> > > >  * Added ack from Greg Kroah-Hartman for patch#1
> > > >  * Swapped patch#2 and patch#3 from v6.
> > > >  * Added Rb tag from Andy for patch#2 and patch#4
> > > >  * Updated commit description of patch#2 by removing unnecessary
> > > wrapping.
> > > >  * Updated typo in commit description struct bus_type()->struct
> > > bus_type.
> > > > v5->v6:
> > > >  * Cced linux-rtc and linux-iio as these subsytems uses
> i2c_get_match_
> > > >    data() and this function become redundant once this patch series
> hits
> > > >    mainline.
> > > >  * Added Rb tag from Sakari for patch#1.
> > > >  * Moved patch#3 from v5 to patch#2 and patch#2 from v5 to patch#4.
> > > >  * Added Rb tag from Andy for patch#2
> > > >  * Separate patch#3 to prepare for better difference for
> > > >    i2c_match_id() changes.
> > > >  * Merged patch#4 from v5 with patch#4.
> > > > v4->v5:
> > > >  * Added const struct device_driver variable 'drv' in
> > > i2c_device_get_match
> > > >    _data().
> > > >  * For code readability and maintenance perspective, added separate
> NULL
> > > >    check for drv and client variable and added comment for NULL
> > > > check
> > > for
> > > >    drv variable.
> > > >  * Created separate patch for converting i2c_of_match_device_sysfs(=
)
> to
> > > >    non-static.
> > > >  * Removed export symbol for i2c_of_match_device_sysfs().
> > > >  * Replaced 'dev->driver'->'drv'.
> > > >  * Replaced return value data->NULL to avoid (potentially) stale
> > > pointers,
> > > >    if there is no match.
> > > > v3->v4:
> > > >  * Documented corner case for device_get_match_data()
> > > >  * Dropped struct i2c_driver parameter from
> > > > i2c_get_match_data_helper()
> > > >  * Split I2C sysfs handling in separate patch(patch#3)
> > > >  * Added space after of_device_id for i2c_of_match_device_sysfs()
> > > >  * Added const parameter for struct i2c_client, to prevent
> > > > overriding
> > > it's
> > > >    pointer.
> > > >  * Moved declaration from public i2c.h->i2c-core.h
> > > > v2->v3:
> > > >  * Added Rb tag from Andy for patch#1.
> > > >  * Extended to support i2c_of_match_device() as suggested by Andy.
> > > >  * Changed i2c_of_match_device_sysfs() as non-static function as it
> is
> > > >    needed for i2c_device_get_match_data().
> > > >  * Added a TODO comment to use i2c_verify_client() when it accepts
> const
> > > >    pointer.
> > > >  * Added multiple returns to make code path for
> device_get_match_data()
> > > >    faster in i2c_get_match_data().
> > > > RFC v1->v2:
> > > >  * Replaced "Signed-off-by"->"Suggested-by" tag for Dmitry.
> > > >  * Documented device_get_match_data().
> > > >  * Added multiple returns to make code path for generic fwnode-base=
d
> > > >    lookup faster.
> > > >  * Fixed build warnings reported by kernel test robot
> > > > <lkp@intel.com>
> > > >  * Added const qualifier to return type and parameter struct
> i2c_driver
> > > >    in i2c_get_match_data_helper().
> > > >  * Added const qualifier to struct i2c_driver in
> > > > i2c_get_match_data()
> > > >  * Dropped driver variable from i2c_device_get_match_data()
> > > >  * Replaced to_i2c_client with logic for assigning verify_client as
> it
> > > >    returns non const pointer.
> > > >
> > > > Biju Das (4):
> > > >   drivers: fwnode: Extend device_get_match_data() to struct bus_typ=
e
> > > >   i2c: Enhance i2c_get_match_data()
> > > >   i2c: i2c-core-of: Convert i2c_of_match_device_sysfs() to non-
> static
> > > >   i2c: Add i2c_device_get_match_data() callback
> > > >
> > > >  drivers/base/property.c     | 27 ++++++++++++++++-
> > > >  drivers/i2c/i2c-core-base.c | 60 ++++++++++++++++++++++++++++++---=
-
> ---
> > > >  drivers/i2c/i2c-core-of.c   |  4 +--
> > > >  drivers/i2c/i2c-core.h      |  9 ++++++
> > > >  include/linux/device/bus.h  |  3 ++
> > > >  5 files changed, 90 insertions(+), 13 deletions(-)
> > > >
> >

