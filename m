Return-Path: <linux-i2c+bounces-14497-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5F6CB3A7B
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 18:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AB393013708
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 17:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A491832825B;
	Wed, 10 Dec 2025 17:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="arB8w7Wf";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="arB8w7Wf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023086.outbound.protection.outlook.com [40.107.162.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B983A326D4C;
	Wed, 10 Dec 2025 17:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.86
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765388369; cv=fail; b=VXNpwXu88L4Hm4i3IDUcTG2TxGO9C+cCnHhFnnCtWmL9DlgI1HERgIUwIf3nCUCMzswhwLsr3X8Es99ieW7LDHRU9pS/+Xkg8Di+NiigPmBqO2HcRleJUqZG7Ooepf5t/uMYXrRvoKzDgyHH0I0rQvN1pqvj0phxTJ2xcKs2jl0=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765388369; c=relaxed/simple;
	bh=4BfyHGospalumskhjU0X/TXxol/uiOk/h/J/T/dDjbk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YtpG9dYwcyG2KcyN+GI9AvcS7YrR23lKZLX66vWhKFw9n668POnjJRSmO6Biy9CDaLs4l/cH5DZ6y/JtnG8PedT/1NJP3bXN15yOw1nMJaAP75zAsqiV4cs0VdoCRSKOBB0ypIEftRWbnHgd2cbenLLw66rQrpbYIqhZbH+c8Vo=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=arB8w7Wf; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=arB8w7Wf; arc=fail smtp.client-ip=40.107.162.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IbKXFe0pFeKnmQZKNQUlev5afXokWQfkipR0fQ5su7SCUDvwDcw0tOfPwFYLqT1PhULRtNdwF2vARnUoduqJvrRjIQ19MZzrNb1LntaIGwDDc9ayZAsMzJV4eDl0yonqJlN3GL/8dyaQnc1vR9vCVOvc1RUmrqnJsNJbhsjA+sJiJlyQZ7lxdR5Mu6K3POe/mKZ69tLhbxwqcOSlytdlQIEAIM7Mkb4xUMaSX70wPSenWFbt4F0cVjbGwLuec0rDGuSBHXtlgXREVQ+QdiJ/J9rjlnfcNhIjXKR/Gi0BvH6uqa9brQQqdjPpby5Fo39uexJluK0zfF6R1Z3H7HYK6g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01yNl3TguAXGYuranrBc5cM5ZVUgXNTaA8ve7/AwU1o=;
 b=yVivas394sHE/sI+BMY9UaJp/GOQt2V6IRDfbSShfq9c7oAqvOetMiSEPaYtFgsG5JVQoWV2Bie//wBg2ej60fTxJYy1NxLYnqCKCbjWONzE1zycMJnVmUerM6e5jBdNS271OEt0OaAkp+9+QRbW32g36/smhJJK/EgWKydKpsg5vo/lTQqc6ckqa8BB6fd99m18LkDY5BdBaYEdkUiEqZ1YVolj8EGiFQXgiVzAgtG5L+f8NTbL9+HTjdkda6PqsgOvtt/xXZz1iAdB8nDHCvNlPjIzpL85wQrrM43RpcVSR6DcLqjmC0qvaHEL24S/ko4kSeR2u17J9wjqeoz9QQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01yNl3TguAXGYuranrBc5cM5ZVUgXNTaA8ve7/AwU1o=;
 b=arB8w7WfhKw3Iehq5ecHpsUnvMwK68V0vFlRvrQFFaov3gVnPawkYFmwgaVO1NWjeh853PnRLKw+c2/g0A8aPMHCV3Jmzsiyv6LAqxRgfePoR21FdNvShw2TnlPr9Wc+wb7T+CwhsVB8ndvDvjHKPTCBFoHH8XeGmFyBs8oZDLE=
