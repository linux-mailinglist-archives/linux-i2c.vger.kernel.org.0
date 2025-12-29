Return-Path: <linux-i2c+bounces-14830-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE72CE6882
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 12:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89A10300B828
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 11:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9922630BB94;
	Mon, 29 Dec 2025 11:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Fewa3ada";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Fewa3ada"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022079.outbound.protection.outlook.com [52.101.66.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226D81FF5E3;
	Mon, 29 Dec 2025 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.79
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767007831; cv=fail; b=VLl4yc6Lp1dxDyEUx0Po9lJITypIZq6cEaG19k2ug9lGUrbe/5g80ESy/d3rrlyEPmCFuUBf+VURyiA0mjUMfR1tWwHV/3YwSXkzHsyvXUlhQqG5z8q8IdiBKm8RXyb7M3Wfjm3pZ8rWHzOmniNnqIwAzwqEuIi+oaxG83eBfG8=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767007831; c=relaxed/simple;
	bh=5CUUyN0XwNGBI4pph9vzx7zNY641HasWWpWr54f9RG4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uPOHf3VeT6iJc6TwL1zyadiH/fYzR2GPIfB9kZXQswwaU/kzwjavrYMCTVTP+nsibplGSM9LbHRs8VKi4XR1+M/mlh0uhtsn2tfNE0FiLdcsxAHVJ7aa3R5iJmTTw8mx8ZasBOHIN0yKvFt/eCnZJ3djC3a6aPcLEFGqM+7W1J4=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Fewa3ada; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Fewa3ada; arc=fail smtp.client-ip=52.101.66.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=F5ZpCh8LHFrxQg36kBRcoM36NJ/pdX2cH+g4WY/aUe4wwzkddrKAvywcwZ2DJMn0L356KG0ohQl73jSj6LtJx6wvuvsbS3Bq66ERve5TpTdR9bwuVG+JbZuinFTY/6SDPmSZemF07+Om/Cs25/JEG27uLVtLKHCO1xL6gGVZLoUbSGEj322YnDH6F/34ZKnsCpkzppIFgLHw8b6tWxpT6HXUS9ESgbxd5xplgyrzpfX9GWc8VRx5hm6syf32fVgFz0LjZrUBPFuM64EuTXrstj/0dLW1DvgqY5wqoosBvXlfXbiGwaHwqQN+UKFnwHv8igA+N4XsiJNgdrPzkEqpGw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CUUyN0XwNGBI4pph9vzx7zNY641HasWWpWr54f9RG4=;
 b=TjmTKeI/0gOJQ1CDUrukfikQujHfL0A/AQQBptDmqgkWwhPMEjl96iSvWlfWrWjoj+UhQT6Qf3XEn8DRBcTOaZABgw/XP/WvYJzAlgvjzntoImqCCTjDO6jKXqW2ovPvSJioO7AgvNcrqP2tnHt436k37hsRVQeoT/OmRTXvjYhCizRa+O6Y6qiIDQNcXsk6RpjY37NEaOxl6jJWgnQuad4g7oTrxNQDShCFZW52Ahlpz+u2ubdY9dxHzgxkrGs8y/zi6s7jnkxwrDrQUQFlJFdOqSRvq+DPVBRU80QAmRKtRUbQLv1cpisOO0RwfMZJvqJUK1B4iq4Dtq9f0sm1sw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CUUyN0XwNGBI4pph9vzx7zNY641HasWWpWr54f9RG4=;
 b=Fewa3adayuNPeVTr+El0s+MBD7N89uiAJjhoMvwQ/Hn7/98kUTsukyvthzqOX8t7oCwzPJjhfqMdRzQWtbuM7Clb6YOo2PdT4BlT5jXBgUzZ7iegsogrzuJKwfcllGFMShFYCKGwGp30pPXrwn5f3Ue2QASaOKeHnpZf6I8NwK4=
Received: from PR1P264CA0057.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2ca::7)
 by GV1PR04MB10536.eurprd04.prod.outlook.com (2603:10a6:150:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Mon, 29 Dec
 2025 11:30:24 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:102:2ca:cafe::86) by PR1P264CA0057.outlook.office365.com
 (2603:10a6:102:2ca::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 11:30:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.0
 via Frontend Transport; Mon, 29 Dec 2025 11:30:24 +0000
Received: from emails-1015969-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-157.eu-west-1.compute.internal [10.20.5.157])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 1FF4280326;
	Mon, 29 Dec 2025 11:30:24 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767007824; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=5CUUyN0XwNGBI4pph9vzx7zNY641HasWWpWr54f9RG4=;
 b=kc1DkIdtCmFkR5/MPXyXuKyxkJNpEvQytKeHcrEdWClaqlP4KOzz3fmv6w53gUVxR/eMZ
 HUguMHaNLE8Xi6DGBG2Bkm97CgDktSi/nRA3/H/EXlUjGoxJuskc8jTny6Ua0GNtu7PNcZs
 KlT7krVf8UJgNkDcWGs48hYVxJ0KH5s=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767007824;
 b=o2om6wz6d2Zfye6WBaRmz/hgyUCnlZfsgVP8kiR9py4k+GmLQPK4/W8pNzBWoWax3GFg+
 aCjtk6HN9nYVQggg2W0E0Nhq/k5lHxAg/JEfZKe0CJiECH5NTZ4Ekn+F6StrL9a7/fV0Tdj
 AfspxnEt4LE2qDhPbsQcAMFO9UCyRS4=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNiHPy1N950jhuJm0PbjEW28ObxSaQd/IzEffRuA+vhoXVxXP7ITJfHkjZnbIcwMYKiZIpahqRESgLyMVCRvboFw2vxETIJdBh1agA2AJLaw7NVc/pp1QJ1cN2ksA8TQvLxD8BWOuUXIRvc0gRZpodbbzGcbc5JSkH4SLblrsR58Mxayv2rpvoW4zhkRVF6Acmq1n6SoMnd+0YhSSBU315itOhy12Xyv3r0c++53LzVWUGebE/zl0+l5TBfbMVs8DcbQFbTaLC81eeD0Zh3XFwfR9Gx6O1jtEC9vYX3mLmMDj6LeQb8uO1zDLQpMbdwDTB0uryWCFgv5A38wg2JFOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CUUyN0XwNGBI4pph9vzx7zNY641HasWWpWr54f9RG4=;
 b=mc1FmxSUGNT9ApaDQH3KbZFSBdbk9/F4Eqnn/nClvjio/YJQ8i/HPm2s/6874LWhj6l2CBSXdnsphxaZ4JHuYeFhIo56iqj6iFavPtIGNdUlCr1n7z3CJQJECdwtBH3qN0+w1j6T/FJ53ImYk5YERVohGfTwNcbqaT+QCIC/7NT4U4rlhyaBxnP0Se6WzaJyFQ6j7G9bO52kl9oksLll6nvc/uVFBzPL4X0NOtpCN/jgyG4ayzIDHZeBlVBkfa6G84OknuuGFDMfU2xzsnJIWIwrZr8K68p0Ou4t2HV3WNwzzDNhzEUMNEs6fill5c5llsBEYBVXbkGOkxgJEL7Tsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CUUyN0XwNGBI4pph9vzx7zNY641HasWWpWr54f9RG4=;
 b=Fewa3adayuNPeVTr+El0s+MBD7N89uiAJjhoMvwQ/Hn7/98kUTsukyvthzqOX8t7oCwzPJjhfqMdRzQWtbuM7Clb6YOo2PdT4BlT5jXBgUzZ7iegsogrzuJKwfcllGFMShFYCKGwGp30pPXrwn5f3Ue2QASaOKeHnpZf6I8NwK4=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AS8PR04MB7718.eurprd04.prod.outlook.com (2603:10a6:20b:29b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 11:30:13 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 11:30:13 +0000
From: Josua Mayer <josua@solid-run.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony
 Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, Janusz Krzysztofik
	<jmkrzyszt@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-can@vger.kernel.org"
	<linux-can@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v3 2/6] mux: Add helper functions for getting optional and
 selected mux-state
