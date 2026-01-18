Return-Path: <linux-i2c+bounces-15250-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FEFD39403
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 11:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A5C23011ED1
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 10:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4F92E6116;
	Sun, 18 Jan 2026 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="CDTY3LDQ";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="CDTY3LDQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023102.outbound.protection.outlook.com [52.101.83.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FE217C77;
	Sun, 18 Jan 2026 10:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.102
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768732162; cv=fail; b=O59wt6sG55GvWHBuQY3FQ4WsFQ45dfXH6FVo/KAFz252OIeHz33wM45A2iGfGWIDe7lvki2pK0tLeT/MEthBRk8K4UiXxQ1mi4bHKkgmSFyz7VsT48+EGkvhfjjj2pWRY0oGWsnFSnPSMQv+onESmE7aGefj8RYAyhZWiWU6ACc=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768732162; c=relaxed/simple;
	bh=O5TnlBXGnofLMF1B0cXM4g5+b/26sCIIadOBJhZE3cs=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=GC7wskGzDIxieIwqsQtkef2HRu5jWPneo8goUzji+WfMWCJcCPzT+JvGgphTERNSvoMSVRRlekHcKZVR2UxbgKS0QObkIWWmybyPZ/o8NVM8EIsnYBgo+B+DEJTRLKYDhz36P69vlnUHxp0B1RFWRHP3PKRsbODEwfIJ4QSEm8E=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=CDTY3LDQ; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=CDTY3LDQ; arc=fail smtp.client-ip=52.101.83.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WLzlREkM8EvcCJpVFmFnRtpnUy4voZ1WtLwQ6abFNMDxhFIq3gxCi8cpGJiGPnWVNyeMcax26l0VyzFt8J24AMdAqU96oKms80z2BORq+iyX1pHZWFr1dzTBSEOh+rlTM52iSRaAhXqk3t1DueHwGG5E31/O/iPFqF7zuicOhIwqkt38NsOsM4FbnSkbPmJPLPmAvT+Ir85GP1D28eIdl/JMg3KMSxhtc+9hyyINRFPDLIQfbx06obIQlxyLhO60XCk0mE4o2fnElHtzW74rlOzb/xo9H/SAsjzRnNXE7ctpWYBVofAAuu6YBfl30GWMwoYzBbQXX/a0pa83bm56fQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8yEfTgdjLq4E7n/OlBbU186T87ltOlmeu+0K6Fse5k=;
 b=ZjXB4FrHtrraDGVFP563gQ4WjuqkYXX6bmhFec6RsJhhLH7tP/IvYoIR9aN46PGQ0bJU3BiFzJe8jd+0NDMX1HxNBTku+OtV30zbArJwbxKCx8sLI7JIkV1aCH0TimzBzD7864fbt8cc+9L4EeE14JfF40PKticTIfe31lzM6VwrA1jg2gdF7nC4onkCOjriq51Ms1VH3LkWm+VUqekoH8qmkhtbcXRYs0XEjFEjqcS9ZfiCq8Lufg2ODQGyWq3pD6NokpCl3f4lSALOtmcIIxhURT1LMZ0iVyCHvcBpFOoLF34rXfxZeRa1JwiIX3u2+05hklMtd33JHw2J+AYm2A==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8yEfTgdjLq4E7n/OlBbU186T87ltOlmeu+0K6Fse5k=;
 b=CDTY3LDQaVXoy5TcrZP4lU0MMeDtf/GGjwOlwFk8bLnGGVIM/FG9Tjbd+OtHgKgcLPqRfDRkgA6voQOO2Sy8TboMgGYsrumSGF2CX7UmEURTABsUCP/jULVfEoFvPh0pBjRhIwPV+ML80NsKSv6bkuxEGq3/7U4SnHcij1XFui4=
