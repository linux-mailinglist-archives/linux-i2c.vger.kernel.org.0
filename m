Return-Path: <linux-i2c+bounces-15254-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 598F5D3940E
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 11:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BA58301E9AB
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 10:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA31B313281;
	Sun, 18 Jan 2026 10:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Z+NzSdSa";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Z+NzSdSa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023108.outbound.protection.outlook.com [52.101.83.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FC22E8E16;
	Sun, 18 Jan 2026 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.108
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768732172; cv=fail; b=F9MKRbpmxQg5H7KRIpSMwLZKWBV1KKz9tknMfejkGD+AyUNfAhuWPpxz6WzWgxf8oO8jKxPnjypekxHwbbfe6bFXACDsV3q5QErE1/hph7rwdZ+7tM/b/4c6MpC3uzD1+moyD7Jl9k0qrO9j/kHJcb3W0OBHnJNX2AfyUAe6nIM=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768732172; c=relaxed/simple;
	bh=W2WULjIumO31vwuTV7Ypnx3E14o+C/GzLLc8WjB7658=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=S233TlLmvHo5kh/yoeupqL8PYH/a7mdmn/6to1T+KxgriNg1SvJlwhdRPoeYaBwFg8E98rEYOzSpi1iWM4803ugXk4hY9RGGPDSO7S7lDkIDRyzXtGHHTUa2Ya60We7z6yTLhI55TT+KIDdccN7rf0RdMXU4MzqmBXeRTzeinjw=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Z+NzSdSa; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Z+NzSdSa; arc=fail smtp.client-ip=52.101.83.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=o5YHAxyNICkIuuWIocFef7Rl9Czc9PDCHU7swL+Zx/nTH352tbigt4q9hVqGUROg0NY8TiPtoV6SHradsFlg5fmLy+ciVIVNpzRlvIB/YnEuxWma4rFuaQCt+pWx5lyD/Wm2DT+uvVCo4wA0uAwB9lB2o0Rq49FbzHbP0RQb7xN18Tw/BaBw7oQAHeHBUV2ucpImdPTCkpuhUe3JpaP02JXWZWAjIreDZxxhMM4wrzebZN+J0otQzdMukVXfP6xCrPK6Cb08DZ4qydowv1EqRBVgLjub9OHxZPPTMSnHxCDglbA1mBwFDbjZhw+2L87YbRKt4oWCAk82vPpMOWxzIw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ws54qLxCCzej+kWXD4JMmiMCdPbPPGmq+dipWGpu0Ko=;
 b=tJFBvNwMfGOTi/UY6KN4Awq4bIYMJREZg8RjQZ4Zgrst4JJz4ayOTjFzBJkes1h0DbCj60QODtwMnesiGg3XUqMHF+fzoUc462RtYD4vyyNwFRM7edQKHR57IxtU7GJJ5gmEharra1VcmQeFUeqxqpGxsiAO+iuk/XcUfKtSLqe9xIc+3Il+Ms7W9vWWFjRAEOUYv2T8cfiNeyQVf0X2abxF0U7KM+szZJV39knxH9lnQ/2YThuFzoW+7uffjFBqk9elNllMSkGfZor42KDVjwITl1VkwjRQbbt1Ny+hzsS5IgWA37Wp8Mtjob3vpc6uiwbxYlgQbpbQS5uW59vYWQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ws54qLxCCzej+kWXD4JMmiMCdPbPPGmq+dipWGpu0Ko=;
 b=Z+NzSdSaWP30r13NrFcDI1nJnAtDRZQnpVSpoVl11UKFUnN6jYfweJiADRPpt+XQCS6EtkMUzaHBUE1k53NYMk7VK7gVCHriTvMjjqP0K8p55AirUu/8YQw6SbbkDgO1ot5br1EaYPMvwW4PYglXvIE8IbdRNNhQwDfTd8BoSs0=
