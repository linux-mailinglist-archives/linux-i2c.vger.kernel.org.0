Return-Path: <linux-i2c+bounces-15257-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5884ED39414
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 11:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 127763016BBC
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 10:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400E830BB82;
	Sun, 18 Jan 2026 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="rfZrMU6/";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="rfZrMU6/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022074.outbound.protection.outlook.com [52.101.66.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69388293C42;
	Sun, 18 Jan 2026 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.74
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768732187; cv=fail; b=tKxq7xzfZ6EYUG19+XNBK4rKN13Hp2cfy62CsmnUk07cRuxznjmjLGF7yfHvHsZLZ6bXiW9Qbv/38jyFViQ5q3UyfxXVLFEtxU6JEr423uY8iT6ZQRmFO0Sr59crEpaz7ORRa2jlivdwfQGOtCCdrfwG4+EXDQ01ZJYaWTJu5Ug=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768732187; c=relaxed/simple;
	bh=H+dxOlw7D+/ac+pzWaD9F9Ao/kAHfSrb2565gnhAQBo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AdMggLfCAjD3vVhYmpcI5/SUKPNWIwia4gePSLjjp62ejORxiRUDE+0B6vl30JJPybvdYlHTm7PEBI4zWF7w6On4tkFu5FuZ8BNMF8oCG+fe3ENZoXnuGYJ0FNb1tkzEhPhbh7EkgoPUwl9QfmPNUAVA4jlhNkM/RYVRE5FEtIU=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=rfZrMU6/; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=rfZrMU6/; arc=fail smtp.client-ip=52.101.66.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YTTcJu3rMf7PoLo/rYUsh+0AB7bM/Nx8gxp0pgOOcnV2BhwH2lJychoL+pztXD2YIcmUUU23DwDO3U/3kJe5lgCysG6h1benBQxaYdtyFzB7SOhs1CuQyBNupmYCBog23w1OE8RAtPjegZgF7YX6SAtlctHtiWQCs7+oIPN8HTUVdXZ3OYldMmOnUuSITlbXCOoQirGOgdZ8pqt6GPk9LMaj7ZKAP94Vh64X4+Q2brFlrFVfSfyi9n6vtGcVTJl18XzrcX3Gu6iVSmxFmZfPih28m7arKjdDVLci8BU+vAdcxuAHpIsNFpJ3AmTU+SUZUUy5hBFhBPiaLGI9PQjSJg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rby9wyHlsPISYWVM8A3ug1fNuimNJisYbronpuurKUs=;
 b=fT0xZwnF3eA0Z4d2SFJiER7ywH0NVByvljRdLZzqpbfOLy/4YLWWc3y3WiSUBRdUuAHrIBU9LsTUDVhU+/JUvhydUtnQ7cg0I59OwGAb2E/XP/TgOUiTzVe0X0IiNNE+cph5r5DsoQaEhdzlV//fXaa6PkwaoLhj/psG8bC1rJXoQdx38UYWaSQo7D+tyLXgQky99Gh7VpJJsHTuxOa0YoHnzu26O4xqqjXsg+XTTJ2Zd98qN5OXvKsTMHeLHwc9LC+70rq2hfVO5QnsnTx8NgOdAQY61Sd1nykB6cva53BlloIMWrvwl+iqi4OoTbnKJCrGI2rpdh5H1efPmdRelQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rby9wyHlsPISYWVM8A3ug1fNuimNJisYbronpuurKUs=;
 b=rfZrMU6/prpx1dUXiynvgB2tOqmHWDOQ/sdu7bxkMQUbtbL7FAUj6YtpQW3EaUsr+gaTKOATflbEuWIw5KPxn++0zdnH5ivEDpHiWLFA+PJvHV7WK7+/Jx5Yz+4o6tQu3SCzh8Xa+rQKkyTDvNBo3f7gwyGco3xO2zdKdyfO74s=
