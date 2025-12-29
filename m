Return-Path: <linux-i2c+bounces-14831-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D560CE6A05
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 13:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B02763007E4B
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 12:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6511B30F549;
	Mon, 29 Dec 2025 12:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="QHkQQETa";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="QHkQQETa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023099.outbound.protection.outlook.com [52.101.72.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C5E1F4262;
	Mon, 29 Dec 2025 12:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.99
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767009765; cv=fail; b=KgjVF62s7A2PKWr3RRn/qlHgu/1VXJeivuViGQH95cCeCGVLFvAdkSUUsICtpGnv85TEQhC7O4CfMwi/tS+uCZbLS340eoy+NBKjX8dt1RVQNh5+or91oXnWatDSrX6F8oAcmYvc+i83bBsw1isMeNE5TeDfF5BwFJOWgPMVjLs=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767009765; c=relaxed/simple;
	bh=ZDWcuB1GzVwbhzSL1QVAfGRHdjuyH2iDl8eV04oieo4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uQtPcbLRyOg6LWf8493ij1jjfRwNlli/tgCFUTITV3jiUtGyQRciL5/81FmTzX1jsYItSe2+7E5Ue7VcVn58BGAkoMKL+3GQFGz0tMTXkRLRmv1kMyrCiZJagVPiA8GmdCcHNscNYdxyqYc7yOHTPGBJR2x9OKNGs3sezNmBfsw=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=QHkQQETa; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=QHkQQETa; arc=fail smtp.client-ip=52.101.72.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bW44mLgDznML8tzG/UZQBi74ZmEPhIVuLFiSFCssKoMjndU49ZjNzoP08N/UfTTDNmBB/hhA6s508xlDSwoMfu1zkOXzubMaZ85zCNX+BXjAz++X7iZQupvamg2kJ9U9+24JY6QLlAx/LRRQiUJRO0GiLK4ceMh+LXyiNnP1JKqmky/8hD6RwMGd7gQAPIlogsO39N48Wm3uE5HrKnxRtSLWucznAjYcUAJiAmasohaiHV3V/mLO2mMi9Unf8UsYU//zoXeKHhmkDECuhY2LvMpWjGXyhx2aMylFyOOy1n9Sq+RFwKatfmS8wCSDBtIadBJtlb6XBJvDNOxFR3IRkg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDWcuB1GzVwbhzSL1QVAfGRHdjuyH2iDl8eV04oieo4=;
 b=B9FlYcec7okwKW7t+WJA78nWPugRijw6fraKXyREvmpVjXBLBjgvc8cUhcV5bj7gGo86WFOuhNTgUonbOS2a4t6et90+nAXnRB/zNhKfhY1G/VYRn+psaMUAPzyBgkhTWutwlLNmH2IYkflwHmBcwuoMKjFINWVVrdYda5GT+sinCphrwAWS/K3PtYa4jc+OZzinE8IKd+N7PCpcIxJa4Ek9H1iE72EdcT+ncPNVxex+fBLT5sitc8v6WtuyEOFo1KvxXBi9UgfN1HssPA4A2CNedzuNAvACXgNKYhzhsMR362XQG8HGDNSYagQGoppKTjB120bpuszMHJ4ukuDfBA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=atomide.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDWcuB1GzVwbhzSL1QVAfGRHdjuyH2iDl8eV04oieo4=;
 b=QHkQQETaccZj1d0dt3Y6UsS20cwI/eNsd0mlw/0zm88QW+4QdO7AxXU3Ic6MomHW0TO1j85/z6X6RG8tE1dgUogtOAa7huqn67eSHNJKc1a7XtUKqeRbb2XjBNNMd3eXxGEyC/0PdBOmqS030tq7vPRlZNRroN3CY4tYgWNFm64=
