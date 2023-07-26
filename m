Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65F85762DC9
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 09:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232725AbjGZHfW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 03:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbjGZHex (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 03:34:53 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 623191736;
        Wed, 26 Jul 2023 00:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9zEWi3IZ+ibO6T8/d4J/0kScbOM/I71ss3dl4A9OJUdBgOB4WKCtx0CpqvMPG0s/j+ULDm6hIw6NH+gpIVw1n/JARcDG039Yaa/VFCriD1TAzDYL6oaykTKxxEnrGRDM1a4NWt7toMSY2Bf3EkkIsdbTUC33ayQzCcll/TcsYZWwoUZyCuuQJ8UvzKaMC6FFzbLU01QtLI5H6JYhpVe6LlX8ok+4z1DtwmZGoHM8tckSHEBDdeslgoh+6tiDJcFIDjFQGJKDHjRGuAH4Ge7UcI83Za1x/DzPLzLGlPd3duxGT0WKACTQxVbHfSVZyRzy99K4m+hHMEqwQSmUfzcmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9HR9eIHPE7KtnW7agze8bJeQ/cb2IzWTuDBkw89tPc=;
 b=GXQ9E0V4kvcWjmT0bTQ5CpaXtN7Piy9N/yDq9Ys24gOEDAfgZGFAYCjnt33ijaKnkeYTU5liBnR6VTdZ2alxdcrt0OguNu4owDUU/ajjuLaQ1q9rw8KJ6+IrAbb4mmuTtL6AuABpNgEfMElPxINIF52/YuLoyjq5T/MgZ1QcPD2A/+TrxRj3302eZgMY4sGgkEe7soaJ8eVvzFlkQW62tVS4iA2L7pxbxpIqrHghbF7lIccgWXwAlEW9DkJmtq+cBOg6MCsdFBfYC+k5VZN/NEWlLe5sz7DNUAJv4vbZ6cgv7RdZB7rLObdm2EtxOQmxpP9ddLXqfEplztTSZmwbcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9HR9eIHPE7KtnW7agze8bJeQ/cb2IzWTuDBkw89tPc=;
 b=FjUDGBj7zXGkgnTNLHnFB2NJ2p4J6cUGs9pFskCtWnRNuWwecXwFhd3SBOjbnrenqkJRHuBwNafJOJQzUIQRcj4xScFoj6mqoVE/K1U0JlQczJpzn1bdHF0dYunCkq1pOa7ZsJx7yMWM9a7zl04zBBxiOGX9n9ggPstj3JGOZ/k=
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com (2603:10a6:803:57::30)
 by AS8PR04MB8545.eurprd04.prod.outlook.com (2603:10a6:20b:420::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 07:32:18 +0000
Received: from VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::ea2b:9b70:e669:f0e4]) by VI1PR04MB5005.eurprd04.prod.outlook.com
 ([fe80::ea2b:9b70:e669:f0e4%3]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 07:32:18 +0000
From:   Carlos Song <carlos.song@nxp.com>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        Bough Chen <haibo.chen@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v4] i2c: imx-lpi2c: return -EINVAL when i2c
 peripheral clk doesn't work
Thread-Topic: [EXT] Re: [PATCH v4] i2c: imx-lpi2c: return -EINVAL when i2c
 peripheral clk doesn't work
Thread-Index: AQHZvtHcZdFY02/DSEqQ92ZjaP7O2K/LJU0AgAB/A0A=
Date:   Wed, 26 Jul 2023 07:32:17 +0000
Message-ID: <VI1PR04MB500543E4E6E5EA9597913669E800A@VI1PR04MB5005.eurprd04.prod.outlook.com>
References: <20230725083117.2745327-1-carlos.song@nxp.com>
 <20230725234102.louqs6gvlhfehjur@intel.intel>