Received: from DUZPR01CA0137.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::10) by VI1PR04MB9811.eurprd04.prod.outlook.com
 (2603:10a6:800:1d3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 10:29:16 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::7c) by DUZPR01CA0137.outlook.office365.com
 (2603:10a6:10:4bc::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Sun,
 18 Jan 2026 10:29:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4 via
 Frontend Transport; Sun, 18 Jan 2026 10:29:15 +0000
Received: from emails-5211221-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-10.eu-west-1.compute.internal [10.20.6.10])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 641FD7FF47;
	Sun, 18 Jan 2026 10:29:15 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768732155; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=D8yEfTgdjLq4E7n/OlBbU186T87ltOlmeu+0K6Fse5k=;
 b=X1qsavwNFWED0Cc62gIyx94RzlEb2/nF/l4R1FU85a+nXjx7RT/3mbcrZm3JkrixxMjQg
 yOwAAfslWLualSKp9Cs+jHIN9eTjWJsK3OkfQahJB3kOzEgmcJGLCYmDCqmJBHQVemE5pnD
 j1KR0q/E4QOH2hX6hCTeTGKhZE1DbL0=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768732155;
 b=iW0aE2ogySVd9uTizsVZi1/GvsxbQOrSw4TiixrCxAy7ADcz9iLfDv8Z69UI+xciMhW6V
 fm94lhnJpxoAKsgXauOk+vAXY7tG5xbrKRZoaRXwRkKI7Nlhyv/F40iUCgNCiZhFLS8zzZp
 GxydehSEidwAfaXV/+OHZwtqJOxn+Pk=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qVOArW5nW6b6gSqx+Os7l/CvDyGhZUuFnMPzFkyFik/OoXDHvdg6awFS+Sz/HbmDBupkBrpj5RhH7my8zoZIurWiOb5ES9PKdbVzmg1FIfh48hJ5/92Vx/ACJkphxbkxliOkCds7ZuwcpzbIvPDUvPALinK/JljdvV812/V5oaPQRbKmoYkZmKRl2JUhBePsK3odTThSa/l5411zUBbpGhjHbMsun6AR0JWQUPqwy9qUGFTIhkgoQHVA/KsuJBdGaJY0RYzofCGD4xTUamCemE3PsPQPaurwH4rDZuAdg2aRGBsTVZb7ouyfbKvg0cEupDemenfiVsYU5QoUXDH7wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8yEfTgdjLq4E7n/OlBbU186T87ltOlmeu+0K6Fse5k=;
 b=ZjDAY8pUOljhev28hRceWu91wt965D2agY9gzbxoWxr98Dig4R0QPSUNvR5vyVLZlMzmzBBd8FSh27ji2+OTKNRtiDDaxNaYvZsORxuM1UiKfsWVfv+pKTDZ2LwxiA8y80ippjk7Hcov0nqOqwCDjww3d6Wu52/exk5JFnkJkfPTAJng84zjOr4mrSWgZYjej/eyPvD+h1PgwohUcDBcUGKgfBCSizSmZKNfdVtMHHBImkxQvyfLi2P8a7TJLc4B9ehaJMlChJkF8dBETRbISoUHMW/G6d9FiYe8YUfhMrkNUxgIiHPnx/1QDT8X0VIi75FeCEyUAKx1yU6Uavv30w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8yEfTgdjLq4E7n/OlBbU186T87ltOlmeu+0K6Fse5k=;
 b=CDTY3LDQaVXoy5TcrZP4lU0MMeDtf/GGjwOlwFk8bLnGGVIM/FG9Tjbd+OtHgKgcLPqRfDRkgA6voQOO2Sy8TboMgGYsrumSGF2CX7UmEURTABsUCP/jULVfEoFvPh0pBjRhIwPV+ML80NsKSv6bkuxEGq3/7U4SnHcij1XFui4=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GV2PR04MB12189.eurprd04.prod.outlook.com (2603:10a6:150:33a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 10:29:07 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 10:29:07 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v5 0/7] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
