Return-Path: <linux-i2c+bounces-14838-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A9FCE7072
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 15:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 750CF3020352
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 14:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3225331E0EB;
	Mon, 29 Dec 2025 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="RDiSMSkM";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="RDiSMSkM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023130.outbound.protection.outlook.com [40.107.162.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F21631D366;
	Mon, 29 Dec 2025 14:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.130
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767018476; cv=fail; b=kdPxF7vnC8S/C4P46ydnw92r6WSrH2zPOPoQ5LQhXAKW6DopZW2zi7oH+wzvio5YyNgO+wgXaxfu7EU9vJHWFUZgxDgMXJwcGFwmMkmuMhTHtEtBJF7/dmlRGmIlexqr/neETcLbuI7EMqRZAxIQ0PNxHl4yrZJAJzkvxlJ++6k=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767018476; c=relaxed/simple;
	bh=eZMm24aydLJdnjUYr4SnrS/V54we7BTi5ESU4zmlJJo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jE7u6jgwMeXX9Tl8TUW2nG+cejAJfs8awRqIrGb4mqY4Xi1WByNRNQw5TKIei7cn3hHE0wvy0zDPNi/roveP+U7AxdrXdyqpBCGpOleGafNt/xfVhwgDh+uRCSgmZuCltAqyFpYKXw6jCPfD1tfBnJhbSCpCzcAq0Fg/xQJHhXg=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=RDiSMSkM; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=RDiSMSkM; arc=fail smtp.client-ip=40.107.162.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jT2czYYTevxc2vIJfiG3/7JlGjYJ8zLYgJ5loUIYSQi4jNRW3K7tUFCvnhMonOejNMIDw1W+wMjGqpCTrPirzYqG8+q4g4+DacaEN/PrLvWvP50wy2KfIlNtetas9ifLLAkJNiLeGmplYDIiNBKftClP61sEWQUGeKMWOHUhzuxVQYBls6ZJLuJBcoW6B3qMMQ+vPzhvIe95e/i9+iZ5Z9FVrRiaileMw13w+iiIsTmGjSALHbRQwwkPfMBQlpDuhSZaIU4VdRK0FMTGPMs9hkZebD2+t4FrbWKFUiPSbeFNPIonGJNzKBwTdcFvVWen7CupB3D76MXeSJ58dIwNIQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bb7J3ChCCg09n60R5qJK78UBouiaLZrDB0MZ74xFIrA=;
 b=E7+//nvaSzyeSGdz7QqPI6d2YzEMt1rG0PJxp89SGnF1SEkY22j2O8xTuPExMQM6VNcNF6cWFmfVNf6Jyd7533LmkUTs0IURQEF02kU4kxQ/Jr07L4Qwigkzu63g2gHe5FP2bqw2/+Q03F7k3FMlSQr1jCdu9qX+EqEqfrdA9eRM37IHi2zgvZsbsO0XQywBLYhadp7p1fXy5NDwfpXpspQXn4zg2EzU23i5Q4qp0ZbAdcPSy6/iE3CVkQK4z6y5jQFSbZ0/2ReeiQGtlYhc6YmplIu8sbSz+DMpEhxQWm8m7JxtWV5roGdM7B94vWuLrF7zv1OoaKPkymqFY4l5RQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bb7J3ChCCg09n60R5qJK78UBouiaLZrDB0MZ74xFIrA=;
 b=RDiSMSkMlojb6Az1hpVgKkRxMD0ZVlSyadIZEB98au4SRjrFnrcrAaYq/u2OuSQRVfJ8S4CxlYJ8BYv1Td8NxIK9KOJvfuLbhwdd52ra5l+aBfDFhinpTUW647D270R7cfacQAPE4XYfUIn9M/jmZ/lfSqdS4VIPtuqJTSSOOQM=