In-Reply-To: <20230725234102.louqs6gvlhfehjur@intel.intel>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5005:EE_|AS8PR04MB8545:EE_
x-ms-office365-filtering-correlation-id: 0e717bb5-1d40-472f-7f48-08db8daa70d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T9hIpY7GzfN51ZoDE/tv6sNCrHFK80x4+1u4kpo4QvKETJVfT0Ezjj9tz5wOx5QsMw6yTGUBhJehJCwI+SNAeNxNn9ASOfgbJ6TQCYtV5Xs/qGgFLRfc3ahx4/gFmqYSOtUuY4rCR/opCCJxVVxzZNRA6Uv8/H8xFZIuOOOYoHQt4X3c9DHYth7etM1y8uM01BGElH72NsVRSH2ebNyCXBKytXwyAg/2znt3olkxjkd3atLaBv/pVUv5fY0sXFEfgQpcUPJ9ng4Ef1KB0CH8WQY+wum39WE5LuU4AAotWLaPvvx0yqzY5ngpKkGJGeYCuu45O1kuDoZqHUYCAFImmGffBcUsZsU7hiFqyHhBf3agw65UHVvpP4anuccOEG8v/40dPaElhQaZr9hXYOvw5OIGFYT8/Bl5zsrc+mg5P4EN9vQ0yEJgF4CkahWawiLmAsrRcskiQ0YExhAEZf9jcpBRRSnwJWhamOjb1eBqRwgqzZdhossn4KnNPDIXKNNZqb8wOU2RdHsdK+UkDNk+/hyodAqP5maQMFmpfHDwNEJPFaVegubvkHBuetKhglb1Sa0SAGSOR6Tc5cXmL155m+mGW+GNOQ9zZvZR3FDfiScjJLx71Z4xMpPWvGLBg5zy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5005.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199021)(2906002)(6506007)(186003)(71200400001)(26005)(38100700002)(122000001)(53546011)(83380400001)(5660300002)(41300700001)(52536014)(33656002)(44832011)(66476007)(66556008)(66946007)(76116006)(66446008)(316002)(4326008)(64756008)(6916009)(8676002)(8936002)(38070700005)(86362001)(55016003)(54906003)(7696005)(9686003)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uBBsUP7OmSJvwzDYHGUNzXRLc3D3LHpf9RZo56pwi2685SNYFZQM1GAgndmJ?=
 =?us-ascii?Q?aogaueJNV99Fi+QHOhz5nBfVNg3i4dAoqinGm1mtWkp0dEZYDmwQLKDOBj59?=
 =?us-ascii?Q?be9jb45eAbnRk3HnwEywuVIWcQV71Tpf2ijoyjc1h1hsc9JG9YxkZwA6vZqc?=
 =?us-ascii?Q?ZFxHw0P/uxAYKjZ5vIkIKADvHQJp3mDYuyuJDxdT0dT/uIAefEE7ODA2P9C+?=
 =?us-ascii?Q?Spb71D+GeUabcnaCB8dvcthZ7Vw+burCgTSAdm3rkGd4Q8V8OVYBZ0edZacp?=
 =?us-ascii?Q?oaXjgGaEWnlhEIn2Fi/O988cJNeBlXhdLswDvZNm0N3b2p2L45Tpn9Lmm9VH?=
 =?us-ascii?Q?jHzEYUwcwEw90aNchbrBF2TOY9UVtP7khdq4OKQKKG+iuc7eF25uj4HqnTJy?=
 =?us-ascii?Q?Z4F0uMz4ryhU+hFneiZ6kDc4tFCVFDfcnlQKWSv8ZzWhbVP5GYDMtSsLS7a/?=
 =?us-ascii?Q?GVWUHKRLkw/Y+XVCAWQKL0yaWfzw33WPfWKnes/JrZd2AnJX1Oli++c4ewqu?=
 =?us-ascii?Q?1Y0daFoay55kCSzZNqWfAEVpZmvfqt7erd8Nx2bJNdaMMuF3wM2j+bJ9OU8a?=
 =?us-ascii?Q?qK7O6MwpfmZwKeONDRWihkdFoCkDX+Gx9gk5lBcPd417AF6oKmirwxZ/h0pC?=
 =?us-ascii?Q?G0zuz9aB75UIpzF/WQdSbDMdELaUSyakkAYQiCrPAahn5YXaR4Nphuxr5rVI?=
 =?us-ascii?Q?Owo+UVoLb3f277VJsusCu8rC1VtYOau9mPtjkrfqV34Du0ZrNQ2GtLy9/kiD?=
 =?us-ascii?Q?6b5RIHc3/Qh4M0q0rtIpEJCxSHzmVXNE5XuYs2/w0HB/HwxVvz8p++oWYguC?=
 =?us-ascii?Q?kXpUJ1SfxPC5tZknlEIEkB2spdLnTua8yqkD5j6jr8Ydtu/L595hO6JEdw/q?=
 =?us-ascii?Q?QdNDAsFhY9WEyU4qVRuPnZnTv/XGkndVMSrN/HtEj64GooYeHW2cQQrvAutp?=
 =?us-ascii?Q?Nak47XdlswcFz38ASE/KUKlqlXl1K1GDe6dkl4d0JLju8rPY+rTHFsn5OK6M?=
 =?us-ascii?Q?xNJihp6qkamdV+wGWVUpyEKNitoFxGt8pAnWNKwjAax/ZQWKcyjZ/0CRXG7J?=
 =?us-ascii?Q?petWlnntZw/wWrI/4q0vfuKz1h3TAamvtDI5o3nu2GC9+GffqhVo4qBJER6h?=
 =?us-ascii?Q?eSWBemQJQFzm8/ADmHaShUcB+bhPDzXLL2sUu+0BHSCQ+wKfa8NcgeftI2+1?=
 =?us-ascii?Q?4UWzTuGFCayahYIY7EeEhTAPqc4f3RTtMqZef2Ftf/x2jckzI2SrR6MnxWfc?=
 =?us-ascii?Q?vnUavRkPFi8+ZjZKa3Lj1v1P34MXcagZv+MWfAF7q3t2cIPoMpt+5ZR5cEqU?=
 =?us-ascii?Q?hPHBR/5iz56bqWSOka68RKve0AKOCOrAqIRD1WIWUTSEhPcl12V7pXs+PIpF?=
 =?us-ascii?Q?Lv93upw2BQ0HmriXT8En/B9kYRflRsDzmswuh8GeyBb2eO2Ms/lLpQHAWOFz?=
 =?us-ascii?Q?jSl704eot5pCJsLR0YbDe3w3ZuqGco5oQno7stq0gkEKs4zJrIJ1S9pfxUSK?=
 =?us-ascii?Q?DO1SasizH/UeDl26MPKj+c2OgOSQez9Xnxw/xmMhZitwf9dFmalfgT3FJDkb?=
 =?us-ascii?Q?guGTaJiNvD9xxx5Dpds=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5005.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e717bb5-1d40-472f-7f48-08db8daa70d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 07:32:18.0008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j3evr79Mk9t+GDA4Xq+wgnmLZquv/jvnA3zX5g0aBqnyh8b3EDc+Xtskf623/EVmrw7j1qRWFz5zGn6/1T0GgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8545
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, Andi

