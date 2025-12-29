Return-Path: <linux-i2c+bounces-14833-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB60CE6A41
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 13:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A018A3000937
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 12:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365EE30F945;
	Mon, 29 Dec 2025 12:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="c6TU2qZh";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="c6TU2qZh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023113.outbound.protection.outlook.com [40.107.162.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECA930F929;
	Mon, 29 Dec 2025 12:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.113
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767010055; cv=fail; b=B5WWo824s7kwNjqiFc9/Cxztc/DIxirB2c/zU4WpxTifKIf1KRdMJyC9def1drgb6JZKxk3dtEteZdl1ny06kGVswpiHNtn32cj308ZlQLbnZ7jdL+DqHBhIqa+swcObTj/cTc0XaxqPyGSNAMuwLLoqNziZ+9R2e8xCPebVmvk=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767010055; c=relaxed/simple;
	bh=CzmhDTrhFneRXKQL4soEByjRijb4OKMVJBCWqZcMZFw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hBtd92vxMO9PqM1Vz+UpSWSaHSWjAEQDOkQl9PgeUQEdW0uO6IscJ3Qs4/y4n7wH3wwHbZ2niUb8L3HPRHeMMkkmO2I4Xi/ZQTldlu2XmYnXXVBbiBULtNUIEZzx8UbUTEnlMi24K2UaVXCAikPDHmrCYX9Fga61POgp7AUOukM=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=c6TU2qZh; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=c6TU2qZh; arc=fail smtp.client-ip=40.107.162.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hePovfhe9FEFGqfXp3arXOoD9QmO4bgj1XlcGFM5arFM3GdEZWSHWPZ8CnQ/8m3Ws+avo/ZcApj3OQPbBDJ16XzF4XVcJyX2sbp2tpdzqLVn84XP+TymHQxAaSYxgRq1N6GE2eYLOdRP4IEyO4kyRARQxLTGW3MOld+dj7Nx6v8qq1rz0+ArADvkfYf6yvF5pV1swkOazlYGxSAjeYS/yvLYfav7GzeA+CJ9IQG+LBp1HDV9dt27cWW794075N194YTf4UOAaC9umBaMcCWdQ4iIXGoXyEWRD/nmd3GLSu5je9U7whLQI1O3igRNJZTAcZ5eEMSqwhYPFO7rRs7PSw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzmhDTrhFneRXKQL4soEByjRijb4OKMVJBCWqZcMZFw=;
 b=PJ8YWqLNI0gv+oCU3FASH9uQpIsd2Z/pOUse/z66wQIQMgUXYFZtuQr6pBrKSF4XCJW5XBYXias5Z8VOSRtbedsQVpHerz2OpcWCG8kd1IN3lKtc993Ej5tw2iIWmxpSGpLoPuzORKziYcbGG8QrfKV/AV3U0uuiWIC0fVr1Ak3eG69FqiW2V44o5yVePPmPskgYsJW3l+kSYaXREI9TMm9Ush52N/WpY5mXx/8iPs0W5Y80FfJJbuEb18g2/rAv4jsR1sXyYT0XP2DBJP4RnltsE4xWchRt2pF9bU8KCKKeOVrW74xX9D13E7Lp6IgfmZa2dxeCMdeuFd1PQeLGtg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzmhDTrhFneRXKQL4soEByjRijb4OKMVJBCWqZcMZFw=;
 b=c6TU2qZh1gx8/QyJ32nhTQWYo1x5D1e+rcKmYVrqn6atjMk8btyQ7kymGvWnQwyWfL+xGVy6ENvIa/kNqlygjfIYv7m3glUJrye4Hv47PyW4p9YJ/NyoWmxLDfs9j9OaMSdGlT1X8ams9syLY23acW1nkm3GPE2hwST/hleVVaY=
