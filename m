Return-Path: <linux-i2c+bounces-4035-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A842908B7E
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 14:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C4C31C24FCF
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 12:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0B01991D4;
	Fri, 14 Jun 2024 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="AwAvx7Bc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2059.outbound.protection.outlook.com [40.107.6.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6D81990C2;
	Fri, 14 Jun 2024 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718367410; cv=fail; b=AKztY7ag2IP88RFklR+bztzGL/rO3mU+h2wO6rFHxChTtsi+zIKVQ7lyWcAAtfBNu86uVvpV1y5XjoZSn2akcW3WzrcCBxlO7kJJlgW2j6ivDZx/plaG/T5hexlu7u9QsmphtPA6WLk3EY3K80ZJVqdMJpHoYEdD/A7g3svVGfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718367410; c=relaxed/simple;
	bh=BIG0l6HSnxbcIUY5GNzpd4CzCkM+GwVOHy4YaujkUtQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lQDvPpDH9rvNS27DZOU8y62ixQUaQbGJFmrHO+0vC0Md47vO27zMZUeIG9+wffFPNdk9i0OARARIWk/Ansv+CattkW42zPOKY3gyfDEn5C1rMdibTJ7k4u8WWCHsAiADYTWRSxD47S3Ul8pFcFbmAfDMdpA9UzH01vATzbzui7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=AwAvx7Bc; arc=fail smtp.client-ip=40.107.6.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAs1c6HKtANHBxafYNZOlA7QPujAPyLM/r6rBr7MMUpOT9FBvWR5ZL51c+dy3x9K+Auqsy1LbN8eA6OqjVkf8abJdi9Ox8SFDkVEZSypzyfrXRA8OU4bIoj2nNlbWVDzVUPcm2lrzZoy29yjQSdxEO/SXK67Qjh7CBNwMe3kxURDBskb5uEHokXVmzKh4IWcJevryDe99JKGZTvYgnYydbgBlEmmjnoIcE4z7zdmQXz5HoLJIS8md2vAJugzaVwNVMrNe1judY8fB8BhqORMxZjlFMIX57+8Il5MVOCm66WEfRYPyFkHXkBX4rc6abdcJ4H88yuMmX8oU5G2fJ51+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCcH4YUV1BP11XIBqBpwP18AsBjoj33htNJUGCDXiRU=;
 b=iPkkt2UJJh8NLLH0rfBjKPztfkOoRsVbXYShKD/KC2LJID4c5foDg7zGnCi2nDJIEz3wbLj845mWVsUQFPhS7vK/rYPRs68zwFRoBa1FQdz/yOCozSvxku5ToyPuyQDGSzcryGN/3Eb1l3Ohd9VnqY9QahEWMIFb6FUI+T74GlJp4OiHnOO1A1WcViSjV3kn8mLTMTZn8BXvSIwHXcCR53BVyUDE9tpQ1TJktcvg+SsulZL+ngegQKWeY5zCWxsG88yOUUyhNBpoQFVd+D518tqwHXL//bZXTTaSq6YDT2eEYt+SBBxUhzr6LBpXQWJzgIm/Prd9cpYH4FOVgDjDwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCcH4YUV1BP11XIBqBpwP18AsBjoj33htNJUGCDXiRU=;
 b=AwAvx7BcmoNTDQo+JJ1nafacMCshcPgGRpfpLIUa4nNPpIr4tPvOCjCWMjvXofGVhOwtcC7SNOLTqs8AFCvpmfP6ZXRmC4UVrXLNmqx5tgr6k5lX3ltvLFvYVsNTOFdPpdV2PoHOCViDPzgSmf0R6+PIK1A0er8iAi2KxDbP6aw=
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by DU4PR04MB10693.eurprd04.prod.outlook.com (2603:10a6:10:588::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21; Fri, 14 Jun
 2024 12:16:45 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%5]) with mapi id 15.20.7633.037; Fri, 14 Jun 2024
 12:16:44 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>, Frank Li
	<frank.li@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>, "linux-pwm@vger.kernel.org"
	<linux-pwm@vger.kernel.org>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: drop stale Anson Huang from maintainers
Thread-Topic: [PATCH] dt-bindings: drop stale Anson Huang from maintainers
Thread-Index: AQHavkGTDHH4DyW5tkyonqziSWJqWrHHLMlA
Date: Fri, 14 Jun 2024 12:16:44 +0000
Message-ID:
 <AM6PR04MB5941410C48BDDC4FAE7D761188C22@AM6PR04MB5941.eurprd04.prod.outlook.com>
