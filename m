Return-Path: <linux-i2c+bounces-15255-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98807D3942B
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 11:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D433C3048EE7
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 10:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CEC30B529;
	Sun, 18 Jan 2026 10:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="TvvqR+YF";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="TvvqR+YF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021092.outbound.protection.outlook.com [52.101.70.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A3A2ECD14;
	Sun, 18 Jan 2026 10:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.92
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768732184; cv=fail; b=gwnWX4KbdUb6lXqcaQVWRnMPjtcYc8A+QPWiF4hsZEePAQneUDtajnWA0LpCs+ZE7UWzP0oDgDdpTlBcvFw1SByBuJm1bPTngkhM8SrcxY0WZqI/mjeZhEtkb5MgTehq0fYH0bDW8d9Zyt8NhN6WJACIAuM0syR3HPzVoKhlhas=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768732184; c=relaxed/simple;
	bh=sjb5eqgiKJnv5oQS0oIqpitPoO+3g2RRM66VyIKvlUc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cNQWAzFUncLOFyZ+niUiJbuXG4qEMZgx4kacq+IIxJ70BQqCJ5ii4LjKylKcx4LLlS0WKHYuuNSzYgdD+sJ6YMI2MCWTrkqlZq9/p6NXJYX9BNPGrCbWQ8zJ0TDkx9PBq0i1+k8WBfBDpmYuTk+OgTB1EUbzuwNujRK6Bra67IA=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=TvvqR+YF; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=TvvqR+YF; arc=fail smtp.client-ip=52.101.70.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gYr3HvFQ0PlOt50FoSuvWuDVoyIOuns0vHf5H3Q4VST2KYEfDK48gKXdXchbwQLpsrPLYItZtP680zpA6oZp1zraNAcmGvjHhuZijfmeomKN6sx1kWjLE+llz1oMy6S4ZqErcAKg8j9Ns2yoXzCZcPTsMfVHvErxN/ts7cWaVUmhfbsJ5egBOmO+uy78hT7gyJXGTAm7JsLAWQ5g3QGtAV7RL6efn78EU0wIN9jVkRoOv6nHYNBPzh5brnODZLDDKpLoIFx1X8OMK2zzkdXj4EUgkjnmLKcp7/XbUd+HI3C5VawnSgX6vNg9oSxuffOCahoVoQQBM6O0jyqYapDpKQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMq9e7lFT/4HlxXcKY0WZRSp5MwkaPp8LUo4aIBkWkY=;
 b=RU9pLYkzAGwexlVVvW4AArTlKPoj/+R+Ecc0syEpgiByGeNSbqOnGPOCZsxrPsI7sg2ssE0aZ8q/C6/ZJ+6U0EfPig7We35shZNtgtBbklbI/5GWNGb3wu1I92zB0aJLyZyOkXDsZqCSOJIRVVUG0LDF/5pm22n6QItfWjNffABROVNbbtG8sBXNZh6HX6t7z5r5blo7AAlmaX3WSuIVlUH3BnmXx45/sjWYoLcLMnPwkdrN9OVP5b/l5KUpyOu6zXttpg+UUiGCzYoFM47NnZPITVNydYLV5BfewIww2KNok9vPRuACY+caVL3DdO+V7wlEqybxOOA5RZH9c08UvA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMq9e7lFT/4HlxXcKY0WZRSp5MwkaPp8LUo4aIBkWkY=;
 b=TvvqR+YFlH+l8AjBhZ5T+0HAlA6aq0c62cu4F5W6SNJu6AWg59uV5khC54wLL4DmfZhE4gf70U4EiOhhumxbukF0bjjfKnp7mlfrEQtsjL2uJTtfLCdhNYfd9v40Ea548JFoTB52WME2Y9fz4R8dZKdA3KPh1nE/t7oV2VdR/s0=
