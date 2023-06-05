Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C502722288
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 11:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbjFEJsM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 05:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbjFEJsL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 05:48:11 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38263F3;
        Mon,  5 Jun 2023 02:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdlFlUXBDa9PyGItie9+R7xNBjhnMO+Qdj2g2zf3HGtE5T2MWXmVqGerwmODH7y5taKBVZzpUOFPlge1sRsCXD1NVNIVMIJeQCxQVcvnirPfaZkVvF+GrRvh/PGcjwIen/jWcxFFcuPC/FRcJn1kFR7h5UGl/SKczaITw9H3symlEPJV3GVkQvyAlQVE77QTjOK4utxiIekPJCFY4UTJYndOtsEKQZhVtfghuxJm8kG/2hRFrgxZHkSAGtq5pJSq/Ho22PInRhEhOfOYLNLlmvvvZZT/0MKh5IfeFJs6YTbi8LfN3psqFJBwgTrLL0Blnc48toThcVmvICm4EVXxfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6LGkkQlfHGdO/RSGRjsoGGM3Pn+I3MhSeR+k+Eak9E=;
 b=NQ9ezej9uydVDZdnbisH8ofZ5Qou1rNeurzgxRF3HrCiN5HEqOgwNlTtVFa4a7j/NieaCAmZ8rVc2VSUicU44R7aU5ibed6IBnIMDAkg3BthcRW+KtbtWBaio+s2PihtedntKcFd/ezrf9c6dLgNwnH8QfiK2UgjSjxctgYClNkLsM/fZR+nM1V7S7+ey2aCsSaQm/N2syDLwqJG1DVOxIROJUBw74VbyUPlt2Iw/70XgOc2eZA7mKApaiQbVabG6jpwlL/nig38DDDx88HULx+pRDVcPWvLxuiLpMY+A7aaPcBAUhUwajOhIDBfzKWTMm9KyJ46YBbBUFY9vnX6mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6LGkkQlfHGdO/RSGRjsoGGM3Pn+I3MhSeR+k+Eak9E=;
 b=pdkv9ouImjSstgvhAxye4SAlSEhGbxF5WdEtAsIFo2xx2UNcVjxbiBkUfioFFqRMJFjj2st/zPfcnOIKu7b10aFmDm4kaC3daYyHhynYHbB0opzh62gCykW+0HrZt3iAXxBA73EsYeBfvbL+r1u8PO+az5i3r0WsTzfwl2oeMIs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSRPR01MB11566.jpnprd01.prod.outlook.com (2603:1096:604:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 09:47:59 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 09:47:59 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] i2c: Add i2c_get_match_data()
Thread-Topic: [PATCH v2] i2c: Add i2c_get_match_data()
Thread-Index: AQHZlKzrKxpdhC80OUSwaqoUiGHLGK979dwAgAAEDsA=
Date:   Mon, 5 Jun 2023 09:47:59 +0000
Message-ID: <OS0PR01MB5922300F70EF37359C53D646864DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230601171711.221430-1-biju.das.jz@bp.renesas.com>
 <ZH2p7iWYizLsxZ1g@shikoro>
