Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC92D5A6025
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 12:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiH3KD4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Aug 2022 06:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbiH3KCu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Aug 2022 06:02:50 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0523DDAA0E;
        Tue, 30 Aug 2022 03:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgPDFzFbgtUzXuY1U1FqR1J2o4JIV+sBrJ/aKQskf4nWyohT7Qyu7YPHCheYMrkbBGgh0Bs19FYaM/ylMvYsYqbUdM4DCnFseo5wZYktVwu1e2rEDhD2Cmw7szhll7x/vu7YWNjgCm88G3Hdd6hB7/bCPwZKNCZ8M1lcSmZuYN3RFpCKhazKNF+88HnpI3OP/ICw7UKKdloyW9tF5VzM3hE9jFgH0Thth3aoQ65aVLe+MBpPX+kutAbYiflETcZBTukv6KtT8yEsipwjiYNvFrgK6pr3Q6aAS1THy5fw5caOqYBTN+YLQSZoBsceMmHaPdQTtSB4dpb+zM9c/bsI+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuB9O8+0e5WilSeAfqdbarCNcRvFjk73dJ2DqkiJ5eA=;
 b=PZmgrwVQL3nBvyx8jHAKcBC+2xJBvA5HNvf8yLZ+OZWzlQcsimZ3Bqh9eEu+30uGxKQCUzl5/p9V5FpiqWoBCfsXHNdMboJ1D+Q8rO+fot0wwOIZ0ENH5GZlSJ5mv+GBOA4YKeRItYk2Mod3K6z5exUbv4qqWuMcGs6syOc/MlSkh4UBWuQ0bKfnTLswCvfD7ko2b5rz0k3ioEnb00RDDhoP6dGfBmkV3geNoX0R4RVxYGyUWAw+Jkna9XmjHOmQ+gdC3jIJNr/sFmVgvMyaf6HK5lu1UB5oOXFegAEgvCinHboVeIDc0pv2X2bMul30F8fA4NuAcyYZn/bLu8xqQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuB9O8+0e5WilSeAfqdbarCNcRvFjk73dJ2DqkiJ5eA=;
 b=IzfilmbtJyf45fL94yHi/V4HTu++5GNuxhau/riAmce2rbvTCkwWVI2hitvfp334hbvzzppltVEZa90K73H3jvjMpFEJYL4DveL8n/wrEnsNlOV8eRtNLsRBa14fA7ZFptPsyb8NtmBFUcUEAAAGl/By8mK313MkvAjkwyAmflg=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS8PR04MB8596.eurprd04.prod.outlook.com (2603:10a6:20b:427::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 30 Aug
 2022 10:00:53 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::2d22:3315:6f9b:82c7]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::2d22:3315:6f9b:82c7%6]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 10:00:53 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Wolfram Sang <wsa@kernel.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Clark Wang <xiaoning.wang@nxp.com>
Subject: RE: [PATCH V3 7/7] i2c: imx-lpi2c: use bulk clk API
Thread-Topic: [PATCH V3 7/7] i2c: imx-lpi2c: use bulk clk API
Thread-Index: AQHYtpyd2CybV4TXcE6fBJp5Z0CKZq3GWi4AgADm5sA=
Date:   Tue, 30 Aug 2022 10:00:53 +0000
Message-ID: <DU0PR04MB941748F61D2C10BEF909B2F288799@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220823030215.870414-1-peng.fan@oss.nxp.com>
 <20220823030215.870414-8-peng.fan@oss.nxp.com> <Yw0dvtRTkW/ISgna@shikoro>
