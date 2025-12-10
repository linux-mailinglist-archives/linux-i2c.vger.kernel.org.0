Return-Path: <linux-i2c+bounces-14500-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 000F5CB3AFC
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 18:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1510231CF753
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 17:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8334332936D;
	Wed, 10 Dec 2025 17:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="muRuKYx4";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="muRuKYx4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022138.outbound.protection.outlook.com [52.101.66.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608F43233E3;
	Wed, 10 Dec 2025 17:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.138
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765388374; cv=fail; b=hbAC1xIYBKp1kVvZdFDay5sPS7WjK5qIAvUQwryW2GyQUONznm4Kg/d/SASMP6Bd5J0yzB2G3HUK41QjINygJpVBOi+7fLsCwh2cMYQCvPEXtCLO+EBsRCAlLDczCuROBg5FMMcPitzArHjUt2xkIO8CunMzwuBLzIa/tudFZ9s=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765388374; c=relaxed/simple;
	bh=X9cCrRUUIkFz7uJ/jY6Sk2GRT9fTD3vh8gQojIkBEIo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YTjuijE178kpA3DIrH1fHFlYaYtSB+pNCPiqp6z/DOyr47W4c+69Xvh45bJ4xesR1sBAJhZpgZICfRf5bRori6GRUBFE9WkFhnAMfZYiqpmq6QiFB7uoKBlmnw1N3jDyvShoV1sCOq4c834x1qeoSEptLzi0Ve445OgKTGEySdw=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=muRuKYx4; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=muRuKYx4; arc=fail smtp.client-ip=52.101.66.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tQGePUbdXUwtXRCIs051vYcUNwT4smWmMjLb21qnpU5mZDZS/s73gRLM1ctDyVup86KPY+b9JIV5VNssAfoRtEHLieAk0KEpEujJK28uhUa5vny2AO1vzlAfiq8bJYOMgWTDeE7MJvVIrmqlCQI/TfkxamBiAqx++mGJ66LTu0M5oEZdfYOLQsn6D3o8JHrrBiB8Y4G7y+6HDC98z9QXsPf5zxD6+JaPkSm2ZGLs+DHZAmVADJHieaPNT3sYUlOJM7WxSxNlJbD0nIStgc8DfPpQdT11K3bOL57GAvwjFFZM5o+12WtCbv8ASJquw5QzGSHamFf1efpgBkGMgVgnoA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgJWiGyYNQxgfjY+cvgUSMZNliPv+COPjJYSzB25l9A=;
 b=nqrs/3iTB28+GdiCx8aya+EPT6lMILBUHb6bbx6NzqAU6Y5FMNhXi/2m3T3V+kV1zlSzb/jKZMbfsAzGi2HixaZj7WGPG/f4121PhZ0+B5lTdWpn+akU2wDiRNu+BTGCBhAXD7CPKmLGCXGtQmaj1RM7b3t72rEbamURXesidzHx6BUie4at8zyeMtMfIM87wcIv1CTT9AwnJXUXxLZwLBSP0+tN1Hy0Tn/r/2KtAQUDP7oGuDgB278c7HH0cw+O3GiBc4gytIr4oDC0z0qJkh9kfvweQ5Vis6VVFDb3vTzJK5p6mEKokNl54AAYu7WKVY8sBH3l8ysH1bMIjtOseQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgJWiGyYNQxgfjY+cvgUSMZNliPv+COPjJYSzB25l9A=;
 b=muRuKYx4tppHvdtLXmihnbDSqvy8lZdNt9nnvZ5FXf360foskOZB1/4KoJsEBZUXersw4tBFf7jDVDJLs54kM0nym8CG1XAfcwP/jv4nj6EsvJlVwF6elMjGnyuLJv6PlzibHfrQ5SPwCcd8HVt2B7h51JHCvzLkZ4/JdbQ+UI4=