Received: from DUZPR01CA0321.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::15) by AM7PR04MB7175.eurprd04.prod.outlook.com
 (2603:10a6:20b:111::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 17:39:21 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::94) by DUZPR01CA0321.outlook.office365.com
 (2603:10a6:10:4ba::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Wed,
 10 Dec 2025 17:39:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4 via
 Frontend Transport; Wed, 10 Dec 2025 17:39:21 +0000
Received: from emails-9189989-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-248.eu-west-1.compute.internal [10.20.5.248])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 247BF7FFA3;
	Wed, 10 Dec 2025 17:39:21 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1765388361; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=01yNl3TguAXGYuranrBc5cM5ZVUgXNTaA8ve7/AwU1o=;
 b=Ka85RvAnpxK8eha1nAvASHkmwipXKpCStgcFxJnAraRGva5WYDcO+GbHfzZ9/jJ382aCx
 XKkfpcmLOSHeHUeBsGOIvV6gU1Y/UmxZ7OSsW218Jhk/vxIYkuq3R8hz+gVLC/GMRutVjXm
 mhwVrgZW+U9PiY59L9OSb9b5XHncJJc=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1765388361;
 b=pzXr0ZwitFeStx7CWlhAQcudcHi/bMGNVp50LYhNzBV9YfFgoCX1NdhYf+SNyh5UlZlfl
 rC96yDCAPoWQHyD7n7QeVeaXK26kHEmL/vXmpZUAUf68Q1DM87UAAAgZSGrS2TC0gBTer3i
 qtL81IDdH2eW0+rzasy2Sq4g+j2OCVg=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGXpFkJO1qPr2dkdUb9yifwMqhhhitZrZjb1sVa2LWrv/iT00V5+HjXx7D6f7cI+IdClRxfFBShoL2kIu1Fcy+nPcZjnE/dtOUmbtPedHWHl0K9tV497IbVnIdmoqOWw3HXigRzAR5IfIkr1lzZV7yjmfROF6rmyaXLNBesHtlsJc2TolJdZI7At17yiJA144pze6boaCXI+qBVcq03GhL4Zq/uqrjTJIwadXBNjKMD83bo5CWbGRNs0OTW+hlqXkzvA//zJ07967a/8e76j1y/PlBWsWR9agU8qZE+mzLlqnzSO8SUwyO4VkcLPfQhpQrP8AYf2N5pW0nBylS6ZqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01yNl3TguAXGYuranrBc5cM5ZVUgXNTaA8ve7/AwU1o=;
 b=M2mD5bgDD1fuChrVeDcWRXZ+KK4GhsLJWfkBp3nJ1De4tprfh+cswukw6AlvR8myEC6hyZ8LAZc5Vm0dzc8EcXdUvqSj+GknCNgIepvrS8hD6YzsSEyuBuHLw4qL9I0WjyJoT/LkNWwMYMbR45YkcMwHDYAWOe+2L/ycE6eka43d8CNgwkbQCLvDGs7a1/0gEKQ4oFRgDiS+Y6jThXOohkGrvFIMTKBoImovSsH009cZXaJ1P6m9FI/CFZyeylZBAOMAF0fN9086m4w2RdMHoxnvdYAKNfL9uGvL69lSDwifVifUjUXi+Q/DBtdliO8nfDtO9jxZ/1hVS7F7Leq4EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01yNl3TguAXGYuranrBc5cM5ZVUgXNTaA8ve7/AwU1o=;
 b=arB8w7WfhKw3Iehq5ecHpsUnvMwK68V0vFlRvrQFFaov3gVnPawkYFmwgaVO1NWjeh853PnRLKw+c2/g0A8aPMHCV3Jmzsiyv6LAqxRgfePoR21FdNvShw2TnlPr9Wc+wb7T+CwhsVB8ndvDvjHKPTCBFoHH8XeGmFyBs8oZDLE=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAWPR04MB9717.eurprd04.prod.outlook.com (2603:10a6:102:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 17:39:08 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 17:39:08 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 10 Dec 2025 18:38:36 +0100
Subject: [PATCH v3 2/6] mux: Add helper functions for getting optional and
 selected mux-state
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-rz-sdio-mux-v3-2-ca628db56d60@solid-run.com>
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
	PAXPR04MB8749:EE_|PAWPR04MB9717:EE_|DU2PEPF0001E9C0:EE_|AM7PR04MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: d676ec2f-e7c4-48ac-3c65-08de38130d65
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NVdxTFAyM2U1VXV5d3dGelg3WWR3cmwwcUtVRTNWbXV0Qk80Y0llZHNaU0tu?=
 =?utf-8?B?em1HanRhaERFbVNSR2pEbFFnSC90L1lUZTZ3dEhVWTFRRVlYMS9pdWpVR1Yz?=
 =?utf-8?B?RFlqU3ZHbG1oREhiM0dWdldHWS8wVHRQRk1mcnBwY2EwKzNJakJRTytEWmY0?=
 =?utf-8?B?eXVVYkdkVEZlSnJkRFo5NkMxSmFadGlYRlFWa0k1TXN6eFhGR2kxS0xMcEZK?=
 =?utf-8?B?NGhZSnoyeno3eC81MEZJV0J4cU1mNFM1YUU3YVI1VU9kTmhobkp5V1BXbGVi?=
 =?utf-8?B?WWVaWFZ2LzZQbCtPVllNeEdLSFY4WVJOQkFHdjhWTWNROHZhcFlJZmkyU3F3?=
 =?utf-8?B?cVJPUS8xaVlyOVlQOXFZTDh3cEo0RTlsK2Riay8rME1CbUtUNHRYQXRONnhF?=
 =?utf-8?B?RGNST0ZSUDUyYUZzMndMaXYwdWFwejVoWUN6TFJETkd3ME8vTHo1blQ2ekI3?=
 =?utf-8?B?WE9rM2JWK0huSnhlaEtrKys4cEFnaksyYUJYSUxsNnF5WHdqUk9yOXN0czZx?=
 =?utf-8?B?cHJLM0lERCt3YlR2dGg1N0VQWks2Nnl1Y2Jmc3BTRGpGR1dRMDB0SHFFOUZm?=
 =?utf-8?B?SnB5V2dsdXdTWWRQRlJ5VVc0ZDNOZTJib005dCtTNFVpTW9TMk54c2lZNGsw?=
 =?utf-8?B?Z1BkZDNReTFsV0xseDM5ckJpa0hRdThWMWV4R2NjbHVtQ1NjOTJVd1U2QTlZ?=
 =?utf-8?B?TDhQNlBVY3ZVRjliNDVRRGZMUjBzT25pQ3RKL0JQZDllS1RpLzZJdW15VEky?=
 =?utf-8?B?WVZkc1JmMDZWa1FsbnZGbWlGVFg2MHJ5Q3JUUk1PSTNhWkxYUmpIZGxJTHNH?=
 =?utf-8?B?MmhTRWlJUjEyV3NOOVA3UDFubW5yR1QxWnI3TUl4ZmZRTXYyTTgyYVZpMXZS?=
 =?utf-8?B?QnFwbDJZUHlza2VzQ3N0L3V0SGdwT1BKVDNCMmZXUFJ0TjVaRE1LMG1TWm55?=
 =?utf-8?B?SUlNazN0Vk9ENUdVbzlSam9NcnQvNTRIL0pqQTlKMkZCRWl2RnhJalp5TGxh?=
 =?utf-8?B?U09NUG9vRVVLbUZiTU94Nk9wM1BZa2ZkM1ZkVGQzeEpjU3laNmRoMFNXN1Zl?=
 =?utf-8?B?d01kQWx1cGhpSjJERUNrcnFhaCtBWGF0M3ErQmdrZXlxUDJlV0QwQTFEZ0VL?=
 =?utf-8?B?d0ZOblpXSW96UmdYbVE4NysvQmsyeUNmS29NVFkwYlNveEZFalZrQ1RSWGR4?=
 =?utf-8?B?WHdZdHJqcnFGYWxGbU9CcHlnd2xVbUlmZit4L2VQR0w3UjJZNzk4Tjg4TUky?=
 =?utf-8?B?d2gxMmJKRTdQY2dKa0RWVVZ0d3Q1dlJ3V3F0TzQxV0pHelcwNFdKdkI0Z3ph?=
 =?utf-8?B?K2p3T3l1V21sNjJjOWEvUkZ0Q0pzK3gxTzFIemF5OTBjUmJ1MVE1cUFSMHNs?=
 =?utf-8?B?Uk1RdW9NV3NsbkdsM2VvbVZaNENIamhJLy9IZjVaMFFEc3RhQ0dHdFFtUTc2?=
 =?utf-8?B?NFR1S2xrSTRyZG8wQlliamgrbzNwWUQxV3JqRFp4enFRNHgrbjVDZTNZRW9Z?=
 =?utf-8?B?MUNRODBhOUZtbGMyM3dEVGRZTkh5ZVhpWkFhdzJrWW80QmlzeStHak4xL05m?=
 =?utf-8?B?bm85azRvZ0UxK2lsV0g4VEdBaC9IQUxIZzFyV3JXZDRXZmpGUWhEeldENWVD?=
 =?utf-8?B?YytSK3BsU2p6WWM0Z014WHpoczdoV0lKRnYrYnVXbkJtRk9PS0lyRW4xaDAz?=
 =?utf-8?B?dDJDbnJvcW5yd2xjckV4V1JLRGJlbVQxUCtMNmxkRkRwZTdjRnRTT1FpSWRX?=
 =?utf-8?B?b2ZCeFdpeGlSUnFjLzhKNEo0T20xclhFM0IxZEd2SkxSdmJTSSt4S0UraHpS?=
 =?utf-8?B?WTJUT3ZpWnhYV3NLb1k3cExldWp5aTA2ZEthcXpDU00vT3VManhPZVRnT1Yz?=
 =?utf-8?B?MVI5SGI5a1dzN0tpdnp2Q2hRcy8xSUkreU1MWmgwNGNsZy9kVDk1UVBpaFNl?=
 =?utf-8?B?ZklpV2k4aW1vcVQ4RnV6T25LRkF3MmxDQjFsK0ViM1dLSnVvQ2haVjJKQmN6?=
 =?utf-8?B?ZzVDV1F2Vkp0b0dHQ3VpNU5nYis1WDVsOFlLS2hwSGVyMkN5MTM5alZzNDhE?=
 =?utf-8?B?NHMxbk1vSCt0RlRGLzg3S0VFUTg1V3pqM2dmQT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9717
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 1b438018ed414fbb90c9b8bd284e4716:solidrun,office365_emails,sent,inline:e3405425bbbc305e82807fbe90c335b7
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b40e858a-942c-4a61-17be-08de381305d9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|1800799024|36860700013|14060799003|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dk1HT1c1L2ZqeUIxbWdCNldGeExvanFmUnVPa0pmdU9BN094R2tKeWhoYXNU?=
 =?utf-8?B?UFZzVGxlNzFqdklUcEJ0blJSRXFjelpmS0Y3VkJsUG1NWC9jbHdYNFE3UFFK?=
 =?utf-8?B?ZHdCbU5zL1JtZU8rb0lkcWkrU2JIc2dqVCticVZKUUxhVFdpWU9oa0N2WWFq?=
 =?utf-8?B?SHg1TlVTYkNoNS8wS3I1UCtqQTNWcGU0MEllemc1NE9iaTNNTFdZWHluY2R5?=
 =?utf-8?B?SEJkQ3p6aGNjK3RGbjc1bUhHNFhzb2hZclJtNnNjT3NCVHMvQUJDbTU2L24x?=
 =?utf-8?B?bEo4WGhDc2RKSWlPaUloMzN5N2FncjBGYjZ4dE9wODExWEZqZC9sajJnbDhu?=
 =?utf-8?B?eGY0WUhLaUxJelBUSytsUFZKWmNZVDZLalE4NnB0STlWVlpsK3pOSDVFVXc0?=
 =?utf-8?B?SUcvUFFlQmN3OVdlb3VKSmxYUHZ2WXh1MGdUeFFnRXNWNnV0T2Eyd21rNjJQ?=
 =?utf-8?B?STR2TVZtOC9VSUF0NWxZNGhDaUVBdytaVGh1ZHB5UmMxK2xZZkRPU1E0c0pN?=
 =?utf-8?B?ZFNNOFhkQ2d5WXBrTWdnejRrK1hVUjcyVHQvOUo4T3JValJMQS9mSzdHaW9q?=
 =?utf-8?B?d2dIU3FBRU4xOXhIa3FURTRLQUo3aTNza1MvZldLcDU1dGdhNG9DUEswWDdM?=
 =?utf-8?B?Qjd5MUliQ241SjBzRkZxWkpnREFWTXdTdFk1TG5RbUxuWXAzem0yNmh0WFNK?=
 =?utf-8?B?QnRWOHBDQnVSdEpaYytTa1VNYnZySlRjYTRZVExGK1cveGJXNGJDM1cxZFdB?=
 =?utf-8?B?Q242MFdTanNWSFVlSDZ6VzZ5MWo5aVozWnJJcWNWSksyOE5xZllmbXpudjIr?=
 =?utf-8?B?b0EybWUzMEQwYmVGdkpiaTNkTVNCWUJrZTNyalJNU0NzUGROL3Y4NGxnbkJr?=
 =?utf-8?B?eGhPL0wyTVlwbjJkY0NlMWovRWNaNUpMdFdOVTFWQjZwVXF5Q2toNm0vc0VX?=
 =?utf-8?B?dm00WTNyZGx0N2xwVUkyOWQvVTdZTUlJVTN2a1R6Wi9QU0U4VVV3K1ZpdDdp?=
 =?utf-8?B?RTRmK0VKQVNTZXNxWTRpak1ueWo4MkZXS21scjdLZGU3SzBaMGVCWVNFUHNx?=
 =?utf-8?B?YXVvL3RsTllQSUpibEEyVXFUdTNSQUVSMEN0S1Vqd1M1SUxiZGNBRzBUdzB6?=
 =?utf-8?B?cHJZcHR6ZVJFdFQrckFJUmhsVWZEZ3habkdkQWJ3SktoZk1vK3lyaUNTelN5?=
 =?utf-8?B?YjFKeUVHWEhXSFovSERMNUgyVlBITEd1ZzRMcXUzNVRsTjl5V0x2Y2U4anZV?=
 =?utf-8?B?T2ZlOFZQL0tBZVVtWjNhTEdGTWJCNnBrUHlzU3dodEEzVDZhcnQwTzRUL3Y2?=
 =?utf-8?B?RTIyS3gyekJTbk1hRXVhdlJTZGhZUStGN0NRZitodW9vdSsvMm1tbHlBeHlo?=
 =?utf-8?B?Z0VkSUlLQmQ4dC9LWVFhTzJpSFU1UzFJclB2WXNZN0EzTUV4NG1SKzBkNkpw?=
 =?utf-8?B?c3VJZHo2RGZhRStuQlh5cmg0Zk5NdHlaOGZNaTV3aHV4azZRUVd2VEVPZDFG?=
 =?utf-8?B?REFGTXhCdDdYQjdaWHRMdTJKeUpGdG0xMC9oYnpGcndtMjRLQ1FlRWRGcFJR?=
 =?utf-8?B?eHdBSW81eHJoV3d5SWZaMFFmNGI2T1laZ2hyblY4a1ZyR09MU1M1QndMdlIr?=
 =?utf-8?B?OEwreE1BbGFJWGRVenMzSjUxaWNXRUdSZHVaMzl1bEZ6MUxtYXc0bmJuSXBF?=
 =?utf-8?B?YXpQRVNtV1JpMjBwRkRQQmliQ2pxRlpaY2pOYkV1MTFYeHYvTG83d0VTMm1k?=
 =?utf-8?B?bGNFbzN3T1dwa1ZFcEFaMllxa0Q3dXJCb3hHcXI2VWpRaXZ6amo0QTJ3ek5h?=
 =?utf-8?B?ZmVJSG5ySDNHdE1oQ2kzZ0VrazB6bEtFSFUwNDJpUmt6alh1ZDZiYVdWYUJF?=
 =?utf-8?B?emx0ZWJPeGJHVW5udnZoK2lEMVR5NEtzK25SdWRBczB1QnhYa1VHaGkyUzRL?=
 =?utf-8?B?S3pMVzh1S1VUa1lseUh5aWgxWmN5RnJKTUVCV0cyYjJ5bkVzUHNndUg4MWZw?=
 =?utf-8?B?YkNta0dFZjM3NWhmV0Vza1VJRncrNkFkanUxZTFVemlnQmZhSURCbnFJdmFL?=
 =?utf-8?B?UXJBQk1PejVpdEdIeExSOWJVL2xhV2w3T1J4dTU1ZDByb3ZobzRhVVdXSmRj?=
 =?utf-8?Q?RRU+EPJZn2pVz9ZsNLZESiYga?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(1800799024)(36860700013)(14060799003)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 17:39:21.2971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d676ec2f-e7c4-48ac-3c65-08de38130d65
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7175

In-tree phy-can-transceiver driver has already implemented a local
version of devm_mux_state_get_optional.

The omap-i2c driver gets and selects an optional mux in its probe
function without using any helper.

Add new helper functions covering both aforementioned use-cases:

- devm_mux_state_get_optional:
  Get a mux-state if specified in dt, return NULL otherwise.
- devm_mux_state_get_optional_selected:
  Get and select a mux-state if specified in dt, return error or NULL.

Existing mux_get helper function is changed to return -ENOENT in case dt
did not specify a mux-state or -control matching given name (if valid).
This matches of_parse_phandle_with_args semantics which also returns
-ENOENT if the property does nto exists, or its value is zero.

The new helper functions check for ENOENT to return NULL for optional
muxes.

Commit e153fdea9db04 ("phy: can-transceiver: Re-instate "mux-states"
property presence check") noted that "mux_get() always prints an error
message in case of an error, including when the property is not present,
confusing the user."

The first error message covers the case that a mux name is not matched
in dt. This is removed as the returned error code (-ENOENT) is clear.

The second error message is based on of_parse_phandle_with_args return
value. In case mux description is missing from DT, it returns -ENOENT.
Print error message only for other error codes.

This ensures that the new helper functions will not confuse the user
either.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/mux/core.c           | 67 +++++++++++++++++++++++++++++++++++++++-----
 include/linux/mux/consumer.h |  4 +++
 2 files changed, 64 insertions(+), 7 deletions(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index a3840fe0995fe..130ca47a8be37 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -542,11 +542,8 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 		else
 			index = of_property_match_string(np, "mux-control-names",
 							 mux_name);
-		if (index < 0) {
-			dev_err(dev, "mux controller '%s' not found\n",
-				mux_name);
-			return ERR_PTR(index);
-		}
+		if (index < 0)
+			return ERR_PTR(-ENOENT);
 	}
 
 	if (state)
@@ -558,8 +555,10 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 						 "mux-controls", "#mux-control-cells",
 						 index, &args);
 	if (ret) {
-		dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
-			np, state ? "state" : "control", mux_name ?: "", index);
+		if (ret != -ENOENT)
+			dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
+				np, state ? "state" : "control",
+				mux_name ?: "", index);
 		return ERR_PTR(ret);
 	}
 
