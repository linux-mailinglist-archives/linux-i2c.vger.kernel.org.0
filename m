Return-Path: <linux-i2c+bounces-14842-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E5FCE70AB
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 15:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90F6A301B83E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 14:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7DF320CD5;
	Mon, 29 Dec 2025 14:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="AXdDTem+";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="AXdDTem+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020074.outbound.protection.outlook.com [52.101.84.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBAA31DDB7;
	Mon, 29 Dec 2025 14:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.74
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767018483; cv=fail; b=t/PQ5f6mpb6SA1AR2SO7VOzs46feMIPtTb9AKFea4OQkRYTFPt6KMDHl/T7CFGmr+LtJLwNeLVxUi/Rki9NwyQjofc3BsAqzEzqpOa5bbt0JJ47tYYVA73foZdofqzduT4F5cgb+IYyANTvQmXpwVGtDWFRcUG/1xTdkzV7H+mM=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767018483; c=relaxed/simple;
	bh=JbPByMvwrSD/QFBTCkChIc3vjLOM74s5yB92HME7i+A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JmtwnDUXLBSX4O9JxO3nyQhjyXFfBTy4k3Zu939P/88wgMqnEIOnDEXNFkbLS4u1L8ex+ByutpBQ6ouI4yjCYFh4IpWQ2q2uw0mEjc4LwFywBHwcI3fLngRa4WftP1o7Jej1ZCBI3RXuvdxr9Xg/KGydGlCReO+ZBTN8vuwXXrU=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=AXdDTem+; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=AXdDTem+; arc=fail smtp.client-ip=52.101.84.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uR/FQID1Jmp7XZBJxGDuSOI03efeG5rK4N+Hpd4MDbq6aUIYt9nQ28NmyXslK+ts/AMaouLgB7/+kl1XOWFylMtzO9mpzdg3gAYsAD3dn/manZ5nzxge67Ijz7bEibFiOAme+8FAas1BEcBbRWK+lzHOKY0PCztoU8EQO8PBETVSl1ARR6aUuT0eJyh1t3m7FoUIQZ6tyE2hES6NqCf5ceOuUgsJ9h4C79N8lNEGHptzanxW0yN8ljCtnqGsDjDWRR2dMnYaXFokKsUgGkoAPMlPsXm6fMRgJmd+XMmhT+VIXsgBPxMo8Iv/kt5DETMYqKYKVTIJjguA4GYgH5RhDw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMBJ5xqmkep1asq3a5aRCFo0CLDHbnJA3RwHrdNxZ2s=;
 b=b3eKMILrB7dXKlovZwft/oFZfdlssISZf8qY4Tdn6gEnd2aZ2TWybBo2dmnGXzowwd+PbF8MchYmNGaJF7p4PvGgvma4qRY4mIcV/2dRrjI8cvi6OZEQrXms6Qi4M8fPPp4ze5ecOKWtPvZ1kWsg2DcnFwVs939VcnbUXhDS4ZtvxuYM7OFeWy1VyzwiX0efl/g16jJ85TS2/8Xz63rWUvsivk+dpAWAaljNR8bmobYsp8yUuGxMVR/wOdLzB0u/24TRBkqTWiyK7AcS0gTO3Rfa5B3Z4BkShHIa8TtF92vXWGljz7k8JAdnHJOg65Q/9FCdjSM7d6mDF+wIlpqJNA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMBJ5xqmkep1asq3a5aRCFo0CLDHbnJA3RwHrdNxZ2s=;
 b=AXdDTem+MMow6WkbXHuQ/jAJWPMvp3ZdIyG9sTjO0dmZxprOafi+UEw990qcWrqTC4rqrVusvO/GksgeEPSpUm7FSeQsCLCfN+TyA1emKAS0Oos8sDq8FKEN0hfP7n2+8Dat2NcGVIpb15cYkUK1D8PxmTYZrh8AtsrC/4gBl+g=
