Return-Path: <linux-i2c+bounces-14498-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CCECB3ACF
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 18:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C310306A063
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 17:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297BF32860C;
	Wed, 10 Dec 2025 17:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="V4M/qFIA";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="V4M/qFIA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021106.outbound.protection.outlook.com [40.107.130.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8256D31ED9C;
	Wed, 10 Dec 2025 17:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.106
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765388369; cv=fail; b=MQO5Jkfi6ArKa+79FJtSv68OgUI/UVbk2ArNwTe1UWRexpiXsihwmewPpL2I6+qM9036wF6GmCryTOlQBCw5t4tEAzWucFjQhjZyLzoEFESIYrlhf+4ls3lJ62+Sl4dXbiTjFV01yDgu2kveA/FdArDPhP/sahGn49ZWXfVwwUY=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765388369; c=relaxed/simple;
	bh=z2vkRtapTV3a1RoVH7paz2vibS1DsWcSXwiL8JNTqHY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DHcRnKKIl1EEFSmS7j/e+XhM0LeV+hITC5Pg9SqbmLarZptccpFwISXOHkyMtxicgfAVtgC1/EBz9yRHKYHfPLrdpaEtloEe/c+Tp2x6KK37Z/etMHnchTCF8N2ofHpjKDLoDEVlgWCL3aDb40PkgI/zQ9xvN1oDXtcW1K8Bctw=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=V4M/qFIA; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=V4M/qFIA; arc=fail smtp.client-ip=40.107.130.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=naL2zSSM6h9lEkigMj/ZHNjWYUcDtCih1PRxYzjrzO82Yi663IjelsXxg/85AjINvTFUPUROq5uDUQxD9sExeN/swZ9muOUrRZicfS9tahkHZhCIDevBwjVCOGgmVU159Wk3JlVEvj42lLJi9IowJIYwwABO0xnXJGcgyZA7X0l3og1ki1DySFt0wZlyvFuBj/NXNg88IJiFDOFkoCRxTB4/rwNg/Ic5vFk2CXeVB44ymOM12lvg95UyYnAkqSvB/PO35ltSBVLE+QzMqTl2338D3OvtS6kL1MMQgkdf7LLOz0aav5kL/paZmJv5LZXGbV3KgjEbsqULGiRUb3J9uQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34ZAnVWo0g6+YioRtN8zkHU9zu+p7ff7uAVaFvEjNXs=;
 b=sg9FUWVu3xvk1KY2J2R6V069LszxhS8W7xBumzM9wTl+iz6tl96sgUWYsqvRFJM5ssmcobjLglK+r9XkPaItDnVbxMaav4lPSbyKyDf/nAVjzj6wBWFBShBiaygWRoS+S3GgPypq7FXoJT1wr144dXebFzGbIz+wLCfvfd4AXuBZLkmU7u+2xRYJv9aDRqhj9SNhA820g9gWcJspkoUHNC2shRvHeWPHhz/eY7keluBpXj18oImpmIBzj18FGHL/YD2kFweIboWwOhh4yZSy991JByddl6G3LwMELJxI/mOH5Coaok6eDJAzPt+cHbT9npa35spvlCkZICZ9ZDx15A==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34ZAnVWo0g6+YioRtN8zkHU9zu+p7ff7uAVaFvEjNXs=;
 b=V4M/qFIAzh4yVApe8qLqkHXDZ5WqjI/qXpafOMXrWdq4iDjz4OnDaziTGpbwWpSae8QenAovwarm902h7W8r6xi66f1x7eO/iGaQG5YbDZ/uykt+EkWSUFj5LZb/uoKWypMFzPh77Q6HGJjhQ9nB1S5MbJgEJlg7OSsi/9vRaYw=