References: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5941:EE_|DU4PR04MB10693:EE_
x-ms-office365-filtering-correlation-id: a8c4b532-14b2-4c30-e99a-08dc8c6bdb3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|366013|376011|7416011|1800799021|38070700015|921017;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?IouN3IIF5plRPkSCXvVWMUnq9gXH+tyx09hAmOs04Fxljf9fiwUkidENs1tH?=
 =?us-ascii?Q?Hx9HE1lpAzoynWD6+4AJkY56GgjgczuCETuduKoj1++qUihC8/U6m7/I6z3G?=
 =?us-ascii?Q?AkIt/2Vg8CzZ939XbOfCZgzRECPymCLVPOek0SFlnTBYAn3FmWoda/vbfqXv?=
 =?us-ascii?Q?9G9ha0Ht45Wfk0WPUkT413pmP2nEP9x71036EpQc1Sy6omMzuVgTqbvNtoGa?=
 =?us-ascii?Q?dOXAdA7fBL3g6pyM680g5NJhDyJ+kbw9DLZL319IeErNpR2kOtcQbEP5CRsg?=
 =?us-ascii?Q?OYEimV406npIVHsz5YjfFUNL7A3NVTDzGedcacDXxepYLblWVrOJWMzVKhNO?=
 =?us-ascii?Q?LSLUms6l/dTTQrqJJGjNMR0N1pY26iYCYWsNLNXhlEWKSzRs/55yDJKigPNU?=
 =?us-ascii?Q?pVjxuwExyalkL45H4BVl/2t6vx48pbxnmgcZqVu+CLuTWtywwmbAIRL4G46a?=
 =?us-ascii?Q?Su9DN37WVE3KS1o8dyooHI9e+uej6vIb+pTddLd0R4zNYKKTBfsmErYfBgRz?=
 =?us-ascii?Q?IOt8shR5eTDiaDt1SJy/hGNxeyoa3XHWZNxu9OgKgBJlZLZQg34vl/JyfLiE?=
 =?us-ascii?Q?I45zEBpa/JIJ3GuDB9zB5vq5heYu/xUAew0Q/sDaO5cBnLPbNosU7sRvA2QI?=
 =?us-ascii?Q?X17DJS/hriwoOiC/b1FQs8401D3oxqwIUDdN8m/Ci3/3J8Um2oSwN/Qi8JzC?=
 =?us-ascii?Q?kVjNr8tKogxT37bHI1jQS2722JIDEVo0jp1qkaQ49SWlv/gjU8jH5DHi6fDp?=
 =?us-ascii?Q?cRT39ik8XOCJaPxzPVocoiQNXbozrEVp6XkE7CoEgABT88p9SzVcgXx01gV3?=
 =?us-ascii?Q?bMq7TyrMTLpmgjXIhxSXe/LcTgVXc8NTOk9vzc/ngVwmKKA8scjzexVkHX5O?=
 =?us-ascii?Q?tSPH0z2fog815X22MU98JMOJiCegPIH3l83AE2GdkMC/E34Njk3x3YsKc+ON?=
 =?us-ascii?Q?88gRulv1gz/D+IqEgRzBfKUCY23prMd/exnE1jaYD9YYw0G3yGB5/z0PQWt4?=
 =?us-ascii?Q?79bOuTvfs3xBs5jFrij58ucQAyLldhmvc9ppOfL7SQboqAsnA9tB01JthZNi?=
 =?us-ascii?Q?sEuJoxtFKy3+aDPmxWUsXFir6EF2qcSJA9X2jIuxkqh6J2vSMRkmUBcSZNSe?=
 =?us-ascii?Q?M0vfXVSJjAiIEGy9PsqFK1pSBtleqA4s0wtUAyctEALRQQ76pSIWx6+WsZpk?=
 =?us-ascii?Q?vbUl7htosaljfDBfc/Dj4zRea/cdnDrx1BK2KVPBWNNF0Fte8lEsvfHRGCtC?=
 =?us-ascii?Q?mK70Okng2DtZrNszkxBAhcr0VUPZmRgiF7DUNt6pkDyrKv7pJLYrWA4uk9y8?=
 =?us-ascii?Q?mXmRBLy5dIs0tLHnYzj1x4zal6PUurfabD6iEvLAJardh+uyrsqLGxRAgKBX?=
 =?us-ascii?Q?+t1P5yWGE/zluPVvYWMJfPPLFtWO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(7416011)(1800799021)(38070700015)(921017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?K+l4osRW+v31sMu4ZcfEtjnDeqIrJmrDmMKIa1cPkH+wmYoLFSFd9Wp992X4?=
 =?us-ascii?Q?IDD/ubpmJja1lzmL4mCbq3vSBTq3qBACCqKTsmZv19xqH5sntGwS6qoTw6oF?=
 =?us-ascii?Q?HEIIbVfU75yQaphNBodm3iKm3rgLoSs3tliYP/h2n+NfRziZnI+xlJmQn2J3?=
 =?us-ascii?Q?5Jd8jYnlqroNsu3VzTD6CBE0vwVSouyeAuLYXlLW+UvCWeznXsiAfDwEyG9h?=
 =?us-ascii?Q?E2Pm9mOQ0T4blM15BRzqSKTQLqflVyJV3mOzQZg6/zKys1T7sKuchp0HsPhO?=
 =?us-ascii?Q?UpyM91zYZFfedkD+2AcEhvSzAJToH1B2jmuUn40RU19l/xbxvQYVslTFfj34?=
 =?us-ascii?Q?zJErC5psyxaH2+DGZLrNIr+ImWLlX1a7ujN06OPhrZTooSzTf9pAA+VBSTtt?=
 =?us-ascii?Q?wrZwj03pv5Im3/qjq+AbIq1RNPs5AG4BSh0CK/gVfvqfts/mYb6ZUYxmz9hc?=
 =?us-ascii?Q?1wu3ZnveiHnNSlBLg8sVaXhla8aCmr8OPffGAfygPQSYDn0803PiOtKJKi5z?=
 =?us-ascii?Q?o1T/dxUx6d5WBBYij7I9JBMffFE3iAdgmXyxHY9iOzqBIrQsOy/bxoTXFq9T?=
 =?us-ascii?Q?as1jz3ADgWKGAl6g7gRLfi7vPtZCWf17jnKznF0SkziMj6XAs5NHZkc74mOK?=
 =?us-ascii?Q?YMtS0aeUfg+y/EN87SmiBBc9iXYLeVvXAJQw2N7y4LJ29N5u47nuHrDB7Smq?=
 =?us-ascii?Q?Cen1QVZRpOzKvkIsjF97sZH56n+vAmqoet7zFpQEIx6HMhbvvgfdt6lmrGQ8?=
 =?us-ascii?Q?ohoB5KKXTNMOYXgQ/UflxVATlV3ZVCa5B8wjtlszdrGDBKdyy6y3K3RAkKXj?=
 =?us-ascii?Q?sLjk6ctXWkFJFs9ddsQ0DjsbFpy15SR9tOXAxL64RZ2E7kQDXp5nuise+HiS?=
 =?us-ascii?Q?La6JqWEjTIYGfzOvDWT5Ms3YW5mxYkdKFfdRnw74aSMXoe2GjDRElgOTIVnO?=
 =?us-ascii?Q?PCmmUVUWryYO+gWaqqDCrnKD0rxf/5f3YR8ppetyfPJlRoIC56xSoSp0PWf+?=
 =?us-ascii?Q?hLKQDITr/BAWt0HqtfLzLi/bSTPV7F6f+oPKArrJiHRic8VIyErUQWnmyue8?=
 =?us-ascii?Q?uM0R9PhESvdOAMi/Or18rRNng3J3xAZE+cyOxzoFituhmPMwG11JUeBLbMcG?=
 =?us-ascii?Q?532UrdubJtCeFm0w3pwmhzlYwBMdZ4e1edQY4Kcb6tzw72mQbOfJ39MfTahk?=
 =?us-ascii?Q?YLSvfvc/+VLlBEX/Aq2uT+okKAT/lXEu8SluDaYrvksWfJK4+Jf5bn02zdmc?=
 =?us-ascii?Q?XSVoRzzTRyhckJvgKnq47XFbuvh0t9LWtb7X5X6loJ5E+UKWo8TtC4/PSlgm?=
 =?us-ascii?Q?MhYIvHkOX1EBGFVrHoceRwTAjuvXxnTlaCHW2BRG/zmBa7tarkaCp9G13lS/?=
 =?us-ascii?Q?PN4m9KM4i9IQnCulc3OkIeE7yJdBPSwWNXuBaJF6Jvl/y4wyZV8LL4GI4GQU?=
 =?us-ascii?Q?ApF/3dSwUdwUVCALd2CMmTfqwf+Pau5Hb9Q6fIHnmqdvdDCFGS1zfPVx5J8f?=
 =?us-ascii?Q?4bA91SIqPOxRbuOnycP8LBQwTHPdoLoQRVKtuHOjtk3l7dZ8Fru4G5/d2nby?=
 =?us-ascii?Q?WF2SzF8A/C9YGX802uE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c4b532-14b2-4c30-e99a-08dc8c6bdb3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 12:16:44.7217
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cy6Uhl9p0cGIv7/BDZEmuEFDIxPHfCbEsJnHNo9pUg6jxo3eY+Z4UG59LSbmun3pUubU1YeymzPyxIG7TKH+oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10693

> Subject: [PATCH] dt-bindings: drop stale Anson Huang from maintainers
>=20
> Emails to Anson Huang bounce:
>=20
>   Diagnostic-Code: smtp; 550 5.4.1 Recipient address rejected: Access den=
ied.
>=20
> Add IMX platform maintainers for bindings which would become orphaned.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Peng Fan <peng.fan@nxp.com>

Regards,
Peng.

