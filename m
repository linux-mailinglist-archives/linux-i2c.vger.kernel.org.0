Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8B6771111
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 19:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbjHERnA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Aug 2023 13:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjHERm7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Aug 2023 13:42:59 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2095.outbound.protection.outlook.com [40.107.113.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DAE130D1;
        Sat,  5 Aug 2023 10:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lY3IlimyDxANJmIQhbwip5MiwRVLnam3RW+Iam4I1VOuEaOqsjJl7ljvQcZZ6drDy3yjasXMz+edfqHUkBw6VOrGEVJLsqbOUmoN1y/KnMH3ViK7S6UdAbhpuGF7FgnRfUxS/+dLdBjv3A9zh04wdF6MFeS1EhnL7uoYpsjzq5BvMglCWcx41vkwItCmWK4B/ZjlEm7q7VZIHY9iu2HgDa6W9pJBVbfPyXaIrdgewtunvHMLmpSF7AcftolJu6J0JwpNVT3CqJT2XU0I2Bck0bjRIxOCPPlmywCtkmRP13hQ/0jfcvaPaalSuX0ywUfZic/6kwBoWBHV+Her6iPeaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EymZBMRB8R0/lLAItDW0tKvdsS4XhHxHwZRzjnPj+mg=;
 b=LJiGyWG/ZcV/zzZN0L14NpBnTEaqiicABB2qVZilLQdQly+1dmTe+xo9bUWuW2zh0HTf2E0Afjc5ABt2BFlwVNSL7IgaUgDIWULm94jfiSIXAH0DxetaUoPyoc2mlF2wFT25kqS3568yaQ+hRbrzlrAaYTfIDO0Y7Rg1zbtIXXSfS3m89a1SL29qblzyJ3zXYsxvPIhOmGZD8UVwtlGLslOzU1Wc5FEqwIYKzNOvaey8GWWKZCRgNFJOBASq1lB1PYJlKSje5pw6ywf+r7BXs3F3r928kn8/+glcS5WJgqFoP8VToHG9i/J48ape6QRjnwUCEJjDNpB1VJgNimSfIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EymZBMRB8R0/lLAItDW0tKvdsS4XhHxHwZRzjnPj+mg=;
 b=im+JWyeuDr460joSPSPMfiaduMI5fC3ypXXrSKjMGaFI2jy5gjFHxbcTjXm+GrSycxngbAx2NoURGtvRuwcg1OJLpHHz8/dVZSR4lhkrCUMktfPPlV7pUlM0eWV50Yh010dv+32IIwuufSLCp7Iy/uJz9fxaFBOY/oWumiQgk6s=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8083.jpnprd01.prod.outlook.com (2603:1096:604:166::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Sat, 5 Aug
 2023 17:42:24 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f4c1:5f6e:abd1:2bf9]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f4c1:5f6e:abd1:2bf9%6]) with mapi id 15.20.6652.025; Sat, 5 Aug 2023
 17:42:21 +0000
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
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
Thread-Topic: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
Thread-Index: AQHZxu8xqdWpTKFxl0mrPmlP0GQCwa/b6UAAgAADvoA=
Date:   Sat, 5 Aug 2023 17:42:21 +0000
Message-ID: <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
 <20230805174036.129ffbc2@jic23-huawei>