Received: from AS8PR04CA0021.eurprd04.prod.outlook.com (2603:10a6:20b:310::26)
 by DU4PR04MB11412.eurprd04.prod.outlook.com (2603:10a6:10:5d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 12:07:30 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:310:cafe::f5) by AS8PR04CA0021.outlook.office365.com
 (2603:10a6:20b:310::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 12:07:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Mon, 29 Dec 2025 12:07:29 +0000
Received: from emails-9181392-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-157.eu-west-1.compute.internal [10.20.5.157])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 7470B80358;
	Mon, 29 Dec 2025 12:07:29 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767010049; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=CzmhDTrhFneRXKQL4soEByjRijb4OKMVJBCWqZcMZFw=;
 b=IK2sJ1MMblArfLzLRuhtmxNNO7J3jUVXo1Mey6Nhoam3oVIRabqCyzt3KpkkL72BCvNZI
 q3Rz0vFk9AgBYuR+IFdn9nYMfV2JbwsJ8rlKhOfUCCvnqiiNktc8iIu0Z6P05aASEAyD7qY
 JJUm9k3/OCbuCT8nr5ibvjHUdHwLA5k=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767010049;
 b=p/urV+99jjCS2Zcw20yJ3eEUGdcnvAjfU6jhP/klBWzxFqRCiMCoQQiIo4Lhz9gwmtpp6
 /yuUyKzst/hY9dwRh/Z2BmfrhmAVBE41Ryc80mdy7+mUmxOCGzOd+V3H4Qxk0zIyWFkB2NC
 wOPiZfW26qUzcOu9AqV9E4Q2mw6eiOQ=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loLwfC5PYs53bmStYTUrfvXBY83g0MXVPEOT4PVYWoFCd8jAq0dB/5DcwPQGty2dCu5khSKHVGIZWbbV5GLRnfPO7ttLQPuQIxOPZRj7iRUZWOi/wCSenKu16LTCivQUXcy1c+e3l8iqzyMn7/Abe9Mrm4SzJ0yH2dPCDaoUrYV+/x7v20L1z7jC/IcyWV0ejASAbthq7g/pJJZxfvnV43Qpul2q+N8FkkIvEyJy95uMM+UdP9bnRuH+qwKQ96peEfVXpQblQO8aDq2pSQXzTM4ZHJBHlPJX0OYPIbWlPITV5AWk55FK/GJvDlOCgtzutk4H8xLNvlr0+E7C6Rs06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzmhDTrhFneRXKQL4soEByjRijb4OKMVJBCWqZcMZFw=;
 b=uy/kUgs11BQVn25QlkLG7amZ1PgtlNpDMyoDFzcMClp5oj3t4OIfWEMporSmL78/bWh30/ME+IiL/03x+MoRlNA03k/BBYaB/LflbRc1uFykJg6CROTKwrAwsdrORGj2vctEOnhuq9NoDVzVbIYrpJEdmPyiglY1DHk7LrLCoBB6WfQUULoXUrnSYwPfpEc9VZzl+VytJGKY69U2dvJ9huMC+Y9Pib8e1+IE0UF2FFG2NlnivxSXWDcIc8SC6Ofzx+QrJHviaJCrA+G8TTbV/Axy/e2TlXlof1+4wvxjKynIaIdFRHFxoJn6UDDYk5lfJTFqNTUuBM1UDcch6cyd7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzmhDTrhFneRXKQL4soEByjRijb4OKMVJBCWqZcMZFw=;
 b=c6TU2qZh1gx8/QyJ32nhTQWYo1x5D1e+rcKmYVrqn6atjMk8btyQ7kymGvWnQwyWfL+xGVy6ENvIa/kNqlygjfIYv7m3glUJrye4Hv47PyW4p9YJ/NyoWmxLDfs9j9OaMSdGlT1X8ams9syLY23acW1nkm3GPE2hwST/hleVVaY=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PA1PR04MB11530.eurprd04.prod.outlook.com (2603:10a6:102:4e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 12:07:17 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 12:07:17 +0000
From: Josua Mayer <josua@solid-run.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Vignesh R
	<vigneshr@ti.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti
	<andi.shyti@kernel.org>, Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan
 Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v3 2/6] mux: Add helper functions for getting optional and
 selected mux-state
Thread-Topic: [PATCH v3 2/6] mux: Add helper functions for getting optional
 and selected mux-state
Thread-Index: AQHcafvjRT5zKouON0q90YQR/1KWr7UtgcmAgAsf64CAAAGsAA==
Date: Mon, 29 Dec 2025 12:07:17 +0000
Message-ID: <3ecb905c-f01f-440a-84ac-5688220d54ae@solid-run.com>
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com>
 <20251210-rz-sdio-mux-v3-2-ca628db56d60@solid-run.com>
 <CAMuHMdXjAS6HOYy5=uxcK0RZL5X6agRoHG67QUw4xh5+ovZaJQ@mail.gmail.com>
 <fd901bba-3203-46c2-b282-c5ad04128fd3@solid-run.com>
