Return-Path: <linux-i2c+bounces-15248-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAE7D39325
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 08:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F0F2301586F
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 07:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C9927A12B;
	Sun, 18 Jan 2026 07:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="J6MIty43";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="J6MIty43"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023083.outbound.protection.outlook.com [40.107.162.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C79D23EA85;
	Sun, 18 Jan 2026 07:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.83
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768721646; cv=fail; b=m8SS5DeSnBEBvyKnqIFRtyL1h2u7djtbvdw79wIqh4zHH+9uCIN9d2DtY45Pet+pgP29jgHUxFsNuLYVnNhBkwOKaNyaWbv6j/trUBx0QojTnJpUf6OxmiG3kRqck+oa/H56d8n2VlafDTn72gwX/e1lCFeHJ0SdhMKg9uszLFc=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768721646; c=relaxed/simple;
	bh=5e0D3xub2T5uwa+KM5U+9EDzws4Nleic90k48Edu/ho=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AgG80fCkjaf8oAkae9eCTAoDYJwMqlEoNt0nAqX1QSChE9AD+8nEmA3uFmOtiOSVEtdW0Y0CVEbWYzfBMKTVE1Oc4lDzu7b9rPB6+muo2v//WvnkuazIETdhNVOI+FteIL+N7uJswpfRM/2biFDRvwzKqLLOpnnyeDjZMPL30KY=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=J6MIty43; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=J6MIty43; arc=fail smtp.client-ip=40.107.162.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mAvuMri9dZBzi+jBFzckY2ecJ499zB67gYFrSrf8BxB+3rG8egwOFJVYZbj6HCwlQ1ge+7AGVx/83kVnzYIrWFeYr9n8qOU/b/kbT5MfQ0xI2/01YAF9osxWF9F2157CSIAFA/0lbj0vO8Wry6U4TC7heIKjkvB/5xFur37SsvSDk8ftx6zcZAX8z4k/svkdkGrkpJjZr4TjIcf35LB0rw623xjmlN7xS4qtMTk1zIZp0O+IoBiM/PThW/Ho9jozdMiAeu535PmM18teQdFj7ZMdEEgjDypmghUgXFwHA8MQ8It49/Ens90YCVecvnF7G4Cnri2H8BdwKdJTMY6iNw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5e0D3xub2T5uwa+KM5U+9EDzws4Nleic90k48Edu/ho=;
 b=qf9246Izza6u8Q0DfE++Bqtc4JS/iiS6B/FI9jyBqgIz0NOrUbg+EwSY35mN1FMiS9q4ZRoW8XtFhp3aOpT4vpxmUn5DOlZZAWctoTwf1EMnk+nSnx+sw2n74TbhTc43UVe/MIWufyj5QzqmCsvXhGFTfc5uKMeteAhOaIsDAWoZk/pKWJNF2RxB032QV2vThM/gnD3DLYA+aEBhZ2Av0p4N4cVjfgBwV649T7BnVGC0+lH3HXGT6gwE+cbveMTKcoVzFjYXCk3Ef4GWufdxZEmuod1ETMSJDnGLq8jcArlNamMU/s5imJ8ssFQWvQvlZ7CaKwWhO0rnCzCfnqQ3CA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e0D3xub2T5uwa+KM5U+9EDzws4Nleic90k48Edu/ho=;
 b=J6MIty43sEvfubXbBGmdkzOfVqza/lzVexnMOH9sdO321cndipIZ6t7XEZeEKtsr+FwRogdngCPXK5NgVJnDiP6YGsb1CLNzIZPyAZOWBHpTbACez3s1Nf40gbk/Zo0N00rF9U80GC9BpJBRWCl+P+THLunEAQWubKbTauU9uxI=
Received: from AM0PR05CA0074.eurprd05.prod.outlook.com (2603:10a6:208:136::14)
 by AS8PR04MB8296.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 07:34:01 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:208:136:cafe::e) by AM0PR05CA0074.outlook.office365.com
 (2603:10a6:208:136::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.9 via Frontend Transport; Sun,
 18 Jan 2026 07:34:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Sun, 18 Jan 2026 07:34:01 +0000
Received: from emails-5074232-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-10.eu-west-1.compute.internal [10.20.6.10])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 0DF948018F;
	Sun, 18 Jan 2026 07:34:01 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768721641; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=5e0D3xub2T5uwa+KM5U+9EDzws4Nleic90k48Edu/ho=;
 b=qeXjwveYAHAn6jFTxt2wtoWKkSbuoola7maJee3PTcSc7/ZklLow9W/ZIsvbRNxeqUt4y
 3Hw9HroH60DgH8Cmh7aUbHoHVD0MMFO+ANDujf+7wV8DYom9WybbRnhKSD3nq8qXI2gEDqU
 LmoYPCjretxL4VE7Bz+/ITNyQtxr0xs=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768721641;
 b=KhDwYrqvBF+topZWwOpqEIeBELwcMtk1s1Kacaadt3DtksLemJqrABim8E+x279IKnwSm
 CJAkBqvAWQGFRb29AFtWpcpXE/UaRb8DlduD+XaJ7r2kQB4deZgQm05Prh0O6E60/s4T/L+
 BUddmGBTxnV97DcRMzDNNDz4Zv6jlf4=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIZxZ0/AK9IcJPzBX5OvildDujrCRZwIQ0eiMCv4EPY+ocagmZsbej/iSXPh2kdanEb52ds9sVfUjebkB9q6pr1olJPcUCZfD/kPneCw0UMCSurADlK40BNAMP5JFEZqAqIpu9cpbTUYssyAwmJVunQWePzqLImqI3iI7ZV96LUKznuH19+uALom8FEAjgB7yQ7PYVGy1MzzKfkUv8Zu0P+yIuTOa8y4Gp73YVhxrJAinWnIXZbE0rQzwRmEskYLqPmL23cUMFiWzLujHvdJPPR9H9iO+INrNFcg6rOZnFrJ82ZhYnkyWhJX3l8MbSF9ESv3CDwIJLJVwUrMkI4fKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5e0D3xub2T5uwa+KM5U+9EDzws4Nleic90k48Edu/ho=;
 b=hz4quB7VjGVIniYT/nBl+AC7xtX94vStJ3COX1UDYr8F7ScHBVZylOiml6kDMXFgBFV+VUpfVwfVGmmUAaxwV4pFIbP9vVopUYuqIiMTXXuBbqKgH2VdISMtGJxre1odZvam2RCZnMGPuLLkPXXKf/8ukiYM/qdkHh+7TTMnhTooP0211gAXPQ9KoSrNb5sguINrTJJccqFP0AEAvyHN3a+/9gA9Lr6cIMCrZHKkh4xslxePdPACotuPRkmdwQbGq3yeYOPCpm7GxN47xE8GflFrZZ5crIpymEKd4h2sfVt2sqRTV30utFBhr0ptwZrJTTOg7hzXQ8mss6TI4yBIfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e0D3xub2T5uwa+KM5U+9EDzws4Nleic90k48Edu/ho=;
 b=J6MIty43sEvfubXbBGmdkzOfVqza/lzVexnMOH9sdO321cndipIZ6t7XEZeEKtsr+FwRogdngCPXK5NgVJnDiP6YGsb1CLNzIZPyAZOWBHpTbACez3s1Nf40gbk/Zo0N00rF9U80GC9BpJBRWCl+P+THLunEAQWubKbTauU9uxI=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DBBPR04MB7787.eurprd04.prod.outlook.com (2603:10a6:10:1e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 07:33:52 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 07:33:52 +0000
From: Josua Mayer <josua@solid-run.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Vincent
 Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay
 Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>, Aaro Koskinen
	<aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman
	<khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
	<tony@atomide.com>, Vignesh R <vigneshr@ti.com>, Janusz Krzysztofik
	<jmkrzyszt@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v4 7/7] mmc: host: renesas_sdhi_core: support selecting an
 optional mux
