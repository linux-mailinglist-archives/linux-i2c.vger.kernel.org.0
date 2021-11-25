Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23AD45D706
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 10:21:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348200AbhKYJYU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 04:24:20 -0500
Received: from mail-vi1eur05on2047.outbound.protection.outlook.com ([40.107.21.47]:36704
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1347685AbhKYJWU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Nov 2021 04:22:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGWWKbMtFhE6r/EKpfCTdVi+r33lAVwR0NoJuw61r4xXdKgaiJjONXxtpITVkdKaqhsT4X+ItK0+Ud0PKT5IFV48HslXwgE4AnoDvO83oOYPRGIBvsZ6EOHNQd+ExpkfkqTM92CR8htc7Km6IcrxMdsiJnTcAjZBSP74bE2n49opWyJWnafP2NAN+jOzGOOh65C/UsdL0D+twjoUSFWsX7e6LHSARcBxcd7bJgRwXAfoJvyIrV02jI4CdoAAak4EqPILb3hz6ZLjTvG6r6ToOQftForzBP5yQtLn+y6V7ydnYl1tVteklmLgHdW0BsfaprTEf3BDOL4GlXWWdQFdAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKYrry0tYEHLIUXhX5OO4GvWwX1CWgaNk8irAHDGxVQ=;
 b=ixPDMhK3ZKceVbr79/tmsgT8f83XiA9kghsp0R3Ef4fAFD4V4DGQjUwtTxvNgwdECVbL/CSTcufqLf2Ej1vcIAKIWUIfdz7tSN2LlPq42Z4ZIyayiHrsLtNjpxmhQ+UndlQZb9d1041xIDNp5xWA31iNl1t244xspXodsw/+dXiXr+xndR1+RRPwUkGBmkJu5dxTmQF0LjYCg0KUAfa1KZWv18r4yMmwjvMMf4gcOHpyXO68Qm7KzVoVcv6X+LAmt3zypT5z5WLjOrrwO/p/ktVqZsxpbp3p7NnAlPfb8AsRKks2Q3BGD5XYeT/Fku80L6A+VCxEAKQmQwvlIf+wdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKYrry0tYEHLIUXhX5OO4GvWwX1CWgaNk8irAHDGxVQ=;
 b=cJjcvYT1sXdD3MOvqx6DxE0yNN8AXcsA/IwomrC518NoGH9pR+xgeUfC2O5Y+fvpZYX62XVzok5r3szqRd6NSW1Ea/kWde3P2Mtd0HrCVnyNqBKxQCNHgpx2qg2Oq2DAAZ6NeJJnmpQTDny5F1YueGG939szVHIcjyiAEfgABtY=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Thu, 25 Nov
 2021 09:19:00 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4713.027; Thu, 25 Nov 2021
 09:19:00 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: RE: [PATCH V5 0/8] dt-bindinds/dts: support i.MX8ULP
Thread-Topic: [PATCH V5 0/8] dt-bindinds/dts: support i.MX8ULP
Thread-Index: AQHX3gLDA+/GY3Dq60eK/KNA/FmZzqwT/MmQgAACBFA=
Date:   Thu, 25 Nov 2021 09:19:00 +0000
Message-ID: <DU0PR04MB94178AB147B5DA8C32F1531388629@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20211120113454.785997-1-peng.fan@oss.nxp.com>
 <DU0PR04MB9417A88AC1808CBEE76A27E188629@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB9417A88AC1808CBEE76A27E188629@DU0PR04MB9417.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 386a3918-cde2-4747-1bbd-08d9aff49e16
x-ms-traffictypediagnostic: DU0PR04MB9251:
x-microsoft-antispam-prvs: <DU0PR04MB9251E7DFF9519BA35EB386B188629@DU0PR04MB9251.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ETP7enCnnUAa6wc3htdKzFbZab5JnlrdiChFPrnla1BvaD511KQhSx6rWJRuI48HEoicF79ah1qMJ1QJeRFo479MUlAvbmMkXE7Xk5ajA5R+HSVdRofLAQxHsn3wH+BSr0S2C1yGCVORxDuijNgTDrf3gc23lraZpvY1mXZ0cmw4AWDjJU/bDUlqeW/9ltSt+AClRlSvBd00rqH7eQuhMXk1Wx5ykspfra/LtgZHndfmfj5u8ESIrWoMTz/MDaInZozeHc61nlGrXnjXRbuJ/CIYGaaHrTt9Gmaj6cJHXmZ0wEkw594FVe0bNFNiiqTrmNRCAAKOrQXhaetJeM/qYB61maq0WMCJPaKSPGUp8G9wQqfO/4TxRHxIup1JsgVSeuJLCn7wOUNNnwbTMH/qJyYSSzk0ISuCr9NDw9QdeMWMdMyTTi8eAAT7u4o3Va6vdulzlt2B9GIEfxmhuH038glBDrDfuAGgmZJ8RbpwzILKB9VP1WVaptNfMHWdgggkBwFrVQJwFeQQKfrJyk0wu53Kg9aBuzqcgKMxhlqnM5IhiYDqVTsB1G6R/4eIfEGTESDGatYQrivQqlActoWcm3cdIBid8YgJ9BfbLPHvUllHxNAYtB8BJ4jw7k+bF3Nyzl82kPHyejDgGrDr/+KQtiejhxcPBdrwd/prYnzS1PmaGcL4AdTHwW/7mEJCr5zhfuJKVoZWMSR4+AM8V5Xf2F4pWMf8ILP56WKwKVw8N7BJigAKJfUQJmvn+iICDjo4p4hC29pWXTGkZrj/BKTaJikPY5LjIecYUTlVnwSL4JLmqOpPaLP/bMg9Ur7Qqk6S0FtcPJDqFVv60an2gEhUddGmzpQv9eNQidwSpY4WIPw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7416002)(2906002)(5660300002)(2940100002)(55016003)(6506007)(83380400001)(4326008)(38070700005)(8936002)(66556008)(66946007)(508600001)(921005)(316002)(76116006)(64756008)(66446008)(8676002)(71200400001)(44832011)(52536014)(9686003)(186003)(966005)(122000001)(38100700002)(86362001)(110136005)(54906003)(33656002)(7696005)(66476007)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6kJdMMURD8XfykM9Aj/30IV+AucqSHolxuQdB7afdGDX/fMGxIQqvYpcYgUq?=
 =?us-ascii?Q?EGK/JyBSEc2xj07dEDS3NgjtBwU1atEBYax1pAAGJrrsUzSIj3BQTAz/ZNgb?=
 =?us-ascii?Q?uLgtpWjGsjMmQQq4REFIhTzWT/Uj/HuKZLRrBAHxtuaRiWS/NogSHJT565/w?=
 =?us-ascii?Q?SK/u5hOG9uEWQ7OMyBOBswdsQPoVcjrzL2bojcRV78cJOGjzbS2B31iR62oo?=
 =?us-ascii?Q?A5UzYGcdDZx8f7iNp+a1dgaEDoqWLBX88u6IC5hu4bzDbaMBoi+mqU0muQD/?=
 =?us-ascii?Q?t8Apt9ceKH62+Fa+UKaKkT8TDiY7WBSU7hPi3qvC2jeJh6DJkHkKDw5koLsW?=
 =?us-ascii?Q?y05Oc3VXfp9rDdVy/fNSypeJkKpvwg+lWDQnJYZ8vLDwilvcdqU5e9PUI4DF?=
 =?us-ascii?Q?YZHXZAzVp2fKpMI/+l/B6bov3r7I0jFmHOAMgSZKKgtrAJfFo6s73p/8WMCg?=
 =?us-ascii?Q?U9qQuSmJ/TvcpEAg+k2YtbFCKErREQNllmhi81RBfZGN3I4zqzbdn2m9uGCt?=
 =?us-ascii?Q?IhjATuwgYbeDh8vt/0gkslMxyRHpVr1pX+V4O8/0GI7xZeHaXI1Xj0CGaPOx?=
 =?us-ascii?Q?BrQJMnaTp1I4eOqcQ3lTnqd7fdTpJgOeJEesMh+1vv5epZRZ0E62HN8047kf?=
 =?us-ascii?Q?a3rJh6f2aaVADxE9xKAlw7+ZL4oFuotXCPOR1T8v4jYXvdsJjYtU22ZawYem?=
 =?us-ascii?Q?+vgTAAA4lbtLW88fYXMfjvCff5KM/C/e1B/CzrQ2RNB2Lcu0/uB+Q4jigYVs?=
 =?us-ascii?Q?apptfFCcASDlMgfa6f5WwvFNObfH6TYmN7cPqT7Ihkb1nyVn702e2A3B8doz?=
 =?us-ascii?Q?ZTmhFo7ijt270u3TfMzENKUjFdauJArfEICNy/+hr0cE1J7Vqv8R0uwkQFod?=
 =?us-ascii?Q?Dud7teekqgqKIJyFvI1xPTx9QxYS1OaleeLftVBN1STRCniYohMORhmF7fyi?=
 =?us-ascii?Q?zCWkjxMhAjsdu/WjYS1Tn7jDocaRVass4KLYMCKLqEdbEhPIjBb+M2daR6tT?=
 =?us-ascii?Q?3DT0BNKkMrRalHhGyQM0PIB0oKxEDHDVdxgMozQdEcFLDCzGUmV783zP0nX9?=
 =?us-ascii?Q?xbcKPjfzQtdtCIyPzGb2P+r7EQExiUi9LxjjfADx+xPDfSHjfWsAtWBW/3u4?=
 =?us-ascii?Q?6o2jU4lPlRBcc3Brq6EAPfhkx5DQ690e2jI9MGZkDBwu5pg8l99arH1z3Qgv?=
 =?us-ascii?Q?MeFs1QZaObjQFoCy2lK0Q1P1kCLzeQXIX4LayF3Sl1Cd2iNasN3sZ0P40TOk?=
 =?us-ascii?Q?gQMzxjdySkF8V6wXoWw5vrQMna04eUJUXk+MJZ+j9w3913P9FI8AJkP/VRx5?=
 =?us-ascii?Q?TjqJEMfh1+l6Tsv9l4Zmt5tQq/up4Pc7KabXrjj48B6IBfI27gA4hdT33GpY?=
 =?us-ascii?Q?UiyHPL+WmWVuOwg4XJEXrn7m2P9UpALSjFRI5CYPm6W/Fjr3Tb4xZ9zkkbL6?=
 =?us-ascii?Q?uFSaIADOqapZbBmcPdHbHrjJ+dPZ/PzFN68UJstzTzxxlq8/qCGlVCn44kCF?=
 =?us-ascii?Q?Xd0LuT9rGhpVcFLxO/7DUIoLNggxf29JZ/pX6C83WZ63217RgPQ8Xd+MU4PE?=
 =?us-ascii?Q?cFokriIgc/2lUd8sbo//95+XlvFeGhhZ/3tyPdkl4tN7Hy7RnDCQq3NWLhW/?=
 =?us-ascii?Q?ilYwyPRFkOhe+kqm/oOpwTU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386a3918-cde2-4747-1bbd-08d9aff49e16
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2021 09:19:00.7441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pYpRyhEXAcILRm8h9QkhmiWOXa2Mij95iCypu6eDLCoVLIHpc7u1YgBFVN/ZRqqP6VOfhUjCojmPZ7zSjqL3+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9251
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Subject: RE: [PATCH V5 0/8] dt-bindinds/dts: support i.MX8ULP