Received: from AS4P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::18)
 by AM9PR04MB8634.eurprd04.prod.outlook.com (2603:10a6:20b:43d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:27:57 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::e4) by AS4P195CA0016.outlook.office365.com
 (2603:10a6:20b:5d6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 14:27:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Mon, 29 Dec 2025 14:27:56 +0000
Received: from emails-6921961-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-157.eu-west-1.compute.internal [10.20.5.157])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id AF9F2803E6;
	Mon, 29 Dec 2025 14:27:56 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767018476; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=tMBJ5xqmkep1asq3a5aRCFo0CLDHbnJA3RwHrdNxZ2s=;
 b=GhhH47iZjfEqGjUyB1Ivx97RI+p9qQSbL8PQOFvpZHFA8RzpgZENZkEqRN6cL2TBRruDp
 m1qaSmwhss+LR2m8VoGaI0Aa+orP9CNInoXHXAko6w57S5cN4I4by5E0rPC8S8o5aBCL8aS
 niCfPTGSzjDJwkRqTlZ2H1jYWIqYxgY=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767018476;
 b=Cu/yQcocHS8nlOoZZWdvNf1hzRqqZxecUFb1GNjnbpQkLPdKUCTOoi2Ra7pCkF+YGHkR0
 7beggMLbUgHx0rdQai7xr0xnvKcdPfemcgXldGaQflXs2HRxm9sNZ/CibO2ez4XoKLE57Fe
 hUZr0uEEwtOdZidS/G88pp8apKORBdo=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgCdFMCt1s1h8dFPTCLq55wnGJL0TNAKFzYBxSZdeJKsspe+BJLEh6wW5rzERI1Nbi+ZSE8YZt0TeSE4z3B3aGPbuBim0w6r+6u2HcrOfiF2Bjewpsz9qy5NQ0fd6LlKCS2wV/16IKJU13ej+aQ7y4HnkY3ynY916oB+RClpMzkg8/qRavoSgvlbpzjH7Hc3s5aXxypXiZdel4lZJyTeaciIQJOdlfWupiZERAIN0FyQfv9uA6l4l6xioyIAfVZ9iZyTM1YJDbiNxLfWufvxQVVLscN//Ebgb8HYkWtYQm1KYw3+5AZIh8L1EaPj2R9DOGDU8t6FIcB0VaysfnolXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMBJ5xqmkep1asq3a5aRCFo0CLDHbnJA3RwHrdNxZ2s=;
 b=c+VIhqfbPJxwzliYoY8ZbCHnG+t5I5jsKFtzaUIz9VmwI2DFr3tFVitds1kZ5MD+6dyktAu1HRy7Nf0QS5IuSjL0ZlwdKZZ2GfJTOdwWpqu0Es82j6qsJLzRqKcQZzGVzS/TUHJd+PchP924BL7oX4qkKfhSmJ/ZCPeJe0ONlaScnwRAbZ4+NCZtmdnHM9YjcU2qg4YCELonCpcwBniCo7tifnmFYpeRKCYAsYaZXiatwTszTX9h5clF9UXwYU16X8GZTaXp/466/t+ey5GBFL+Ee5hek9ebai7ssx5TnffzoUYDos1YMW1dtucs5IEjcHREOhiaPvhamUvVREFkag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMBJ5xqmkep1asq3a5aRCFo0CLDHbnJA3RwHrdNxZ2s=;
 b=AXdDTem+MMow6WkbXHuQ/jAJWPMvp3ZdIyG9sTjO0dmZxprOafi+UEw990qcWrqTC4rqrVusvO/GksgeEPSpUm7FSeQsCLCfN+TyA1emKAS0Oos8sDq8FKEN0hfP7n2+8Dat2NcGVIpb15cYkUK1D8PxmTYZrh8AtsrC/4gBl+g=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:27:43 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 14:27:43 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 29 Dec 2025 15:27:29 +0100
Subject: [PATCH v4 5/7] i2c: omap: switch to new generic helper for getting
 selected mux-state
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-rz-sdio-mux-v4-5-a023e55758fe@solid-run.com>
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
	PAXPR04MB8749:EE_|DU0PR04MB9417:EE_|AM3PEPF0000A790:EE_|AM9PR04MB8634:EE_