Received: from AS4P192CA0040.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::16)
 by AS8PR04MB7637.eurprd04.prod.outlook.com (2603:10a6:20b:29d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 10:29:25 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:20b:658:cafe::21) by AS4P192CA0040.outlook.office365.com
 (2603:10a6:20b:658::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Sun,
 18 Jan 2026 10:29:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Sun, 18 Jan 2026 10:29:25 +0000
Received: from emails-477551-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-103.eu-west-1.compute.internal [10.20.5.103])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id D31A380009;
	Sun, 18 Jan 2026 10:29:24 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768732164; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=hMq9e7lFT/4HlxXcKY0WZRSp5MwkaPp8LUo4aIBkWkY=;
 b=JZdB4L1n6AupKhIoNOW11KBfYImzsFvwsx5YjJn3XpGiE3yhBevjDo9QxnDH19r66XZZf
 T3YcD00hGOUpeDMMeA9olRWwywOQ6/+3V1uRRgasctSbJWPHtC9ylL53YkOFkdFpVcw/A+w
 J6W3juT7wkSMoHfuYuSUpi1NBIF4dGc=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768732164;
 b=parXxWysXpKXhvY9VAsBdBW1aZy/6E4y26EjR1KpOP9QkuY3xK3dXqm+z8Lv0E72VBQSv
 1GwcGAr80V9DxNu4cdlUMFsYTwYT32v7l3QInvQNab2zwM/YCR9wh3CdDJ4FG1bKNWBWyqB
 /S83x4OAqkO4taSicLQ+rK3BBmBKvaM=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZYO+lCvFL7qvsPa8cakVezs4/8hvNLmkKlvpmKjewN11N0lJJ/78zoFYpNf+WdpXtQgJPewLSCmMgh8FTer9FvbmPwZbo5DPicKCt4hOlH8wM0BtfKiGiDASY//ZuG01ZBZfZ4FwUgJXFTaJb1D8McTB77YDOsDsJLg+WUKhSFi1taC00591UpphPlR8cr3Vlf4MrLS1z/ZoIqNPnrqxziWlRmNlxgqkeFFTv0LubSp0fDz+6zz0CxMFvUQQ9WC9U9Qrb0oH0U9bDV9jmOxI99aXWnJ0vQN0NP13Yd84wnjWd6s5reD9E69KF9zh0TQOvsWrRf6r4psOTsVhCinoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMq9e7lFT/4HlxXcKY0WZRSp5MwkaPp8LUo4aIBkWkY=;
 b=ilvdYSpHdq9eomDHFKDt8b71+U9+saFeBDpJpX66+ybPixwwRG1uLcr03rYvzconTCvp5E4cPZh+3cFIt3mBKZ8Dcvb/nGp6XRVtG43VS3a9yWaJbRgWSD2jRrSW3rquuuH7JU/qISA22DlQ/QfGbCIa1S7AL8Adll1QTTg0f0PYewWloT0hJCmI2i2sSrLrelBhCsuGZ9xQAkQYSX3q+C/u4LBtd9CpLz2YC02/6jYA7I8sGM+DWCw1QINqo4Sj8VuwT4lCGGvi6KQ2jp256ed2rpDNjoOjc/LqNAzcOwYdNJW+FNZmGET1zWNVC7+JwSYmT5PQfI8Y/QbaKAxPVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMq9e7lFT/4HlxXcKY0WZRSp5MwkaPp8LUo4aIBkWkY=;
 b=TvvqR+YFlH+l8AjBhZ5T+0HAlA6aq0c62cu4F5W6SNJu6AWg59uV5khC54wLL4DmfZhE4gf70U4EiOhhumxbukF0bjjfKnp7mlfrEQtsjL2uJTtfLCdhNYfd9v40Ea548JFoTB52WME2Y9fz4R8dZKdA3KPh1nE/t7oV2VdR/s0=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GV2PR04MB12189.eurprd04.prod.outlook.com (2603:10a6:150:33a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 10:29:15 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 10:29:15 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 18 Jan 2026 12:29:00 +0200
Subject: [PATCH v5 4/7] phy: can-transceiver: drop temporary helper getting
 optional mux-state
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-rz-sdio-mux-v5-4-3c37e8872683@solid-run.com>
References: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com>
In-Reply-To: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peter Rosin <peda@axentia.se>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>,
 Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>,
 Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TL0P290CA0009.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::6)
 To PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|GV2PR04MB12189:EE_|AM3PEPF0000A798:EE_|AS8PR04MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c53cf5a-caaa-4f25-8b54-08de567c73d0
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?alBkTEVzZDNtQkVIejY5eVhHcGRHZnFHYUNkQWM2MlBkQ1dZUVl1SWJxRUZz?=
 =?utf-8?B?Q0kyZXVmUWRTUVVQcnlDbzVRTFNMMzh0aHQwTE4vL0RxZmZPbmhrY3dEVlho?=
 =?utf-8?B?TitWNGJCbCtNV3R6L0kxWUF2RUlJeXNoZXZQK292a1FNdWNSR0RJbDVvUjgy?=
 =?utf-8?B?d1hSalVZaFgxMjAzd1lrdE9tNFI4KzhmSkhUR0NJbzliYkRKanBUZG9lSWV2?=
 =?utf-8?B?c085eE9hMjB4THdRTVVjMWExaU50UHc4S0RWRUE1VVB2aUhHYjZwNjd0Q2lz?=
 =?utf-8?B?cDh6MUVxTytuSkE4eVlBYWJWbUFBQ3VYTEpNOEVkL1dEMGhUVG0yTUZiUDFC?=
 =?utf-8?B?RUVGVHk1K3hzMGxtM0xnZjIrUEJydVFkRFZDZTZaNnZ0VHdPS2NiSUdlVTVa?=
 =?utf-8?B?YWY1MGJsZ2o5RnZvbkV1d1M1OS9sMXA0Zjc0YnFqVXIrUnI1SXlrQXFndC9O?=
 =?utf-8?B?RGRpOEs0cTZ3ZUluWVBrUDdVbzJWSlJxT2o2YnVBY2RLSnZEY2NncEhLaklT?=
 =?utf-8?B?MC9pcWN1dFdienQwclBQRkNqQkpnTXlJd01Zak85RTQ4NmFIT2lEY0JhR09v?=
 =?utf-8?B?MXl3dzRzZEs3c1p3N2hkNXZwWXBVQ2NiNXRsMGFsdU56eENUSm9kY1pGL3JN?=
 =?utf-8?B?MjlRRkRabHVyL1Z1M2NOWXMvWVo4Q0tGbHpnSnROTjZJRWNDVzZWYk9uOGE3?=
 =?utf-8?B?Q3pVVktYbXF6Z2VWZ1hlUEdtSEVlcUpmM1R5OFgxK1htbW14WUNBaEM3bDdI?=
 =?utf-8?B?VHgybldXcHVjaUd5M29GOEdzYkdXL3owZFJFbThkM2U1eTMzTGFOR2hrc2Np?=
 =?utf-8?B?di91UzNIcXdicFc1WVRET0dSM09zOUdKVkdUWUM0MHlxRVJNUkwrbmF3bk1I?=
 =?utf-8?B?bFhxcVcrdHJpblFYQVFCWDQxdFhXYzYrelp1OVZiZDE3Y3h4NEF5NlN6ck5i?=
 =?utf-8?B?M2FXOTBtRzY0aFp4aDZKemUzek9SSUJTZVVjQk0yVFRsbkRvWUlBT0pSeVc1?=
 =?utf-8?B?UjRSYVA4Z0NaNTF1eEgvY0djdnJVbU1KL1V5V0N5QUVmbnRPVlRqRnhDa01F?=
 =?utf-8?B?eGEwWXIwdklsZnhCbTJDTk9KWUJxT1U0ZzN1Sm9oZEc1cGFPbmdCaUQ2Wksx?=
 =?utf-8?B?Y0FzSWE1ZS8rbzdWUnVLR2cxOFJMN0FCRFV0SnBPZFFrUUIrUmZjdFpGZ0NI?=
 =?utf-8?B?ZmZQSThERVY4TDNMb2dIR3ZZYzdxYkdZQVgyaTFCanVFaGdPaHVHT3FpV2dE?=
 =?utf-8?B?dkkxUkdRQWl0MlhSQWNlVjBqNktpWWlWWGx0NnFyNEhGVWF0cnh6NDZWZUxz?=
 =?utf-8?B?Wkp2WGE1aEljN1l4eExYK2VPOWFMUFVER1MraTcyd0o3STVvL0RaNDNnY3Bo?=
 =?utf-8?B?Y295clg5eWdPV1ZNVmZOYUx0MGkvNUxBQmlUQVJ4TWNZS2ZNTGd0ek5rODhI?=
 =?utf-8?B?OVdJblErMm5UekJiSUtndUNOZGE3STVlTTZIdkppWllsTEd0UnllYTZrRzJa?=
 =?utf-8?B?TEZRZTFaVyt0MXZqd3dnN2pzUTJaNlJkZjNRNmI3V21xc0dvMUkzTTZhOE1t?=
 =?utf-8?B?ZTBnNGFVYjdoaTAxQTd5Y1ZSQmpWSFBJZmh0YXpwTmtkdnd6Yk5jR2NLWmg4?=
 =?utf-8?B?NmVhbjhTLzJQME8xQndndGdxZ0g2MWNRVzZodU1QelM3UndmSmxaTkpBV0Y2?=
 =?utf-8?B?OWovRGcrazRkZWlPaVNzd1lkVUllOVk0OHhzSld2cnVOUldQQUFidGdQZ3RB?=
 =?utf-8?B?T3FPa0phUUJid05RQkZTOGZBbnZKY3crOXVBbFppMnhxbDl0dlltL25VUW96?=
 =?utf-8?B?eDE5K1ZFZHkzM1lWdzFBZmhpditkV3pSS054cnRaWXZrNzllaCtwb2tsNUF3?=
 =?utf-8?B?OUROTW9JNG5SYVRGcCtEaDZTMzRnUXl3UkdNWklyK2hGYXlMMFJQNTZ1WWpw?=
 =?utf-8?B?clZqQ1l5ZXlGaEh1dnZJKzY3SzBwRytYcXkyTUhaeTlPM29jbWxOUkplcjB1?=
 =?utf-8?B?T1Fkc3cxWGRKRFZBOTg0T0JOVXNxQmFHQitHdEF6VTAySW1UU1dDeXlWZVRJ?=
 =?utf-8?B?NUdPOEZHWHhhTTA4ZmZqL0hOL0w0dHFqby95am1mMW84V2VoY2tSL3NYcmJT?=
 =?utf-8?B?MDZNOXk1SlZ6VEM2UlBMR0w0Rkt2ZkJjRm43cUd3L0VSb0xRS2gzYzMvVzAz?=
 =?utf-8?Q?U11XAzm3fENYjNYOydJRVfRR3YQINvF5rwh21q1HWhar?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12189
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: d619054be23b485bac40988e47af05cf:solidrun,office365_emails,sent,inline:10be8686da63a4de695eb0fd74d4d4ae
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3961a4e7-f85e-4cf1-0474-08de567c6e23
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|7416014|376014|82310400026|1800799024|14060799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clducE5aRkc3NzE0MEVsNmRUcHpoZlNxSlhWOVEzemVrZUNia2dNbHZrVjRN?=
 =?utf-8?B?aFlKNitoNjVueno4Qm9sY1J2WXhubDFEUjNvMExYc0JEdzZnbmVDa1NJRStS?=
 =?utf-8?B?MHlUVTI5ZmFONXRVN2pyQjBJbCsrY0E3T0orelNCcXRnRCtuMG1tRmE0VGh5?=
 =?utf-8?B?ZXl2SW1RcHY1bk44dzJub2MwNTFvWDV3ZW1aZ1ZLK0I4aE53eW9wMDAzTzRE?=
 =?utf-8?B?SWVNSlh5U3JlSGIzRXhVbGE1Z3puZ2VsVDAzajN4WGx4bSs4cC93bUFUc0dT?=
 =?utf-8?B?VkJnS1RMdjhnVENxMldPV2ZDNFpsdC81RGJoRit6MUYreTc1UWZDSDAvZUtP?=
 =?utf-8?B?SlJ5MU5BMmZBWWhiTXYwQ2hCcXhJTXRvTXU2Umc1bmRxcmprcFRxaS9CVEho?=
 =?utf-8?B?eTNiNE5PQzZFd2QxdWxLRmVWallQTVN0d1VxMW9IRmszS1RVdVVFMVNYWng0?=
 =?utf-8?B?b1RNcEJZMWplVGlMTHdRdXlTQlFHZCs5TUcvRENiMW1Odlk5VENCTnBPWEZl?=
 =?utf-8?B?WDlFWGRpZTdkd2ZiNU01d29FZENydE9OT1pjQ3lWN3pVNU1ZMmFPREM4Nm9Z?=
 =?utf-8?B?bHgycGtObkFWYUtYbXlkWUdxTnBFNmNIZ3FwV1J4TCthQUxramdhQ1lEOFd2?=
 =?utf-8?B?MVU2bTNjRGtXakRXYWVoZHliYUUzTTZiNnluM2ptWUN0ZmdTZDBsckNGYnJp?=
 =?utf-8?B?WGNkd1lnYTlqZUc0OWQ1N1dFTk5TV2pBdUVwOTJybWRpWitZdmYwNUJNMzgy?=
 =?utf-8?B?bmgrZUhwY2pxWUlubEQ4dkVWMzRuYlN0ZFAyUVpIZGxtaFAxdGl6Zmt3Mnli?=
 =?utf-8?B?dFRXNGxtRVJxNElKUlRVU2JNV1l6REd6N1J0eU1LTVlYOE02VTNNeEpIUEUy?=
 =?utf-8?B?a1BtRlUrajdDZmFsVDdJZGs2bkpXTHF0UW4rbnZJdC94ZlpMTS9uNkdKMW1F?=
 =?utf-8?B?eW8vQkMrS01tSk11VW9OOWFPamZCZzVWVHcwQ0tsdk9vNVJ0ZlNCMVZhVG1S?=
 =?utf-8?B?d0RabHhrTGxpMnI0Q1dOT0hyb1ZpdHRGTHF4Yi9sWUJEWUswVFB3ZnFiS0xB?=
 =?utf-8?B?SHZxYTlPZ1B6b0ZiTStoZVVsT2hxdVJPdDk5VXZzN21xOSsrUXk4VThYYkJI?=
 =?utf-8?B?VmRoL2NxQ1I3TWZVUFRBVHJXbkUyUmxuaitpUmVpa2o4dWR1MlFwOE96YWVr?=
 =?utf-8?B?SzErYjRGWm1kU0R1YzdrQ0R3aXViK2ZnS3ZHSUxPd0x4ZzJNSWZ5ekgvTXc0?=
 =?utf-8?B?K20vbjVtZmxrSnRtWk43b3grczVFODhEb2NybmVTeTFGY0svYmVZSjF0dXNl?=
 =?utf-8?B?SXlFZWdERTY2KzRCWFpjL0VGZDVKMUJNZTgrVExmY0RUTWF2S0lWcU0xazF1?=
 =?utf-8?B?L2dmVzVVcTE1VUZlQVR3Z1VQOXhYNlB6OEN5emVwZ2d5bzBueUorOHAwbHBv?=
 =?utf-8?B?eVB4RmNHN2d0aSt4Z2lmQm1vTUcyR2RiVzdsakVIdURUVU1YcTdWQVVNaUtj?=
 =?utf-8?B?OHh2L2hHTmt6QjVPdi91SmpaM2t4bldEMVR5azRjL2U0K3pLS1R3NTBlNldo?=
 =?utf-8?B?NHVkQXVkU2ZZbEplZEpHQkgvYUNIQTE5ditQWTRFS1JYcGhCcDRxWDV3K0tO?=
 =?utf-8?B?bHJNMEFEa0tZcE1icHNtTFV6LzVNai9DYnBZZ1I0WTQyb3oxdVZWZ09QQUkr?=
 =?utf-8?B?WFZzREpRVDh4TVRuR1RUSFpEZ0YxN3g0YVlta2dhVHhiZjlwV3VEbkZ3M2Jr?=
 =?utf-8?B?bHJQUnY5WmNTZ09DYWNQaXNKSzRTRDdkVWhOdS9MMVdYWGRtUmNyRGZNNmwv?=
 =?utf-8?B?Q0pZTUJRdnJjMWxDeUo2U1NTcUM1SFFKdndwSzlOcUtwQzdnUitXYmlJdWtu?=
 =?utf-8?B?UUcxQk0ydVo5OHNyZEI0WmtiUWpjVUsyWTgrQWJsaEhJZHd6NnRKNnFRU1lY?=
 =?utf-8?B?Q2t4RmVncENZN21CR3huYkpzRlR2SXdXUStUVjg2T2luTHBpclk3bWhXandT?=
 =?utf-8?B?UXZjalRGTllZeXRjOGUyQW5KWXBMcEN3TGJyU1BlWHVZOUczeXlTWDcrR05y?=
 =?utf-8?B?b01xaFplQlhmMTcyUnZvMlp2bGxTZ2dJRCtrdFBYNzZoaUphY1ZmK0t4SWlw?=
 =?utf-8?B?UmhQZGdLSy9IaDRyTVdWV3JaV213aTdjZ3ZnczhaQ0tjUEJuNUlvUkJCK0Y3?=
 =?utf-8?B?bVhLdnd4elExY29UcUs3NlZHa1ZpdDVMaFkrQ3hGVlI4Y2hSLzFacHRPMUVD?=
 =?utf-8?Q?l4GN5NiKzRHizZwwF2QmmW7rQPnauw1u3BagU4yI1c=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(7416014)(376014)(82310400026)(1800799024)(14060799003)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 10:29:25.1165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c53cf5a-caaa-4f25-8b54-08de567c73d0
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7637