In-Reply-To: <ZH2p7iWYizLsxZ1g@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSRPR01MB11566:EE_
x-ms-office365-filtering-correlation-id: 8db885e6-6287-4883-400b-08db65a9f236
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8aQXtSXWJomoy75AQwmte7/9Fq5GIcwnoQJnredexm5wU1yPO8GDwMi4iPirey0hA9cR6d9IL2xEpYd8lOT9FNk3tpGCJLGOqKhOO6ELwonNWeC/NKdpzIUmGjMJQDAxZC9u7w1b2PB7WSvJBaDs2XcqgTOMK1At6yN5igmtq1Gh9Wvo1MrDrj6ICUXS6Afb751I1ir+VakNeZ5pMpanXS6n5AoWEc4l4fZn7TYBcJCw7Tfgl90BYiahcZvMUIqaySZW9NaM3eMPPsoLlEbGsuNZg58mW4cHo4urzXXVYkwNfiZPTBxHOGyKLJEVEVNq0HpQBtuUYYYwxU2Wm7u94xHIZhdIKd9nyAFp6S5DwQBSVXalcdfSd2c0jTdKd+hlNlVXpBfMmpIIEQ8W9KYEjlKv6WviwCtTprJvUWpdyPGjFUoTuOBgZNpKWN+lwbAg//XzypZV+P4z2i+itaOsOhZfobKJmzOzf9Q1w7LGm5d3/GzwiFOb4X4eNf4qY4R49u6M4ZvIj4puUgg956k3ehFH4ggonPkN7q1wKpyWsVQWBs938qBR8jUZisCAfCOAvYnD69o7745L1+Tj+zebdK0Xx+yGnIZ9bPWNfd5kPRpygoaQ1Glvjl+7OhPK8QbT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(41300700001)(316002)(54906003)(122000001)(52536014)(5660300002)(2906002)(4326008)(64756008)(66446008)(66946007)(66556008)(66476007)(6916009)(76116006)(8676002)(8936002)(478600001)(71200400001)(38070700005)(7696005)(86362001)(186003)(38100700002)(55016003)(53546011)(9686003)(33656002)(26005)(6506007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WMVAoPeRwRHZp8eTSrI9jXr218HgLwXoV8DMKnH6nn8bzREOIzBv1BV8bIbL?=
 =?us-ascii?Q?ZE3a1DfgJBWSRPSBjRbVDNe36HJVDzD5CegwNSo6f+Pw5gTp3gpDJn379LyE?=
 =?us-ascii?Q?CUkOH1sa13IYRGapf1qM7pwFwG1YGThFVNXAWqqqvVpKfEKAjt10V5yK7DoH?=
 =?us-ascii?Q?85VpS3d1Uw9RrS/q2d49dn47xzgf8AfJ5PrbDYBY5M1Td1gulpZfPzDk3Kps?=
 =?us-ascii?Q?yW0DoiXSKwomWPYq/VUenOgmI6y1otOD8aCvaw98Y03MH2etxzKwFz/gCAWE?=
 =?us-ascii?Q?bVm5fm5w9pEAZRjwXbt6KaX2bDK7MjFlOl13XHdVrIDaKyDxz7XkPclpMizt?=
 =?us-ascii?Q?3O1B2ch50K9sOa0xRDgbO5HAc2Kud+mMnuu5AOVFVt3C2WKaL7RBxDX4GKB8?=
 =?us-ascii?Q?i8Js6IY44O/p5raPFU5yh1h2eL/xruUVlA1lgwfd+0Mmwc9KDEArV3gYDBB/?=
 =?us-ascii?Q?etd22QRPXJ4WL416AInsW49eefK1e+jNHr3KXjPqewt/fMnTUJLnNvhj9uxw?=
 =?us-ascii?Q?Q7c0pL3KAvtBCliRiNij2YCJaqTyB0dmhkCcFDZ+p3uyLw3AliRtBjw5VE4O?=
 =?us-ascii?Q?EWx6//zGKg0Da13tZL79iqCQd6Di7+mtVSjTBhD7Ur9YhZMgMahS1tjhP7qr?=
 =?us-ascii?Q?qb3bkQ+6Luv0Q83FJBlMC+NMNznpgHDjQiBNJMpkn9nqU/bWc2p0G/zoCQAA?=
 =?us-ascii?Q?xbZNhz0onJnQk4kGMFZ38mYiQd4mI8H0mbQmBYWeJ6bbQglqrMrSQD3S04HE?=
 =?us-ascii?Q?zgONLsVucTelUHZSphSyQAtvSp4ZxvjteummFFc6V6v2WseF/iX4MBqTTuAq?=
 =?us-ascii?Q?1GzQ8whOI2EHPecYSULyUGBbdOIEx/dcRt6iKJbw8shlOmTqcB638shGGryr?=
 =?us-ascii?Q?sX7+ZeQ9fq2zjzZmWWtvx5ABWSIOFc1RGJ7cemzL5/YpkAjhdOiGQpxCRUWM?=
 =?us-ascii?Q?BoHKaUSUDGx2pzd7m7ezhBIKXGMuRT1m+cUuSeyQdArUqcy40EeYxYXGTBun?=
 =?us-ascii?Q?sdQ3iLIoAaj2w4ihP6kgirzp9uio3xzcSMb1V2Ry1rqdWiRbCQ5El89cXdv0?=
 =?us-ascii?Q?8M2RnNZjQyLdIUehz26X3EiV/5dW5vBFaU60qokWxGUG1CJBf0kO26GymEn/?=
 =?us-ascii?Q?toEk9D7Z1i1Ouqk+kAVLDZj8SqfBBZqPsCCL5cGnNP4SGMWrgZAQAcrfoWDi?=
 =?us-ascii?Q?FM+E7Oli4nZaGIipU4uXdn7R/rwacXX/jpEA11i4fdv8PWwoQbHcAzUry6Lr?=
 =?us-ascii?Q?Kogl0FkDz+iNlatmBWKCLuve+1cOK0F/IFEIeayC1U0Z7eb+NmUZCLbLoQzo?=
 =?us-ascii?Q?JPRf4NajTmbyrXMROH2odX7M3FhFUEMuaIhM3PL27eFMjRoPx2lJTs04xBAa?=
 =?us-ascii?Q?7eBkWM/HQPgbg/27I9mjOJwq3EaDasexSBZoMmBFvHJwP1P6LMNUr+t9kEvF?=
 =?us-ascii?Q?53r+HkWhzJdHLgwu3QV1+M84krEyrsnyzpBw1kAuVHk5KWcpjNkJHUuenBkV?=
 =?us-ascii?Q?tZtxfJfymbrwxd5sKTcIsmGa5BhSAOXTL/mn1lw/IYJ2k8zKRFMHS3HgdKSI?=
 =?us-ascii?Q?UtZsAYlLfsHhIp/6M9PE/0ujJqyZ3N4ClJzCHuHq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db885e6-6287-4883-400b-08db65a9f236
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 09:47:59.0568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZRPmr2D6p5F6QjHay2p96koHx5/CYd4TBlk+y99F3hEOVhKl5jUYVAWQGQowUqBwZvpdNF73quYhah5fUUeZRcVK4Wf2XGE8RV7psYty72M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11566
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thanks for the feedback.