Thread-Topic: [PATCH v3 2/6] mux: Add helper functions for getting optional
 and selected mux-state
Thread-Index: AQHcafvjRT5zKouON0q90YQR/1KWr7Ul4PSAgAYWxYCAAdf6gIAKyVGA
Date: Mon, 29 Dec 2025 11:30:13 +0000
Message-ID: <e8b0579d-21b9-4072-857b-5afab92c42e6@solid-run.com>
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com>
 <20251210-rz-sdio-mux-v3-2-ca628db56d60@solid-run.com>
 <CAPDyKFoYd3WKGrjD3DEzZH8EfgZPmRkrqL=rdoKNuAADrvz3Eg@mail.gmail.com>
 <20f2128c-c6cb-4b13-aa08-b93e540f5bd9@solid-run.com>
 <CAPDyKFo2jsV02qSDBSZTewJjV09AMO8iETU5Uxqz+GBnd0JY6g@mail.gmail.com>
In-Reply-To:
 <CAPDyKFo2jsV02qSDBSZTewJjV09AMO8iETU5Uxqz+GBnd0JY6g@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|AS8PR04MB7718:EE_|AM4PEPF00025F9B:EE_|GV1PR04MB10536:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf40e8d-073f-40f8-6845-08de46cda8a6
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aDExRURpdTRId0lKekZVSjVQU0tnbHNDU003a2h1VmVxVGFlNjhuZGdvSm5t?=
 =?utf-8?B?b01Qb0R5RkFHZ0R1R1U1dGtSczJWZ0pQYTh4ZGg4T25CZ1dSSVB2dU1PMU1T?=
 =?utf-8?B?TU1oK0JhcWRpZytTLzJXWDZGYUd5dTVGeVJvMnRxbkJLQXpxV3lvRFNwUzVY?=
 =?utf-8?B?bVNsM002Z2dxM3pMZG9hdWI3cUcrWnJKVlUvODJuMmZSNVVWeW12VUFTb2RD?=
 =?utf-8?B?dzJvVyt6M3NwQ2RWRWJGUUhESVNDY2RUdFFQbWJwOWViSWJhbTBKQ094RGlY?=
 =?utf-8?B?SjI0aEdZdWUwcEFmT28rQnY4cW5OZmNBWU81a0lteVlBRm9makEzOTRYMlZF?=
 =?utf-8?B?bHljblhYU2ZYeXhLZ0RTZWpkbHdLd3J2TVFOOGM1Y0JXVVdHeVZLYmdVNFpJ?=
 =?utf-8?B?cUdDaW5OQjZ4ZXQ1K3dweVlsZGNkd2xvZWFra1JDN3VrUGFjQ3N2TkNpZWov?=
 =?utf-8?B?TTZ4ZWdYTzd0WlJ4NSsrazBjbmJBOVhmK2dpZEdwSGE2N2ZaTkV6eURaajlQ?=
 =?utf-8?B?YUo0QjBVdkhrTk80UU5HV3dtcStFeDdnNW80bjRNNXJ0VWQ2N2dnS0ZmMFdk?=
 =?utf-8?B?UnpHZGhNalJ5Ky9XWWV5RW1mT1lSRlQ4SXlqMmJ0cTJLTDhpVmJUY1FxRCtR?=
 =?utf-8?B?UWpscXFNdmhmdkNrY2x0akJsbWt3UldFemo0M2IrRklGZDdNRTZZaEE4VE80?=
 =?utf-8?B?a1JsU3VHQUZvMjVhWllOclZTa2VsMnZjeURIMFAvL0V5cDZRaTEzTUdJSzRU?=
 =?utf-8?B?eWJmV1BENm9UcTEza2NHTUllTUVUQXFINDUycmp4c0RYSWttQ0F1aVUwb3NU?=
 =?utf-8?B?T3krSnpOUGdVWEVwMEYvb21HeTFtbENURndlNGhySHJDdUFZcGNhV29iNlBr?=
 =?utf-8?B?alJYMnRxajZaaFl1N3g2eEZvNHdVNjB6V2JQZ3liN25JYytPaVpIalVGREVQ?=
 =?utf-8?B?d1plYnVacWd0Y1RTazJkd25CY0dxSzQzMUhId1pHYlpQOEU0WDZlTngwSXVQ?=
 =?utf-8?B?cXZ0eXBlK21CV1dFQjZUWGtDcnIzbzIra1lqenJwSTdQN0Vweld4WlNlTmNC?=
 =?utf-8?B?VGJkb2NvdC9jc0ZTeUh1SlR4KzAzVytWN1NEcnlOczVpQmpIQXVyS1VaTkJT?=
 =?utf-8?B?dVNGR2hIa0MrcXNFWE1jZjdzYUR6OEtsL0M4M29USjNJOHIzTDNiaG5oY2hI?=
 =?utf-8?B?eTV2NUhWK2poQklPYUhjYzhzYWwrbTJJcWVkRkdQV2RJekMvN29vNnpYcFdM?=
 =?utf-8?B?ZHpTRDlUQW4yUElPbkI3REJ2Y29jMkE2NEh5V1EzMXJlVVdFU2NOa3hpY3hk?=
 =?utf-8?B?cXI0Y0JjZlMwV3NpWUpQTkdQNTloL2g2dTlOY3Q0b0xZVXY2Q1dRQWoydjln?=
 =?utf-8?B?ZDBjMjdNWFdnbm5qTHM5bzd1bldvZGdtUTFSMU01RVNyZTNLc0VVSFNOTW9v?=
 =?utf-8?B?LzdoSmswR1ZTYlgyNFNybjJkTDMwalUrVlhzdkFpeVRxTFlrWTJrL3VZQWxa?=
 =?utf-8?B?WG5kUFZOcVdvY0hnc21CaDdiNm5MaVg5Ujlobi9zbmNMbnpLUDlCN0ZZMmkv?=
 =?utf-8?B?N0hGbUo3Y3pnRE1taHNoY3NZcmUzUzlKdlhCQU1nUWR2bTNVb1pMc3NTOWhS?=
 =?utf-8?B?SlhDSC9mS3ZIMkJGcHgzTmlvaWFKZ0dYbnNqZC95dEV3U1NkMVBnSnFYNUQ4?=
 =?utf-8?B?MzFXWXgyOTBLSkRJakhiY3BRL3F3Mm1mb1dXeVpVQWo4Nm1PSUQ0K1BROVpS?=
 =?utf-8?B?cU1abFprMHRwbENkZlJENWpQK01CZ1pTbTdua2VxNmx3cStzVGxic3FUQnh1?=
 =?utf-8?B?d3NPN1ZhZkk3L1FGaVJKZmVDaUFEU1BSb0Q4WnkyT3ZuZWZ3TklmZWFxNjkz?=
 =?utf-8?B?M1lvVTZreThuKzZGV2lrMkxjallxTkZXUGVMWVVZbXNhcjJxZk5xd3NXODF3?=
 =?utf-8?B?ZUYxSzdVQ3ZOUE5kT0dqa2R1RkdiVTdBL3YvVjRKRmtLOHBSUk9ObDdBZUdY?=
 =?utf-8?B?S1hGUVVTaHd4VkFRemo5YzNreTVKUmxPczNHU1BnWmY2Y2dCZmV1Q0d2a1Vi?=
 =?utf-8?Q?TA3b8P?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5D00E94346F9148A67059EFDC4138B6@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7718
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e5dcc8089b4c4684b2f09dae53246ab5:solidrun,office365_emails,sent,inline:c2fe958e95e40757cc4669b5a2af7fd6
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ba7488d-221c-4cd4-2356-08de46cda20e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|7416014|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?enMxTGx6a2hyams1UXFhUHVwK1FGRzhNU0ZVdU5BMEV4RUZLMVhEUVNkalJj?=
 =?utf-8?B?OXUzVHJwWUNkRk1hb2FQRkdpOW84dFphc3pkZUpaTnlYUjNnYVlnZ1B1WCtD?=
 =?utf-8?B?ZHZMdHFtTnpjT2xTcGxWMmtpeUxsZTJtQnd2UWpOUFlGWHVVcGxXSHJvWlo5?=
 =?utf-8?B?RVpVR0g3emNQclB4QjlNc0t4cDBuN2RGMjZ5WFc4NFErOStyV0ZGOVVTeFhY?=
 =?utf-8?B?SkJwcnltTEVWTzYyQkxCZmZGait3YmZ6TkxrSndKOVlnZFZCNktNcDZaR0lP?=
 =?utf-8?B?amRnTWE5dVQvcUpkS0tCYW9kYTdQVXNsWlNwUkltY1VqcXAzeGJCSDVUOWUv?=
 =?utf-8?B?TTRhb21KM1J2WlVydUpBWW5Rb0tIdm5XWmYxdlF0SjVDNHBZWUg5YTNXVGFp?=
 =?utf-8?B?Y1pLNC9NZHVSNDF5MDlKdTBkRTh5Rnk0enkzSmxoTnh1L2pjZDA0WWluZzUz?=
 =?utf-8?B?YUNheXFybncweXdja28wTHYrcWRKamkrZWk1Y1dxSHRsaHlkanRzaWlpT3Jl?=
 =?utf-8?B?MUVMd0UvOG5FL3VxV1JseE5qOC92SUd4UnRQNTNlbUNTWnJVMjB5QXRUWUhq?=
 =?utf-8?B?cEhyNkJWR3hsQzJ4R1U5ZzVlam9NdkhZek5TQm5idDU2MGFyRkZxQW9CMUlK?=
 =?utf-8?B?NFNKTEZ1SnJGdWkzQkdGcFp1a3ovM0RYN2tYV2FJOHBDTVUwaklXQmNMRFpq?=
 =?utf-8?B?ZmpsalpRTCtMWGNxQ2tLa1FTKzdmMWM4dllZL3QxZ09QbHB4RHgxSmgvcFpt?=
 =?utf-8?B?M3VMbTZUN28xTnEzK214eE1lSnYrdFRkeHVMNzh3ODhHaURqY0Z3NEM2SjlY?=
 =?utf-8?B?eE8wYURmU0V0RDRTaDQ2Znd5UkM5ZzdselNxcHhNZy9SaStpWEJObHZmbEpk?=
 =?utf-8?B?b0V1VTNKeTljU3hpVklWbEIzRGVnUk4zWVo0dkhoM0xHS0xhbm95QmNzZnYy?=
 =?utf-8?B?YS9HVU1nRGlueXJ3STdmeWRmWVRpK09WaFVWZzlBM3U1RHlMZ2ZuRHVXN2ti?=
 =?utf-8?B?bnRGZnA1ZTN4dm9hWXB5ZHFYZDEyMGI0V3E2STJYQ1RYaUJXdzgzMTVmcnhF?=
 =?utf-8?B?K3k0U2xzS0JLN1JzN0NQYUx0UnRFaHBHTDZTUzhzcEloV2dzMEswUGlwSGF1?=
 =?utf-8?B?b0dERklEVUxjOWhHalhQcURvbi96azlXN29Pem9rNXNzaEs4cmhEM1RQY1JB?=
 =?utf-8?B?SnByS2lKSkZIL3NMbDR0bitqR0ZMVS9wN0hKS1NxTStYS1NuSGZrQmZnZ3FU?=
 =?utf-8?B?bEZpeHowbFJvVnlOaXFTNW1RNTNzVjdnVVVRRjNDNTdjMjlYMkdrT1JERTNv?=
 =?utf-8?B?dGR1RHVjdWl1ZFNTdTZodkVxbjRxVnZWMmJ5QmFSbFloWFpwblFVUGRQaXQ2?=
 =?utf-8?B?UVYrakRheVl2dGVFUGtGbHRMdElOQVJTeGdBVDI1VzdCbUV0UkhqbHJvRW0x?=
 =?utf-8?B?NzlUeVgrbTdmSXFCNHdXMkRndHFpRXlFQ3MxVE4rSndaTEJCSTZNMys1Zzk1?=
 =?utf-8?B?SjZtWXVVdGxXTnFxYndSMklXOUIvZDZsRVJDSUJRa2pzOE1LNW01VjJXQzFw?=
 =?utf-8?B?c1I2UFZmZWtNQ3RWNGdaelUzbHhybXQ2UnRaWlZiWEpsMXZReHBJRk1QYzBY?=
 =?utf-8?B?WlV2UFVMblU2T2hhNWEwMWg2NlJjZHhBMk02akY5RzE0MERSWTRjNUpMbXVY?=
 =?utf-8?B?RWpwdlZoYUg4QWh4RDNzT1FVYlRzU3ZDOS9STGxwTCt2VU1OdmFVOXpGYmw4?=
 =?utf-8?B?Mkc1UDZiMTRyOTBxM3NQQVlOMUZQMzVyWjdzd3cwc2dqMStPZEtGTVgwN0ZY?=
 =?utf-8?B?Z09zSzdjTjl4WGNMUzAwUTdwM1NSWlFkTHBSZ0t4b1ZGV3U1czU1K3dTT3hr?=
 =?utf-8?B?b01RT1JNYmVyekQ4elRQUDV3WmRDRDRNSC9qNVBldStwSWYrMVZTMjR4NXRV?=
 =?utf-8?B?STU0YzU2Uk5kWjFiS3NzUGhWQnhBYkp1N2FOYTV5c1EyemdUeVRjclZGaVpU?=
 =?utf-8?B?TWljQnJONVE1V01BQUhHRmJ1WVRqVEJpbFV3UnhGaU9DZzdtcVVwRUFtOUJv?=
 =?utf-8?B?Z3NxaTB0NDRwTkg0enNQRE9HSW0zZGJGZmJXMUVDTXNCakNmcFRRMkR2T01J?=
 =?utf-8?Q?95GU=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(7416014)(14060799003)(82310400026)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 11:30:24.3912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf40e8d-073f-40f8-6845-08de46cda8a6
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10536

