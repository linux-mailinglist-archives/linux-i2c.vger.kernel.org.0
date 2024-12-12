Return-Path: <linux-i2c+bounces-8477-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D629EFC1F
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 20:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBEA116D636
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 19:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739DF19E971;
	Thu, 12 Dec 2024 19:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="kYczPDeH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2080.outbound.protection.outlook.com [40.107.105.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C682193094;
	Thu, 12 Dec 2024 19:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734030728; cv=fail; b=FG0hAxiAI9pbn+i3B5K6KJ9HI0yN4zZfHRl0PFMRzecG14FBUuCOEIBsLAxmJJNMoMMt9kRQRNBC8/UZyDcZvJ8ZLJ5nTvMggjzLdURFYxXC4ZR3nDkhZHvtNuzH2cA1h6DmCwsB7ESEqTv27ZLX2s5bEbZHk1gqGEWwWX+JyME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734030728; c=relaxed/simple;
	bh=uaUEZDcmFbieIrm5OxmVxgcwfnJR10MQG6qt07B8zcE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FsoYCQ8jNTui3w1tTq8OdVMofICFQ/lE6B0dw30/jPOJWMlrEiIR0F0H4p8+pE9aGUnjCnXfQKmJvrvkoUC1VLInTLaxpfkAWfpL/X5wQSvdoDsXflLIeXZq/s4uUb9EziKFPdb7N3gSRdDVIxLRpHLPSbG/bpIAgQvw7NabhAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=kYczPDeH; arc=fail smtp.client-ip=40.107.105.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plG9Lc6MLh74a/T707Lg7gQZ30T2q9Ag/Lko5BdP88nJAeyBrESpbpG6bInQwQrPX0cAStzNj/ZtL3PdMljxbbsMubuCKCDuRLy5UUoaR0jFgLLBhjbWB2xmA+fvxThdrrg8w+SRhem8FehurFyX4PiI21i9tSsodI78zI13zQFgvq6gyRWHmjop6Lsy02PisIwN91mgM4Nryr0KBVlJjr3P311gMAfUGkan6azVZYQD8pkSZTKNvfOaU9/b541Ljff97qTmVGl18RtNX3mjz3jsQf4SUHhUsa4+GB+d2Wyv02q5BXQ6d/jruOtAwqMhIAxMDQZTp4wLpo6GOfX+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaUEZDcmFbieIrm5OxmVxgcwfnJR10MQG6qt07B8zcE=;
 b=ih02tI7TeDyS6j9vlCX8TIYFhDUPhDl9Xg+657Z3Aqtj4x2QJOqQ1nxtjglEW9ei0n1gt3Vsq5BbbwzitgimbcReNfVjdY6FgVTFpyZl92hQ5QwgiFceypXxHFHBB0sTYh4DLWBlm+C6oHuFRn6azTjDQppPMcSWJNZ2t2J9gcjFDlphnBp7eJWwm85nAvihIF/sSCdDmJf7eoLGiiOUjQpRoI3i3x+h7Mw2/tvRwscU5MmAwK7rwIvkDf7PSKlB6PholDXb+WndYzRLPENRWM7/z5QTJbf4Ye/2AvKIWTcsf+ZsCjHBiitlJZn0qWnsNAclTMKg48giLiR5rs/35w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaUEZDcmFbieIrm5OxmVxgcwfnJR10MQG6qt07B8zcE=;
 b=kYczPDeHUoFMJRRXqb16nL66QhCvlwn/3jzqatRuhZp3XshEavt3+p56x2xezlRGLPvinbH+LyyrVj74/Z66tdF9mjmAfo6itcLeWRZdzeYMGiK+5im7Yvn0gYgZyt2pfNOKNirBs/LxVry3pq0yjPS7gqIjJsKhpLbNsR+symqci3seCku0Y1TLymTOR9geONFulCvciBuaPul6qek4s1THMpLVxPdtwkwFLYkZPlbblLmvSjUApfq17D4BI0pvKXu1bo5xSbcc5PS/xgqW36Mbzj9Rb9LwDfRrTL7pGgQhagcwE1Xl2ufUaqotDi9tiTRxqsgAt3p7p+WVULqGMA==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DB9PR10MB5378.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:335::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.5; Thu, 12 Dec
 2024 19:12:02 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 19:12:02 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "rafael@kernel.org" <rafael@kernel.org>, "jingoohan1@gmail.com"
	<jingoohan1@gmail.com>, "robh@kernel.org" <robh@kernel.org>,
	"rfoss@kernel.org" <rfoss@kernel.org>, "Laurent.pinchart@ideasonboard.com"
	<Laurent.pinchart@ideasonboard.com>, "mripard@kernel.org"
	<mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "andrzej.hajda@intel.com"
	<andrzej.hajda@intel.com>, "daniel.thompson@linaro.org"
	<daniel.thompson@linaro.org>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>, "lee@kernel.org" <lee@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
	"luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, "jonas@kwiboo.se"
	<jonas@kwiboo.se>, "saravanak@google.com" <saravanak@google.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "dragan.cvetic@amd.com"
	<dragan.cvetic@amd.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "derek.kiernan@amd.com" <derek.kiernan@amd.com>,
	"deller@gmx.de" <deller@gmx.de>, "jernej.skrabec@gmail.com"
	<jernej.skrabec@gmail.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>