Received: from DB9PR05CA0015.eurprd05.prod.outlook.com (2603:10a6:10:1da::20)
 by VI1PR04MB7005.eurprd04.prod.outlook.com (2603:10a6:803:136::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 17:39:26 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::59) by DB9PR05CA0015.outlook.office365.com
 (2603:10a6:10:1da::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.15 via Frontend Transport; Wed,
 10 Dec 2025 17:39:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Wed, 10 Dec 2025 17:39:24 +0000
Received: from emails-9008924-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-47.eu-west-1.compute.internal [10.20.6.47])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B3C3E7FF97;
	Wed, 10 Dec 2025 17:39:24 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1765388364; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=kgJWiGyYNQxgfjY+cvgUSMZNliPv+COPjJYSzB25l9A=;
 b=HnKvRaJeXCY7YwZAj1TEpNkoGWNTmIm6ENSWv1wKJ7WiCsuKjQHUUykcKH50thNbo8vl/
 zvzzzp5MB7tJCndvFugbTWwP2zaFBzJFuTGRb/E02oTVZTz+8pqOGlpe0An/+NkQm1bRseX
 abGyqDdNfraNGI3WGI3tgkcIqKaoiCU=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1765388364;
 b=RJJU9CnkJktdcYiI8YuZLQqcGrIWoY+Ywn61NxfZANbRCw7Y7gDIs4zfUuQuBJmBEzGiB
 oVTcAcjoiuvSVQebjNijio6ZkwpKjo0fMcTUrS6Y6NJgbiDYx80EhjU/IJve3HLkSUPVS9c
 aIpUIQyJzuOCR9IIeAnw669HYZFpnPk=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IauEbNds0dq6T6A0N8CNPn0nyAT+Hveib+F3t6AOoUnkDttXST4QkwYXwKmUSfHDdeKZ1ToJuW54tUv3I6dCJFSof0bGFL1klVwtzgJzXvOGffYkzWZ4KX5Z5Nvqn9hIHV5ntvkohptAaTORy5Znxb//8hVkSaHGqK0aYjobO+sPj0iaLK2vQ+STdeG/mbkVFOfO81oJ4lXV4VwIk1C/q2nI0rH4QdEfucPgKiUCAUIPSdX2HKkCdmWpRTgP+V+BD92oVU0/9x7hAMVuF7y2f/pbXBrfa1wmtpWHztilf9fJ0vDCqqMnaZBp3LmrBt5PF7R7+z95GQ52oREie0pr9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgJWiGyYNQxgfjY+cvgUSMZNliPv+COPjJYSzB25l9A=;
 b=W0nQdnpdfJlGvO2NazpZ3rG52YpGW8GNWSoP68pEl+naGLdyCT+Ye/g80J7G3+2nLDDQIsdBuomGnX6jLzMO+hfegQZOk3QaxwqNGjVEtqhIJnw0zSHyNTQmgY/uHWYBHg8ivhXgWfMwrnyONJKMrhIw+l5hDcpxaZ91UnqtDQYGrJ9MlHais+32pXmqoNT37xYH9am9+X5WTBfD2b9y0zRzVCV3WVWLeHTZNaWGAPQb9xXsLaoAlCYBJHwyrLADVVq32jVwA2WtPJ72W/Em/0j1iZyYOTT5P/S2xrZMasMPWEKBsQ97KFaY8kEJBzkz/gPgxWDMv40ERPyYPfMV6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgJWiGyYNQxgfjY+cvgUSMZNliPv+COPjJYSzB25l9A=;
 b=muRuKYx4tppHvdtLXmihnbDSqvy8lZdNt9nnvZ5FXf360foskOZB1/4KoJsEBZUXersw4tBFf7jDVDJLs54kM0nym8CG1XAfcwP/jv4nj6EsvJlVwF6elMjGnyuLJv6PlzibHfrQ5SPwCcd8HVt2B7h51JHCvzLkZ4/JdbQ+UI4=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAWPR04MB10008.eurprd04.prod.outlook.com (2603:10a6:102:38b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 17:39:12 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 17:39:12 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 10 Dec 2025 18:38:40 +0100
Subject: [PATCH v3 6/6] mmc: host: renesas_sdhi_core: support selecting an
 optional mux
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-rz-sdio-mux-v3-6-ca628db56d60@solid-run.com>
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
	PAXPR04MB8749:EE_|PAWPR04MB10008:EE_|DU2PEPF00028D08:EE_|VI1PR04MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: c7feed49-14ef-40e1-7684-08de38130f77
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?d0t1eGxlUkFJY253L0NIem5SSUFoeGNPMGpvWWc0MEFQbmNsNmpXTHNxK1ly?=
 =?utf-8?B?bGpVNU1LRnZ1OC9FclBuQzFXR2U1OCthTzFRRCtNejZFTy9rMGhJakUwNU84?=
 =?utf-8?B?ZFBBMXA3MVdHM2NZbzJRMURIKzJnY1Fqckd6V3lWYmlYSnptVW9FSnB5NkxE?=
 =?utf-8?B?cXpjY2RhVSszMHhDLy90Ri9wdllBeHEycE9IbG9nVDBKTU8xYUtCV0VQRjM2?=
 =?utf-8?B?OVpzbW1XRC9CNE42NGU4MytwVUZMSlRVeUpwd1RCMm9DVy9zWitiMTVXdTlS?=
 =?utf-8?B?RkV1TnRydjMrZmY5K2lWVUFFbzB2TWlsNnBZQy9GUEpLSVQzOU1VQno2UlFp?=
 =?utf-8?B?QmdJeTUzYllmYW5razBtdmpyYzExR2wzTk9hZlVXbjVCZFVoV0M4WE4zNWdm?=
 =?utf-8?B?bGE5RFMzZE5YVGpoM3RqMGJLK0JRWGN3MGRjTGxDeHdsRkE4c2l3WkZ6YTNW?=
 =?utf-8?B?OTdxSWhXMlpIMm0xWXgvYmRZY0dCWTJsWFlUUDdvMW5PTFdRUm5vd2c5eFZ4?=
 =?utf-8?B?cVRZejlKRURIZk5kMGxyTTZxVmpRK1dXUXcvdXl6cHJFWFdGUFR6S1paNGdj?=
 =?utf-8?B?QkdETE9NSjU4ZitPNVB0LzhjUVhGMFdlMVU1dlhWR0RBdzZLOHJxVlk1cFlN?=
 =?utf-8?B?a25uUkZLYXMyVkZ3U1JYVEQxUTJHLzZJQW1oR3Z4VUNIaGwxN2tFVXM5Yzk0?=
 =?utf-8?B?SDUxUXpsOTgzM1FiU0U2VE5JYnlsMGNsT3BHVTJxR2x0WitNMFdGQ1FISnpV?=
 =?utf-8?B?OXV5dnBRcXU3Zko3REZTbTNwR0c0TGphczFFU0ZERGZOVWpwYVFzaGE5bmdv?=
 =?utf-8?B?dFI1REt1eXdzUTJnNkQ0czVkWmtJMWh5KzdZSDhkcFRnVU1yQk51Y3VQbmtk?=
 =?utf-8?B?dmIzUEhITVNHamtGZVBBWlphaEtoQVd2cjRFYzhzZEx5dUQ1MlcxNXZIbzRs?=
 =?utf-8?B?RU9pK01zM0owam85VGRJNlEyNlliWWRUNE5TdXJ4dDNhVEtROTFBVzZSNTJw?=
 =?utf-8?B?aHU2Y0Fvd1F0WHBRTGFocTRoaUI3KzhuRGNCeDZ2ajZTbU1LdGJHaVlSRWM5?=
 =?utf-8?B?ZDRBejg3eHBvVGFlSGlydXRjdnRrTGRoSTJTQXFZUDhOa0pOV1g3dE4vNXBZ?=
 =?utf-8?B?TGJpdU4zVGRSaVplTWJUN3FMUTlWZUJ3SGJZb3dNMVBvN05wNmFjUVpCR2ww?=
 =?utf-8?B?ejZnU2pOVWNmUW0vM0UydHpkcXAvQ2dROW01bmxCdS9YczF5MzJYVlNrVEMw?=
 =?utf-8?B?MW8rN2E1NkpsQjI4TkIzcVN3T3c2UGZDTTM4QzNScUdJd0FwQ3hDNmFOUE9L?=
 =?utf-8?B?UUVHcmRsdTZvUENwTCs2TDFBaHpWS3VjekFYZjZtcXdTKzN5Q21hUE5ldTNp?=
 =?utf-8?B?ejRNbndJSVBSb1RtOWd0WVV5Tm5BT2dQZVVTUnRFNlF2bjhadzRPWlZrUTBX?=
 =?utf-8?B?ZjZEMHFlNGNKd1lpcThFYmt5QXNLdnUyNXVHT3oyTDN6M1k1OWpYdzRrR3Nr?=
 =?utf-8?B?NnU5eVR0bmtSU3NSZXowQ0MvdVN2eEVIQk1LWVB0eHNRUkh4RWxBZUNnOFRH?=
 =?utf-8?B?QW5LU0hKZ2l2S2FGaDlwNm1CdC9QekFHeVZsTHpKQzhQSkxwMzVxZmJsemVE?=
 =?utf-8?B?N0FJL0tDLzlmNFpQbTd0cDZCczB2UjBXcnhJVFA2d05rMjRaREpLcjdzTmh2?=
 =?utf-8?B?RUVuUnVsT3B0NFRna2VJaHdYaDFlNENEdkoyTWU2L2ptVGZOZldUdHcrVWtk?=
 =?utf-8?B?Q1NhZU5xeW1UYlVrd0dkMmdnc2ZzSUNvY3RmdndVSHlRVDJnRWRrei8zemZo?=
 =?utf-8?B?NUFEbUJNS2ZpQzIzcHZRQThQamwvR2VpdDVLUUNtMndhZHY3S0tXQXRTRkJN?=
 =?utf-8?B?anN1bk50endoRHpBVHo3a2JMcWNCOFUrSVBwaEczN2d3Y3FKVmFEdkhvcDAx?=
 =?utf-8?B?QitmUlNqaFRBa2tJZTc5VXp1VEtOZlNtMEhRbjFkdFlBejhIcnZIc3poTUFy?=
 =?utf-8?B?UmlnZURJZWZYMnYza05abG93cmxxbHRvbUdCdjByYTQwKzkwcGZJS3VxM0ZQ?=
 =?utf-8?B?akhrR0RRNmpGVFd5N09DdjE4Uy85MW1zdEwrUT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10008
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 990b08cbfc9d4565911325d057ca363c:solidrun,office365_emails,sent,inline:e3405425bbbc305e82807fbe90c335b7
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ec620165-8c9e-4a6b-0e6b-08de3813081f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|35042699022|1800799024|376014|7416014|14060799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFVzMDNmTXdZTUFDTmZiVUR6eHdLTFRFRzJNU01SS3VFaFROYTcyZ01jekt0?=
 =?utf-8?B?ZTQ1U0ZpYTk0Y2tqektSbXdVNlkzYXJwSWR4QlM1OVU1aEU4RUhKMVhuYnFY?=
 =?utf-8?B?TFNDUkNGeW94aWJ2Y1c1eUVzQzd4V3RqYnVGRVdwQVUrNkp3OTFtM1ZSTk40?=
 =?utf-8?B?WS9RYkZFZEdEakg5WksraU52Z0xXa1FFMmQzMTRpMjVyQ3FuUjVLT0hQQ1lH?=
 =?utf-8?B?NjlXMUNLb01ydTM2TXJjY01YbUhCb2JyT21sMFcrbFJZYlN6dFd0b0pJTHBG?=
 =?utf-8?B?WFl2QTJ4V1k2eVBISjZEQnFIM1hGeGdDSHZMSFRYbXlKTEhRZlNFWXdjdkU2?=
 =?utf-8?B?UFZzdE5lSWdVeGhPMDViTDhha2ZmdC9tenk2UjhmOTRxVVRBdFhUekxDcVl1?=
 =?utf-8?B?bFZRKzFUNkMycG16RWlsUTdSVXc1cCsxeVNGOWl2NkQ0Y1A2ZWJrcVdNb1U5?=
 =?utf-8?B?N1lxelpWWUhaY3Jac2lpU1FTRCtzL2Vqb29TLzNoTm5DRlNvUEkvckZqVDQz?=
 =?utf-8?B?dEI5ZVhLTG1ON2MrdDJMSGhwTUV2cmJZbFlCMnlCOUIzekV6R0RvT2Rabkk2?=
 =?utf-8?B?cnhUUlZzdlhVUWpPSlk0S2ZUbElac1pLOG5GaGVraHk1eW0reVVEZ1RtcTRj?=
 =?utf-8?B?d1l5VTFRS2g2TEgrZmFOK2htVzlnUkQ4WVdVTVdMdzEzWXhGQ0EyczNwbHZL?=
 =?utf-8?B?NmhVNUNJRThoQVZxK1hGN0hIanV2SnFxdWYxYURZQ1ZEbEdoZkJaR2dsZVV0?=
 =?utf-8?B?N3l6QmI0MXZVd0JqUjY1c0VUc1BFUkZZZzAya3hCRURENkdHL3JaajVqcnJv?=
 =?utf-8?B?MWpKaUsvWGQrM1JVRzhtMVpqWFQwZXI0MmgwMU9qRXFmSjhYRS8ycDlFaTBw?=
 =?utf-8?B?bDBHS2lGMU9yMThGUG9QNk8xVkJ3eThGQi9uRGVOR1ZEdVZBenlEUzhGb1Vj?=
 =?utf-8?B?bFNuLzhPdkhIbWw0N0JMWk02SFhxQUQxN2x5ZTJFbkErMFlac3F3Vkt3YkQr?=
 =?utf-8?B?OGpYbWJ4ZktUdm9uZmltQUt5aHEyblJsdE5RK1c3djdyMXcxblVDeFFCaG9D?=
 =?utf-8?B?VHhzQXQzWE9ZRzJ5WU9lSGMzamVRQ2dGN3R4OTV6YzR5WWJzTUIzc2QyY21J?=
 =?utf-8?B?OERIclN1TEVCckdFZThPY2RNQzlQTzNDeHNXZmVCNUgwWWxjVHl1VjhIMXVJ?=
 =?utf-8?B?QUV2dmswd1BobktmV0hQSHB0ZzBzcjVVaWJ3Vk5VZVlxN1JqR3E5aEpueGYz?=
 =?utf-8?B?K0dwVlFLSjJFMlZyM0tXU1l6ZFgwaDM2MmYvMW94eXVRNXFyaFlOU3ZBYmRk?=
 =?utf-8?B?TXF4MWlFS0Jjb0dDNmFSUzJqSmNDMXhjWWEveWlVREZiS1JBcEFod0xIZXhG?=
 =?utf-8?B?MUxyYnVzRTRNYlR5ZUo3MHFaUlE1TnlCWkdSSWZTOC92Q09XbHlpSEVteWk3?=
 =?utf-8?B?ZHNEcWJJZ2FhUWZFV3N4WkVNNTN3UzJFNmlVSFdWYVVjYWQ5UEtReHE0TTV0?=
 =?utf-8?B?bUNjaXJwOURqdVprTHJtYWc4UDRZN2VVQnoyVisyYktKMGVvdytWVloxY1Jt?=
 =?utf-8?B?K0d4UGRUS0phRThBUnM3blJ0VXZGWWNjM0dFblhkeHhqaEFBcjNHcmNCZFVo?=
 =?utf-8?B?V2dFQTgzOFJvSDR1cWhaZTUxVlp5QlNVaGdiaEg0RUh6dUlrSWluWDlBN1JJ?=
 =?utf-8?B?N09weFZVbllJdW1hZHdiMnVzaDVRT0hnaGJEYjA3TTlaci9kKzNYQlYxQlRV?=
 =?utf-8?B?UE1uMVlVbjhlamFndFJMMUdIUEl2cjRLRTdBZ3V3YjBoVHg0N3dMVy9iamhm?=
 =?utf-8?B?NFFkWkhkQldLZGZhcDYvYkgzVWZySko0Z0FXNVZzMkNsY05CSXFRSkFPSTk4?=
 =?utf-8?B?dzllb3F3NmVyT0tMRHlKMXZmMGpVNmJCektxKzVpeVVaZTkzbWo1aDBaKzZV?=
 =?utf-8?B?a2E3U3BHaC9GclZsdEVhTVBDL2RDb0NiRmhiOVdlT3FzOFd4ek1peEhGRDJp?=
 =?utf-8?B?UklIOXV5dXhOVWtIZFQ4NzErYjZ1RzB3Q1k3U2dudHl5aFowV0JQdGhabU8z?=
 =?utf-8?B?ZWlad0lrUGlLcGZiMjlKOHJBT2VONVhaOG9BVHJTbC9WZWI4c3VlRFJ5eG5X?=
 =?utf-8?Q?ChrY=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(35042699022)(1800799024)(376014)(7416014)(14060799003)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 17:39:24.7787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7feed49-14ef-40e1-7684-08de38130f77
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7005

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
 drivers/mmc/host/Kconfig             |  1 +
 drivers/mmc/host/renesas_sdhi.h      |  1 +
 drivers/mmc/host/renesas_sdhi_core.c | 16 +++++++++++++---
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 2c963cb6724b9..c01ab7d81a5af 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -707,6 +707,7 @@ config MMC_SDHI
 	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
 	depends on (RESET_CONTROLLER && REGULATOR) || !OF
 	select MMC_TMIO_CORE
+	select MULTIPLEXER
 	help
 	  This provides support for the SDHI SD/SDIO controller found in
 	  Renesas SuperH, ARM and ARM64 based SoCs
diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 084964cecf9d8..9508908d8179f 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -97,6 +97,7 @@ struct renesas_sdhi {
 	struct reset_control *rstc;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
+	struct mux_state *mux_state;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index f56fa2cd208dd..3d833a325c61f 100644
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
@@ -1115,9 +1116,15 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 						"state_uhs");
 	}
 
+	priv->mux_state = devm_mux_state_get_optional_selected(&pdev->dev, NULL);
+	if (IS_ERR(priv->mux_state))
+		return PTR_ERR(priv->mux_state);
+
 	host = tmio_mmc_host_alloc(pdev, mmc_data);
-	if (IS_ERR(host))
-		return PTR_ERR(host);
+	if (IS_ERR(host)) {
+		ret = PTR_ERR(host);
+		goto edselmux;
+	}
 
 	priv->host = host;
 
@@ -1200,7 +1207,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 	ret = renesas_sdhi_clk_enable(host);
 	if (ret)
-		return ret;
+		goto edselmux;
 
 	rcfg.of_node = of_get_available_child_by_name(dev->of_node, "vqmmc-regulator");
 	if (rcfg.of_node) {
@@ -1304,6 +1311,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 edisclk:
 	renesas_sdhi_clk_disable(host);
+edselmux:
+	if (priv->mux_state)
+		mux_state_deselect(priv->mux_state);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_probe);

-- 
2.51.0



