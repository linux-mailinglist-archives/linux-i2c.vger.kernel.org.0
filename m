Return-Path: <linux-i2c+bounces-14840-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D64CE7099
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 15:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAB743028DAF
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 14:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5C2320A0A;
	Mon, 29 Dec 2025 14:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="aVEbbX9n";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="aVEbbX9n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021132.outbound.protection.outlook.com [40.107.130.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A4131ED92;
	Mon, 29 Dec 2025 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.132
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767018480; cv=fail; b=NLlUrsOQ6Qi0AsrWefsgLqMS4kxm3OYYt9xSdbhu9ZJYKpXeBGLYXAmnOjlEWQKFcv7acEOxaRz8ARmH/1mWg3KDK6QhSeovqtG0xbWzlK+2g5qwAS3v8Rl8zidzCSDSx0zjU0HfUtgC0P8EELHZ3LGi6rG5QumjE1wODarphbg=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767018480; c=relaxed/simple;
	bh=XExX+FUKv5r78ECuH/cDqtx8omhryYh7bpYznkJRewM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FkqDAovojfFL1367XzWCKcSS1lkqcdGpncVwpmPk0ifNO9eucO+dZC8nC9Deq1gvNzzOEvHE4jepDYWFB+1wHSrcW4krVoDlGcq/bVVfZpLbD+FMBx2KJRnKj+8YGQRWzjsqbjqJ6euL3JYr7H5OqmQW4HmU5CyTD2WtUZLVUyk=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=aVEbbX9n; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=aVEbbX9n; arc=fail smtp.client-ip=40.107.130.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bLZG4Ijm9STzXVKBpfpwT5cteFRjF3YsFTtD2464g4P2RkWUUZiUA00vXjrA4rNZ4acGT+tvqAUGArgsyQ8wE+sBeDIqEObcuXgzOZeiXEyny3R7P/e/A+4y+rOElZR2gibXW7Y+MX9Xocrdl5exqnhK2iP8cVwxSx1X5r+0xJEogl1sitEaWN+sw1l2qsfFeWOfK9J7wsxUs0tqchse1QJijDmuFUQRRTYEjUTw7QaqL18sHmdHA2YV6UMSrbtldYASQyetfHHUzK2kav8qVk1l+l8cApJRXgfWlbacUXRGWwDGBZhNTE9MP363J+qMiKulKfJwhkLkUNo05PCpyA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjQdmSiC64iZzMPQlstywuKC7ld+lnkpMkzZKTUsw2M=;
 b=wR1LwF8y4wLK1Ilc+V4GNtqEe+UXtMAMP/3YJwaLdl+cJKyD4tjHX1Atd2TJZ7p2Lje2Ft1A8rhU2s1a4j9ijrpuMZZrBmNeE7w0fo2Fzos3syMSpSIOEz9G+a22VsqMMb8ctG6ecGV9+PQZeZY+lxQRAn4bzGQZHDYSKHYwI9cHq3n/k8zKlVxKRIVHrhfcAvWz6JOAeT0jrulxpiJz3SXNhE5G/J1yIuSp/zmwaKmCa+0oKu5NdtRJQ09OpgENC2o/rYToCVKHDEJ6PIEXh/5iOphrxD8Gt+s4hbdpck9asonTVwtotaG6xX7bNuD86Vocs6x7oLndGDNaMf/wQQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjQdmSiC64iZzMPQlstywuKC7ld+lnkpMkzZKTUsw2M=;
 b=aVEbbX9nE0msHQ6QAF3pMwbDRPLR8ghsrYy6k0XM09RgxRmCuw1n22YCCorx1q6YdmBSy0XdG5JhKMbciynGbzCaa8VUh+IDbkwuEbrYGCsBwg1AMQkVDhjEKAOtF6e+wG/jucaGB36oLP7Ezfw1HdHPmjpuxtY2+kkVGwT2JKw=
Received: from AM8P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::19)
 by AM9PR04MB8305.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:27:55 +0000