Seems there is conflict after Abel's patchset in next tree, I'll rebase.

Thanks,
Peng.

>=20
> Hi Shawn,
>=20
> > Subject: [PATCH V5 0/8] dt-bindinds/dts: support i.MX8ULP
> >
> > From: Peng Fan <peng.fan@nxp.com>
> >
> >
> > V5:
> >  only fix patch 8/8 "arm64: dts: imx8ulp: Add the basic dts for
> > imx8ulp evk board"
> >   - Correct bus-width to 8 for eMMC
> >   - Drop pinctrl enet which no user
> >  Drop patch 1/9 in V4, since in merged in linux-next  Add A-b/R-b tag
> >
> > V4:
> >
> > https://lists.infradead.org/pipermail/linux-arm-kernel/2021-November/6
> > 960
> > 20.html
> >
> > I just pick-up Jacky's work, rebase and send out V4 based on Jacky's
> > V3 patchset.
> >
> > If you prefer to split the patchset and send single patches, I could
> > resend one by one.
> >
> > Note: the V3 has a gpio bindings patch, it has been separated and sent
> > to gpio list in a single one per Linus requested.
> >
> > This patchset is to add i.MX8ULP in dt-bindings, introduce basic
> > i.MX8ULP dtsi and basic evk board support.
> >
> > The detailed version changes are in each patch.
> >
> > There is checkpatch error in patch 8, but that is for device tree
> > macro and we could use use "(xx)".
> >
> > In V4, the changes are in patch 8, 9 when rebasing to
> > linux-next/master ,fix build errors after the clk driver in tree and
> > drop a few nodes that not have bindings.
> >
> > Tested with CONFIG_CLK_IMX8ULP and CONFIG_PINCTRL_IMX8ULP
> enabled.
> >
> > V3:
> >
> > https://lore.kernel.org/linux-arm-kernel/20210625011355.3468586-6-ping
> > .b
> > ai@nxp.com/T/
> >
> > Jacky Bai (8):
> >   dt-bindings: i2c: imx-lpi2c: Add imx8ulp compatible string
> >   dt-bindings: serial: fsl-lpuart: Add imx8ulp compatible string
> >   dt-bindings: spi: fsl-lpspi: Add imx8ulp compatible string
> >   dt-bindings: timer: tpm-timer: Add imx8ulp compatible string
> >   dt-bindings: watchdog: imx7ulp-wdt: Add imx8ulp compatible string
> >   dt-bindings: arm: fsl: Add binding for imx8ulp evk
> >   arm64: dts: imx8ulp: Add the basic dtsi file for imx8ulp
> >   arm64: dts: imx8ulp: Add the basic dts for imx8ulp evk board
>=20
> For the several dt-bindings, patch 3 has been taken by SPI maintainer,
>=20
> All patches have got R-b or A-b tag.
>=20
> would you pick others bindings or they should go through subsystem
> maintainer's tree?
>=20
> Thanks,
> Peng.
>=20
> >
> >  .../devicetree/bindings/arm/fsl.yaml          |   6 +
> >  .../bindings/i2c/i2c-imx-lpi2c.yaml           |   4 +-
> >  .../bindings/serial/fsl-lpuart.yaml           |   4 +-
> >  .../bindings/spi/spi-fsl-lpspi.yaml           |  11 +-
> >  .../bindings/timer/nxp,tpm-timer.yaml         |   6 +-
> >  .../bindings/watchdog/fsl-imx7ulp-wdt.yaml    |   7 +-
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts |  64 ++
> >  .../boot/dts/freescale/imx8ulp-pinfunc.h      | 978
> ++++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 396 +++++++
> >  10 files changed, 1468 insertions(+), 9 deletions(-)  create mode
> > 100644 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> >  create mode 100755 arch/arm64/boot/dts/freescale/imx8ulp-pinfunc.h
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> >
> > --
> > 2.25.1