In-Reply-To: <fd901bba-3203-46c2-b282-c5ad04128fd3@solid-run.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|PA1PR04MB11530:EE_|AMS0EPF0000019E:EE_|DU4PR04MB11412:EE_
X-MS-Office365-Filtering-Correlation-Id: 048233ac-e84f-42eb-7408-08de46d2d70b
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dU80SmlDNzlGVVZ4RFpBTFN5aklmQmVYM2pwbk1mWU93L3B4RVRsR1p0RSth?=
 =?utf-8?B?TDRaNEJaZXdjQWpEQlRVbXJYK1VlVnd3SzFwK3F6bmFsWTJ1eGdTa1gzZXJK?=
 =?utf-8?B?RnBoYzdSN296YXo2Y2Z0VzVNT3ZHck9aUHZjcUErajQ3UlFURTZCT29ER3Jt?=
 =?utf-8?B?bzJ0VytjaDNoT1Z5bVFDSWd1QzRxTHBQVlBXSHZmRDdWd21NZS84K0xqYXkr?=
 =?utf-8?B?aVE2TnMyOFpFdXVZcmFxazhLRit5cmVrSG5BWkpibUVKalhRQkE4MnJjalBP?=
 =?utf-8?B?Wkh2c3IwN2RibVJTT0RYMjk5Ky9aNnJPeWlVK2ZIZmQ5MnVZTU1RTXJTZ2Zi?=
 =?utf-8?B?K1VPUjcxa0J5ZTlUMGEzSklKNTNUbTMwOCt2dk1KNjd1dkZveFppVVN6WThT?=
 =?utf-8?B?L1pSeE44ZDRrOVZGVVNxd04wK2FIVXRnOERScStZYXdpZVlQK0VIeXdlVVlp?=
 =?utf-8?B?eGcxMVVIcHdqNFJoU09uQzRESXlGMTg2QitmVFQ5M2ROTkpIQ3pqUkNoUXhs?=
 =?utf-8?B?N28wRFhWSmdNOHR4QllTcGdSNHN2RytIZEFZU1ZDTUJzenJCbEdwWjI1QXVM?=
 =?utf-8?B?dmhaa255VFFzTFJ6S2ZsZERadWcwbnVROXowYTExL2JBVzJqRG04VkRIUkla?=
 =?utf-8?B?NTc4ZEQzQ25rTXpOMkdVdURRbWo1Q1ZIb0U5ZzFhK2lucWkwN3BVYkpLc2JF?=
 =?utf-8?B?cUFaRTE3RG1tYVdpaWRjR05zYWN0dTZRS21OL3l5Z1B6NmowZGFEL2NyUU50?=
 =?utf-8?B?ekUvVzJlRjNWcVlCUUpYY2tBYnhPVWRyS1hYOVQ3VUJLZWVza21JYzB6c05w?=
 =?utf-8?B?ODNiVnlJR3IrMElqUzNpR3Y0cExHbC8wMUpCYWUxZVVrUjJoc2t2aFNQVXdQ?=
 =?utf-8?B?OG01cEVMK1JhSHhnL0xjcHlFK3NDazlJTENLSWprNnFFOVFRMUdUUXZ1aXEv?=
 =?utf-8?B?U1FQTExHVlpYMkFFN01LL0FTQ2tCdHBtRUR4SldBMkdBRXJCTnRUZ2VudDRP?=
 =?utf-8?B?S2tuRE44cFZHb3RWWU9PblVJcTIxeGJ1UTZiaml4dW04REh3ekhKZW5wc05i?=
 =?utf-8?B?RmJzQU1OV1NvWWxDSjdzemJ0MlVWamxyQVpYbVU3WHowT1J1ajdtMStsZFZq?=
 =?utf-8?B?ZHBtR0ZobEJhTURERDV1Z0NZRnVpS2xrZFZQSGNNKzBsK1paWC9UY2Q0TERr?=
 =?utf-8?B?LzdrMTNlL3pTaHE0YkVHOGsyUWhnM0NyRWZ3M0JLcmhCQUVodmZISGNBeUhs?=
 =?utf-8?B?d08zNFo5dTRPV3RIRWJhYkkwYU5McWZHMSsvUXIzS3crUkl3a2NKUkZwTFhX?=
 =?utf-8?B?Q3FubWZKdHJTT3E5Vk1mTTZPOVBNTXJvS3UvSU5UUnZIRkRDaTFwblM4RTRZ?=
 =?utf-8?B?RU8zdnZCUDVnejFlbHZmc21HMkNvanBoZmtzcThBNTVPTHhUbExydFJIK2lU?=
 =?utf-8?B?Q0RpNlFtZlhFcENmSURnRXBuSUVYNm1iTFZvUmZRV2xrbnJiK292dldpT2R5?=
 =?utf-8?B?d2krTEcvU1VEWG9Ib2FKSnNtZFJwNFhuWWFJYi83RjI1OE5ZZmgwV2h5bjYv?=
 =?utf-8?B?Y0ZiTnhncG1tcmJqVFViM2lxTjlYU2NLS0p6Y3lMblVaajE3WnNqWmd3OE5F?=
 =?utf-8?B?RzU0b3NQLzdSbjRKV2lwdGtNdHRUMDh2YkFtN1hnTVVCTTRnNlZza1JJSDdP?=
 =?utf-8?B?MXc3dWNhdmplcEh2UCtPVDhnZTE1NWhEVFczbVRkZFdXOTR6OEszNGRyWk1x?=
 =?utf-8?B?TGoyZ0wvT09SRk9BYStpSWliMi9LOTAwbTNDd29RTTBIME1GcklqK1lOenB5?=
 =?utf-8?B?V3BNMnV1OGNtV0Q0UWlySlprcG1KVHhsbk5BSTh5NEkwT0lrU0dQeVlIay80?=
 =?utf-8?B?bStZTVhjYUFBeWhhYnZvVlhEUFpmZGgyWmxpL0tmZjR6TkJCZldOZXdPbjFB?=
 =?utf-8?B?OXc3cVNwS0hxcVcxWkwzZHpzZG1UUStYam1CK29TemdyQ0ROenRoUCs3L1BN?=
 =?utf-8?B?OXhQY0xYcUJtdGZJSVZ4enQ0VmVoZ1l4cmRzeUhEUm56YmxmZE52c1RKQWlT?=
 =?utf-8?Q?JJTRDH?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2BAC406E4F96A4AB7E62D835ACA5AF3@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11530
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 76760639fbcf4e5aae9e635c9860127f:solidrun,office365_emails,sent,inline:90947a8010ec37c6cdd57d1ec71ea2fc
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b4bfddb-169d-47f4-3faa-08de46d2cfb0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|35042699022|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TlQxWE9sYVNEa1pTWWdyOGVCUnFzYms3K1J6UUFnNDF1UHJReER2UTdtS2w2?=
 =?utf-8?B?R3JDNGxZK1NqQUg1ZDR5RHlMUG9jSW1pd3BrQXdUNEdGbDh1UkQyVVpXRVR0?=
 =?utf-8?B?Uktic0t2amVMRFp5eGYwTGZTSC90c2JWRDVEYWNpUFExNEZsV2xwUFcwekhh?=
 =?utf-8?B?cTVlc0NmbWpDek5sVENQK2tsUDRiMk5hY2MwWDhDQWlQMEhVOGdBbzBiUG4w?=
 =?utf-8?B?QjdKQjNWTkI0eC96a01aQnF5QkY3REtqMVI2UnQzeURBcHVrUHpReDRBV3B6?=
 =?utf-8?B?bWZTa1p4QmUxaE5PN0ZoS2J6TThvM0JxNER6R0UvQXRxc1ZEQTBtNmh3bjZi?=
 =?utf-8?B?ak4zR0ZnS1pIcVkxemhLVmZNTmxpd0g0UUR3c3dBSzdGSWZYWjlkbkV5bVBp?=
 =?utf-8?B?L1RONCtnMGdsM2YyMTlubVI2c3dEd1B4QWlwQmI2djNMaExlNHgwMjQ5bWNt?=
 =?utf-8?B?VWhlVTBSbEdyZHJNbmdMRnc2U0dOc0xMN2dtbmxWOHkvK3FlOGRrMmlTTWtZ?=
 =?utf-8?B?cnZOaHQ2TEEwSTFSampCbTc3Z0JDZ09pY2N2NWN4T2tWdU1FWDliY2dIYlI3?=
 =?utf-8?B?L0FDWlBhTStJNUVrbjNJT3QzaVZYb3RIOW5GeURzakV2UnMxRENYQzd5azUv?=
 =?utf-8?B?aVR0Q08velpNL1ozQWF0SjdwaElnWmplQkZZVFZZV3FzcXdTRUdoZURpK3Zo?=
 =?utf-8?B?Wk10bFUrSnh4bnk5MUFKNklvam9yYzNqZHBFNTZkWWx3UzlQQm1kMzloYjZS?=
 =?utf-8?B?NStYTUVxUS9LNUthc003eTJLemJ2RVFyM2x4c2wxazFTM2FPWXBnbE9uT1ZN?=
 =?utf-8?B?c0hZcU5keHBINzJneG1NbGkxZGpLOE5IUG9nODZlbHVzQzUwV1FkTkFaYVkx?=
 =?utf-8?B?R0dmUUhIVnZLMno0SDFBcU5GSW1mUDBZbVlrUEhMemlUVHBUbTllQk95MWF5?=
 =?utf-8?B?dzlqUjNFN25Da2toSS9EWUJCNzhaZGRmellNVE5BOWw5MGJHdWdNSi9zWCt2?=
 =?utf-8?B?THVvWmhqRjVSc2NieDV6ZHhONDlheEExR0NwTWtRTG1Ja3FPZjUyMFNWVUkx?=
 =?utf-8?B?ZlNSb0t3QlVZQWRsSzIrVW5OZS92ckdvN2tOSDU1N3VVZXhOeUY3YU04eXN0?=
 =?utf-8?B?TkZ3L0RINTlkcmNpR1Z2UUkrQlZwYTZIN1FFMlgzUmM5VFJKaXFvdkUrQitD?=
 =?utf-8?B?VlVOYVh5UGJSKy8vWlpQdmpFb1hmcEZrSFdIcmNsOEt2dnBMT2ZBNnJEM1lu?=
 =?utf-8?B?ZmR2ZWlWOFVmeXBJTHp2eXdvZDdxS1hHUTQ4MmlhSG5oWjkyanF4aU1NLzVr?=
 =?utf-8?B?ZVcxWWIvZWMzSUJwakpjTVNJY3poTHRQVm9ad0xrU0tJNlVKOVl6YW4wdVlH?=
 =?utf-8?B?NUVNc0V3M1VVVytPMys2bFpUMHRtKzI1emorNk8yMmVZSnJ0RkFWNDZ4TnRL?=
 =?utf-8?B?VkhYaGpJK01aY3RIUDg1RGVxaVZNeFAyZ2ZMOVRPZmhuVFFEQmxKMVRUTVBi?=
 =?utf-8?B?SWs1bExTTEdFZ0luWXZVMitsVHN5WVdHYjY4YlU2Y1laVURzRS9NK2EvVHFl?=
 =?utf-8?B?ZXUzdWJFREF6RTlMWElHRGlBS2E4ZlgxN3k4cEFBbXB1RXlDMUJ4OGgvZFJm?=
 =?utf-8?B?c253U1RxenEwK1pSYkUwVmVhZmFpTWU5U1ppQ3pQTzUwVFVqK2xWc2N2bzFT?=
 =?utf-8?B?VXNzWXFHSEhQV0drNmlEN1hvQWtmVTViOHJjUEtKbmJaNENFVGFLQnp5dUZt?=
 =?utf-8?B?dURlMkFVbHlKelo1bGlRV0IzUWFtajJPSjdVc2ZVMk02QzFxcDlyNE9vQWxv?=
 =?utf-8?B?ZkVNanZtaXpFN3JxMXRNNkNLblpJZ0RZRkQwWXRUSEpTVENFSzgyS2gxTDZl?=
 =?utf-8?B?WjJHQUJNUCs3SFp5dGhJSnVGN2xIOWlxcStIR0RLR2hZcnVsRWl0SktRamN0?=
 =?utf-8?B?dklhWXl6UWhmR1Z0NzdweStDOStVZmlhLzFCSTY1M3FUZmQyc014ODY3cjJw?=
 =?utf-8?B?TzMyTk9PY2dxZStsbTR6QmRrZFEyWEptZHlCREpWa1lrWHM2aXlMNXNBSENi?=
 =?utf-8?B?aVBXQ1dDb1dqZmE0blVObHhTVFNkaE5RajB3SjBMUURhWVB2TUdLYWdjZ3JC?=
 =?utf-8?Q?tXBw=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(35042699022)(14060799003)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 12:07:29.7091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 048233ac-e84f-42eb-7408-08de46d2d70b
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11412

