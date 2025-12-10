Return-Path: <linux-i2c+bounces-14495-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8679ECB3A6F
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 18:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CAD393034732
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 17:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E738327BF6;
	Wed, 10 Dec 2025 17:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="BYwNKrso";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="BYwNKrso"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020105.outbound.protection.outlook.com [52.101.84.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49D0326D76;
	Wed, 10 Dec 2025 17:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.105
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765388369; cv=fail; b=gF5Il5X1N1R2cWsWSSIe7bwYa/146SwO5YQZowWcc/dpXUTNAHU6BlE9JV32FFGFbsTk/1A3O5IaQyL2E28kQxCtmbqMZDjC0e8Rx6ab+WiTYSo2awzRoi7qrSOCyrkdWlkgUoDPCfGhibYVdoKEkRqlAHl0xSaJs1kexFATv1A=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765388369; c=relaxed/simple;
	bh=2yTTSaetDHdvmncUon8SPvEX2mCAeT6Dm/PE9CGBCJw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SBOpv9/plzLiuU6mdHwQjGP7OZAJ5pi5qJYvZ09iyCd0H0wU/Jn2a+DWrHlKLF5IaT0yQ6BWvQavkw6+zFymgxrESDEyrr0av1doHJFSbg2ka8Ea3Qeis5NayJ8f+a9rSG5UtkhixpA51emWb1iNib9JrVP9cgnxq10scjHztCk=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=BYwNKrso; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=BYwNKrso; arc=fail smtp.client-ip=52.101.84.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZHO5+lSOk9Ieo8N+Sox8d8npLKXxac7PI7Nwi5aHXF+XG8JAAkq9p037jLJjNfPV/Rf5yj5hvowMZqSJgzUFSRQyGtFjYinGqpor1JLflu5+dBM3u1pSmyredT8QANE3mfU1cfLn2S0TQ62iMdoQFL1CVZcpBAaXtxyuz9cI8ouijAFtgFhmVrR8csuEDaqfrVRXZ1io3FLh+ttKlEG3U+p6FxkHit5pvdv0xSRzSw0JgACWhhgO+NhhKtYEgZXcz4mbqMSAYtSL3ZhnrAEjbGEoxT7B9jd4Kl8QxjH2rez4+tCy/fT8hk1Y4BBTTL9QcwnwcWDiD/iQgTDVpcFUjg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ej+k1ZVhRm6WFuIvf0nBMQYb2wZVgJh4J+ybsGv4lHw=;
 b=I/f8IQIpK5WQjm0Fx/9AnczKKIcZHznpFJsbtmGglI8WM61IFydAtiKETI32IsA2MDoSTCCTySyR6gJAYW+9uzYApzPvOD6zrsk1sR0cHb9+eOipHq3sPL8oJDLJu1WRKHPVCJz74M1unBfeP7YVQqTsdbxSmfJ7rRzS3xbZgH+w9wApSz9KAVczJcFCWeEYnjFgoagPvu9RFqz5J76iFK5VhnO21nyMKllXG65NvRiTXQfqxKK4THJ51186KkpMXmTPggDOl7lVYFDsudg9Eh8wSwOwgTFC0QdrV6pO5vxnFhIg0NkflqjBA3N4tX4vw0lcWW8pUaPnnajMEKGepQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ej+k1ZVhRm6WFuIvf0nBMQYb2wZVgJh4J+ybsGv4lHw=;
 b=BYwNKrsoRc/i0n1FG1pwNa3A7QfS8xTSXdAgsToCo3xw+36CIiq5ASTU5BRqzQwR4+LJHQmO+uIhbCd4rIdRqcrYPojA1IJjV7vBzj7snCiHN64+kOJ6lOnCjIZivkP8PdtiYMeBA1BpPq9Q4bNOT2OnOYXdooFiAMIyJDpmc7Y=
Received: from DU2PR04CA0307.eurprd04.prod.outlook.com (2603:10a6:10:2b5::12)
 by DBBPR04MB7546.eurprd04.prod.outlook.com (2603:10a6:10:1f7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 17:39:20 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::ac) by DU2PR04CA0307.outlook.office365.com
 (2603:10a6:10:2b5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Wed,
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
Received: from emails-9942782-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-248.eu-west-1.compute.internal [10.20.5.248])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B77C380522;
	Wed, 10 Dec 2025 17:39:20 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1765388360; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=Ej+k1ZVhRm6WFuIvf0nBMQYb2wZVgJh4J+ybsGv4lHw=;
 b=lD+VDC1YCScmIhgF/0mPVPK9JtNcwAR8l5wvS8VyXsZoOzGZAp9KYdlGlbdqBfU1wR2+B
 2B/Qhm7fles3eJ0LvUy+eRwOLhyLGk/DhAdywb4EZOVnRBtik582aWF0kEtnGy3jD5nF/Xp
 AKZTDqFsjbZWQZMCrS0sjyvR96uP1j8=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1765388360;
 b=APWDq/yf9AtlR+OycuzDzFOIAH8paTGdmxZrOR04+6aGV2CWXBtq3Fq3Yfw/YV4Btfhz6
 jhxoC358icD1q9qnrd3otkJlHb6j3BwMZhUkSTPsJdWlwH8YKWAZ8Im6eAH7U20rqr+/Aq/
 Lob1E96NeD/B3vlsTv7wiYorfckO9SA=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wg64XkYVieRD3iXkxGYkLRU+YM0PvINkfpLq7eUll6UuKn7fdIsjoU00/8tmDxsFEgxDEK/2/ZfRtKNN+l+LN0T699bahQyaqRJpGd4pyLzGRZDbsid9QdfvkFHeZgPf5PAY+dfMVFn/l1NcRMSDv9tSdCTPAzfduKuaZjI5lVvGiUzvrymXBTkpxexqQ2GiccfrCMFxYc7ygjHySk5XUagyU+30pCIFviYAWx1ziDYkJMsp/HD8fAJyyZ1brQdqTy15b/oW3rcFNpqkqBHGllN9c/K2pQyKA8BDkDB+WcwgkGiVBCvZfl4VoGydxPMo/f3R9GQ4W3ci+qxp+mtj0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ej+k1ZVhRm6WFuIvf0nBMQYb2wZVgJh4J+ybsGv4lHw=;
 b=V2ykueTxJhlwkXwVO+yaKQvX5qlb0GNv2WghylPhlJe4erZo631a4CEEHb+I4My5ErZbIpiT9aeEveXh/EH+RKhYSFByF3E08Kt2kXUnkkzOfzyfAlpyVsfkqzasJdHYozxSQmYDpxuI55VqbCor1/WFnMypv9huyVAHRsC89V0WPMOTsDHfJGlUOlUD23irG7G/0EzRw8qAjXm5Gv68p3gq3gZEBQRJIoGucmbm2zEWFfW8VMMBn3E79nOVonVflNUfRJ0NzugfQObs26oFcfZa66BL5wtabWkQ2fGifh2CrBYP7cqDguLmMp7OYNMoMA6kO9DQb4HEiG+AeLe0SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ej+k1ZVhRm6WFuIvf0nBMQYb2wZVgJh4J+ybsGv4lHw=;
 b=BYwNKrsoRc/i0n1FG1pwNa3A7QfS8xTSXdAgsToCo3xw+36CIiq5ASTU5BRqzQwR4+LJHQmO+uIhbCd4rIdRqcrYPojA1IJjV7vBzj7snCiHN64+kOJ6lOnCjIZivkP8PdtiYMeBA1BpPq9Q4bNOT2OnOYXdooFiAMIyJDpmc7Y=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAWPR04MB9717.eurprd04.prod.outlook.com (2603:10a6:102:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 17:39:07 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 17:39:07 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 10 Dec 2025 18:38:35 +0100
Subject: [PATCH v3 1/6] phy: can-transceiver: rename temporary helper
 function to avoid conflict
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-rz-sdio-mux-v3-1-ca628db56d60@solid-run.com>
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
	PAXPR04MB8749:EE_|PAWPR04MB9717:EE_|DU6PEPF0000B61B:EE_|DBBPR04MB7546:EE_
X-MS-Office365-Filtering-Correlation-Id: ae4bf4cc-00f7-4617-29f4-08de38130d1f
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NTk0bG8vOFFiODYvSURuOW9yMEVVMU5DT3hMUDc4WWFNS29vdEV6blg5akM1?=
 =?utf-8?B?eENnc3FCc2UzbHRaRmlBZWo0YlVYby9MZkxEWVBsQkNPZmJjZVZHay8vNmxo?=
 =?utf-8?B?TU5Iclg1Z3F5WitOdmFxM0Y2SXlLcHYyMDB2U2hURGwyckgydkZOUk1MYkZZ?=
 =?utf-8?B?U2FvbXFtSGV4VUlZNGJzdFVWWnJmUmpwaUNXOFg1SHFBbEFjbVYvY1ZvemZW?=
 =?utf-8?B?T1duVE9EYTVQSURXM3NBWm11bjFtc09KUndTSnNkdDM4QUUxOGZ1SUhXWXEz?=
 =?utf-8?B?SnVPbDlkbE9FMUIzZlZVQ2RxQ2daZ1RpRi8xRjRHZlJLdVRQM2tFczV0UVA0?=
 =?utf-8?B?QmIyQkJkdXdZR0ExYUJrb25yckcvc2lVS3RPSmtuWGVoY0RnL0t2a0VTMGt0?=
 =?utf-8?B?S1VxTzRjaEdDai9rODJLdSs2K0htS1N1NGlTZlNnUVpjSGdCNVAzSEF4eHJi?=
 =?utf-8?B?MzY4WUlZZVZnNGNsRjJtQUlhb0F4ZXM5Mm55YjFzMDFNNWFBNGYva3RiUGJQ?=
 =?utf-8?B?S0RrVGhYQWszQkpCRkNRRm5pN3FLYWUxbDlvZDBSUGU0V3dKaGJ2ZVI4b0Fx?=
 =?utf-8?B?elc2U2RNVjZrMEhpYjhVVjgwajIzdHVVRWtrL29IUkFHK0dZNzVzM3ZOSFhz?=
 =?utf-8?B?bWF5VGJWL21nNnF3cFI0QzZ0VzduM3l1cUs4U1JQNmpIY3RnekttNTVuL1Mx?=
 =?utf-8?B?UnlYT0R0VU1RNngwTUhPYS9oOS9MTnJIR2xxdXplRnJlY29Ud2RBZnAzSzhB?=
 =?utf-8?B?aXFpdkxJcjdmVTJ6U3JnZ0UzV3ZjWXhQYTNSSUJDZDNRY2JqQmpXY0FLaHZG?=
 =?utf-8?B?VkloQ3lpa0xTaEduZnRvVkNXZ25OaW9GTEZrY2RFNnB4MVAwZ0dRdUtmQUE0?=
 =?utf-8?B?ZDJsWkM2NFIrT1lBZ2hoMHd3blNPd25FL25qbGxVM0dDNlZQVFNGK1lIQTlq?=
 =?utf-8?B?cEdIeTQ3cFVUWGN4a0ZhUDJ3SzNxL0hSZlJkdGFiQTREbjhiUmFET0QrYzIz?=
 =?utf-8?B?OTU2eldLcUxHV2VwTk5KUHd0a0dHQzFzMCtRN2pJbGxUUjZBL09kUkNPczZL?=
 =?utf-8?B?YXUxTFpJS3BKVW9JU0VsbzMraDh0dDBuQVRmaHdwRTBES3QvN1NnMmp1emsw?=
 =?utf-8?B?VWF2L0NXUytaMHFtVU4yeW1KRGt2aklTNTQ0NDBuajVQSWg2cW55R3BrWkta?=
 =?utf-8?B?SXZJdGpNc3V3ZVdKZXloN25ObVVmLzEyNFllZ09JdWRNMTdKTytaR1NmalY0?=
 =?utf-8?B?RjFqR3A2c1pWT3NvSmtwejZNbFhiQzZTSGR1VVl3ZFkrK2N5N2ZnRjJOYXRB?=
 =?utf-8?B?KzVja3lGb2hLV0hCNmhCdXRUdmZsUjNlVE9BdnQzMDRHMXhFcXkxcjl3NFVh?=
 =?utf-8?B?dmJMREJ3RjNHZHRaK3dWSDlYWHpVU0Vkdlk3NGVqcW0vZmdCQXdjV3kyb1l4?=
 =?utf-8?B?ZGQ5UHdKcTR2bFpaaTJPVU84RkN1MU1zWGNTSFI2Mlc5SGVxQVBHQ3R5ODB6?=
 =?utf-8?B?aFRiNEhqeFBBSGRRZjdiVFJ4Y2M1UjdTcHZyZ0o2SzRidVA2cG5IRHlTbDVa?=
 =?utf-8?B?UGQ1czg3UnNocys0RHdRaHNJcEorWDFoSWd6cVdrTlB2cmdtbjVkdks1eDN2?=
 =?utf-8?B?Z2kxaVZFQ3Zpcm05Z0pPQUdvV3ZMREE5eXpWMEJ4YUt4amtIZmVVb1dMZXE2?=
 =?utf-8?B?RExPbGQ1QjIwWEo4YjcvcFlZcDBjbitHaXIrcit6cjFWNlhXR1picUVxWnQr?=
 =?utf-8?B?Z1kzc3lsM0pETk8vQldXVGwzdkg3Snp3SGRWN3h2Q0ZBRk9ScUxuTlowZFdt?=
 =?utf-8?B?UXpRSTMrUFB5WDJFL3g0dnhUU0FkMis3NWthVERIMGUyY1k2UGVyUDlHSHdh?=
 =?utf-8?B?MXptcWlTOFk5VUxHSVRFUzJCdGgwdUQ0Q2pxekptQ0hyM2cyYWgzelpVYXBk?=
 =?utf-8?B?anFiTEdGTFczQllGRXc3bUdTOGIxSk5zTWhFcTlHL3FhbmpSbkNTb0p0NU5h?=
 =?utf-8?B?S3ZMM3BwOGR1Vmg3Sk81d1VnS0IvTzBuOE1rN2RVbVdnQVl6WkVOazMyY0dD?=
 =?utf-8?B?WVdCSFpzbWpVWjMwd1ArNzlXVEVxbHdzbHBkUT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9717
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e94db91e6225467a8660b9a3adfff3a2:solidrun,office365_emails,sent,inline:e3405425bbbc305e82807fbe90c335b7
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f7d1968e-ba5c-48ed-d232-08de38130544
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|1800799024|36860700013|82310400026|7416014|14060799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjBHeE95dHBRRkJtMnMzNXRoVENWL0haRGxOV2dVK0RsTzdyWFZvSEU0cXUv?=
 =?utf-8?B?SE84TWQwRzFyMEh3NWZpRWhjZ1FoR2Nab1hZNUIxMXBsbXBkdlR5d3E0bVdS?=
 =?utf-8?B?cW5pOFlKL1l6RGhaSjcrazNqRHlxQmVNbEI3dnExdlU5Wm9WMFlxb1lNcUpy?=
 =?utf-8?B?ZDU3NHhoT25MemJndjIwcU9OQVVhclNNQUhhRngwL2R0WWFrRWtRSE5xeHZE?=
 =?utf-8?B?eUZMdG1aZlJzMVkxZUR5M1ZRS2w0YTZxVy9jVmdqNC8xOWxSWmJpSW9OVnN4?=
 =?utf-8?B?OHRMRGNtUUR3OEJmNHNUUU5xUm1hZEtKaDR2TzhXcmd3RzloQkJmMXd3V1po?=
 =?utf-8?B?bWJZeGRaVUVMUGpNejZ2YmJzUnZvS2xBbnpFTEhNRldiell1SVBKTGhCNFh1?=
 =?utf-8?B?TC9Ya1lKeDV2Zkk2OVpOWWNPblFBaGgwWG92dS9oZ3gvdjJEamZxZWdsV1Fv?=
 =?utf-8?B?b1JHZkc2MTB5QjcvUTJBZmZBQmpqWGNORzIySnVoVC9qQ2NyS2pOeWY5b2wy?=
 =?utf-8?B?Q0RkNUhBRnA2ZTMxVWV6dFl4V1hCTTU1SW9vdWw5dUQrci9kYU9IQWtuR3Vs?=
 =?utf-8?B?VTdQNlhvL1lqU004SzZ3bkN2YnliV0ZESUU1L1hyS3F1Zm5mTHJXb0dXQUR6?=
 =?utf-8?B?b3lkMnhPOXVjSXc4aXVjYzJSSlB0ZEdiRzlvUHBiZ0wyajQyemtIdnpjazlm?=
 =?utf-8?B?RzY3NTluMnY3VGlYdWxqblhIYUZWVEloQVNqT3E5RC9YZEFJU242cVhFNmlv?=
 =?utf-8?B?V0VyaVRwQ1ppbzFnMXNKUTA4b2FKLy9TRnhJaHh2UUZxbVlHQWkrZWcrUTBj?=
 =?utf-8?B?TEVQK3RrYWtFVDNzdjRHZ1FCOXFlWm5HU3czTUxGTStNMXZxK2JvWFpWY0ps?=
 =?utf-8?B?NVMzenc5S1dLcldPZFFNelJ5VEp5anF5N2Fnb0JxT2FuZjZMc1lBNVBBbzdO?=
 =?utf-8?B?SjZ0M1gwV3hNU2k2MUpEc3dhOFNGUnNBdXJVWGRUUVR4WWpNMkhXalZkaTFr?=
 =?utf-8?B?ZHRjU1QzTWxpNVV1M0V4M1BqUEhDUlYvcEd3RmxrS01lRWM0ZzBDNGx4NlRG?=
 =?utf-8?B?RGN5cncxdnRBQko1TCs3OTlMSUVWdTFBaTJGTkFLMGtJajFKSGkxZDBhamkw?=
 =?utf-8?B?WkNkM3lDUzByeWxSbitFdzIvYkExNFFsYjJNRzB6aE5oWmhUQjUvbzkyclp1?=
 =?utf-8?B?KzZPT20zSG9CWEF2UGQxbjQva2p3a1JGcUswZ2p1UHU3cXJYMml6MzJVZHhC?=
 =?utf-8?B?dDJINTRySkY3ejVuNjdDZGRURTVDMGIzYlAzdzYzS056VUlscmd5c1BpNDhj?=
 =?utf-8?B?dzFZUktoN2k5cGtVWGw5cXFOK3h1YjZGUlZnRUtJYlgyS0xsTmVZRW9mSUJr?=
 =?utf-8?B?ZmVpYk1aVnAzSUs2eURGTkcvakU5VFdSd0RrRjNrNUtJNGw2MWR4anFBaFUz?=
 =?utf-8?B?NnJQM1g3L2l4L0d3LzBMd2t5VldSbU9DakMyMGh5Y0JOL0FaOVptY2RWQ3p2?=
 =?utf-8?B?UHI3K0NNRmV4Y09YVU5taW9PSFRNalcrZ1kyUFRyZVZ3TzliN2VsYitTWUM0?=
 =?utf-8?B?L2dhRGdJVERlbHdoQkJIYlRJdTdmSHcxejZEYjlpMUd4QXNPZkt3UVlicnN5?=
 =?utf-8?B?c3VHQzBmV1RDYXdQZE1zQUtIWHEzWmNhSkJSRUh2S2k3NjJHV0ozL24xNHQr?=
 =?utf-8?B?T3d3bHNiQnFtNHpTQUp6allreVVzVnV2dEVaSFR6M2JPcHlVYTZWVVIwMnp3?=
 =?utf-8?B?bm1MeDg2OEtrY0lheWlPd01mM2hyU3hCY0RIcnh5ZEJncy9udGlzMGNIOGlo?=
 =?utf-8?B?R2JBV1pKYmt3NU8zWXFCMURQMHd5cUV4SGtzOWN3UVFNMUVESmVVUm9DTzBE?=
 =?utf-8?B?dFNVRUQwY1dFb0M1clBoZ05SajZ0M3dNQVNlS0Z1cUxqNzNPTVBJY1FmTWg3?=
 =?utf-8?B?Z0hOZC9PZUVHRkVNL29FRnJzZVB4Y0VWTWZwS1d6cE9XTS94Z3B2clFvSGl1?=
 =?utf-8?B?L1pXUHJuU28xRVdYbDE3d2dKL3JjU2tNMDVEQnJoSkRqMUNBbXRqVFZQclFN?=
 =?utf-8?B?bUE4K1phSm5Hd0xvd25DRmNFenE0TjBWWURYVFlkRC9EUEJsaXF4MmRJei9B?=
 =?utf-8?Q?VxBnfYjPMHbagr5vm1kD85kQ9?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(376014)(1800799024)(36860700013)(82310400026)(7416014)(14060799003)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 17:39:20.8422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4bf4cc-00f7-4617-29f4-08de38130d1f
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7546

Rename the temporary devm_mux_state_get_optional function to avoid
conflict with upcoming implementation in multiplexer subsystem.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/phy/phy-can-transceiver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/phy-can-transceiver.c b/drivers/phy/phy-can-transceiver.c
index f59caff4b3d4c..c02d99f0f29fc 100644
--- a/drivers/phy/phy-can-transceiver.c
+++ b/drivers/phy/phy-can-transceiver.c
@@ -95,7 +95,7 @@ MODULE_DEVICE_TABLE(of, can_transceiver_phy_ids);
 
 /* Temporary wrapper until the multiplexer subsystem supports optional muxes */
 static inline struct mux_state *
-devm_mux_state_get_optional(struct device *dev, const char *mux_name)
+temp_devm_mux_state_get_optional(struct device *dev, const char *mux_name)
 {
 	if (!of_property_present(dev->of_node, "mux-states"))
 		return NULL;
@@ -124,7 +124,7 @@ static int can_transceiver_phy_probe(struct platform_device *pdev)
 	match = of_match_node(can_transceiver_phy_ids, pdev->dev.of_node);
 	drvdata = match->data;
 
-	mux_state = devm_mux_state_get_optional(dev, NULL);
+	mux_state = temp_devm_mux_state_get_optional(dev, NULL);
 	if (IS_ERR(mux_state))
 		return PTR_ERR(mux_state);
 

-- 
2.51.0



