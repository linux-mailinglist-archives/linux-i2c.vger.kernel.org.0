Return-Path: <linux-i2c+bounces-14496-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC10ECB3ABD
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 18:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1EFA3125FBC
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 17:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E353327C1E;
	Wed, 10 Dec 2025 17:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="PVPB7DvI";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="PVPB7DvI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023125.outbound.protection.outlook.com [40.107.162.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48D81E3DED;
	Wed, 10 Dec 2025 17:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.125
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765388369; cv=fail; b=pxDxVdwSuKp4drXi+pp3uF2chHwunY2mBn+MS9VJqXSM84sDe1QTMXaPYPIzcHxzlA+GHxIvf6xk1c4LyZzPRz9ktOLhSPsj+HAdMSn7SoHsGcGhkpxZxh9sWOKucX4O6Gm2ZwCvDcyOg7oiU95wEFwa1s3ZjJ1EhabfAfusSnw=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765388369; c=relaxed/simple;
	bh=z8dWRj6HdjoXV9N1hGW6PYabgXWPboYZXybInbc0Jkc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ld3TtAQ86/jg+x0NmSESaZTCQDHhuVkZNwaQPRkNvCeesR2rGx0kZDocUP1WmCOklAED4Drzs9FxRx8AM9CknhBeq3sjKnLUJVpPt8UXe9KIZuZgJBbgQjkH662I9fuAPhr+9IbtJbjImIXjVID/NMdi+ez/kR/PWFezThYz2PQ=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=PVPB7DvI; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=PVPB7DvI; arc=fail smtp.client-ip=40.107.162.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AGL/oTDF4GPBKHdAQ+odjaFpRF/yms/VX+9O/zvc6coyLopAmppkjTiH1kr6M90TYtou4RyqssNPgeL2+FX6+wZ4yIQHMz3hcuqmq8dvVe+Xg+nPMIPD7cIKIBda7uP6hU6PXxFwbMgQQyxP1xRpuZeNenyNUxfBxU6YR6nHQIvoh0c8wUk4ShXrXeOAxqE046e+6jIVamWhpzQGzLX9XYhAFjc0UWZrJNsQHK55gSOxbcv7pptZj40DE52cScEzauGUU/8WePZ2ws1TlMSZ6hPANMMBzSxFIXgBv7jJGGYn/U9dev2zslg6k9DswGR7uFCJxq/IFfCxRjci+skpJA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AAuWmpq0f12820kqaoUBSmEEGNtdrVUgaK+Q/Ce7Ww=;
 b=fxL+ybCGA4XwbK90osT5qmONLKhcoqIbfv1nnkakZC1HrL8F4HIdBXGBg3+ytUEzhiFT/u9WvZUICdPObj8FBxHgu9LdSp66PYDx9bEbQasVqrpNKGc66zvlfuboz5kh90n9JFBRMEI13CdfLSow3N8/WPBsmXfOKep9CVTr3/kpQoYN66YwQ5EvKcHay36rlMlQZo8vwNsg51Zi0q76wgBM3xbVA2IurG+Ktwuh+NC5JymDsB2tCRs1hUv2La7qSJmFhrzS3i65gfzB5im6iXfIGn5ugihrrBgqwkF2S157vCoxwoWhQPXAqm0heGB4FCwyVMJ6n01hKl01P5CB7Q==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AAuWmpq0f12820kqaoUBSmEEGNtdrVUgaK+Q/Ce7Ww=;
 b=PVPB7DvIjcKZPlkXA5Shg28hlcqzVSGxa3JOAn/aXcFqKdj5qqjsnxR5zGTkSVpZ1vxBFzOx3jbXMy9iWzgdpdRj3uq8G4Yx4XKMwTaKYMGlig+KGKu3xUNVOnFvhPRQbpVB6cLPG6zMePctSr/rhSmGReIrJ8xiPNSy1W48Qg8=