Received: from AM0PR02CA0175.eurprd02.prod.outlook.com (2603:10a6:20b:28e::12)
 by AM0PR04MB12050.eurprd04.prod.outlook.com (2603:10a6:20b:73e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:27:52 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::48) by AM0PR02CA0175.outlook.office365.com
 (2603:10a6:20b:28e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 14:27:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Mon, 29 Dec 2025 14:27:52 +0000
Received: from emails-5663897-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-251.eu-west-1.compute.internal [10.20.6.251])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id BE0C38040A;
	Mon, 29 Dec 2025 14:27:51 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767018471; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=bb7J3ChCCg09n60R5qJK78UBouiaLZrDB0MZ74xFIrA=;
 b=YOmRjnAkHXs5JZviW+GBcMZfvUxChfz0wGMZ4gqCTEudyT6I63KdMi24/hfQWUuCVK2sY
 XWVf4aof6AOstrRZmP+k5R81PtCdCJwUBGE0UwyvzbbgUbeErYud+fRKqOlHzduLsdbSLMv
 oDxDQE/KWs6tScFmPj45H3qiWkI51dY=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767018471;
 b=CcZea/k8LjGl1N8bQzU83qtRK8gmfY9+5rwC+m/i88ZXhNA+gYyJ0Q7bPDYicR9w1k79c
 qyTGiH+XVEc1dIuTAjdryReim4MyJXcR9zwk3ouAUpHx1Gwtcnlf/APwVGXYTeAPKRlXggq
 NXjw/BtGJxuSMj6t59vPe7YJQ8qLF7g=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqHYNE4e9LbwRTfN3RJIjklKTk3XmhdMpzmSifhJdbap/PqBu5mrGYz6OPD/rkKyubQ/NFBochg1i8is72qvZ5FJEwwp4bUoi0GjiGghjMrCwmbqE03nYxm0iNcsFWp32jVIyJ1JG9ZA7X/m1PGg1+XcSfKRNAgTH08sI5dyjAeXPd6jhuoIPIsUfzVrPBpbmspLHn0ypdeX6lYvLa9On9Jk+U2lKrUWMWtrU3hkTXL3iq8H75B9kq7rq8q+hxG/bGgqwNbvdRCV6TD/3+XDO0BgHMpzGs6g2PAvqS4byyw2OCo5Xp0EHyrHizAiJ1V5IDb1K+gQDVnbu+SwcR/avw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bb7J3ChCCg09n60R5qJK78UBouiaLZrDB0MZ74xFIrA=;
 b=wtnSN+tu7ZGVl4Rgk/YWn2f2Stfhw5HHFTi6cOGnxddFtrSkzBcq6X3YWfnMkQaUBu/bZQSBDZoX0TIUABIvAp4AiqQH3EBDCxSu1D0chTVKNm94hz1QI2dPgGT1p6mzOhJhw2B4GccP9BfhHTF0KhRhGmiQHMWluQ9URwI20bTlQrlTgwedikll07biDwuevFn3Skwa5HS2ytTr9s7zQwIlAxcROuRmS5lp2w8AiZK+AzX2aVdES9kBnPq9odgOWr0ftNLjAW6hZvZDTbJz3xGjPjykCBXG/roAeF0IJaCqUjVaLZVMZ+AQiTgZ9BKrJW/kt1yNMZqH1OZ0IOkDCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bb7J3ChCCg09n60R5qJK78UBouiaLZrDB0MZ74xFIrA=;
 b=RDiSMSkMlojb6Az1hpVgKkRxMD0ZVlSyadIZEB98au4SRjrFnrcrAaYq/u2OuSQRVfJ8S4CxlYJ8BYv1Td8NxIK9KOJvfuLbhwdd52ra5l+aBfDFhinpTUW647D270R7cfacQAPE4XYfUIn9M/jmZ/lfSqdS4VIPtuqJTSSOOQM=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:27:39 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 14:27:39 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 29 Dec 2025 15:27:25 +0100
Subject: [PATCH v4 1/7] phy: can-transceiver: rename temporary helper
 function to avoid conflict
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-rz-sdio-mux-v4-1-a023e55758fe@solid-run.com>
References: <20251229-rz-sdio-mux-v4-0-a023e55758fe@solid-run.com>
In-Reply-To: <20251229-rz-sdio-mux-v4-0-a023e55758fe@solid-run.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Vignesh R <vigneshr@ti.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>,
 Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-can@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::10) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|DU0PR04MB9417:EE_|AM2PEPF0001C713:EE_|AM0PR04MB12050:EE_