In-Reply-To: <20230805174036.129ffbc2@jic23-huawei>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8083:EE_
x-ms-office365-filtering-correlation-id: ed338c7b-b214-4772-687e-08db95db5215
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HuSE9slJIMQbTOesfufDYfD7Cx1+XaQkQu6eRvoD7j0oa8iyn0J4VjLzBXjooiXhdIlURcprs3kFJi/6gz1DM6xhcsO8Vub2i3F5x/111a6iUo2/nZmtOwHTg5Dp46JFJXzKAsynHtKTMG0EkfDzR55EsfyfHQ5MScZvT2npHY6gBIq897pr2e4Vzg0QdHDVs3p785Um0CXTUZWJ+Ob8WQz8i6K6TmxzpYe4tOwrpTZzEFW+J1w+B2SRDBd0pC9zCdRz3nKODK6oONZYlc4/ecHD0LI1UL9Tf8nNtbEYyOVIFDI/ZzmnOiZlZejE2QdYVf/LUL8qY5hhEWXOF+HL4WVxG1dcEFM2le+iPNP2BhIJ6DvXuanhojnviUKNaP378p4BWhQs2H6QY5OEMiasu/csMmLGC8Ms4aMYKEXrPM/246UCqMRAebsrP7ECoNs3SgYietq7aVilB7U4cuirsEVgHcR3KyISKnr6ZeVr4SVNds3EWiNGaZqKCRGbfr4FEmtndW2lBYuyp3x+D0MsmtGKrJN9QeoBT4XFRP2az5J1DyJREotWKB1/OLjBounn7ruH6Xl4rhBJV2HG0VVY6l0VNRX7yNpotHSEpwkAOouT0uiBd95WkENVuER1tsIT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(1800799003)(186006)(55016003)(7696005)(71200400001)(9686003)(478600001)(122000001)(86362001)(6506007)(33656002)(52536014)(5660300002)(64756008)(66446008)(66476007)(66556008)(66946007)(38070700005)(7416002)(4326008)(6916009)(316002)(41300700001)(8936002)(8676002)(2906002)(38100700002)(54906003)(76116006)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1CheEnBIBBT6uC65LCcZiWmkZMol+TnmGvWsQLdSyPVEeqUD8pdBarmyJUuh?=
 =?us-ascii?Q?khP3MdetX6DGgyAcXgy0Xd5vavtGYzhYAXH+U0/18wAMmBGlo6Qz1vWYWFMf?=
 =?us-ascii?Q?f77S/KJLKVo1KfAyja2BIBvU8OuAxHDQMdk1YM0BJyUm+qPtCDLa5lrMKQS9?=
 =?us-ascii?Q?hEFqY+QBUKzpyKbHpfnIx3EeuXZziM5HRbEYal27DCUR6phiFVAD9UGJNw71?=
 =?us-ascii?Q?PPxXJQuuTWhsot8G+P5qPJ4StUNO9PWDSV/LdvfZg4Gs8BmCDzytOSMQ9c38?=
 =?us-ascii?Q?BD1iYPh7pSk5hd/D4E1mGHdoe08K2PYYSPE6OXUcxNgapcbNLjupGYduo/Zm?=
 =?us-ascii?Q?4RR6BLxZgR7XdLySbOOFAJCVMp7C63YbkUCPsF7nhvUPqP25+YWKqpGXo8lM?=
 =?us-ascii?Q?8TaA5r7ERPijnAmWvIWheb+5Aa2sv2ynufRUGceEBP0P6geREISy/ptDwBT5?=
 =?us-ascii?Q?2qxgyQ8Zn8v3TI3yTE1XU1XNzS6/chJJaf/1ZaGl9CVj30TkoF6oVPutDeWS?=
 =?us-ascii?Q?+ozH7021HRHxJum+fwbpDT0nxRYeLnt7i/o0xzDXcxXuCZuFtrCS5lLItDr9?=
 =?us-ascii?Q?yO6EcS4mALGW4LcU4PKA2GV3+0GQq958a2OvpQDrU3us92cIn+7i7lJ4ASZM?=
 =?us-ascii?Q?9URvPtGm9KuMS4BQ2RGE6xR6yzqvnR9jiCRkDDmhyh5IrOiJzsBH+heWGPOS?=
 =?us-ascii?Q?4r06Mtkt2/ugE+BYduVch5LJB+mc0mGAyb65UdDMFhmlLIDJvPpwOeDK9oxD?=
 =?us-ascii?Q?y1DSlu5yLB2bRTi8mRbI2sdKDBzd00tGpa7hMoySxxSYiujKAm8bUUZkPlXY?=
 =?us-ascii?Q?+jcD+1Bxfu2Tau8tJ8MqAv3f7vzsXZg1Dq1to9S/9zwAmTppYQxkmBZ1kHEM?=
 =?us-ascii?Q?MbabFS3HaPKbuRhCx4xACC063i/e2uAoqc1FWq2q+VZIzo10QAqopRQHSDnO?=
 =?us-ascii?Q?6AUGzlFenQ417LCiY4HFOQ9GPQwMMAFGqvlYguGPIGAbybaSV6NZzNHBJI++?=
 =?us-ascii?Q?4NXk1tnSedOfIrXChwx9xjTGIHqVjNWxMVralrCxR9AEBwIDzbHXznQf7FI5?=
 =?us-ascii?Q?ANV5DQzUe8+XTosdcyOm5u13Yzm6PMJ8o90e8PKh+8kUqcTuz51bQSlBnpBt?=
 =?us-ascii?Q?OR0CnvCa6bU6uJpuX4pGOYLgqRf7PgJIG1RT9GaA9kUNGpjA8SZM/S5ok4YP?=
 =?us-ascii?Q?jxgDLeeiC47ygZGV0LRssC8ir2gF7hBaaW/B8yDgvEJmC1068uEt3kJqMhZ3?=
 =?us-ascii?Q?6ecwWHRZ9wu+rPZXj5MZA25uIp8SjG/vVS9MqPmzUDa6kO5vkyAMix4rYWD5?=
 =?us-ascii?Q?OEVyC3fNP7rblddr7/raBjktGkcAbf2jhQkLfA1f9/pW4kzzorrm+SOS9ExB?=
 =?us-ascii?Q?BqV1ObAGPC90VPHlBQAo33IpEdQbMhVTxM3Ji8vG1kK8xyZMX4F/dS+Yz3Jp?=
 =?us-ascii?Q?oD8HuZ6jCBRSIK6ocN+YHX/vg1ASdA+Dtmga5LFlJ1ec0b3lIIloYdHal8B9?=
 =?us-ascii?Q?L4hEyZHzvxP0EsaCkYmHSQFYqyUmSimttjz6d6mbi42csbZAYAgt27DZ2bSH?=
 =?us-ascii?Q?evvBJRUV6LKlxn2kLnc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed338c7b-b214-4772-687e-08db95db5215
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2023 17:42:21.0335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ug/WOQE+AFc663c1v07GgIiYZqcUDuAX00SfyN5KP6d6NWvE0Mb7DrAHnfzhxFjbQ4AY6B+y5gYzuQU3vU0DP3jdwJIeQrQq8Gj1LcNgh+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8083
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
> On Fri,  4 Aug 2023 17:17:24 +0100
> Biju Das <biju.das.jz@bp.renesas.com> wrote:
>=20
> > This patch series extend device_get_match_data() to struct bus_type,
> > so that buses like I2C can get matched data.
> >
> > There is a plan to replace
> > i2c_get_match_data()->device_get_match_data()
> > later, once this patch hits mainline as it is redundant.
>=20
> Are we sure we don't have any instances left of the pattern that used to
> be common (typically for drivers where dt tables were added
> later) of
>=20
> 	chip_info =3D device_get_match_data();
> 	if (!chip_info) {
> 		chip_info =3D arrayofchipinfo[id->driver_data];
> 	}
>=20
> Looks like the first driver I checked, iio/adc/max1363.c does this still
> and will I think break with this series.
>=20
> Or am I missing some reason this isn't a problem?

