Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E633C89A7
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jul 2021 19:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbhGNRYI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jul 2021 13:24:08 -0400
Received: from mail-eopbgr1410139.outbound.protection.outlook.com ([40.107.141.139]:19947
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229592AbhGNRYI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Jul 2021 13:24:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiKF7tzxrekKDcaeg6q2lYaeJgk+u8XCu2Dpa6+nguxeWnLQCug3FXZGt2RIsab4FLwt286nve1A22kQA9FNj1PXvHsuPiXRdJ3ek8TbnU5SViBEcl27BBv2+N4RdXim5xxZhsHWGZ+HpOuLCpB0MN/pycLYg2wA8qJbiMW4R1sBn8lKQsHGCaOLfrePqK5fxSxfFbLvjAgtVq9ccwx6A1kUb5KxLK+rufRKArDtEQTZ7JoPsCEoFfmJnlet2anOcFaQ8PqEK7dd62ScjOZaNmQBnu6+tIaKIFcJy8o5IzO/ybOSeJDSNOyUg+UWjMWCBdgScFmE7GYQgq+QbMALjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBI4s+xL6XB2lXD5ZivYSejBl4ESLW5A1vv/6OA+U6Y=;
 b=EaRwMjjp8EnLR/7qcb1JDzZ3whU/SCiHli3IVn+ZhWkKF/4uRlnMn2c4ooVkmnfIvCdZw8wcD5BO4iIg2rA9TzIaGqGFquIQxdMvL7/jx3o4ItnKvQXUqw14XKbm45F7j9c/00tkxNDzBLX/ukg2yS+K89IB2a3W8/z7P6ID8ZIJLyqo/52gC3f2QwVbyYuSLP8eIneZP9BNoMDe1HQoV0134smmvCeWoL7ceal4MXy48+HvmkgwemypzMd4Z6tpq6q9Y2xQqw78uIpXzoljzfASDH4mzIbtHRTdubAIkG6OwayoLnuEOnoXPoWEUfmkYB5ZJuYh+MPr4Iime46fCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBI4s+xL6XB2lXD5ZivYSejBl4ESLW5A1vv/6OA+U6Y=;
 b=VG+8Q846Bh44qnLV8vrqW84TEWwkla62SvPlPAGoZmH176ndyH+dZhh09qJOeipaHSLewAHEzVRRakXLqcncCghibUj7Rz64KgrtHkpz2+SJqVO/aaT9oraoXwsotxfIc7dNhDBj1BRYZdmfGcPSXlaxWCcyr87L14heyB+FC3A=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5859.jpnprd01.prod.outlook.com (2603:1096:604:b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 17:21:12 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4331.021; Wed, 14 Jul 2021
 17:21:12 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH/RFC 3/4] arm64: dts: renesas: r9a07g044: Add I2C
 interrupt-names
Thread-Topic: [PATCH/RFC 3/4] arm64: dts: renesas: r9a07g044: Add I2C
 interrupt-names
Thread-Index: AQHXeLL4efd9u8uHlUKhuVRFmTwPVKtCt72A
Date:   Wed, 14 Jul 2021 17:21:12 +0000
Message-ID: <OS0PR01MB5922BCB0FA0E95A2C3A83C4386139@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <cover.1626267422.git.geert+renesas@glider.be>
 <d35ba11bd705e3c728f94ff0414ac6ae1156244f.1626267422.git.geert+renesas@glider.be>
In-Reply-To: <d35ba11bd705e3c728f94ff0414ac6ae1156244f.1626267422.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b1decc9-c984-4f16-e827-08d946ebc759
x-ms-traffictypediagnostic: OS0PR01MB5859:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS0PR01MB5859D72AC3BA1ED35928312C86139@OS0PR01MB5859.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uJGxYE2G7rn70mXOm0I+23wwyvferq0Nh2fxbP0S/6SrTOKKsNB7qbpIG2oR2dklDotYyhvnGyvQKgThJ4ov0HMmk+kNKSXW4dTXxEHnHCQ0NqPepavncuHxhVptNYcsNmrGZPYpDGj40lCZs1uVrfsnzeu7LqPpRGsdUu9zIX0kwrsHs1PtjKWggQMFZRsFbpl00pE423ZcauvJPnMgwoR/RViiZQ1Nsxrc0LEyqr+TBfiVUpk6qkWs2kiAzu3fYG7Uoji+a++bjJMo+X0eKxv4GONsYj863Cu/FGPDv4BQpVdMpVvbAptojgMDs8lq3+63zfrEssdtWI4u5X/x/yQNi2xRZayYcL/+dujxNjW7zLJAQnmfFJMIX6VgyCvQG6EEwEjLPun4Fe2cMtrsxYCRJmYHd/KNVPNBx80jLCFjycQ8kRgS/OQDgpFMUMh3oJ5D9cJc5cYGCgPjPhuVP5kujP6Xezq6OsAEytGWb0QRdhpWGrGDBBBiIwjX898X7W4r8GnCYYlWou2p0K2Khf69QOZeBh89sq/WG1oMbTR+HZvhCIO7zvTIV6LLg3CNbcguftYXKPlwQdn96w09d40/3bts6aTWxXjLLOX6/3UPvgzuvRxxYvtoED1R62t+7pdkpGzS8GLFu0LZyyQdfdThsrjYPSVjL+BjZZrMp6lB6mhc/vVw7sEi8P1yRuiPCrFYdYLVPOyHMHQlbH5jNg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(396003)(39850400004)(9686003)(8936002)(2906002)(86362001)(66476007)(76116006)(66446008)(66946007)(64756008)(122000001)(5660300002)(55016002)(38100700002)(33656002)(66556008)(83380400001)(478600001)(110136005)(71200400001)(4326008)(6506007)(186003)(8676002)(316002)(7696005)(52536014)(26005)(54906003)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZvQcEkZGSMeFlasetlRnqbUPek3shyuqqke7nFJMYkgxqiiYF+mi6sMSFyP4?=
 =?us-ascii?Q?YoPcrkujl1jG1prbrgAmabftREO6rcagetGHsDEdSbKFiSMuiHieUahu+pjG?=
 =?us-ascii?Q?2IY7+FrZ2NhY/juEFWjsg9nP4ENddcTJeA/FS/IrsfIkA8DXiN2lPrM+X7ar?=
 =?us-ascii?Q?M1DcVXNGQJVa3khRfrzJFGEsGaNFzdhZ0/Pc3E1NVCktVKRSBGqedzJKQmle?=
 =?us-ascii?Q?PQ3MAfM4VFFevfOm/SVWb4S+QmXTdg9ywlk27kKSbfExEp16GehioajReCAf?=
 =?us-ascii?Q?+ccXhcEPgNBEJb920YEb2rqwJRBHogaxbr2RDBKPJoVddcTCMuaoYxpxabZG?=
 =?us-ascii?Q?xjfgCCKUjHYoKqYdpGUJNFzw5G3hU9R+L7WIYU6b9PHYRAXNbyu/RWXywnb3?=
 =?us-ascii?Q?oT1IybOjEJUQfodciFYwd6Y7JK+oOmMNJPCrBF/gorZ1Y45ANGBI9roKb66M?=
 =?us-ascii?Q?l3l2msNwoeOw0w7I/Knnz1U5j61PCIYkDiPDkAExeXS8nb7u0qY2rxtiUbSF?=
 =?us-ascii?Q?CpaBifjDSJtLHXX7h41Zm1hqKgzKepVDlB25VhQ41+OqQo81jmS/qmpsvjY1?=
 =?us-ascii?Q?Rd21gKqgfGsqnp47XfZCuiupNRCnaccHQaCFzOlOlKR4nDt/nB7Zjp+oN0DD?=
 =?us-ascii?Q?v2wY1MWAmYgDiNEpWn00akqO+s+TBNZccLREIdl7Us7lbCDS7GxIhcQMpMy7?=
 =?us-ascii?Q?Jvc4mZo2/Q5Xx+3aEOVxPUPBZwlJ2mVG7pTXoZbE11JWG3U6+OaKVfW0Jl5k?=
 =?us-ascii?Q?GwAvz0YEIyPTuI5sxC3GEzjs+kiKIgLtM/9Yt08Kgfk1tOjlVUR0xEjhVhyK?=
 =?us-ascii?Q?g4U6tETgvbCB2eVq/K2WlhDBaI/F+LoFnFC1szFvbhF+lazhpu5shi39mHJ+?=
 =?us-ascii?Q?4PXcSf2SYXZk46CSAhYRYiOVmXsNPGYmxZGRr2w0zCM6uKbtWnxKqlrVUWDX?=
 =?us-ascii?Q?zDhKL1KmxaSLPejm/VaCWYXAtIfTnPtGWLRbAi+0TL95cGbnscqIAJk07bSY?=
 =?us-ascii?Q?oOOUZbGIB62C68CIHCVDBkI2fBuNuMuHFSLLEYUUbOKlflEIxcPH1j+2F0M4?=
 =?us-ascii?Q?798R0E5W6kZanD8EnoXNKRkXFoJw8leNqA5DXCrE9lx6MYOxX1k/eQMnRZkB?=
 =?us-ascii?Q?ngUtqCIJ74tOHhZ956W8GykSjH/tpYSf4hgdDC06VKIbMt5cTvvDQzpzve+e?=
 =?us-ascii?Q?pbYmXwHMKM9EP3Gql6F1ILlOc0knm4lQaJDgKhTOf1PUza/EjrMj4mz0aWoM?=
 =?us-ascii?Q?QmEnh8dTRk3Ff7fo/N6FIfUygBK4znui4FE8I71/dhXcpRIbtIdHAitiOwoQ?=
 =?us-ascii?Q?U5y+wV+08h5WQ+RLN/m6bRsV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1decc9-c984-4f16-e827-08d946ebc759
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 17:21:12.4427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P67fRztowgLNZv1W95PO0hIItcQTbDZNER3SFvaRcjPZYzb7+/OPWcL9/7ByVV9T3MePS5+ttSzyZJrOA9Y612vc2cl34MyvHH3GiWCcjM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5859
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Geert,

Thanks for the patch.

> Subject: [PATCH/RFC 3/4] arm64: dts: renesas: r9a07g044: Add I2C
> interrupt-names
>=20
> Add "interrupt-names" properties to the I2C device nodes, to make it
> easier to review the interrupt mappings.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

> ---
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> index 9a7489dc70d10882..0dd181739fdfc0f6 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -102,6 +102,8 @@ i2c0: i2c@10058000 {
>  				     <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "tei", "ri", "ti", "spi", "sti",
> +					  "naki", "ali", "tmoi";
>  			clocks =3D <&cpg CPG_MOD R9A07G044_I2C0_PCLK>;
>  			clock-frequency =3D <100000>;
>  			resets =3D <&cpg R9A07G044_I2C0_MRST>; @@ -122,6 +124,8 @@
> i2c1: i2c@10058400 {
>  				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "tei", "ri", "ti", "spi", "sti",
> +					  "naki", "ali", "tmoi";
>  			clocks =3D <&cpg CPG_MOD R9A07G044_I2C1_PCLK>;
>  			clock-frequency =3D <100000>;
>  			resets =3D <&cpg R9A07G044_I2C1_MRST>; @@ -142,6 +146,8 @@
> i2c2: i2c@10058800 {
>  				     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "tei", "ri", "ti", "spi", "sti",
> +					  "naki", "ali", "tmoi";
>  			clocks =3D <&cpg CPG_MOD R9A07G044_I2C2_PCLK>;
>  			clock-frequency =3D <100000>;
>  			resets =3D <&cpg R9A07G044_I2C2_MRST>; @@ -162,6 +168,8 @@
> i2c3: i2c@10058c00 {
>  				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "tei", "ri", "ti", "spi", "sti",
> +					  "naki", "ali", "tmoi";
>  			clocks =3D <&cpg CPG_MOD R9A07G044_I2C3_PCLK>;
>  			clock-frequency =3D <100000>;
>  			resets =3D <&cpg R9A07G044_I2C3_MRST>;
> --
> 2.25.1

