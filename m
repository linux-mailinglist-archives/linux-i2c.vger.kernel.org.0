Return-Path: <linux-i2c+bounces-14494-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D55E8CB3AA8
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 18:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A8EC3077CCA
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 17:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B4A327798;
	Wed, 10 Dec 2025 17:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="D8qtKwN9";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="D8qtKwN9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021102.outbound.protection.outlook.com [52.101.65.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6764732720D;
	Wed, 10 Dec 2025 17:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.102
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765388368; cv=fail; b=Pw0TeE4FIaHl0HZc14OZN3WsjYvhwsAr+7g+bZjwv3I2cKpYs7f3gpR2JmVtWrSdbWjuSu7Rr8oIBteaZMqrJ9DibNZrth48oDMbJR40sm2o35ODoXZQfdz/ENSdIrR/IXt9LD3p4ccwX5wuV3rPKmBrD8hR+JeSuOmTFbY5uOM=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765388368; c=relaxed/simple;
	bh=ZKXxFr9J9/9lYwpzoyiums354Qv/n/UYGnwtjMTe0wQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=pPW2Q1DkNRtDN0KizLVkSb/26rFmmxMf/ER87U5x/5b9k5/mKhmGf465/qhgD488AMuJkQIboXXumxndNAQ6GcTq8uXT78QGHdGKntFUkH+DSr2apRfoYEw//GUAPyhnDuAEumHVhKnbuI4BWCxvOmioDzVGuIfzjq2KupKnHXk=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=D8qtKwN9; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=D8qtKwN9; arc=fail smtp.client-ip=52.101.65.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=e4Zpe679vTb0kwo09EwBVdLA71XwQkbkONGtOD683ui5pMhfz51IUF0tiEBCtx17IXyArP1rCqSJhFtEDy7NNvDp6GcunLvVqX+EsYoTHMAtbLdDM050GFqf+QxmvbG+JubJMp1z5fO8hgYjGsHAokuXn2s5VjsuZyaddmxhbIGwo4Bhykpa0chUGHDNmklBX/bDbbt0M6t6XyeeNaSS2YxZzJU3KIThkRzf0JNwhcoJz3i+LfmQfBVLGvAjqbc39KrfTNmZ/35fGsYlgKdGsiOVaRUjoURDGWJ6GkR+h7UREOS2NJgW0WBUYmDfSLxvbqL9k2Yx9uub9n7ZqUWrEw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DOEqNVG+/MY3fXFI+rsM6fYIi9jv9ugD7hifWAO2d0=;
 b=Py8U/oHO5zZ+yqad087jiE68MxClI6raSTBwdm5rgju82g56+QOF1LZ+3JTP6uC70MIgZWyTV4vIeOXIFLPDQYvTSuNtObA+Z1105qME7mpFViFY8TAivuspctxFmA7Q3CtxKndkbOfEIlL7L4O7BKR7tyrBIneHLkWphGKkG1yZhSAnz9RLZe1tyJLHHujrAOoKmMjmI01meLIFGa/gYb1EWYD29d/3EUVC99NYWYBpf7XXFTFVObg5mV9tJ+CeCMNPC/s2YEM+mWHvpSxy/zblFMxL02glh2N3+S3lU0rbE6ATp5r7Fp2v2YNjreT0AE92z5rGRdVMjq3XxwO/bQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DOEqNVG+/MY3fXFI+rsM6fYIi9jv9ugD7hifWAO2d0=;
 b=D8qtKwN9y4Hzb7Fe8/lbOFtUY6sXRx7eZrwHrv/CYP6YMUbxHSW0C9593Qxa9+q7Q1+Nw068l+b2Fv8sWULzqm205HK/xKSWscmIJZHdTa5+He/TqV4u4g2SOBXnhMXp9305BDNK3ziDyO6LJ8DqPuM4SA20OoyKY47eFGUixEc=