In-Reply-To: <Yw0dvtRTkW/ISgna@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 258913bb-f57e-47fc-8cdb-08da8a6e86c2
x-ms-traffictypediagnostic: AS8PR04MB8596:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /vapuoB2O/qXydMPoH4Xz2YDsqXdeJN/bXlj30l0Oonr3DWMTXBAJdM9lTWLqyqIxx/nZL5qJtRouGvmJa15usvdIZ3HMdnWN7G6a3WGKKUhIWVIH2kjVaKVS/gWe2jkU5SaNRpk8HvlpjiUeJAfacYVLbb2TzGq5jLEzzYPzidMkHs9ccq0SbTA1qq796JBEV3u83/yiEViKDwti9R3FTeljMw+/ObFxy9pe1M/FuUXOsVHiGReQqCYfmIgwYEhudB+Zq2jpvY6LJyhX1YFyWuXqEuDs7l7EgI7nAxqQbszaBdB0++HYpkhVj+gilphyWrObeqCbsushTyw4bKViLPUka5otzbQA2htrt6KzrJNQ5lBjhvZWuXI2f52kW9tyLQ2JAUnohSqBdUAtYFfdPvP9srtchVU3Jwr6K+h6sSozrtX6EGLyco0H8IYoef10moWt/2boIuuhpwONJ1UHvKBP7RIgedJw5ByaHOkrnGvME6iy6x23hZ2gy1OCvRd1unM2Nr00XLV4Q4qsKoOtLQnbyWWPGGVs1X5EB5fJDz+tXj4Q8DVnP81eEmuCIXfuxkRjZaDlFkV4dmYnPENI4aeI23cNTEhprpZvd+OdfQfrnbfFYtosUfVSTVtc3pLxGqTL9H348TwwpVCw+hHOax+U6AXveDOxcibW91dsXmXmiJdWk9Y+UyMv5M7W21pNhL1Z22GOIvyeIfCQ0UcfjoYdfhYrNNLh6Rlq8t0wjLEVampOOKZalKeKocCg16ivya6RXXXSjqUr8Vsp/Bo6IfBxWjWzz2b/xR9R3JAUNU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(26005)(122000001)(110136005)(9686003)(38100700002)(316002)(71200400001)(54906003)(38070700005)(33656002)(52536014)(66446008)(8676002)(7696005)(6506007)(41300700001)(966005)(4326008)(66946007)(8936002)(4744005)(66476007)(64756008)(66556008)(76116006)(7416002)(186003)(5660300002)(2906002)(478600001)(83380400001)(44832011)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RwjX0UuhFzOMRHKym1AxI+R5AzaKBNtva+2Zcij1jkYg9JyAQ4ox8lJCobkP?=
 =?us-ascii?Q?X0Wd5B6eKiNvVLqMVPQiZBTlcMbf2aPefk6k3S2I5BPn5CU3A1VTL/FWk42J?=
 =?us-ascii?Q?j9bhAe58U/NQWi/m6+TUZ5+1Ex/sU8b0mxEiFVv7iufP87y6Kbn/s1vbekpI?=
 =?us-ascii?Q?Ui5D1qlCCer/TmIAFefnFt7IhxqNA8/MlN6xTeoAhVuxcoa4WIZJwB8cHNh4?=
 =?us-ascii?Q?VSCll3VvFDqNx/DhaRhz516ZU8JW+NeKhSZf0XXiFQ6uno5iZ/TJbHHENavk?=
 =?us-ascii?Q?Hec+STE0sGPniBPmzdHo6M1k4hoIBPD9WVPW2GPqOMKvD2vDVRCudEWzPcdX?=
 =?us-ascii?Q?FRn5kj2JKTxr5MTob88Bn3RUZkY/bLjoVBajh03xjAPUo0YdxmrqRr2mqhaV?=
 =?us-ascii?Q?VhCuzZIhZT9G0V43hnoMiWBvv8J84JpSEUqOkIq1MgkaJIDsC26lsAkHdn5H?=
 =?us-ascii?Q?Ba7PKOdzap1Kc7gk3me8tV3il43YIAgBwWI3y1KVm7EgETCcXQe3x2nmr7nd?=
 =?us-ascii?Q?cnHcKG0g+0Dz3arsf02PcoW3fiMX1r5in+MUl4+sWpWIBYPvjrJXu3HDXOi3?=
 =?us-ascii?Q?BGW0fmGA9HGN/qhGt8L0TIKIby8TWV9nobGbZ5toH6hgkxb23h0tj1QdUWAb?=
 =?us-ascii?Q?Gn2FGPdl1eNU2YX2VhOH1+UzlvcJVP/uLJiH/p3dCwkVHx6BKjkk4gstEBMW?=
 =?us-ascii?Q?o0SMGjHcjXb7c8IiQCHf6WpJ//zBbDvbLSAEPZFuamrmFBbmM+bYP3niHs4w?=
 =?us-ascii?Q?/SEbOW+u5Ie5vOJ/TgcAbdzg5BhxOQFJKjgpDzZYpazh+iCQK9A7aj+80GTb?=
 =?us-ascii?Q?JXlr/53jFGUU4pXHGojKdMV30xJSGR1I41eufpUvOcFyb1DbwtMoB+pRQMfz?=
 =?us-ascii?Q?7GsDYvOAVDNmC36VadBWjM0KWPvNNOeXPxTNaPHY1PCC3EMZ45P6mXhMYfBg?=
 =?us-ascii?Q?Ql4CINIUAMJS2lr4tjebf1QlIhBcw3UpVBjMGyiZ4L239w8HZl8fLYupjcId?=
 =?us-ascii?Q?+wuRiHcVneh4pBOvMVjc6DZK+SQJw460GQc0qrxfwalOKb1+/6IHqzOHdPDr?=
 =?us-ascii?Q?PuPa/n7TzF2gkrrivLeXMemLwQwqxmPG3tLwHhBGxO43jJA1ZmHmD1+ibh5q?=
 =?us-ascii?Q?hJzMoA+du0GKqO77upmwEZt1FiyXp2ON5bT1fXnrhV9OUZ4CzZG210fbiSAv?=
 =?us-ascii?Q?zZ0UPnqCkyYtN2wFW6suyPecasf/CWJUpqrHsPGqt9BGVCPFtOL6hsZi+Z16?=
 =?us-ascii?Q?L5J+KlE+Mw8Y/oOR6rQvb9sqUg2uf/Jb0CRn3PSHtJfRvUQsnyan0AhdT79J?=
 =?us-ascii?Q?mIPLhqAD6cBlZFyB3fZpnxXQG/di6oxNPHxWpeXfdhbEsz3t4BRbR/h+DL7J?=
 =?us-ascii?Q?lZHhVJgRfrsWJND+cFm/VgYySlUbr9mbRW0bMCWjMKFKdLz2ZaoMyrYwyjd0?=
 =?us-ascii?Q?GaPuPgkMx4oQLkDXW3610jF5Yp0g12T3g6gJ1ikLc2P28gayGcJBr9ukHDxp?=
 =?us-ascii?Q?XRfII7lLI5uU6Gu4Hgdza+bbc77PUGe1ecYJdONTihAi5w//cFNVvEWm6eH1?=
 =?us-ascii?Q?JiHUSkNAy9836mzzroE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 258913bb-f57e-47fc-8cdb-08da8a6e86c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 10:00:53.7654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aOSoxjiUTT7YeHeInbafQ8JKsKZdsQ/5g7UrwM3AplObc84mGPqNc3nPinqyD13zGJRbIN9L45BsU75XoNMBaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8596
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> Subject: Re: [PATCH V3 7/7] i2c: imx-lpi2c: use bulk clk API
>=20
> On Tue, Aug 23, 2022 at 11:02:15AM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > The current driver only support one clock, however LPI2C requires two
> > clocks: PER and IPG.
> >
> > To make sure old dts could work with newer kernel, use bulk clk API.
> >
> > Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
>=20
> Applied to for-next, thanks!


Thanks, would you also pick up
Patch 2,3,4 in this patchset[1]?

[1] https://lore.kernel.org/all/20220823030215.870414-1-peng.fan@oss.nxp.co=
m/

Thanks,
Peng.