QW0gMjIuMTIuMjUgdW0gMTU6NDcgc2NocmllYiBVbGYgSGFuc3NvbjoNCj4gT24gU3VuLCAyMSBE
ZWMgMjAyNSBhdCAxMTozOCwgSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+IHdyb3Rl
Og0KPj4gSGkgVWxmLA0KPj4NCj4+IEFtIDE3LjEyLjI1IHVtIDE0OjM4IHNjaHJpZWIgVWxmIEhh
bnNzb246DQo+Pj4gT24gV2VkLCAxMCBEZWMgMjAyNSBhdCAxODozOSwgSm9zdWEgTWF5ZXIgPGpv
c3VhQHNvbGlkLXJ1bi5jb20+IHdyb3RlOg0KPj4gY3V0DQo+Pg0KPj4+PiAgLyoNCj4+Pj4gICAq
IFVzaW5nIHN1YnN5c19pbml0Y2FsbCBpbnN0ZWFkIG9mIG1vZHVsZV9pbml0IGhlcmUgdG8gdHJ5
IHRvIGVuc3VyZSAtIGZvcg0KPj4+PiAgICogdGhlIG5vbi1tb2R1bGFyIGNhc2UgLSB0aGF0IHRo
ZSBzdWJzeXN0ZW0gaXMgaW5pdGlhbGl6ZWQgd2hlbiBtdXggY29uc3VtZXJzDQo+Pj4+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L211eC9jb25zdW1lci5oIGIvaW5jbHVkZS9saW51eC9tdXgv
Y29uc3VtZXIuaA0KPj4+PiBpbmRleCAyZTI1YzgzOGY4MzEyLi5hNWRhMmUzM2E0NWMwIDEwMDY0
NA0KPj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L211eC9jb25zdW1lci5oDQo+Pj4+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvbXV4L2NvbnN1bWVyLmgNCj4+Pj4gQEAgLTYwLDUgKzYwLDkgQEAgc3RydWN0
IG11eF9jb250cm9sICpkZXZtX211eF9jb250cm9sX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAq
bXV4X25hbWUpOw0KPj4+PiAgc3RydWN0IG11eF9zdGF0ZSAqZGV2bV9tdXhfc3RhdGVfZ2V0KHN0
cnVjdCBkZXZpY2UgKmRldiwNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IGNoYXIgKm11eF9uYW1lKTsNCj4+Pj4gK3N0cnVjdCBtdXhfc3RhdGUgKmRldm1f
bXV4X3N0YXRlX2dldF9vcHRpb25hbChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+Pj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICptdXhfbmFt
ZSk7DQo+Pj4+ICtzdHJ1Y3QgbXV4X3N0YXRlICpkZXZtX211eF9zdGF0ZV9nZXRfb3B0aW9uYWxf
c2VsZWN0ZWQoc3RydWN0IGRldmljZSAqZGV2LA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbXV4X25hbWUpOw0K
Pj4+IFNlZW1zIGxpa2Ugd2UgbmVlZCBzdHViLWZ1bmN0aW9ucyBvZiB0aGVzZSB0b28uIE90aGVy
d2lzZQ0KPj4+IHN1YnN5c3RlbXMvZHJpdmVycyBuZWVkIHRvIGhhdmUgYSAiZGVwZW5kcyBvbiBN
VUxUSVBMRVhFUiIgaW4gdGhlaXINCj4+PiBLY29uZmlncy4NCj4+IEN1cnJlbnRseSB0aGUgZHJp
dmVycyB0aGF0IGNhbiB1c2UgYSBtdXggc2VsZWN0IE1VTFRJUExFWEVSIGluIEtjb25maWcuDQo+
IFllcywgYnV0IHRoYXQncyBub3QgZ2VuZXJhbGx5IGhvdyB3ZSBkbyB0aGlzLiBUaGUgZHJpdmVy
IG1heSBub3QgbmVlZA0KPiBNVUxUSVBMRVhFUiBmb3IgYWxsIHBsYXRmb3JtcyB0aGF0IGRyaXZl
ciBpcyBiZWluZyB1c2VkIG9uLg0KPg0KPj4gVGhlcmUgYWxyZWFkeSBleGlzdCBhIGZldyBtdXgg
aGVscGVycyBib3RoIGZvciBtdXgtc3RhdGUgYW5kIGZvciBtdXgtY29udHJvbCwNCj4+IGFuZCB0
aGV5IG1pZ2h0IGFsbCBuZWVkIHN0dWJzLg0KPiBDb3JyZWN0LiBJIHRoaW5rIHdlIHNob3VsZCBh
ZGQgc3VicyBmb3IgYWxsIG9mIHRoZW0uDQo+DQo+PiBJJ2QgcHJlZmVyIHRoZSByZXN0cnVjdHVy
aW5nIG9mIGtjb25maWcgZGVwZW5kZW5jaWVzIGJlaW5nIGluZGVwZW5kZW50IGZyb20NCj4+IGFk
ZGluZyBtdXgtc3RhdGUgZnVuY3Rpb25hbGl0eSB0byByZW5lc2FzIHNkaGkgZHJpdmVyLg0KPiBJ
IHVuZGVyc3RhbmQgeW91ciBwb2ludCwgYnV0IGFkZGluZyB0aGUgc3R1YnMgaXNuJ3QgcmVhbGx5
IGEgYmlnIHRoaW5nDQo+IC0gdW5sZXNzIHNvbWVvbmUgaGFzIHNvbWUgZ29vZCBhcmd1bWVudHMg
bm90IHRvIT8NCj4NCj4gTW9yZW92ZXIsIHNpbmNlIHRoZSBzZXJpZXMgY2hhbmdlcyB0aGUgbXV4
LWNvcmUgYW55d2F5cyAtIGFuZA0KPiBzdWJzZXF1ZW50IGNoYW5nZXMgZGVwZW5kIG9uIGl0LCBJ
IGRvbid0IHNlZSBhbiBpc3N1ZSB0byBmb2xkIGluIHlldA0KPiBhbm90aGVyIHBhdGNoIHRvIGFk
ZCB0aGUgc3R1YnMuDQpXb3VsZCB0aGlzIGFsc28gY2F1c2UgY2hhbmdpbmcgYWxsIHRoZSBLY29u
ZmlnICJzZWxlY3QgTVVMVElQTEVYRVIiPw0KSWYgaXQgaXMgb25seSB0aGUgc3R1YnMgLSBzdXJl
Lg0KDQpBbmQgdGhlbiBpbiB0aGUgcmVuZXNhcyBzZGhpIHBhdGNoIEkgY2FuIGRyb3AgbXkgY2hh
bmdlIHRvIGtjb25maWcuDQoNCnNpbmNlcmVseQ0KSm9zdWEgTWF5ZXINCg==


