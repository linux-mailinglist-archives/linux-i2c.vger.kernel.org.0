Return-Path: <linux-i2c+bounces-4365-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8E1917AA1
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 10:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 819371C20CC7
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 08:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F9315F41B;
	Wed, 26 Jun 2024 08:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DcEP56Fy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2041.outbound.protection.outlook.com [40.107.113.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5B015B0E1;
	Wed, 26 Jun 2024 08:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719389731; cv=fail; b=BC+Ej0e/tGRoO7HrMrHDXxo9jmUExM5sIBpFZym4aFb72/EI0bRFqo/mW9C5rAIwgLo8JUFw+xyd/Z6xYEv47Tnhs7WDDQ4bwCaaJ4Fd44JfwgMtHjzC7SgWp2PIT3EhPSHLX0hMpuikknHBreoMKPIJs2Ed18pFhN5Bcdc/HnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719389731; c=relaxed/simple;
	bh=Ftlsq7r3gzBH4HGeaPA43aHrDGfkcSiuBn+3W2FNP0g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vav48Vl8KQXSrRLnpFjFn9ls8t+YVUl25tZievhfCKEMx3DaU0ohb1TxGenAWErtAsQv8duN2BGzcQeNgRkjwbt74DeXhOvEVPJ5CpOXYEsUSbWozcFqtMK6OnmiSfoIoHIn/41ZTJpmHBePBKsoY9diII6ZyOmRv5q+sletJ18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DcEP56Fy; arc=fail smtp.client-ip=40.107.113.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/JNvjncTZRFlAHs8ukt4trQ8clUtkPjekOrsULwtusNzlwIKTOA+Y7ZCtQJUF+q7Du82t5k8EY/SA3HN8HoZAQvBfQmQyPO9NqtfvJyV0ReYu7Ha3T4bYVX2lTywq5mBdfkFMmckB+zAG/me64aEQPxUavP9NJzMKXqpE+r3Z934mZO+hm7b6E8el8W0XRx5pLnXP00oNsaN9o4FUgnvLHsh6RDpYxnp0qL/Hf2Cvq+JKZ/2DDFz4jEeqG+WV7Hj9K8398NKPciO+hc5SsVTBpe1PmDGFmCaasgNMMGxuT8juZWkWtH84BSTgFrFy6gEC1ebQH8LaXAK3v3l53yaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ftlsq7r3gzBH4HGeaPA43aHrDGfkcSiuBn+3W2FNP0g=;
 b=V3EfZ3+qrJnMUt0sZCReAuhfiwuKofBFy0ZhMQ8kdT4uCo9bfKrORM4wSoj+jj4KVb4QejfpPyJfRzxAY+dVeCJVl80gQtkersTyKSy/7ycv2rRJiV0/59Pjn01fQLvNco/IalrvdfZosl7Vrr7BcBgs5RxRvpcBVeE3n0JsRKC2uOVNnK1wn9ijnYCeIns6L9hHTCZ+fCjChb2BNl3Svj1OcbmscihYMyTkmsRATeMa5SeeEbzsgajY9L3Y56UxPfRakzmMGeFq3ftJwjSntSfpi+MMZLYJAYLY6jLh3z3b4MQOxsa5l/QnuNo4dpmsO/dqu8btGXO0ePxotkCnIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ftlsq7r3gzBH4HGeaPA43aHrDGfkcSiuBn+3W2FNP0g=;
 b=DcEP56Fys1Nz6yKT1bUKbcqyVgGp6si3S8CKIjm57iKMlRlXozaqDHwCsFEuLhC12W513/3BVMLqVHVHU4N1mhiTqVV3Q1sFlUaQ7whIi98TqVK4nlj66SPmK4i5OpdFFUWQoeQIfXoHdrsxcRQnNlQl4tg89dixIhVgMsAszqI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB5514.jpnprd01.prod.outlook.com (2603:1096:404:8035::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 08:15:23 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 08:15:23 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Chris Brandt
	<Chris.Brandt@renesas.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Thread-Topic: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Thread-Index: AQHaxvlYh4jiRKyfj0yWu87XUamtbLHYoIVQgADxhACAAAGdYIAADluAgAABRCA=
Date: Wed, 26 Jun 2024 08:15:23 +0000
Message-ID:
 <TY3PR01MB113462102306D834D5CA5DE0986D62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-5-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346F03386D05D608041DE8D86D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <14167607-e67b-4627-99f0-6e99acc7f880@tuxon.dev>
 <TY3PR01MB11346A47493E0EE96CB2CF17B86D62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWDMMy-Q-1=DPcvpu9Co-oCQOvbStt-hLpdEwrLRdpt_A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWDMMy-Q-1=DPcvpu9Co-oCQOvbStt-hLpdEwrLRdpt_A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB5514:EE_
x-ms-office365-filtering-correlation-id: 5fa99461-c787-4702-d158-08dc95b820c6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230038|366014|376012|7416012|1800799022|38070700016;
x-microsoft-antispam-message-info:
 =?utf-8?B?QTR2emk0SW1Td2pyN3NpelJOVm82c21PMzUzRDdSY21XRXF5WGxNdVl6aFRo?=
 =?utf-8?B?Y1NIK04yaS8xWC9hZlJBc0lYYnFuSTlKWG1HcDhNcHBSTmFQdG1PUEdtMFpp?=
 =?utf-8?B?ZCtSU3FQQUdHRnBBTExueWlZSlBOSVIrVm9IdUxuY2d3R3VJM1lXZStnQllP?=
 =?utf-8?B?NWNjQkpiVDN1cDRySUZZUFRXdU1ZME9BS0lPZmVpQUhybnRQRi9XMDNIMXV2?=
 =?utf-8?B?V2hYd2dvVGY4anVoQjVLV21kelZML0NqSGI2clh4d3A1eitGVlRPOGVXZmNZ?=
 =?utf-8?B?UU9zcFloWVpxQm9ndG82NGp1Y3VlQThBSlIxRWpINDQrZ1Q4YUxZNXU3bEUy?=
 =?utf-8?B?UnZwUVRqVGZvTjMxSlR0UjJIelllUHZLaWUvK3VrdmtrTEtac3FCWVVMK0hG?=
 =?utf-8?B?N2lFZDZvT1QxWE5Ha3EyV05KeDg3T1M2NU1DM3U1SkxMWDRQaTEzWndxQ002?=
 =?utf-8?B?T1hmS3RsM2hNRXY2YXE2UVk2NlQ4OENwSlE1dEgxU3ZVNEQrYUE0aUFqZTBQ?=
 =?utf-8?B?V0REdmNmaWtTNXFVVndBSHN1ZmR5SEJEOEF5ZHlhallKWXBXQ0dwOEpOR2d2?=
 =?utf-8?B?L2ExODk3VnJrZHo3RHJ4R3Arbkc4MENkYzFHUUJrSUVSZ0wwKzVUQUdVOGRO?=
 =?utf-8?B?UWpMRU5YQkhGUkVSeEY3VjZNYzNyYi95ZDFmdWFIcERvTHQyR1N5WEZGSTlo?=
 =?utf-8?B?WXVJK0ZPamFTdm5zSDUvQ1hQYVBSUjlxellZeXNWVmJHSU9TaGo1cENhdS9q?=
 =?utf-8?B?MFJQS0hpY0tvM2ErYTlxZExteVpyR2x4cTJpSnUyZTlpSExscnNlRmROQWtu?=
 =?utf-8?B?bWlUZWEyOXQ0UUJuN3VtQ1htakRTd3FZRVRYUzB4THA2eW1qZlcrNVFQeWcz?=
 =?utf-8?B?cG1tOUZMVENMN0FWbEFWU1JlY3lNSDFZc0doeUN5MFpLR2FLbitpaStEMnYx?=
 =?utf-8?B?dWtEczhYWS9OQ2VEWWsxUXdTeTlybzlXMGFWWHkzYUhqVEJPeE1RWVdZVElN?=
 =?utf-8?B?QXR0N1pSSEcreGNUd3lEakdJc2xXSXMzUDdadjFHdDh4TWxiYVQxT3MxM2Mz?=
 =?utf-8?B?UUxXT0MzS1VQWTBXb1VoUjY1NDJzNDFoYmVKcEpGZHdLRjYwSHdBczI4WDRZ?=
 =?utf-8?B?bitCYkJhdkx5V1R6T3RXR1hRT1lmU0sxTWRLR0c3RzBGZGEvZGI0OW5tTjc5?=
 =?utf-8?B?dUVpRVNsQTNrYSs0a0VPSzZhMlA1WURFL3U1R1pBYkxheUhKY3htOHMrSmgx?=
 =?utf-8?B?VHgyUjFxRFV2MkdFRDNVNFhnc3ZvclZrbmpzVjAwVE5xbXhISTRDenVzb3F2?=
 =?utf-8?B?WDhXSlR1OFB4OTVJREFQYmpjWXBTZlUxL0tNdi9ybVMwcGlSTS9sZkJBdm8w?=
 =?utf-8?B?YWdDSzJIV01JdjJiVG9XRVlRNXBtc0ttVTFIMFBvcUNwT01rcHhPQmludWJs?=
 =?utf-8?B?ZEpRMG8vYWovYURRNjZMUjc1UmcvS0Y0aTMzTkNYV2RtdjVROWNOeWRvWHA5?=
 =?utf-8?B?azhwNjMwRmZRSVg0aVNIdHZzUzd0OTd6K0pJQXBIZU9LTlJsT21DNmprakNt?=
 =?utf-8?B?U0J6ZTFHeS9UeVpWVE9kKzlIZUVsWmJ3Mk1GSkJzck9IQ0RBVXR2NUhHSmcv?=
 =?utf-8?B?cTIxai9xZTQ2RVd2WTNyNmJwd1BJMmlHUlUwMVdFaCtCMjFBWFRFYTR3WDNM?=
 =?utf-8?B?azhETTRBU3F2dnVHYXdMTnp4WUJvVmtRSnd2UktPQzc2cEJCcGhvUjJoY2Rn?=
 =?utf-8?Q?uA6i5cR2OvQEJhe9BR5TtPJQ+8i3C9ijhc5Ront?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(376012)(7416012)(1800799022)(38070700016);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Sm1lOTl5UG5ZZVREbjN5djBTSEFNbnhMK3BBSm9xdUlkdkx0UHZNWHFvNHBV?=
 =?utf-8?B?dWxxdUg2dys5WUVsWnpJaTM4U3gyK3dQWHdaS3pnR3U2Y3Zid0tUQVQ4Y0dl?=
 =?utf-8?B?YjhZVkRKS3dYMUx4YXliYkdXVklsa0U0Q1NvaS91Sk85V2xmT210THgxbGxo?=
 =?utf-8?B?dTdtRll2VVZpTGpjYTIwNWNibENHczBHUjFrRUoweGV0WFUxYjMrM3lSVWhU?=
 =?utf-8?B?MWJJRmx3ZjdtbkhrN2U2SzVsSnlqdWpBeDVtaVlOZ1lMTjdlc1JBa3A1ZGdC?=
 =?utf-8?B?V0ZmL2taaVduTFZmYUVFTk9IV3kyUXFQSUhGVWp4Y203VFlBTjJzU09pR1Jn?=
 =?utf-8?B?RnJsVGlCY21NblN4dmZrclphdEhRYit0T0g5eXRQKzl2YTFlQkJGNGsyZkd2?=
 =?utf-8?B?VXRWWDN3REZLdUptdU5qVjVaM2kxa2lycFBIaTFCSTA3aEhrMXJEQ3U4Q2d0?=
 =?utf-8?B?dHRKa0VtT1dmbC9PeS8rMHFWTisxUGIraUlaKzBORlN2b0xiaHc1bkNUQkMx?=
 =?utf-8?B?MDBhb0tkODlRVVN1azZoaGVmWlJueXdCVU9iZFcrN0cycXJMblJtSlpjUm5r?=
 =?utf-8?B?R0c0UVE3U2VGYi9lNVpJdHRldnQyclpvWnRkLzBGQmdWSFFqK2xldmVWdXBi?=
 =?utf-8?B?QXlTSmduSUE4VjhJaTdLSmJTbyt5MmtPMEhidmxTSFkyUTE0bXl4US9oTlo4?=
 =?utf-8?B?RDhBc0wzOTZRbTA1K1hYdnBCTHZ5SmQ1bXNRckpYUDVWeHRpMWpYVmU1djVx?=
 =?utf-8?B?Q1BPcjJZVU1kWHYxaGlOUTdPbGtZZnhPRDZBaWEwaldsSjlwdjFoWVBBNmlK?=
 =?utf-8?B?bTRZcHVsNEZTa1BhbjF2dHJxVWlqMm96amlJQnE1Q3dGQ0FRcWt6ZzdKQzU4?=
 =?utf-8?B?UjZXRU9yU0hqT3Y4Yis3UmhZR0VtclRoNFdkcUR6SXJ6TUwyL2I5U0tuMUZD?=
 =?utf-8?B?Y0FubGx2bEF3R0IyYlllaTFjd2lNZnVNRlk4VlVSd0l3T3dHbVFyWkhuTVpm?=
 =?utf-8?B?NTlLNXF6NHJlb3FKamVSdEt1U0Z3amQrVXFTVldvbVk2SzRmMXF0Y0hRRXN0?=
 =?utf-8?B?TUJWeEFnVTY2Z2JZaHV6ZThaRWxxa001bVFHaXdFcjdKdm41K05ZbzlIUzJP?=
 =?utf-8?B?TzdEbldYTThBMGJOWGIzcGswZXhxRlFiTXBUUk8ySG5MbGV5TFYzWlBGZEIw?=
 =?utf-8?B?L2Q3aVN6dWgzRy9RTThVcjFqL0lqKzdjVHZwZExhT2lud3BqQm55bmFLY2xp?=
 =?utf-8?B?UGdScnFyOGRqSFRIWUsvMVV1b2VpVzVHUHVkVnBkSHp2eFF4dkppcHhPUzdX?=
 =?utf-8?B?N3dIdVBwTjNOSXpDRStOTDRSNk5Wb210N0YrNk5mREl5Zko4MURoVHdTOUp2?=
 =?utf-8?B?bFhtVWtqNWtsTlA4c2Y4aGluekttZXRsMWkvOXhEcGdENjF0TjVPQ3pGK1Iz?=
 =?utf-8?B?QVVNeDVwOWNuYzdzMlgrYXpxNjJNNEd3TDJRYUdkOGY1elJZZ0JJVmxzMjE4?=
 =?utf-8?B?bUV0VVhuRTV6azZuR2N5dTgxYndCSFkzNThjdkprQWc0V3h1MlVvajlrbktL?=
 =?utf-8?B?ZklEODZLd21pVVdTSkZOQUJqejdub3JvMGJZczRpT1hrTU9sb25KYnRKSE5i?=
 =?utf-8?B?S1V3L01FaDNwZkpHaUg3d1lld2RrZjNOZXFJVURlWjR2ZXp6RHVtdWdSS0pU?=
 =?utf-8?B?Y3AwTCtMZHJBbCttWC9JTjlLdWc2VmRRZXVTNVM5MVo5aG1TdVRWM2thc3Ex?=
 =?utf-8?B?SjZrQTYrTTBHY0JYVlZWaUFiL1dJNWZwMlFqTlpvWDFjK2s2Q0NvZzlWTmpt?=
 =?utf-8?B?YUg0K29aaENFajRLMGpMMUZib0pJN3Y1ZmJqWG0xWEU2dTVrRVVwcTlEc0VJ?=
 =?utf-8?B?dVlSM09leFZXK0VrRHZyTWVYdmZKNUZVS0hmRGNQYTlSVXhVZUlaQldqQ0xY?=
 =?utf-8?B?L25obzZOaVVHeDhIMXRLUXdTSGhrMGpDTnA3U2ZOYnBkUS8rakkxMnUwc1Rq?=
 =?utf-8?B?ZTU3TDhRa0wwY1F2MDQyWldGMzhqNTR1NW55cGFsS3RXWXpDUkVjemtmRGNj?=
 =?utf-8?B?UHAyR0tzK2MwMmZrK3c4QXUvdWV6bXBESEdyck5HTjQ2K2pUZnp2MEU2NFdz?=
 =?utf-8?B?MExTZ05XbW5jSWtHWjZ6V25xUjZWWXliaWJQaDI4cVVoZTNWNFcwSUZGUzlR?=
 =?utf-8?B?ZlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa99461-c787-4702-d158-08dc95b820c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 08:15:23.5879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fW/5vkVqMWFlhEuJVBVqv8doE0z3rYDvr6LF3yzb23LdhiByiY5nI7wevowBd03fdH0ZVjvWuShWUOb8mymSKI3IIPiT6uwt1pi7FiZHBBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5514

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAyNiwgMjAyNCA4OjExIEFNDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIgMDQvMTJdIGkyYzogcmlpYzogVXNlIHBtX3J1bnRpbWVfcmVzdW1l
X2FuZF9nZXQoKQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFdlZCwgSnVuIDI2LCAyMDI0IGF0
IDg6MjPigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0K
PiA+ID4gRnJvbTogY2xhdWRpdSBiZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4gT24g
MjUuMDYuMjAyNCAxODo1MywNCj4gPiA+IEJpanUgRGFzIHdyb3RlOg0KPiA+ID4gPj4gRnJvbTog
Q2xhdWRpdSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiA+ID4gPj4gRnJvbTogQ2xhdWRp
dSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPj4NCj4g
PiA+ID4+IHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSBtYXkgcmV0dXJuIHdpdGggZXJyb3IuIEluIGNh
c2UgaXQgcmV0dXJucw0KPiA+ID4gPj4gd2l0aCBlcnJvcg0KPiA+ID4gPj4gZGV2LT5wb3dlci51
c2FnZV9jb3VudCBuZWVkcyB0byBiZSBkZWNyZW1lbnRlZC4NCj4gPiA+ID4+IGRldi0+cG1fcnVu
dGltZV9yZXN1bWVfYW5kX2dldCgpDQo+ID4gPiA+PiB0YWtlcyBjYXJlIG9mIHRoaXMuIFRodXMg
dXNlIGl0Lg0KPiA+ID4gPj4NCj4gPiA+ID4+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUgQmV6bmVh
IDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4gDQo+ID4gPiA+PiAtICBwbV9y
dW50aW1lX2dldF9zeW5jKGRldik7DQo+ID4gPiA+PiArICByZXQgPSBwbV9ydW50aW1lX3Jlc3Vt
ZV9hbmRfZ2V0KGRldik7ICBpZiAocmV0KSB7DQo+ID4gPiA+PiArICAgICAgICAgIGRldl9lcnIo
ZGV2LCByaWljX3JwbV9lcnJfbXNnKTsNCj4gPiA+ID4NCj4gPiA+ID4gQXMgYXQgdGhlIG1vbWVu
dCB3ZSBkb24ndCBrbm93IGhvdyB0byByZXByb2R1Y2UgdGhpcyBlcnJvcg0KPiA+ID4gPiBjb25k
aXRpb24gQ2FuIHdlIHVzZSBXQVJOX09OX09OQ0UoKSBpbnN0ZWFkIHRvIGNhdGNoIGRldGFpbGVk
IGVycm9yIGNvbmRpdGlvbiBoZXJlPz8NCj4gPiA+DQo+ID4gPiBbMV0gc3RhdGVzICJTbywgbmF0
dXJhbGx5LCB1c2Ugb2YgV0FSTl9PTigpIGlzIGFsc28gbm93IGRpc2NvdXJhZ2VkDQo+ID4gPiBt
dWNoIG9mIHRoZSB0aW1lIi4gSSd2ZSBnbyB3aXRoDQo+ID4gPiBkZXZfZXJyKCkgb3Igc29tZXRo
aW5nIHNpbWlsYXIuDQo+ID4NCj4gPiBXQVJOX09OX09OQ0UoKSBzaG91bGQgYmUgb2sgSSBndWVz
cyBhcyBwZW9wbGUgYXJlIHVzaW5nIGZvciBwcmludGluZyB0aGlzIGluZm8gb25seSBvbmNlPz8N
Cj4gPg0KPiA+IEN1cnJlbnRseSB3ZSBkb24ndCBrbm93IGhvdyB0byB0cmlnZ2VyIHBtX3J1bnRp
bWVfcmVzdW1lX2FuZF9nZXQoKQ0KPiA+IGVycm9yIGNvbmRpdGlvbiBpbiBvdXIgc2V0dXAgdXNp
bmcgYSB0ZXN0YXBwIGFuZCB3ZSBhcmUgZXhwZWN0aW5nIGFuDQo+ID4gZXJyb3IgbWF5IGhhcHBl
biBpbiBmdXR1cmUuIElmIGF0IGFsbCB0aGVyZSBpcyBhbiBlcnJvciBpbiBmdXR1cmUsIHdlDQo+
ID4gbmVlZCBkZXRhaWxlZCBlcnJvciBpbmZvIHNvIHRoYXQgd2UgY2FuIGhhbmRsZSBpdCBhbmQg
Zml4IHRoZSBidWcuDQo+IA0KPiBPbiBSZW5lc2FzIHN5c3RlbXMsIHBtX3J1bnRpbWVfcmVzdW1l
X2FuZF9nZXQoKSBuZXZlciBmYWlscy4NCj4gVGhhdCdzIHRoZSByZWFzb24gd2h5IG9yaWdpbmFs
bHkgd2UgZGlkbid0IGNhcmUgdG8gY2hlY2sgdGhlIHJldHVybiB2YWx1ZSBvZiBwbV9ydW50aW1l
X2dldF9zeW5jKCkuDQoNCkkgYWdyZWUsIA0KDQpJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiwg
aWYgdGhlIGNvZGUgZ3VhcmFudGVlcyBiYWxhbmNlZCB1c2FnZSwNCnRoZW4gcG1fcnVudGltZV9n
ZXRfc3luYygpL3B1dCgpIGl0IHdpbGwgbmV2ZXIgZmFpbHMuDQoNCkJ1dCBoZXJlIHdlIGFyZSBh
ZGRpbmcgY2hlY2tzIGluIGZyZXF1ZW50IGNhbGxzIGxpa2UgeGZlcg0Kb24gdGhlIGFzc3VtcHRp
b24gaXQgbWF5IGZhaWwgaW4gZnV0dXJlIGR1ZSB0byBQTSBjaGFuZ2VzLg0KDQpYZmVyLCB3ZSBh
cmUgaW5jcmVtZW50aW5nIHBtIHVzYWdlIGNvdW50IHdpdGggcG1fcnVudGltZV9nZXRfc3luYygp
DQpBbmQgdGhlbiBkZWNyZW1lbnRpbmcgaXQgd2l0aCBwbV9ydW50aW1lX3B1dCgpIG9uY2UgdHJh
bnNmZXIgY29tcGxldGVkDQoNClNvLCB0aGVyZSBpcyBubyBpbWJhbGFuY2UgaGVyZS4NCg0KDQo+
IA0KPiBUaGUgdmFyaW91cyBqYW5pdG9ycyBkaXNhZ3JlZWQsIGNhdXNpbmcgY2FzY2FkZWQgY2hh
bmdlcyBhbGwgb3ZlciB0aGUgcGxhY2UuLi4NCg0KRXZlbiB0aGUgY29yZSBjb2RlIGRvZXMgbm90
IGhhdmUgY2hlY2sgZm9yIHRoaXMuDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9s
YXRlc3Qvc291cmNlL2RyaXZlcnMvYmFzZS9kZC5jI0w3OTINCg0KPiANCj4gSU1ITywgV0FSTl9P
Tl9PTkNFKCkgaXMgZGVmaW5pdGVseSBvdmVya2lsbCwgb25seSBibG9hdGluZyB0aGUgY29kZS4N
Cg0KSSBzdWdnZXN0ZWQgYmVjYXVzZSB3ZSBhcmUgYWRkaW5nIHRoaXMgY2hlY2sgYmVjYXVzZSBz
b21ldGhpbmcgDQp3cm9uZyB3aWxsIGhhcHBlbiBpbiBmdXR1cmUgZHVlIHRvIFBNIHN1YnN5c3Rl
bSBjaGFuZ2VzIGFuZCB0aGUgY2hlY2sgd2lsbCBjYXB0dXJlIHRoZQ0KaXNzdWUgYW5kIHdpbGwg
Z2l2ZSBkZXRhaWxlZCB3YXJuaW5nIGluZm8gaW4ga2VybmVsIGxvZy4NCg0KQ2hlZXJzLA0KQmlq
dQ0K