X-MS-Office365-Filtering-Correlation-Id: b8507f15-2f8f-415a-7e23-08de46e67323
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|366016|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OUFjZ21qSHJiU0RUTFh3ai9oMEVVcDU3R2NFLytMd1psdWIyOWJVL0VURmdZ?=
 =?utf-8?B?NU4zRm5zSkpUTjZtNzlxcTNwOXF6K1hXOEdLdEQxSGtLNjk0Z054N3RaUHVH?=
 =?utf-8?B?K1dsQ09kUDVGN0F1YUFzTXhRYU15RDcvMURERnVTcGdRWDFWSU1TY2xQbWJB?=
 =?utf-8?B?b2FQUVZoRHJJNFNsbTc3VDlqUHZXSXhtelF4WUtVeVhrQmRmYzg3dUxqVVdp?=
 =?utf-8?B?dmZmcE1xOFF2MGZRaXc3dnZLYWtjL2RBM1NwQi96b1Z4K1c1VS9oUVZ0UWlW?=
 =?utf-8?B?LzNQSng2QkRzd3IvMHp3RUF4TUZkQ21YSzlLcjd4ZmI4NCtoUGxnNExPVzlT?=
 =?utf-8?B?Q0t3Ym5wd0IvcHRlSFExeUY2dWVueUYxemZLbUVScGUzdENYYk1QSi9Ic0Y1?=
 =?utf-8?B?SkFRZXYzeXhuczdUQUtNZ1QrUDRMWXI2NVNFY1d3WjU1amF1WFpqYXdHbHNO?=
 =?utf-8?B?cDRNbmZjNWg0RmFtNGhCYWpzOUFSaUpnMDZvcmViWmRIbjdJS3dXaVVHOFZO?=
 =?utf-8?B?TCtlZkxRdFdJQ1pKOVVrZ1lXNnBiZjRBRHpack5GMEJxc0YyaDNnVzJ5WlE0?=
 =?utf-8?B?Q2pIT3RtR2JZL2ZLMmdBemh5M3Qwb2wvQVZ6ZGw1c1pZYkxXcnFZckZuMm1v?=
 =?utf-8?B?eW1uajZCY3d5OVRBMlhZaGpTeVB5ZlZmMENVeHZhZ210WHlxdmVUL2pnd0Jy?=
 =?utf-8?B?S2twL0RhcFhNdjU2d3EvYjNTVHIzWFpGQmtiWVdkc2s1RDgvYTV4NFYrSGJV?=
 =?utf-8?B?K2VPUlNiMjlocEoxUjYyYWxBbFBiSGVFV2JWVm9rMFlkdEsrQ3R3SXBLYjBG?=
 =?utf-8?B?YkVKNUVjUWNoMklHTkgzUVkvdTNZTnowZWtYbFFrcmNNR3dpaHVCdnJWZmc5?=
 =?utf-8?B?SGg4RlBmeEdvNnB4UzkxS0l4bjNxZ1dvelBiOG1sTzZLcms5OHNhVUFwaEpR?=
 =?utf-8?B?aXlpWU9mdXRhWFJHclNoR28vMXBybHV5eXMreGhQZWF4aHRSdlVXOUplbUMv?=
 =?utf-8?B?cFVGWFhEeEtPZ1F0d1JMQjlpeHhqNFUwOUE2c0lONFFmOHRWZWdkdjZ5Nkt1?=
 =?utf-8?B?NEJ3Y2lOUXFPR3Ntc05PbjRzeUpYTkVYekNSQ2VReXRBUmNIR1Y1cDh3RFdN?=
 =?utf-8?B?OFp4cnZEbTArMS9heFUvRFJCa1Z6U29TQnJEcXU3bURRcGpOLzRpZnJmN1kz?=
 =?utf-8?B?cUQwcXUvbGE5SVpTcEtnK0w4dGpYSVJBcklRSGNDTk0zTW9uNXNZcFM2SXNN?=
 =?utf-8?B?QncyODJVY1IvK2VtTEh6VU5ZRWp2UGpUVXBxOHVjcHhLRTI1TU5uMHVoT0Vz?=
 =?utf-8?B?cXJKTTFHUTlTV1lNZEw1ZVR4U3pBRGVHYkdReHNpbUF5TUhuZmNTZmlrd05Q?=
 =?utf-8?B?Y0Z2c21lMFltSld5azJEVVc1UG9Dd3Y3ZVR1Nmt6aFZjdVBmNjFmbXVRSndi?=
 =?utf-8?B?akFQSlNzN3JPWlh6YjhWNTZpVnVjRkdTMmN1eHVsY2oyTWZiRSt6bFlNTng3?=
 =?utf-8?B?cncvQlFrWWN3c1hhanhHeWg0SVZkOUEwRXJxVlJSUFZGTGZETjVBYzRVQlJt?=
 =?utf-8?B?bjg3YytOaWZFdjVkOWRHcmprQWQyNEJ2WTVjV2wzVWlIQjNZaEJzS1V2cG5n?=
 =?utf-8?B?RlgreFhPYll4NjI2NkZFQlFHNW0zRkJ4T09BM1Z6M3NZMTdrMWh3SExmUDBJ?=
 =?utf-8?B?RjFSeGdaVDRCM1hWN0tzS0ZtQU5HUUp5NGxNT0JYWktSQzNNWi94OUd3ejMy?=
 =?utf-8?B?ejBMRWxNZ0ZmVmZMNnYwUXlaWXh0L2I2NjVYbWZ6YXV3M0twOUg2Umk0eU5J?=
 =?utf-8?B?d1JpVndHUlFhRkVROWhKT2FLdXRiVXQwSkJyUllRVUMvMHQzWGFwck9uWGNU?=
 =?utf-8?B?c0pEdldYKzF6emd6bGpnU3EwdTR6TmxKeFlIV0lIWWJpanFnVm9TTlZCa0hx?=
 =?utf-8?B?UTd3YWpidmJKV05EcjhMODM5SkJKQTFyWDg5bVZnd2Q4YkliT2RWWDFZTFJI?=
 =?utf-8?B?U0F6VW9jRzB3emxVMkNrcUo5TGpNMDM1ZGozajZCb2FXT1dpdnhLUVhMNTdp?=
 =?utf-8?B?aTF4VVhSSzV0YTFjRGdZRUhiQjVLSGkycGhTZz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9417
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 28c1820c55924060998fa5b949049cb6:solidrun,office365_emails,sent,inline:645ecd6cca06b82d0b30cc7ad8f78726
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2561a1e7-669f-4f49-8f04-08de46e66bb3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|7416014|376014|35042699022|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ti9pZUNpSHlGdWFxSTYva3JBVnhpZW1vQm9YUDJkYll3TzBKUllNd1pGYTFI?=
 =?utf-8?B?YlFCQ2l2YVR6aTNlb2dIKzNxNjV2VFRuVzlIK3dVaTNiR1RJN2hoUDN0R0ZG?=
 =?utf-8?B?bDJ3U2JudXpqdGpzQ29FZDkxNGVQUDVTdDZRWHFMc3lUZXhkb3hDdW5SNzlu?=
 =?utf-8?B?b1h0dTBJdXNiaWN3QzVMVURILzZaU1JjK1N3L0QzczBqY29pa1ZadUl2Um9m?=
 =?utf-8?B?Tk41S0NrdHI5UzhGeVFLVFpMUEJGK3EwYTRvUFZ4RjREbEZGRUlCWldwS3hk?=
 =?utf-8?B?QWYzRXFvVTgwMG5kdmUzRnZqWGVEVHlkaFdmWEdleEI3OHZWcmRQRWh2ZTNU?=
 =?utf-8?B?Y0t2VHZnNUVDTnZyNFppa3lnRHZNR29KdnJKZDZ2cnBMTDdxTFdLNFFlcWk5?=
 =?utf-8?B?V1J2UzBINkh5THRaY2k4NUdhNGpxSFI5ZjFlUWxZTU0rZmhLSVdJcUdsbS9J?=
 =?utf-8?B?QjY2Y0F6U1hDalFpZldmVDYzdks1UEphbGw1N3FIU3NlbVV3UjF4MEtSVmpx?=
 =?utf-8?B?dG12b2VpQ0VVRnRtR3BkU3hzZ3o4R2hENDRCYVhxVnVKMXJSc1lFSG9tSHBj?=
 =?utf-8?B?bkdMTWh3TjVGQldieGlTOFZLOG12T25MR3VSaUNjZkJvck5iRy9NamxHeTlO?=
 =?utf-8?B?ZU1wRFJZaWFaQzFLSC8vdmVERDcvL1plY3B6UlJjVFhMR1RMeXFuNjk2bGo4?=
 =?utf-8?B?bGh1QnZhQTlQNW9MYkFoVkw2bzE5cHh6TGVhbXAyRjl4R3o3Y04wNzFqT2ty?=
 =?utf-8?B?WDdiTk0zRk11U2YyV1hXSVlqdGJxY2FMVEtOZVhnTVRTd2dYZ0tnK2podEZL?=
 =?utf-8?B?V0lLcG90czdQQW5zRGt3dSsyZTkvYkFSNGFkQWhzb0lSd1ZxdDZWeUd1cWJl?=
 =?utf-8?B?QWdLUWRzd2xxU0NHVzhUZ1gra1dkdEFEZStlVERSVit1RzI4azB0elZ6TzBG?=
 =?utf-8?B?dXE0QTFtMFlVeGRKZUY3Z1RZeUVwVFZjWXZldGhuMnZWclVyZ2Q3MGxiN0VM?=
 =?utf-8?B?eWZkbFd3T2JPRFpNQ1Zndjd4eGRzaS9QeGtaT3FuV3JSaEdYZXF6U21OTVlK?=
 =?utf-8?B?U1RubFRzQXdySW1XVGF4eVZxSGt0QkpiQXFwcy93OWl5Ny9pWk9ESHpVaXNZ?=
 =?utf-8?B?WGFtUUhobFd5WFJUckh0VUNEUCtJcEhxa3NOVzJsbldUaWxzdWwrUWp3OXky?=
 =?utf-8?B?TGlJYzFpWTFjNmJ5VXJ0cmJxYzF1ZVlKRUkvSzhxTUZ0akN1c1Y2c2NVM0lG?=
 =?utf-8?B?d0FYRmQxUnFnUDNXVGZJQXJTc0FpZ1p4SHBCQjdMTHpma1FybHdlNEhEdzAv?=
 =?utf-8?B?SFpBY0RjMy90eVViU3BySWpMNUJTU09hb1MyMHY5b1ZKYU1mOUhNQ3ZrMysy?=
 =?utf-8?B?dzM4anhuaTFESXpmRXFoK3RRYUdSSzJobm84MEhNMXB3R2kvdGx3MTBIZE9m?=
 =?utf-8?B?SkVxemZ0cjh6VklvWXZFTnJncFJHY0lZdGdrc1NleUR0anlIeGVRUHRQZW03?=
 =?utf-8?B?bmJnSGI2OFdQLzVEaGJIYjMrbzRqKzZVZWdWTGtFVk9ndHVPeFVVU3hmcUl1?=
 =?utf-8?B?VGlzb2wxN05DUENuSUJqdVBmVFBIemIyZkpoeVZpMHY1WHFtd25mQTNWeWw5?=
 =?utf-8?B?cEtmQW9mZDJZSkZkdFlRbExoU0huUDhjUHNlTmJ3S0pvaUNhWE5xNytkRDgw?=
 =?utf-8?B?OC9PblRFRnl4eUxjVE1ORFFDZjFWTGNZbUlvRjQ2dFE3Uy9uTm1RajY5aFhL?=
 =?utf-8?B?bzIrMWtyak04Q1k2TkFJaUZJc2RmWDNmUFFRTU1GenRDdDU5L2RDc1lLZnFp?=
 =?utf-8?B?bUZXcHlBWmYzNkwxeGc0NXU2ZWV3cm1kc3p6cVp5bmVSWlZwNCtRWUNjVVlL?=
 =?utf-8?B?V3JKYVdWN3cvQXpJS1FBL3U4dEZYTDg5NHR0cDN3N2ZMRXlGRzNzTG91TFFD?=
 =?utf-8?B?YUdpUDREMUNOU1lDeE5qNU5YbHIwN1RiakhKUFZTTHVsc0d2aWR5VURzeDQy?=
 =?utf-8?B?eW9WZ3AxTUtFb2QwcHh3K1R0UEg1bGpBSHp6ZGpXYit1MHR6ZEhMalRWTGJR?=
 =?utf-8?B?Z0JZeU1HRXpHdU9rMklaZkNRR0o5aEo4Zm5oRmZrd0FvU1Z0c1pnTXVwdUhv?=
 =?utf-8?Q?DzcPgmWbl26bKW9PTpRnQruEh?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(7416014)(376014)(35042699022)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 14:27:52.0304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8507f15-2f8f-415a-7e23-08de46e67323
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12050