Received: from DU2PR04CA0295.eurprd04.prod.outlook.com (2603:10a6:10:28c::30)
 by VI0PR04MB10950.eurprd04.prod.outlook.com (2603:10a6:800:25a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 17:39:20 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::df) by DU2PR04CA0295.outlook.office365.com
 (2603:10a6:10:28c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.8 via Frontend Transport; Wed,
 10 Dec 2025 17:39:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Wed, 10 Dec 2025 17:39:20 +0000
Received: from emails-8269817-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-47.eu-west-1.compute.internal [10.20.6.47])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 29B6F804F0;
	Wed, 10 Dec 2025 17:39:20 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1765388360; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=9AAuWmpq0f12820kqaoUBSmEEGNtdrVUgaK+Q/Ce7Ww=;
 b=GdqQVI3W0SjCs6wrcYQtpDIm/R4shgaHnlhZfOPg+OBPToC409ee2HhPS5v9OxfO40Oue
 b/q2kLdmJ/VEdTFWYSBVWi1gegn/oaA9Ujq6sPL7Dk82TCX66Z5XchmR01D+MOXDD9PkdKO
 YpIrrKaQ/56S4yeo20CevSS7zSY9aik=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1765388360;
 b=cJqCputFPRiO+f1I7BXplnM4iW7OAJuV9HhUHUZMrENKOZZr0Ja6exb6IaT4y+TrIxQ1F
 6YhFMzIdzPk1tCTg6xc6mQs+AVoGbOJAmfQhqH9Sb8gjCtyPpA5rEp3F/5s0Apr+pVqpjWG
 cTZX0Q+f5mH+uoxLdV4w7UujFeV/8NA=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hC1utgIAGwRI2YBm39mjInKuvF61kfrt7gFcEWZhukNyRcqGZ5DAsDuyjjGVEt6SWtF2L090Z6SjvHwMr1cZXfxYk175KuZpaxav4tSqXno4WBtZFaHuoa+vJkEo8pSSaS46pGI+mJE21E/OgD45/IdMuNcpOdLh7ypL1j2Fovjcy2Jnv0CnwZRWhl+aEQCXGGyu5dUoCDO8bpc5z2CdU1a5XqcCY25UR0zdwLCX1iip9wZizONuvE23rkm2vhozK5RDjRvjHjdPHdg0YteuJy2LlIE+fZpAUsfZ4Cr8gn214HuFCtGtTCuHjWjioTPn1xtkvX713EXz6EcStmGmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AAuWmpq0f12820kqaoUBSmEEGNtdrVUgaK+Q/Ce7Ww=;
 b=WLs3jOx6rYxJbHaLt75dSBBE9X3kOoS0ZsiMVC9CpiERjYb7nAiP9tz9tMUl12UvOHRJwQjBNmzXsJyfXrHBUtQpgw6Eq1VWN2bqhCFzxeEil8GK2tkeG51uAUnvag/hwwjsof5aU+0+9INIDjtdOCJTXHM5xREc+PotMLYcH7WHkn94hut6VbJMj1kINTIqR1dpJTjRtgWBhbwOMAOrD/xXhAf1SVP/1ocJSvNIQ+EjkWWp2A36EoaErwMMk/zw0uYwvSKBvF4iKKXBypQmjs4O08yWTT7Qe8GRE0gQiGGXGV3TM5m2qD48bPBc+Z3FTzzozx14YJ5/RpX5O5ha2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AAuWmpq0f12820kqaoUBSmEEGNtdrVUgaK+Q/Ce7Ww=;
 b=PVPB7DvIjcKZPlkXA5Shg28hlcqzVSGxa3JOAn/aXcFqKdj5qqjsnxR5zGTkSVpZ1vxBFzOx3jbXMy9iWzgdpdRj3uq8G4Yx4XKMwTaKYMGlig+KGKu3xUNVOnFvhPRQbpVB6cLPG6zMePctSr/rhSmGReIrJ8xiPNSy1W48Qg8=
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
Date: Wed, 10 Dec 2025 18:38:39 +0100
Subject: [PATCH v3 5/6] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-rz-sdio-mux-v3-5-ca628db56d60@solid-run.com>
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
	PAXPR04MB8749:EE_|PAWPR04MB9717:EE_|DU2PEPF00028D01:EE_|VI0PR04MB10950:EE_
