Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F1B45D6E6
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 10:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349337AbhKYJQg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 04:16:36 -0500
Received: from mail-eopbgr50059.outbound.protection.outlook.com ([40.107.5.59]:7061
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235766AbhKYJOf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Nov 2021 04:14:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVafO05vA2DO5YjyQSVGQmO4LSjEae9/lE71a8xe0LBymMhGkCwe+WaW6r6Wx5RmA+N5mhX95g/J7wCaJ5c1lOOqJaklw2Grzc2rb+R/ttePRHTxsGDmSGF3h0ZmimbtRDoI8cJF+8IiZi7ymxvhs8fkGizdGJP3p9sxv65qBD4MA7Erz4Mc7ooMczrx4NUPDbE5vNPryiNw3EojHIQRVYB545lPUN4oFvfuzrYoNnPTPmJ5XNM6jA3SOcPxfDwXnrXXue0WrOwmMkOVIuDt+PVnHtkBuDRIyV0fHTF5sUQMfMRpsEQKMBECsRiSKT12Z7zuZZu30Wrbpqb65NiWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5m60DqPis5oS3pyf9CpjSOjUU3bcidr3uHiGgFiMLbw=;
 b=kYM+8V2eoJAmF7rE5kXkAfjxTJDlgVtl/C72YKRpc5APaFTyuSnhncDIUtAIk9u8RV5byfm9PtJ+vjHOabJPyRmfxigt2SWWXUYiLCO3yNebeaWpi/yT7lKrqAzqt0Grg37uz6pSM7BnHMhtc0ed3Zud8F/3W5Bx9ArTvdX1UnE+rX+AaH+gb+ihX2+EmyueAmjDVTv3nRStT6KLwRDA8cQE/C9BsisRO6nsHn+1vvp95I3U4ciAES5X+KsnhFWh+I2Bhqbz1A+DWHFiWXuTZlOtGFZsYwmtKATRSZfCiQR51Mhq1C1ImUGxW35i6mbLwRE90U5tPIdPgpENrBL0sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5m60DqPis5oS3pyf9CpjSOjUU3bcidr3uHiGgFiMLbw=;
 b=M+E3XrHITMZ4rdP0LtOM8c6xVngzX+4XLxcyrv8YhpOt7FQir56HmOKnsE/EVqtPhTeMawpUL+WcAzpl2jYpb9ZOZPSeNAF5p2pfUg2ZYwZmjKA8qSR4ZMMI3Awi89ONZG/A3Hs9Q1vW3d5bA3mKFkZEJOEALjFmJdWhhEOjsDQ=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8533.eurprd04.prod.outlook.com (2603:10a6:10:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Thu, 25 Nov
 2021 09:11:20 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4713.027; Thu, 25 Nov 2021
 09:11:20 +0000
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
Thread-Index: AQHX3gLDA+/GY3Dq60eK/KNA/FmZzqwT/MmQ
Date:   Thu, 25 Nov 2021 09:11:20 +0000
Message-ID: <DU0PR04MB9417A88AC1808CBEE76A27E188629@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20211120113454.785997-1-peng.fan@oss.nxp.com>
In-Reply-To: <20211120113454.785997-1-peng.fan@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87aa098e-c757-4ca4-7218-08d9aff38bb3
x-ms-traffictypediagnostic: DU2PR04MB8533:
x-microsoft-antispam-prvs: <DU2PR04MB85336E36ABCE7749C14C2DDD88629@DU2PR04MB8533.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w1pWPTbCF8hdbZvT3aD4sS8XY99/Ar0xyowXCzINeq3uM89eNhFel/EAckBnf1U59h7A1mR5DyA2b4txVVEg4VPa4WeP9TAakPDBvCAW0gRGkns175ifBfNx0GiZHv3rhA0ElZnAnrJBGNVybEdJxUaFJxangG+ygQX1SJ9GnSREFUuuBj432YqtFMo6wDHDtr/D7FsPncvLX7D4lBU5wx22jV25p9eqHwuKqgdpgl4AhA9eovfXOwg7Dj2ybDEY9I0kfRJMXWgNMtgMgsEvx2cZ/eGSnpSQ5fQc0dsCE3mdI9W1j+y1Jc+aQa26i9g4dhFSiXA2u3N8lLtrYcGAN47pPZ6NS8ltfNhewnWSURq3Uy+uDUqPRDgwERGC0O42YdMwKYjtss2AhK+jUrDTxZ4BjnhKwhtJnZvobxNy/uJD7RnAHVjpBPM4rTm50EFBAVL2TQYkV0DazreGDxH6qlK5A9pZOYuTyhbIbDk0jTS5jsUUfURvwr/hpLBe29jPFKvjnnT0zOGgMKT/ftD9vpdJD1TSqA9mdWPxa/QFWTajawmA8x7siGglahHDFcGCPioRk7zPhSvsdUesbaZggar8dr/OyHFUj/uebfk2K+FETfYhophFLyDqEQ0qQSBX6witDwAojg7ylYU7bcfke8foOOpfftwK/4o6/P4wJoLXWe23qWR1zADP5qY1H9c+MT7ZwNV5Ki3uzFbi6ZIPxJ4KVh6SBUS5UQsRN4libnHKtMWnoZQo4+ODJRkThVDq+3Xw8FHOLZH6VyWVr+476TuBh/+0s4w/fUiOxxZzfcqNg0LsA+wt/YxX0izhTDsh/Ldnr9ixXIhOaOqtnpHalm1s5i1BdalS4zCuRCCEgZA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(55016003)(4326008)(38070700005)(71200400001)(186003)(9686003)(508600001)(8676002)(122000001)(7696005)(8936002)(2906002)(26005)(76116006)(66556008)(66476007)(44832011)(66446008)(64756008)(38100700002)(66946007)(54906003)(966005)(921005)(110136005)(7416002)(6506007)(52536014)(316002)(86362001)(5660300002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1wxXtqSDZYhqUrsi/ZzwVLErkOFz300sVnkD1ALnLpTjXm5THGKSdJX6ShvD?=
 =?us-ascii?Q?EGUjjIkGY1Rul+TPIAiKGUM0naLJizGd8rdacNy5BxbHbARZzX6xattDyyFi?=
 =?us-ascii?Q?8nGGV14k5scvKIsGOyFnMYYZySKtx7sssNcNASBTYMtW/uefew/8+PdShuY8?=
 =?us-ascii?Q?o6lxAjrZ9DBQAWXa64DpaWdGD0QRy1e0ZZBn+IVQbgkxa+dPOLqxiLrCwUmN?=
 =?us-ascii?Q?/IbGCz44+hX2AApjYzuebyZtIQq7PLh69s6Rc6A7MP5605O54PGX1AnhxhBh?=
 =?us-ascii?Q?8LoG8jqy/RO8yGpeMG/2JQSObivSIxe6FvzATtDJGTbaHC9wn+QK0IOemRYi?=
 =?us-ascii?Q?Gv36cI0nD3NDDR3c/eO53y4lXg7/HNQ7doDjS81tNddYnxDBI5KVKAdUvXrp?=
 =?us-ascii?Q?VwOfw0xXDSfE6li1Oy/M3DgEkH+rYn+3XPBP+CpycmuJiMZ30Nrp88ylflWF?=
 =?us-ascii?Q?13DiI8KBjN7KvXUwQ0sfKCiqZ41LG6m/VoMGpgMBIY/mkyLP+t/LQ0Ph1Tyu?=
 =?us-ascii?Q?pRkSZkjsVA3Xc5VsLCmwkgZcAVP/zYlRh2649ICRnf/10Sz6o17j6SAfqBNZ?=
 =?us-ascii?Q?i6FeFUZEt6fFZwT7p2NCB/TKgod61YHOtNY9YuV4pGc4/SXDeZaa7QrN5ZeW?=
 =?us-ascii?Q?N4GLHZRYVKjxKpPgSiobiqwK0qvX4vMiQ354ec45fL2pth5pvBk1BFHD4aCE?=
 =?us-ascii?Q?2ZD6216M0jOGP2bMwzbe0LdlEQ9h2TNXhHt2kuHVKrW15h+KJc+s5UbQOoU2?=
 =?us-ascii?Q?rJU6+HeS0WYbu9Qg41NHrNfV/AWGfMCymiS/yszen/wUfr8QxB6SnYLBIYVD?=
 =?us-ascii?Q?3Tec6ty0PujTPcBBiV43lN2Nf4+jKunZWysHrR9MLRO/4/5ONqGfZLwF4DHt?=
 =?us-ascii?Q?4yTWTG8CNEndU2todLkE14EiIYq8LgyEjHvkYAmmCTzbGGhml3r1Y2z9UILs?=
 =?us-ascii?Q?mkMPXJKw/8cfj8t8IxQn1NWUCLBVKiEQNFb2ZSix7Gk0Fi7wGi8DHdskYCkv?=
 =?us-ascii?Q?HEGS7rZkaii55M33vpuZH08E6HIWHYuv8qK4BysC860jZeT9tWTfSCv4i24l?=
 =?us-ascii?Q?JRV3RfKMYiBHC8VpVoVquXz2pnw5yNvb9z5ncIW3i3eM18sgtYI+oKMDCNEZ?=
 =?us-ascii?Q?rLWG3sGPE2cvz00pnXU7DAK4Z2A6DMw3hCbls1IlBkXTLyTNxINbUY3lqtoM?=
 =?us-ascii?Q?9bseEdgsbt9TZp1fEwjVJVJOjo9wW64s+uEjuDVokyF3mHJYCm4W95SAAcSl?=
 =?us-ascii?Q?bklMdjVKepufLgyIVCpVVrFo+/ript1b9zngtDORAhtam5VZF+m4OjkEcsiQ?=
 =?us-ascii?Q?MxfkMxwfSVuInHkv00lN6xlmP3p5QyxqMvlwcJRX2Inf+Z3sa1dN1OjeBdya?=
 =?us-ascii?Q?ZXkYJRbQy5nbD3nA6dJ8jRtzOQ2rVaX6fc4xoFKH6C3LG0cl19FfgoIMpyAi?=
 =?us-ascii?Q?CGO7mrkOQ1cx2HwMVdAbbO0udRHWIbXQBW1UP+piGoDJ9c45ugAa3cZ3T4nI?=
 =?us-ascii?Q?LAwFsSI2HkAzZx8Ib0kfwOtKET38mdwoWyh6ixbQ0IB1K0Bh0CxH3PPyPa1D?=
 =?us-ascii?Q?7v6/dGcaRl8fTdo0WsyR4gCkXWvGe8BZmuwYCX/1QPvVnX5M0/pSqWN5NvU5?=
 =?us-ascii?Q?g+txICyXK3KHHj69bKC7Vb8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87aa098e-c757-4ca4-7218-08d9aff38bb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2021 09:11:20.4098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BT4WhuVRo69po18wE2JaS2+MMjV3ID7TX+vtxA5PAwCmAVRHdmdF3x+tnyP0SK3z2Ncsp6CAO0blKV29xXx1PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8533
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Shawn,

> Subject: [PATCH V5 0/8] dt-bindinds/dts: support i.MX8ULP
>=20
> From: Peng Fan <peng.fan@nxp.com>
>=20
>=20
> V5:
>  only fix patch 8/8 "arm64: dts: imx8ulp: Add the basic dts for imx8ulp e=
vk
> board"
>   - Correct bus-width to 8 for eMMC
>   - Drop pinctrl enet which no user
>  Drop patch 1/9 in V4, since in merged in linux-next  Add A-b/R-b tag
>=20
> V4:
>=20
> https://lists.infradead.org/pipermail/linux-arm-kernel/2021-November/6960
> 20.html
>=20
> I just pick-up Jacky's work, rebase and send out V4 based on Jacky's V3
> patchset.
>=20
> If you prefer to split the patchset and send single patches, I could rese=
nd one
> by one.
>=20
> Note: the V3 has a gpio bindings patch, it has been separated and sent to=
 gpio
> list in a single one per Linus requested.
>=20
> This patchset is to add i.MX8ULP in dt-bindings, introduce basic i.MX8ULP=
 dtsi
> and basic evk board support.
>=20
> The detailed version changes are in each patch.
>=20
> There is checkpatch error in patch 8, but that is for device tree macro a=
nd we
> could use use "(xx)".
>=20
> In V4, the changes are in patch 8, 9 when rebasing to linux-next/master ,=
fix
> build errors after the clk driver in tree and drop a few nodes that not h=
ave
> bindings.
>=20
> Tested with CONFIG_CLK_IMX8ULP and CONFIG_PINCTRL_IMX8ULP
> enabled.
>=20
> V3:
>=20
> https://lore.kernel.org/linux-arm-kernel/20210625011355.3468586-6-ping.b
> ai@nxp.com/T/
>=20
> Jacky Bai (8):
>   dt-bindings: i2c: imx-lpi2c: Add imx8ulp compatible string
>   dt-bindings: serial: fsl-lpuart: Add imx8ulp compatible string
>   dt-bindings: spi: fsl-lpspi: Add imx8ulp compatible string
>   dt-bindings: timer: tpm-timer: Add imx8ulp compatible string
>   dt-bindings: watchdog: imx7ulp-wdt: Add imx8ulp compatible string
>   dt-bindings: arm: fsl: Add binding for imx8ulp evk
>   arm64: dts: imx8ulp: Add the basic dtsi file for imx8ulp
>   arm64: dts: imx8ulp: Add the basic dts for imx8ulp evk board

For the several dt-bindings, patch 3 has been taken by SPI maintainer,=20

All patches have got R-b or A-b tag.

would you pick others bindings or they should go through subsystem
maintainer's tree?

Thanks,
Peng.

>=20
>  .../devicetree/bindings/arm/fsl.yaml          |   6 +
>  .../bindings/i2c/i2c-imx-lpi2c.yaml           |   4 +-
>  .../bindings/serial/fsl-lpuart.yaml           |   4 +-
>  .../bindings/spi/spi-fsl-lpspi.yaml           |  11 +-
>  .../bindings/timer/nxp,tpm-timer.yaml         |   6 +-
>  .../bindings/watchdog/fsl-imx7ulp-wdt.yaml    |   7 +-
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts |  64 ++
>  .../boot/dts/freescale/imx8ulp-pinfunc.h      | 978 ++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 396 +++++++
>  10 files changed, 1468 insertions(+), 9 deletions(-)  create mode 100644
> arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
>  create mode 100755 arch/arm64/boot/dts/freescale/imx8ulp-pinfunc.h
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp.dtsi
>=20
> --
> 2.25.1