Received: from CWLP265CA0459.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d4::23)
 by DB9PR04MB11512.eurprd04.prod.outlook.com (2603:10a6:10:5e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 10:29:22 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:400:1d4:cafe::ad) by CWLP265CA0459.outlook.office365.com
 (2603:10a6:400:1d4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.10 via Frontend Transport; Sun,
 18 Jan 2026 10:29:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.0 via
 Frontend Transport; Sun, 18 Jan 2026 10:29:21 +0000
Received: from emails-5544868-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-10.eu-west-1.compute.internal [10.20.6.10])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 5CE0580009;
	Sun, 18 Jan 2026 10:29:21 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768732161; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=ws54qLxCCzej+kWXD4JMmiMCdPbPPGmq+dipWGpu0Ko=;
 b=gkf4WPOHn1+FwUqeRdaNJ8UtOHnba6Lm66spU5cr/3Uym+HsAcQXr+XyR3vCFcVqqXCYM
 fhKPIticlyqwqHy8YZ6H2V9N0anS7xdBL1AzYHWhMOojCmy3jdY7qqNyn1+MJcbVVdod5dE
 rP5KyinWHvtD746C/EosMnSiTfgLfYU=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768732161;
 b=iQL2Q2f9apEz1Es6MOvtCOSMC0e2MIy5NVGEks+9oIzWxZYBqqxwdwnopGzmDYQirAD+U
 56gidKnJoBcKwGCuE/TEgse2vIYK4uuTEsHg/Flx+P5ZTDC3oC0yUXYAn4o7ZfPfYK+H2RD
 LwXnC4BDA4enf25dB/RZew1Kp43qSa0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSk+7IseDMM+j3k35eSKt82KNYcSmlA5TG8D/qX8g0IdafCSMXoI+bgNyVb76bPUp0m8dDYP1AGm2i9CKigU3qVn3Z0dvuW83oDg3P+QfaeyahI4H5i5Av+D2bY/vD635c9gZeog1fGb9zVO8ior5u8bYHYo5FaH+j+fWd+MV6tyG05INBUeRf8m/e3C0TG1uDba7O3XIdgW2yGAolOj8QvcqDle4mf//OQneZYjywW9qOEA1MIzzbuOcuAPAFREQojAnFaL4oeZuzH3v/ffyyz2cokxdumELtoxxULiqzNld2p5tpU8QJWoNgCqHYSUf3pf+0/CSR/K6ZX15g5Mxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ws54qLxCCzej+kWXD4JMmiMCdPbPPGmq+dipWGpu0Ko=;
 b=HogqbGJys+Y6TVoMfBA74UzvGmE7IiRMf1DSYenYCOIiCDV1S9pDsn8b5SMGdG0UiJBQY6ECViUUz8cbz34BKLzHoZ0Tu9DhVfyJltOxeR48PPRGJtn9oZTpwEQh7ce8wH/2OWBOyqoLuaSz7qvNMbZ0vlB7SbjO9HNDZdQ+oiiUV6eMhxinFvAjm8nKknPp980F7ClOkQmezolcT45EdeMW5rdZ5CuzssbYF/G0sSw59azwVfTfGDXLC/kqRTVtbmULOoO8DmWuM4gWJuLfy/qyqTVWNZwZcAexW9liiSer17f2Y8FTfDz/VL0HJRbs7RszyWLL9yRhV9R4803oeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ws54qLxCCzej+kWXD4JMmiMCdPbPPGmq+dipWGpu0Ko=;
 b=Z+NzSdSaWP30r13NrFcDI1nJnAtDRZQnpVSpoVl11UKFUnN6jYfweJiADRPpt+XQCS6EtkMUzaHBUE1k53NYMk7VK7gVCHriTvMjjqP0K8p55AirUu/8YQw6SbbkDgO1ot5br1EaYPMvwW4PYglXvIE8IbdRNNhQwDfTd8BoSs0=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GV2PR04MB12189.eurprd04.prod.outlook.com (2603:10a6:150:33a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 10:29:11 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 10:29:11 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 18 Jan 2026 12:28:58 +0200
Subject: [PATCH v5 2/7] mux: Add helper functions for getting optional and
 selected mux-state
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-rz-sdio-mux-v5-2-3c37e8872683@solid-run.com>
References: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com>
In-Reply-To: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com>
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
	PAXPR04MB8749:EE_|GV2PR04MB12189:EE_|AM4PEPF00025F9A:EE_|DB9PR04MB11512:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a4f2bd-96f4-44a0-19a1-08de567c71c5
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Vlc1UVpQcytwc3NDUFBCZ21oQ1Q0MWs0QWhLczhTbkovczJ2YWNQVER1cVVa?=
 =?utf-8?B?VzJJdTZpNzd3NEI4ZC95b1lkTnE0REVJTyszRWtXS1QrZnJua3lucnNXL01S?=
 =?utf-8?B?bmNoU25ySitiNzN0T2VlamhtQkdLTjFvK3VkSGtyNlNnaUlPdnpyZ05zSFlq?=
 =?utf-8?B?RXFjcUx2M3JvNTBkakpPVUJIVGpmSGJ4NkZVcEg5M1dmQjZKYWFRdFhxcWdW?=
 =?utf-8?B?Q3podUp4OG45WFlsVVNGVThFcytlS2hqOXBEaDBEa2JHYU44RktHRDczZ3lL?=
 =?utf-8?B?K2JYQkc1S2V6YzFxY0tOSXFhbHlIWjdKK2U1WEdVSTJ4dVlTdmFyL21PZWZG?=
 =?utf-8?B?U1c2Q01jOGo2SmhtWXp2aU9nWG9vVDRsTGxqTGlQNWUrWVdGbUhmZkdyN3lX?=
 =?utf-8?B?M3VhZS90UHpSaUdkOWFGUnVnZmNzQWg1UHF1SVk2WGtkSVpxZnMwZGZUc2Rp?=
 =?utf-8?B?YlUzMmpzRys0SUtnUlpNdVpKdlA5S2F6a3krUWJNYlNRYU40WW1zWmxaelNZ?=
 =?utf-8?B?cGF0NHhCamdobWZGeU5oMnJzbjlKOXB6QkdlKzlZeGExWDFjV2FKV04zdWdv?=
 =?utf-8?B?bjE2TGZZV0hYY1p2UjFtbW12RXdPRHlxRGN4SG9URU96bmFKVmRTVkZBY1hJ?=
 =?utf-8?B?TExqeDVWVXF3T3BCc2s2OXNJU0FxekF1M3hianFpQlFueTdQNmRkT0drRThz?=
 =?utf-8?B?bXlqSEVlcmt3NEZWaFlRTE1ZeHBta3kySVhrTmJieEdsYlRERDhyOWNlVGQ5?=
 =?utf-8?B?T29IZjladXVXMVl0OVhSbjh0TjRYTmJ6TXBCU3hlU2tkZk5GOVZFTm4wMWRr?=
 =?utf-8?B?aVVKOS8xUE5GZ1ZHUUEyNE1ycnBkVmFMMkVTT0VuVkg2V3lpUWdyRTZiakpU?=
 =?utf-8?B?TE9xcWJUUWhkQ09yd0Y1NGNTb3hQZDRHTElwTkg1SHgwcmdOY05YaFQ2QnZO?=
 =?utf-8?B?U3Q0TFE5allDNTBRZVZUMDJMRWNvTkhKeE00Zkt1SXJ6TVNyY2t6S0xQaGhT?=
 =?utf-8?B?T3N1Q1NOZ2xGSVJHWDNBMWhTZ3d4ZUJKakpBUkZBL0FQdXV1aGFQbzlNTDh3?=
 =?utf-8?B?WDcwVERyZVJSK3A0NnNySHdmUDJ5Rld2Vm52YkovVkF0ak1JSXV0VHF3Vlg3?=
 =?utf-8?B?bVhlWmt2bFpRMUhTbllBb3JOVW1lcW1wK1V5TXNFbndpUFN6THdPZnFFTXFi?=
 =?utf-8?B?ZEZWVzI1VjNoa25yNmZRNEJGU2Vsc3BXanpldWx3SXYvSU1ldDJ3NVk0M2tt?=
 =?utf-8?B?Y1N6bWp2MVdyRGpQL003empjQ1Yxd3drVlFURWdGYkxDeVNoTE1McHVhVmU1?=
 =?utf-8?B?SWpqV05xOEgzQlErWFQ3U2tycEN1U0tYS2o5cStNSWJmTTI2akNvUm5ZM1Zh?=
 =?utf-8?B?MGNsd2taT2hlcFBYY1JQb05reXNqUFYrTDczNmROcXZNMUMvUVhja3hqZy9o?=
 =?utf-8?B?QmVmbXF6ZW43aHJpS1gxclNuYUhiNGxFRVBzcGdiSFVUeENmK1FTYm1MSGlL?=
 =?utf-8?B?ZTkrVHZlNFg3aVdKQThjWENHOGduaWR4RHNtYm9yTGRnQXVSTXVDUDVEMElq?=
 =?utf-8?B?NzZMeGxUQktQUEk4QWUzY21zNlBhWTA3ZTJKR2k3MjBpZlY0ZHEydWNKU1JM?=
 =?utf-8?B?ZW5pTWp2V3ZqaVhCUnM5L3FRaCs5MTQvbkkvclZJYlorWGtBczR3UUtKYWI4?=
 =?utf-8?B?UEwrKzR0YUNWTXAzaFk3TTg0M2pQZ2dqejFSOC9NemdKMDVqTmpYQjJoTDRj?=
 =?utf-8?B?NXNwZ21ONzBpZzkvUk55TEZ2TGdBMkE0RWRWMU5oSGhtRHJqVCtGUHBtUjhY?=
 =?utf-8?B?akFPNitqQ0s4NHQreW9qRHJPalAyNSs3UDEzMGQ2cXdEMUVpc0ZZdFNuemti?=
 =?utf-8?B?WTFlMmlqck5xV3ZiMG1rSEk2QVM5UEEwWlY2MisvcUpMcVFBRnFMYmNKc1Iv?=
 =?utf-8?B?U0laeHFxbkF2R2NySWI5ZG1nWk82bkRJYndDem55YUZpVGY0OTBWZVozWmN4?=
 =?utf-8?B?RDFud09ZelVwZzJPWTFsZGxSdzNvS3R6NDF1Y0JLaWJQK1lWdWtrWjk0L0E5?=
 =?utf-8?B?VVNFeGYzQ1hmNzlLMWo4K0NoZWFmejExbGlBSVA5TC9uTjM2aTVocFpFZng3?=
 =?utf-8?B?L2J2MG1LREVzRGdVMlFnUGFOcVJmaVczSURvejliSnFieUxsci83dUZMamox?=
 =?utf-8?Q?SoUJqWzkt409lGJ9QzbxAxmypRZ5rvwgwyDPGmmfjBZt?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12189
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 0aa831a2fddf4f8589b6efdd67d15c5a:solidrun,office365_emails,sent,inline:10be8686da63a4de695eb0fd74d4d4ae
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7124b18f-24d3-4997-a158-08de567c6b90
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|376014|7416014|1800799024|82310400026|14060799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVhGOWVBdVhmWGdOWDQvQXB1WWFYeUxKcDh6Mzhrb0dpMXArYmovb3JobjI3?=
 =?utf-8?B?VmkyZkF6WG1heFF0OForZlo3QTFWWkw3bHFicnNSTHdxL3B1elJyNlUzOVpE?=
 =?utf-8?B?NmNlb1RZSHJWK1hXRVNWaWMxY0NmdU4wTHk1QWp6M3hQZDRENThIdXd2MHp0?=
 =?utf-8?B?T0RIMmQ3NDlrQUk1S2tzYllrT1QrVEpaVENpT2FsR3U0N1NSRXRFZXNndkxZ?=
 =?utf-8?B?OXRkYk9jbVJvZHJPTzZzZmJZTDN3b1FaNFJHZDJEMlM1Mkp5OGVzcGZFYWcy?=
 =?utf-8?B?S3VwY0VzMWNoeVhEejZxVHQyenZMaUlxdVZBNDBqR3A2ZGlxb2lYWi9kaHBz?=
 =?utf-8?B?dWNLZ0F2OTM2VHczcU0yUGFVdEVLcWZaM2xBeW1LR1FkOWxmZnJ1WDBFcTBn?=
 =?utf-8?B?VlRQcS9wRWJVUS9iL1F3NTRMV0IySnB1U0MwalZucThMQXVmMndvdmxwR2tI?=
 =?utf-8?B?d2hSZnJ3cmQwaS9UVjZVUW1pRHNzVmtSVThjUEIvRys0QWNuTlRqclVTRmZk?=
 =?utf-8?B?RW1XalRUbFRIaVlZaW4rQ3FyT2xzNXZaL3FQbkRvSlNhNklGaGNLVXdCMHQx?=
 =?utf-8?B?VEQ2aG9KaXFpelV4Mml4eDNzYjU5ZVdUTEZRVTZJekdob2VGK2E1eWd6N015?=
 =?utf-8?B?UFZmKzBrT1FiWXNSUUZpRjdISzJRVUxqMWp0b1BQUjVoZFdRdzNVUzh6R2x4?=
 =?utf-8?B?OTh3T1hwNnl2U2t2eEJTaTZPMzJaa0YwMysyVlM5U2RTb0wrS2FKNkphT2NW?=
 =?utf-8?B?MHlhUUtKS0orS2ozaVpkWnNwcGJwQS8ySHltS0dGRWxHMFp6S3F0OStFOGxk?=
 =?utf-8?B?bklQb1M5NDMzUUtLY2RBUGZyZWM1VzJTUm5sN09TUEo4eGtjQWxtMEdERnNL?=
 =?utf-8?B?aE5JSW56QjRBdkxteE9wbWtubkpZNnFJV3U3eFlRSUpMZGNtY0U4NVUwWnFh?=
 =?utf-8?B?aWJ4OWtFcTNnR0ZFck04aXVDc2NrNVhuMms2TlJKdkRxVSs3WTVjMVY0dW9P?=
 =?utf-8?B?bWFZMXBWTkdiZkxSeHlTMnNWMHhNTmt1ZUVGSEgvcWhSOHB0OUxFSWQrcUZ0?=
 =?utf-8?B?NkJzeDNBcXdYUkxPUTJtK3pxaGdRNVV5TVVXNEowTUtITXd3RVk0OFl2WWt5?=
 =?utf-8?B?cVVEdE5rOC9wa2E1amR6Znh4SEIzZjVZK2lwczFRck9GMEw2dS9qMFJCOU5I?=
 =?utf-8?B?WU5OOU9BVEc2M3JkeFIxaHdkNDIvbi9leTlWWElzNFpkeDNIMFRzb2RMQld4?=
 =?utf-8?B?L3JDcGpKd2NobFdpVVBIOVJJS0szSW9uNkg1bkt0T05tVThWZzd5b3pXZzg3?=
 =?utf-8?B?TWQ5U3BSLzV3djJ2YzB5MGYxR1ZwWjZvRWlIUkx6Qm8yU0J1dzQ1czY3Qjh4?=
 =?utf-8?B?aTBFYVJNcWFYN2NGbkhnSWJjMFF2Qml5UEV1UHYzMCszUGJzcVdLY3cwZlp6?=
 =?utf-8?B?ZjhzaDl4NXVySzVMQ2h2dWczWFRYTVljSVZ4aXlCZkhObzBJSnhVZElPOFB3?=
 =?utf-8?B?U2hEWDZpSnExTC9NQkk4TXFrVE5RODRCWXdoRnBHVlRXRzczcjRlZUxKYzUr?=
 =?utf-8?B?RG8rVENtb2tTaEVlVkN6dk51bVZwVXJCV3VmNkVlb3pMMWd5MEtrTEsxTHkx?=
 =?utf-8?B?bEZjcG1RMEhPUWxKOHF4NzNIU1pOU2o0elExL1AyRzRaV2FqNlhSTHFaWjRU?=
 =?utf-8?B?NEdvT2RuYUo1bVZZMVErNHg0OHJtWlV3MldGZzN5VGhqMEc2UHVqTVpkVU1o?=
 =?utf-8?B?dnVtZXgwREdUUU9PRThOa1dWMzdORGNWTlpjZ215SWVEYXhoUjBDeWNteTVF?=
 =?utf-8?B?dU9RVDFxeFBaSUpvV25GZitWMWpSTHcvbStjWkgreFhITW9xaHdVOHBiSEtu?=
 =?utf-8?B?YjYvRUhjcEpGMDhlZGRxcmFzNlVmUU5udHovMjJ0bzZSRzlIZExWR0Mzbkpq?=
 =?utf-8?B?UERNRUR3R3FDNC92NVl0UEtuNkxsQWYwY09iTHI4VmlhclFCVmFBS3JHWHZx?=
 =?utf-8?B?TnMwVEhqd0p4ZzNjWnJDODh4SmxkNkc5TlpVeC9KSFpBMk0wU3cxVm93YXRj?=
 =?utf-8?B?THpXMG54MnlXaS9qWGdGYlB2VEQ0aFRKYWludlo5YjVleGtSbEp1TnovY0FX?=
 =?utf-8?B?M2ZYNGpNaVVMdE0rUisrcWZYVU80Smk2dWFQSVYxT28rNnV1OSswcjhJMHRP?=
 =?utf-8?Q?02iitdm5hP5R1I+Ej7rDE+lKjlW2QG8gNb+D5eGL9+gt?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(376014)(7416014)(1800799024)(82310400026)(14060799003)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 10:29:21.6874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a4f2bd-96f4-44a0-19a1-08de567c71c5
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11512

In-tree phy-can-transceiver driver has already implemented a local
version of devm_mux_state_get_optional.

The omap-i2c driver gets and selects an optional mux in its probe
function without using any helper.

Add new helper functions covering both aforementioned use-cases:

- mux_control_get_optional:
  Get a mux-control if specified in dt, return NULL otherwise.
- devm_mux_state_get_optional:
  Get a mux-state if specified in dt, return NULL otherwise.
- devm_mux_state_get_selected:
  Get and select a mux-state specified in dt, return error otherwise.
- devm_mux_state_get_optional_selected:
  Get and select a mux-state if specified in dt, return error or NULL.

Existing mux_get helper function is changed to take an extra argument
indicating whether the mux is optional.
In this case no error is printed, and NULL returned in case of ENOENT.

Calling code is adapted to handle NULL return case, and to pass optional
argument as required.

To support automatic deselect for _selected helper, a new structure is
created storing an exit pointer similar to clock core which is called on
release.

To facilitate code sharing between optional/mandatory/selected helpers,
a new internal helper function is added to handle quiet (optional) and
verbose (mandatory) errors, as well as storing the correct callback for
devm release: __devm_mux_state_get

Due to this structure devm_mux_state_get_*_selected can no longer print
a useful error message when select fails. Instead callers should print
errors where needed.

Commit e153fdea9db04 ("phy: can-transceiver: Re-instate "mux-states"
property presence check") noted that "mux_get() always prints an error
message in case of an error, including when the property is not present,
confusing the user."

The first error message covers the case that a mux name is not matched
in dt. The second error message is based on of_parse_phandle_with_args
return value.

In optional case no error is printed and NULL is returned.
This ensures that the new helper functions will not confuse the user
either.

With the addition of optional helper functions it became clear that
drivers should compile and link even if CONFIG_MULTIPLEXER was not enabled.
Add stubs for all symbols exported by mux core.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/mux/core.c           | 175 ++++++++++++++++++++++++++++++++++++-------
 include/linux/mux/consumer.h | 111 ++++++++++++++++++++++++++-
 2 files changed, 253 insertions(+), 33 deletions(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index a3840fe0995f..df30f96ec076 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -46,6 +46,16 @@ static const struct class mux_class = {
 	.name = "mux",
 };
 
+/*
+ * struct devm_mux_state_state - 	Tracks managed resources for mux-state objects.
+ * @mux:				Pointer to a mux state.
+ * @exit:				An optional callback to execte before free.
+ */
+struct devm_mux_state_state {
+	struct mux_state *mstate;
+	int (*exit)(struct mux_state *mstate);
+};
+
 static DEFINE_IDA(mux_ida);
 
 static int __init mux_init(void)
@@ -522,11 +532,12 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
  * @mux_name: The name identifying the mux-control.
  * @state: Pointer to where the requested state is returned, or NULL when
  *         the required multiplexer states are handled by other means.
+ * @optional: Whether to return NULL and silence errors when mux doesn't exist.
  *
  * Return: A pointer to the mux-control, or an ERR_PTR with a negative errno.
  */
 static struct mux_control *mux_get(struct device *dev, const char *mux_name,
-				   unsigned int *state)
+				   unsigned int *state, bool optional)
 {
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args args;
@@ -542,7 +553,9 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 		else
 			index = of_property_match_string(np, "mux-control-names",
 							 mux_name);
-		if (index < 0) {
+		if (index < 0 && optional) {
+			return NULL;
+		} else if (index < 0) {
 			dev_err(dev, "mux controller '%s' not found\n",
 				mux_name);
 			return ERR_PTR(index);
@@ -558,8 +571,12 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 						 "mux-controls", "#mux-control-cells",
 						 index, &args);
 	if (ret) {
+		if (optional && ret == -ENOENT)
+			return NULL;
+
 		dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
-			np, state ? "state" : "control", mux_name ?: "", index);
+			np, state ? "state" : "control",
+			mux_name ?: "", index);
 		return ERR_PTR(ret);
 	}
 
@@ -617,10 +634,23 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
  */
 struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
 {
-	return mux_get(dev, mux_name, NULL);
+	return mux_get(dev, mux_name, NULL, false);
 }
 EXPORT_SYMBOL_GPL(mux_control_get);
 
+/**
+ * mux_control_get_optional() - Get the optional mux-control for a device.
+ * @dev: The device that needs a mux-control.
+ * @mux_name: The name identifying the mux-control.
+ *
+ * Return: A pointer to the mux-control, an ERR_PTR with a negative errno.
+ */
+struct mux_control *mux_control_get_optional(struct device *dev, const char *mux_name)
+{
+	return mux_get(dev, mux_name, NULL, true);
+}
+EXPORT_SYMBOL_GPL(mux_control_get_optional);
+
 /**
  * mux_control_put() - Put away the mux-control for good.
  * @mux: The mux-control to put away.
@@ -657,8 +687,8 @@ struct mux_control *devm_mux_control_get(struct device *dev,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	mux = mux_control_get(dev, mux_name);
-	if (IS_ERR(mux)) {
+	mux = mux_get(dev, mux_name, NULL, false);
+	if (IS_ERR_OR_NULL(mux)) {
 		devres_free(ptr);
 		return mux;
 	}
@@ -677,7 +707,7 @@ EXPORT_SYMBOL_GPL(devm_mux_control_get);
  *
  * Return: A pointer to the mux-state, or an ERR_PTR with a negative errno.
  */
-static struct mux_state *mux_state_get(struct device *dev, const char *mux_name)
+static struct mux_state *mux_state_get(struct device *dev, const char *mux_name, bool optional)
 {
 	struct mux_state *mstate;
 
@@ -685,12 +715,10 @@ static struct mux_state *mux_state_get(struct device *dev, const char *mux_name)
 	if (!mstate)
 		return ERR_PTR(-ENOMEM);
 
-	mstate->mux = mux_get(dev, mux_name, &mstate->state);
-	if (IS_ERR(mstate->mux)) {
-		int err = PTR_ERR(mstate->mux);
-
+	mstate->mux = mux_get(dev, mux_name, &mstate->state, optional);
+	if (IS_ERR_OR_NULL(mstate->mux)) {
 		kfree(mstate);
-		return ERR_PTR(err);
+		return ERR_CAST(mstate->mux);
 	}
 
 	return mstate;
@@ -710,41 +738,130 @@ static void mux_state_put(struct mux_state *mstate)
 
 static void devm_mux_state_release(struct device *dev, void *res)
 {
-	struct mux_state *mstate = *(struct mux_state **)res;
+	struct devm_mux_state_state *devm_state = res;
 
-	mux_state_put(mstate);
+	if (devm_state->exit)
+		devm_state->exit(devm_state->mstate);
+
+	mux_state_put(devm_state->mstate);
 }
 
 /**
- * devm_mux_state_get() - Get the mux-state for a device, with resource
- *			  management.
- * @dev: The device that needs a mux-control.
- * @mux_name: The name identifying the mux-control.
+ * __devm_mux_state_get() - Get the optional mux-state for a device,
+ *			    with resource management.
+ * @dev: The device that needs a mux-state.
+ * @mux_name: The name identifying the mux-state.
+ * @optional: Whether to return NULL and silence errors when mux doesn't exist.
+ * @init: Optional function pointer for mux-state object initialisation.
+ * @exit: Optional function pointer for mux-state object cleanup on release.
  *
  * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
  */
-struct mux_state *devm_mux_state_get(struct device *dev,
-				     const char *mux_name)
+static struct mux_state *__devm_mux_state_get(struct device *dev, const char *mux_name,
+					      bool optional,
+					      int (*init)(struct mux_state *mstate),
+					      int (*exit)(struct mux_state *mstate))
 {
-	struct mux_state **ptr, *mstate;
+	struct devm_mux_state_state *devm_state;
+	struct mux_state *mstate;
+	int ret;
 
-	ptr = devres_alloc(devm_mux_state_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
+	devm_state = devres_alloc(devm_mux_state_release, sizeof(*devm_state), GFP_KERNEL);
+	if (!devm_state)
 		return ERR_PTR(-ENOMEM);
 
-	mstate = mux_state_get(dev, mux_name);
-	if (IS_ERR(mstate)) {
-		devres_free(ptr);
-		return mstate;
+	mstate = mux_state_get(dev, mux_name, optional);
+	if (IS_ERR_OR_NULL(mstate))
+		goto err_mux_state_get;
+
+	if (init) {
+		ret = init(mstate);
+		if (ret)
+			goto err_mux_state_init;
 	}
 
-	*ptr = mstate;
-	devres_add(dev, ptr);
+	devm_state->mstate = mstate;
+	devm_state->exit = exit;
+	devres_add(dev, devm_state);
 
 	return mstate;
+
+err_mux_state_init:
+	mux_state_put(mstate);
+err_mux_state_get:
+	devres_free(devm_state);
+	return ERR_PTR(ret);
+}
+
+/**
+ * devm_mux_state_get() - Get the mux-state for a device, with resource
+ *			  management.
+ * @dev: The device that needs a mux-control.
+ * @mux_name: The name identifying the mux-control.
+ *
+ * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
+ *
+ * The mux-state will automatically be freed on release.
+ */
+struct mux_state *devm_mux_state_get(struct device *dev, const char *mux_name)
+{
+	return __devm_mux_state_get(dev, mux_name, false, NULL, NULL);
 }
 EXPORT_SYMBOL_GPL(devm_mux_state_get);
 
+/**
+ * devm_mux_state_get_optional() - Get the optional mux-state for a device,
+ *				   with resource management.
+ * @dev: The device that needs a mux-state.
+ * @mux_name: The name identifying the mux-state.
+ *
+ * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
+ *
+ * The mux-state will automatically be freed on release.
+ */
+struct mux_state *devm_mux_state_get_optional(struct device *dev, const char *mux_name)
+{
+	return __devm_mux_state_get(dev, mux_name, true, NULL, NULL);
+}
+EXPORT_SYMBOL_GPL(devm_mux_state_get_optional);
+
+/**
+ * devm_mux_state_get_selected() - Get the mux-state for a device, with
+ *				   resource management.
+ * @dev: The device that needs a mux-state.
+ * @mux_name: The name identifying the mux-state.
+ *
+ * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
+ *
+ * The returned mux-state (if valid) is already selected.
+ *
+ * The mux-state will automatically be deselected and freed on release.
+ */
+struct mux_state *devm_mux_state_get_selected(struct device *dev, const char *mux_name)
+{
+	return __devm_mux_state_get(dev, mux_name, false, mux_state_select, mux_state_deselect);
+}
+EXPORT_SYMBOL_GPL(devm_mux_state_get_selected);
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
+ *
+ * The mux-state will automatically be deselected and freed on release.
+ */
+struct mux_state *devm_mux_state_get_optional_selected(struct device *dev,
+						       const char *mux_name)
+{
+	return __devm_mux_state_get(dev, mux_name, true, mux_state_select, mux_state_deselect);
+}
+EXPORT_SYMBOL_GPL(devm_mux_state_get_optional_selected);
+
 /*
  * Using subsys_initcall instead of module_init here to try to ensure - for
  * the non-modular case - that the subsystem is initialized when mux consumers
diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
index 2e25c838f831..7d591be26b64 100644
--- a/include/linux/mux/consumer.h
+++ b/include/linux/mux/consumer.h
@@ -16,6 +16,8 @@ struct device;
 struct mux_control;
 struct mux_state;
 
+#ifdef CONFIG_MULTIPLEXER
+
 unsigned int mux_control_states(struct mux_control *mux);
 int __must_check mux_control_select_delay(struct mux_control *mux,
 					  unsigned int state,
@@ -54,11 +56,112 @@ int mux_control_deselect(struct mux_control *mux);
 int mux_state_deselect(struct mux_state *mstate);
 
 struct mux_control *mux_control_get(struct device *dev, const char *mux_name);
+struct mux_control *mux_control_get_optional(struct device *dev, const char *mux_name);
 void mux_control_put(struct mux_control *mux);
 
-struct mux_control *devm_mux_control_get(struct device *dev,
-					 const char *mux_name);
-struct mux_state *devm_mux_state_get(struct device *dev,
-				     const char *mux_name);
+struct mux_control *devm_mux_control_get(struct device *dev, const char *mux_name);
+struct mux_state *devm_mux_state_get(struct device *dev, const char *mux_name);
+struct mux_state *devm_mux_state_get_optional(struct device *dev, const char *mux_name);
+struct mux_state *devm_mux_state_get_selected(struct device *dev, const char *mux_name);
+struct mux_state *devm_mux_state_get_optional_selected(struct device *dev, const char *mux_name);
+
+#else
+
+static inline unsigned int mux_control_states(struct mux_control *mux)
+{
+	return 0;
+}
+static inline int __must_check mux_control_select_delay(struct mux_control *mux,
+							unsigned int state, unsigned int delay_us)
+{
+	return -EOPNOTSUPP;
+}
+static inline int __must_check mux_state_select_delay(struct mux_state *mstate,
+						      unsigned int delay_us)
+{
+	return -EOPNOTSUPP;
+}
+static inline int __must_check mux_control_try_select_delay(struct mux_control *mux,
+							    unsigned int state,
+							    unsigned int delay_us)
+{
+	return -EOPNOTSUPP;
+}
+static inline int __must_check mux_state_try_select_delay(struct mux_state *mstate,
+							  unsigned int delay_us)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int __must_check mux_control_select(struct mux_control *mux,
+						  unsigned int state)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int __must_check mux_state_select(struct mux_state *mstate)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int __must_check mux_control_try_select(struct mux_control *mux,
+						      unsigned int state)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int __must_check mux_state_try_select(struct mux_state *mstate)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int mux_control_deselect(struct mux_control *mux)
+{
+	return -EOPNOTSUPP;
+}
+static inline int mux_state_deselect(struct mux_state *mstate)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+static inline struct mux_control *mux_control_get_optional(struct device *dev,
+							   const char *mux_name)
+{
+	return NULL;
+}
+static inline void mux_control_put(struct mux_control *mux)
+{
+	return;
+}
+
+static inline struct mux_control *devm_mux_control_get(struct device *dev, const char *mux_name)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+static inline struct mux_state *devm_mux_state_get(struct device *dev, const char *mux_name)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+static inline struct mux_state *devm_mux_state_get_optional(struct device *dev,
+							    const char *mux_name)
+{
+	return NULL;
+}
+static inline struct mux_state *devm_mux_state_get_selected(struct device *dev,
+							    const char *mux_name)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+static inline struct mux_state *devm_mux_state_get_optional_selected(struct device *dev,
+								     const char *mux_name)
+{
+	return NULL;
+}
+
+#endif /* CONFIG_MULTIPLEXER */
 
 #endif /* _LINUX_MUX_CONSUMER_H */

-- 
2.43.0