Received: from DU2PR04CA0315.eurprd04.prod.outlook.com (2603:10a6:10:2b5::20)
 by DU4PR04MB10362.eurprd04.prod.outlook.com (2603:10a6:10:563::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 17:39:20 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::27) by DU2PR04CA0315.outlook.office365.com
 (2603:10a6:10:2b5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Wed,
 10 Dec 2025 17:39:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Wed, 10 Dec 2025 17:39:20 +0000
Received: from emails-8269817-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-47.eu-west-1.compute.internal [10.20.6.47])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 1A6BB7FF8A;
	Wed, 10 Dec 2025 17:39:20 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1765388360; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=6DOEqNVG+/MY3fXFI+rsM6fYIi9jv9ugD7hifWAO2d0=;
 b=mrfQTSVnTvQ/IHTZ5shkuIi4FBCWrCAimlH343TIzLnDD5SXDVjGRALteAhEsk56cZYeA
 Sws9HAYQx9BsgOlVaXskxjDS5YTGwmUpk9LP982fJ3vkwEI3N0fNJAOrFkag5IKJzPrX4ni
 Fyjk4TKnj/a3H7l0z82ZFXookMXt0Hk=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1765388360;
 b=J0bVmzpSgxMhffPTukNgYXz3YirIhBrzSX60E5lvec0aiyhUMZlk7oUDoRVi51kbJykEH
 gVuBi79RHgP3CrWWqFCHk7/fF9xO90cQtK3pUv3qw0+U5Ei9JLxghRtuljbHfPjlGasI7jt
 r1wgs7GR1rtgAwFPqyk5fKy/20p1vZw=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nr8/JNxUXK9Hw6tXcXw5BCZLLH6//SdRqobzYFFcp06Xyu4KZya1YNMe2k3mnn7vFmUNQYmjHJ1KRiH8l+Xif4A8uYYKeb5xeB2fe6Ot7axYlHalMcA73uKum0QUpWpI0XDPVc/7R44+QzVu6PilmPM6gO9Xy7li1BK/Wdk4J+Jma8VUSReVucCSa36IG9d+AyPZTjoczo/dGpEAG5zGjT6Ol+jpmRzEfpk9NqzJpeloQEEupxGPV2zFzgPEVsgOLtvI8yc21Ptdl9HM+fgcXNhDSSVNsZXuxXikYtaMp9wSA2NKxRZ6LtpAUOKss7eLlMy5sDwcwqqC4pE8ag1xMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DOEqNVG+/MY3fXFI+rsM6fYIi9jv9ugD7hifWAO2d0=;
 b=VYN189WreS1pCgtPF1Tf90U9ro9gyuQWl1N3CRbz57qch50ZyitQ31/Gr7pbRLzXUnBHRXgqMfIEn4WluJQ8QK7JS+jyizeEpr6fSvg4N+FavaJdam44JYNsHYZkC/JuxabXLES1vIJeEwxfOA8CK19+vXBboqll9K+ZU3NVrqBz76ShLxeAOA+a1jRKU7ua/81PpHgxeePjVrpx+4eVR967ximOgIDts5RtU5P7dFmnmItSn+QJBpKctSmECbEffCjgJ7uJ7dv2vb4vGFCGxK4MxKjt0odVFWOq1bdbGwsUZ/YJBs3YiVFbemdWQ5cjV0TgkSmUAJZry61kjASDjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DOEqNVG+/MY3fXFI+rsM6fYIi9jv9ugD7hifWAO2d0=;
 b=D8qtKwN9y4Hzb7Fe8/lbOFtUY6sXRx7eZrwHrv/CYP6YMUbxHSW0C9593Qxa9+q7Q1+Nw068l+b2Fv8sWULzqm205HK/xKSWscmIJZHdTa5+He/TqV4u4g2SOBXnhMXp9305BDNK3ziDyO6LJ8DqPuM4SA20OoyKY47eFGUixEc=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAWPR04MB9717.eurprd04.prod.outlook.com (2603:10a6:102:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 17:39:07 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 17:39:06 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v3 0/6] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
