Return-Path: <linux-i2c+bounces-14841-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53022CE70BA
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 15:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB7B8302EA08
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 14:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4118F322523;
	Mon, 29 Dec 2025 14:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="nZHzj0uE";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="nZHzj0uE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023099.outbound.protection.outlook.com [52.101.83.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6FF31DD98;
	Mon, 29 Dec 2025 14:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.99
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767018483; cv=fail; b=Y9rxmO+jO1Qyaq4PIOpWT6ynmVdWXDOqC1WNHXWtCcVIr/RZVIbhlxvPxjdLO1KjGDWOKkANgipH2UXyjnCtnKUZdtlqqlOSpWhiWO0VsNhf2p2a7OCfMGOAdnyofc/p4dP/XuL0GHsNrpTXrvn/nMu5TW+cJth0QbYy/brO6Is=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767018483; c=relaxed/simple;
	bh=RgVbq1DYmLIAbde46pX2WBAheTCGz/FRVNVaBMu+aoM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Hfh3annjkeqfrLD97vBZP5txBg4h3D13tsz/LJ9DYQgW6fC1UqxtCSJOpmI+H6zM3OwOAPfrrPGRhyt6jiXqN6DOduv5kmVrh3ABJFOj5aK6TmX33n+CTP/MZJuG9XJZLJEiGrqE+pYm2X1mXuSlMdJZ9hguGhEY0F32fwZyDhQ=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=nZHzj0uE; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=nZHzj0uE; arc=fail smtp.client-ip=52.101.83.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Aqv2omA0XPXFtKS8voLzwHbDqMusyRUCIK6Ib7hH33eKOE17pTNbkN8gV78VCcLXCPC4DPTZ+Z4r4Myh52w1yGvZf8TpwJBhgshmv2ngd/Px4Smw67xMO6nbrEcVjiJtExwv/PhxjJBFhKaULA/tlaNuYy2zMhb7KiONCCnuyA9Bvaiuji4Ne4i4TMOcYTpRBsJ3W5pqqoJc4+VRoKUEX0umTsrBMYxifGwzo/CKhpXABclcEykdkczTc2REOH/peScvByK+fJU64/139REj63ncJYILY0InblrS5qXH/YROddUXPUOfTL7yxET1UICcrv5l/diw0901BK958Xy7Ow==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8ZmMUwAiyd9UAXbf9lYi24q6Uvh5wQmuJoObquDX90=;
 b=hRW/QwXsPBv275XAZosYAON2/EK0EGPnRGHbssRh5JKbqnhJ+r9Fw1tci/JiwbDV9+vzLNod0Dy3vHWqS561GAgJRuSsS54yaNH215wGS87XRPkfdqaUAlrQTOXQeIkZ7Xwo8p6pAGWcZpz/fnwV26AG0KIeQEtei6UMCmT0bkWZi6PlEvpIjXMglSaN6LEkRTSQFV9vup9NTwKN+ZxkE8M+yFdeqT72hMxxGBSP/ejUKF+K1KIzM4CxTCpSDYlrlCUBpZt+yrTQ8rEHD1L69xkWCGBFpC1tBXmxzclLNIbGZsxzUDE2P8Obj3I6gCPmMxOUaVwdFHyWHGBRcilK+Q==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8ZmMUwAiyd9UAXbf9lYi24q6Uvh5wQmuJoObquDX90=;
 b=nZHzj0uEy2ZjuUWx9AzDp3BIG+k9E0aZ2zq1h9Yyz8rP8i+CgpF9KDMcSFe+vH/N2LW37xJ1oLO25+a6+aRNF1eprKV9MvnUboAQVFL37cjIDw4BiVJIYQFeFOABAULhaRU25TjTdcKeCGX9WJUvEfG5HiZ0XQseg3l5pQxzCnM=
