Return-Path: <linux-i2c+bounces-14499-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C80CB3AD5
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 18:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 423BB314C6C9
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 17:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4370F328614;
	Wed, 10 Dec 2025 17:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="iRiR0U85";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="iRiR0U85"
X-Original-To: linux-i2c@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023096.outbound.protection.outlook.com [52.101.83.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8013101B7;
	Wed, 10 Dec 2025 17:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.96
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765388370; cv=fail; b=t+0fLWMJzQhdVpNHzxcbiTZvPNihL1BT5AAgRatXdpnuzPXNx5RavQRe8BokF2tC8UxmIB8+jpHEXnK80b1PV9SyTrQhrclDY3HBT/Q65VXoducQiQhhg4nZdNRI4FdyY7RqUy3ju43nJ8nt6Ta1eoWatYHqgM/Qmmpz9+zf01U=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765388370; c=relaxed/simple;
	bh=07V66ET+NQATNS+kHUCFoyyJMIQ/IvVXamlDc2UJX3g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=f5K2g6hVpLwrgbbCC6lxEGZM3YgAS4HCcomWgEWb+uamNt9by7gZW8oB9lQYxsHP+mle+KmVHm1gaxTzsKwuPzcPcu2CvUdOz4dVD2nCcJAb6Wezxj47kHEhL74+TnUM8yA5hR1ZjMfbn0PRJPPHiAirMSBbpkuUjMBOC8y2+ig=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=iRiR0U85; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=iRiR0U85; arc=fail smtp.client-ip=52.101.83.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=c3ZN7pqW+HLl/wBLFBk1rHx8+Tcb7FSX8zEv0n1v4B2lvuQCyQQS/o0KSAfy1nRs9Il8V4jCjnNmcmkYkxyf41MPR9u2vmc4v2R4680c9pRLhPWit8sqDcm3K7CHpdx9jX9/oTfmNE7lJVEYlL4iS/ztydw+YrAh86sHeMbnJCZzj2bz20sg9Eitc11QJ06HzQTAw7s0jxD9YEYUnfxISCeSCt0SdX8fpem7EohueOd4pZbkxGS9ADiE1T7KpSlcud1LHV1RIwnpeVDyPwsa3K3NwAJaS1LLh6Bz/bm0PTn7ChAVqL2qJhazSla2QDzIZmeDLHKZGm60nB/1mhPO3A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/yHX28TrhtGKRw4rBhB+jmvMOakSNzTT7zke+ZFvBI=;
 b=XnALNBSsJZ+/FyS+IW3nYbDn5EyHUEwiglaEx/Ym4F7WEwaM9evsWhZl8vnmwVIQcVybLZg+ykBEwyWBbrVEQ5D3ylTmhMo5ZzataByb2Fj9Bsaxp0FfXBaE+QNPk8IR3Dtd+DExPbSjmRodeqH771Oym84UJ0kbP7dWvguXL2aacnzMjo15WaeqAsjslNLK9u6Xl7PZPOY2urAk53Xbd4RF2hi3hulFWRPV9s3Zcf2DW5q/5FeBAdmsooT4U+12bNz1yD2nXbXHohEUWrr9JMGuIisMaMVKnug/H5+vDXOLcZYxEOG0ZZcgp3zJX3+ZLmoFuCbv+rZ08mMj9Kx6vg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/yHX28TrhtGKRw4rBhB+jmvMOakSNzTT7zke+ZFvBI=;
 b=iRiR0U85eymBA5aGoIZhuRyCGQ/AT+MDAyNn4eENeH6FC6p9SNcYa3fUBIcdNUpxNK0KdXJbNGs/k4/2REz77KdF9XiPNnoEL5taL4pHE+J197MQW29ePX1LEAMQplRPOC6mIsZLYHSQmoLxeJm1HeL4LHcYxoIwTpAwQZ7EM7c=
Received: from AM0P190CA0025.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::35)
 by AM7PR04MB7077.eurprd04.prod.outlook.com (2603:10a6:20b:11c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 17:39:23 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::a2) by AM0P190CA0025.outlook.office365.com
 (2603:10a6:208:190::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Wed,
 10 Dec 2025 17:39:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Wed, 10 Dec 2025 17:39:23 +0000
Received: from emails-5906884-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-47.eu-west-1.compute.internal [10.20.6.47])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id C74487FF97;
	Wed, 10 Dec 2025 17:39:22 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1765388362; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=N/yHX28TrhtGKRw4rBhB+jmvMOakSNzTT7zke+ZFvBI=;
 b=EsqmC8/7hUfg7kV9AhBmbWnmJ/SuoxcjcNxKdIH7sXHtYP4a1BsEaJWwDQo8g6l3YLRdo
 u8uHdVEWIRe7CI63vh5PAw4grHzFlp7jLHFeaK7vhic/ie55XGyyQ/CcW0adjY87fgee/US
 rMIDXZjMi5Q2I/v7rwZcOOybPggwkG8=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1765388362;
 b=NC/0XLxpJ4/yZqmAMXjtorKk5IXpFBZeeE+0hHmGVY4S3oquTImuGoz5Q8DzZ33HMVf7n
 w4kOIJr0rIm42GwccK3y3g2nztW5y1kAlF3txnO2G7SeMLLPD4Z6sP59S0uREowbVSS8jt6
 2LRIk6noZN7VtJmbXkwutjNg6EkpAy0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkVUa07lY3VUw7qJmSeFAZlr81/BRc1Wu7hwl2Xxp2+j0cfu14YLARpmGhT5G5v/z5FQvqwJUvrXajYZ+xFXYiY6nDw5lrDK4qovehM1MYZtHBtVH5zz/1QLIsqVZX/PMsK/Bh+CdOcjoZApfIwxNJzUWS+oKXjCZFqQLANExQCk46xlOQzSis1Q0LWgE+RZdFTVCohwIGsUnGGpoGzwd7l3ocV7vty0IlIJ8km5on+TrrxtsKeUyNewkeyftlveu6E2X+StQJz4tsgr5a6eg1gfLR2P0cxWjsLjZdG1aKAA5zEu06Tyw3vrwrEjX7g9xB2BBXi/wr5cOkisRfF+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/yHX28TrhtGKRw4rBhB+jmvMOakSNzTT7zke+ZFvBI=;
 b=BYjNZkzHSyOiyCsESxP539E8Y0irlnuXxFwpp2VPBlUmEBMQu1LT+iDqi750/KWZL67h2Pxq2XefYFE8uY22pw4SW0xc1wbXDqTcb81B/FnqiP/1EYcY/j7K6/qOhv1wlFsAhUZHRopLmzZaNf761ehZp5RS8Acr5+fWz8FNruf4jrQX2QEvT5MkV+ziNxydMUw1sCAllFvxEgvwndU+h0GoVoJ3GTD2VIM/P5Usz4XcJSuoQLD8tmRnIR74gNrFPiQ0664HcTRkDio3NtrJTRaGm3EJ8zkLRYk1Bt7tAN/CbenByvvno7QhzCDu1FGs0EFC3vLr6QB3JXCgaN0c8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/yHX28TrhtGKRw4rBhB+jmvMOakSNzTT7zke+ZFvBI=;
 b=iRiR0U85eymBA5aGoIZhuRyCGQ/AT+MDAyNn4eENeH6FC6p9SNcYa3fUBIcdNUpxNK0KdXJbNGs/k4/2REz77KdF9XiPNnoEL5taL4pHE+J197MQW29ePX1LEAMQplRPOC6mIsZLYHSQmoLxeJm1HeL4LHcYxoIwTpAwQZ7EM7c=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAWPR04MB9717.eurprd04.prod.outlook.com (2603:10a6:102:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 17:39:10 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 17:39:10 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 10 Dec 2025 18:38:37 +0100
Subject: [PATCH v3 3/6] phy: can-transceiver: drop temporary helper getting
 optional mux-state
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-rz-sdio-mux-v3-3-ca628db56d60@solid-run.com>
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com>
In-Reply-To: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com>
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
 Andi Shyti <andi.shyti@kernel.org>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>,
 Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-can@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|PAWPR04MB9717:EE_|AMS0EPF000001B2:EE_|AM7PR04MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: f048ac43-e4af-4127-7158-08de38130e7c
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZEJKVWowbWhtOFlKMlJsZzNEb2M2UmNmbTRsdVFrSnlOV1ZjeHRwdGJ2djZz?=
 =?utf-8?B?MkdhWHRubnBEdFNOenZVZzFobVhmMHBOdERjdkFzRnRaMkZSYjdaaUJtZ3VE?=
 =?utf-8?B?WlZ6MFV0YnV1S01QWnk1ZmpxSDJnNEdBSHFxZG5wSDN4RmdCTi8xTXFKbzNK?=
 =?utf-8?B?aVBIQWFodC9iUm1kbDh2YWxaQ2pscW13cWxPazNZRzhFc3BVRUE2VVMyQXZP?=
 =?utf-8?B?bmR2OGtGV1hMVFpLbXU1UWpwT00rRk5SUjVXY0F5U3lkK1lLVUNCRmNPQkU5?=
 =?utf-8?B?ZVFLTXovMm5nRWM3bDE3Y3pkNG94TlRBZUQvWVBMYUZ4NGhQb1JVSE9sT0NF?=
 =?utf-8?B?NVY3UEtjcFk5K3FNTGNONXdkMmNxaXE3UTh5Y1ZnVWxlc1dVNk1oUzc2TlJ1?=
 =?utf-8?B?WmNEWjdjQVVCektQc3RUR1dST1NhUFpzbHhobHFTYXNaZjBnVEZ5UVRmbGY0?=
 =?utf-8?B?STRqeHpEc0VHTWxHNmVPOHVUYkh2OEdKay92YXRtMG5FdFVmRUNWNlg5Tmla?=
 =?utf-8?B?aEU4YWJ1NDV1ZVFOQU1EZDFmUHMwRkJ4S2pDWUw1M29rZjAvaDVWSEpEaDlx?=
 =?utf-8?B?QVVMWXIraU1xNHhQWWdOTGV6cXB0S29pOExjbG1WZjdiL2lTaHA0YkpLTzVy?=
 =?utf-8?B?TU5iRldCREVGK2lMaUowTWlXbCttU0pLVDhMN2xUemFBbEo4QnBENEE2ekFy?=
 =?utf-8?B?VWFHNVFiOGtFdHh0YlYzNUZhMG9NdTNGTVJPOXVEaDVSMWJCbFdRZlZ6OTF5?=
 =?utf-8?B?SHR4OUNkYzhmMW4wUDNNQUFwR0Y0ald0dEkvT0N2bWJNaDRDYlRWUVFJMkVJ?=
 =?utf-8?B?djdxSkF3WUVFc3R3clBKZFBMN2dYZkVtMk5GY21rNlgrUVpIb1ZzOUhRdlpo?=
 =?utf-8?B?RWxjSEhFLzcrbHp6SDNqbEFNSSsyT2FYSWVNS3AzcUpxRjQvQzhGTjJ5Uk1C?=
 =?utf-8?B?dzN2V21Jc2RvbkZON0o3anBqcUNZc2hSVE4ydlBGdnd0MnR1ZlRaeXJuN09o?=
 =?utf-8?B?Qk9VZVoveGwranVyQmFNbENlMmRXcnFqUUVUOXRWckhUQnQ5am1aQVkreHVu?=
 =?utf-8?B?N3VFU0FKYXZSNmtGU1ZVVEFZZ3VISHhVWGtmOFYvV2E5dkpsdkQ3azdadGtF?=
 =?utf-8?B?cjJjaHRYMEl0MTFRamIyWjcyR2NOYi9tNUFIM2NnTzVWV3F6Q1hFVUNjbTYy?=
 =?utf-8?B?dUVyZmMrN2Q0N0MzLzZ5RDlsWXRqL3Z4UFJFaW1wT3k4MlJJMTkySEMwT003?=
 =?utf-8?B?SE4wSU95UG1sYVA5REgvOFhIdFl5UGVRNGFEYUJhK0phWHJBQW5NVFdIYjhY?=
 =?utf-8?B?RFhqeVlycEdYL24rVENBREpFa1daK3FnUjBVQ3grY2R1T2s0dGFqWEJJNEht?=
 =?utf-8?B?L2JoZlVLb0tTLzRGNmhSd2ZXVUFxNUNYRnJmSGdnUktYR0JQeWNHcmxJSStk?=
 =?utf-8?B?VkExNE5LeU5KK1d5S1pTM1dUQzdFb3ZFL0pmeGJVaEYxNnh4QkM1UTVnK1RL?=
 =?utf-8?B?SjY5Z2QxZ0VRSE12YklsWFJIN0dBQ3F2ZHlzL2Y1RXVMcnlmdkwyMzJnVDVa?=
 =?utf-8?B?NjhUM2p6aGZ5K0tQcXltenI3dmFXdjZLNUZUaEorbGt3MDh6SlJKYVNHVEc0?=
 =?utf-8?B?OXkyWXpaT1hQMXVCZ051ald4NHpPVlhSc3cwenZOa3FadUx6S1hoM1RoVWJx?=
 =?utf-8?B?WFJuOTlZeDk2Ri92NXl3NWpnb2NLQWp1UEIrUVdEZUtPZERuTUVscStDTjRq?=
 =?utf-8?B?bG1uQmFMOUtOc2VoSFFoNTBpSUovODRqMTNKQ1oxMElkczExeXZFRkUvLy84?=
 =?utf-8?B?N1k5MmRPVENrMXFVWmp0NDUrb3FqbGhZRCtOaEswbVMrU3BlUjFSVnp5RlQ4?=
 =?utf-8?B?TE1GV0RNYWVnUmZxb0dPSG5mbGhDWFpqRU90UFcwUFFVM3I0cEtQbFkrWTFE?=
 =?utf-8?B?S29uTTlFcWFYNE1KM2x1RDRQK1E2bnFGWWo0R05kN0VoSVpxbjFqOWI2NHlU?=
 =?utf-8?B?ZzUyeXk5VE5XazFMMEZUNjFnNUxvSytUK3NOZFZocVRHZzFBM3VJQUVKM1Jw?=
 =?utf-8?B?dlhZL3hFZW5FdUFEZDlKeUV2d0w3UDZ1MDBZQT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9717
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: d98bda26188741688d0dc59f33b4b290:solidrun,office365_emails,sent,inline:e3405425bbbc305e82807fbe90c335b7
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8459156d-35c9-480b-1edc-08de3813066b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|35042699022|376014|7416014|14060799003|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzNjWHRZck92UWVIbzAxVmV6NG9JZXJKWlBRclQ0bDg1ZVVwRFNMQzNzajRz?=
 =?utf-8?B?ZllnOG9WQklCbmt5Wk1lSk4yeW1DVjh4dWE2TXN4dG0vSDNQd1BkZERQQXVz?=
 =?utf-8?B?VldtOGdIM1BtR2NEQVY2dy9tUlpnTWYyZUtPOW9VV2hqall0SVZlOVd5V2xO?=
 =?utf-8?B?dTdlOUUvdVdLNGlDWGZ4RE1aTzY4YU5OQnJrUXdLT0VuTGtiNWdIWFA3em01?=
 =?utf-8?B?TUM3bUNOOE5uc042YWhSQXNWazlDTi9wUEJ4RC9rSHhsYkpmOG9ZNmdjalNx?=
 =?utf-8?B?a0Q0MGgzSlVjSExVbGZmeUR4dWl3Q2lTWW9uNDJyR21TR2dUUTBLN2dZNW5O?=
 =?utf-8?B?ZmRDN0pPdnJ1bEVxMnBoY2U2cHBOdk5raVRSbWdTYmRmOWlUdUozY0w2b3VM?=
 =?utf-8?B?RGVxRmJKZnB6M3ZONERWeHFFSnJCMEVuTHhGYlR0TndYVzVaSEY4VUhqVFpZ?=
 =?utf-8?B?eUtLRHQrNzhNdmU4bXdWYnZseW9CY0ZQUHkwYXdLQnI0dXA5QnhTdHRWbmNZ?=
 =?utf-8?B?emVvWVBLRUR2VnNCMDhVdENnNmZmcjArRk8vakk1bUtpanBjN21kMnQ3QWZD?=
 =?utf-8?B?SFdpb2hPbEZYV2VIcHR0NjdjSklvaGM4RSthZGF5TGtkcHR5RXVTNHNPSDlp?=
 =?utf-8?B?MU02NDJyZUR0eTZHZVgranZIUVRNdmxaVVNSOVEvbDFzdml1YTBqTWRuanQ2?=
 =?utf-8?B?YkN6a1FvRFA4QzVodU5scGdqM1orUEgzQUVkd01IZHQ0TktaZVpOcHZ3MUFK?=
 =?utf-8?B?a096UHFKclFiQitoZ1dva1Q3em5RN1N5dE51b1lmN01SaW41dmFrQklmMFo4?=
 =?utf-8?B?YmpZeksxbGtiMkJPOWJ6T1AwU05EcVhRcUw1ZEM5aElTeVRjdXNYOUI3U2Vx?=
 =?utf-8?B?dlVZdEdDWXRzR0lqc0hFQTVxOUtQeFJnZ3VhSnZidVRnY2kyUE9SRm1UTnlK?=
 =?utf-8?B?UitqWjMxcGs5ZUVzVFR1bUJyQTFUL2JwNjVOeVhGb1FkYmU1THJ5UzFUNjg4?=
 =?utf-8?B?aERiL3FuVWE0NVI3QW1LOVVXU093U2l0RHVLMkpkZEJvMFYrZkJuaHYzWWlM?=
 =?utf-8?B?QmxHWW9PRG5Rb3N3eXFxZFBRWHZQd0JnWndaMlZQRDYvN3FzMW5lTVhWNGMr?=
 =?utf-8?B?ZTRvOFdNT0tITzdoZEIyZEdQU0tnTExvK2JRZkU5RnFURERFd1AxQkZJRlZH?=
 =?utf-8?B?UksvalNQT0c0MlY2cGtKREVlRnVHNnNpa21BVEJob2JSTmVuVGNRc1pWNUtB?=
 =?utf-8?B?dm42Y2R6YWZDNGZPbUtRZ1JsMjd5alJ2UVdsN3F4MVNBTm0wa0dSSWdlNzBR?=
 =?utf-8?B?UFpQZVo3MGIxbGZzWFZjZS8yTDMwYUZ2M0dJM1BUb1E1TzJ5dXFkVEdoUHdL?=
 =?utf-8?B?a1grS0dNSUZ3MWcybnBVbTVZL3lwWll4RUFmTjVIaVlZbEhJOFJ6dmRRSzIv?=
 =?utf-8?B?djhXT2ZYcjY3MEFZUDcvaVRCUCs5eUxwczNvMGpBMEgrWHlkM0ZlWTcwZFlW?=
 =?utf-8?B?OU81T3JGN3ExMHFRWTZLYmljMjhjQU1EUlVvV3JqQ3ZjSnJFa0lsUVVOZjB0?=
 =?utf-8?B?dzNQYS9CZnU1Rkl3bDN0dVo0cWsvQlpMYXhTZld5bGIwaUU3MC85QnRRNGFZ?=
 =?utf-8?B?YmI2bUw1ZDNBeHBkZnhjeVgxZzhMRHRiSkw5eElvUnhHZnQrMThSQmw1cS8z?=
 =?utf-8?B?QmVKUzhYRURRNC9BOE5iZzhKeDVQVjlFR1oxeFVJMWV5Tk1ZL2hGajRqYmd1?=
 =?utf-8?B?clFxT2NqeDR2SSs3by9WQlNrTUYxVVE4TU4rWFp4TmZuVnNxUnZkTSttZFVD?=
 =?utf-8?B?ZnVYbjlZdkNYNjRUdnptUGxKbVVJMVBmRFl2S05SeEtjM0MxVHplcmpRK0pi?=
 =?utf-8?B?MUp3VnJTcHFYcTJsWUUxUFVZZ2dqd3lENGR1K000VUlwV3k3TEsrN1MwL3Rl?=
 =?utf-8?B?d0ZEeGRTYWo5R0g3VTIrWXBNZTdNTUl0Y2xrTmJmU0FUTEVtYk8rWWM0ekcz?=
 =?utf-8?B?b2F4RU12TW9XRWRRSDRPWjgwQVAwc3JYQmp2S0l2VjcwZmo5UjJpUU11ZzBn?=
 =?utf-8?B?OGVRZG5na1Q4dk9PNEtWSjE0WlM1VUFMSVJ6WWRXb1dDWE90aVhmSDgzRU1q?=
 =?utf-8?Q?e2YH9nlMtn50uj0wlZpavBxnZ?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(35042699022)(376014)(7416014)(14060799003)(82310400026)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 17:39:23.0761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f048ac43-e4af-4127-7158-08de38130e7c
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7077

Multiplexer subsystem has now added helpers for getting managed optional
mux-state.

Switch to the new devm_mux_state_get_optional helper.

This change is only compile-tested.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/phy/phy-can-transceiver.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/phy-can-transceiver.c b/drivers/phy/phy-can-transceiver.c
index c02d99f0f29fc..68d72d8d49251 100644
--- a/drivers/phy/phy-can-transceiver.c
+++ b/drivers/phy/phy-can-transceiver.c
@@ -93,16 +93,6 @@ static const struct of_device_id can_transceiver_phy_ids[] = {
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
 static int can_transceiver_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
@@ -124,7 +114,7 @@ static int can_transceiver_phy_probe(struct platform_device *pdev)
 	match = of_match_node(can_transceiver_phy_ids, pdev->dev.of_node);
 	drvdata = match->data;
 
-	mux_state = temp_devm_mux_state_get_optional(dev, NULL);
+	mux_state = devm_mux_state_get_optional(dev, NULL);
 	if (IS_ERR(mux_state))
 		return PTR_ERR(mux_state);
 

-- 
2.51.0