Date: Wed, 10 Dec 2025 18:38:34 +0100
Message-Id: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABqwOWkC/23MQQ6CMBCF4auQrh3TKQEaV96DuIBOkUmEmlYal
 HB3Cxujcfle8v2LCNazDeKULcLbyIHdmEZ+yITpm/FqgSltoaQqEJUG/4JA7GCYZmiMKTCvOix
 RiyTu3nY877X6knbP4eH8c49H3N7/nYggAS3ZHDVhKbtzcDcm8NN4NG4QWyuqj1cSv71KvjVto
 bHVmqj69eu6vgFxas866gAAAA==
X-Change-ID: 20251128-rz-sdio-mux-acc5137f1618
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
	PAXPR04MB8749:EE_|PAWPR04MB9717:EE_|DU6PEPF0000B61B:EE_|DU4PR04MB10362:EE_
X-MS-Office365-Filtering-Correlation-Id: ebd78dab-8e8d-45b6-4e81-08de38130cd6
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|7053199007|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RWtUczl4OFkxUFg1R3lvakdiM1RRMDRiSXE5YkNrbGZjMllaQWhGS2cxbDBR?=
 =?utf-8?B?UG5QcHVWVFFBZEVobDNzVkh2b1YyTDJQTlNHdlhSdDRsS3JjSTVqK2FaTkY1?=
 =?utf-8?B?Y3g5UWNaYVoxRHFhaXZINHhKZXo0YXF0WGp3bkVWYkQ3RytPZUp1WnVLM1dw?=
 =?utf-8?B?d2tzSVRFb3pzSk54Wkg4UVhicjN1RWE3Q3ZxTEc1RFRwYkIwR2hPQzYzRThI?=
 =?utf-8?B?bHlqYVQ2Z1F4L2dSandMZDdia1pzcExZMlVkejYxamdHdUY2M0JncDN4Qk9q?=
 =?utf-8?B?M05ZN0Q1WS8zeitZR2NoVi9jQU9jMkdzOFFLNGlBSXFWUGhpUm8xZVlFOXhX?=
 =?utf-8?B?UHY5bEJZL2YxTGlMVFNDeGd0K0kzSXJ0ZjhxZG1ORmhwWXM2UjhGUDdzMXpx?=
 =?utf-8?B?MkFaanhnYXZHc2xYR2ZJVTA1aWRBRmRhOHEzRXAycWZWZEJIZHhQUXNSWDhl?=
 =?utf-8?B?WFd1Njd0NmgyMVQ3d3g0dm4xU1JLQloxeU4vU01JSlV6NGx4NlIwNm5ERDR4?=
 =?utf-8?B?VmF0ODZ1RWE1WXIvYUFSMWNmcEoyZmp3bGNaRDNwcHp5Z2FPNTRjUFhMUldn?=
 =?utf-8?B?R1R3QVBVTlM0RkhzVzcwWlJkdUVaQ1BkSmpiZmIzK1hDWEJXWU5MNHJ3dnRX?=
 =?utf-8?B?TlUrVW9uQXJCQ2RzdkFHYmpTSU12eUtPYlFDRFJNUkV2dmlBWUZWRUM2QlU1?=
 =?utf-8?B?UjdGZThmdTlDRDY3ekJ3b2p3QS9DME0yOHNKYlZjYTY0UTgvYTBZbmw1NXhF?=
 =?utf-8?B?aElSUnJmN0FsNmVNWkx1dUlqNkpOSVRKaVhsVnJEWklnR1VaYVp3ZEk5QXA1?=
 =?utf-8?B?c2NqbUtjc0l2MXJaU2JIaGJQMXdVQkVVVDRSb3pRUEhpRDJGbnkwaHBmQllF?=
 =?utf-8?B?RzZsQ05PWXQ1bkZ4b0twSm9udktXdXVxTTJHN09BSzBvR1RKZURKMklWSkpR?=
 =?utf-8?B?all6OW1aQ1FRdUJWdWZuMWErSHQ5akhCNmEzVVNoQWY0eFgwU3NWQy8rakQ3?=
 =?utf-8?B?Y3RjT2svWk1ZWHBXT01kUkRpdzZpTGdEVDRzMG1HZGRlbHNjWTB5VmtyTHNT?=
 =?utf-8?B?NitmWnhwejdNbEVkemJVWjRMZzBnMGhCb21VM0kxM0JMKzRpRVFFeGgyY1J6?=
 =?utf-8?B?bkw2dzBwSGsrZ0xzMHNvaFdQaGhOYnE0Y05jbWpvWi9ndFA3NDRqOVNaNlkv?=
 =?utf-8?B?UWFjZkhLOXNuOTlSckg3ZEVNMmhxTWhjNFIvaWwrc1VVeStLZDlUU2lGWnpX?=
 =?utf-8?B?a285aWVabUtKUTBMcTloM1M5Z3Iwajl6S0hHRytKWHo2dHMwclV1UXhLMjF0?=
 =?utf-8?B?YXcyRm05MGNtUDQrVGRtMkk1Slo0c2Jud1hPL2pLZkxoTjhRTTA4UWJrbXlI?=
 =?utf-8?B?MXV1NUloZWRtOXZpaWFPQlg3VmFzQUoxS1FwWmpwV3NOUDdEc29KczNkNzBI?=
 =?utf-8?B?VXpXUFBYOXA1THNwTHVORTJKcjR2Zmk1UVFCbFoyaUYwUFVjY1NJWTJ1YmJ1?=
 =?utf-8?B?aHV2RWpMT0xOS1F1aUc1K3poU3ZTRkMxOWNQcUkyQW5uMUJ2VVIrTDlKV2wr?=
 =?utf-8?B?Y1YrWEgzK0V5R28vcVdIcTJkWUFqS3djaFBmZDNnVnJNUVRLaDY5WHhrV2M3?=
 =?utf-8?B?Y1ljYzFHcXNTbTZHc0ZsWHpiU0RFZzBBcDlQRXVoaTVQcFpuWFRtV0l6V2lz?=
 =?utf-8?B?UDQrNmxYWWFpRytqTXIvdENsTjNJdXR1Sm9HMmdlQlhnVjNzQWtrM0F0S2dn?=
 =?utf-8?B?WDRtWGtTNHVvYlkxN3pFVXl6VDZsNlRqNlFlVkdVbG1VNitkbnF3ZFF2cUhs?=
 =?utf-8?B?Z1Z6U001cHZid1JOdnIvSFdKSWttK3U1b2g1alNkZFVRT0hENVExTVJ1ZzFp?=
 =?utf-8?B?ckZKQzdLVDZJbzUrVWhBQXRXVjdzeGFKQ3lubk4yTkVhbVl3QXh2c1dBNm1G?=
 =?utf-8?B?Z2M5clVUTlVMRXd2WkVnTlAwYUpBdWNwTGdxdFBXeG9iRXdRZHhTR05Xckts?=
 =?utf-8?B?bURxSVg5bG9EZlBZZzczNDZ5WDNLK0xEZTEwR1dXM3pHMWdnMjVqNkZRZ1k3?=
 =?utf-8?B?TUptZllUVmpRSFRIWE5oSlNYSkZuL0tVNVBXZz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9717
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 3e05007524434996a4f76be0634794a0:solidrun,office365_emails,sent,inline:e3405425bbbc305e82807fbe90c335b7
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	426d9e75-b6eb-4e0d-e6b1-08de381304a6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|7416014|35042699022|82310400026|14060799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTVhdUI0Wm5JeEdXVEJwV01yOE05SWRJSVVZNFFkbmIyaUtuQm9jVTdNbjVG?=
 =?utf-8?B?dlNseW0zSHJ2L1BFNWdBRVhpenVieEVrdTRwT1dubCtYL3lCMzdrNGwyT29L?=
 =?utf-8?B?T0pvcTZ6V1FUZzB3NlN3dVNqU1JmaVBiWVYzcUVpZ2ZJMDlUT3N4VVNEdTR1?=
 =?utf-8?B?V2o4OE1hclBYeGdaVVpQcFJCelBQVE5NN1dMdjRGNWRURFlTTEZOQnd1bm1l?=
 =?utf-8?B?bHJtd2pxY1lQT28zV2c2dEkyQzFPK2kzOUpDV0tYdURFZlRleXY4S0NOR0g4?=
 =?utf-8?B?ZGh5YTZJQ0VtUWFwb0pQbUNMck5Sb2RZN0pLTUVkNFFYTC9EdFRiWWV2VElx?=
 =?utf-8?B?cFJzSGhhMzlvSHNzcGhDZmU2VEUvUDNTeEVHMDRxRzdQTVJEWUgxeFpXNWxN?=
 =?utf-8?B?czRVMmdhVXJiL1RRaVpaLzk0WnJGdWhQd1BweUw5aGRMUVZOSnlZbWdNMjdp?=
 =?utf-8?B?ZEQwWUg0SkoxOFlidDhaWmV2aE1lblR1SEVKVzkxKzVqMFljcitnbGdYb2Nr?=
 =?utf-8?B?S3daYVUxeG1IdXd0ODhrTmF0QUFDNXp2Qk5lT0xhV0M1MFh0azdVRlNXQ1Z1?=
 =?utf-8?B?VTc2N0taQ3RNbTR6U3ZDbjliWExMTDlGMUpTSFFUM3JPbHhSV1lyeHJibzBB?=
 =?utf-8?B?ZWJiV0V5ZFRDbTJBOFRYZE1IWWVadHZCbkhjdXFnR3ovZmluaWVkek9QYmZM?=
 =?utf-8?B?UGoreDJiTFVNVmFLOEIxRzk1MTB6QnhJYUtaRllJUGN3MW43UW9iZWMrRDRC?=
 =?utf-8?B?NWRteS85MEZ3N0JPN0pSVnJuRzlJUlVwR05ETkVZVGFBTXNBdWZBaHdFL2VP?=
 =?utf-8?B?ZHdselhNaER2aGxwZnhJU2g2eDdRbVdRZ3dIUXBkZXA3V29hN1Vua3dvdjJ1?=
 =?utf-8?B?aUN6RU5kVkd3MTcvWTBsS2IwYzJhV050UzZkK3FiTitCZnJHWWtaa2N5NWZR?=
 =?utf-8?B?S3pIMUcvMTV0ZnBiSEJHUU9iQUF0WktWM2ViUDNzeVdQZ01DeFo1YnB0TEN6?=
 =?utf-8?B?d09aVGZ1RHp6STM2cGMyVTVnRjhteUlHQlZnZzBPMHJMRUwxUGc1UXVCVEZG?=
 =?utf-8?B?b1IvZnZjNCsrTnJJY1gvcmR1ZnBCa3dhM0tSMTZJalVLSmtmakhSTUtFVXVw?=
 =?utf-8?B?L2dxcmx3R1dseFpXYVVPVSsxMlhBaDlNT1RXTDRvcDF4dzYrbGVUMGZ2eVJW?=
 =?utf-8?B?ZkFHdzVDL2xTMVFDclNWTDZJWlFRM3M1cnpDRXNJWEtTWTZzckcwcUpIY1Jv?=
 =?utf-8?B?Q1llWm81d2tLRDZIT2ZYNmptd0NiV3l1R3JORXZQRXlIUGNXdHVVY3JkTk5r?=
 =?utf-8?B?NGRIWXlVVEVrTXdYSVRJLzJUTW9XS2V6SU9aV0cwSDdBZU9TVnh3YVVRb3dw?=
 =?utf-8?B?RlJYNUttelhDWjUyenVqNiswNmNQL1gyNjU4MjNac1JXZDdST1UrM3VrTHRU?=
 =?utf-8?B?YW9XRThINndIeERSYVpmbFNYck9XWmZBamc5ZWh0enlDRmx2eFNFc1oyMklB?=
 =?utf-8?B?a0ZReHk5U3p3TUpIZVpTblNNRC94OWpRblllWDJ3SW1SSFZSNHA2Y3V4OHh5?=
 =?utf-8?B?VEJoUmVtWmxPT0JqSHNvMFNsVk9Xc3k1Zmp3L0ppSnBxR1lqeFIvOVJrVjRZ?=
 =?utf-8?B?TndnbkxjbVpXZ1JTeHNCMHRSSmo0VUQwTEtneE5uNksyQmx5ZWZ6U1B3ZmFO?=
 =?utf-8?B?eStlWGlPTUxoTGJibzg3U0hKMWdRT1VJb1Byb0d0aG9ZV3BRTjRDMkljS2Er?=
 =?utf-8?B?cmRqT2dXOUtVUUFPdzZMOE1OTXYvNHRSUjNkQ2tJdmErNlFtcHpDanA1NXkr?=
 =?utf-8?B?b1I3M09ScU1WbHVxc2lsVHIrYktPSkNwMFFhbTlsK0txSDBkakdtK0FVQnNq?=
 =?utf-8?B?NFFnZHpVUm1md0RjVWw2NVRXWHlWSmlmZkw1MTlQRnJZRnZwQVZOaVVOa0Jt?=
 =?utf-8?B?VWhuWjBFcXFlc292SFNhQUR2bytkYzI5dDZzU1lEVkYya25RNVh6YzRVZnZy?=
 =?utf-8?B?TkVyVXRZNStQV1RGbjZRcnVIdkNkOHBiMGY3MUNPdS85cDNtcndveGpnaDMx?=
 =?utf-8?B?S29HdEp5U0dvUHlITUVNM1JQU1kxL25STUlTdExGa3dTYUtBWjF3VzJ1dFhh?=
 =?utf-8?Q?dBQNUbat+NtACsm6Hs6QY//GL?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(7416014)(35042699022)(82310400026)(14060799003)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 17:39:20.3653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd78dab-8e8d-45b6-4e81-08de38130cd6
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10362