Received: from AS4P251CA0008.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::16)
 by PAXPR04MB8814.eurprd04.prod.outlook.com (2603:10a6:102:20d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Mon, 29 Dec
 2025 14:27:56 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::b6) by AS4P251CA0008.outlook.office365.com
 (2603:10a6:20b:5d2::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 14:27:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Mon, 29 Dec 2025 14:27:56 +0000
Received: from emails-4985434-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-251.eu-west-1.compute.internal [10.20.6.251])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id F393280440;
	Mon, 29 Dec 2025 14:27:55 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767018475; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=n8ZmMUwAiyd9UAXbf9lYi24q6Uvh5wQmuJoObquDX90=;
 b=CJ49jJ3G8/nKSSz/BQdxBSIdHBYocyRSg/IPib+s5Osn+iG/rspFPj80u93ghLXmu2mWh
 zJwI8Pl7FACLODAlY/zWo69RQSCtZFCnf42byTv77hGmPvzNXuqJsnzcGv+c/jEXMKuoFjM
 yl17XrufQLJIBUqndb/y0iJoQi/fbW4=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767018475;
 b=I8JXZS9Vy9xbgp0BW3s7xpxvwQJ+3/wPF3kV1zqazRbzOs2kxdSBIeDGyCDlm2D4U6iQ8
 MU+XM3jYK0dgN1UZVKnU+/6Q2WD1lgp2S9aRuB0H/HcS17fVgQaK/YWoxbKlpf2mTZsfpx8
 1ypyQhnS7ANoXajiehqIOQ848UOCDpE=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sahGIoP2VoGDCttTpYXYzHEyGggM1moO41+04Oxy5OyAUamjggjUZCeUV4/kZPAUpKXDfnTsHuoEuWki+Fs3Sv2+J1CkNXeARtEmtqXGQ8mMULbis5LsIz2zNTvMuWZ+JP7X8fgqNOfLWDdrf0H7DRXwW1aZqR0/JznWoL+10AMn3stNFF/vYBs/uvL+22cOBVOxkXscucN3xELcKimppiqVVFwJkcy7hpTM7hSAdWa6JtXch4cz1DN+iMNcgTOIqwPMJB8R0z/EifmWvs0xjRbcEIaiPe66Wp8Saza+khnoQEgFAdlNARMFdEYbOn6vtlDgMeKMuTNCK6hDWuo9zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8ZmMUwAiyd9UAXbf9lYi24q6Uvh5wQmuJoObquDX90=;
 b=GYbKzGXW6sIPLe4rTVma4MQ5n6Imf+W/fHajMgiByz9u2+UIM96mCPbjNdGiqJ9PfsdQOh0whc2kaHVbMtX/szuhIfjpP+QdvP9f2d7IGRZXx9S6jrFqpnxsxxCQ5rmOsyJl2164P7ZpCqzO2HxVkF2Zg2g5UR8Xl6js5FhQjAT0H/kwSS87i3iU72xa5PwoVIIOGUV1BoXt84Tvip1vUkGRcSrUsKESv82sH8muTolIJCDqgqTbLy433MVW3XlWOPRpXYHMbRCu1BxwAGOzptJE2Bsxe7tqNsRmDaPAcUq9fYvpNnHuUWgbtSFjiu7CY71guX8DqG6xlQy+wf8llw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8ZmMUwAiyd9UAXbf9lYi24q6Uvh5wQmuJoObquDX90=;
 b=nZHzj0uEy2ZjuUWx9AzDp3BIG+k9E0aZ2zq1h9Yyz8rP8i+CgpF9KDMcSFe+vH/N2LW37xJ1oLO25+a6+aRNF1eprKV9MvnUboAQVFL37cjIDw4BiVJIYQFeFOABAULhaRU25TjTdcKeCGX9WJUvEfG5HiZ0XQseg3l5pQxzCnM=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:27:42 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 14:27:42 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 29 Dec 2025 15:27:28 +0100
Subject: [PATCH v4 4/7] phy: can-transceiver: drop temporary helper getting
 optional mux-state
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-rz-sdio-mux-v4-4-a023e55758fe@solid-run.com>
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
	PAXPR04MB8749:EE_|DU0PR04MB9417:EE_|AMS0EPF00000194:EE_|PAXPR04MB8814:EE_