> -----Original Message-----
> From: Wolfram Sang <wsa@kernel.org>
> Sent: Monday, June 5, 2023 10:25 AM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Alessandro Zummo <a.zummo@towertech.it>; Alexandre Belloni
> <alexandre.belloni@bootlin.com>; linux-i2c@vger.kernel.org; linux-
> rtc@vger.kernel.org; Geert Uytterhoeven <geert+renesas@glider.be>;
> Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-
> renesas-soc@vger.kernel.org
> Subject: Re: [PATCH v2] i2c: Add i2c_get_match_data()
>=20
>=20
> > +       if (client->dev.of_node)
> >                 config =3D of_device_get_match_data(&client->dev);
>=20
> Has it been considered adding this check to the new helper function as
> well? Saves even more boilerplate code, I'd think.

You mean like below?? The new helper function will do both I2C and DT-based=
 matching??

const void *i2c_get_match_data(const struct i2c_client *client)
{
	struct device_driver *drv =3D client->dev.driver;
	struct i2c_driver *driver =3D to_i2c_driver(drv);
	const struct i2c_device_id *match;
	const void *match_data;

	if (client->dev.of_node){
		match_data =3D of_device_get_match_data(&client->dev);
	} else {
	      match =3D i2c_match_id(driver->id_table, client);
	      if (!match)
		   return NULL;
=09
		match_data =3D (const void *)match->driver_data;
	}

	return match_data;
}
EXPORT_SYMBOL(i2c_get_match_data);

Cheers,
Biju