X-MS-Office365-Filtering-Correlation-Id: 66208f96-9bb4-4535-38b6-08de46e67615
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|366016|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VnVsMTBweU9uTkkvY0RnSGltemd0dXlTaFRRUktWc3k4b0Y3SS9wYmpNY1lF?=
 =?utf-8?B?L2QzUEtVNUpObDJSMzBUY0dEek9pZkVLSDdtcWEvU2xHajVFSXB4V1dWWEVX?=
 =?utf-8?B?MTB3S2JHMjhKQ0JZMjBhM0lyNGtKemdHMVFEMGtIU1R2cTR3dG4vekhSb3Jk?=
 =?utf-8?B?V3JpcXBFL0hjU2hRVGEvYUlMYjhCR0d3bEhPWVZwQkdQd1VIQkRhb0RSY0Ir?=
 =?utf-8?B?VDdzMXVNMUR6MjFtOFVZaUZkOTR6ZW5EOHJaMVBzNFB3bVFoclh5djg5Q05W?=
 =?utf-8?B?Q2hwb1BYNEhrdFVsamJWbHBtSFIrdFZoU1g4NVVhK2s5TFloWXl6M0FKaW9K?=
 =?utf-8?B?a1Z0cHBxQy9BcldROE4xSjBYbHRZalA2NGpMYURqbFVVbDlOMmQ2bHNPbzBv?=
 =?utf-8?B?cTh1V2xWWUJFZHJ1OWRpd2dZeVJ2TEt2V2V2Y1VObGlYTnc1OUFEa0pUWjdV?=
 =?utf-8?B?Y3p1Szl0aFpLenhaNEEyK0UxV1RzNHFQQXJqbEd1TXJHdFRGd3FNSHBVdHU4?=
 =?utf-8?B?eXdPM1hCTDRjeVlseXpqODgxNEZVQXc1QnVtTXY0dXhla2o1d0lMTjBhSkpw?=
 =?utf-8?B?SEVvbHlEelJEOU9BZmc5OVNrdHlBamNPS2NFNUdTZFJ0bkpyQVZVMSsrZUwy?=
 =?utf-8?B?Y0hQYmtVelNacmVySk1Rc2hkYmZqSjdCb0JUSDN0amNubWtpeXZkMHZZNS94?=
 =?utf-8?B?WEMzVGFDQUhFVHNsaTZnQ2c1TjFQb1YyOUhkNGJWUVdLK3lWQ2xkZzdhMWtE?=
 =?utf-8?B?Z2NBdWZUakhETktza09qYi8rYVdpY2NhdUI2Z0lLR3FYbHluM3BFMEV5MCtt?=
 =?utf-8?B?M1dOelNTQWRBV2RJMDRSVXlxSFM4VWZmdmtydW9BdHJmTEtYclZ6RGFLVkhE?=
 =?utf-8?B?NFpzTlZpWE84MWNJNGxrK1piaVN1NExscmR1QjZwUmQ5WStKbFFrdjBTMzJm?=
 =?utf-8?B?QlNTNjd1WkV3TERFM3o0MEF5VnJBZ3lRRkdBU21ram9TMERpVkJLQ1pScVMw?=
 =?utf-8?B?UXFJSDVFNVp6a1VHOVplc29ZM0NMU084R3AyRHNpTTI3QkRNblVhb2tTVm9I?=
 =?utf-8?B?emc0bElmbm5SdndBZDRmRzJxZUk4c3Zab1R0R2E5L2I3b2V0Vlc5NmVSVDQz?=
 =?utf-8?B?dWpRKytGRUxPb2VtanFiZk1sdFNqRlk2dFkvWWdzQnE2YVZHTExQNm9oMDZW?=
 =?utf-8?B?a2pVMUdSTWMzYzhlM2tJU080WG1pTE5MWUROSElsVU1qV1pjQ0pvQWR4b0VF?=
 =?utf-8?B?ZkVXTjVsNmRhRjkxRkZnb2JtbC8yT2tmaExmUGRESE5VT1RrL1hKSEhhTTJX?=
 =?utf-8?B?eFRSWjZsZWR5d1BTTXMyQ3kzbXJRazJiQnFZSlA1KzRRSGJIQms4RjJRa2dV?=
 =?utf-8?B?SEtLMHhNZ2IxaEFXL3cwOXVsdkNGbVNNQUlpVzU5WGRZby9wbG1HdmdyeVp4?=
 =?utf-8?B?eFdBR0lKVkc5aE5BRU4yODBjWVgzL00yUENjTTlja1ZTL1pyak0rcjlCNEhE?=
 =?utf-8?B?Yi9kaW9nbFczNVh5VHorUSs1a2ZaUE1YODJUb0FTRExXaDlEYVlyTHFoQ0I3?=
 =?utf-8?B?b243WURQaE5mTVdKSVBSblI3dFBzdjAwUm5SSThFZUxQRUlYVisvVkRVMC9W?=
 =?utf-8?B?MmcxeG1zckRXOS9HM3NlaDYyalBFNFA2WTRCaERGaGNwUVpKZ2ZtT0J3RTEw?=
 =?utf-8?B?a0hiKysvTUZ1WGZrbFZRT3NCMnQwL3Rub0xCaGlhcVU1MUhYeFFjTGJyYUpT?=
 =?utf-8?B?V2pzei9YUHNVUld5RjJicWRYN2U2QVdYek9Oc0ZzSHdWd0U4Wi9COEFGZ2VR?=
 =?utf-8?B?eDRiODVRS0MyeFVYT1dxZVRYK3UrRTl3ZXFDZ0ZaN0RpODAza1pSclV6MzJh?=
 =?utf-8?B?ZEZIWFZmYTBBbTk2dVZyV29HZkNiRkhjYzA0SW9sb1hwMEZlUHNKRy9ZeEdi?=
 =?utf-8?B?NWxBWUdhN0YrOTJidFpZSTBBLzVsWWFwQlRjRC9ZMVBTZUpZSkVtbjgwdGgv?=
 =?utf-8?B?cEhHd1BnSEwySmhmRHdkWHFvYlpkNGNiQUJ5R1dCR1p1TUxaY0hJS3pBTzFh?=
 =?utf-8?B?QTNSR2NhL2ZNTlpnVHZLdnRob3pmTyszdC9qdz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9417
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 64634b213d7d40b480af45ba1df45c33:solidrun,office365_emails,sent,inline:645ecd6cca06b82d0b30cc7ad8f78726
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b7e6a921-1959-4167-38f4-08de46e66e1a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|376014|7416014|35042699022|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFFBVndPQkZzRU1hdW82cTE1RDIraXBNcXU4am0wU2o2Y056cGUxZ2RHK0lq?=
 =?utf-8?B?b1MrdStTWmt2R2tqUWZSQUlPRVZwSXp0aWlaL1pJVUFFdFR1OE9vMmNjMWFD?=
 =?utf-8?B?QTlWOTh1alhsTDE4SWh0Zm5EN0h6UUN2L0tBalVCbm8reTlxUU14L3ZrNmoz?=
 =?utf-8?B?TnFqNzYrSGVLWkQ0RUZTdDIvL2dYaFd1b01uc2w1MHlzSzlkV0FhMUhVM011?=
 =?utf-8?B?U2granphZk5ENUFMT3A2Q3V5S3I1UzBvMTI1Z0hmV3A4bmhMNWtBZEd5L2hy?=
 =?utf-8?B?VnN6ZXR2QnFlcVJSVXVNcmNST1VXZW1CbUtsdUlFSk4yYVhqc2w5N3UvaWRv?=
 =?utf-8?B?UURtWGpZMVpQY0xCS0hFRXFXZWdpSDVOTUExNUpiY3htNjRZM0hmUUx6RUFV?=
 =?utf-8?B?K2JpdkZLc1NRYnlnSDY0clFpa0RhbnVrRkJMV216ZlpjRjFwZXp1djlwNkhk?=
 =?utf-8?B?ZC96QjVIelNwdHd2cmRteVFtZVduZENHL0h0L2IyRWR5VFFYWjBqcmRaa0Y1?=
 =?utf-8?B?bVBia0JBbTZXN2M1NTVsZjFOSS8yV0YvSnZRSG1sT25semE2eVZiMkFURGZX?=
 =?utf-8?B?OU9CMUU1TlBScUJzb3dRdktaZTVYNzNNbExqbDZhbVl4dXJBZUJjS0hHZW03?=
 =?utf-8?B?a0krS3ZwajN1WTZSNnk2ZlpabE5BVDZLWmtuMXZUelJRUE9hYmg3dkpud3Ra?=
 =?utf-8?B?bjNtK01pd1g5NHB2RlBGM1kxWTl4WE9NU0RTcmxNZ05hRmdQdEdaTWxEUzY1?=
 =?utf-8?B?UWNNV2FBY016THJ5d0VaUmZGMVZzTnF6dm85Y1VlYUdXNnM1MnRpOUpCdkpa?=
 =?utf-8?B?U3hOMllEQy9rZ2g3M0JERVNNTEE3dGhKTDR3Ny9hL3R4YzB4Y3JCUC9oNnlu?=
 =?utf-8?B?eDBRUDZDZ3ZQSGJyRE5UUmNrdEwvbHBiQWtVanRubmM5Z0tXWklzS1FyRS9R?=
 =?utf-8?B?c1hBaG9SVlNPYW9QUUZUZVMxcllCL0FPRTczc3hGRVRVRWlsd3RtdXg3aWx2?=
 =?utf-8?B?T3lLU2s4d3ozL3p0aGt0TXhDYVdmTFpUaDRQdzVXTytHV1hKY2N4dmJuOW5S?=
 =?utf-8?B?QVZyUGRwSDUrSVJhd0ZQdFZ2YUlMN3FlN3FnU254Z3dJUHN5dlVHYmp5WEhy?=
 =?utf-8?B?SDNLcDdXbXltVjdSM2ZyMVZxU1NaUGZ0SnpVSklQd1FIdXdHSm1HdDk0bkYw?=
 =?utf-8?B?ZDJOR0FCdzhDRGM0V09CVnZ3YWdWUDdPWHVyZkhteUdIMTloeWhqMUZkdWhN?=
 =?utf-8?B?alVvTDYxVFhBZVZHekhTUDRBQng5V0haMlFjMzg1MHdkWWZFcW05ME40VnJa?=
 =?utf-8?B?TzAzOUx2SGRRZmEyMWU5R3VTSDd3SXZhWHNOMytrTTduaXpEdHZESFBNMlJa?=
 =?utf-8?B?dUNjaGpreTNLdE9zVWNiNHVvVHc1dWVtUE5TMWd1QUZ0QmNZNWRTZG1sVk0r?=
 =?utf-8?B?SjJhRWdPbTR3WFR1VVhXQzQ5V2wrU2NrdXlQaDVLZU5tNi9QcndtUDNzZ1Fo?=
 =?utf-8?B?YkZFSDE2Lyt6VnVxOUpYUkp0c0g0YTlyL200QXlLb0hNQ01ab08wR1h5TTBN?=
 =?utf-8?B?ZnlZV0VxbHByNG9mZERScFNkWXR6M01qSVdUQXJhYm02cmRpaytTcC8rY091?=
 =?utf-8?B?b0cxUjBxNk90UFpiSWdMTkFRNWowZWtSVjVYV2VpMzVUVXNiaXVzcDJUQWpX?=
 =?utf-8?B?eG9Fc2h0NldQcjMrZXBFSmt4V3UzZTZPKy8yNW5KL2ZqZm5mOVNRMkF1TGM5?=
 =?utf-8?B?UTFBZkljQkRqN2dOSjJla1plQnBGT2dsVmMwUnd5U2lGOG90aEpvUkZVRkE3?=
 =?utf-8?B?bGo4eG8xUlZlZ01tNjdydEhXaHJKR2M5SHJrc0o0YklJZmNVQWxFWmEyaGcv?=
 =?utf-8?B?ck1ma2N6dGtVZ2NwUDI3SEt4Q2xtR2g0U0F0NkxFMUN3S0hnd3RSRzhOWnpM?=
 =?utf-8?B?MlNNS1g0VVFlSXNTaEJWRGE1NXNqRnVUZjNtcHFTOFZIUGo5TDdqRkRYUE1X?=
 =?utf-8?B?YUhDVzZxVjB0Wm15aDNpeVZsSXpUTFJJMEFLMC9wakVmWkhQeFZKdjIyQTVw?=
 =?utf-8?B?ZnI3ckdYYkVSc044dHdzdU0xbkdkc2tvVEpwRzk3Ukl3bkZCUVppVlpNL0da?=
 =?utf-8?Q?GORMJPgmdZWQryS70bAU6Jamy?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(376014)(7416014)(35042699022)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 14:27:56.9709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66208f96-9bb4-4535-38b6-08de46e67615
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8634