Thread-Topic: [PATCH v4 7/7] mmc: host: renesas_sdhi_core: support selecting
 an optional mux
Thread-Index: AQHceM9MzQHRvLaNr06McpFVANGU97VRpjCAgAYBxoA=
Date: Sun, 18 Jan 2026 07:33:51 +0000
Message-ID: <0eede154-9769-41fa-8cdd-a9591c147b58@solid-run.com>
References: <20251229-rz-sdio-mux-v4-0-a023e55758fe@solid-run.com>
 <20251229-rz-sdio-mux-v4-7-a023e55758fe@solid-run.com>
 <aWeC5brP_KdrCmHz@ninjato>
In-Reply-To: <aWeC5brP_KdrCmHz@ninjato>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|DBBPR04MB7787:EE_|AMS0EPF000001A2:EE_|AS8PR04MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: e5dfc70d-dc0b-4850-d16c-08de5663f329
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VTBNcWNOcHBNcmNweDlsVG5DMWswV09LaGpJN294bHNEYnVSazFFVVhrRDZw?=
 =?utf-8?B?aWNQYmhZWndmSnFrQk5RdGMzZHNKVTg5T2Izc2RSRG9FUm43YnRoSUZyNG04?=
 =?utf-8?B?UEtkTFF1YVJYQWg3TWF6Y2NvaTkzNHBTVnRJNGtkcDBob3JBamh4c1dEdlEy?=
 =?utf-8?B?T2M4TDFGQmRBQ0lnZjNhZ2VwRlpZa1pnQnB6OXBHbFJqRXc3dmREV3BLaEJV?=
 =?utf-8?B?aFQ1QkpKYUJyVFd4alh6NEVTc0xwV09LNEE5eFlFZXJmdDJTMlc0aDdnZkhi?=
 =?utf-8?B?UU0wU2J4N0JnaVd2c2d2VzliaVQraXdUOHJ2aXJGUnpSK01GdGFPK0ZIWmdp?=
 =?utf-8?B?bEkvS0RvVVlqcnF5NzArcmhaWnh5amk3emtIek1ReDMycTVmY0RLMzZtNkxG?=
 =?utf-8?B?NGJpYysyT3BvV2tFUE44U2JNK0NRUkdvTnllRllaZFNYRzU5akM0cXVENHJC?=
 =?utf-8?B?S2puM2d1OFNqNWZtWDN4MTdBR29pVGJBWFdsWDloQ1B1alpqelluSmIvdlFa?=
 =?utf-8?B?LzlLdklIcE15VmNyTGIvRXFsbDRCOWQ1bWVDN3ZRYjMxb3hqMGcyYkg5blpS?=
 =?utf-8?B?VEpSQjlpMS9IaEFwVDVCci9RVnh0eG1HeHh4M21lK1ljVzhWVWg3RWVXckNY?=
 =?utf-8?B?TmdBQ0ptRHNFTVBOeTdBNnVxKzFKWWNKcElsK0dTNG5tNlpTMFpyaFNSVkV6?=
 =?utf-8?B?MERTM0NUY2VWNEFxeFp3UUhsTnZ6N2VINUMyOEk4YjFNdlM0NUp1ckpNcGxU?=
 =?utf-8?B?ZGQ5ME0xTkZTV3RFNVJzem1CcnF5K21zV0ZqcjZGeXpJaWs4MWJQNU9NQ2dq?=
 =?utf-8?B?ZFVUZWtSMmN4cFJucGR5VFB3MVRyS082Y0RaUTlhLzdqTE1jdlROOWJTSGJY?=
 =?utf-8?B?K2s4OHQyVkg5eTZkOUVzenM4UUl3Z1IxZnJ5UUNJSE9ocUtkZUw3M3FwNHFT?=
 =?utf-8?B?dVdETDZRVjNPTFRiTWxTa3YrcW1POHQxTTdXSmd6UG5laDNKUjREMkd5WmpS?=
 =?utf-8?B?Z1VTMHhXLzViT0FmRjhNbHdTVFFoVTloQkpreVVBQm1xanF6MkcrQkt5WDM1?=
 =?utf-8?B?NWtVR1p1blZPYzBkOGREWWw3L0VWTWtGeVQzVnU5K1FGaU4xWDMvL3pCUHZV?=
 =?utf-8?B?SDZDS3JJMU1qSXNHdmVPMlpaTy9CT2RxbWUrd0RYdGgweFVoS0pwWVgvU2dN?=
 =?utf-8?B?WGhUbW9jYTcxT29RQlNmTnk0TndxRWlPZVN1Q1VuWUJZbE5tS04yczlYSkFL?=
 =?utf-8?B?WmVVYzdDNURPMmJUWE1ScGI1d1BjdDBHMmtUMmdZVUk3RzJaaU5sM2RhUEpV?=
 =?utf-8?B?cUlYSnlQZHZzdm1DNFdSbGt5YUh1Q2FNZk9PWXZPbVBEWGlERUFUUTVYT0kw?=
 =?utf-8?B?KzhMT2puSGdBTEhzR0RVWkhXK29UNXdMVzNNazRmU29NMUYyN253bGRsbkJt?=
 =?utf-8?B?YW9nOVMvdWpnS1NQSHl0WU93WFdTekdnaEphQ09CWG1KTndUa2ZLenQ3MVE1?=
 =?utf-8?B?K29OeHBOQUJYcGJORTFnSEpNekk1Rnp1ZFNuR044TmlncHhkUnNlQ3BzYitT?=
 =?utf-8?B?Y3g4S3VEaU03T2dSU29XZXRtMzhzL0VUT2JmOVdZVzFZYUVoeFpUKzlBU2Fi?=
 =?utf-8?B?S1cyanNvTDdkMERpd3BQSndXOWRWZnpJa2h2Q2IxOGlKQm8xRWNWcnR1R090?=
 =?utf-8?B?NENJdlZIdUl1Y09OZGtGRE9NTEttMUxKb1Z0WFZBblplaURIYWdHVTNWU1hV?=
 =?utf-8?B?QlA3WTBDeFBEZ1h0TStZSGk0SGRuNGswRVBVK0hmWll0NHRac2Rndm5Zck5U?=
 =?utf-8?B?NkxKTlVZd1NXTVNaWlVmSis5cnl3U3BlSzlRNmFRRnZOeklyMEZqdU9aeUNP?=
 =?utf-8?B?Y3cwdjE5LytSeDRreEVUb0FGcUxVdThvZVB5cHlubzdLQUFBcUZsR2hURkVl?=
 =?utf-8?B?ZHF1c3Z2aWhlRWF3bzhUaFBoVzZpTjRib1BVajB3RTRMVFlyaWNLcy9HN1ly?=
 =?utf-8?B?U0haeWZhNm5jZ3h3R0ZaMEluOGI4ZVhBMEtxRjd6M3czQ2ZPeTcyTTZwZGVG?=
 =?utf-8?B?VnZZcDZKZlVFaXlrMDFBaHdNb1U5bEZLaFN3d09wcGd4NndYNlJjM2xiVDk2?=
 =?utf-8?B?Z3VnTU9KN0dmOGptKzhGUm9VUzdyV1JxbzZac2VPSHJsczhKN2ErTiszeisz?=
 =?utf-8?Q?fOMLS1QVtXF82mh90DvMJb4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8EB929F8A26FD4C9C492438EFC82A87@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7787
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 02639704657d435f9f1d897d1a0c9632:solidrun,office365_emails,sent,inline:4c287e403d3c213017091123985e99c6
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5378f368-da69-4522-a26a-08de5663ed80
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmFZTXJXRVFFQmMzY3M0TEt2L2pOWDNZb1dxR3BLUDYvWjkxK1NETjh0SUtD?=
 =?utf-8?B?Mm9sKzFwM0JnUTJuSW81enNNeWRsT3RkMlNWdmllRW03QWQ1T0wvTHEyblY2?=
 =?utf-8?B?cGhlU0RUU01aRWZNcGgrNzN5NFZaRGU3R2tBU3ZiSWlIOTIva2I3VnZPWW9o?=
 =?utf-8?B?R2srUE9QeDFhZWhhT1A5WEkwVG9rRGtTYzl0UzJWR2ZwaUIrVFRwUEkzeTNF?=
 =?utf-8?B?eW9nV281NjJXalBXdDhrbkdEMzlRclVTVmI0MHBuM2xLM0FDWW9EUUJ6OWth?=
 =?utf-8?B?SlZwdzJSTzFmcG1IWStKdFNTRU9OejErMHlSVk5KcGo1VHN5REpuZ21pdkps?=
 =?utf-8?B?OWpZZEE4NHcvNGU1ZFUxYUxjOS9sYzNBRjBGaGRac2hlRlp6WEpaY0Q0YjhM?=
 =?utf-8?B?K0lHcFZtOG5uUVdOTjZYSUpJT0dvLzVIYlc4TmNVMEhBaERGQjB5OVdoUGpW?=
 =?utf-8?B?bi9QVU53OGpGalF0Unp2bGpEeG9LdHdWQnZxaytFdGdCVVF3THNhUTRYOEVQ?=
 =?utf-8?B?LzQ1Tkkzdnl5WFdldlJxOU5sTGZORXdkTlVZUmh4STNVVHo0ODNMaUpzeEVo?=
 =?utf-8?B?NTBKdDd1SHZiMjFSeU9nMmNsanJrRXNadWFWai8weVYyRDdPMU1EU1dUa2cz?=
 =?utf-8?B?bERCZGwxakVWY3lQQS9WOFF4MnF3SWNQbjVKVDkraFFRNjArZ0JBWmdJYmcv?=
 =?utf-8?B?REN1Sy83OHV4NFZ4UEQyOG0wSnhpaThXRmpqSVpITi85N3FvTjdxWnJXd0Za?=
 =?utf-8?B?YUIyZ1VkQnZhcW9qUmZFMytsV1lWWkJFdWFIWXg1N2k0N0xDamlQb1RsaVcz?=
 =?utf-8?B?dDcvbjlWZ2JYL2ZmYkxaY1Ztc1htanIwU3BGVFhDb0N0VzJJSUc0OVNXODN4?=
 =?utf-8?B?bGs1TlpDQk51a1VDNk9Ock5tbVVSRW11eDlaaDJhWDlYYm5Qb2U3ZXFxaWRx?=
 =?utf-8?B?U01QVGdkTERKNVYvclhjNHV1ektSL01xQmxZWkpVWEpLTFhlTzcwYktYUWRH?=
 =?utf-8?B?dzlWUlhIc1QreXNTYjhob3Z2RFkxeVN6WVMxU2xPZTYyVHluV3dvWmFpbmdD?=
 =?utf-8?B?RGttOHZCZG9QQ0ZWQzRoSmN6RzFjVDB4TGhNRDBlbi8zUXRFK2pRNFAxeFc5?=
 =?utf-8?B?QVJIRHdwaXlRVFh6VHJxTEx0RG5HRWFkWTRJbGh1QzA4MnlqRG5tWjZlYlhJ?=
 =?utf-8?B?WUpwaTJiMnd0ZjRzUjk1VW5Ic21tSUFpNGdlaS9RVzdCeGNoREFUaG5qdHBV?=
 =?utf-8?B?Rk1XWC9GUElFakNOQ0lJSmV0blFXZCtFMTlNcTNCeW85WVg3cmNMeUJadks0?=
 =?utf-8?B?L3VkektUMS9rbnpzTmxQQWRoRnhLWmZRbCtWSys2UVJSN3creGF0YlhoVktw?=
 =?utf-8?B?dGFhRE5kTGdSQzFnMDduZUdGQ2I0M2pqTnlGOEJnK3JvRTlPSEhJVnpOeDFD?=
 =?utf-8?B?d3NBZmdkVVFOTm94WVkwNVZPenRnS3cvQVRyS1lZSnQ5WC9meXByNHFiWGVO?=
 =?utf-8?B?NXpQNWN0eFFOaDN1MFdaMGxKVlJtVlgzcTNlbUdhcHkzampDVTViTzBvUDNB?=
 =?utf-8?B?OFN1VTVSSVVhVkRaNHpUVFB3d0xuSTRqc3QzOWNuS1gwTk5vNmpEd21jcWEw?=
 =?utf-8?B?OHAwT1BHbHpqNFpGRlA2WFZmcUhwWTZsMko0alZLWHRkWktOWVFqU0RTNHdl?=
 =?utf-8?B?cEcxSW1yNXJXZDI2Yndwci80TTNIVjVMd05TVnlmWmhyQWZTbnlYLzBmOWNF?=
 =?utf-8?B?cWdiZURxcmI4Qm8wemlTdWtMV1M5akp1b0ZaOFZoamNUNUZla2t0TUFnZkw1?=
 =?utf-8?B?WGVVbzVENS9oL2M4SGloTjlObC9HS0JZaGhnTjlMS294TjdXcHNUQnZyUVg0?=
 =?utf-8?B?VktLSUlEdVRhenpWN3pnN3lVL1RlenE2VWhGVTdJUE15RUhPSFJOWXJabHZF?=
 =?utf-8?B?NitIQldGZnFwWHlKc1R0SGs4N1kvZkZVSVMyK3JMNU5HN25IbGoweTcvTVgw?=
 =?utf-8?B?N0Jic3Y4RnFoUmdpTWw5VUdOMnJQMzZDdTE2QWNtUkhpMktmeFVhRHRYN3Az?=
 =?utf-8?B?Yi9CSkszWC8wVm5qWmF4cUVQTmpIZnAvRStqY0ZlZElmVk9aKys3M0lNcGhu?=
 =?utf-8?B?K2JQT1EyNzBlVHZoMGkvSHdEaXhNMytKOUE2aEg0UW1rRFZiUFZhajhxY1B3?=
 =?utf-8?B?enk5Z2JrSTNCRkV4anNhKzMyL0dRcTdYalJwSWtDR1NIcWJhbWVjZU1WWnYr?=
 =?utf-8?B?cTNJODZOUWhXckFpQ3krVkVudmpnPT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(14060799003)(82310400026)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 07:34:01.3553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5dfc70d-dc0b-4850-d16c-08de5663f329
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8296