X-MS-Office365-Filtering-Correlation-Id: adc36090-a990-423b-c205-08de38130cce
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UU1UamhnKzl3YWJuRlpKQnB3d05ZNG1saEdaNWNPQzY2MTBJQURQQjJWU2hI?=
 =?utf-8?B?eGxiYVJvNDZLQXh5aTRxYkhWNFlKNmxGY2tIREZSUkZZUjRGbEkwbVBlWDNu?=
 =?utf-8?B?T2JSeFQ5ZEZobXhDSDFIRmpURWJURWU3YlZzWjg5c05QWDV0eGdSWkE4SjA5?=
 =?utf-8?B?a0NhWU9iVndDQVMrbkEyM3NIangzd0ZQRTB2UkFzNVFDOFJoOFQzdnZuZFYy?=
 =?utf-8?B?cHBlZldsWkhJZFVXWEZkdk1KT281M2dPTE9GZytlMTZQQkJqaDVWZjZoUVc1?=
 =?utf-8?B?bTNMZE1OVy92OU9JRGNHSUtqUSs3TTBmdTY5WWdJamNmd3dZOGZNcFhxeHc5?=
 =?utf-8?B?WjRMVnplUVRrZHYrWUVIL2dJY2FGczgwY2dibXZWRnJjMFlzVkY1d0RKUFcw?=
 =?utf-8?B?dC9jam95OU5XbEYyU2hmdDc2VHo5WkcrVUNQWWJvRm9CQlRjWll5T1JtSG0x?=
 =?utf-8?B?SjZDek1vZHRmajVYL2kyeEtBZi96WXl2S1pvYUdRaGdmNVJjOUo2bDRsdVMz?=
 =?utf-8?B?SjNTMVhlejV0aFFneWY4Vmk4dGJxWG10QjNQMXhxTHhrZ3VZZ1RTU201emlK?=
 =?utf-8?B?cEpzYmZBZnhZSjR6NG9iN1JSZHh2YTdZU0Rla0tPTkxYVCtLV1ZKMkhXWEE2?=
 =?utf-8?B?ZUhyR0p0bm5XbzQyMDhoVkhnWk5Nd1lYZUlXWUtNN3BQTk9iRWs4MUg2MlJq?=
 =?utf-8?B?cUZCRmY1OFh6azgxclBqc1ljMFFlaXNIRm5LSmNKNU10YW9XNTFUUG9lRWxN?=
 =?utf-8?B?andvemwzZkE3dzBPdFFNVHpOelFrM1hyL2JhRHZxNGprVU44ZFNVaGY5NGdw?=
 =?utf-8?B?N3haaGhab0VuM1hveno0Wms2TWcwNGZScVYxWHMwMWtzVWhKUE4rN1pvenha?=
 =?utf-8?B?SERzajhIckluYXo1UU9vS1IwV21qT2djWEw0SFpiZS8yRG82VlpaemFoUzEr?=
 =?utf-8?B?UzluOXdGQ05pWXFrbEJsYUFBSXhKU3dnUTczK3d3ZU5oY2J2S3pudS9MMG9a?=
 =?utf-8?B?TFFXUEdmM0IxTlExVEU1aU1CYnl1ZzRyTVR4b3g2M1dHbnZRWHVvY2RVcUZ2?=
 =?utf-8?B?ekl0RENpMlFzQmZsL1hydmFwTkdDb3RRRDkwQjlPa0cxYVJWenZXK2lqOGpB?=
 =?utf-8?B?QU1RZ1ZwcFV5RXRDcDA2NWZ3enFHeUs1NG5LZUhCaUIrUU94ZFQ0VnFjVmNw?=
 =?utf-8?B?cjVtdjk1LzV5Q2FVR25TRkN1Q0ZUYnZxS1JKbnBCZzBwSVBSYm55WkZVZTFL?=
 =?utf-8?B?NGZ3RVVDSzVVVnZacHhMUFRmblBjWlN4ZkI5TjQ3MFhpMzZYL25SNjhFeDd4?=
 =?utf-8?B?VXMzOWU2NnY3WUxmK2pNT2pYRlhsMVpzMXZpSmUvUXZSRGFXVEVoZnBDNHNK?=
 =?utf-8?B?M0JWWGFBWlpFVkl4QmppR1Rsd1R6YVdjOGVPQ2h2MjJVaWdOSWJQa2hObUMv?=
 =?utf-8?B?NW51L3FhL0MraUtkL1VaU0ovL3NsQ1J6UXhkOFM5RzVCRHZyQW9IRWVZR3dE?=
 =?utf-8?B?MGZGbHFGRHpBbXZZbExqTWxZbHlCYWpncDBTUTBJK3J4VWxydzMrMmhwZUpz?=
 =?utf-8?B?bys1T3VLT05ic0x1ekdrQ1N0a1FYUFM0a0ZyRXJHQlErWW5nZXl0Z05HUnQv?=
 =?utf-8?B?MkppdzROQyt2ZkdBZENRSEx0dkkrNWRjTzNzK2FCRjhJRFhkTTVGZkpDMDBE?=
 =?utf-8?B?THFiOURSc2g2WGp5WVcyKzlzcExDY0cxRkptaGhhTG1GSzJiTUdSMFVxMVpF?=
 =?utf-8?B?UVJvWXhXWktKbnEydktOWVJGckQ4R3ZMbm5JUk0wMjRmaWZpRlVrbW9aWlBy?=
 =?utf-8?B?eUh1NGJZOFdJMktxcFBxMXRONmE3c3NRQm82dlh6eGNYSFZya0ZtbmFCMVhn?=
 =?utf-8?B?aTE1SitKck5RWTlweXE4Zm55L3RmTERnTkM5eE1aeDVXeG5LZ2xYVnhYS0hC?=
 =?utf-8?B?VU9wYktYTXRHTlh3eDNZUXI0U00zNFEyWXd2MnBjdkdSd205UEMzTnZoSlRr?=
 =?utf-8?B?TFRLc3JQditPMTY2M0trYzl1U09IdXBDK3NmS3hBc1RuK01UWlVwRTh0b1ZX?=
 =?utf-8?B?b0VwQUpRYlpGT0pPUlpuTHJwcWRIREc1RXRNUT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9717
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e57d952922c040799a33ad1eba897a6c:solidrun,office365_emails,sent,inline:e3405425bbbc305e82807fbe90c335b7
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef6bfb8a-979b-4220-3b99-08de38130787
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|35042699022|14060799003|7416014|82310400026|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlo0TmM3WGd5TlNuZjZVNzRhdXlGaHBzMnVqQzluc2hPY1lWTlhYeXlScTIy?=
 =?utf-8?B?UmE4c1R1djMwSzdVMjZzL1JaeE9mR2x6RXh3YUVwL1NZakVwNHhZc2V5TkF2?=
 =?utf-8?B?YkxyRmpUZHowRkFUYncwVEV0TVpFYmJYdW9CTU5md3JqZGttMWJZTWlrOVJk?=
 =?utf-8?B?MGFZc25JZzFPTmlKVGRodDRDVHdpZ2xQV2VaSENidW4xZ2IvUlYxWHVWQ3VD?=
 =?utf-8?B?Z2QwYWdxemp6K2diem5ucUVWWkVIRE9sSEhQejJuY1JCTVBpcnBFbkVYTmxP?=
 =?utf-8?B?WlpNaHZxVEdqbHZFRkZ5UnJrWTJMSXNGNlZjNGNpbWgzOVlwcjVwV2VpWFdP?=
 =?utf-8?B?Ymd0QWVxamliUkQ3YjA4WVpTTlNjK1pxT1hLR3JvOGNVTVIxTHdmN1hTQXIz?=
 =?utf-8?B?S01GcGNOTGk3UEFmaTR5NnBueVhybStrcE9jN0gvR1ZGNUZVeHluS09oUWYy?=
 =?utf-8?B?enV4Vlh4VzMwbld4Y0EyZTFPSUx0NXMrQjVjb2VVNytUSlJZV3JTeUpMQVU4?=
 =?utf-8?B?eE1WN3JrVWwwUUo2ZS91OVE4a1ZRbDVjSXk2U0VDZFMzb3VES0NjL1doeU42?=
 =?utf-8?B?LzVsY3IxMENXMlpWSnlqcG1rMWMwaGZNaHFnZ0l5eU1VOGFwbTdZamlnQ0lV?=
 =?utf-8?B?M2x5dTE4UjF1WGE1ekFFOXpua0NZUGRpVWpPTjRFQURJUmxNcWQzNEhFZ2hW?=
 =?utf-8?B?MUp0T3BOcGhlZVhlNnlMNzdrZEU0aFNJTG9DL2F5UmxlZDhRWWxJZmJEeVVV?=
 =?utf-8?B?L1ZCRnpUMThmV2xhQXpSZnRibXg1aHRWQ1dyWklYUW8vNUp6Uk1Zb3l4MWlr?=
 =?utf-8?B?SUEya2NLZGk5N1ozeTJpajAveHdjYk5rU25KcmdxU24yTk4yZTdJdlBpNkFv?=
 =?utf-8?B?MjlTdHdWb2hnVUFjRmwvaU9rcWRmdEMzRmNCdnlYRHBUUDhBUTU1UDU4ZXVJ?=
 =?utf-8?B?bnU1RmMyd0s1NHdZWlo1UjB6YzhFK3YzZUdWY1dhTHhMUnI4bVovaEQvTmNi?=
 =?utf-8?B?NjhtZkw4SEtDYU90UWZLdU5OaFBKWlpKZlU0TkJHT3hidXB5WHcrL2UzeTZT?=
 =?utf-8?B?MVZOQVV4SDlnMEJPYmRiWmVpSGFZcmEzbUllVmsvQnNmcTFnRVNTU3RTRGNO?=
 =?utf-8?B?TUVXNUhsYyt3Wk5CaDNTSk12SUtjZlpsZXRUempvN1pxRVFPNnBBVTZOai9l?=
 =?utf-8?B?Mlp6Nk0zZEl2cE04MTV1VFp5eWhySXpGQUUrUFRRSktvSGN5WS9UVU5OR0VJ?=
 =?utf-8?B?aFJwY2VkdElRVDFsM2JtcmtyT2VDREU5REtiY0tjRXpwN0Zaa2V4Zk5YWCtE?=
 =?utf-8?B?Q29LQTJkL2x2eTJoaEgvc1hoVDFDMHhyeUVRcXlodWVBbnNVbDNqcFZSbldp?=
 =?utf-8?B?YnJmUmR3cmdGWnhHMVRIV2Q3NnNici85S0M2TEM2ZkNramRzbzgzYTM0aGo3?=
 =?utf-8?B?VkJYcEdSOWJ3RkloK2pPamplZlhsSXJwcDlJcnB1N3FEY2R1dlR4TzBCQVBt?=
 =?utf-8?B?M0xHRThaYStOdTZkMGd3SXVyTVY5V0NCeHExNVhwQ25FZHhSQkhBcXozQnQv?=
 =?utf-8?B?cjgyWGxXZ0ZVcVlyMG1yM3I4aFliaVltWC9ScGJsNnUyZlg0SXpLeVZ4QTB2?=
 =?utf-8?B?N0E2cHB2QXJKd2FhdTdCVzZJUkZDOWlWV01xalRKQzlNbk4vUUM2djQxaHV4?=
 =?utf-8?B?MWxuWUNpak13ZlpqK1JMLzRyQkgyMzZta0ZmUzY1OEJ2SHlVQmx2dXZBYWVj?=
 =?utf-8?B?RDlTU1ZxcWlyZ3hDYXROd2hpN0ZKS1VOQndKYlFaNUQ4VnVkQ0pNeExEWG1p?=
 =?utf-8?B?ZUh2MjJKdisyZ3FZWEFWd3BqL0drcm5CWDdjS0RXZFhSVjZ1bjg2Qkp3QVlr?=
 =?utf-8?B?K29NajZoVlg3c3A2U0swV29kQWpkVS9mZ05kdXROSmlpMUdZeVFWc05sSTlV?=
 =?utf-8?B?dmd5VlBPdzNpR2hrOGNmaHZKVDVrbzFsa0JCWUVsSktRSG9IQ1ZoV1ZRZFl4?=
 =?utf-8?B?aDd2Wks4ckFRclNTbDAwQzNBNmgwc0pHL1B3NjRNV29CZ01FMDRTQ0VMQnpI?=
 =?utf-8?B?YnBjL2lnK0J0TldKRVJqdVhybHlQNlFXMFpiLzJxQTE1L0lNbEFUem8wc0lT?=
 =?utf-8?Q?ME9/BS9F9NVvyp0IjSqiwNoxm?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(35042699022)(14060799003)(7416014)(82310400026)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 17:39:20.3143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adc36090-a990-423b-c205-08de38130cce
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10950

Add mux controller support for data or control lines that are muxed
between a host and multiple cards.

There are several devices supporting a choice of eMMC or SD on a single
board by both dip switch and gpio, e.g. Renesas RZ/G2L SMARC SoM and
SolidRun RZ/G2L SoM.

In-tree dts for the Renesas boards currently rely on preprocessor macros
and gpio hogs to describe the respective cards.

By adding mux-states property to sdhi controller description, boards can
correctly describe the mux that already exists in hardware - and drivers
can coordinate between mux selection and probing for cards.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index c754ea71f51f7..64fac0d11329a 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -106,6 +106,11 @@ properties:
   iommus:
     maxItems: 1
 
+  mux-states:
+    description:
+      mux controller node to route the SD/SDIO/eMMC signals from SoC to cards.
+    maxItems: 1
+
   power-domains:
     maxItems: 1
 
@@ -275,6 +280,7 @@ examples:
         max-frequency = <195000000>;
         power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
         resets = <&cpg 314>;
+        mux-states = <&mux 0>;
     };
 
     sdhi1: mmc@ee120000 {

-- 
2.51.0