DQpBbSAyOS4xMi4yNSB1bSAxMzowMSBzY2hyaWViIEpvc3VhIE1heWVyOg0KPiBBbSAyMi4xMi4y
NSB1bSAxMTowOCBzY2hyaWViIEdlZXJ0IFV5dHRlcmhvZXZlbjoNCj4+IEhpIEpvc3VhLA0KPj4N
Cj4+IE9uIFdlZCwgMTAgRGVjIDIwMjUgYXQgMTg6MzksIEpvc3VhIE1heWVyIDxqb3N1YUBzb2xp
ZC1ydW4uY29tPiB3cm90ZToNCj4+PiBJbi10cmVlIHBoeS1jYW4tdHJhbnNjZWl2ZXIgZHJpdmVy
IGhhcyBhbHJlYWR5IGltcGxlbWVudGVkIGEgbG9jYWwNCj4+PiB2ZXJzaW9uIG9mIGRldm1fbXV4
X3N0YXRlX2dldF9vcHRpb25hbC4NCj4+Pg0KPj4+IFRoZSBvbWFwLWkyYyBkcml2ZXIgZ2V0cyBh
bmQgc2VsZWN0cyBhbiBvcHRpb25hbCBtdXggaW4gaXRzIHByb2JlDQo+Pj4gZnVuY3Rpb24gd2l0
aG91dCB1c2luZyBhbnkgaGVscGVyLg0KPj4+DQo+Pj4gQWRkIG5ldyBoZWxwZXIgZnVuY3Rpb25z
IGNvdmVyaW5nIGJvdGggYWZvcmVtZW50aW9uZWQgdXNlLWNhc2VzOg0KPj4+DQo+Pj4gLSBkZXZt
X211eF9zdGF0ZV9nZXRfb3B0aW9uYWw6DQo+Pj4gICBHZXQgYSBtdXgtc3RhdGUgaWYgc3BlY2lm
aWVkIGluIGR0LCByZXR1cm4gTlVMTCBvdGhlcndpc2UuDQo+Pj4gLSBkZXZtX211eF9zdGF0ZV9n
ZXRfb3B0aW9uYWxfc2VsZWN0ZWQ6DQo+Pj4gICBHZXQgYW5kIHNlbGVjdCBhIG11eC1zdGF0ZSBp
ZiBzcGVjaWZpZWQgaW4gZHQsIHJldHVybiBlcnJvciBvciBOVUxMLg0KPj4+DQo+Pj4gRXhpc3Rp
bmcgbXV4X2dldCBoZWxwZXIgZnVuY3Rpb24gaXMgY2hhbmdlZCB0byByZXR1cm4gLUVOT0VOVCBp
biBjYXNlIGR0DQo+Pj4gZGlkIG5vdCBzcGVjaWZ5IGEgbXV4LXN0YXRlIG9yIC1jb250cm9sIG1h
dGNoaW5nIGdpdmVuIG5hbWUgKGlmIHZhbGlkKS4NCj4+PiBUaGlzIG1hdGNoZXMgb2ZfcGFyc2Vf
cGhhbmRsZV93aXRoX2FyZ3Mgc2VtYW50aWNzIHdoaWNoIGFsc28gcmV0dXJucw0KPj4+IC1FTk9F
TlQgaWYgdGhlIHByb3BlcnR5IGRvZXMgbnRvIGV4aXN0cywgb3IgaXRzIHZhbHVlIGlzIHplcm8u
DQo+Pj4NCj4+PiBUaGUgbmV3IGhlbHBlciBmdW5jdGlvbnMgY2hlY2sgZm9yIEVOT0VOVCB0byBy
ZXR1cm4gTlVMTCBmb3Igb3B0aW9uYWwNCj4+PiBtdXhlcy4NCj4+Pg0KPj4+IENvbW1pdCBlMTUz
ZmRlYTlkYjA0ICgicGh5OiBjYW4tdHJhbnNjZWl2ZXI6IFJlLWluc3RhdGUgIm11eC1zdGF0ZXMi
DQo+Pj4gcHJvcGVydHkgcHJlc2VuY2UgY2hlY2siKSBub3RlZCB0aGF0ICJtdXhfZ2V0KCkgYWx3
YXlzIHByaW50cyBhbiBlcnJvcg0KPj4+IG1lc3NhZ2UgaW4gY2FzZSBvZiBhbiBlcnJvciwgaW5j
bHVkaW5nIHdoZW4gdGhlIHByb3BlcnR5IGlzIG5vdCBwcmVzZW50LA0KPj4+IGNvbmZ1c2luZyB0
aGUgdXNlci4iDQo+Pj4NCj4+PiBUaGUgZmlyc3QgZXJyb3IgbWVzc2FnZSBjb3ZlcnMgdGhlIGNh
c2UgdGhhdCBhIG11eCBuYW1lIGlzIG5vdCBtYXRjaGVkDQo+Pj4gaW4gZHQuIFRoaXMgaXMgcmVt
b3ZlZCBhcyB0aGUgcmV0dXJuZWQgZXJyb3IgY29kZSAoLUVOT0VOVCkgaXMgY2xlYXIuDQo+Pj4N
Cj4+PiBUaGUgc2Vjb25kIGVycm9yIG1lc3NhZ2UgaXMgYmFzZWQgb24gb2ZfcGFyc2VfcGhhbmRs
ZV93aXRoX2FyZ3MgcmV0dXJuDQo+Pj4gdmFsdWUuIEluIGNhc2UgbXV4IGRlc2NyaXB0aW9uIGlz
IG1pc3NpbmcgZnJvbSBEVCwgaXQgcmV0dXJucyAtRU5PRU5ULg0KPj4+IFByaW50IGVycm9yIG1l
c3NhZ2Ugb25seSBmb3Igb3RoZXIgZXJyb3IgY29kZXMuDQo+Pj4NCj4+PiBUaGlzIGVuc3VyZXMg
dGhhdCB0aGUgbmV3IGhlbHBlciBmdW5jdGlvbnMgd2lsbCBub3QgY29uZnVzZSB0aGUgdXNlcg0K
Pj4+IGVpdGhlci4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEpvc3VhIE1heWVyIDxqb3N1YUBz
b2xpZC1ydW4uY29tPg0KPj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPj4NCj4+PiAtLS0gYS9k
cml2ZXJzL211eC9jb3JlLmMNCj4+PiArKysgYi9kcml2ZXJzL211eC9jb3JlLmMNCj4+PiBAQCAt
NTQyLDExICs1NDIsOCBAQCBzdGF0aWMgc3RydWN0IG11eF9jb250cm9sICptdXhfZ2V0KHN0cnVj
dCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqbXV4X25hbWUsDQo+Pj4gICAgICAgICAgICAgICAg
IGVsc2UNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICBpbmRleCA9IG9mX3Byb3BlcnR5X21h
dGNoX3N0cmluZyhucCwgIm11eC1jb250cm9sLW5hbWVzIiwNCj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtdXhfbmFtZSk7DQo+Pj4g
LSAgICAgICAgICAgICAgIGlmIChpbmRleCA8IDApIHsNCj4+PiAtICAgICAgICAgICAgICAgICAg
ICAgICBkZXZfZXJyKGRldiwgIm11eCBjb250cm9sbGVyICclcycgbm90IGZvdW5kXG4iLA0KPj4+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXV4X25hbWUpOw0KPj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKGluZGV4KTsNCj4+PiAtICAgICAgICAgICAg
ICAgfQ0KPj4+ICsgICAgICAgICAgICAgICBpZiAoaW5kZXggPCAwKQ0KPj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9FTlQpOw0KPj4+ICAgICAgICAgfQ0KPj4+
DQo+Pj4gICAgICAgICBpZiAoc3RhdGUpDQo+Pj4gQEAgLTU1OCw4ICs1NTUsMTAgQEAgc3RhdGlj
IHN0cnVjdCBtdXhfY29udHJvbCAqbXV4X2dldChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNo
YXIgKm11eF9uYW1lLA0KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAibXV4LWNvbnRyb2xzIiwgIiNtdXgtY29udHJvbC1jZWxscyIsDQo+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluZGV4LCAmYXJn
cyk7DQo+Pj4gICAgICAgICBpZiAocmV0KSB7DQo+Pj4gLSAgICAgICAgICAgICAgIGRldl9lcnIo
ZGV2LCAiJXBPRjogZmFpbGVkIHRvIGdldCBtdXgtJXMgJXMoJWkpXG4iLA0KPj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgIG5wLCBzdGF0ZSA/ICJzdGF0ZSIgOiAiY29udHJvbCIsIG11eF9uYW1l
ID86ICIiLCBpbmRleCk7DQo+Pj4gKyAgICAgICAgICAgICAgIGlmIChyZXQgIT0gLUVOT0VOVCkN
Cj4+IEkgdGhpbmsgdGhlIG5vbi1vcHRpb25hbCB2YXJpYW50IHNob3VsZCBzdGlsbCBwcmludCBh
biBlcnJvciBtZXNzYWdlIGluDQo+PiBjYXNlIG9mIC1FTk9FTlQsIGVsc2UgdGhpcyBoYXMgdG8g
YmUgZHVwbGljYXRlZCBpbiBhbGwgZHJpdmVycyB1c2luZyBpdC4NCj4+DQo+PiBUaGlzIGlzIHR5
cGljYWxseSBoYW5kbGVkIGJ5IGhhdmluZyBhIG5vbi1wcmludGluZyBjb3JlIGhlbHBlciBmdW5j
dGlvbiwNCj4+IGFuZCBoYXZpbmcgcHJpbnRpbmcgbm9uLW9wdGlvbmFsLCBhbmQgbm9uLXByaW50
aW5nL2lnbm9yaW5nIG9wdGlvbmFsIHdyYXBwZXJzDQo+PiBhcm91bmQgdGhlIGZvcm1lci4NCj4g
SSB3b3VsZCBwcmVmZXIgbGV0dGluZyBkcml2ZXJzIHVzZSBkZXZfZXJyX3Byb2JlLg0KPiBTaWxl
bnQgaGVscGVyIGZ1bmN0aW9ucyBjYW4gbW9yZSBlYXNpbHkgc2hhcmUgY29kZSBiZXR3ZWVuIHRo
ZW0gLi4uDQo+DQo+IElmIHRoaXMgaXMgYSBzdHJvbmcgcHJlZmVyZW5jZSBJIGNhbiByZXdvcmsg
dGhlIGVycm9yIGJlaGF2aW91ciBhbmQgbW9kaWZ5DQo+IHRoZSByZWxldmFudCBtdXhfc3RhdGVf
Z2V0IGFuZCBtdXhfY29udHJvbF9nZXQuDQpUaGlua2luZyBmdXJ0aGVyIC4uLiBUaGUgbWFpbiBp
c3N1ZSBpcyB0aGF0IHRoZSBjb3JlIG11eF9nZXQgZnVuY3RpbyBpcyBxdWl0ZQ0KdmVyYm9zZSBw
cmludGluZyBtZXNzYWdlIGZvciBlYWNoIGVycm9yIGNvbmRpdGlvbi4NCg0KTm93IEkgaGF2ZSBz
aWxlbmNlZCB0aGUgRU5PRU5UIGNhc2UgLSBiZWNhdXNlIGl0IHNob3VsZCBiZSBzaWxlbnQgZm9y
IG9wdGlvbmFsDQptdXhlcy4NCg0KU28gLi4uIGFjdHVhbGx5IEkgcHJvcG9zZSB0byB1cGRhdGUg
ZGlyZWN0IGNhbGxlcnMgb2YgbXV4X2dldCBmdW5jdGlvbiwNCmFuZCByZS1hZGQgZXJyb3IgbWVz
c2FnZSBzcGVjaWZpY2FsbHkgZm9yIG5vbi1vcHRpb25hbCB2YXJpYW50cyBpbiBjYXNlIG9mIEVO
T0VOVC4NCg0KPg0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiJXBP
RjogZmFpbGVkIHRvIGdldCBtdXgtJXMgJXMoJWkpXG4iLA0KPj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbnAsIHN0YXRlID8gInN0YXRlIiA6ICJjb250cm9sIiwNCj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG11eF9uYW1lID86ICIiLCBpbmRleCk7DQo+Pj4g
ICAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKHJldCk7DQo+Pj4gICAgICAgICB9DQo+Pj4N
Cj4+IEdye29ldGplLGVldGluZ31zLA0KPj4NCj4+ICAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0DQo+ID4=