@@ -745,6 +744,60 @@ struct mux_state *devm_mux_state_get(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_mux_state_get);
 
+/**
+ * devm_mux_state_get_optional() - Get the optional mux-state for a device,
+ *				   with resource management.
+ * @dev: The device that needs a mux-state.
+ * @mux_name: The name identifying the mux-state.
+ *
+ * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
+ */
+struct mux_state *devm_mux_state_get_optional(struct device *dev,
+					      const char *mux_name)
+{
+	struct mux_state *mux_state = devm_mux_state_get(dev, mux_name);
+
+	if (IS_ERR(mux_state) && PTR_ERR(mux_state) == -ENOENT)
+		return NULL;
+
+	return mux_state;
+}
+EXPORT_SYMBOL_GPL(devm_mux_state_get_optional);
+
+/**
+ * devm_mux_state_get_optional_selected() - Get the optional mux-state for
+ *					    a device, with resource management.
+ * @dev: The device that needs a mux-state.
+ * @mux_name: The name identifying the mux-state.
+ *
+ * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
+ *
+ * The returned mux-state (if valid) is already selected.
+ */
+struct mux_state *devm_mux_state_get_optional_selected(struct device *dev,
+						       const char *mux_name)
+{
+	struct mux_state *mux_state;
+	int ret;
+
+	mux_state = devm_mux_state_get_optional(dev, mux_name);
+	if (IS_ERR_OR_NULL(mux_state))
+		return mux_state;
+
+	ret = mux_state_select(mux_state);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to select mux-state %s: %d\n",
+				mux_name ?: "", ret);
+
+		mux_state_put(mux_state);
+		return ERR_PTR(ret);
+	}
+
+	return mux_state;
+}
+EXPORT_SYMBOL_GPL(devm_mux_state_get_optional_selected);
+
 /*
  * Using subsys_initcall instead of module_init here to try to ensure - for
  * the non-modular case - that the subsystem is initialized when mux consumers
diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
index 2e25c838f8312..a5da2e33a45c0 100644
--- a/include/linux/mux/consumer.h
+++ b/include/linux/mux/consumer.h
@@ -60,5 +60,9 @@ struct mux_control *devm_mux_control_get(struct device *dev,
 					 const char *mux_name);
 struct mux_state *devm_mux_state_get(struct device *dev,
 				     const char *mux_name);
+struct mux_state *devm_mux_state_get_optional(struct device *dev,
+					      const char *mux_name);
+struct mux_state *devm_mux_state_get_optional_selected(struct device *dev,
+						       const char *mux_name);
 
 #endif /* _LINUX_MUX_CONSUMER_H */

-- 
2.51.0