According to Aisheng, I find that if the i2c clock rate is not assigned on =
MX8,
due to chip architecture, the default speed will be 0, it cause our i2c not=
 work.
The judgment will be triggered easily. This is a special case for imx.

The log like this:
[    2.401402] imx-lpi2c 5a800000.i2c: use pio mode
[    2.419788] i2c i2c-4: clk_per rate is 0
[    2.423724] i2c i2c-4: clk_per rate is 0
[    2.444071] i2c i2c-4: clk_per rate is 0
[    2.448011] fxos8700_i2c 4-001e: Error reading chip id
[    2.453172] fxos8700_i2c: probe of 4-001e failed with error -22
[    2.459271] i2c i2c-4: supply vdd not found, using dummy regulator
[    2.465522] i2c i2c-4: supply vddio not found, using dummy regulator
[    2.471913] i2c i2c-4: clk_per rate is 0
[    2.475867] fxas21002c_i2c: probe of 4-0020 failed with error -22
[    2.482066] i2c i2c-4: clk_per rate is 0
[    2.495716] i2c i2c-4: clk_per rate is 0
[    2.505464] i2c i2c-4: clk_per rate is 0
[    2.514786] i2c i2c-4: LPI2C adapter registered

So the patch can not be dropped.
> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Wednesday, July 26, 2023 7:41 AM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: u.kleine-koenig@pengutronix.de; Aisheng Dong <aisheng.dong@nxp.com>;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; Clark Wang <xiaoning.wang@nxp.com>; Bough Chen
> <haibo.chen@nxp.com>; dl-linux-imx <linux-imx@nxp.com>;
> linux-i2c@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH v4] i2c: imx-lpi2c: return -EINVAL when i2c per=
ipheral
> clk doesn't work
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> Hi Carlos,
>=20
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -209,6 +209,9 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct
> *lpi2c_imx)
> >       lpi2c_imx_set_mode(lpi2c_imx);
> >
> >       clk_rate =3D clk_get_rate(lpi2c_imx->clks[0].clk);
> > +     if (!clk_rate)
> > +             return -EINVAL;
> > +
>=20
> this is a very unlikely to happen and generally not really appreciated.
>=20
> If you got so far it's basically impossible that clk_rate is '0'.
> Uwe asked you in v2 if you actually had such case.
>=20
> I don't have a strong opinion, thoug... I would drop this patch unless Do=
ng is OK
> with it and I can accept it with his ack.
>=20
> Andi
>=20
> >       if (lpi2c_imx->mode =3D=3D HS || lpi2c_imx->mode =3D=3D ULTRA_FAS=
T)
> >               filt =3D 0;
> >       else
> > --
> > 2.34.1
> >