Received: from AS4P250CA0010.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::7)
 by DB9PR04MB8092.eurprd04.prod.outlook.com (2603:10a6:10:24f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Sun, 18 Jan
 2026 10:29:37 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:20b:5df:cafe::14) by AS4P250CA0010.outlook.office365.com
 (2603:10a6:20b:5df::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Sun,
 18 Jan 2026 10:29:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Sun, 18 Jan 2026 10:29:36 +0000
Received: from emails-477551-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-103.eu-west-1.compute.internal [10.20.5.103])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 6126680196;
	Sun, 18 Jan 2026 10:29:36 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768732176; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=Rby9wyHlsPISYWVM8A3ug1fNuimNJisYbronpuurKUs=;
 b=EtXdPqfmC1aCsCbyFXtRP99qfPu9377gDncqp3Dbt1VkzNvWybnsiFqm59sGQqJom+iYO
 gAwLMjRh/N4M0WmLY1RGynModAJ/mRaOzrckQZXLEhhmvutWshF/YDLqi1HRoutinfqk+wE
 2P2ee3FKLCyeZrkV7UN0TMMErLCRW+o=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768732176;
 b=Fewz8eoso8+tgITBTWiBVQ3jIjNMORPw4/rCxxJkyYshhn2VPr5bQCwbRbAYOWAUdizs+
 xsbKxtpUUT3EuHKJL9nQz3QJFFsWMkMFvpIdrqLTI8Tix3M8j31NcvnA65gL3vcoWgR1QZ0
 45eIOxky+ZRExkUccxh7s8v0lZVb/fk=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5PhvX7wMgx/Ef4Mg1TjrgF6vvCuI2EfOheSYaDVpsTf7KdzRfX+xgDZo/ouucb061o/fUfQqMecpidsttXwv8x4t1xX97qsEvbY77wrLdjH5xyFgZ3InP4hrYXEoc+7UF0zwCiFFTf0UOhxBHj5AE5Goz8Xnb4KQpOz9r9KrmgCOV2Fimm0KyvvaaX4fNJD1s0ULGmAz8gzrS+P1SC5U1ImjHEE7Wlz3zClhv8tGFUp+jDdYxYHmltF4ZYdFIQCp+HNLo+Y6jPClwIohPvOM/dd9/ZYjZX6G8Nu4m4FuZfkvDKC00ob+HD6MplubIa/P6pnicOyAsSVVofTw2CnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rby9wyHlsPISYWVM8A3ug1fNuimNJisYbronpuurKUs=;
 b=c728iXHW/gxmUndyFEQRJ/uLvgyFUgsvCE8qi5P+p7W0MIJlsPjnuCgzMEKh3ZT60nG/3vzzYjwA/6ximkhn7/azC0MGMqlZ+/KG1oCPXWP5Af7rby3VDjvBc/TzHP4JTZioumJOy0xeacSU8unqFlN/Pr2ydUBk7q7qqcd9OiBGq+3I1+ZJ7mVRpTI4V/jXukLI4uiNNXiuGp7ZF5/5xYTrjYr8HeSSK1T5HfEttj+bB8iaPdMPU7X+BozSAj+/b1yz6f9unhUWi1fBkjhwv6DnuBRuYbViQ3SujT9icQzmVFnkAvtajQIA3240OCynJKvFjunNTGDXPdgjomZk9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rby9wyHlsPISYWVM8A3ug1fNuimNJisYbronpuurKUs=;
 b=rfZrMU6/prpx1dUXiynvgB2tOqmHWDOQ/sdu7bxkMQUbtbL7FAUj6YtpQW3EaUsr+gaTKOATflbEuWIw5KPxn++0zdnH5ivEDpHiWLFA+PJvHV7WK7+/Jx5Yz+4o6tQu3SCzh8Xa+rQKkyTDvNBo3f7gwyGco3xO2zdKdyfO74s=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GV2PR04MB12189.eurprd04.prod.outlook.com (2603:10a6:150:33a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 10:29:20 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 10:29:20 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 18 Jan 2026 12:29:02 +0200
Subject: [PATCH v5 6/7] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-rz-sdio-mux-v5-6-3c37e8872683@solid-run.com>
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
	PAXPR04MB8749:EE_|GV2PR04MB12189:EE_|AMS0EPF000001B6:EE_|DB9PR04MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f0e842-2c9d-46c2-b4e7-08de567c7aaf
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?emp6Ky9lVDFLTU5SR1NJd0RzVGVkTndwMVpmLzFMb3hoeUZBT3Z2cExrbXJN?=
 =?utf-8?B?S0laN0RFZFZGeVhuODlwbm5UU3ZoWWRQOTNFL2FqZ0diQlRZZlE0V2NhQ04x?=
 =?utf-8?B?eERTWTJtWkJQZkpKMzBQdXJFb1BnTXNJclJlRFY2clBmT1cwSGthV3RSMGRr?=
 =?utf-8?B?cjFxNEphWC9TWXJMS3hqdUxMc2xxUm9rNFhsbG9tcHUwNW02Ny94UFpOazcz?=
 =?utf-8?B?RW9iM3FFR2hLS3FWRi9yZHo5OUNqZENwY0kyTEpzR2IrdXd4MUprRGpUN2Zl?=
 =?utf-8?B?aG15WFJJQkdRNFIrZEMxODAzc0JTVDhvYmo3Vm5jZUJTdGFCRDNvYmFvYzBC?=
 =?utf-8?B?bS9sd3dRTTgrelBOL3ZKOXVJcVZIenJrV2gvUjNyYmJpcGkwS1lPTFdCb3J3?=
 =?utf-8?B?d0J5UDl2OGwxVFhQemcxVzNrY3ZidG5wbVFtZGFCbGZ1MEZMQU12djAySy9O?=
 =?utf-8?B?MDJOSEFiZk83ZFNOWllLSEZGNDYwMU96N1kycnY1MG12djdtc2JjWEVzLzUy?=
 =?utf-8?B?RnZRa2JFQWIvUHV1L0JtVWtmZTlDRVJWS25Bd1ZIU1hlU1BodGE1bHFxQTM4?=
 =?utf-8?B?cTNNTkhqeUlCNzUzTU51VytMeU05OFluZm9iTWZLcmo1eTdRaGtXNTByR2E0?=
 =?utf-8?B?QlZpM1ZKR0RlSDdBTWdFeGlkMTVLakxob2hzWndsbHpTMFRDbDhTT3JGYlFM?=
 =?utf-8?B?ZEYvMU5PNEFqcDZveXRjWC9EbHVHdmtvWWR2dVo5YVdNcStvUnFHRWowdGlw?=
 =?utf-8?B?L3poL2VEYU9GaUFZdVBMVjNuRmk5dDFDTEZQcldHWEhrUkh6blp1TE5qd2Nt?=
 =?utf-8?B?cjBlRm9qNWg5UFlOK05qemxIOFFBUTcyWWFIQXBrVEVhTEFlYlo5TzgxaTNF?=
 =?utf-8?B?dlJCRGZJazQvUlI0SjZuNFN1Q21NSDg5a0lxZ2M3SDdaczZtUzJQODdoaGFj?=
 =?utf-8?B?VEhrWmg5M1llSFVqSWdKODlSbmRaNVZqczVRSVVkQ2d1SGZWamlRSWRlRGtn?=
 =?utf-8?B?Ky9SN3p4L3RGc0NELzdmSjRWOTFHTkVRWkFZYzdtNW5ydEV5MkdYUW52NkFr?=
 =?utf-8?B?cHBvNzluOXpFVEF3MHUvNFd3Z2daeW9ZMjd4MDJuZlNMdWZiQ1g4R3hWbFcz?=
 =?utf-8?B?UWE2MitXMit2djZYbk9MMnd1OWNlZGZtbjAycWo0b3ZHQnNjV0NCVWZBaTJP?=
 =?utf-8?B?aHdYOTdBRm1HM3l4amFPOGoybTlMU2w4clptRjZPR0NRZFhoTy9rbFFiczM0?=
 =?utf-8?B?bm5FNmhCQTNtQjRuNHl5bEt4OHFiRFQ0emZWYTBuRDlxQ3hhWGpMN2FrNk5p?=
 =?utf-8?B?RFVINktQazU0SFdINzZIUHVpZElVRjR6bnFYWDRBcmM1NUltWk1xYkZzKzE4?=
 =?utf-8?B?L0UwMnVjRmFVTkhqdFEvMmRaU2FrNGQ0eWlvN0hybUdTaFNJQW1HTGY3YmV4?=
 =?utf-8?B?SWFBZEFPQ2tpSTFXZkFDSnA3YldKZEtudzhaNjA4VDhYd0VscHozVmJESDZt?=
 =?utf-8?B?WVQ1dDh4dXpHVkY3QXRjVmlVWG9wL3A5RkUyd1pKY0pmQmFxUzRLNVg0eWRI?=
 =?utf-8?B?MGhvcEltWDh0amVzUGNlajR0eFV3czhFNENkYm4wYklZblNtRzExZkVNR1J1?=
 =?utf-8?B?OGNhTU80VWQraElpU0xEK1FNc1BnK3J2K0VvQUZuenZEZVhHT3NGVDBreTNY?=
 =?utf-8?B?bjNIK1lZMGRKR2RxdmpUOG96bkhUeHJTU1hpOGh6MzZiOVFTQjFyck1zem9F?=
 =?utf-8?B?b0E4TmthcFNUU1ZTTWNIYzl4RnlTTjRJQzVoQndZLzFCeWVmdVRTRmd1bHJo?=
 =?utf-8?B?TkJzcExFSllpdHJRbnp0ajNzSXlISmI3OEZMUldFSGFaWEJOem00NnhmTTFo?=
 =?utf-8?B?ODFxYlgvZmYrdzFnMTJiejRCeTZCczR2dW51ZkI2VXRnMlo3K3l4ZUVHQnVT?=
 =?utf-8?B?QUlmVVNtbDhjZ1l3NzBvTnoxcHdGYTN1QTJUdExlZDJzVUhKNml2NjhsV3Zq?=
 =?utf-8?B?TkQvTm1vUnoyT2N6YUtsOTIrbE1VdUxoOTFvSHlMajArc0c5Vm0wQUlsL1RE?=
 =?utf-8?B?U29PazVUQXBjSVNEUjM4dXVIMmplZXFzYUFQL29mdWErRHpZdVZMMDdUQW52?=
 =?utf-8?B?L1Q1ak9Yb0FPdUFHVlQ2WUk0ZWtZQS9hR2l6MFQ2OFlTb0JycG5XSTI3RTMr?=
 =?utf-8?Q?CZ3EKQJMazOMPFAkG9WEpH47OdXu/SoMrBD3t5S8DZW6?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12189
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: f9a4f63ef4da49bf8bba7da749330502:solidrun,office365_emails,sent,inline:10be8686da63a4de695eb0fd74d4d4ae
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ea6d7b91-2d41-470b-01aa-08de567c70a0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|82310400026|376014|7416014|35042699022|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?enJLZTAzR3k0dUp4MHRESllBMkpQMHo5NHpHMHRxcG96eTRKMitVMy84RUI3?=
 =?utf-8?B?bHNRdyswSitLeU1FNFZuTUsxclUwUjZWdTJkSmIvR2t4TWFBT3pDK0owR0V5?=
 =?utf-8?B?YVlKZnN0OUhBcUN0cmRoM25rN01uZ0VjUDFyMFQ1WFpBVkhobUlkQnRjREcw?=
 =?utf-8?B?WGtSZTBaZVpsNWpCR0tEOEkxa2VWL05qbklNMlBSTmxTN2ovSDFKNWllS2NK?=
 =?utf-8?B?TURvUTdPbmtYeWxpNG1obkFoRjFBbUFyYzUwdFd0M2NhcG9rTVlJRVovYnU2?=
 =?utf-8?B?N2I4SXVoQyswakF4a3IwWUg4c3JzYzJmTWV5TlBweFZZemJ4cTR0QkdSU2pN?=
 =?utf-8?B?a3ozc3hGQTdUU1RQVUVTQTlUT0ZNRkJ0c0V0OHhLMzErTDdNaU5nT0QxUHpU?=
 =?utf-8?B?YWVtbXU4cXRob0l6Q001cVhzQTFueHpidEcreEE2STEwaU5UMWozZVAzLzlh?=
 =?utf-8?B?ZzQvSUtJUmdGK1lYT1Q0aStxNGtwWHUrK1l3WEFxSEtjSGtCb0dNclVqTkNu?=
 =?utf-8?B?V3hyWUczZ2pjQmxDdnRzd3luRkcxempUaXhGYlRzQUtLd0hWM1hZNkFuUjYr?=
 =?utf-8?B?c0lFaXlBVHhzVzlEZ3BNd2dwcUkyUUVKcCtNdUljOU01S1Buc2hPQklWcjRC?=
 =?utf-8?B?TC9uTWt0VFVDSjVNT3BONS9MV1kzMVBhL1Nya1FQN1prVTlyM0QwR0J6UFQ2?=
 =?utf-8?B?ZnQ1OFcwODBLVTVWS3FIUnAxYlZvcG56aFZZU2d0b2JhdHp6aEZBWjlJc1lx?=
 =?utf-8?B?WFZPRW1aNFpaRnFiaW9DODBKamdKY2tRZE83RVVPYkYvV1FIM0M3eTJkTW9J?=
 =?utf-8?B?MjNPbVVMb1RWZGEvNHdYd3psSHNocEpVOThkRkYrcXQ3MFo5RERBUEJPdFN6?=
 =?utf-8?B?NkliNTZyaWJNWlcxYTJXQy9NWW9nWVZFdDN3b1p3Qk5laW5JY1lDa0lMMGQ0?=
 =?utf-8?B?NXd3bHhucnRzU0xyb2xsRG1rSkU1NDRtb3ZBUW9SSmIvN3RsVThHbkdhTjZ2?=
 =?utf-8?B?ZGRWSktJTkh4UWxGcjYwWmxqQlNNTXNTcjliUlZKaHJxU21iYXRlbDlpVldO?=
 =?utf-8?B?YXpJR3ViSXBoaG5GS0hrZG1xK1JIY3V2YlF1dC9tUlU5TnBUcXlURWZKSGRQ?=
 =?utf-8?B?UG9OcS9LOGRNbXVjVHAxVk9nTDdGWlRUZVBmVGEreGs4UWxhVGZjTWlwSDAx?=
 =?utf-8?B?UWhhOWxMUmlVQk5Bc0NmKzVZd1h3SmoyTTNxZkNmU2orUWlGZnF2TmIrdDFJ?=
 =?utf-8?B?RnpMRkkzYjhrKzRKSVhNQnNsR0w3YWRZaFoxVmxHbUJQYkZ0bW1yaFBuaENi?=
 =?utf-8?B?b2Z6ZE5YcERIUnRPR04zQUtKNzkrenkyN0JPOFpERU5YS0ZrR1Y0d01LVFNi?=
 =?utf-8?B?bE9XcWlkQnZCSzFHRUNhWlpRQUNKdm81dCtpRC9JMWpJQm90S2tlN2JHU3hG?=
 =?utf-8?B?YzlYaCtkV2FXczlzQVovdnIwV2hVNGVpcUN6cW9UOU5aRTNqVHUzbFl4YmQz?=
 =?utf-8?B?Y3VVbSsxWWFzSnZFRUtJZFRsYjFrUEozRnIwRG5xdGZGUkxZVjdDOUcwVTQx?=
 =?utf-8?B?cVlPZldMVTlRd21paktQR2hTaG83MEtiU2UzUGVLazcvQmJIcUdySG5UOUJN?=
 =?utf-8?B?dWt1Q3lQQkJOWjZKcWpSbkpyWTlkWDNwaTcyT2ZtbGloK2ZVcmczUDdRR1FW?=
 =?utf-8?B?UVVRVUJ5VkloMU83SEtkRmFYRTk1eUR4SGlNVUFWaCtwU01mOXZUbitIY1dw?=
 =?utf-8?B?UWRRRnRKQlRieHNjMzU3OGEwS1lXVXJWUnFYc0VSZVNzSjRaVGhHYTc0T1VW?=
 =?utf-8?B?amh4UWRpWXBHMi82eXk4Rit4UXV6Vmk3ekZ0bU9kNnpYOStoM0JmUXhNK2hy?=
 =?utf-8?B?WHF0OFY2UnYwUDVVTktVNURlZVYrOWtNb1dvSzB4RW9UVnlCQWdMSWl6akZB?=
 =?utf-8?B?bHlmZW9oeGZ4dzFLWXNsU2RKVDFtempvQkVabjBtM09HQlJzVjNzMDN0bStT?=
 =?utf-8?B?Z2xKYWkvdTJpR1VRTmZLUkJ3a1dLUTBZV0pBV1RRMFdCR2o2Q1RSY3pkSzZE?=
 =?utf-8?B?Vm1DTi9sUXdVZHc4TStJRmJxVGYrU1B4NnNNUW01OW50WVdhUGNpcGd3azRt?=
 =?utf-8?B?TUlvVmhrTGZxekkveHFhZVBwK2ljamlOMjE3S2lhOFhGZEExT1UzRjJQZUxo?=
 =?utf-8?B?bG53aytRWXcvN2lnZ2hXeG93dXJWNzJlUkRoUXJtY2Rya0VnZkVWMEVGemdz?=
 =?utf-8?B?YnlNa1ZaMUZYNVZ5SitITmNnWEV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(82310400026)(376014)(7416014)(35042699022)(36860700013)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 10:29:36.6456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f0e842-2c9d-46c2-b4e7-08de567c7aaf
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8092

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
index c754ea71f51f..64fac0d11329 100644
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
2.43.0