Some Renesas SoC based boards mux SD and eMMC on a single sdio
controller, exposing user control by dip switch and software control by
gpio.

Purpose is to simplify development and provisioning by selecting boot
media at power-on, and again before starting linux.

Add binding and driver support for linking a (gpio) mux to renesas sdio
controller.

Introduce generic helper functions for getting managed and selected
mux-state objects, and switch i2c-omap and phy-can-transceiver drivers.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
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
   Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- Link to v1: https://lore.kernel.org/r/20251128-rz-sdio-mux-v1-0-1ede318d160f@solid-run.com

---
Josua Mayer (6):
      phy: can-transceiver: rename temporary helper function to avoid conflict
      mux: Add helper functions for getting optional and selected mux-state
      phy: can-transceiver: drop temporary helper getting optional mux-state
      i2c: omap: switch to new generic helper for getting selected mux-state
      dt-bindings: mmc: renesas,sdhi: Add mux-states property
      mmc: host: renesas_sdhi_core: support selecting an optional mux

 .../devicetree/bindings/mmc/renesas,sdhi.yaml      |  6 ++
 drivers/i2c/busses/i2c-omap.c                      | 19 ++----
 drivers/mmc/host/Kconfig                           |  1 +
 drivers/mmc/host/renesas_sdhi.h                    |  1 +
 drivers/mmc/host/renesas_sdhi_core.c               | 16 +++++-
 drivers/mux/core.c                                 | 67 +++++++++++++++++++---
 drivers/phy/phy-can-transceiver.c                  | 10 ----
 include/linux/mux/consumer.h                       |  4 ++
 8 files changed, 89 insertions(+), 35 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251128-rz-sdio-mux-acc5137f1618

Best regards,
-- 
Josua Mayer <josua@solid-run.com>