Rename the temporary devm_mux_state_get_optional function to avoid
conflict with upcoming implementation in multiplexer subsystem.

Acked-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/phy/phy-can-transceiver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/phy-can-transceiver.c b/drivers/phy/phy-can-transceiver.c
index 330356706ad7b..81591d2471282 100644
--- a/drivers/phy/phy-can-transceiver.c
+++ b/drivers/phy/phy-can-transceiver.c
@@ -128,7 +128,7 @@ MODULE_DEVICE_TABLE(of, can_transceiver_phy_ids);
 
 /* Temporary wrapper until the multiplexer subsystem supports optional muxes */
 static inline struct mux_state *
-devm_mux_state_get_optional(struct device *dev, const char *mux_name)
+temp_devm_mux_state_get_optional(struct device *dev, const char *mux_name)
 {
 	if (!of_property_present(dev->of_node, "mux-states"))
 		return NULL;
@@ -183,7 +183,7 @@ static int can_transceiver_phy_probe(struct platform_device *pdev)
 	priv->num_ch = num_ch;
 	platform_set_drvdata(pdev, priv);
 
-	mux_state = devm_mux_state_get_optional(dev, NULL);
+	mux_state = temp_devm_mux_state_get_optional(dev, NULL);
 	if (IS_ERR(mux_state))
 		return PTR_ERR(mux_state);
 

-- 
2.51.0