CC: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
	"thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
	"contact@paulk.fr" <contact@paulk.fr>, "herve.codina@bootlin.com"
	<herve.codina@bootlin.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "paul.kocialkowski@bootlin.com"
	<paul.kocialkowski@bootlin.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v4 5/8] i2c: i2c-core-of: follow i2c-parent phandle to
 probe devices from added nodes
Thread-Topic: [PATCH v4 5/8] i2c: i2c-core-of: follow i2c-parent phandle to
 probe devices from added nodes
Thread-Index: AQHbTMm5v8muX1xehkGdTtxZMBefBQ==
Date: Thu, 12 Dec 2024 19:12:02 +0000
Message-ID: <ad1b0f8a662d748580bef83b6f7d8d24d80bd46c.camel@siemens.com>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
	 <20240917-hotplug-drm-bridge-v4-5-bc4dfee61be6@bootlin.com>
In-Reply-To: <20240917-hotplug-drm-bridge-v4-5-bc4dfee61be6@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DB9PR10MB5378:EE_
x-ms-office365-filtering-correlation-id: 9969008d-42a1-4aa4-b07a-08dd1ae0dc37
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?RXl4ajdtb3VDMlJLYjlTTWd3emhDdWZ2WWh6S1NWTW9BUDNIZ3BWR2x4ZzBM?=
 =?utf-8?B?NUt4YWNNUFdWeFN5d1ZKZzdibDA2MDJDMFJrY0NnUDJ5b0lOUDhINEgxRkpt?=
 =?utf-8?B?cGF6dFl1dFRuWE9ETFV1MmlVTHRzUVM0SGlsMFptUkgveUErcW14bFp4RUhn?=
 =?utf-8?B?WVdXanNwdStjbkY5QnNIWjh2c1FNYnpBT1J6UHpWWGdyQXdMbUZHUWlLZVYy?=
 =?utf-8?B?SEthbHpQTFAyY1lNWmx4bmNxUDZUeStZM0F0KzFVZ2xzOTVWYzVuRWJGL2Rr?=
 =?utf-8?B?VUVWUUVMM2tRWHJ6WFpSOFlQRmtRVUFKN21wUXJOSDJWbEF3UUdVODh1dy9z?=
 =?utf-8?B?TFNLNHpOUjJac1MrV1JlN1dBa0tHdFd6bkpOL3pCa1gwZm5kYzJtZGwxSDEz?=
 =?utf-8?B?VmhSUGJMRkJyTUgvR3NKWGdZZXV6T2N1Wk9sMVRVZXl6dzFIU3VieGdjZzRN?=
 =?utf-8?B?eHVxVEtvSlJTZk11eTFiTUpSU3BuYzNaRlJwUEg3QTc0THUrZkdWaHplTVM0?=
 =?utf-8?B?dFNRRU1yVHhZemZzNzBvOHZlSGFhajVoeVZoZjd0cE4rblQzVHZIMFZ1b0ZX?=
 =?utf-8?B?R0w3dGpHVGdKRE5CMXNDbnBjazhSR1oyYW52T0R0MFN2cUNvREs5S3BkbW45?=
 =?utf-8?B?ZjdNdzJtMDdNbXB0VTBtRW51YnlGRVB5QmZKaDlkbXFETy8yd0psUDROTXhI?=
 =?utf-8?B?TnhWNitERU84ODV2bC9hTSs4NjlhekJHRmlmWVZGRmFlY0FXVk5sb1hlY3Bl?=
 =?utf-8?B?TEVzRlR5b0xIZnNpOTRzbVFjTnF3cE5KTmRJVzdqdzVHemRQa0M1aElLUVVu?=
 =?utf-8?B?ZTdFeE92b0RXT1N6b244Q3o2L01wSi9kQXFvc0ZDdUsvYlVZZHRXMjFyU3du?=
 =?utf-8?B?Q1RpYXloREQrL1k1MkduTHp0bWZTSTUyaFVPMXVuY0NtdThRWVc0QzFpa051?=
 =?utf-8?B?M1ZnTTJrdWhwZ3hpZVI4ZEZ6TmhFakoxY0JQa3NCekZoMkZPOUN6emtQZjU4?=
 =?utf-8?B?cENLMWRQUFJ1K2JLclhiWlF0VkZvTVdrZXJVR2pBdDRJZkZlWGhkbHZQcUVz?=
 =?utf-8?B?dnhPcWVwaGh1b1dWdGpONTRaWTRpRzNkM3lMbFFjVWRzcDQxSXFqNXZFL0ZZ?=
 =?utf-8?B?cHBBbXBMTGNHaTVGVk5VN21qaVBURVArMFNhcmZTSVZiK21tdGtXTWhOVitK?=
 =?utf-8?B?V0I5WVdaeDlIbDlxS01RQ2dUMjhDVUpEQlZkVStRem5hR3ljR1NnSDlUTHpo?=
 =?utf-8?B?eGdpVnlGeWNKTTRMclhLaWZKaVNOTE85NEUvSHkvQTBZL3U5YU1TSmowLzlE?=
 =?utf-8?B?RTM2ZEl0UUo2OFM2TXhNbkFHckcrN2YvMWVJS0FaV2RoczUwR2NQRHYvYlRq?=
 =?utf-8?B?ZmdXdEVqMy9BejdiRWQxK01kcnVRS0NYcmVncFFUVzVtTG9zR2YwWWxtZktL?=
 =?utf-8?B?TjNzYlN5ZHJJWHc0QWFpdnJpSjVtUVBjOTRNUGlpcVc0THFzUG50MVl4SSsw?=
 =?utf-8?B?NWpQOUsrQytGRUl4SUdlNG90V2FpUkl1Y2JtZ05uTWpkMjI3MnQ3cHNoNW9R?=
 =?utf-8?B?cU5KK2VOamRxMWpnSG9hOEdiNldMQkVKeThlekpmd1dLdi9JTFRtaklmamxD?=
 =?utf-8?B?QlVqbFFzY1lPbnRYVGJMaFVrNy82eFJkT0NsQWJUcFF5MVoveFREVHNNRThU?=
 =?utf-8?B?VklxMHY5bnBBQk1SSkIzMUZjVEUyWk8rM2hubVdiMFVmbzlTRm9mMWU1RVlV?=
 =?utf-8?B?V09PRUx4SWFPQU01QWphVEFvM1ZpSXFKMGUzNGZTSzZXeER0MlhUTzRDWDNU?=
 =?utf-8?B?QTRxVnNnekpNYkxoeTY2cXBOTjlkOW1BL2hBa0djVXZhNmZzRlZqdytJcWVp?=
 =?utf-8?Q?9xRda9gksO1Ws?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UXozQ1lSSHBmMDdxNlY1UTBMeDV0am1nbVZ1R2oxUHJRK2FlcjhzK3FURFpN?=
 =?utf-8?B?OURFZmhRL3hSbGhMazl6MkJqMzRVQXd6elJTMk8vSmhCczJMYU5jTkpPeDgy?=
 =?utf-8?B?bGg4Y0pWMXdiOC9EQ2g1cVBrQ2ZpNlFYdkNKd0pFU2lhOWtjRElyNk9VVzNj?=
 =?utf-8?B?cFdjR1d5cWZrQXRQWlBaQ1AxU3gxclRzUUtsMWlJblRTQVNPUWM2Z0E2MWR2?=
 =?utf-8?B?RkRMNXNGRmVGUHFxa3ZLK3NjLzdORS85bmNHMWhFNmhZNGl0a05Ed2o5c0tZ?=
 =?utf-8?B?dXYyMlFqRlVRcUZzWUw5MkdZamluMFhodFpTZUdveUFzRGw4U29mNDk5TThQ?=
 =?utf-8?B?eTJuRU5xbXVOMWdOSkUzS0ZCZ3lNV1YrSlUrbjRrVExZUnFTd3J3SWNoSndo?=
 =?utf-8?B?UUhGRitlcVVBWXU4TENSN2lpUVg0YjdtTVBxa0ZHZVhJWTJEWVlERFdUbFhP?=
 =?utf-8?B?RlgxQW00Ny8xZFZpZTR2TU9RNVMxaklZb25ZY1BhVS90elFnZzF2YkxhbFdB?=
 =?utf-8?B?b0Vvb3NiY0d3ajMyeHZka29INFkrdUFBNW9NVjNjREVuR0pTQTVTNmVabGVR?=
 =?utf-8?B?OFlIMEZIem1zbVhxRGpQbDZjQnR5Qnl6NEFVTVhHRFoyaXhTV3JSUXdkK3JI?=
 =?utf-8?B?dnBwa0c3UTJuWE9qbE4rSFQyZUVYaDFPWWRHUDYyVnhacFhjTTNRbC9OT2ha?=
 =?utf-8?B?cVlQR2J2aXFHZ2ppekNDT3ltVDdxenExVEp5MHFYbTBSWVRSTlFkM2NmNUd6?=
 =?utf-8?B?VnN2eTBrK3FMS3BXKzF0bzFhM3p1VHlBSWNINGpRbmliczdvaHJEcFlJSHZN?=
 =?utf-8?B?djg5UW1HSWFuMlFlT3AwYlZjZGljN0VKTHhvUzd3M01PRmtPcFlOYWpNdjlz?=
 =?utf-8?B?SWNCYXVhTW0ycktiUEpNSGV4a0NIcU55c2hrL3orWHo1QXRiODhSdURjOFlw?=
 =?utf-8?B?ZGd5aVBxaHdsN1ZlLzhpK0Q4MEM2WGx6VzY0REg1cGJhQUM2MDEzd25OQzdi?=
 =?utf-8?B?cEcvZEJYVjhaVzBjaWRTcXN5NEtFOTVtcFZrZzdxYnE2cnZ1WHNNbkdDVE01?=
 =?utf-8?B?eXMwbnJWVzNNa3M5aFdYWWlYNTFkVHNuRE9zUFU1UDNBZUtSRWkrOG1PbmFn?=
 =?utf-8?B?L21hU1pEdHN2VzhLU1JaV083ZnErQW5PaFlxaGxIemNMSjhoRHVjZFNldlhM?=
 =?utf-8?B?TG1KMUQ2ZUxobkhUOTRyZGxOeVo4M3d1TzNHUGkreXlweis4dkVraXFTWGpJ?=
 =?utf-8?B?U1E3ZS9WdHpNZHlWWTZvMFV4MXZaSkg0dzZKZkg5TVdwR1R2QTFTeDZpWnJp?=
 =?utf-8?B?NTlhNHFwb0RWVkRoNm5OQVRwREZoWjZwYWZwbHQ4bGlBQVZjK2JzMng5b1RY?=
 =?utf-8?B?Skd4c204RFBQVk0zSkJ6NEJtZDNib0FnNVFuRnIwKzcrSDdKTHI2UjBZSmVp?=
 =?utf-8?B?RXAyUVJqd3hPZmhMdTBoTmlIcDQ2Vi8zVTBJVTUyZUdwdHdYTzc5MzIraWlM?=
 =?utf-8?B?ekFVU2hOdmRhUWw3cWduZ1dxaWFjUkQ0TmExbFlPSDlibHBxVEhpNkRRdjNr?=
 =?utf-8?B?THpjQlZIY0laRk5OQVp6UDkvZi9uSnRhUHhhYmRhSUMwNUdNclJDOFp3clVB?=
 =?utf-8?B?WVE1bHZPRkdBLzVKZlBVRkxoQU96ZUlQaVBzZHc4V0piL0RmZmlCeHBYUXFF?=
 =?utf-8?B?U0NGaklpMy9KTVFzV0x3VzBra0FvckU1d2hPaTgyNklyU29Selh0U3RwLzk1?=
 =?utf-8?B?emlQQXkyZnV6S1FpZmhsUEJDS2plUjJsUU1RSFExRmVyNEl5L0ZubzJHZFBH?=
 =?utf-8?B?R25EQjdYRTRZL3VPeXNPT3o3bGtSa01RTmdzNzJyZmhGN1V4U1VvNWJVazM5?=
 =?utf-8?B?UGtwYUw3V2Q3R1NqcTJpZ2tSZFFuUWliNGp2eG53NDk4RG5pakpabkZYcVJ5?=
 =?utf-8?B?UWUxNGViUWtRNUFoZC9SMWFsejdmV1czbTZSejhOazd5dlBvMEYzaTh0MmtI?=
 =?utf-8?B?MzhYMW9TZU0xWkRHcVk5RERlUkJvcWQ4Z0dCRG1FLzRuQjhSZW0yR0lEMXdm?=
 =?utf-8?B?NlNPR3pDNFl4Zmhxb1JjRWNCMDF2cElxdGpMVXZpU3N0c3VQVksyOUJHK1RG?=
 =?utf-8?B?VHVONDNmeU5jREp4eGJxTWtRelorckdiMlVTZUlWUlovNHhJV2dwQkt0WTlq?=
 =?utf-8?Q?9WKlOUQtWbctU7Iusniz1Lc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D79364DFB4B2E45BFE8D68306CF30FD@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9969008d-42a1-4aa4-b07a-08dd1ae0dc37
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 19:12:02.5511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KRys0WRP7Dra8My4l2G0N2u2HSE96e5gw5wLmoD+V6UlGd81ixunaHQSvOCUIWyJS5xTCCgg/dvG1baknpr9mS7ch3S+AxfU7SzEtZowSzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5378