X-MS-Office365-Filtering-Correlation-Id: 325f7cf8-0df2-44d6-7067-08de46e675a6
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|366016|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZlA1RVpocjR2ZG5Nd2NMOHdWQ09NdmJ4ZU5GR3dRSk5qemRpL1JVd1QzWDZ4?=
 =?utf-8?B?NlkvVDkvNjEwb1lXWEFvckNRMXJNSE04S3ZpdkdJemIxOHBXdnlqeDBBWXZK?=
 =?utf-8?B?azRDVHpQOStoZ0FpUENkTzhaeVdHU013QWJ0QUlnbXJORklTOFdTb202TEN2?=
 =?utf-8?B?MlNocSs2WllCQ2g3am9EZTlRdHEzWkF1dytteTZ5dkZ1YWlHaUNGVDBSMGRH?=
 =?utf-8?B?WDNDdU1mdEhKZzJ1dU1mTmt4V1Z0cW9mSlF3ZXZFc0tDa1kwdkJFMmpaZktV?=
 =?utf-8?B?S2ozUUVqYi9ubmZ1cWRsVG1QUUlhVmFBTFZWYW1pWkcyVENyU3FmV2UrOXZP?=
 =?utf-8?B?T2xJMDg1Zll5VytXQlVWKzVDTHEzMzhRUHUyN1Z1dDRMN0Y0S2tpVXJ2a25U?=
 =?utf-8?B?K1FYbE10MGFZTlRleUVBWDNxYldkd2V6UVY1ZGphR2szVjVOekhleU1ERVdt?=
 =?utf-8?B?Mzl6MllxYW4yMGpQeXRPc2ZXTkFYQk1QaC9uNXVwTkZBUlk1MkRSMjVHWi9o?=
 =?utf-8?B?MnFYZmNPZS8vOHhjWitUZlFoN05lY1hJNFpsQ0hEdkpXa0grWUhleGEyM0RC?=
 =?utf-8?B?NWEvR2VmVXVUK0VqNmJMRmoxNHNKNzdLS3dqTjJnQ0lwcEhxYXUvSGdzYVBs?=
 =?utf-8?B?aEZEVnNJSCtzNWQ2WTJKZno3cjFndVF1ZGc3cUpTSkVxTFhsZDVlTnN5aEVx?=
 =?utf-8?B?SXdzcnpCZmdyamF1cW5ubGYxRmRBSnk1UlZZc2xsejBkZTdqa0dkS1I1dlo0?=
 =?utf-8?B?c1ZaalBqWTNzMlIrYTZJY0RLNnlMMXRjNUtuWFpCRXRIZUoxVktGY08yZzlW?=
 =?utf-8?B?ZjE5MlRSV2djVFY5dmlNazFWay85cW5GTnpuTDQwSnpjRG9LeHVvY2RJRTEz?=
 =?utf-8?B?aU03N3VhR1Z0N29VdWpsa3FsRHkvRlBOczUxb3psUmg0VUJDbGk4NmhxWjhE?=
 =?utf-8?B?TlUxdmRCTHViUndOUmtqUDRFRVc4MlNhWmlpNlloRTVieW9uN3F6eVFqc0Fp?=
 =?utf-8?B?eE9TS2liQkUzUzdWbkhJWVNhUzFqeDNwOGR3WlVEa2tzTUR5ZlFSTU4zQmY2?=
 =?utf-8?B?L2huR0h4WkRLSGhtaS9MYUlQZkw4Y3U0UGpVOGo5NGk5ZVlVTW5CLzlTMVFw?=
 =?utf-8?B?RGhsZHNVeUpNQmc3QTBhUUpaMmwyRU1IZFg1Rk5pSXVCVE5yQ2tLaGxHNFNx?=
 =?utf-8?B?S2tIV21tSVhSMFRFLzVpdFFoSk1tNmJuOFplVEpDaUh3dHpQbWh5VXNOcWtj?=
 =?utf-8?B?Q2lvZ1VkdzJralJuRXFwVktUQklSSGx5YmZ2Nm5ZMU1kMWN6MHRuRW03OGFX?=
 =?utf-8?B?UngyZDFxa2docFhOZU5nTU5RWlN2TnM3TEpaZG5meGZ1NnFpajdZZlgxZW5H?=
 =?utf-8?B?QndCZXUrNjkrRjB4RUZOYy9EdUh1WVFScGxxZEJwS3F1R3hiOFdNS2xoSjdm?=
 =?utf-8?B?TnZNdUo2UDZqSWdDNmozVEgvMmdjeDdFMGJJeDZPZWV2d2VZREF3eVNQaUta?=
 =?utf-8?B?QW55Zk5NZmhPcEVlbmJxczF0QWZ5czU5ZklCaS9Pd3I0dHplM3JhaDFJRStn?=
 =?utf-8?B?VWVKc2JQTUFKVEI0UGtVd1lXWXd5ZUhSTmtiVURBK2RSQXprczBSVzNZWGgw?=
 =?utf-8?B?MVdsaHNtVVc2VW5EMGQ3OGN0UzhueExTajJyZGxQM21rWGo1d0ViTkxNYlBm?=
 =?utf-8?B?WkRjT1lLUHdmanVJLzBQcU1tUXBFcStZUnBLSEViblg2bFpYRE1QVnIxelRL?=
 =?utf-8?B?SVJEOGJEcWhMcXl0Q1BVZEsvOEpNeEx5MXNFd2FDakJ4aGNKU2FQVUZZbkxK?=
 =?utf-8?B?NjdXWVAvcGlTVDVLdkplQzlVK1VYTnkvcGVkM1dVTUZ1enZRWER5Ym0xdWo3?=
 =?utf-8?B?NW5UY1hhVkFKNmcvM1p1VVc5TXhLdG53bTNZQURmbnJaL3Z0UjA1R0VHcitk?=
 =?utf-8?B?Tkx6ZUxVQThrUW1FbzFzUFZITFlJN2tpNUhBblppSHZxM3puT1BLOWgrV2hP?=
 =?utf-8?B?YU5Kc1h0Yy9na1hUVHk3N1hoVlhxaUo0NjViSEMwY3JhUXZRdHNHVmVKcHda?=
 =?utf-8?B?QkRzNFkxcU83V2ZBYXYyWUsvMnRkeE82bmpGQT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9417
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 2babaf57143e4969bd354d1ed8695a7a:solidrun,office365_emails,sent,inline:645ecd6cca06b82d0b30cc7ad8f78726
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c290cb9-aa19-4c38-44f6-08de46e66d89
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|7416014|82310400026|35042699022|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnJjS0lKKzN5cWVTaGJyb2VLenkxRDBaSUZuZjJ6a3owYndJYTRZVHpYdUow?=
 =?utf-8?B?WkM1M2h3WUZOMmtHM2hnY0VuMUNyUDJ0V0QyMHdRSmtNQ1JZbmg3REVQSTVo?=
 =?utf-8?B?TDRRYldlMUpCUTBoMnIyV29DenFOVXBPSXZQNkExcEpwR2pMMldSN3dhdzJW?=
 =?utf-8?B?ZFJ3ejRpUlBTa21XcVBaMVc5M253R2FoT21GTTZwK0xXandDME1zR09CLzJN?=
 =?utf-8?B?a0p2WFhnQWxxUXF6U3FhTWZzK2YyUUZKNERURmYrUDVYWXk5UkpVdUtSNWlr?=
 =?utf-8?B?Y1RFWjJMNVIzc1VhNnRDZmN1ZTE4UFJERlJnMUJtL1dGQTNKZnFodEhFc1JY?=
 =?utf-8?B?OXg4ZE5tejhSYU1tcTgzcC81WFN5akRWeEhCcXFRT3FHNDZoSWRBOWo0SlVB?=
 =?utf-8?B?YlZTQnJDUGIvSng5UU9HeHR2ODMvOEhDdVQ3MmxrRTRtRG5aQUxvNG5iVlBD?=
 =?utf-8?B?NGdkS2lvWXJyUWxjWm1KWjR0dTdSb1hRZEVCSmRLZ1lHR0I4Y2Vvc2ZoRjJR?=
 =?utf-8?B?bTE3ZWErREsrM2ZoWXBDUnAvUUh6NytBY3RIcnJ5NmxBZzdieFk4MTlPL0Jl?=
 =?utf-8?B?Ulo5NCtMMUpxeWh2UzBrWXZmMVVSWUJ5K0tyTzRLYlBpbGprbm9tTFJFSmZi?=
 =?utf-8?B?eDNDM3ptSzNhWHZDVkR4d3AwVHFJQ2ZSVyt2WlIyQTN2REJFMlJWb0tSekpN?=
 =?utf-8?B?U0FJckpvblFOQzZBeWhBMU5iMFd0UEc0NkRPWHV2NktLZ2tXdmplc2NraWN6?=
 =?utf-8?B?OGJCNnVybCtHb3NjaHlXU29ZeWExRjNNZWJEVGhkUFE0Y3N6WmFyakFEeUFF?=
 =?utf-8?B?OHJoMUtZd1Iwd2M5R2JxTlVaME5RcFR2Wnl1TnJQYXVoUGUzMllCb0xHenho?=
 =?utf-8?B?dEFoeG1BMCthL1hWcVA0TDhmYXh4dFFyVDNKWTNpNGd5R3gxdDBNYnZ3T2hj?=
 =?utf-8?B?ZHRDdFlPRWJlMGIzTTFkRzRaMmR3OTBmNzNwTGNBdU5kTzhaMGZTRXFHb3Rr?=
 =?utf-8?B?TXAxVTFlc0o1eGE1akdRellna0w4Q1VDRVVtQXU3LzRtcmFSaSs2dUQ4dmxl?=
 =?utf-8?B?TmlWL0loV3FaOTZ1NkRXanR6TW9UajMzT0x1aDhNOVNXTGFOMHFSc0M3WlFo?=
 =?utf-8?B?Z2VIcko3NFo3UXNVOTRkV0xzUVByeHZUbW14VUFvTUhLSVVSRjRBcW5GZjR3?=
 =?utf-8?B?RzhXbUhTdXlIVklOcTJ1Y21zN0d3T3BJT25KSmxIelp5N2wyT2V2aU5CdEJI?=
 =?utf-8?B?WlJTWWQxR2pzWUpmUFpaWnJXVHRBQ0FGUGJNMTc2SVFNLzkvK1p6ek1oemVQ?=
 =?utf-8?B?WE1iODZvTzByQUdpTURoZk1JeWJGOHo2Q05UYitaVWUrWS82dnhMRlZIS0hW?=
 =?utf-8?B?VTFZcEczTW0xRm85dVVyYWI1YXpZdlhxWGxuYzcxMG5CZk5abzgwbVVSVXI2?=
 =?utf-8?B?WnNLVjlEbHVBc2UyUjQ5L2dBb0t6UFM2dHJYSXJxQzlsVE92MmwxZG5VM25M?=
 =?utf-8?B?K3M4b1VEbHRXRW9aY29NelJMTFN0Sng3ZzU5MmxmMmtuclJWMXl6Qi9Tck5Z?=
 =?utf-8?B?RUY4VThrdVVUN291dlVZbjVyNkM1ZmluZkZsUVBPbzBYeDVFYTdZclpzTGt3?=
 =?utf-8?B?VG9xQ2YvNEt3VG9rNzJ5QlBxRmtBd0VYRkZzM21Rb0ttd2JSSUp3Szk1VWZI?=
 =?utf-8?B?NjNKZXQzVnZ5ZFdxdU9YYk9acGZ2blBoK2tHVmc2NnQ1SDlycWVFV1g3OVYw?=
 =?utf-8?B?QjBhYmR1TWIyM2NHaUlXYXpEMWc3NDFIVm9Qa1FuYTE5RDZuWFlDYkV2VTh5?=
 =?utf-8?B?WVBIWHJuMmpmcHdZZU9Lb2QzMDRCY2k0Ym9NM0FPdUlZUk1xMDRPZmVvMFNO?=
 =?utf-8?B?Tm52eDdPc1M1OUNzZEtGNHZ0NWo5L2lUQ21vZTk5d1hjaHNhWlE1RXZMWElt?=
 =?utf-8?B?bDhWdE8zbVZqQWNXUExObzBrNkpSZ3RGb0JHR2VXblZIOVo1ajZqZGUvSkNp?=
 =?utf-8?B?MnJwYXpRRDRsUy80d2NoNlJrMEs4UW4yV0hxdGlSS3dBRloxVjJUMVVLOVI3?=
 =?utf-8?B?RytGdHBMMERwOElPc3dvN0NtekZEOWozcWtoNG82eWlzNmNsalBrZ2xFYm9Y?=
 =?utf-8?Q?Ose3SZwPd/PBNl+PbKVxMqGKC?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(7416014)(82310400026)(35042699022)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 14:27:56.2365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 325f7cf8-0df2-44d6-7067-08de46e675a6
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8814

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
index 81591d2471282..2b52e47f247a2 100644
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
2.51.0