Good catch, this will break.
we need to make I2C table like OF/ACPI tables.

Yes, before adding callback support to i2c_device_get_match_data(),
We need to make similar table for OF/ACPI/I2C for all i2c drivers
that use device_get_match_data()or of_get_device_match_data().

May be first intermediate step is to use i2c_get_match_data()
For such table conversion. Once all table conversion is done
then we can add i2c_device_get_match_data() callback.

The below one is the recommendation from Andy.

+ * Besides the fact that some drivers abuse the device ID driver_data type
+ * and claim it to be integer, for the bus specific ID tables the driver_d=
ata
+ * may be defined as kernel_ulong_t. For these tables 0 is a valid respons=
e,
+ * but not for this function. It's recommended to convert those either to =
avoid
+ * 0 or use a real pointer to the predefined driver data.
+ */

>=20
> Clearly this only matters if we get to the bus callback, but enabling tha=
t
> is the whole point of this series.  Hence I think a lot of auditing is
> needed before this can be safely applied.

Sure.

Cheers,
Biju

>=20
> Jonathan
>=20
> > v6->v7:
> >  * Added ack from Greg Kroah-Hartman for patch#1
> >  * Swapped patch#2 and patch#3 from v6.
> >  * Added Rb tag from Andy for patch#2 and patch#4
> >  * Updated commit description of patch#2 by removing unnecessary
> wrapping.
> >  * Updated typo in commit description struct bus_type()->struct
> bus_type.
> > v5->v6:
> >  * Cced linux-rtc and linux-iio as these subsytems uses i2c_get_match_
> >    data() and this function become redundant once this patch series hit=
s
> >    mainline.
> >  * Added Rb tag from Sakari for patch#1.
> >  * Moved patch#3 from v5 to patch#2 and patch#2 from v5 to patch#4.
> >  * Added Rb tag from Andy for patch#2
> >  * Separate patch#3 to prepare for better difference for
> >    i2c_match_id() changes.
> >  * Merged patch#4 from v5 with patch#4.
> > v4->v5:
> >  * Added const struct device_driver variable 'drv' in
> i2c_device_get_match
> >    _data().
> >  * For code readability and maintenance perspective, added separate NUL=
L
> >    check for drv and client variable and added comment for NULL check
> for
> >    drv variable.
> >  * Created separate patch for converting i2c_of_match_device_sysfs() to
> >    non-static.
> >  * Removed export symbol for i2c_of_match_device_sysfs().
> >  * Replaced 'dev->driver'->'drv'.
> >  * Replaced return value data->NULL to avoid (potentially) stale
> pointers,
> >    if there is no match.
> > v3->v4:
> >  * Documented corner case for device_get_match_data()
> >  * Dropped struct i2c_driver parameter from
> > i2c_get_match_data_helper()
> >  * Split I2C sysfs handling in separate patch(patch#3)
> >  * Added space after of_device_id for i2c_of_match_device_sysfs()
> >  * Added const parameter for struct i2c_client, to prevent overriding
> it's
> >    pointer.
> >  * Moved declaration from public i2c.h->i2c-core.h
> > v2->v3:
> >  * Added Rb tag from Andy for patch#1.
> >  * Extended to support i2c_of_match_device() as suggested by Andy.
> >  * Changed i2c_of_match_device_sysfs() as non-static function as it is
> >    needed for i2c_device_get_match_data().
> >  * Added a TODO comment to use i2c_verify_client() when it accepts cons=
t
> >    pointer.
> >  * Added multiple returns to make code path for device_get_match_data()
> >    faster in i2c_get_match_data().
> > RFC v1->v2:
> >  * Replaced "Signed-off-by"->"Suggested-by" tag for Dmitry.
> >  * Documented device_get_match_data().
> >  * Added multiple returns to make code path for generic fwnode-based
> >    lookup faster.
> >  * Fixed build warnings reported by kernel test robot <lkp@intel.com>
> >  * Added const qualifier to return type and parameter struct i2c_driver
> >    in i2c_get_match_data_helper().
> >  * Added const qualifier to struct i2c_driver in i2c_get_match_data()
> >  * Dropped driver variable from i2c_device_get_match_data()
> >  * Replaced to_i2c_client with logic for assigning verify_client as it
> >    returns non const pointer.
> >
> > Biju Das (4):
> >   drivers: fwnode: Extend device_get_match_data() to struct bus_type
> >   i2c: Enhance i2c_get_match_data()
> >   i2c: i2c-core-of: Convert i2c_of_match_device_sysfs() to non-static
> >   i2c: Add i2c_device_get_match_data() callback
> >
> >  drivers/base/property.c     | 27 ++++++++++++++++-
> >  drivers/i2c/i2c-core-base.c | 60 ++++++++++++++++++++++++++++++-------
> >  drivers/i2c/i2c-core-of.c   |  4 +--
> >  drivers/i2c/i2c-core.h      |  9 ++++++
> >  include/linux/device/bus.h  |  3 ++
> >  5 files changed, 90 insertions(+), 13 deletions(-)
> >