SGkgTHVjYSENCg0KT24gVHVlLCAyMDI0LTA5LTE3IGF0IDEwOjUzICswMjAwLCBMdWNhIENlcmVz
b2xpIHdyb3RlOg0KPiBXaGVuIGRldmljZSB0cmVlIG5vZGVzIGFyZSBhZGRlZCwgdGhlIEkyQyBj
b3JlIHRyaWVzIHRvIHByb2JlIGNsaWVudA0KPiBkZXZpY2VzIGJhc2VkIG9uIHRoZSBjbGFzc2lj
IERUIHN0cnVjdHVyZToNCj4gDQo+ICAgaTJjQGFiY2QwMDAwIHsNCj4gICAgICAgc29tZS1jbGll
bnRANDIgeyBjb21wYXRpYmxlID0gInh5eixibGFoIjsgLi4uIH07DQo+ICAgfTsNCj4gDQo+IEhv
d2V2ZXIgZm9yIGhvdHBsdWcgY29ubmVjdG9ycyBkZXNjcmliZWQgdmlhIGRldmljZSB0cmVlIG92
ZXJsYXlzIHRoZXJlIGlzDQo+IGFkZGl0aW9uYWwgbGV2ZWwgb2YgaW5kaXJlY3Rpb24sIHdoaWNo
IGlzIG5lZWRlZCB0byBkZWNvdXBsZSB0aGUgb3ZlcmxheQ0KPiBhbmQgdGhlIGJhc2UgdHJlZToN
Cj4gDQo+ICAgLS0tIGJhc2UgZGV2aWNlIHRyZWUgLS0tDQo+IA0KPiAgIGkyYzE6IGkyY0BhYmNk
MDAwMCB7IGNvbXBhdGlibGUgPSAieHl6LGkyYy1jdHJsIjsgLi4uIH07DQo+ICAgaTJjNTogaTJj
QGNhZmUwMDAwIHsgY29tcGF0aWJsZSA9ICJ4eXosaTJjLWN0cmwiOyAuLi4gfTsNCj4gDQo+ICAg
Y29ubmVjdG9yIHsNCj4gICAgICAgaTJjLWN0cmwgew0KPiAgICAgICAgICAgaTJjLXBhcmVudCA9
IDwmaTJjMT47DQo+ICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gICAgICAgICAg
ICNzaXplLWNlbGxzID0gPDA+Ow0KPiAgICAgICB9Ow0KPiANCj4gICAgICAgaTJjLXNlbnNvcnMg
ew0KPiAgICAgICAgICAgaTJjLXBhcmVudCA9IDwmaTJjNT47DQo+ICAgICAgICAgICAjYWRkcmVz
cy1jZWxscyA9IDwxPjsNCj4gICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiAgICAgICB9
Ow0KPiAgIH07DQo+IA0KPiAgIC0tLSBkZXZpY2UgdHJlZSBvdmVybGF5IC0tLQ0KPiANCj4gICAu
Li4NCj4gICAvLyBUaGlzIG5vZGUgd2lsbCBvdmVybGF5IG9uIHRoZSBpMmMtY3RybCBub2RlIG9m
IHRoZSBiYXNlIHRyZWUNCg0KV2h5IGRvbid0IHlvdSBvdmVybGF5IGl0IHJpZ2h0IG92ZXIgJmky
YzE/DQpJdCBzaG91bGQgaGF2ZSB3b3JrZWQgc2luY2UgY29tbWl0IGVhNzUxM2JiYzA0MQ0KKCJp
MmMvb2Y6IEFkZCBPRl9SRUNPTkZJRyBub3RpZmllciBoYW5kbGVyIikuDQpEb2Vzbid0IGl0IHdv
cmsgZm9yIHlvdXIgdXNlLWNhc2U/DQoNCj4gICBpMmMtY3RybCB7DQo+ICAgICAgIGVlcHJvbUA1
MCB7IGNvbXBhdGlibGUgPSAiYXRtZWwsMjRjNjQiOyAuLi4gfTsNCj4gICB9Ow0KPiAgIC4uLg0K
PiANCj4gICAtLS0gcmVzdWx0aW5nIGRldmljZSB0cmVlIC0tLQ0KPiANCj4gICBpMmMxOiBpMmNA
YWJjZDAwMDAgeyBjb21wYXRpYmxlID0gInh5eixpMmMtY3RybCI7IC4uLiB9Ow0KPiAgIGkyYzU6
IGkyY0BjYWZlMDAwMCB7IGNvbXBhdGlibGUgPSAieHl6LGkyYy1jdHJsIjsgLi4uIH07DQo+IA0K
PiAgIGNvbm5lY3RvciB7DQo+ICAgICAgIGkyYy1jdHJsIHsNCj4gICAgICAgICAgIGkyYy1wYXJl
bnQgPSA8JmkyYzE+Ow0KPiAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ICAgICAg
ICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gDQo+ICAgICAgICAgICBlZXByb21ANTAgeyBjb21w
YXRpYmxlID0gImF0bWVsLDI0YzY0IjsgLi4uIH07DQo+ICAgICAgIH07DQo+IA0KPiAgICAgICBp
MmMtc2Vuc29ycyB7DQo+ICAgICAgICAgICBpMmMtcGFyZW50ID0gPCZpMmM1PjsNCj4gICAgICAg
ICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47
DQo+ICAgICAgIH07DQo+ICAgfTsNCj4gDQo+IEhlcmUgaTJjLWN0cmwgKHNhbWUgZ29lcyBmb3Ig
aTJjLXNlbnNvcnMpIHJlcHJlc2VudCB0aGUgcGFydCBvZiBJMkMgYnVzDQo+IHRoYXQgaXMgb24g
dGhlIGhvdC1wbHVnZ2FibGUgYWRkLW9uLiBPbiBob3QtcGx1Z2dpbmcgaXQgd2lsbCBwaHlzaWNh
bGx5DQo+IGNvbm5lY3QgdG8gdGhlIEkyQyBhZGFwdGVyIG9uIHRoZSBiYXNlIGJvYXJkLiBMZXQn
cyBjYWxsIHRoZSAnaTJjLWN0cmwnDQo+IG5vZGUgYW4gImV4dGVuc2lvbiBub2RlIi4NCj4gDQo+
IEluIG9yZGVyIHRvIGRlY291cGxlIHRoZSBvdmVybGF5IGZyb20gdGhlIGJhc2UgdHJlZSwgdGhl
IEkyQyBhZGFwdGVyDQo+IChpMmNAYWJjZDAwMDApIGFuZCB0aGUgZXh0ZW5zaW9uIG5vZGUgKGky
Yy1jdHJsKSBhcmUgc2VwYXJhdGUNCj4gbm9kZXMuIFJpZ2h0ZnVsbHksIG9ubHkgdGhlIGZvcm1l
ciB3aWxsIHByb2JlIGludG8gYW4gSTJDIGFkYXB0ZXIsIGFuZCBpdA0KPiB3aWxsIGRvIHRoYXQg
cGVyaGFwcyBkdXJpbmcgYm9vdCwgbG9uZyBiZWZvcmUgb3ZlcmxheSBpbnNlcnRpb24uDQo+IA0K
PiBUaGUgZXh0ZW5zaW9uIG5vZGUgd29uJ3QgcHJvYmUgaW50byBhbiBJMkMgYWRhcHRlciBvciBh
bnkgb3RoZXIgZGV2aWNlIG9yDQo+IGJ1cywgc28gaXRzIHN1Ym5vZGVzICgnZWVwcm9tQDUwJykg
d29uJ3QgYmUgaW50ZXJwcmV0ZWQgYXMgSTJDIGNsaWVudHMgYnkNCj4gY3VycmVudCBJMkMgY29y
ZSBjb2RlLiBIb3dldmVyIGl0IGhhcyBhbiAnaTJjLXBhcmVudCcgcGhhbmRsZSB0byBwb2ludCB0
bw0KPiB0aGUgY29ycmVzcG9uZGluZyBJMkMgYWRhcHRlciBub2RlLiBUaGlzIHRlbGxzIHRob3Nl
IG5vZGVzIGFyZSBJMkMgY2xpZW50cw0KPiBvZiB0aGUgYWRhcHRlciBpbiB0aGF0IG90aGVyIG5v
ZGUuDQo+IA0KPiBFeHRlbmQgdGhlIGkyYy1jb3JlLW9mIGNvZGUgdG8gbG9vayBmb3IgdGhlIGFk
YXB0ZXIgdmlhIHRoZSAnaTJjLXBhcmVudCcNCj4gcGhhbmRsZSB3aGVuIHRoZSByZWd1bGFyIGFk
YXB0ZXIgbG9va3VwIGRvZXMgbm90IGZpbmQgb25lLiBUaGlzIGFsbG93cyBhbGwNCj4gY2xpZW50
cyB0byBiZSBwcm9iZWQ6IGJvdGggdGhvc2Ugb24gdGhlIGJhc2UgYm9hcmQgKGRlc2NyaWJlZCBp
biB0aGUgYmFzZQ0KPiBkZXZpY2UgdHJlZSkgYW5kIHRob3NlIG9uIHRoZSBhZGQtb24gYW5kIGRl
c2NyaWJlZCBieSBhbiBvdmVybGF5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTHVjYSBDZXJlc29s
aSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4NCj4gLS0tDQo+IA0KPiBOb3RlOiB3aGlsZSB0
aGlzIHBhdGNoIHdvcmtzIGZvciBub3JtYWwgaG90cGx1ZyBhbmQgdW5wbHVnLCBpdCBoYXMgc29t
ZQ0KPiB3ZWFrbmVzc2VzIHRvbywgZHVlIHRvIHRoZSBpbXBsZW1lbnRhdGlvbiBiZWluZyBpbiBh
IE9GIGNoYW5nZQ0KPiBub3RpZmllci4gVHdvIGNhc2VzIGNvbWUgdG8gbWluZDoNCj4gDQo+ICAx
LiBJbiB0aGUgYmFzZSBkZXZpY2UgdHJlZSB0aGVyZSBtdXN0IGJlIF9ub18gbm9kZXMgdW5kZXIg
dGhlICJleHRlbnNpb24NCj4gICAgIG5vZGUiIChpMmMtY3RybCksIG9yIHRoZXkgd29uJ3QgYmUg
cGlja2VkIHVwIGFzIHRoZXkgYXJlIG5vdA0KPiAgICAgZHluYW1pY2FsbHkgYWRkZWQuDQo+IA0K
PiAgMi4gSW4gY2FzZSB0aGUgSTJDIGFkYXB0ZXIgaXMgdW5ib3VuZCBhbmQgcmVib3VuZCwgb3Ig
aXQgcHJvYmVzIGFmdGVyDQo+ICAgICBvdmVybGF5IGluc2VydGlvbiwgaXQgd2lsbCBtaXNzIHRo
ZSBPRiBub3RpZmllciBldmVudHMgYW5kIHNvIGl0IHdvbid0DQo+ICAgICBmaW5kIHRoZSBkZXZp
Y2VzIGluIHRoZSBleHRlbnNpb24gbm9kZS4NCj4gDQo+IFRoZSBmaXJzdCBjYXNlIGlzIG5vdCBh
IGxpbWl0aW5nIGZhY3RvcjogZml4ZWQgSTJDIGRldmljZXMgc2hvdWxkIGp1c3Qgc3RheQ0KPiB1
bmRlciB0aGUgZ29vZCBvbGQgSTJDIGFkYXB0ZXIgbm9kZS4NCj4gDQo+IFRoZSBzZWNvbmQgY2Fz
ZSBpcyBhIGxpbWl0aW5nIGZhY3RvciwgZXZlbiB0aG91Z2ggbm90IGhhcHBlbmluZyBpbiAibm9y
bWFsIg0KPiB1c2UgY2FzZXMuIEkgY2Fubm90IHNlZSBhbnkgc29sdXRpb24gd2l0aG91dCBtYWtp
bmcgdGhlIGFkYXB0ZXIgYXdhcmUgb2YNCj4gdGhlICJidXMgZXh0ZW5zaW9ucyIgaXQgaGFzLCBz
byBvbiBpdHMgcHJvYmUgaXQgY2FuIGFsd2F5cyBnbyBsb29rIGZvciBhbnkNCj4gZGV2aWNlcyB0
aGVyZS4gVGFraW5nIGludG8gYWNjb3VudCB0aGUgY2FzZSBvZiBtdWx0aXBsZSBjb25uZWN0b3Jz
IGVhY2gNCj4gaGF2aW5nIGFuIGV4dGVuc2lvbiBvZiB0aGUgc2FtZSBidXMsIHRoaXMgbWF5IGxv
b2sgYXMgZm9sbG93cyBpbiBkZXZpY2UNCj4gdHJlZToNCj4gDQo+ICAgLS0tIGJhc2UgZGV2aWNl
IHRyZWUgLS0tDQo+IA0KPiAgIGkyYzE6IGkyY0BhYmNkMDAwMCB7DQo+ICAgICAgIGNvbXBhdGli
bGUgPSAieHl6LGkyYy1jdHJsIjsgLi4uDQo+ICAgICAgIGkyYy1idXMtZXh0ZW5zaW9ucyA9IDwm
aTJjX2N0cmxfY29ubjAsICZpMmNfY3RybF9jb25uMT47DQo+ICAgfTsNCj4gDQo+ICAgY29ubmVj
dG9yQDAgew0KPiAgICAgICBpMmNfY3RybF9jb25uMDogaTJjLWN0cmwgew0KPiAgICAgICAgICAg
aTJjLXBhcmVudCA9IDwmaTJjMT47DQo+ICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsN
Cj4gICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiAgICAgICB9Ow0KPiAgIH07DQo+IA0K
PiAgIGNvbm5lY3RvckAxIHsNCj4gICAgICAgaTJjX2N0cmxfY29ubjE6IGkyYy1jdHJsIHsNCj4g
ICAgICAgICAgIGkyYy1wYXJlbnQgPSA8JmkyYzE+Ow0KPiAgICAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8MT47DQo+ICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gICAgICAgfTsNCj4g
ICB9Ow0KPiANCj4gSSdkIGxvdmUgdG8gaGF2ZSBzb21lIGZlZWRiYWNrIGFuZCBvcGluaW9ucyBh
Ym91dCB0aGUgYmFzaWMgaWRlYSBiZWZvcmUNCj4gZGlnZ2luZyBpbnRvIHRoZSBkZXRhaWxzIG9m
IHRoaXMgYWRkaXRpb25hbCBzdGVwLg0KPiANCj4gLS0tDQo+IA0KPiBDaGFuZ2VzIGluIHY0Og0K
PiAgLSBmaXggYSB0eXBvIGluIGNvbW1pdCBtZXNzYWdlDQo+IA0KPiBUaGlzIHBhdGNoIGZpcnN0
IGFwcGVhcmVkIGluIHYzLg0KPiAtLS0NCj4gIGRyaXZlcnMvaTJjL2kyYy1jb3JlLW9mLmMgfCA5
ICsrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2kyYy1jb3JlLW9mLmMgYi9kcml2ZXJzL2kyYy9pMmMtY29y
ZS1vZi5jDQo+IGluZGV4IGE2YzQwN2QzNjgwMC4uNzFjNTU5NTM5YTEzIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2kyYy9pMmMtY29yZS1vZi5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2kyYy1jb3Jl
LW9mLmMNCj4gQEAgLTE3MCw2ICsxNzAsMTUgQEAgc3RhdGljIGludCBvZl9pMmNfbm90aWZ5KHN0
cnVjdCBub3RpZmllcl9ibG9jayAqbmIsIHVuc2lnbmVkIGxvbmcgYWN0aW9uLA0KPiAgCXN3aXRj
aCAob2ZfcmVjb25maWdfZ2V0X3N0YXRlX2NoYW5nZShhY3Rpb24sIHJkKSkgew0KPiAgCWNhc2Ug
T0ZfUkVDT05GSUdfQ0hBTkdFX0FERDoNCj4gIAkJYWRhcCA9IG9mX2ZpbmRfaTJjX2FkYXB0ZXJf
Ynlfbm9kZShyZC0+ZG4tPnBhcmVudCk7DQo+ICsJCWlmIChhZGFwID09IE5VTEwpIHsNCj4gKwkJ
CXN0cnVjdCBkZXZpY2Vfbm9kZSAqaTJjX2J1czsNCj4gKw0KPiArCQkJaTJjX2J1cyA9IG9mX3Bh
cnNlX3BoYW5kbGUocmQtPmRuLT5wYXJlbnQsICJpMmMtcGFyZW50IiwgMCk7DQo+ICsJCQlpZiAo
aTJjX2J1cykgew0KPiArCQkJCWFkYXAgPSBvZl9maW5kX2kyY19hZGFwdGVyX2J5X25vZGUoaTJj
X2J1cyk7DQo+ICsJCQkJb2Zfbm9kZV9wdXQoaTJjX2J1cyk7DQo+ICsJCQl9DQo+ICsJCX0NCj4g
IAkJaWYgKGFkYXAgPT0gTlVMTCkNCj4gIAkJCXJldHVybiBOT1RJRllfT0s7CS8qIG5vdCBmb3Ig
dXMgKi8NCj4gIA0KDQotLSANCkFsZXhhbmRlciBTdmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3LnNp
ZW1lbnMuY29tDQo=