Received: from DU7P250CA0002.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::15)
 by AM9PR04MB7522.eurprd04.prod.outlook.com (2603:10a6:20b:282::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 12:01:28 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::e6) by DU7P250CA0002.outlook.office365.com
 (2603:10a6:10:54f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 12:01:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Mon, 29 Dec 2025 12:01:27 +0000
Received: from emails-6921961-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-157.eu-west-1.compute.internal [10.20.5.157])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 9FDE38039F;
	Mon, 29 Dec 2025 12:01:27 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767009687; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=ZDWcuB1GzVwbhzSL1QVAfGRHdjuyH2iDl8eV04oieo4=;
 b=MlMwDNDjRSPxWKZa6BFg1CeKi/IE72ja8ZMaqGPbaub8RIBQkU9iMeqDX6iW+yAfZnpqd
 RtkNNIW5mFzWdPKXod46ctyeUyVv5SuN5Ktg1O4EJparm3Lx8rmqjWvPRxG5qV+PwhTWcXd
 njE0naYRO0HJtIUWtH20kTBidgYf8/c=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767009687;
 b=EEPa5VcF24NdiHNdi6c5yPGRCiaXkP1JHZFVx6xYWQaUzYn7SRjqrrQ/vRAspwW8dUW68
 RfJYOOCsYXzIDp6487KJNKi+f4jlT9ysDCTmZFgeZnJiqjsuJxODHbpnK2PafTDrrd9vSRl
 CosBU2R5+3TG/9HtkJ5XiU4h7ksLyA0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giiF1I5QjHawl9vj7ckHyL4oRDH4eVyvQztrBWz8KwGQI16BQcyCQHp1nZmdPng8kFAffiY/VuQ0j3ffvKnV2WKCYVzV6UUAUksis4beFotxh42xs3r0IfgsSeBAfHKyf5B/RCpIH1SAJwRtEQv+iqk8CYSuq806xqLRvXSXMdn0Ng35kWlstQeitgS8RoOleXr2VHtYtb+eGB37CJurRoFgT3jlIUSHOjtiX6jzCWJ/BeVnJMVA8tSzKOAnFm9hajgB3qdpNvNkhTkRT6BoHwVoFDSrGCTZB1WUerLVGmtP6IDoZbSizJ8MheSqyMLf9Mg9pZZe+yGjVKayUG5wCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDWcuB1GzVwbhzSL1QVAfGRHdjuyH2iDl8eV04oieo4=;
 b=LUKmj02NDIpC9LQjY8vqFLh/1OfjCkDEjFTisV6kW2nI4IKa0QzoHhSVU34zimidSY7aQlw+XM7+5fQkswewgkz+DT3rQU7xdeJW6gcWEp29OyTVGJE55lwRj9iqPRH1bwUVPRf9kiXnkgp6pdK8mcJskcz2fEvwYFiobkaReycKx0+Rp9WrzEhPocaR2tTnxtIvbUo2TtnK+gU7QlMaMrdjYPf3wTqSgEnTUloECEBt5Ao36HJ5V2S1bNMfHlUJPenPlRoty+2dEtqocCim1V2qRPbPAGz2d8nPXxgIYFu0uSb90dVwssQywXV9Y/g1kCsNUhVCdrUkLEXPt1SJ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDWcuB1GzVwbhzSL1QVAfGRHdjuyH2iDl8eV04oieo4=;
 b=QHkQQETaccZj1d0dt3Y6UsS20cwI/eNsd0mlw/0zm88QW+4QdO7AxXU3Ic6MomHW0TO1j85/z6X6RG8tE1dgUogtOAa7huqn67eSHNJKc1a7XtUKqeRbb2XjBNNMd3eXxGEyC/0PdBOmqS030tq7vPRlZNRroN3CY4tYgWNFm64=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAXPR04MB8928.eurprd04.prod.outlook.com (2603:10a6:102:20f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Mon, 29 Dec
 2025 12:01:18 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 12:01:18 +0000
From: Josua Mayer <josua@solid-run.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Vignesh R
	<vigneshr@ti.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti
	<andi.shyti@kernel.org>, Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan
 Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v3 2/6] mux: Add helper functions for getting optional and
 selected mux-state
Thread-Topic: [PATCH v3 2/6] mux: Add helper functions for getting optional
 and selected mux-state
