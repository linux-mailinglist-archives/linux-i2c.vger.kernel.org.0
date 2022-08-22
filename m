Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 146B059CC49
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 01:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232281AbiHVXhi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 19:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbiHVXhf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 19:37:35 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130043.outbound.protection.outlook.com [40.107.13.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 870B6564E5;
        Mon, 22 Aug 2022 16:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CfMtt8PFClzYtIYIoRrTZWDREQ0SE4bYR5Hv4x2yN0svab19eIIbf7T2rv3C0RGagel94e+/gXnuLexS7d3YpJQxA2SgeHbC3q+ymIydN0jlQILTOMc2gRAcNr8ijStOthnNQBJoomF81Jf9L1Q+4i4pDOejioPOQDnYfzsEg2RaIighJY3fIyZ6uBaytRd2iLJPwNvrNs8L5cQOI6w1UbTiOSHgMyilLyt9mT+d10wcOGLeqHwjUyEV/1vNXz09qXQllLzeDpyC+N0Be6e+zXEDHIbsZfsizzbhM+f7OQ9QkxDrB06FHm8QgCFNUd/c9oJ7h+Xfe6kHstngIHcXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ISPh1ZPlDpW9Ps/xzEskmkgo/NyNCMsY7pYAsjfeBc=;
 b=UpyCWwnJoCK6mLYiwPjWVwP4e0Y9SVSUHzB/pj1lvXah6/wmLFnVN0lfl59AweBny2hqHGDUTZ4NoAm9YxG1/OEUomzy2Jkc2VSxLAFLBjO+hrbdBr8SdONuun+iPeBM1xK+rdZ2EWcJQCRyggNqvLVhxvvR5cn9OddAj2yQmRAGUFs3zPYDMPjtQ4ZTOqs5tZUnYhWCY1/Nq1XOT8/tz5I2NV1/BIuZEUazshgpNsfF3e9tzaLJqspu4oGfXX58Wap1KfP9cldriaKuB0tmBwJUB0BfHC6ffGN0DmEYkFM7fb2sW5oydqVdiqmdNvkt0m6sqqMA/ejxz3YfYPho3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ISPh1ZPlDpW9Ps/xzEskmkgo/NyNCMsY7pYAsjfeBc=;
 b=GT2pWpiPaM3NOwYU3r9mOFOYKkWstRLQDA1lDIls7lMEpgzP0HMM9j4DpL0HIelts8opSoH3HrzgaJbrv2AB9BBnRJNZvSR4MEOr4GaNAceGdEDvyiYKqFjWBecihjcN0bSg1y1NXzvezVZf/8gtoCh9JmBAJS3bjRSMUTSyfZs=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM8PR04MB7907.eurprd04.prod.outlook.com (2603:10a6:20b:237::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.24; Mon, 22 Aug
 2022 23:37:30 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5546.023; Mon, 22 Aug 2022
 23:37:30 +0000
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
Subject: RE: [PATCH V2 7/7] i2c: imx-lpi2c: use bulk clk API
Thread-Topic: [PATCH V2 7/7] i2c: imx-lpi2c: use bulk clk API
Thread-Index: AQHYsW9OLX/xh9ynfU+9MFyQwplpyK27h3MAgAAVzlA=
Date:   Mon, 22 Aug 2022 23:37:30 +0000
Message-ID: <DU0PR04MB94179E214899F218337A0A2588719@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
 <20220816125526.2978895-8-peng.fan@oss.nxp.com> <YwQAzBUuFvGUlrmX@shikoro>
In-Reply-To: <YwQAzBUuFvGUlrmX@shikoro>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fdc6f4ea-d27e-4b36-3176-08da84974800
x-ms-traffictypediagnostic: AM8PR04MB7907:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KpiPolHAZ8wfz9KiSqmmXzZGT0qGjhO55OeedtuWUEdJbJ7s3vYRKwUw4h1s6uCs9d2O1+nFkrwAHJb5TL7bRCC2IZzhwdAqAyLFGoej/uqJbaUyoBjlISF+q71mfyJR8juvf4EUMVMulE+ZUWurL6ZTfjfPcngxWghEvXqTCeG8rd3yGT3Kw7SC7Jg2e37E2SUNDj6n//yL8YlSiROj7gA9k2f4KcjyP/ZPAbCSk6yY4eBQdUZF7D3slSGtWVe4ss2OmjjYkPEhAIlFXYmSrvFiEwi/ooeBs3cOwsDj9DFWVxYx21a7gdmug0YP3H5ZMpLCsMHzJ7V1/Bl4Jsfw4JeSecmti7Ad954rw1EQn8j5JsBxKUTMhdS3Ubtc0tMX91Vz7x/55O1t4O2mSDVsIPMr2lpwAUyyOqjpPJYU3hXTkImtVv2cJ8avL8TsB7aMq63i1aSQ9ND9gxIP8DoX+Vr7dd4kBELDkgvNn6ws/RfFXlRG7tMblQCssO1xqIJIN/bOk1lRxXuuNtJIfN1pDxcQ1ReaamVgaf0POeQ+ObBISDhKR2EKVkUNaTTYu4aAMCmyumi5wYU5Z6ubvcC2+5TPIBmScw9IfJ+YY99qVpK4h6HqAxZWbqO0hSlv+RfHnKyBXXYHvi/8fCY/DIRf6BPg45NMN+bbNOITyBuqlRzJ6UbRB5w1+j+/GWmhU0NVgAufcgKvZHZZcAaZyOTQp1S5RZzsBlFh8IAFv2ohT5pOfRpHNz53Cw4hcDfRgGp2smydXvQgpTftW3b3oOlVLA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(8936002)(7416002)(186003)(5660300002)(38100700002)(52536014)(2906002)(110136005)(54906003)(316002)(33656002)(71200400001)(122000001)(86362001)(478600001)(44832011)(9686003)(38070700005)(7696005)(6506007)(41300700001)(55016003)(8676002)(4326008)(558084003)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tw362STKmnK7zPUQwQwcoj2q4HhiVSHfXrTTFUvOsEJKVtyGkdKorxvRGyUi?=
 =?us-ascii?Q?OlsNOmJCdDMatjW7SjG2ad/h0bjDnVsbusoXoaTG/MV+Kvj4D4vfJq3G0wv6?=
 =?us-ascii?Q?tb3OcsFGma8j2zQXsH/g2PGIWDmmTMDsc7DcjEE5bbqTUjPzBISfb/LtFleL?=
 =?us-ascii?Q?uiRM2oddDI5wirIlNMUEcucxyX2oN/NULIuZNl2tWirn98tcZSPFcHxOg+bM?=
 =?us-ascii?Q?EXylUzKHb7QYg021hAZeZC8oshsAcmzj08dpYB7WSjO+YfB7rLid9c7u5nLH?=
 =?us-ascii?Q?L54DnQz8ZxRy+l99ZahZMn45ATQ4J5jTtmFFm/0xB9Q/G4siB6BNH5YGVc2p?=
 =?us-ascii?Q?1Ofs37MjVGTBEp5SEZu2ZeNKz3z7xWstHrmejzLz1HjAKY46QBct3FH1NGTH?=
 =?us-ascii?Q?XfRdybd5SXpiTDglDpSx5fDDKJizBPDo2fJsJp075Rhu9wg9nqh6ny5kSIhy?=
 =?us-ascii?Q?L0Z2zYPmEXYd92+tLJ18qK3sZB2+BvMaR43wCLBw8xrrirOom43Q4crLIQ+t?=
 =?us-ascii?Q?xVCPFWoA9pXZgsLKPipS+SkB3/gNHdiMdkISH1UuHSrUE7pCHqDmF2YeGGiy?=
 =?us-ascii?Q?Qc9ZpCJIg2inpYL+UWNEsBp5NcXJGLdEkIjYBGXNiSHx8+AxV+2FyMIBFyPA?=
 =?us-ascii?Q?EgQ0VdaG9L+aH8LmDRIFQkuepNMTnzoYrKAxSywcb7n/n/CHOWMfvLcrFD0W?=
 =?us-ascii?Q?TuxIk84YDHkvxh3AC6AItP0ai4JwoaFk4Vs+AtWse9FrCVEb9j1ffenJKRIA?=
 =?us-ascii?Q?GT/Buqf5OR0OkdfRlivV/ZXjV/mHkGI0dF4ELvhiJj4t13fI9ttep8EhNOHD?=
 =?us-ascii?Q?n2OrQlS1Nd/lvmzMfCD+nHrrKDTDJgA8BgGs6H+mFCuFdsZuDHLymXaZPj15?=
 =?us-ascii?Q?vOfBjmYLI5VMJJ3WI7NKr+ap6CBieoj4iPVqlciVjV4uMsAOImNCRdGOLsuk?=
 =?us-ascii?Q?68EmdvcKi/oxnVyeTFS3cIMtiNJWf5qc2kfHIE0q0Tj9KBN1Yi96DJ6LyA78?=
 =?us-ascii?Q?xGGJ0By2Te50GRHghmQqgfAAFcmWgrAtnZdnLfImNoF1ilGVP4ZE+mvv0uN0?=
 =?us-ascii?Q?o/GekZ0cPs6XsNKLlpQbY7yE/a8lACkDo/sJkf4ykWhfSeDaUvSk+FPb/G+E?=
 =?us-ascii?Q?Y51qtPo96V7Mh2d8WgQONAOhspAZq99eWmxUpoYT06ArGTI9T0aR9V6b6FUQ?=
 =?us-ascii?Q?s9MluJcdtvvaRUIlRNfiveyAsorZJhLr1QhcrMB/3btwLVosieZuz6xGtuvO?=
 =?us-ascii?Q?OsD4TWm2q81ZaHy3U+hjlk5DuuX38yDuSSRnoFZET8WgbsSzcfGac2pdP7/6?=
 =?us-ascii?Q?ssfVdkpQIvu5F8QdFjcdnpvf/sRPE4CYrdIy5qmCVIbVotuzuHWVvhWTLK0i?=
 =?us-ascii?Q?2tBGWW+Kc6XoXswwFRS1Aulf4D0SZ6nyAWzd2uTY3R0xOMCsHTn4xWNpdy9h?=
 =?us-ascii?Q?dESQIwOYGOrODi7SgXlaMDylZNq7fqyMLXj06Qkx0yhPFBsho6X+yCX1/ro2?=
 =?us-ascii?Q?ccHgl/1XydIMEQNFzYgcG+F6jfSNk3XbFEBNzHImkHr9z095ilXUgRpKgGyd?=
 =?us-ascii?Q?7WTt+oODzdRO943/3+A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc6f4ea-d27e-4b36-3176-08da84974800
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 23:37:30.9090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wP3WZPVGK8kO2Qfb8o68kMA9APM3tjDXgtcNGGVb08QmvJHBDGfMCyL4GkU7JLUjRM/WyQ/yXgleWYad3uwqbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7907
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Subject: Re: [PATCH V2 7/7] i2c: imx-lpi2c: use bulk clk API
>=20
>=20
> > -	clk_disable_unprepare(lpi2c_imx->clk);
> > +	clk_bulk_disable(lpi2c_imx->num_clks, lpi2c_imx->clks);
>=20
> Why is there no 'unprepare' with bulk?

My bad, will fix in V3.

Thanks,
Peng.

