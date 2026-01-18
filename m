Return-Path: <linux-i2c+bounces-15256-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40789D39437
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 11:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 680B5305436B
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 10:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FF3313533;
	Sun, 18 Jan 2026 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="KhF5ULqE";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="KhF5ULqE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023130.outbound.protection.outlook.com [40.107.162.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD90E3016EE;
	Sun, 18 Jan 2026 10:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.130
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768732187; cv=fail; b=pfx9jTfo5nrPmiAV9aZd556vpOWrDVSH2TZUdHbpgUf1Jt9xNaqjR7V4Ep6cOJK6mEWE0L/TX44m5Os0wIAbHE36J1ROkLt9K9iqUU1f7BY6uDeitHsLlccY/l9ymoL0QyHSXPrOZ+1l6W7CHR19TeCT987SGrq1P/CMyf5WwTI=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768732187; c=relaxed/simple;
	bh=lwo2N1VQxHbYFKvBY4PCNgIqvgtASSI8WB/NcznABv0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Iv4I+h1RqVDLCygIfSzHRHOfWRJ9A1VAKNEZy7LR0jUZqSG0BDWd+qysQn4HthVOISOFBquYIQ5XSSI3K/npNMrKjv3I02VA6wd/EEV7fX25Nw5b4toBmlnkDu5SAjRF1kWJBbV12mVAyTdpa1qhiGlPuPON7r3O13dBPia0pKA=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=KhF5ULqE; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=KhF5ULqE; arc=fail smtp.client-ip=40.107.162.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oLvJtN+tJB+qQ86BPu/9JR/RqiBItzIRQRQlZqVUo1t5WRl6yA73Pjw7hJxynM/ZeUMVjZTPftRnyRwB/tYKsb/FjIF8gSE5TQJBMOFlBmRd4818/SA2BU45qxw9kmzg5wAhFR9gd/38n6M5l2hgX3A/7zP3L0UlaABEXUu9azxkZO+ZOnDiKfnYisyDIViuSP8X2HW2x9EZUFauM+kNHqtoEdqcsUljvOv3ea8fscHBhBdASxozMVhRwp8vrkVmv1PtBwNfuT8u/6aePwCbOtHjAzaO9feT1l3GE2+98tNCQa0v3er+ktl+r7xl1od+1v1M9fwwbvsINNuZ2Zb31w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jb98mak/6IJKgwYIjXGYzN1dXVw8RJEITJbKeASP2rE=;
 b=EdHgH1hO0gOHty8vHCOpnvZCGoVVZc0mIiBis8606uoBn6gruMjaj5Wc1D0qt363AfPjhdQ21R6hVlRDyfooRVqJNbNmAmOEmyQLF8YG573JTiB3gUUN3U1rEgH7sebJ21Qe7MyC+xszhQV7TBRg8lOxkrMoidfPvomGux+oq7LkEuFUB/mLs4IPGHD+2dRiy983pStdNCyCL7sNa3hiPHGwHwnEqAliV7z8oeUMfIvc2fb8JHj4s0cbXUk3pVGWNZlST5O1L8zgEVE/H2Bu2BIees32YIuFOZun5u6aq0O1w9I4U+WexDSS/k63e2Li1tAd075Rzhp2M7FCOrY3WQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jb98mak/6IJKgwYIjXGYzN1dXVw8RJEITJbKeASP2rE=;
 b=KhF5ULqEm+sv9z/vDj2YQC1CCV1gZR1wA/ASU3hG4HGeztZcIQF4WM3VTsVhpPNjB34htsWUmI7+YwJDWi+3NhG4OUa5OFyTxxkYxgqPudx1ZtUgDS0z8m92qtrPvLe4P/tih3YJLV23czp1OEAvE2p4bPc4WUSA1jHz4i9yDc4=