Thread-Index: AQHcafvjRT5zKouON0q90YQR/1KWr7UtgcmAgAsf64A=
Date: Mon, 29 Dec 2025 12:01:17 +0000
Message-ID: <fd901bba-3203-46c2-b282-c5ad04128fd3@solid-run.com>
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com>
 <20251210-rz-sdio-mux-v3-2-ca628db56d60@solid-run.com>
 <CAMuHMdXjAS6HOYy5=uxcK0RZL5X6agRoHG67QUw4xh5+ovZaJQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXjAS6HOYy5=uxcK0RZL5X6agRoHG67QUw4xh5+ovZaJQ@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|PAXPR04MB8928:EE_|DB1PEPF000509F5:EE_|AM9PR04MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: 85669d96-8431-45a4-15c7-08de46d1ff4d
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?N2tWTGdFWkF1L0pSbnZ3dTh6MmNvdEpiT2QxNUpHVy8yWFg4d3VNampnSDFk?=
 =?utf-8?B?bFRaTk9ucmNUTTVtK2UwS2Z0NFVqV0EramhweHNaS3pEU2dYek9QTTgxV1BO?=
 =?utf-8?B?d0VzeVNkUENiUmt1dWx4NHhNaXJHaVlPRm1oMzFMUEpOR2haZG1UcThsVVp2?=
 =?utf-8?B?endSUm9pdlF6Slh0YnJhYzV6SG5pOGgrSTFtYy9IaW0zd3dXQ1JqUzhISWRn?=
 =?utf-8?B?ZFRSMU5iaG9VWkRMdzljMUMvVmpzZFRKOG1BMjFUamVnaXZKWjVIaUNTdWtN?=
 =?utf-8?B?TXRTTDZwV1VwSW1DVEFzWE5meU50VGVuNG9vQUJPdFZTMW1rSjcvRUdlK1c3?=
 =?utf-8?B?ZUQ4MmJReFYzN3U1a3V1NEdtQ3NONmJwK1NYT0xJK0o0QUVkRGt5YXJwSW5M?=
 =?utf-8?B?SWZEMkdQdGhxYlVQMVFxbU1xUnRDK3BjaG9JazF5b2pNZUVvZ1RrYzNMS3Fl?=
 =?utf-8?B?Y1JaNHdVWEx2MkRtNEt1c2V2M2xjNlZDZ0ZrV1VLWFRPUE82RCtSVC9Kemhp?=
 =?utf-8?B?MW4wU2E4K3M1S2dnSjBMUDVEU1lNSWQxdktTaU5kWU5Hdjc3YkE1TVViZFJ2?=
 =?utf-8?B?ZUtuMXcyZ09SNkZoRXNIMitkNUxhNjRtMnEycUMrdElyWnJ2clB5bVllV0tP?=
 =?utf-8?B?TlRQK3F6cXJUNzIwVUpRdTN4a2lNSm5QaFp6NmY4d2EzdE0xK1N2ckZ2bVdn?=
 =?utf-8?B?NDZhcHEyT05uMC9KTEltTC92NVFTQTBFN3ZkQjBXZHQ5dnR1clFaSTM2ZXpQ?=
 =?utf-8?B?Wk1kRUtwZzhpeENaTi94R0pGVXdCNXBSdTNzVml3bFJaZk1YS0dBQmQ0MW9y?=
 =?utf-8?B?bzBSOXdQbndKYTAyT1Q5YkZMeXhCSEhTaU9jOEFPb1dCN05YcEtJSG5VUWY5?=
 =?utf-8?B?eFJla3ZGdXJoS2ttY2c2UStqNlYrckFkaXlkb0dvWUJ3OFAxS1VVN3FKTndx?=
 =?utf-8?B?QllBdzhJR3JuZnkyMHdnaWQ2b3QyOStHaC9QVGtnTUYwSDEzam84K0lzQy80?=
 =?utf-8?B?TUhVMEVEbTR6WFdkVkpaandzZzNwcmxCZ2l3NnVldFFoUTVzeElNd3hOQmdn?=
 =?utf-8?B?ZnFMSlYxdFF4NU9qZXhoL01sRS9ENjNJek1ENU1paDRyNzFHbzZxRnR3QjR4?=
 =?utf-8?B?RTBVNDJHSlc2UEY2L0IrMHhGZnEvRFhEM2FZelAwMllNYTRnN0ZJbEM4VXk1?=
 =?utf-8?B?Q0dSMVBKL1FBVU9KNk1RREZsOGZqTzcrUkNMNUZUN0VSeWVMYlNjOENrVU9E?=
 =?utf-8?B?MUJTQ0VPUUUyR05LZ1p6ZVJ2ZXpSYjcvWGFRUW1ZbTlPQWZ1OXNmZmJ0YmhI?=
 =?utf-8?B?MGM0NFJlNkp5L2dyT2N3a1NtZUlQcTZWNHprUTRBeG1uSW1tQWhERGk4Tmsx?=
 =?utf-8?B?TG85SUw4Vy9TbU5vRmRuOTVmeHJlb21WRk5KUmkzWStnOEFoVmhqUldSQ04z?=
 =?utf-8?B?M2MvSkp5RzVhZytVaGd4UmExQ1RJU3JPNFVIS2VGZWd0a0dZQklJM0RHdXMv?=
 =?utf-8?B?TzBaaTVFN0R6SXI4eHBzOTlBSDNqZTJocGV6R0U2M25URFg1UjRWNm0zWHhR?=
 =?utf-8?B?MU1Sc1pmcmtGWmVqaE9yZ2xpWmVEOGQ5N0daWnVzYUlpcjN1dTM2a1RnTnl5?=
 =?utf-8?B?MnV3S0ZkS3pKdDJnSXVtQTdsUEFpWWFidkQ0WHdlVnF1bnVZazVSeEMyd1hP?=
 =?utf-8?B?bWZnaCtDeGpyemRGcCtZUnUvaFBWTXErZVlkS05FUlZrQjdaR0s3c0lhNTR0?=
 =?utf-8?B?a3QzVFd4RUdZRzVNd0M5N29WVnNzSHgvM0UvQS9ieFRTKytwMzdoQ0tFRGJL?=
 =?utf-8?B?Mlg2VzZtUE4zd2hsdkVjbmlaMnpQc2RwSnV4eFI2RTRhN0ltenB6NVpzRHJG?=
 =?utf-8?B?ZjJ2VklQRWpNZCtLdE8wZlBWMlFmTVdpSVNtZ1lKY2tlNmJjR2FGOWkwMW5C?=
 =?utf-8?B?bVByeTN3citKRlZLd1pSY1JwVlBKeklEZkJZUFhBMnI1SnJNNVgwSUNPLzJG?=
 =?utf-8?B?S2hFbzFPem9ici8vM0lsTHVaSTFCLzNGaW1LejZORVlGVUlpcW0vT242M0dv?=
 =?utf-8?Q?AHtzip?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CFCA171BD93E444A8B80039BFEE193A@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8928
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 03d96c6fa42046308272a8a95c12d81d:solidrun,office365_emails,sent,inline:90947a8010ec37c6cdd57d1ec71ea2fc
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8a4ad613-ad07-43c4-0df0-08de46d1f96a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|376014|7416014|35042699022|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHJwVE5lR3pWQlFybkRPdTNFbXBJUm9UVTlRMENMWWtOR0xEY1JtcTN3TGZV?=
 =?utf-8?B?RlF1RU1SbnFLL3ZtUDNXR3A5V0JITUIrbFMxajZSZ3VlNVF2WkJETlZoYlVU?=
 =?utf-8?B?ckN2RE9Pcm1IaVgxa1N0RExhei9lOW5leFEzVnUzdnhjZ3J4WlQ1ODhWcVlv?=
 =?utf-8?B?R2JiUEp0eEQydmRndUw3T3NKL3lhY2UxVTJZWS9RUjhGWlZEMnF4cm5FM2VB?=
 =?utf-8?B?S3JQSUNWR1JkbytQbldKOEF6R2xhbzExTFFaNXRKbDROMkc4T0V5N1l5UjN2?=
 =?utf-8?B?RHJDaXFBbkVEbjhvWEU0cWJDZktRN3ExdEVHQ2YyTTZBZG1UL2Y1YjRJSSsy?=
 =?utf-8?B?QWdtSW9mV3JWZEhsUDZrbGN6OWsvOGxhbU96OXFKc1BCWlJTKzRmamdWMU5X?=
 =?utf-8?B?VFEyT1E4M3VFLzNwaVNtY0VtRTFsQ1dVdEJRTUhMY0NjN3BITXBxL0lSbEFr?=
 =?utf-8?B?WEVjN2RxNUs4TmVDOTdJOGVzdnlERWUzR1oyRWxIYjNmN0ZHd1dyWEVQVUxo?=
 =?utf-8?B?VkhrcVNHMG85UmhGWFR3L0hlR2t0MTlSTnpLejlqSXA4WjRYN21XVUxla1ox?=
 =?utf-8?B?b0hjVnhWaWNnUU96VlZrMUQ4Qi9OZno4TGVLZjZvZUlvUytOWXU1TVpVMGIv?=
 =?utf-8?B?czNkbC95Z0txTTI4Smk3YUtrTFdpWlVQVXdhdTV0SDR3RFpTcDQ1cDltbm1n?=
 =?utf-8?B?OW42SFg0Qjg3Q3JuRi9BeHMyTWhvVGZOM09vZWNZdGNGZW42Y1ZWOEpzcWYr?=
 =?utf-8?B?bGJNOUx0N3N5djBJMVdhTHMwMzFNK2I2ODRlSUtJU2FLYW54KzJXUitHdTB4?=
 =?utf-8?B?OFRFZTExaGVLQy8vdHlQSVdGNk9QdEpWcUMwNFg1UkFRY2ZEVTdyTWRmZnU5?=
 =?utf-8?B?c3FaSzZwa2FFN2U4YjRmdXhVdXlGR2liYkFFSjR0M1BQZ2J5dEh1c2NlRXhP?=
 =?utf-8?B?YmNIelFueXZjSHNNNVFrcGZ4OHFSNnlqSS9FL0xuTGdBUk04dFpnaGtoaEIw?=
 =?utf-8?B?NkJpSWorMkxtQ1JoUW9CWU9LZGlrV3NORnhKTFZJWVYzY054OHBqbW9yM1JM?=
 =?utf-8?B?N0JHVFkwYjRQQTJCMXBsWkwvMzFxanhxZnprckFGUU1FWGNFSGF2Ni9wK3lk?=
 =?utf-8?B?RkZDTzk3N2tZTnkrdUJTRVZ0RDFMQmZWei93T3pMQW4wMTRWK1kwQ1NvMGJM?=
 =?utf-8?B?RmNaV01KZU93NlBXWGJLSkt2VmhIYVFDL0hsdmFReDM2NmRmTlJteTBCUHdO?=
 =?utf-8?B?SllWbDlzMlFFRmpSaTRFN21hTHlyVUtlWWpUTnV2QVNoTVFZK2o4YlA0TVNB?=
 =?utf-8?B?U25kRXMyM0xDWGNQR1ZlWkFuQm1sbllkRjRzaUVJNEM0cjY4UndQeVU5cVNq?=
 =?utf-8?B?UUFxSnhYYTdaVnJtUGMwdlhJbGk1RmJrSjA1ZlBiZWxmN01uT2dYTkw5bm1R?=
 =?utf-8?B?SzU5YVRyU3QyUTNDSnlyS0dMRjZSRUpUOFhtYklyT2lwNE43TFpVdENYWXp2?=
 =?utf-8?B?eUZlRTREQ25JaFN6ZlZrcFJ5ZGhGY0JGUmptWFNIMGV2RjJSclkyck95ckhN?=
 =?utf-8?B?SUZGclVuQmZLTTNzZ3ZFY1Y5RFNsMTM0Qng3R0dMMjV4SkZSbWpqM3hUM1N3?=
 =?utf-8?B?cUd6OWNPTWZZcjlMbDRURkFocGpBU2lOV2dtRUFoZUY3RERjNUdYQkRibTZK?=
 =?utf-8?B?YWF5ZCs2ZWEybUs0SXNhb0VyWXlOSkxwYmpsVktHeUtuR1VzY1RkazFRL0NL?=
 =?utf-8?B?WDFndnoxMmI1RUNYdHlEc21OV2dEWHJrVHgrbVJvcmtiZHJrbG5wRU00R1dn?=
 =?utf-8?B?NFgrU2JHU3kzekV5U1h1N255NjJUdEc1Uk1hUVFPTG1qWGtaRFQyc0M3NExL?=
 =?utf-8?B?Rjh3aWhDRkdJc1lqNDB2RlVZT2tFUmZ1YjZqNlBhT2swNEpuNVVHVDRlWS9a?=
 =?utf-8?B?alliR2NIcmdzRlV6SGxsSFF1b0hvYURPQllSWVN0MVFCNW45bkZXSXFKOUZv?=
 =?utf-8?B?aDdKeE5JSlR4MDFZVGlkS0lQQjZZaEkyTEFBZDU2dEIvTEtyWEdPNGMyMlRN?=
 =?utf-8?B?elpZMnVhQW0vWnNBazJMNWJjdVVPUTFCR0N2RzUyVy9jYUtmd3NCenQza21L?=
 =?utf-8?Q?FHO0=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(376014)(7416014)(35042699022)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 12:01:27.8101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85669d96-8431-45a4-15c7-08de46d1ff4d
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7522