Multiplexer subsystem has added generic helper functions for getting an
already selected mux-state object.

Replace existing logic in probe with the equivalent helper function.

This change is only compile-tested.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/i2c/busses/i2c-omap.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index d9f590f0c3843..495d1f0c0c3e3 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1453,21 +1453,10 @@ omap_i2c_probe(struct platform_device *pdev)
 				       (1000 * omap->speed / 8);
 	}
 
-	if (of_property_present(node, "mux-states")) {
-		struct mux_state *mux_state;
-
-		mux_state = devm_mux_state_get(&pdev->dev, NULL);
-		if (IS_ERR(mux_state)) {
-			r = PTR_ERR(mux_state);
-			dev_dbg(&pdev->dev, "failed to get I2C mux: %d\n", r);
-			goto err_put_pm;
-		}
-		omap->mux_state = mux_state;
-		r = mux_state_select(omap->mux_state);
-		if (r) {
-			dev_err(&pdev->dev, "failed to select I2C mux: %d\n", r);
-			goto err_put_pm;
-		}
+	omap->mux_state = devm_mux_state_get_optional_selected(&pdev->dev, NULL);
+	if (IS_ERR(omap->mux_state)) {
+		r = PTR_ERR(omap->mux_state);
+		goto err_put_pm;
 	}
 
 	/* reset ASAP, clearing any IRQs */

-- 
2.51.0