Received: from AM9P195CA0007.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::12)
 by AM0PR04MB7058.eurprd04.prod.outlook.com (2603:10a6:208:195::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 10:29:36 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:20b:21f:cafe::4b) by AM9P195CA0007.outlook.office365.com
 (2603:10a6:20b:21f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Sun,
 18 Jan 2026 10:29:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Sun, 18 Jan 2026 10:29:36 +0000
Received: from emails-477551-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-103.eu-west-1.compute.internal [10.20.5.103])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 693598015D;
	Sun, 18 Jan 2026 10:29:36 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768732176; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=Jb98mak/6IJKgwYIjXGYzN1dXVw8RJEITJbKeASP2rE=;
 b=JA9g+O77m5iW4uMAgJdJTd5qMUJUkpmHs1bH1VB8Y96JD5L+pbQtQh+8MD/nRu4OZNpeA
 daU7i8FLl7VAC9A67kTpzRqs0ut2dp+R5GhhKmhbje7EgM6pL4g1B5LNNWB/BVOWGSC1+Lm
 Mrm3Xe0YLsBj9hBNyVSVwSPiZnppGYs=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768732176;
 b=eSbJt9J5yN+tRZSVE2gMfXKLfwut19Es1M8kWelq4Q5iJ0c4XuCZ0w38bbGmSQSKkMmFA
 Z93qNatU5isMDOKCHcejsYKRq9BKBnc2bycYm3PrPocMK955r+HlwVBsv4yqZlEJQmwm5GT
 5/4ZUKV5Vtkxod8E4WpMH8jsZPgHhmk=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJ00t8KRgBvoUbPpplbwi56+F9e5mEVSFjDkGAhSpFHpHl7infftRBevHdhdRaKBM4CZ6qGq0o+dckQDw2cn+Kla6vghGOI8lfVsnZOf3t31x69JxIys6KeHgGe21ovO48zafFdIzZHna63LUiun9Ibu9GrEAXP7WhzJ1Hn7VoxIMXt4UeCjt/xbzFoVxtrsvaYw84aAOTiWyiDIFSty+O8y1sFbn9IdhVV84qgeiKUz2Bmfkj1Rsv1WbBvp9ZE1MbuwDOs3wWDQcRAqwKFR/odamqj9CFHd0P/emY/rgE21t9Mmbgxj8YrqUgCdzoo6JKysuPzbCiHS/XafM6s7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jb98mak/6IJKgwYIjXGYzN1dXVw8RJEITJbKeASP2rE=;
 b=dcetVceDeH085A5HnVw99DoKKKVUb2PLynlsqTdB9u4vCs2H18JS1pi2pFAby2DbdLRTOwkhpxmWCJMddM5OqwTD/okkVDngC1yOrgq9TwuRyUFrsfhrJHGU+IlqoRZhE22xFaMI1+BnkoA3I51+ZrFfaKHxXd+S7zFeOkMw/3/g4coDIdeVFeS7eD2qvNAROD1Wf8/PBuxbszMwovuH04K8jLxnUvoVG6/PJ/SQ+8F7+OyiGO2IRlhNlsxTA4ElW+/L9w5zcU4E55gT1ndvJDubLci/TEpz8N0Tad9FyDxJBHcAraXEQgbIelHpqVx1ZG64i7BlE33DDchHeohO7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jb98mak/6IJKgwYIjXGYzN1dXVw8RJEITJbKeASP2rE=;
 b=KhF5ULqEm+sv9z/vDj2YQC1CCV1gZR1wA/ASU3hG4HGeztZcIQF4WM3VTsVhpPNjB34htsWUmI7+YwJDWi+3NhG4OUa5OFyTxxkYxgqPudx1ZtUgDS0z8m92qtrPvLe4P/tih3YJLV23czp1OEAvE2p4bPc4WUSA1jHz4i9yDc4=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAXPR04MB8800.eurprd04.prod.outlook.com (2603:10a6:102:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Sun, 18 Jan
 2026 10:29:22 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 10:29:22 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 18 Jan 2026 12:29:03 +0200
Subject: [PATCH v5 7/7] mmc: host: renesas_sdhi_core: support selecting an
 optional mux
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-rz-sdio-mux-v5-7-3c37e8872683@solid-run.com>
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
	PAXPR04MB8749:EE_|PAXPR04MB8800:EE_|AMS0EPF000001AD:EE_|AM0PR04MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: 37171d8c-7714-4aa1-e34b-08de567c7ab4
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NHdKL3Jxc1FlcVBuVXVCc21idHBodTFITjltOWFkOUpub0ZyNFFyMUZRb0dl?=
 =?utf-8?B?dXZPNjVyZGpYdzdFZXpFUlgrVXoyaXZPWmlaNXEvbXI0NjRHRkRabTlic1Jj?=
 =?utf-8?B?QmJ5UEsyenlPTEQ1SzhJNzdscTJnVTEzYytDenpXT3Y1em5wRHNQclZ4cXhw?=
 =?utf-8?B?bS9uUFlvdko1d05pSi9UV1RodWNMazk2cXdsMjk0bFNPU29xYmdZaFFydUx3?=
 =?utf-8?B?cFlWN2NQa3o3YnNwSFhYQWZrU3hNWDNIdkhpQnY2UjdHTmt5SERLY1VmUjJU?=
 =?utf-8?B?a0NISDd0V0dMSTNtRWl6eFhxanR6MUpDMG1aUklSd3IwZXFlNE9NbGhRQ1Qx?=
 =?utf-8?B?UUpVSEN0MGREdmZYNjZXbTgzdURXaExUWVdaYUx6WHRRYVR4Nk1XNDU5cCth?=
 =?utf-8?B?REs4ZXZ0UVJrWE5IV1BXMW5laDlCS0lBd2VJTWxBQUpDMmpVSDM5ZG5RanZU?=
 =?utf-8?B?Q0hodnVvODYzVW1BZ0J4MVFTandLZlUzVG50ZXd3cno2WDlSb2pEWHdTS0p4?=
 =?utf-8?B?OWJra3ZleWZ0eDE0cndnZ1A4cjV2bDAya1dlYUtoUGI3aEh0Wld3bnVJU1VS?=
 =?utf-8?B?N05Td2lXMElwczRsVXZnN0QrdE8wVUlMYVU0SmlzTCtDcTd6Tms0YWMvR3NI?=
 =?utf-8?B?aVBvaXdEaE1RanZ2bzRMSHA0Y0JTbzdYOU9LMDM2RmdncDhWMFdZakprNzJr?=
 =?utf-8?B?YWJka3dHc0VvMEplR2RxTTlLdVBxRk5OdjFmaWgxbm1ab0h0dHlQZTRTWFor?=
 =?utf-8?B?bFFadm5nV0p1Z1dzQVhwQ2tzT3lydUlyZzcwRFNIQ0tmUnpYM1Q1NzVpRm5q?=
 =?utf-8?B?Z3gwcndKdnFXZDduQ0J4ZjdDRGVIRkZ6NHJDc3ZJMW1ITTJ1QU9ka1RnR0JC?=
 =?utf-8?B?N01aVmtWdjlKSXJYQ1dxNjRXUkJwVzdsNHZxNTcvTjdpZDNxQ0d0dUpqZVoz?=
 =?utf-8?B?eVZpb2ZMMkdoN1BPOTdHcE9SaDZNWklKeStmOWZRdzVlSXdEVXZhNitURzE5?=
 =?utf-8?B?MkFyTTBJNGV6bzI4N3N6OGFhUjdTQnBYMHBMa291VDYzYnJDZDhYSE5oMjZU?=
 =?utf-8?B?aHB4djJtRW5iMUpaK2pRUVB1NC9LTG1ITEJEOWUwNzZLZGN1VnRrbkNYTzJp?=
 =?utf-8?B?dSs5clpKRTE0NE0xR1cyaExKU1NpUndiRWxWeFJKcWtzbHVVb3FKQU1YcVBk?=
 =?utf-8?B?MDVMT29lK21PeG5QNWk5a1A2c3JPbHZkNnhqbm5xUzRqSERzMzJTUUxzaDRE?=
 =?utf-8?B?aVRkQkZJSENudnFtK2NlOHNHRDZoanlDNERvaFdudXRBaEQ5Mk9pckdWWCs5?=
 =?utf-8?B?dmg0WWd3T0NMWG41TXRiYW9vWjd3enNSNExrYTh6eUZheTdBeG9aaWJXeE5U?=
 =?utf-8?B?aS9nanpLQUlSUlp3elNMSXF1UU9KZmFCR2Ixdy8zYTRReHFCK3VLeUxvWWlV?=
 =?utf-8?B?Ykt0UmpaMUFIY05tTnBJVTYveHREbnkxMGJOSFFGMmp3Vkw3NmRHbFVET0dL?=
 =?utf-8?B?WjVCcXhBeEtTVHdGSzY3azNLcktqTDN6dmwzT1hCSi9JUEI4Mk9lS0ozSkQx?=
 =?utf-8?B?NTRIQi9rSm9JQnlwdWo4SmJadVBIelJUVHVjSUdEaTA3bzZ3VlJMK1huaE5T?=
 =?utf-8?B?QUJaUW4xOWFWd0F2VWlsRmxKUWU4eWorN1gyaHJOQ29uTzZleHdOU09jdDFX?=
 =?utf-8?B?SWFlNld1VHBnOERIKzlXWGtaMWVKRlZGZnFySjJVL29nS3NJaU5OQVRGSUJj?=
 =?utf-8?B?VjFnUFhkUU1GYStQMktwLyszZFBMTVMwazA4VjZkaVJkLzduTFkrZEU0cVlu?=
 =?utf-8?B?dFlkN3RpaEVmU2Rsb1lzSmUrMGhVU2ViejBTTWw0bVI4VHFOTmI1VnZWNEZJ?=
 =?utf-8?B?RlU3RldxSFpGWTdpaHg1UHZzd3VBcFZxVmQ5RDFDOUUwRTJndmM0S0YzbkNk?=
 =?utf-8?B?Tk5UOWYwK3RxNndJOVR6cUloM2VZaTRYbXUySC9LOFRIZUNNcFd6VCtwb3Fr?=
 =?utf-8?B?SVZRcm1NNWNLOUJ4OXdjRUZGdHM4RVFGcnhnemdxdFk2YzhpZTYxaVoyWVQz?=
 =?utf-8?B?a3R1QWI0T1lFSTMwaGJubGdpUlNoMnIxNDVpRUhIeFhQZ1FMdHNiUGw0eGxF?=
 =?utf-8?B?VnIvWGVVUytXNVJTSUltUk9rOU1IM0VFKzZPT3RINlNvZjl2VXphcVBOVUhF?=
 =?utf-8?Q?rURrPxrI4W3fHVf26rzWp42uAR2nCxFI+qj/KX0WURNP?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8800
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 349ad35a20074df8abba133183c8db6f:solidrun,office365_emails,sent,inline:10be8686da63a4de695eb0fd74d4d4ae
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f14608e9-66fe-4bee-1b48-08de567c71e3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|14060799003|36860700013|35042699022|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkdtMlBPNFoxdGZ2Slg1QVc1UEgxMEhYeFVBZVFEUmduVXE3N3JZSTZQTGRT?=
 =?utf-8?B?Wm1wVHNXUE84Nm5uMzlrU2xBOG5FT3VQLzhEcXA3S3d0WmJSTEZRUVpobHh3?=
 =?utf-8?B?aFJiZ1dkc3p6MmpCWW1kM3FzRUZDZjN2SDZValFzYTFLSXBXbzF2RUVYNWYz?=
 =?utf-8?B?YkJ2WFkvbytJRm5vMVE4RWVIaWlzamZBUG9DbjVPaVpqVjgrL3dWSG1ES3VF?=
 =?utf-8?B?OEVTaUZHbWdYL3krSEFtc3hkcHhXRjkvNTBwTFNGT1c5a0Zaayt4STFubjlL?=
 =?utf-8?B?cGdpVE5kOFNWTHFLa0VnNVd4YnlObkZTeGR0ZGlIWEl3QUZPN2dlb3dFV1dx?=
 =?utf-8?B?cDh1cndPTUk5OW1oby9iUlN4dmUvSW81RmNQL0R1MTlxakdpTTUxV2JDTEF4?=
 =?utf-8?B?bkJjRDBmYnBXOVJBdmV6ZnNvYkE5eEdyNGNmTlhaeVFjS3dtZTAyZ0RBV04z?=
 =?utf-8?B?OFNqMHRST0NHRzBYcnU5UGV0SWRNZ0M1cGVNdWR2cnUwenFCbmRIbDJOdEQ2?=
 =?utf-8?B?VjhHK1R1RjZ0RHFiM0pycWJEUUptZlJpREZkRGNxYU93YzdoaGEyUDJXMnk5?=
 =?utf-8?B?a1dHMGVJNFZDRVlMVUd3R0VQOXFqM3llVVhxN2RxQ0tLai9jUk5TSGtqTVZE?=
 =?utf-8?B?YjQzSUQzMHBjSW1GQkp1NFFKY3lDMXVZL0YwYm8wdnFJR3NGN2MrTTlWUzFx?=
 =?utf-8?B?S3FyM3Q1bGNpMmFjTWlsZ1dVbXhoYjdFMkZrRE0yQmkvTlI3dUdEdlgraXdi?=
 =?utf-8?B?TWRaMEtNN2t2SGNXQ2ZsdVlCSEhHalRoUTBUYlBwZWhzYXRXOElPMjR4UW1O?=
 =?utf-8?B?ZmlaaVlUY05lZ3Yza2V1ZXR1bVgwWmpXUVVzblpGUnFZeWNDMTE5UkFGTU0z?=
 =?utf-8?B?ZnZoOUczNjNJRmtRUlUySWUyTVcrVXg1V1hwT01GYTlyeTdScmlsWWdZOHht?=
 =?utf-8?B?REdMc2t5WU1SNDZmUFZ4dUpJblpuNnZrQml5ais4RjNVM1lZR0tXT0NtM2Ri?=
 =?utf-8?B?RmxSVnpKemJjOWRqdFFEWUN0WmZaTWJFaER3a0dqcTFBZzh4WWVtY1hGcHhy?=
 =?utf-8?B?eDFPY3RCNjRWWHU0dUxMZmdhS09KeklhUVZJVDBIZVNZVEh1cnJoZzZZUTkv?=
 =?utf-8?B?MFZ6a0xNc2kzcjEvTmpzaktIdkphZHhUVjdLZzhWdmd5dGxvK2lZYlIyYWJN?=
 =?utf-8?B?S0RuQjBTQk9ocXc1T0ZzOVBmR3paVjRRWWkzeW1lRHdhTmd0dlVzL00razlI?=
 =?utf-8?B?TTdMVzIvbmFVL2lLWnQ4ZlpPU2NMMzNjOFhZWlc2YXp2TEFDZEJueStDT2NO?=
 =?utf-8?B?QWlYcU5XU3JCSFp0VklkSGQ1WkZnSGJjbElyZVR6QjY2QTk4amJSQUVrSG55?=
 =?utf-8?B?bFRFL0Q3a0Mza05DdHQxNE1MbXFhNUpSWTVISGNaYXRrd3N5V3dKY1NiYTFx?=
 =?utf-8?B?RFhqYXp6SXBQTDVxVDduYUJveTg0KzBQb01JWERYTTNWakNhSUZXR1QxdEcv?=
 =?utf-8?B?MmNBLzVsOWQwZ1NFOEptQUVuVmpKUStXRmFJS0Y3b0VoZVgzc1E0NW5yTmMw?=
 =?utf-8?B?aWJwR3BNcU84bThodFk2b0thNmtpTlNPWjBQdDh0NGlyczJsTGsyRWdJQmpk?=
 =?utf-8?B?em5aRTJNUGJ6b1BleDVSSUVOdnd0Skwza0NVdWxUVnJsR1M5NndHdU0wWGV4?=
 =?utf-8?B?ZnF4QXpteW1IOGszTjRGT1VsNEk1TUFaZnl1UnpoMXZBRXArclVSdGR3TWVD?=
 =?utf-8?B?TkxtQmoyRGxKSHY5UW1sSWxnQ0xGdWJNeGRad0RNaXIwbjR1dGNpQlNrK1Yw?=
 =?utf-8?B?UHp3UTRxczZLZUxXL1dNMGQ0eUJFOXdWV2ZGVHhCRWFrMFJlbGJQSnl2WWNj?=
 =?utf-8?B?Y1BoeVR6bmJ4VHRlVDczSEVzUThpV0VEUmtvb1JqcXFUdmJNK1drTDE1MnZB?=
 =?utf-8?B?TFdVbkhNZUFSaFVKMUtHVThiOHB1dTAyRlMzQjJSbXRYdGFnbTg3Z3BHSi9k?=
 =?utf-8?B?bVozMXFuSEhLZi9qUlVVdHJJbmwzM3JqaSt5Q3NXRTJhUkt0YWNrUlVpdXJw?=
 =?utf-8?B?ZnpJN2ZNTU5nSUFHRHFtQi9zcHF0RWNQejhSNzFFNEk4MzBNU2RTQURTUmow?=
 =?utf-8?B?Y2ozSjlVQm91NEkvMlFSV0JYa1BCU3lrcWNRTm5uTUZJYkdxYytFZk5kSUFp?=
 =?utf-8?B?V05pSkF0a3Y0ckJVaC9wRE9nbGhITEtITG5saldFQVo2cmZzTWh6MmtjY0pS?=
 =?utf-8?Q?OAq/wuoO67ewT/Rb0QWZ48WbHY2mt68y9QKjpePh8Q=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(14060799003)(36860700013)(35042699022)(1800799024)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 10:29:36.6801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37171d8c-7714-4aa1-e34b-08de567c7ab4
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7058

Some hardware designs route data or control signals through a mux to
support multiple devices on a single sdhi controller.

In particular SolidRun RZ/G2L/G2LC/V2L System on Module use a mux for
switching between soldered eMMC and an optional microSD on a carrier
board, e.g. for development or provisioning.

SD/SDIO/eMMC are not well suited for runtime switching between different
cards, however boot-time selection is possible and useful - in
particular considering dt overlays.

Add support for an optional SD/SDIO/eMMC mux defined in dt, and select
it during probe.

Similar functionality already exists in other places, e.g. i2c-omap.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 2a310a145785..f9ec78d699f4 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -26,6 +26,7 @@
 #include <linux/mmc/mmc.h>
 #include <linux/mmc/slot-gpio.h>
 #include <linux/module.h>
+#include <linux/mux/consumer.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinctrl-state.h>
 #include <linux/platform_data/tmio.h>
@@ -1062,6 +1063,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	struct regulator_dev *rdev;
 	struct renesas_sdhi_dma *dma_priv;
 	struct device *dev = &pdev->dev;
+	struct mux_state *mux_state;
 	struct tmio_mmc_host *host;
 	struct renesas_sdhi *priv;
 	int num_irqs, irq, ret, i;
@@ -1116,6 +1118,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 						"state_uhs");
 	}
 
+	mux_state = devm_mux_state_get_optional_selected(&pdev->dev, NULL);
+	if (IS_ERR(mux_state))
+		return PTR_ERR(mux_state);
+
 	host = tmio_mmc_host_alloc(pdev, mmc_data);
 	if (IS_ERR(host))
 		return PTR_ERR(host);

-- 
2.43.0