DQpBbSAyMi4xMi4yNSB1bSAxMTowOCBzY2hyaWViIEdlZXJ0IFV5dHRlcmhvZXZlbjoNCj4gSGkg
Sm9zdWEsDQo+DQo+IE9uIFdlZCwgMTAgRGVjIDIwMjUgYXQgMTg6MzksIEpvc3VhIE1heWVyIDxq
b3N1YUBzb2xpZC1ydW4uY29tPiB3cm90ZToNCj4+IEluLXRyZWUgcGh5LWNhbi10cmFuc2NlaXZl
ciBkcml2ZXIgaGFzIGFscmVhZHkgaW1wbGVtZW50ZWQgYSBsb2NhbA0KPj4gdmVyc2lvbiBvZiBk
ZXZtX211eF9zdGF0ZV9nZXRfb3B0aW9uYWwuDQo+Pg0KPj4gVGhlIG9tYXAtaTJjIGRyaXZlciBn
ZXRzIGFuZCBzZWxlY3RzIGFuIG9wdGlvbmFsIG11eCBpbiBpdHMgcHJvYmUNCj4+IGZ1bmN0aW9u
IHdpdGhvdXQgdXNpbmcgYW55IGhlbHBlci4NCj4+DQo+PiBBZGQgbmV3IGhlbHBlciBmdW5jdGlv
bnMgY292ZXJpbmcgYm90aCBhZm9yZW1lbnRpb25lZCB1c2UtY2FzZXM6DQo+Pg0KPj4gLSBkZXZt
X211eF9zdGF0ZV9nZXRfb3B0aW9uYWw6DQo+PiAgIEdldCBhIG11eC1zdGF0ZSBpZiBzcGVjaWZp
ZWQgaW4gZHQsIHJldHVybiBOVUxMIG90aGVyd2lzZS4NCj4+IC0gZGV2bV9tdXhfc3RhdGVfZ2V0
X29wdGlvbmFsX3NlbGVjdGVkOg0KPj4gICBHZXQgYW5kIHNlbGVjdCBhIG11eC1zdGF0ZSBpZiBz
cGVjaWZpZWQgaW4gZHQsIHJldHVybiBlcnJvciBvciBOVUxMLg0KPj4NCj4+IEV4aXN0aW5nIG11
eF9nZXQgaGVscGVyIGZ1bmN0aW9uIGlzIGNoYW5nZWQgdG8gcmV0dXJuIC1FTk9FTlQgaW4gY2Fz
ZSBkdA0KPj4gZGlkIG5vdCBzcGVjaWZ5IGEgbXV4LXN0YXRlIG9yIC1jb250cm9sIG1hdGNoaW5n
IGdpdmVuIG5hbWUgKGlmIHZhbGlkKS4NCj4+IFRoaXMgbWF0Y2hlcyBvZl9wYXJzZV9waGFuZGxl
X3dpdGhfYXJncyBzZW1hbnRpY3Mgd2hpY2ggYWxzbyByZXR1cm5zDQo+PiAtRU5PRU5UIGlmIHRo
ZSBwcm9wZXJ0eSBkb2VzIG50byBleGlzdHMsIG9yIGl0cyB2YWx1ZSBpcyB6ZXJvLg0KPj4NCj4+
IFRoZSBuZXcgaGVscGVyIGZ1bmN0aW9ucyBjaGVjayBmb3IgRU5PRU5UIHRvIHJldHVybiBOVUxM
IGZvciBvcHRpb25hbA0KPj4gbXV4ZXMuDQo+Pg0KPj4gQ29tbWl0IGUxNTNmZGVhOWRiMDQgKCJw
aHk6IGNhbi10cmFuc2NlaXZlcjogUmUtaW5zdGF0ZSAibXV4LXN0YXRlcyINCj4+IHByb3BlcnR5
IHByZXNlbmNlIGNoZWNrIikgbm90ZWQgdGhhdCAibXV4X2dldCgpIGFsd2F5cyBwcmludHMgYW4g
ZXJyb3INCj4+IG1lc3NhZ2UgaW4gY2FzZSBvZiBhbiBlcnJvciwgaW5jbHVkaW5nIHdoZW4gdGhl
IHByb3BlcnR5IGlzIG5vdCBwcmVzZW50LA0KPj4gY29uZnVzaW5nIHRoZSB1c2VyLiINCj4+DQo+
PiBUaGUgZmlyc3QgZXJyb3IgbWVzc2FnZSBjb3ZlcnMgdGhlIGNhc2UgdGhhdCBhIG11eCBuYW1l
IGlzIG5vdCBtYXRjaGVkDQo+PiBpbiBkdC4gVGhpcyBpcyByZW1vdmVkIGFzIHRoZSByZXR1cm5l
ZCBlcnJvciBjb2RlICgtRU5PRU5UKSBpcyBjbGVhci4NCj4+DQo+PiBUaGUgc2Vjb25kIGVycm9y
IG1lc3NhZ2UgaXMgYmFzZWQgb24gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MgcmV0dXJuDQo+
PiB2YWx1ZS4gSW4gY2FzZSBtdXggZGVzY3JpcHRpb24gaXMgbWlzc2luZyBmcm9tIERULCBpdCBy
ZXR1cm5zIC1FTk9FTlQuDQo+PiBQcmludCBlcnJvciBtZXNzYWdlIG9ubHkgZm9yIG90aGVyIGVy
cm9yIGNvZGVzLg0KPj4NCj4+IFRoaXMgZW5zdXJlcyB0aGF0IHRoZSBuZXcgaGVscGVyIGZ1bmN0
aW9ucyB3aWxsIG5vdCBjb25mdXNlIHRoZSB1c2VyDQo+PiBlaXRoZXIuDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+IFRoYW5rcyBmb3Ig
eW91ciBwYXRjaCENCj4NCj4+IC0tLSBhL2RyaXZlcnMvbXV4L2NvcmUuYw0KPj4gKysrIGIvZHJp
dmVycy9tdXgvY29yZS5jDQo+PiBAQCAtNTQyLDExICs1NDIsOCBAQCBzdGF0aWMgc3RydWN0IG11
eF9jb250cm9sICptdXhfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqbXV4X25h
bWUsDQo+PiAgICAgICAgICAgICAgICAgZWxzZQ0KPj4gICAgICAgICAgICAgICAgICAgICAgICAg
aW5kZXggPSBvZl9wcm9wZXJ0eV9tYXRjaF9zdHJpbmcobnAsICJtdXgtY29udHJvbC1uYW1lcyIs
DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtdXhfbmFtZSk7DQo+PiAtICAgICAgICAgICAgICAgaWYgKGluZGV4IDwgMCkgew0KPj4g
LSAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJtdXggY29udHJvbGxlciAnJXMn
IG5vdCBmb3VuZFxuIiwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXV4X25h
bWUpOw0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoaW5kZXgpOw0K
Pj4gLSAgICAgICAgICAgICAgIH0NCj4+ICsgICAgICAgICAgICAgICBpZiAoaW5kZXggPCAwKQ0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT0VOVCk7DQo+PiAg
ICAgICAgIH0NCj4+DQo+PiAgICAgICAgIGlmIChzdGF0ZSkNCj4+IEBAIC01NTgsOCArNTU1LDEw
IEBAIHN0YXRpYyBzdHJ1Y3QgbXV4X2NvbnRyb2wgKm11eF9nZXQoc3RydWN0IGRldmljZSAqZGV2
LCBjb25zdCBjaGFyICptdXhfbmFtZSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAibXV4LWNvbnRyb2xzIiwgIiNtdXgtY29udHJvbC1jZWxscyIs
DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5k
ZXgsICZhcmdzKTsNCj4+ICAgICAgICAgaWYgKHJldCkgew0KPj4gLSAgICAgICAgICAgICAgIGRl
dl9lcnIoZGV2LCAiJXBPRjogZmFpbGVkIHRvIGdldCBtdXgtJXMgJXMoJWkpXG4iLA0KPj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgbnAsIHN0YXRlID8gInN0YXRlIiA6ICJjb250cm9sIiwgbXV4
X25hbWUgPzogIiIsIGluZGV4KTsNCj4+ICsgICAgICAgICAgICAgICBpZiAocmV0ICE9IC1FTk9F
TlQpDQo+IEkgdGhpbmsgdGhlIG5vbi1vcHRpb25hbCB2YXJpYW50IHNob3VsZCBzdGlsbCBwcmlu
dCBhbiBlcnJvciBtZXNzYWdlIGluDQo+IGNhc2Ugb2YgLUVOT0VOVCwgZWxzZSB0aGlzIGhhcyB0
byBiZSBkdXBsaWNhdGVkIGluIGFsbCBkcml2ZXJzIHVzaW5nIGl0Lg0KPg0KPiBUaGlzIGlzIHR5
cGljYWxseSBoYW5kbGVkIGJ5IGhhdmluZyBhIG5vbi1wcmludGluZyBjb3JlIGhlbHBlciBmdW5j
dGlvbiwNCj4gYW5kIGhhdmluZyBwcmludGluZyBub24tb3B0aW9uYWwsIGFuZCBub24tcHJpbnRp
bmcvaWdub3Jpbmcgb3B0aW9uYWwgd3JhcHBlcnMNCj4gYXJvdW5kIHRoZSBmb3JtZXIuDQoNCkkg
d291bGQgcHJlZmVyIGxldHRpbmcgZHJpdmVycyB1c2UgZGV2X2Vycl9wcm9iZS4NClNpbGVudCBo
ZWxwZXIgZnVuY3Rpb25zIGNhbiBtb3JlIGVhc2lseSBzaGFyZSBjb2RlIGJldHdlZW4gdGhlbSAu
Li4NCg0KSWYgdGhpcyBpcyBhIHN0cm9uZyBwcmVmZXJlbmNlIEkgY2FuIHJld29yayB0aGUgZXJy
b3IgYmVoYXZpb3VyIGFuZCBtb2RpZnkNCnRoZSByZWxldmFudCBtdXhfc3RhdGVfZ2V0IGFuZCBt
dXhfY29udHJvbF9nZXQuDQoNCj4NCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIo
ZGV2LCAiJXBPRjogZmFpbGVkIHRvIGdldCBtdXgtJXMgJXMoJWkpXG4iLA0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBucCwgc3RhdGUgPyAic3RhdGUiIDogImNvbnRyb2wiLA0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtdXhfbmFtZSA/OiAiIiwgaW5kZXgp
Ow0KPj4gICAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKHJldCk7DQo+PiAgICAgICAgIH0N
Cj4+DQo+IEdye29ldGplLGVldGluZ31zLA0KPg0KPiAgICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydA0KPg==