Date: Sun, 18 Jan 2026 12:28:56 +0200
Message-Id: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOi1bGkC/23OTQrCMBCG4auUrI3MpCZGV95DXKSZ1Aa0kcQWt
 fTupoL4Q5ffwPMyA0suepfYthhYdL1PPrR5yEXBbGPao+Oe8mYChEQUmscHT+QDP3c3bqyVWK5
 rVKhZFpfoan971faHvBufriHeX/Eep+t8p0cOHB25EjWhgnqXwskTj127tOHMplYvPl4A/nqRf
 WUrqbHSmmg958svj/Dry+ytUUJTJRUpmPOrt1eA8Pf/KvsNGQUKTa2N/ffjOD4BjsGMK2oBAAA
 =
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
	PAXPR04MB8749:EE_|GV2PR04MB12189:EE_|DU6PEPF00009524:EE_|VI1PR04MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: fec86000-6b35-4b7a-8266-08de567c6e09
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TWpCMU83RERFYVprRnFqeDBLM2w4QVRrNktrN2JQTWJ3dU5Ca09aZEFtR3NZ?=
 =?utf-8?B?M0VmOURDZ0NUM0U4YU02aHo5VVVxaWZ3UjJ6TXNKVitwRmtTTnlKUEg2Qklt?=
 =?utf-8?B?Rjg2WDdPNDFrLzd1a0JxZTh6WjJLemdXUkM5RCs0UmM0ZDU5djY3RWViQ3Fr?=
 =?utf-8?B?Mm11TXp4a0FyN1ovMis2NHZ2dTlRQlRkcG9CNFJzblhWbTNCZUQrWDVVSEpV?=
 =?utf-8?B?YXdTRzk0WlFBMUhnSkNPbUV1M0lOTkNFVy9ldkR2djFHK3EvV1M0UWtFNGFP?=
 =?utf-8?B?R1h3OGJ4OXFXN3FtU290elNzYXN6Z1ZLbW5BQkU1RVUzKzYxYXFnMnVMdmRn?=
 =?utf-8?B?bjAwZHZDSU4wbmNMazJOcjRldHdwVTM0NWxGRlRZd3NZeUVJUDIxOFpHS1Nk?=
 =?utf-8?B?Z3kyMHZmZEhSWTgyaUl5RDc3aE9zc25ObTRXeGUzY1ZTTDhUY0VrMGdlQ0hn?=
 =?utf-8?B?U2tyVmY0bWY0amtQWlYzR0tuZFVGMENBV3l0ejIvUWgrbjNKK1FNOTlXMWNP?=
 =?utf-8?B?K3d6bUY4azBXV09DZ2FrOWcyQzVvMVkrU0N4T2hKVFhYM21JQ1U1WGtmb1R2?=
 =?utf-8?B?akkxZm1OSzNyY1JZdlJkQ0RCRkJYNkJRbS9JNFpEMDZNcVpiY0pieWx3NDNQ?=
 =?utf-8?B?MTZSUnJuaXkwVUhOclVMbnFhSFl6MG1PeWlJWlpVdStiazl5TDlnTjk0V0tT?=
 =?utf-8?B?TGd6eVRHenljbCs0SVNSZ2o0eElPWERhTG01ZVBEcHo3S1BpV3lmZ3lhTmdm?=
 =?utf-8?B?M0wrZm5zTDhhcksxRVA3S0FoVnhxV2ZQVG10NC9IRzR6UTREeXdldzhTSDUx?=
 =?utf-8?B?azJDcFNOajVvQ2REb3lRN0d0dXdxK2JCVHo4RFUyaGZmWEdRWXRIR0haeG9h?=
 =?utf-8?B?WUJua00xb1BuMy9IdmUzV3RKMkNsdTNvR3NIejVNYkhLZWR1M2RLNkdrZzZn?=
 =?utf-8?B?L2VVTElSaGQzaU14LzRmRXBNSHNPZnZBWDZRcUFLREUzbTVCYmN2dzlUSTgw?=
 =?utf-8?B?bGZuZ3ljVytTeGdiTmF1Q0hOQnJ5YU1ycDJtVmJoRnlRRThycExvbmtTa3dE?=
 =?utf-8?B?TUFjUk4vV1N0OEhIdkhvb0FLRXYvMjdENTMzVXR4RE5iMkM3OTQ2M0JWMnZT?=
 =?utf-8?B?Vks0MlJ2bnkyWFJSOHFEa1ZWU1pTdHM0YkpjOTJVR1k4QWNkM255UFFESEVt?=
 =?utf-8?B?STBodCtpNTNoamJEM3FNSGVYaUVtKysveHNYZ3FxSi91d2pTa3lGNW0vWkFn?=
 =?utf-8?B?UG4vcisyNlcrMGVDNG5ieTVxOVBVVEMzSm4zT1BMZ0dPLzREcElkQ0w1dDN5?=
 =?utf-8?B?VDlLQmd2c2huZVQ5ZVVyRVZCMC9vZmNCNlA5QXAreDJySXNIQzFCRTU2N3Fq?=
 =?utf-8?B?Q3R1enJNbFdONExTUzErdE8wL0JoTUFnMUhkQWVsWnc2WFBKN0Y0dlMzMHZC?=
 =?utf-8?B?cnZ4dmFpSVh3ekxkRHp2bld4bEthcDNWRWg5SzBrRlN2eDBJWk5qRWFZQVUx?=
 =?utf-8?B?Ykd0ZzdZWjhrcHBscTNadVRkNWUvV2VLdkVNVWo0MnUzYm1sRDF3RGFVT2JR?=
 =?utf-8?B?UVg5TDdpQzFYSFdkd0Ewa25QQTZDR0VzVU1NOHNkYlVrazhHd2UyWWd6TTVP?=
 =?utf-8?B?WUpNc1hzZUZ1c0VSTWxQQUViRmZacENtdHJhdElvOUZuYVB1MWQybkxVTnZJ?=
 =?utf-8?B?M09VRmpmQTBKQ1VyTFhYUnp5UjdyRHorTHkwSHF0RWhXVUZGWGZxRjVvZlEr?=
 =?utf-8?B?bmkyckZGTG9UeTRSZm9SL0U0VnlKWXl1OUFBak1KOWJrSzVUczhQOERaK1JG?=
 =?utf-8?B?c2c0dU5scEZxVHVWK3dPQWRmUmtwUmRObi9aeTJpejc0M3Z1U1dlc0ZlSDZa?=
 =?utf-8?B?Y1dOMWtnM2p5alBmWUpkeGZqNk9yZWs4eG04c0ZCUHNaUWo2Qjh4ZFQ5Zkx4?=
 =?utf-8?B?TVJPUEl3NTJ5YmtMV3daZ2JMQ3NnTnFockErUCtmaStCYUdoRXE5SDF1SFk1?=
 =?utf-8?B?Ny9XQnhnWjcxTktuUW5WRG40MjI3Sk1YTkdCb3RtbjlmeEJQU3paUlF0YVND?=
 =?utf-8?B?SlVJZjVwOVZxclQ2M3B3MmtYSDRpWXV2Z0lWNWZQYnM4cTd1WU5uRjdXc3BJ?=
 =?utf-8?B?YzNOTFplSFQzRWtISVF2OFc1TVVOTkFqOEl4UC9KVk40Z2FXUVZwRkFwZkRR?=
 =?utf-8?Q?fr7UtQ7FHsd9vXDxnbI7jOYkljtP9oS4k31ai2zBpq4i?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12189
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: d8b3a5f6b9ef4b2f91c1abaded6348e6:solidrun,office365_emails,sent,inline:10be8686da63a4de695eb0fd74d4d4ae
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3793061b-8250-4d14-a2a7-08de567c690e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|14060799003|82310400026|35042699022|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWs3ckxhcEpESFRZbXgrK2NWdklSRVVJZFNMSDFMVGJGUVRZY0cvMFRjUUVQ?=
 =?utf-8?B?V2tWaUk3aTBVaDh0TC9rY3JRaStUM0xqaVRtS0hqY1hzWE5lbUQwNlhRbkJC?=
 =?utf-8?B?TFZwaWsyK2lyOWZDek9Kc1FPUjhpOXNFdkR6REJydkl5YjYxNXl2dWVTRVRw?=
 =?utf-8?B?YzI0WmwyaEloRGEzUXJwRlUwWEo5RCtUZUJ6L2UwR0FGcHEvdzdNcnd0OG5P?=
 =?utf-8?B?TFFaY28rTWlhNFczbitNUUxjcUIyYnJnWVF6dnB1YXVjbCsweHNyZCs1OUlw?=
 =?utf-8?B?WHk5T1hJbngvdVlRYWlJeDJaTm9XTFdybUhGQThCMEgzZzllTk0rclgrOE96?=
 =?utf-8?B?Q2VZVnRaM0hBOUJtNm1lKytpVkNiUEFLRGJ0YnAyK3ZZTGQxSE5GSGpCdnJI?=
 =?utf-8?B?OGFzVFdhSE5QOVlzdXYvK3dlUFFES1V1azg1S05LUmVCd0pwSlpkZ2N3SkhZ?=
 =?utf-8?B?ZnhaazJldkp5L09zL2xVRmYwa05LaTNQUnpIMk8zWGNKMkZGWlo1V2NSdTJN?=
 =?utf-8?B?VVNZMStaYThaVWVCRkk3bjNyNkFTVWw1Tk9Da3NjaFVKSFZreTdwN21NdGNo?=
 =?utf-8?B?R0lYa1NjdEVWMGs0TW5mSENZU0p2NUNOTk1OUjhackVRQ0lkaUJ6UWYydkxL?=
 =?utf-8?B?ckZFeVBQcWcwV1VaeVd5bWg2SzVEM1htM3pkc0xjLzBlR3ppSm1XcU1YNldJ?=
 =?utf-8?B?RW1BcFdwZStXNm1GdU52RXUvaFR0bFhIOFFtMGNEaUVwZzJTTi9td2laOXE5?=
 =?utf-8?B?bm9FbXExcm1uMGVIYXNWbEgwYmRZRUhBUWhGN3RCWncvd3Npdy9PU1R2cVJu?=
 =?utf-8?B?ZWFsazJ1UVdSWGR6N2xsRjFqR01Bc0NiZkNiMkZIRjUxeHAxRWZ1MXhibVUx?=
 =?utf-8?B?Mmt5QVdzUXlvclc3aWNqdXVhb3lYdlZ3WkRTTFJNT1JRRW9iWWY1Q2hzamlJ?=
 =?utf-8?B?Nk92MXVFb0JyTVY4Wm8reDFBZlQxdUN0dWl2L3BRV3pVWERZcTRvU0s4NlFv?=
 =?utf-8?B?Q3kzUjY2c2tGLzlhcGY2eVJlb21tUHlhWFltNERKbElWZ1QzWHhTbTRHa0tw?=
 =?utf-8?B?dVoxY0o5MG9PdlkyaUZoSG9hSUVIUG5zTkV6Zm5NRHNObDVxdmdxdVRhS3ll?=
 =?utf-8?B?S1k1azFqVDYvS0plQ1ltd0w4cm01ZGJuaVI1UGxqUzlKSVl6Y0tSUlZVeldG?=
 =?utf-8?B?QVAwbEF6am5WRkhYV2lnajB5bEJRanRhaGlNVkRpTThhcGpjYnk0U0NxUGNx?=
 =?utf-8?B?RGpZNllZb0FGRU9Ca3RhREtHaWlUNjNFMEpIRGEwY3plWlB5OHpLeGZTM0U4?=
 =?utf-8?B?VkQ1VENWSHJDK3B1dG82T1g3VzdScHhOWUJtVTR3d2lMRm0vVkhIVHZWOHdm?=
 =?utf-8?B?akJoQnJ2Qm85YTdtL1l4YklzbWJ4MmkvcXRWaGtIYkpnYnZRaG11QzBybFc5?=
 =?utf-8?B?RGU2TjdQS0VhZzBEV3JaNUd0RmswbEdLaHdKeXlDOWlyV0RmYzY0K042cURC?=
 =?utf-8?B?ai9yZ1F4d25NZDRoS1VxN1h2VVlxWTI4OUc1cENCU2hkNVp0K3I2UFE4RlVU?=
 =?utf-8?B?L3NvcWwvOXJvVjFLWjAwd211ay9veWh2NDM0SFZSWTBlS2dzZWJ1QnNaQU5B?=
 =?utf-8?B?Z1hTUU5ManY4Unl5aE11bVIwS3VpNzROeEpzVVpLdW9VNDZLNTl2cnlYOFFY?=
 =?utf-8?B?RDlQOFJNUGNCbVgyTFZIMmptdU85MitjL3FTK01xWEtHYWZuVHd5K1lDcC9i?=
 =?utf-8?B?am0wV0JsNlBNcm90R2ZtOGYzQjYzdjJvbXJwOS9PMVZ6RFVIRXlqSVd2cUcv?=
 =?utf-8?B?cmNsYnBMb1gwZi9vVis4SzJIL1VSaWNLNVZmRkpZL2NmcldPOVVKOFhoRDQ4?=
 =?utf-8?B?QkorN2lIbXZvUmJrTi9xSW1DV2lXUGVwalFxeG00QzVzUmNvcGNsaTlaK1dW?=
 =?utf-8?B?b3lOSjJYYmt0a0xnL2g3aXQ0aklWSUlyclZKclovKzE4Z25LNzNsdTd1aVB1?=
 =?utf-8?B?TWZkdDAxUFFkNy83UjhUcWk2elVhS2lXNG9nWlNsTXF6Q25lQ1hyOHRHMDd0?=
 =?utf-8?B?cEJXczByWThFWmFZVG5Fd1c4clJDdjFlaUFxOFZvM2w2TzBGT3Q0VmxqMC9y?=
 =?utf-8?B?NlhxMXlaN0laRHowSTdRZFAzM1UySlRvK05kSlFid0k4TE8yY01LU2N2N2lL?=
 =?utf-8?B?UVlYdE5VekJDcXRQQVNpMnB1ZzNxVzVQZ3RQWS9CQWpTU2ZiLytaenp3VklO?=
 =?utf-8?Q?x85AeaFM+1IxsiJm0NhnY7QNao/uO/4Rxoq9D2CpQ0=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(14060799003)(82310400026)(35042699022)(921020)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 10:29:15.4776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fec86000-6b35-4b7a-8266-08de567c6e09
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9811