Multiplexer subsystem has now added helpers for getting managed optional
mux-state.

Switch to the new devm_mux_state_get_optional helper.

This change is only compile-tested.

Acked-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/phy/phy-can-transceiver.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/phy-can-transceiver.c b/drivers/phy/phy-can-transceiver.c
index 81591d247128..2b52e47f247a 100644
--- a/drivers/phy/phy-can-transceiver.c
+++ b/drivers/phy/phy-can-transceiver.c
@@ -126,16 +126,6 @@ static const struct of_device_id can_transceiver_phy_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, can_transceiver_phy_ids);
 
-/* Temporary wrapper until the multiplexer subsystem supports optional muxes */
-static inline struct mux_state *
-temp_devm_mux_state_get_optional(struct device *dev, const char *mux_name)
-{
-	if (!of_property_present(dev->of_node, "mux-states"))
-		return NULL;
-
-	return devm_mux_state_get(dev, mux_name);
-}
-
 static struct phy *can_transceiver_phy_xlate(struct device *dev,
 					     const struct of_phandle_args *args)
 {
@@ -183,7 +173,7 @@ static int can_transceiver_phy_probe(struct platform_device *pdev)
 	priv->num_ch = num_ch;
 	platform_set_drvdata(pdev, priv);
 
-	mux_state = temp_devm_mux_state_get_optional(dev, NULL);
+	mux_state = devm_mux_state_get_optional(dev, NULL);
 	if (IS_ERR(mux_state))
 		return PTR_ERR(mux_state);
 

-- 
2.43.0