Received: from AM9P250CA0013.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::18)
 by AM8PR04MB8020.eurprd04.prod.outlook.com (2603:10a6:20b:244::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 17:39:23 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:20b:21c:cafe::ea) by AM9P250CA0013.outlook.office365.com
 (2603:10a6:20b:21c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Wed,
 10 Dec 2025 17:39:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Wed, 10 Dec 2025 17:39:23 +0000
Received: from emails-2505324-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-248.eu-west-1.compute.internal [10.20.5.248])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id CD636804A6;
	Wed, 10 Dec 2025 17:39:22 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1765388362; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=34ZAnVWo0g6+YioRtN8zkHU9zu+p7ff7uAVaFvEjNXs=;
 b=RROCs6eFpxc59fmDWKArXgVoJOyoLM6JSymknnQhtYSB4ahpPWUIl2AzxVgzzeNyhACkO
 N6cp8eTllPQKrc3aj6sNrmPVZQZSwvJAO/pRVrukwWD9H9MhW6fBucLgNi5lLbuV9UBiwD8
 futAFGTjKq16sc+eg5ceEODVzLkzhaA=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1765388362;
 b=q2hraYPdI28gfJpb2CNJZbTVwh4roH6GqELt8p/nFoPLQmI/CtZovOg73Z+mDzisijvvh
 YjACg3U+YrnjU9mCHJX/3k1ctD6GlJRMIq79XxhsT4mROPVSRfkfYXiZUav9arcHSa3jv08
 RRRhh71fS/iKNHCl025Yv3Y7+ovaD1E=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHyNchWpiJmUiY8rQrQvkm9FZ3p/w6ZT0aAGfHCwD1CuTjS6DUXhxyp0OgrKzqlsNACXlyHCwNDRHzE48Y2EuOKoG0M/wtk7Z1krmOF29rD0yfPaNWbWMGtkxRPnVGnZJR6FFAa5GY5ihpRHRs1n2qh3Vd7wG7mq/Lmy7k3SMXZ7rtCthd8uj1/acV4KVrr0LHEbpgLEGBezwW42L5LqqqNaYHFd4qY9vRTVbBNQXTlt7hHnAQeutUs2+t/gcbVPppuRxIP67X1y8R3LMsXHEuC8+i5sAyncO9f7CTpExpJrPgm/GKW7qp1gm1mS6KR+f9axvDfPVVYjxI9LkRLS5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34ZAnVWo0g6+YioRtN8zkHU9zu+p7ff7uAVaFvEjNXs=;
 b=MWAfgIdAKh9SpX8pVVirDUA2Adh4di9lgTYAlSmwDlmqHzyLwOtl5Pa3GD3FPHqOdVSNJLS4t46rOOPomOeMHvk9biCczFaW68pTiWSbAtReSO2v7fN+LlSO6n8f67US469qcxK5r1m6yqlnklClkXL03a2Yl4CX37XrjW1UKBsmaq30pJd1H3b9o8T8G2W4/qDt/t+jHuHgCMnEgrxlMgYHActa+r6ZtKn0yV/ZB0ALqnKVluewrkU8Me4NaAb1p70nkCHVxWErMd1TKD5BqldXDYXKMQiMB3KfsKsljc/m01nadulpwt0x327gbZxcY8eGpWsxD8UDYSETwD5g9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34ZAnVWo0g6+YioRtN8zkHU9zu+p7ff7uAVaFvEjNXs=;
 b=V4M/qFIAzh4yVApe8qLqkHXDZ5WqjI/qXpafOMXrWdq4iDjz4OnDaziTGpbwWpSae8QenAovwarm902h7W8r6xi66f1x7eO/iGaQG5YbDZ/uykt+EkWSUFj5LZb/uoKWypMFzPh77Q6HGJjhQ9nB1S5MbJgEJlg7OSsi/9vRaYw=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAWPR04MB9717.eurprd04.prod.outlook.com (2603:10a6:102:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 17:39:11 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 17:39:11 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 10 Dec 2025 18:38:38 +0100
Subject: [PATCH v3 4/6] i2c: omap: switch to new generic helper for getting
 selected mux-state
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-rz-sdio-mux-v3-4-ca628db56d60@solid-run.com>
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
	PAXPR04MB8749:EE_|PAWPR04MB9717:EE_|AMS0EPF000001A1:EE_|AM8PR04MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 4441f2a3-61b9-4936-6a64-08de38130e7c
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VHJTRUdxRDRYYzZOcDByOFFYU3lSQlE3NldOSlI5WGZRT1JFai8wWElIUHB2?=
 =?utf-8?B?ZWdUMUZpdHRnMmJQZE92dHZTOEQ4VlpLVnR3UmhSTnlIVkdyNTdUaWhoUDFJ?=
 =?utf-8?B?OG4wM0RGOEZ1RmhnM2VRejlsTldMTk85SUdhOXNVb3BycTJTNHNNOVpvdkJG?=
 =?utf-8?B?bkpvY1FaNG5ROVlqWjkzelZRYTF6UEszU3J1dDRSV2VwMk5JZUt5SjkrK1BF?=
 =?utf-8?B?SmE0aVdQb3ZqQkhnczFnM2xla2Y3Uktpay9ocHBidnJIL0FRdlFTTHBUa1B2?=
 =?utf-8?B?V2N6N2xCQ0ZaMnVLbGI2UGNjcTI4OHNuTU5OVFEwTjhML1JTSXY4YUg5QW9l?=
 =?utf-8?B?UmhlWWpiTVM5WjZUSFJ2cTFrZWdwam8vQ0s1YXZweHlUdjlFQmJPMXlSbk9L?=
 =?utf-8?B?WUlYTjJ6ZDlYdW5aY0lOTnlUMjRvcWZ4RUxHb21Ga1lOM1gxbGs3UlAxcThm?=
 =?utf-8?B?RVRHc2NuMGhJcGhVYkJLa3Q5cDJITlA1akZRdUFrU29rLzdhYVZSSUlQTUR6?=
 =?utf-8?B?YjlRcEZweldENFphUDhlb3lTcmR0cUJuUEZwelhDcE1zcHZ0blQxT256ek0z?=
 =?utf-8?B?RGsrb2lyRWY2bzkwVU9EMHRxQjhRaURqdUJzZVZVVzQreEQwYXRPd1g4R1NW?=
 =?utf-8?B?LzFVLzBMTmpDcEZuKzRqV0FPVkZDY2tydmhXc0o4ZW1kaXZtVndsU2tOWGxp?=
 =?utf-8?B?eGhMOHIzKzFob2RSVSt4VXUvUXhPU2h2cFdqNHZlR24zQWxpUk1WWjJldXFS?=
 =?utf-8?B?WWRPNFlaRHhqcWZkTS9wMXgvRHphNSt6NVBjMHpKNys3Q2p4eGkxam54bDMz?=
 =?utf-8?B?OFdXZk5CWHdHVDZxRzZmeEloOUxQUjdoMWI3bnkvaHdaV2J0RWV4OXhCdU80?=
 =?utf-8?B?aHVqRHlESzNxaXB6Q0R6TDJNekVSdzFRSzdNcklEcnVXZ0dxOUlUYjQ1bVdh?=
 =?utf-8?B?djVBQnpta2lCQ3ZSb0Rzc3Z1VEk5SGY3VHNnQlpKazYrbSt0NDVCbHRwelVl?=
 =?utf-8?B?N05TcnhJYkxPakV1WlFFL01mRGVDRlZZazR1a1pIWUFESmR1RVJ5d2pzN0N2?=
 =?utf-8?B?WWMwekgycnVXYnhzbjFvOG9XZmNaT0YwalIxOEdobi9wNXJGR0NRRmRiNkpQ?=
 =?utf-8?B?ZEhISDBLN1dFRXdBMkd0UVhFa3NOZE5mcHNCT0VaVFNwY0Y3RVppYklnUUpP?=
 =?utf-8?B?NDUzY1ZpVG1PWEpjVkJJZnVldlZjUmhhVEsrV2RCN1g3Um9yVWFYbmVUQXkz?=
 =?utf-8?B?cVFDVithVUpFM1k0eWR0SEJtZXJ1U2hvTDJMRTJYZTAvS2htZDZMVEVKdVVu?=
 =?utf-8?B?R3JreE9yL2FYbVoxMGh4RWdTemY5T01yZFZPZFZsakNxaTZPVG56MU40QkZ4?=
 =?utf-8?B?OTlWUjYxQ1k1U0g0T3JwUkM3TnlNSlliR1ZYOWczb1lLaU10SEIrNklub256?=
 =?utf-8?B?aHV0dVIzczFycHZ3N3g1NUd1dVJ4Z3lud2l5Q2V5MlhwbDMzMVBBUE5mMGda?=
 =?utf-8?B?UXREQjU5citWTzdBMFd5NnZQSllzOUlhV053YzRCQVppVndYUkQvRStkS1A3?=
 =?utf-8?B?K2k5VDZZem53NXhQeGhwamI1dnUvbS9CSms1ZlhTbU5ZNjVQU0VYajAxTXUz?=
 =?utf-8?B?SllTdE9tdU5hNnJhLzVacVZrb0htemZsdnFGWEtRR282bk0zejRJOVFTaFV4?=
 =?utf-8?B?cGNEWGcrYzJKMVBNOU5zQ2oxQWRCRFU0Zm1aSDZEdU4wWnI2R29zNmJ0SUFX?=
 =?utf-8?B?V2pDUmlMVVlKZTlxODVPSXRacS9XWUdMVDc2UnRmcnNlUXArN0VOTzU0Zm1a?=
 =?utf-8?B?Mmg0bzF2aEdFSi9vb0QvU2Urd254T0UzZnhrb3F1cUo4L2hmeWdWZmZxN3Jr?=
 =?utf-8?B?M3ZxL0pYK2VtQjRhY1BLQlQ5UC9SM1ZBYUNxalI0TGExZEhFa3dtYkFyMnBE?=
 =?utf-8?B?N3FEdjFZZHF1ZVhsZWZHbWRsNjlHaWFYeGNiMTlaTUF4bmcyV28xbkthNlZG?=
 =?utf-8?B?aUhrUGN3ekkwUE9RcHpwbGFVdjgxRGppM0ZZWGhQMnBWcTBxOVF1MFptWXZs?=
 =?utf-8?B?RDhWKzVQYUtCQU1qZldubnBHY09xQXhpYW9Xdz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9717
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 3525d062d3614a1f80cb3d44a104650a:solidrun,office365_emails,sent,inline:e3405425bbbc305e82807fbe90c335b7
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a3723393-d89a-4f81-9b3f-08de381306f8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|82310400026|7416014|376014|1800799024|14060799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eW53QXVxZXNydi9NeVliZXNkNWRDZlZReDBUM2VhVDNvcHRTOGRvK0tGU1hx?=
 =?utf-8?B?azBIN1o1Y3hqV2NPMUU5Q0R0YUZHZXFMNlU1ZGk2c2dLV2RQS2psUHQyWDlr?=
 =?utf-8?B?S2YxblZoUVFnMGF5elVKa1JoVEYwZ1Qzdlg2NG5EYWQ1Y2NKRzd0ZHM5cDBz?=
 =?utf-8?B?NWRqVW0rdjJBUFp2ZERhMU5BMnJ6eHVxa2R5bGxhR2ZWMldtUTJVK1M5S3NW?=
 =?utf-8?B?Q1VSRTM0YjBYdUhkWXBXS0t4MytKNjRnVW5BVlNTVFVpNU9yWGMyTDNIcjVX?=
 =?utf-8?B?RTFBYjNqNUdhcC9qRWY4Qzcwai9rZjAydUxqT1M2bURFVlBzd2ZZUTVrc05B?=
 =?utf-8?B?bGxhUW5nZ0VpUXRNUVdsOUtLY01ZcHBQNkxHL3NxRVRiWFZiM0QydnBHM3pZ?=
 =?utf-8?B?ZUhlbXNDR291VzFSWmdJY2NMM3hWZHBockltWmxUbkx6RjdLdWlXYXM3cmhy?=
 =?utf-8?B?aGE5dkt2dWtTckQvQkpCbFFkVjRoQXlMcTQ4VUFaYytubmpDN2dsLy93K1RJ?=
 =?utf-8?B?NzFlZkgxQWw2eXpPekI1d2FRSkJXbFFJaUZkcGtIbUlkNHdwYkZ0bFdCUFJE?=
 =?utf-8?B?YTJzeklsWVVjZnQwZEFFQkEyMDlFQkg0Z1hHcW9lSlpGNzVoY3BQZ0kzc2Zi?=
 =?utf-8?B?ZSszMkJ1Y09VcHdXTFVSQ3JaZ25DR1NOejQ1NkcwQU9JOWRhazQ1bklrZWN3?=
 =?utf-8?B?bXRTaFY4azNRbElBTGVtV1ROVnNmNWZpdHdlcEM1WkdjMlROYVFWZDgyS1Ju?=
 =?utf-8?B?cXBmcWVtOFBCZ3pudjI1dThlVUlvZVJWTVpqd3pXazZSTkY0VWZuTUp6eHc4?=
 =?utf-8?B?M2s2a2x0eVFQaktJbnA1cmNyT1FvRDY1VUZhanlTTytOY1U1bHJUL1hETGV1?=
 =?utf-8?B?N0ltbm4weXFVT2lxU2V6bTNPUXRrbW1TSDQvdHZlbHlGUkUwanF2NWtLbUhh?=
 =?utf-8?B?QXN3VEovaWhjbG1qWEZvK1hTUWRYb1N4UjQ3S0FPRUVHNUxMNEp6ZWw2OTJs?=
 =?utf-8?B?MjN1TlNoeFB5bjJSbWlUM2tpKzB3VXpKNDdicnV5TmRmVk9jaEsyL1o4OGF5?=
 =?utf-8?B?aFBoT2FiQmNjWjhPc056ekNuTUtTZzNuZ0VEME5BOEJ2T0V1SGlSZ3hXQlpl?=
 =?utf-8?B?ZUh0WEJnMC8zYXZKeG9MQzhPVTBacVJKcHJiNmRUbXZqclZhb3ZaZ05oVW96?=
 =?utf-8?B?d08ySXZTeUdYTnBRT043eXFSYlVJN3hKTnRtT1NDcWpUWDBGMk5NMEJNL0lJ?=
 =?utf-8?B?UWNJYkpQTU9IZkJxTUw4b21rRWIxZ1k2SUhyUGZrTlZrTHg1bkt6aHV0K0Ft?=
 =?utf-8?B?RXdGRmRVM2ZaN0pZRzVlcTYrYmszdklreFhGL3k4UjgvaElzTGNmcHZjWThO?=
 =?utf-8?B?TUhCL3AwNGVFa0xycWFwcWNudlB5b1lnZVozQW44aC9XelMraW5vclA2VnNQ?=
 =?utf-8?B?dGQ1Tllqd3NlaFRscjJuTjhiSFRNVDRQVG1Bcm9INEZ6UjEySnQ4NDlvOEtM?=
 =?utf-8?B?Y0xmQmdLdE51a0ZTbkNtQThnUkNQOUp2ajJtTDRmZlc2eXNUVkZsZEtoaFcv?=
 =?utf-8?B?TG9PWVdMTGxxeG5mQlZ5SGk0T09wN3Mrb1huL1lKTFpyUlNkYTM5OTNwdnh3?=
 =?utf-8?B?RER1YWlBWEduV1Z3LyttMTc1L0RpNEFUbHdyc01tR1ppelpMZmp5OGJMS0sv?=
 =?utf-8?B?cUN5TG9HR0UvN05CeW1FemtnQ2Q2TUdqZVFYTnVFVFBRNENSRTZFZ1NoWXJG?=
 =?utf-8?B?UjI4eERsUHNGSXBBa3ZZVUxMbDhRekZuQ0JBQUxJd1ZyQXNpSUVMdjNUcWpa?=
 =?utf-8?B?N2tXNitla0FmenRHQnloWDdDNFZmMHZmM01jUWE4MWllTmpoVFBqalM4ZFYw?=
 =?utf-8?B?MUE0dkUzeGRSWkk0VENxVC9lOTR6bC92V0FvbThDVy9reE9oOEl4b2VEejQ2?=
 =?utf-8?B?U3d0SFFuekRKWm9ZMFhBaDUveFVrK1ZRa0xxQWVOblYwV1dvZzFWbjdGb2tK?=
 =?utf-8?B?WFR6UnB3UW1sUkRkNjlxUXM3UUdtazgzQ1Avc2lPVzNaK0VhZjJONmxJZVIx?=
 =?utf-8?B?cnFKRGVpZlEzM1F6NVY4eWIwZ0R3OFFJYldPelFDTUxlZENOY1psMXVyVE40?=
 =?utf-8?Q?73moOHg8dnnkKz3RC3LhhHqhN?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(82310400026)(7416014)(376014)(1800799024)(14060799003)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 17:39:23.0732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4441f2a3-61b9-4936-6a64-08de38130e7c
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8020

Multiplexer subsystem has added generic helper functiosn for getting an
already selected mux-state object.

Replace existing logic in probe with the equivalent helper function.

This change is only compile-tested.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/i2c/busses/i2c-omap.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 5fcc9f6c33e5b..89802027a3eac 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1454,21 +1454,10 @@ omap_i2c_probe(struct platform_device *pdev)
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