Some Renesas SoC based boards mux SD and eMMC on a single sdio
controller, exposing user control by dip switch and software control by
gpio.

Purpose is to simplify development and provisioning by selecting boot
media at power-on, and again before starting linux.

Add binding and driver support for linking a (gpio) mux to renesas sdio
controller.

Introduce generic helper functions for getting managed and selected
mux-state objects, and switch i2c-omap and phy-can-transceiver drivers.

Cc: Yazan Shhady <yazan.shhady@solid-run.com>
Cc: Jon Nettleton <jon@solid-run.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
To: Vincent Mailhol <mailhol@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Peter Rosin <peda@axentia.se>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Andreas Kemnade <andreas@kemnade.info>
To: Kevin Hilman <khilman@baylibre.com>
To: Roger Quadros <rogerq@kernel.org>
To: Tony Lindgren <tony@atomide.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Vignesh R <vigneshr@ti.com>
To: Andi Shyti <andi.shyti@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-can@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Josua Mayer <josua@solid-run.com>

Changes in v5:
- implemented automatic mux deselect for devm_*_selected.
  (Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>)
- because of semantic changes I dropped reviewed and acks from omap-i2c
  patch (Andreas Kemnade / Wolfram Sang).
- fix invalid return value in void function for mux helper stubs
  (Reported-by: kernel test robot <lkp@intel.com>)