SGkgV29sZnJhbSwNCg0KT24gMTQvMDEvMjAyNiAxMzo0OSwgV29sZnJhbSBTYW5nIHdyb3RlOg0K
PiBIaSBKb3N1YSwNCj4NCj4gdGhhbmtzIGZvciB5b3VyIHdvcmsgYW5kIGt1ZG9zIGZvciBzdHJp
dmluZyBmb3IgYSBnZW5lcmljIHNvbHV0aW9uLiBJdA0KPiBzZWVtcyB3b3J0aHdoaWxlIHRvIG1l
IHRvIGFkZCB0aGUgaGVscGVycy4gSSBoYXZlIHF1ZXN0aW9ucywgdGhvdWdoOg0KPg0KPj4gKwlw
cml2LT5tdXhfc3RhdGUgPSBkZXZtX211eF9zdGF0ZV9nZXRfb3B0aW9uYWxfc2VsZWN0ZWQoJnBk
ZXYtPmRldiwgTlVMTCk7DQo+IFRoZSBtaW5vciBuaXQgKHdoaWNoIG1heSBiZSBiaWtlLXNoZWRk
aW5nKTogTWF5YmUgdGhlIGZ1bmN0aW9uIG5hbWUNCj4gY291bGQgYmUgJypfc2VsZWN0JyBpbnN0
ZWFkIG9mICcqX3NlbGVjdGVkJy4gVG8gbWFrZSBtb3JlIGV4cGxpY2l0IHRoYXQNCj4gdGhpcyBm
dW5jdGlvbiBpcyBhY3RpdmVseSBjaGFuZ2luZyB0aGUgc2VsZWN0aW9uIGFuZCBub3QgcGFzc2l2
ZWx5DQo+IHJldHJpZXZpbmcgdGhlIGN1cnJlbnQgc3RhdGU/DQpJIGhhdmUgbm8gc3Ryb25nIG9w
aW5pb24gb24gc2VsZWN0IHZzLiBzZWxlY3RlZC4NCkkgbWVyZWx5IGZvbGxvd2VkIHRoZSBkZXZt
X2Nsa19nZXRfZW5hYmxlZC9zZWxlY3RlZC4NCj4NCj4gVGhlIGJpZ2dlciB0aGluZyBpcyB0aGF0
IHdpdGggZGV2bV8qIEkgaGFkIHRoZSBleHBlY3RhdGlvbiB0aGF0DQo+IGRlc2VsZWN0aW9uIGlz
IGFsc28gaGFuZGxlZCBhdXRvbWF0aWNhbGx5Li4uDQo+DQo+PiArZWRzZWxtdXg6DQo+PiArCWlm
IChwcml2LT5tdXhfc3RhdGUpDQo+PiArCQltdXhfc3RhdGVfZGVzZWxlY3QocHJpdi0+bXV4X3N0
YXRlKTsNCj4gLi4uIHNvIEkgd2FzIGEgYml0IHN1cnByaXNlZCB0byBzZWUgdGhpcyBtYW51YWwg
Y2xlYW51cC4gSGFzIGl0IGJlZW4NCj4gZGlzY3Vzc2VkIGlmIHRoYXQgZGVzZWxlY3Rpb24gY2Fu
IGFsc28gYmUgaW4gdGhlIGhlbHBlcnM/DQpJIGhhdmUgbm90IGNvbnNpZGVyZWQgYWRkaW5nIHRo
aXMsIGFuZCB3YXMgY2FyZWZ1bA0Kbm90IHRvIGltcGx5IGl0IGluIHRoZSBmdW5jdGlvbiBkZXNj
cmlwdGlvbnMuDQoNCkF0IHRoZSB0aW1lIEkgZmVsdCBhZGRpbmcgaGVscGVycyB3YXMgZ3Jvd2lu
ZyBpbiBjb21wbGV4aXR5IHRvbyBmYXN0LA0KYW5kIEkgYW0gbm90IHZlcnkgZmFtaWxhaXIgd2l0
aCBkZXZyZXMuDQoNCkkgYWdyZWUgdGhhdCB0aGUgZ2VuZXJhbCBleHBlY3RhdGlvbiBpcyBkZXZt
IGZ1bmN0aW9ucyBhcmUgZnVsbHkgbWFuYWdlZCwNCmluIHRoaXMgY2FzZSBpbmNsdWRpbmcgZGVz
ZWxlY3QuDQoNCj4NCj4gSGFwcHkgaGFja2luZywNCj4NCj4gICAgIFdvbGZyYW0NCj4NCj4NCnNp
bmNlcmVseQ0KSm9zdWEgTWF5ZXINCg0K