Received: from AM2PEPF0001C717.eurprd05.prod.outlook.com
 (2603:10a6:20b:21b:cafe::c5) by AM8P251CA0014.outlook.office365.com
 (2603:10a6:20b:21b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 14:27:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM2PEPF0001C717.mail.protection.outlook.com (10.167.16.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Mon, 29 Dec 2025 14:27:54 +0000
Received: from emails-6921961-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-157.eu-west-1.compute.internal [10.20.5.157])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 8C9E2803EB;
	Mon, 29 Dec 2025 14:27:54 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767018474; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=AjQdmSiC64iZzMPQlstywuKC7ld+lnkpMkzZKTUsw2M=;
 b=pt+dKuU/yTJO4+QeOQj36EbolUrL8aYY2g9KtaCnH0OZePFq9G+4NerY3yTm8OOSDDjTV
 GwMNUe/lx39ctrw6RlCM0jjAp30LEreDHPjo1zjWGs4EqVXaLcuAbDezyNOluPGlPdqZIBf
 LQgdUyAO3rp4JTR1fYnWKcaA8on3N3Y=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767018474;
 b=qX4jLYP+cJih/0CRjln6mzkrzx5QtvozBmy9LYnCMxQ2HP7uXPuQy7+NciIFAyHUve91u
 6lzh/0pymp5C2osknSBJvdr+ZnYu7ckIzH1nIpfoWudrxJ+AiuDSA28XIWZpApnHGmhb9aF
 TqnpQ8F5N347kdPugVVheMqGq+8PV/8=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6z7GmX73YfyopmRth5NUAnQZkVK+NM3b8jal9zKhpmUk3KU3zc+m9S2fjZWRZvCqs8jitO0jaD8xpPZ63yKJW0AzLad1Hoc7FVD0wzRxJLoSz/k2lZqB31tEj7fjpJPHy2W1raDomZ2rWg5Z/EHXTPHyLu4XUAoNCoO3oHSo2XxacuWPv8ZsJWYTpsnXpHr4G003Zr2bwnl/thXJPzyjDzh1XRGcLf4xML15Ypb88j8q/L6rWjLjjFR/lGla0BZo0YuJd6WGhBHnvWPvP+Zi9wVmBYUatCJj2fhUoXbFAAMl87GCVKBiNs4ZslZp9/mkJ8qtvQ4YiCd5DY+n3JBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjQdmSiC64iZzMPQlstywuKC7ld+lnkpMkzZKTUsw2M=;
 b=O5fXqlWi/UmeUi3Md53vRJiQ7gT/MthPrt8NvJN+A9NgMuZgwvq8EVaOHvr3HlTJGZxPwNailhnE105eQOXgFiC4attew9JRY1g9XgOFCStv/a5vkOrefYN+oGibmq4rVS21c2Ac9kqjGrbU63Fyjckf3cGs2n3tsEs2+qGaNb/utQ2QO5F94cK6nrB2DI6UxwK2dCFCpSQ6pHMWdOAiUM9wDwRLob4m7eYMgw66+dvq6h6rekhj2jYxTld6UXHKGqiUITTnf2e6037R6oEgznY4u6D9Gv0CWzfntxo1yK03glhlpXdqPFHowGh5mk+0mZVETgXtSNtg6OTU3aXIng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjQdmSiC64iZzMPQlstywuKC7ld+lnkpMkzZKTUsw2M=;
 b=aVEbbX9nE0msHQ6QAF3pMwbDRPLR8ghsrYy6k0XM09RgxRmCuw1n22YCCorx1q6YdmBSy0XdG5JhKMbciynGbzCaa8VUh+IDbkwuEbrYGCsBwg1AMQkVDhjEKAOtF6e+wG/jucaGB36oLP7Ezfw1HdHPmjpuxtY2+kkVGwT2JKw=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:27:41 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 14:27:41 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 29 Dec 2025 15:27:27 +0100
Subject: [PATCH v4 3/7] mux: add help text for MULTIPLEXER config option
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-rz-sdio-mux-v4-3-a023e55758fe@solid-run.com>
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
	PAXPR04MB8749:EE_|DU0PR04MB9417:EE_|AM2PEPF0001C717:EE_|AM9PR04MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: ee94d211-4d69-406b-baba-08de46e674d6
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|366016|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SUkreHdaUG1sYll1SG12T0thZmRxa1dsdlBoZVBBeVRFeG84OUtRN0hrMmtI?=
 =?utf-8?B?dFMwMllIeEc4ZW1MbFhabklOZ2tYOW44Y2pYWGo3Mk0xUzQydzBEQThTSkZ2?=
 =?utf-8?B?ZnpGUkVadDk1bG9hYUJaZHRFWkEzWDFFdzVVZkVnNlFvaTVmMm1haitNdSsw?=
 =?utf-8?B?TTVpazZQT3ZzV0N3UXdVVXYyZDhrYzRQb1FjaFJjUzJYRGxFSWdJS1RFRjc1?=
 =?utf-8?B?RWlNZk0vUzlHd3NucHdQa0V4aGE4bTF4UHAzM092U3BaSTJ5V0k4Q0wrQmY1?=
 =?utf-8?B?cExZMU8wRS9tMnNMS3lSb3d4UEpjM040M2VMRG5MNGZaL0JudXRGV2hxTXlu?=
 =?utf-8?B?elUvbWx1aUpXK2RqT3BJN0pwa1FUbnJvYVFSN2xwakxTS3JXTUJzdTFUSFA3?=
 =?utf-8?B?T2FSSGkwNm1ENm1TQ0FEUXdCbnY4eityYTdwL3JBOUp0WGhSckoxUGVVSTRQ?=
 =?utf-8?B?M2FpcmNhVXVMZ0tQVVJuRHpTQTMyeHZHTkVRZXVKYkl6cmwyQmNvMjM1VWdo?=
 =?utf-8?B?RnBGWU94djQ4UkJRRWdteExYRVRNQy9XRlVJYnpvb3lQR2MrSnhzWStobk53?=
 =?utf-8?B?SlZjb3d2ZU1SK2lUcnU2UENBL2tUQXh5WE5MVEhlRGtVSTlscWRFY045Q3Vv?=
 =?utf-8?B?YkdwMHNxMWpPcWYzOUl3Ym9zNkFISUdvMTloMUpSb1p1OWdQc0U2Vy8vL1Rt?=
 =?utf-8?B?cEJBVy9VNmM1cWtna1hhaTdDUDVRbXdoazNYTjNvZ2FrOHhIOFRTVzF1TE5y?=
 =?utf-8?B?Rnh4SGxSTmtEY3A0R3dZaUY5MXRqdFVQMzBEOFdKaG5YRHZVZmpLbzMwZGNq?=
 =?utf-8?B?MXEvcUlrUTJjYnBwZjdxWUxWNGFLRStGWXhzdnNSVFhya1gzN0c5S3BoTXN2?=
 =?utf-8?B?ZkhGa3J3WHRraTRhVTBSS2FaM3ZEN21nSnBBN1RGWVNtbm9qK0psYlZMdGV4?=
 =?utf-8?B?NzRncTZpeEIyUTFkQnhyYzdxcXJhNDJTb0F1aWhDSXZ2Y3lQMzJ0MkF5VW1z?=
 =?utf-8?B?REh3L1lhT3F5czA4bzBBejBkQW4yTEh1dUU1Z25kRDZ6ODdTTEtaR2x5OGRI?=
 =?utf-8?B?ZU45NUtFRHhmb2RDQ3ZCc3lVN2VLSU5mMnJNaWFHT1ZWYlN2MTFIMyt1RUZt?=
 =?utf-8?B?OG9acDJ6MWxMcERsZUJva2l3bFJPOWEyckxWa2NQa0FadUx6dC9iMjhmUnRC?=
 =?utf-8?B?cHgwMUY1b3ZxbFZtdmpTN05kRU1LRys2Uis2OVI1c1VXQjlZazM0YVE5RTNL?=
 =?utf-8?B?ZFZ0aGgvcldoZ21qbTJwck1CVjFmWVhYKzJxaFRwdkRJTW0yelBwb1EyYThp?=
 =?utf-8?B?cmRUcjNmZi9FaThOVTkwNW5td1ZyLzdQN21RVW1iMlV2VTNDYUtMK2dFVlFm?=
 =?utf-8?B?VHRXVkFzQktDb1ZaWDdaVTVlQkNtUThCS29tenlFMjk3VzBaZkNvbm9DdFhB?=
 =?utf-8?B?NXhyVFlGdjNUNVBreWNHbS8yZUhFR0Zlc1I3ZUp1RkwrUFB6Z3hXZ0ZuWUwy?=
 =?utf-8?B?akpDOFc3bHBXaDBDbE9MekovYjJGbjRzQVVJdzBOOGg1SmIzV2pjSC9uSmhs?=
 =?utf-8?B?ZWE1U3h0TlRQRWJKN01IYzFlemdQeFBXVi9SV0V4cTR5ODhveUtodGt5dENV?=
 =?utf-8?B?cGRSTENGVm9EelNPYk5OM1dxMEJFK1NWYWp2VUM0clhwOGV1ZjlvalF3b2o3?=
 =?utf-8?B?M2FuUmJaNGo0ckc4a2xYRUVybFIvYndxNHBrbzI3OWVjUEgxTDBmNkVOb3pr?=
 =?utf-8?B?ZWdlUTlWaXJSYzJMbEkvVnBuSk9jUmxnQ3ZvNEYrYlVFWGNrL01Td2Q0dlJR?=
 =?utf-8?B?czVrMjhqd1orV2xZaERGdWdya3BSQzlPRzZHQ1Nka2ZPOXhYNEVkVEFTVUUy?=
 =?utf-8?B?eTdYWkRxT25YdCtnejNIM2VKM1NDWllXYlE0RWIvYjVReTk5WHFLT2lGalc5?=
 =?utf-8?B?Y2NWb3VHYU5zYjFzVGQyQ2FqS3Fuam1kbEdxN0ZGQjl3MzdHMXU4bUZ2VUZY?=
 =?utf-8?B?SWhvZjMxcHBIdFpvWVZ5cGR1NDBtZFhCdWNkcHpwZXRSMFlQN0x1bTlZRWxG?=
 =?utf-8?B?bkFxUitqT1dWOEJWaENMT1lDaEQwL1JVejNMZz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9417
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 63f8a1a54129419b893b798c1ff61e5f:solidrun,office365_emails,sent,inline:645ecd6cca06b82d0b30cc7ad8f78726
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	27cfb268-ecea-4442-ead2-08de46e66cf6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|7416014|376014|35042699022|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGtRV3VPQlVTdnRSOFJidDZIU0srRysvWUdJM29NYkZ0anlkNUhJN2g2clZI?=
 =?utf-8?B?K2FlS1lHNkd6Tyt3S3FXR21STHVsTHVZNlhEeGdPWW9RZVFteXBJRkpEMTN0?=
 =?utf-8?B?NWJ5eEwyNHJFRjcxb1R3QjNnZUM3SkZoUDcvL1cxWFI0MjJxWGMvWnBoeWNr?=
 =?utf-8?B?WkQycExiTFNqN3pnVFhXdG1lZWF3WFhueHAvNGlYV25CRUJ0anNTRExPWWcw?=
 =?utf-8?B?MFhYRWg0VnZYUllzTGhCNmlnVnFFOENZTGEyUU40ZW9HUENpT2M1anZaSCtT?=
 =?utf-8?B?ZlJSK2gvWWxCSGY1SjBYbkhLNUFhdi9OSVU3NWlmNmNXV3dKQUw4bUE0eUVS?=
 =?utf-8?B?MmE2Ujh6b3lyNWFoZ0VUY0htd2wrKzRiUXRsV1FGSFoyOU5SblVBZkZNbHAw?=
 =?utf-8?B?Y3IvendoZVF5bnorTlJ6RnNzNmt1RzhWcHhkSDRraFRFUnRGcTRZRXRXRytw?=
 =?utf-8?B?clVaZkJ0TDF3YWd0MnhSak9NakdaRnhWUk4ySnhVN1gzQkI5S0RhUlNVeGl2?=
 =?utf-8?B?anNCdkU0S0MxMXcxVFE2bk0rbTN2QmxueXE1czZHamxQckYzRXJ2VWQ0bjc5?=
 =?utf-8?B?TGVuaGMwbk5DVzBHUHAxdXFUNjhiaWhYVkJPbmc0K2RWT3dBMTBDYWJFUktn?=
 =?utf-8?B?MUMyMHpVTFJiOHV2cmFzN3BJY3c2Yk5XMkIzZEdxcmk3aTR4M2k3dURJS294?=
 =?utf-8?B?TFZrMWhiMTMveXNtOU5pVjU2THZmR2liRHN6MkJ1UUN5R3Z6VDdiOFQ5dnVr?=
 =?utf-8?B?V1RZVElwV1RsNVoxOGFlaHpobDk2cXptT0h5SWRxcWlQYXBTU2paU3M0TjA1?=
 =?utf-8?B?YkVUNEc2TWp5MTJiZDdZRFdxMG1FRXV5dzh2WFE5N0ptV1ljenFrbDBHMFpL?=
 =?utf-8?B?QS9Db3VsT25GdFUvTmpwLzV1UytzS2I0b3g3ck5IWWQ0STkybFpUdFRVbVp4?=
 =?utf-8?B?bUFtL1FOTlRlbG8xRWFwWm9sZExUdTNnMUd5eWhJUnhwTFVnUjlwMzZSVk8x?=
 =?utf-8?B?RGxQeG16K3c5VnNCU0pLYjRIbWVxZ2psZGRUZ2Q3WmFuSFlJM0FKb2hYMkZh?=
 =?utf-8?B?UlBINnFBMUw5WEZ2YVNZU081amc2MllKbkVHUzJIR2g1UVFPTGhJbDlzc0F6?=
 =?utf-8?B?THhOVUtkV3Z3cG53dHprVEIzSllFNHVyNWI2b2txbmljS241eGVqdFVWQjVa?=
 =?utf-8?B?b3JiUDhLOEFrS2tzcmxvKzlNWUQ5VVl2U2pvQS9Ca1VGTzZRdTBLRGtGK093?=
 =?utf-8?B?VnhnNDRnUGsyK0Jac21uaUJBZXRhb1pRVmNZZVB4UnVCNE5idUkzbWVnNXNU?=
 =?utf-8?B?VzNkSktUajNYcUdVdEZ5TEdFaVZyYnNZUUkzRGwyclJFSFBjVm9YbFFqa0hC?=
 =?utf-8?B?SHcvOUhLWHRJL29CdEVKbmEwTGFMOVNTdkNNKzRTNDJ0VWZFZHN4QndibGIw?=
 =?utf-8?B?TmNLQm9oRG93U3RtR3NyUnR3ZlpzaUR4akFwdlcxZVRYdXhEU3NmVmQyaTBo?=
 =?utf-8?B?S2dwWVpKRVVFc2ZDcWRMNHc3WHhKeFZKTE9XLy80NTF3Y1VCZk9JeU5QblJT?=
 =?utf-8?B?cC9RWVhjRFc0TWlOTkZmZEJOa3hUQk1PUVhHdlloYTVKV3U1VU9JaWZxNHhB?=
 =?utf-8?B?OHFlaEppNitPYml2VmFkRTFyOXUycFBhWGs5Ynd2K2VRazAreTJKRUFMOVlD?=
 =?utf-8?B?YXNjMmN6RnRHRWRGNTRtTGo4QjhJakZZWTJ4MmlManN6bW1kUzh6VlVFVytY?=
 =?utf-8?B?VDJOZno4YmMrZkxEbHpBLzZuVmxZMm1kU3NUOXZTYjA3VnRvVTc5czhwaEtj?=
 =?utf-8?B?STJnK0JrLzRvRDRGVUl6UWROL0NZQk9od1FVTGJRV2p2U1VzWDFTeHRqRjJW?=
 =?utf-8?B?ajh5SC92ZG1uNlhYYURnMWUrV29hazlCTnZHNGI5OHZJN0s3bHd2RUs4TWtO?=
 =?utf-8?B?cW52KzJLQS9JeGZXcWY2c3hzUUxYNWMzaGNZa0FhdUUxNjJUUHdrS1ZobGR5?=
 =?utf-8?B?Y284TTFCSHdFY3c5d2w1VlZURnYrdTFEMWttZCtPMjNuN3RRTG0zZHlKNzg0?=
 =?utf-8?B?bnEveDRFejR3aTBnK2FUbzF3N0pSR2t0bXViUWhETUhnZVJic0ZKYjBFZ010?=
 =?utf-8?Q?BG3MMOsom+kkhMF9jhPg3M+G+?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(7416014)(376014)(35042699022)(36860700013)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 14:27:54.8847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee94d211-4d69-406b-baba-08de46e674d6
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8305

Add help text for CONFIG_MULTIPLEXER to allow enabling this option
through the kernel configuration without explicit "select" driver
dependencies.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/mux/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index c68132e38138e..b2e1abc7c9104 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -5,6 +5,14 @@
 
 config MULTIPLEXER
 	tristate
+	help
+	  Generic Multiplexer Support.
+
+	  This framework is designed to abstract multiplexer handling for
+	  devices via various GPIO-, MMIO/Regmap or specific multiplexer
+	  controller chips.
+
+	  If unsure, say no.
 
 menu "Multiplexer drivers"
 	depends on MULTIPLEXER

-- 
2.51.0