- Link to v4: https://lore.kernel.org/r/20251229-rz-sdio-mux-v4-0-a023e55758fe@solid-run.com

Changes in v4:
- added MULTIPLEXER Kconfig help text.
- removed "select MULTIPLEXER" from renesas sdhi Kconfig, as it is
  not required for all devices using this driver.
- added stubs for all symbols exported by mux core.
  (Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>)
- refactored mux core logic to silence ENOENT errors only on optional
  code paths, keeping error printing unchanged otherwise.
  (Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>)
- picked up various reviewed- and acked-by tags
- Link to v3: https://lore.kernel.org/r/20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com

Changes in v3:
- updated omap-i2c and phy-can-transceiver to use new helpers.
- created generic helper functions for getting managed optional mux-state.
  (Reported-by: Rob Herring <robh@kernel.org>)
- picked up binding ack by Rob Herring.
- replaced use of "SDIO" with "SD/SDIO/eMMC" in binding document and
  commit descriptions.
  (Reported-by: Ulf Hansson <ulf.hansson@linaro.org>)
- Link to v2: https://lore.kernel.org/r/20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com

Changes in v2:
- dropped mux-controller node from dt binding example
  (Reported-by: Conor Dooley <conor@kernel.org>
- Link to v1: https://lore.kernel.org/r/20251128-rz-sdio-mux-v1-0-1ede318d160f@solid-run.com

Reported-by: 
---
Josua Mayer (7):
      phy: can-transceiver: rename temporary helper function to avoid conflict
      mux: Add helper functions for getting optional and selected mux-state
      mux: add help text for MULTIPLEXER config option
      phy: can-transceiver: drop temporary helper getting optional mux-state
      i2c: omap: switch to new generic helper for getting selected mux-state
      dt-bindings: mmc: renesas,sdhi: Add mux-states property
      mmc: host: renesas_sdhi_core: support selecting an optional mux

 .../devicetree/bindings/mmc/renesas,sdhi.yaml      |   6 +
 drivers/i2c/busses/i2c-omap.c                      |  24 +--
 drivers/mmc/host/renesas_sdhi_core.c               |   6 +
 drivers/mux/Kconfig                                |   8 +
 drivers/mux/core.c                                 | 175 +++++++++++++++++----
 drivers/phy/phy-can-transceiver.c                  |  10 --
 include/linux/mux/consumer.h                       | 111 ++++++++++++-
 7 files changed, 278 insertions(+), 62 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251128-rz-sdio-mux-acc5137f1618

Best regards,
-- 
Josua Mayer <josua@solid-run.com>



