Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 547C1468F7A
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Dec 2021 04:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235441AbhLFDEo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Dec 2021 22:04:44 -0500
Received: from mail-eopbgr150045.outbound.protection.outlook.com ([40.107.15.45]:13888
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235402AbhLFDEn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 5 Dec 2021 22:04:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJNOqEfl3QlKc0+dAqTjkxiQRWmrPv9IYsLrWI9dVDoTLqZXcqWqFFeI7Ka/W6h2H5UlgKbP+JlS529jrXfMaH87PnJj99acgjbCGvF9J/XJqpTQzLkP8a1xEGv7GcAKxZwRROdZSe3Cfv7p/5Nfka3uZqilgLqz1WQc8VeM3F4NitGi+859Zgh3Z2eLqy6/t/EImDW0PUsNMwaJkI8mS3IkslTEnGTtjfAnCIzh0UcmNmf4Hy1tEudSJFYOJoU3MjQmG/nbp6dn2uSY/Zoreai+rIPvfSpeHsmryx6KL31RwxzbJARzJjC9hGM5VaM+RWxOegekTTO81Nj2t60kPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DHZzg4DFU4EmrjYHbI/xC2wGrksoeNNHgj1ymLPQKQ=;
 b=QETx4/dISLibj2uaJXe6VXZkSrDHgkyuxq2IsBfQOgs3ilcNvQwLlhGkB79cMUKkb3IOC2kDbbtJcdLwqN1Usb1n6h+r60ub4NWqFWucKFUcCk6+HP78CaTNqlSJyynDG0tLfwIkgaUS95QuAkjq14fcX4ofCGT3QGXd4sx6Tg+gLSrR5X5U7O/hoBW3YBkBo/OmjWQiZzQKccP0QDFUDuCQxxAmukIEQBaUz0S4xYgwBOcX4b5atcqhHHfE0nIo5YOiJBG/Q1HqIMMuWMvtZRZViLYyyGL3CeVpd10r6BKG59gIqUzM/b5nimQdcygVxkT02vPxELt/X+erwkE8+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DHZzg4DFU4EmrjYHbI/xC2wGrksoeNNHgj1ymLPQKQ=;
 b=VcJOarNApBscX1CSDjefdXF7slKbwbA08+umxeZT8K/xmFG2Z5JOonjT/Bvj+PDPdKiSPnS/tQCQzCHo7EFVcrCgsoBjMQt/UoSU7JNDWv4m49TQgehoicF9IWgpZiLLnoOO1gw3rnz24xR+NjdsGR58S+RPR2XB1yq91pzsdbE=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8663.eurprd04.prod.outlook.com (2603:10a6:10:2de::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 03:01:12 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 03:01:12 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
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
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Jacky Bai <ping.bai@nxp.com>, Rob Herring <robh@kernel.org>
Subject: RE: [PATCH V6 6/7] arm64: dts: imx8ulp: Add the basic dtsi file for
 imx8ulp
Thread-Topic: [PATCH V6 6/7] arm64: dts: imx8ulp: Add the basic dtsi file for
 imx8ulp
Thread-Index: AQHX4pkKJjOhqskGqkK5FleueoM1aKwkyYKAgAAKDgA=
Date:   Mon, 6 Dec 2021 03:01:12 +0000
Message-ID: <DU0PR04MB9417E13BDD27E6B7D4430265886D9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20211126074002.1535696-1-peng.fan@oss.nxp.com>
 <20211126074002.1535696-7-peng.fan@oss.nxp.com>
 <20211206021700.GT4216@dragon>
In-Reply-To: <20211206021700.GT4216@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3bb2bc0-f073-408d-680b-08d9b864a973
x-ms-traffictypediagnostic: DU2PR04MB8663:
x-microsoft-antispam-prvs: <DU2PR04MB866354B6DBF14A958CD32693886D9@DU2PR04MB8663.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DRN0kU+618kzym5RYg8BTgJr4u7KpJ3Kl1xeKWxW7gs3kqqQ8EXDvNeyzcM4mL3139OxB1d+UY7dIfSYNVq2ymarxSXa8um9WLUvrmZURJdU6JAyt8s8PdpUglHyuYKM4hEBY3E5KuejqSJiT2OAZ9swWWc738hID/iMdH9b4A6JUT1uvpErt6bJLjTjxgstWGPDmay9w3kCoNyRUmQCRh33eICYH2RGstEAwLsUnMk9nUfMR40IfGQ2OdAaCoeA0UvS280hp0y9zUcveERF6eAxFTrjKPb6qWXIWSE3QOkJ4EItL7JXrIOcXnY5mcg7f8b5Bx4YhlaRXINKUWnkbGVNsnKeW1q+QjonOvB5RFa4xb7B0RpfBCYZ3g47aCYDEWD4OOz1vgSQ2oXARrG6IhcY7nxKJdBOZUCx1AHALrlIpJG22yyGRaJzkbjSGi77We9HCsk5F70uABCmPNZmqhk+Ouz8OmKlIeyHEiO6gg8qNKpUtwyKhHzL240os2b2OFHaFfKeQUwA64QycFR4yN/I2zyJGjy6SidthkCI6H1vpg8ytAoBLKSkdNlxTsTQnB9U4Tm7ofE/6KvIhXMf91y9mq6k4CS4EsTRooaCE2Adfcgl+xsgE2D9uAxki5DVIXiAaic818495wTMu3cFoWBL+nc+zdjRbHNHXaytAsDK4pyj8homV+iHHVtuIyBmMHP9oSRW9niAGCv4qIrdkjSx+mRBhoMPdT+n3UEB1GI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(86362001)(30864003)(44832011)(316002)(9686003)(2906002)(8936002)(54906003)(7696005)(66446008)(66556008)(66476007)(66946007)(6506007)(508600001)(110136005)(64756008)(8676002)(33656002)(4326008)(5660300002)(38070700005)(38100700002)(122000001)(186003)(55016003)(26005)(52536014)(83380400001)(7416002)(71200400001)(32563001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KQHIjNt0JSKEyetFgQIEBG0lh8rwo8SZTSIoaFN86K3BrSdeJ+yDSs0u6zXD?=
 =?us-ascii?Q?kAFmxBKmnXoj3ISPkMvmxWtzH6Co5IWUugjZXHbbQO1KmA2NB3WGKBu+Zs2A?=
 =?us-ascii?Q?LDEAHt5w9w/j67nBHA9MHbPKdI0lrgTCt4d3jF7SnkQ23Zmn1Vo4eCPM0yxb?=
 =?us-ascii?Q?mtOw3mg0osSX25lTt/VsG6pLXoET7Wt7S3No+lBtgJN4/wZu7XRfvVx/NmZ6?=
 =?us-ascii?Q?gfcMGojYe9gbU1XHsuN5E7buYZWKMH5TJUeqfwrsQD7qrevVcz+N4KUTm9xx?=
 =?us-ascii?Q?AM1gNdZXC4eTvyCiPRWqwwb/Tx2NcL5mh5REQDYchxlNds3yiWPJmB8pQl0o?=
 =?us-ascii?Q?Ch/JxwTLiRpaeKcNvD1YJfgpu2OmjaPfznDW4P/aYuFIn3chuBIP3Uxhc1yt?=
 =?us-ascii?Q?NZq1IsRNoblN/wuToky/7zXSwot+dbGQzPd/doABSeLCs1H0h9+T59JHFIey?=
 =?us-ascii?Q?BIQUIjIIU77aAeUszjIStWJRjAsrk/6/uJp8ckOMJUYDSw6hZTbYRSg3mhpj?=
 =?us-ascii?Q?njpTknTibPGvlKWf3QH8heSrPZwEr8HIpwhhzWCWyEM16M81m5cRiROPpI8R?=
 =?us-ascii?Q?LZRb1ZcvTBL6pg9MaFl5CXx5q+mnA532zwgSd19y52FuirnlE7CcUPlM88cc?=
 =?us-ascii?Q?aFsxp5o3W9R0uOlZ2SWWJmXZqVWuaD9Llrpg4CH+RfFG5UXT9OSwFLmwcLge?=
 =?us-ascii?Q?CF5Tuk9CxX3WYbkrA4rrkR+XgEjzAEiQXsznoNU9J48Z46kevhIdB5AyEeJ3?=
 =?us-ascii?Q?Xwcv8gMMoT3x/jnWDYHwVy1hvplOGwLHBoq0yBHmklodvBIWhNYH87+iY5Ba?=
 =?us-ascii?Q?NqLKFNjcAGxjabQQbJdJOI2Qp4ylGqusU8JjLvtQsq/YXqrm9iDV1MqJT9LR?=
 =?us-ascii?Q?VhpqQt/4knG/Mt++13sXmFaZSPWXBjOMzJLPXAfQfUiSE+Loq16MYgA1oovc?=
 =?us-ascii?Q?g/yushhIb8mhFRqMSgz8UrmaSgAplu/PwrEuZyfiZh4RzGNMCUVhq0BadbSb?=
 =?us-ascii?Q?Gbb6aDKcBlK8L7vp7aReefwl/kSMh0CnG0em9bxHUTD0VuQDBi7fsPHPPz6E?=
 =?us-ascii?Q?f7qMWVOZAPrOaK98VMS3uquTfGOZNCsDF24e7EwiZ57NacU0a8lE5Ln9G8nO?=
 =?us-ascii?Q?fblLpZ6YVF+ZAfa9lV5WYci0zn8yI0nNyWonwIGHfg+pCgqnst9okXrrCkND?=
 =?us-ascii?Q?trtQipkJD+LBwX4QAUv7fLXI216X2rm5e3mQNQOyJfD4YeetDh1YP58m0Dgq?=
 =?us-ascii?Q?jIbNYN1XiRH9A6slQz/sXpRR8cWqDSuQb991Lq26zdJys2n/KSBusSm0pLG5?=
 =?us-ascii?Q?TDnYttDBsh2pkBPeNNdgPUvfaW21/78ZJTsLaW0+NA92nKHhzeL5ACae/SXJ?=
 =?us-ascii?Q?6pm72UjN/+r9c6c78mLS0n0w8dPrJAo08w2CRWeNBZaabbpot9dJjbsV3qgi?=
 =?us-ascii?Q?SlKzMRypg04yEMGbrOn+XpIiVuOqYm28r4R/Y61ZKsRHzSiP52Je+jVPOWOu?=
 =?us-ascii?Q?6JiPzfz/exHp68qr8GOCOHEzp751WiTNH6yoB11EMy93yO1DG3iCh+VoJQfX?=
 =?us-ascii?Q?Lk4B9XReGH8JxQul5ogSEfhJjnCx+HKq/YQFkn7yPHm432ia5GzTxp3Mg0fr?=
 =?us-ascii?Q?RWbCCuyLGxmHj/RVURWUYlc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3bb2bc0-f073-408d-680b-08d9b864a973
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2021 03:01:12.6061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B8LOc1lsQTo/E59DVDAQg6QvZkwFk+5z886nGEobAG1aUvzCr3sy4NnQppK4Ovh51wo1mPvqZJ8GvFSzS4ALKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8663
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Shawn,

> Subject: Re: [PATCH V6 6/7] arm64: dts: imx8ulp: Add the basic dtsi file =
for
> imx8ulp
>=20
> On Fri, Nov 26, 2021 at 03:40:01PM +0800, Peng Fan (OSS) wrote:
> > From: Jacky Bai <ping.bai@nxp.com>
> >
> > Add the basic dtsi support for i.MX8ULP.
> >
> > i.MX 8ULP is part of the ULP family with emphasis on extreme low-power
> > techniques using the 28 nm fully depleted silicon on insulator
> > process. Like i.MX 7ULP, i.MX 8ULP continues to be based on asymmetric
> > architecture, however will add a third DSP domain for advanced
> > voice/audio capability and a Graphics domain where it is possible to
> > access graphics resources from the application side or the realtime
> > side.
> >
> > Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >
> >   - v6
> >    rebase
> >
> >   - v5
> >    Add R-b tag
> >
> >   - v4
> >    Fix build error after rebase
> >    Drop usb nodes and alias, drop fec node
> >
> >   - v3 changes:
> >     no
> >
> >   - v2 changes:
> >     update the license
> >     update the compatible property for usb related node
> >
> >
> >  .../boot/dts/freescale/imx8ulp-pinfunc.h      | 978
> ++++++++++++++++++
> >  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 396 +++++++
> >  2 files changed, 1374 insertions(+)
> >  create mode 100755 arch/arm64/boot/dts/freescale/imx8ulp-pinfunc.h
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp.dtsi
>=20
> <snip>
>=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> > new file mode 100644
> > index 000000000000..fb8714379026
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> > @@ -0,0 +1,396 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2021 NXP
> > + */
> > +
> > +#include <dt-bindings/clock/imx8ulp-clock.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +#include "imx8ulp-pinfunc.h"
> > +
> > +/ {
> > +	interrupt-parent =3D <&gic>;
> > +	#address-cells =3D <2>;
> > +	#size-cells =3D <2>;
> > +
> > +	aliases {
> > +		gpio0 =3D &gpiod;
> > +		gpio1 =3D &gpioe;
> > +		gpio2 =3D &gpiof;
> > +		mmc0 =3D &usdhc0;
> > +		mmc1 =3D &usdhc1;
> > +		mmc2 =3D &usdhc2;
> > +		serial0 =3D &lpuart4;
> > +		serial1 =3D &lpuart5;
> > +		serial2 =3D &lpuart6;
> > +		serial3 =3D &lpuart7;
> > +	};
> > +
> > +	cpus {
> > +		#address-cells =3D <2>;
> > +		#size-cells =3D <0>;
> > +
> > +		A35_0: cpu@0 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a35";
> > +			reg =3D <0x0 0x0>;
> > +			enable-method =3D "psci";
> > +			next-level-cache =3D <&A35_L2>;
> > +		};
> > +
> > +		A35_1: cpu@1 {
> > +			device_type =3D "cpu";
> > +			compatible =3D "arm,cortex-a35";
> > +			reg =3D <0x0 0x1>;
> > +			enable-method =3D "psci";
> > +			next-level-cache =3D <&A35_L2>;
> > +		};
> > +
> > +		A35_L2: l2-cache0 {
> > +			compatible =3D "cache";
> > +		};
> > +	};
> > +
> > +	gic: interrupt-controller@2d400000 {
> > +		compatible =3D "arm,gic-v3";
> > +		reg =3D <0x0 0x2d400000 0 0x10000>, /* GIC Dist */
> > +		      <0x0 0x2d440000 0 0xc0000>; /* GICR (RD_base + SGI_base)
> */
> > +		#interrupt-cells =3D <3>;
> > +		interrupt-controller;
> > +		interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +	};
> > +
> > +	psci {
> > +		compatible =3D "arm,psci-1.0";
> > +		method =3D "smc";
> > +	};
> > +
> > +	timer {
> > +		compatible =3D "arm,armv8-timer";
> > +		interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* Physical
> Secure */
> > +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Physical
> Non-Secure */
> > +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virtual */
> > +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hypervisor */
> > +	};
> > +
> > +	frosc: clock-frosc {
> > +		compatible =3D "fixed-clock";
> > +		clock-frequency =3D <192000000>;
> > +		clock-output-names =3D "frosc";
> > +		#clock-cells =3D <0>;
> > +	};
> > +
> > +	lposc: clock-lposc {
> > +		compatible =3D "fixed-clock";
> > +		clock-frequency =3D <1000000>;
> > +		clock-output-names =3D "lposc";
> > +		#clock-cells =3D <0>;
> > +	};
> > +
> > +	rosc: clock-rosc {
> > +		compatible =3D "fixed-clock";
> > +		clock-frequency =3D <32768>;
> > +		clock-output-names =3D "rosc";
> > +		#clock-cells =3D <0>;
> > +	};
> > +
> > +	sosc: clock-sosc {
> > +		compatible =3D "fixed-clock";
> > +		clock-frequency =3D <24000000>;
> > +		clock-output-names =3D "sosc";
> > +		#clock-cells =3D <0>;
> > +	};
> > +
> > +	soc@0 {
>=20
> Why do we need unit-address @0 here?

I found there is patch which adds unit address, so I think we need @0 here.
commit 951c1d37f691027f149bbc58bbf0c207450a3654
Author: Fabio Estevam <festevam@gmail.com>
Date:   Tue May 28 16:00:21 2019 -0300

    arm64: dts: imx8mm: Pass a unit name for the 'soc' node

    The 'soc' name needs a unit name to match its 'ranges' property.

    Pass the unit name in order to fix the following dtc build warning
    with W=3D1:

    arch/arm64/boot/dts/freescale/imx8mm.dtsi:203.6-754.4: Warning (unit_ad=
dress_vs_reg): /soc: node has a reg or ranges property, but no unit name

    This also aligns with imx8mq.dtsi.

    Signed-off-by: Fabio Estevam <festevam@gmail.com>
    Signed-off-by: Shawn Guo <shawnguo@kernel.org>

>=20
> > +		compatible =3D "simple-bus";
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
> > +		ranges =3D <0x0 0x0 0x0 0x40000000>;
> > +
> > +		per_bridge3: bus@29000000 {
> > +			compatible =3D "simple-bus";
> > +			reg =3D <0x29000000 0x800000>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
> > +			ranges;
> > +
> > +			wdog3: watchdog@292a0000 {
> > +				compatible =3D "fsl,imx8ulp-wdt", "fsl,imx7ulp-wdt";
> > +				reg =3D <0x292a0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&pcc3 IMX8ULP_CLK_WDOG3>;
> > +				assigned-clocks =3D <&pcc3 IMX8ULP_CLK_WDOG3>;
> > +				assigned-clock-parents =3D <&cgc1
> IMX8ULP_CLK_SOSC_DIV2>;
> > +				timeout-sec =3D <40>;
> > +			};
> > +
> > +			cgc1: clock-controller@292c0000 {
> > +				compatible =3D "fsl,imx8ulp-cgc1";
> > +				reg =3D <0x292c0000 0x10000>;
> > +				clocks =3D <&rosc>, <&sosc>, <&frosc>, <&lposc>;
> > +				clock-names =3D "rosc", "sosc", "frosc", "lposc";
> > +				#clock-cells =3D <1>;
> > +			};
> > +
> > +			pcc3: clock-controller@292d0000 {
> > +				compatible =3D "fsl,imx8ulp-pcc3";
> > +				reg =3D <0x292d0000 0x10000>;
> > +				#clock-cells =3D <1>;
> > +			};
> > +
> > +			tpm5: tpm@29340000 {
> > +				compatible =3D "fsl,imx8ulp-tpm", "fsl,imx7ulp-tpm";
> > +				reg =3D <0x29340000 0x1000>;
> > +				interrupts =3D <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&pcc3 IMX8ULP_CLK_TPM5>,
> > +					 <&pcc3 IMX8ULP_CLK_TPM5>;
> > +				clock-names =3D "ipg", "per";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c4: i2c@29370000 {
> > +				compatible =3D "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x29370000 0x10000>;
> > +				interrupts =3D <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&pcc3 IMX8ULP_CLK_LPI2C4>,
> > +					 <&pcc3 IMX8ULP_CLK_LPI2C4>;
> > +				clock-names =3D "per", "ipg";
> > +				assigned-clocks =3D <&pcc3 IMX8ULP_CLK_LPI2C4>;
> > +				assigned-clock-parents =3D <&cgc1
> IMX8ULP_CLK_XBAR_DIVBUS>;
> > +				assigned-clock-rates =3D <48000000>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c5: i2c@29380000 {
> > +				compatible =3D "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x29380000 0x10000>;
> > +				interrupts =3D <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&pcc3 IMX8ULP_CLK_LPI2C5>,
> > +					 <&pcc3 IMX8ULP_CLK_LPI2C5>;
> > +				clock-names =3D "per", "ipg";
> > +				assigned-clocks =3D <&pcc3 IMX8ULP_CLK_LPI2C5>;
> > +				assigned-clock-parents =3D <&cgc1
> IMX8ULP_CLK_XBAR_DIVBUS>;
> > +				assigned-clock-rates =3D <48000000>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart4: serial@29390000 {
> > +				compatible =3D "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x29390000 0x1000>;
> > +				interrupts =3D <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&pcc3 IMX8ULP_CLK_LPUART4>;
> > +				clock-names =3D "ipg";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart5: serial@293a0000 {
> > +				compatible =3D "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x293a0000 0x1000>;
> > +				interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&pcc3 IMX8ULP_CLK_LPUART5>;
> > +				clock-names =3D "ipg";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi4: spi@293b0000 {
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				compatible =3D "fsl,imx8ulp-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x293b0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&pcc3 IMX8ULP_CLK_LPSPI4>,
> > +					 <&pcc3 IMX8ULP_CLK_LPSPI4>;
> > +				clock-names =3D "per", "ipg";
> > +				assigned-clocks =3D <&pcc3 IMX8ULP_CLK_LPSPI4>;
> > +				assigned-clock-parents =3D <&cgc1
> IMX8ULP_CLK_XBAR_DIVBUS>;
> > +				assigned-clock-rates =3D <16000000>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpspi5: spi@293c0000 {
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				compatible =3D "fsl,imx8ulp-spi", "fsl,imx7ulp-spi";
> > +				reg =3D <0x293c0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&pcc3 IMX8ULP_CLK_LPSPI5>,
> > +					 <&pcc3 IMX8ULP_CLK_LPSPI5>;
> > +				clock-names =3D "per", "ipg";
> > +				assigned-clocks =3D <&pcc3 IMX8ULP_CLK_LPSPI5>;
> > +				assigned-clock-parents =3D <&cgc1
> IMX8ULP_CLK_XBAR_DIVBUS>;
> > +				assigned-clock-rates =3D <16000000>;
> > +				status =3D "disabled";
> > +			};
> > +		};
> > +
> > +		per_bridge4: bus@29800000 {
> > +			compatible =3D "simple-bus";
> > +			reg =3D <0x29800000 0x800000>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
> > +			ranges;
> > +
> > +			pcc4: clock-controller@29800000 {
> > +				compatible =3D "fsl,imx8ulp-pcc4";
> > +				reg =3D <0x29800000 0x10000>;
> > +				#clock-cells =3D <1>;
> > +			};
> > +
> > +			lpi2c6: i2c@29840000 {
> > +				compatible =3D "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x29840000 0x10000>;
> > +				interrupts =3D <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&pcc4 IMX8ULP_CLK_LPI2C6>,
> > +					 <&pcc4 IMX8ULP_CLK_LPI2C6>;
> > +				clock-names =3D "per", "ipg";
> > +				assigned-clocks =3D <&pcc4 IMX8ULP_CLK_LPI2C6>;
> > +				assigned-clock-parents =3D <&cgc1
> IMX8ULP_CLK_XBAR_DIVBUS>;
> > +				assigned-clock-rates =3D <48000000>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpi2c7: i2c@29850000 {
> > +				compatible =3D "fsl,imx8ulp-lpi2c", "fsl,imx7ulp-lpi2c";
> > +				reg =3D <0x29850000 0x10000>;
> > +				interrupts =3D <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&pcc4 IMX8ULP_CLK_LPI2C7>,
> > +					 <&pcc4 IMX8ULP_CLK_LPI2C7>;
> > +				clock-names =3D "per", "ipg";
> > +				assigned-clocks =3D <&pcc4 IMX8ULP_CLK_LPI2C7>;
> > +				assigned-clock-parents =3D <&cgc1
> IMX8ULP_CLK_XBAR_DIVBUS>;
> > +				assigned-clock-rates =3D <48000000>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart6: serial@29860000 {
> > +				compatible =3D "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x29860000 0x1000>;
> > +				interrupts =3D <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&pcc4 IMX8ULP_CLK_LPUART6>;
> > +				clock-names =3D "ipg";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			lpuart7: serial@29870000 {
> > +				compatible =3D "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart";
> > +				reg =3D <0x29870000 0x1000>;
> > +				interrupts =3D <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&pcc4 IMX8ULP_CLK_LPUART7>;
> > +				clock-names =3D "ipg";
> > +				status =3D "disabled";
> > +			};
> > +
> > +			iomuxc1: pinctrl@298c0000 {
> > +				compatible =3D "fsl,imx8ulp-iomuxc1";
>=20
> I know this binding is already landed.  Just curious why there is a suffi=
x
> number in the compatible.

There is two iomuxc, one is for M33, one is for A35.
Similar with i.MX7ULP,  we use a suffix here.

Thanks,
Peng.

>=20
> Shawn
>=20
> > +				reg =3D <0x298c0000 0x10000>;
> > +			};
> > +
> > +			usdhc0: mmc@298d0000 {
> > +				compatible =3D "fsl,imx8ulp-usdhc", "fsl,imx8mm-usdhc";
> > +				reg =3D <0x298d0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&cgc1 IMX8ULP_CLK_XBAR_DIVBUS>,
> > +					 <&cgc1 IMX8ULP_CLK_XBAR_AD_DIVPLAT>,
> > +					 <&pcc4 IMX8ULP_CLK_USDHC0>;
> > +				clock-names =3D "ipg", "ahb", "per";
> > +				fsl,tuning-start-tap =3D <20>;
> > +				fsl,tuning-step=3D <2>;
> > +				bus-width =3D <4>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			usdhc1: mmc@298e0000 {
> > +				compatible =3D "fsl,imx8ulp-usdhc", "fsl,imx8mm-usdhc";
> > +				reg =3D <0x298e0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&cgc1 IMX8ULP_CLK_XBAR_DIVBUS>,
> > +					 <&cgc1 IMX8ULP_CLK_NIC_PER_DIVPLAT>,
> > +					 <&pcc4 IMX8ULP_CLK_USDHC1>;
> > +				clock-names =3D "ipg", "ahb", "per";
> > +				fsl,tuning-start-tap =3D <20>;
> > +				fsl,tuning-step=3D <2>;
> > +				bus-width =3D <4>;
> > +				status =3D "disabled";
> > +			};
> > +
> > +			usdhc2: mmc@298f0000 {
> > +				compatible =3D "fsl,imx8ulp-usdhc", "fsl,imx8mm-usdhc";
> > +				reg =3D <0x298f0000 0x10000>;
> > +				interrupts =3D <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks =3D <&cgc1 IMX8ULP_CLK_XBAR_DIVBUS>,
> > +					 <&cgc1 IMX8ULP_CLK_NIC_PER_DIVPLAT>,
> > +					 <&pcc4 IMX8ULP_CLK_USDHC2>;
> > +				clock-names =3D "ipg", "ahb", "per";
> > +				fsl,tuning-start-tap =3D <20>;
> > +				fsl,tuning-step=3D <2>;
> > +				bus-width =3D <4>;
> > +				status =3D "disabled";
> > +			};
> > +		};
> > +
> > +		gpioe: gpio@2d000000 {
> > +				compatible =3D "fsl,imx8ulp-gpio", "fsl,imx7ulp-gpio";
> > +				reg =3D <0x2d000080 0x1000>, <0x2d000040 0x40>;
> > +				gpio-controller;
> > +				#gpio-cells =3D <2>;
> > +				interrupts =3D <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupt-controller;
> > +				#interrupt-cells =3D <2>;
> > +				clocks =3D <&pcc4 IMX8ULP_CLK_RGPIOE>,
> > +					 <&pcc4 IMX8ULP_CLK_PCTLE>;
> > +				clock-names =3D "gpio", "port";
> > +				gpio-ranges =3D <&iomuxc1 0 32 24>;
> > +		};
> > +
> > +		gpiof: gpio@2d010000 {
> > +				compatible =3D "fsl,imx8ulp-gpio", "fsl,imx7ulp-gpio";
> > +				reg =3D <0x2d010080 0x1000>, <0x2d010040 0x40>;
> > +				gpio-controller;
> > +				#gpio-cells =3D <2>;
> > +				interrupts =3D <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> > +				interrupt-controller;
> > +				#interrupt-cells =3D <2>;
> > +				clocks =3D <&pcc4 IMX8ULP_CLK_RGPIOF>,
> > +					 <&pcc4 IMX8ULP_CLK_PCTLF>;
> > +				clock-names =3D "gpio", "port";
> > +				gpio-ranges =3D <&iomuxc1 0 64 32>;
> > +		};
> > +
> > +		per_bridge5: bus@2d800000 {
> > +			compatible =3D "simple-bus";
> > +			reg =3D <0x2d800000 0x800000>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
> > +			ranges;
> > +
> > +			cgc2: clock-controller@2da60000 {
> > +				compatible =3D "fsl,imx8ulp-cgc2";
> > +				reg =3D <0x2da60000 0x10000>;
> > +				clocks =3D <&sosc>, <&frosc>;
> > +				clock-names =3D "sosc", "frosc";
> > +				#clock-cells =3D <1>;
> > +			};
> > +
> > +			pcc5: clock-controller@2da70000 {
> > +				compatible =3D "fsl,imx8ulp-pcc5";
> > +				reg =3D <0x2da70000 0x10000>;
> > +				#clock-cells =3D <1>;
> > +			};
> > +		};
> > +
> > +		gpiod: gpio@2e200000 {
> > +			compatible =3D "fsl,imx8ulp-gpio", "fsl,imx7ulp-gpio";
> > +			reg =3D <0x2e200080 0x1000>, <0x2e200040 0x40>;
> > +			gpio-controller;
> > +			#gpio-cells =3D <2>;
> > +			interrupts =3D <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-controller;
> > +			#interrupt-cells =3D <2>;
> > +			clocks =3D <&pcc5 IMX8ULP_CLK_RGPIOD>,
> > +				 <&pcc5 IMX8ULP_CLK_RGPIOD>;
> > +			clock-names =3D "gpio", "port";
> > +			gpio-ranges =3D <&iomuxc1 0 0 24>;
> > +		};
> > +	};
> > +};
> > --
> > 2.25.1
> >
