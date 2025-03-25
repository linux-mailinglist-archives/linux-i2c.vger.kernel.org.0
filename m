Return-Path: <linux-i2c+bounces-10009-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B620A6ED0A
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 10:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6DE016F5DE
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 09:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2F4252914;
	Tue, 25 Mar 2025 09:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="XjhpknkE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2104.outbound.protection.outlook.com [40.107.215.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F8019CC2E;
	Tue, 25 Mar 2025 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742896337; cv=fail; b=tGtuPIZFbKJ8tpzHxFzriBpYXsxVg76GVzqNfCDckMESGF2OMduwY2iy3fUnvgj4EUSkTrrGcawBIuyEm2D+qZwzZhKWC9j4IRA/Co7t4PT7nZbgJDhePFfzkX4xZLy6qzy6p/Iyk/VKFtWmRo6L9MScJ6OdbbhX5cBK9rMytjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742896337; c=relaxed/simple;
	bh=nvfdLPXlhEoorOTbNl/RJkY/fOmsEMZpIt7tjNQt59Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ogi24WV4U/1n1lFieiD5VRwMPpN6s9D/R1vPhsy6v+BpoEqjPamS2SEopvnhdKtS/dPOJZLV9mJbSWvwNMZW+k3OsAvyloC7PeL4Z37OYeGq2nNBa7qMEyb9NIrtujvLCrrHllDM7yXE6PpWqdUcqLXLKcZbn/wrE98s7ZfkQd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=XjhpknkE; arc=fail smtp.client-ip=40.107.215.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOYCXJUO57i0rse8Ri0u69KJMPQ9QSSY2slQlY+erTtc2SjtPxxtZWAVfJfDDvzXWLsH0l8X6g5WORixY6KJ++ncWbRV8MjnLa4LfiJRuh9n9/c9kN8lfegK6270ng+wEbkZSUoKuvNl8DjedWQ3D+Be8ruX60elADi3rFIEm4sxXWP0SQebIffwD3eIEDgw+Rah+O59Qp6zUPJU7TA1SxLVZCccgq3/Qc47eeIiiPEV6CgUVPHwtIh7dOaOJHlDq6T9VdL/6gMJDIqZ9qHriH8perhynymbVy+6bVzFBq29B7e2dxUhVTFJSIvrxTN4ragxORRGVd3T1xZZOr+8HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvfdLPXlhEoorOTbNl/RJkY/fOmsEMZpIt7tjNQt59Y=;
 b=kgP1ctE7Ctci3zVWMIJIUXEAE2qKsSjoONNV7RsX6nX1zTyVmykNa5Zc2Pmzlw7T+4LAS7U8G3pI8/W9aLZpzGjwwK0tZ7+/E+qhZ4AQlWk0wtrX/W+Y2BPJy6VXeVAv8lD/kbh9GDwGjbigCeg6Hxb88F9V0CQl92DR7cLt9R80Gq1sNGdrZ/HYgalUJj9IkGXJVZX/mr85z3A1c38AbO9R4v98Ba94eg+ze6dwV+jK4VlqHsxIaH/12DOlfhkLgtdNeHEQaJxF2rBrNVBMjUuh4UjoRHVevI5zbyUqphOp2hfdFc+tOTg2ITfOo9R3tq2fjd/GSPSw5GlfhgAuFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvfdLPXlhEoorOTbNl/RJkY/fOmsEMZpIt7tjNQt59Y=;
 b=XjhpknkENP/dDQuS2dt9/dH7nKsD80yq9bM0qyZFvwY4UhMSF+hB/zMEXlrXfTnx906dydOaNK/KdgbAqQlznJYwWcBjVCQI4mC1GpNNAnVtMsrTQCazJ3U23XEyuQI14pW7o5q+9VQaBGKZSGCfBQfS/10Y4h+2/7yxXFjSZ+vV6sldRazOO1U36HWyGEOKUdFsEZuVLAklHvS8lJtotxUchaLGo6M9kS4vraBoeweZxYZLwj/1KCO1NacLu27G4xLOuWa2fgfbcUgL9o2kz4C0T9ahg5xXFfO3qESnyUGLdIw+V9TqNIPWmGavqUl/FNjVwOPocIMwMQIZqT+LPg==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by SI6PR06MB7241.apcprd06.prod.outlook.com (2603:1096:4:246::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 09:52:05 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 09:52:04 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Mo Elbadry <elbadrym@google.com>
Subject: RE: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index:
 AQHbhoFMYr1F1iCu706pUdZbmBz0BrNWKwmAgAMnDQCAAApCgIABc/fggADIQoCACD7TUIATPNAAgAAVK0CAAw8fAIAAONYggAecSoCAABKwMIAACvyAgAANJ+CAABVGAIABfA3w
Date: Tue, 25 Mar 2025 09:52:04 +0000
Message-ID:
 <OS8PR06MB7541FD8691B43EA33BDC1D22F2A72@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
 <20250224-arrogant-adventurous-mackerel-0dc18a@krzk-bin>
 <OS8PR06MB75415E95342F26F576B5CF8AF2C22@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <50327725-f3b8-4a8b-94a2-85afccd2868a@kernel.org>
 <OS8PR06MB7541B0DBC64B3EF6838DFE74F2CD2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <d1b184c5-84c1-4d76-a1d0-a9f37f1e363c@kernel.org>
 <OS8PR06MB7541D1D2E16C5E77037F3BB0F2CB2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <069b9fe4-c54a-4efd-923e-1558c59fe3f4@kernel.org>
 <OS8PR06MB7541C69AB8E6425313DA8606F2DF2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <677cb075-24ae-45d8-bfb4-9b23fbacc5df@kernel.org>
 <OS8PR06MB7541C3B70B15F45F4824772BF2D92@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <994cb954-f3c4-4a44-800e-9303787c1be9@kernel.org>
 <SI6PR06MB753542037E1D6BBF5CE8D2E7F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
 <4523caea-3406-4de0-9ab5-424fb7a0a474@kernel.org>
 <SI6PR06MB7535BAD19B51A381171A0E64F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
 <8e8aa069-af9f-453f-9bd0-e3dc2eab59ab@kernel.org>
In-Reply-To: <8e8aa069-af9f-453f-9bd0-e3dc2eab59ab@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|SI6PR06MB7241:EE_
x-ms-office365-filtering-correlation-id: 0befe5bc-dc1a-4654-00d5-08dd6b82b295
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cFg4Y29kcWdWZmdTMFdyNk5aMmZNZXRJek9IRkFiRit5SFVGVlZpSUZydDZk?=
 =?utf-8?B?TGFSdDJubHY4c2JkdFlYTW9tQ05BdWNCclY2NWJrbmFrUnp4anhkeVJjTXB0?=
 =?utf-8?B?UllpYkdmankzV096ckxJYi9wVUh3OHlaSVJScTU2VzVtcnJnY1VhZ0g0V2U2?=
 =?utf-8?B?Yjcrdkd4WUttSHZQYzFZcy90a2ZCaEdleWxEZFloZlRxRk9KWm9ta3dQc2NU?=
 =?utf-8?B?WTdTd0g4c3czcHZFZzFPZ1FWRVMxVDR4WHYwTmpWcmh1aURwZlIzdHY1Tm1E?=
 =?utf-8?B?bDV0a2tMQ0hzVDBRUXhQbi94MDZsVm43TzR2bHJxdkwyVHUvR0RjdkVIckRH?=
 =?utf-8?B?OUNuNmNZVEF4MTRkY2xFc3MvL3B1cVZNT09QTFpYTWhDTmU2citSUVJXUU5n?=
 =?utf-8?B?S1pGd0k0dEcrYlpCcnI3Mk9SU0ZRakttQTQ3TGx2V0RrTEkzMzMzeWRVYXAv?=
 =?utf-8?B?VXdhMzZucElhL2FVcExyeTBuVDFrM3pVTlFKOWo1SGVxZnd6QnhRZ1FSNDZp?=
 =?utf-8?B?Ky9aeVdGcG9Cc3dGWDFXTjBVeElDQ2tFY2JkS2M3OWRHUFRJcFFSejY3RWNh?=
 =?utf-8?B?aldseFFBallxQWJRUE52WjEweUxKcm9JTitpWUMxdTAreXVGTGNIU3p3YWU4?=
 =?utf-8?B?SDdMSm0rVmF2VmdwRDc4MkJxQTQvdVVuQjhXaS85a3FYaERvRExnazhZTlUz?=
 =?utf-8?B?Y2xFN290ZVV5Q1JQdjB1YXd5U3RXT1FtMlVkSCt1VmpMNk15MUwxdytqOFJ1?=
 =?utf-8?B?SkhEanlMbHR0Vm90TTF1MEViZkxuSUxBUXJFd2NzSnpnT3Z3MWtNMWdiVnNx?=
 =?utf-8?B?aFNwLzZJYThzZG0vYU15dUQ3QUxTVVVpTXh5aGhLeU9XTTM4OThyWDhkR0k3?=
 =?utf-8?B?TEZNMDlJRFZJakV0R1FGRkpsRGIzTCtlSDg4U2FQb2gzRUpNbmIvQ1NUUE5t?=
 =?utf-8?B?SndsWHliV1FIZkQ0WDdMbFp1aGdVYVBKRmpDOUV4M0s2c01RbDJNWFRPSkxw?=
 =?utf-8?B?R0hSVmZEUVl1QU9hbnJ3VGxmUWMvQzBpVWgxVm5iVTh5OUVudWNxME9YQzM2?=
 =?utf-8?B?Vll2eTlxNGxVUXFTU3BHTXJOOFpYUTNEOHJHU0V0TCtNbm5sV1lrYUJDSlJn?=
 =?utf-8?B?QTZtOVJDSmxoRG5CVDliQkJaR00rWmVqL3BhV3ZyZ0FMZkFXeVYrTkk4cUla?=
 =?utf-8?B?cis2eTRIK0xTVjZKZlVLMzJ5ZDRBVHYxQXdXdlRmNEVIYkE4RVFVN2w3U0Mz?=
 =?utf-8?B?SXpJdXFDWjNuaU95NVhlR3QrbDhXSHEyakVPOXRadzJQR1FreGpXaHdHYkFW?=
 =?utf-8?B?UFNMb083Uis2NTQ4SzJyYU5Md1VkaGdsYmdsaFJubHFuMk41YVhpMGdvQmJ4?=
 =?utf-8?B?UDNpN1NLdDdHa1o3Y2xSQUpDQ2lKUUJPK0M0dDA2S0V1QmdpbjdINTBhNGFG?=
 =?utf-8?B?UDFacWlWTUErUXhKUW1UZkFIeHJOeGRweUtmbWdvQjRtcDhKTE5RZ21TcFZ4?=
 =?utf-8?B?dnNFV1c5RGNHYW4yVmljeDBIQzBHcjM3dWFhTmZzVllldVN1N1dxS2prNWF5?=
 =?utf-8?B?SytTaTZ4M29OSDV2UmFyakFFUXo0SXhwdmRBYWlNRHFmUHl3QUVvTHlVVHFt?=
 =?utf-8?B?T0dKRVAyaHJkQjljcEIyd0w3TTNCcjN6Q1FZRUg1cVpJNFpyblJYcEN2VmY1?=
 =?utf-8?B?TCtnWi91RUJZV1c2eGZsNWZvZ0FtZ2V0cVNqOVNmZE4vWGo1NmVDbjkzTC9P?=
 =?utf-8?B?R3JJSlJYa2llTGhuY2htWC9qSHBnY05KMG1EbXJZT3YwYXFjZEErWEtha3BZ?=
 =?utf-8?B?VnZxUGl6clJmbVJaYUVsRHY4VkJhenM1OGEwOUtMTmNvYVVrckZ0Q1hzeWhz?=
 =?utf-8?B?cUNhek1ZZk5WWUpzbjk0WXRHTVRnQVY3aVRWUUlnWVNFeWdWaVFTUnR2bWFF?=
 =?utf-8?Q?0ShI74LoldfPeBv2voep1nbpFTF4MFsb?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YldEeUNrNVBjWE1QTjV3QXZZcTA5U3pGWlZ2MUpPcHZzZUkveFdTWll6QXlh?=
 =?utf-8?B?SCtOOXVpcjNuR2VEaWJ5TjMyYUR6b2U0dUVxUDg2UThtMTF2bzZEd2JsQzds?=
 =?utf-8?B?Qml1YW1RNllaeVdLaEFxYzh2cTVyRmVPaURMU1gzT3prSXNCdEkrOVNOTzV3?=
 =?utf-8?B?bUhaem5ab0JXanNBL3ZmU3RyVkN2cDlPYlVxR1N6NjlRcnhmUTk0S2VyVis1?=
 =?utf-8?B?czhDRGZuMC9FQlZhSWlKNkJJcWltejAvWjl3SkFKbEFkaXkydTJpK213Q0pO?=
 =?utf-8?B?VTdsemIvaWZqNDFXZThva0NDYXdYMWV4Y21OZXM0NkZLV2lvVGFrenEwbGpy?=
 =?utf-8?B?N3NISVZlbXNNaXFZQzd5THdjYkZJNWpPNEk5WkN4S2o4OGZZM0JEdElUL0Nh?=
 =?utf-8?B?b2pRNWQwNFhjVzVyVFhKMDZyWDVFUjhFb0oyUkZLTDMwYWVVV2tUT3JPN00x?=
 =?utf-8?B?NzVKYnVQZk1sa1R5S0VLMzFhY255czA3ZlhSamVRV2xoSTN1WnBJMFQyZjdY?=
 =?utf-8?B?YXgvbjdBZnY4U2ZmOEVoS3NDMzR2bU4rS1pyaG5aVVVMYWhhdFpMRlBPYjdi?=
 =?utf-8?B?MFZTNDRET1hqZHAwZnFmQXlURVZERXFaTWtVbFA2VitJTWxUTVY5bkYxdS9x?=
 =?utf-8?B?T2VzeElIdUhhWkdmcEpKNFlvTTh6bmFGOS9sVGhFN20vajBWbXYxSG4zV3V6?=
 =?utf-8?B?cEprSWtlMThRamhLYmRjTkZxYXllTko3U1dFYWVaaTFOYXVEMkNNZEJKSzRT?=
 =?utf-8?B?dXBLbkxHQWl3UzdVMFB0aE4wK3NQOUd0dEx4YStYWGZUcHpLNTlsYitBWWZt?=
 =?utf-8?B?RWorN0Z4enFWZVczZUEwM3puK1VtS0xDUXVJY1FWM216bUhZVnRENG5TeW80?=
 =?utf-8?B?VjJnRTBzdkdROXVTVGt2TERGWGtDRXdOSGJ3WWdqSUI5MmRaYmUzLzhyOHVs?=
 =?utf-8?B?bXVIdGtuWXFaQkhtYWpsRjh3ckVFR3lQdVR5bEVnc0xsNkFneG5LbzlSbU94?=
 =?utf-8?B?SlFTSGRZMndUNzBpazBySGt1M1BYbDA0WVpvNWdINnNvTm05MzBCK0RPangr?=
 =?utf-8?B?UytkYXJteXllY3ZjVE1hb1drTElFL2xXMTFuRWsyZUg1MWlUc1ZDY0k4RDhi?=
 =?utf-8?B?L1VTTWZ5clYzbVJvdXVzS0FiWXZHU3Y4aEZtMTNOR01Bd1BJWC9TSmlXWjJl?=
 =?utf-8?B?ZlFjeWg3c3U5UWhDUEtLcjk4SXZ0SU8wU2RCRDBkSzZ2UDIyNTcxYWl4TEJu?=
 =?utf-8?B?R05TMTdoZERBbUQ2UzFxZEVZUkdIR3lzakxFa3BoYTZwYUtZL1ZZMDBzWWRP?=
 =?utf-8?B?R2RhUzZUSHZpeVFMczBnT2tzNHd6ZWUrQ3F4UnI2QWZqTmIvVjM1NFpLd0Nq?=
 =?utf-8?B?UDZRTjI5NUE5ZE9QTW5KUTFnVW9DMzRTamxDSFl0cnovZmhaSnRpVks4ZGkw?=
 =?utf-8?B?ZXNhSVhyblZiZ3BnMmREWEloSjUzeDhSbmp4NG1kUDBaWGo3VllEU0x0QlB0?=
 =?utf-8?B?WGpHR29VeFAzMVJwNStOcnc2dkMyYVI4TTE4eWUzdTU1L1pOUFFSNWtwR2ZV?=
 =?utf-8?B?N0F5SU1sMllVNDlVN3pXeFpUdkxLVThLS3lCQXMrRzNxM1NMVGx3Nk85Q3B0?=
 =?utf-8?B?ekZyM2RhWG5wK3hGMHVoR1Q4L2U3ZnFUeGFVWHh6K21nYUhmalh1cUQ2bU5B?=
 =?utf-8?B?VE94cm45ay9leFNLS1AvM1c0dUNsd1U3bmhPQVcwelF5ZFlnbXF5NjhhWjlN?=
 =?utf-8?B?cG94LzhxUHE0cFJ3RklNcS8wRlFhazZkUkloQU1KVHFrWTdzNEQ0SnhCNS9U?=
 =?utf-8?B?aDZmT1ZLdU5rZ2FlbkxISXBEOTZjaTZ4VGMwbjZkSWVTUUxSNFYvZUJ2MUR4?=
 =?utf-8?B?OWFFTThaQTNlU1dCcFVHUTVQdTRBbzdBcUFJT2ZCSW5vM3QvSzJDKzlHQjdr?=
 =?utf-8?B?ZUlvSW1qaUs0ekJKcmtyamt3d3JHNFV6QzRoRWd3Qk1VS3VPRVgyb3RZUGxM?=
 =?utf-8?B?RnhqcjNMYUMyeHdPT2NjZTBReDdXWVNUWDRabDdwV0dKQ0tLRkR0dzhlMEdt?=
 =?utf-8?B?ODZSRnNlSFNGQmNHNHlxaEc1Ly9Lc3haRTE3ZUg5NlhPa2owRWhoV01zY2RJ?=
 =?utf-8?Q?0MQH/i4dDmOgpYd3y6oOgQOIb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0befe5bc-dc1a-4654-00d5-08dd6b82b295
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 09:52:04.1991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RkiIjF9sqOhU/ZDKbGfmTq7BN9MIqyPkibu5hMP97wibdyEUmZRQlYv/htHqAHaTvbZkmrPSVmminXGBuMkKxcwqNfTdni7uarpd3chVDrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR06MB7241

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNiAxLzNdIGR0LWJpbmRpbmdzOiBpMmM6IGFzcGVlZDog
c3VwcG9ydCBmb3INCj4gQVNUMjYwMC1pMmN2Mg0KPiANCj4gT24gMjQvMDMvMjAyNSAxMTowMSwg
UnlhbiBDaGVuIHdyb3RlOg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNiAxLzNdIGR0LWJp
bmRpbmdzOiBpMmM6IGFzcGVlZDogc3VwcG9ydCBmb3INCj4gPj4gQVNUMjYwMC1pMmN2Mg0KPiA+
Pg0KPiA+PiBPbiAyNC8wMy8yMDI1IDA5OjMwLCBSeWFuIENoZW4gd3JvdGU6DQo+ID4+Pj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MTYgMS8zXSBkdC1iaW5kaW5nczogaTJjOiBhc3BlZWQ6IHN1cHBv
cnQgZm9yDQo+ID4+Pj4gQVNUMjYwMC1pMmN2Mg0KPiA+Pj4+DQo+ID4+Pj4gT24gMTkvMDMvMjAy
NSAxMjoxMiwgUnlhbiBDaGVuIHdyb3RlOg0KPiA+Pj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MTYgMS8zXSBkdC1iaW5kaW5nczogaTJjOiBhc3BlZWQ6IHN1cHBvcnQNCj4gPj4+Pj4+IGZvcg0K
PiA+Pj4+Pj4gQVNUMjYwMC1pMmN2Mg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IE9uIDE3LzAzLzIwMjUg
MTA6MjEsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPj4+Pj4+Pj4gTmVpdGhlciB0aGlzLg0KPiA+Pj4+
Pj4+Pg0KPiA+Pj4+Pj4+PiBTbyBpdCBzZWVtcyB5b3UgZGVzY3JpYmUgYWxyZWFkeSBleGlzdGlu
ZyBhbmQgZG9jdW1lbnRlZCBJMkMsDQo+ID4+Pj4+Pj4+IGJ1dCBmb3Igc29tZSByZWFzb24geW91
IHdhbnQgc2Vjb25kIGNvbXBhdGlibGUuIFRoZSBwcm9ibGVtIGlzDQo+ID4+Pj4+Pj4+IHRoYXQg
eW91IGRvIG5vdCBwcm92aWRlIHJlYXNvbiBmcm9tIHRoZSBwb2ludCBvZiB2aWV3IG9mIGJpbmRp
bmdzLg0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiBUbyBzdW1tYXJpemU6IHdoYXQgeW91ciB1c2Vy
cyB3YW50IC0gZG9uJ3QgY2FyZS4gU3RhcnQgcHJvcGVybHkNCj4gPj4+Pj4+Pj4gZGVzY3JpYmlu
ZyBoYXJkd2FyZSBhbmQgeW91ciBTb0MuDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBPSywgZm9yIGFz
dDI2MDAgaTJjIGNvbnRyb2xsZXIgaGF2ZSB0d28gcmVnaXN0ZXIgbW9kZSBzZXR0aW5nLg0KPiA+
Pj4+Pj4+IE9uZSwgSSBjYWxsIGl0IGlzIG9sZCByZWdpc3RlciBzZXR0aW5nLCB0aGF0IGlzIHJp
Z2h0IG5vdw0KPiA+Pj4+Pj4+IGkyYy1hc3BlZWQuYyAuY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0
MjYwMC1pMmMtYnVzIiwgQW5kIHRoZXJlDQo+ID4+Pj4+Pj4gaGF2ZSBhIGdsb2JhbCByZWdpc3Rl
cg0KPiA+Pj4+Pj4gdGhhdCBjYW4gc2V0IGkyYyBjb250cm9sbGVyIGFzIG5ldyBtb2RlIHJlZ2lz
dGVyIHNldC4NCj4gPj4+Pj4+PiBUaGF0IEkgYW0gZ29pbmcgdG8gZHJpdmUuIFRoYXQgSSBwb3N0
IGlzIGFsbCByZWdpc3RlciBpbiBuZXcgYW4NCj4gPj4+Pj4+PiBvbGQgcmVnaXN0ZXINCj4gPj4+
PiBsaXN0Lg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gRm9yIGV4YW1wbGUsDQo+ID4+Pj4+Pj4gR2xv
YmFsIHJlZ2lzdGVyIFsyXSA9IDAgPT4gaTJjIHByZXNlbnQgYXMgb2xkIHJlZ2lzdGVyIHNldA0K
PiA+Pj4+Pj4+IEdsb2JhbCByZWdpc3RlciBbMl0gPSAxID0+IGkyYyBwcmVzZW50IGFzIG5ldyBy
ZWdpc3RlciBzZXQNCj4gPj4+Pj4+IEl0J3MgdGhlIHNhbWUgZGV2aWNlIHRob3VnaCwgc28gdGhl
IHNhbWUgY29tcGF0aWJsZS4NCj4gPj4+Pj4NCj4gPj4+Pj4gU29ycnksIGl0IGlzIGRpZmZlcmVu
dCBkZXNpZ24sIGFuZCBpdCBzaGFyZSB0aGUgc2FtZSByZWdpc3RlciBzcGFjZS4NCj4gPj4+Pj4g
U28gdGhhdCB0aGUgcmVhc29uIGFkZCBuZXcgY29tcGF0aWJsZSAiYXNwZWVkLGFzdDI2MDAtaTJj
djIiIGZvcg0KPiA+Pj4+PiB0aGlzDQo+ID4+Pj4gZHJpdmVyLg0KPiA+Pj4+PiBJdCBpcyBkaWZm
ZXJlbnQgcmVnaXN0ZXIgbGF5b3V0Lg0KPiA+Pj4+DQo+ID4+Pj4gV2hpY2ggZGV2aWNlIGlzIGRl
c2NyaWJlZCBieSB0aGUgZXhpc3RpbmcgImFzcGVlZCxhc3QyNjAwLWkyYy1idXMiDQo+ID4+Pj4g
Y29tcGF0aWJsZT8gQW5kIHdoaWNoIGRldmljZSBpcyBkZXNjcmliZWQgYnkgbmV3IGNvbXBhdGli
bGU/DQo+ID4+Pj4NCj4gPj4+IE9uIHRoZSBBU1QyNjAwIFNvQywgdGhlcmUgYXJlIHVwIHRvIDE2
IEkyQyBjb250cm9sbGVyIGluc3RhbmNlcw0KPiA+Pj4gKEkyQzEgfg0KPiA+PiBJMkMxNikuDQo+
ID4+DQo+ID4+IFNvIHlvdSBoYXZlIDE2IHNhbWUgZGV2aWNlcy4NCj4gPiBZZXMsIG9uZSBkcml2
ZXIgaW5zdGFuY2UgZm9yIDE2IGkyYyBkZXZpY2UuDQo+ID4+DQo+ID4+PiBFYWNoIG9mIHRoZXNl
IGNvbnRyb2xsZXJzIGlzIGhhcmR3aXJlZCBhdCB0aGUgU29DIGxldmVsIHRvIHVzZQ0KPiA+Pj4g
ZWl0aGVyIHRoZQ0KPiA+PiBsZWdhY3kgcmVnaXN0ZXIgbGF5b3V0IG9yIHRoZSBuZXcgdjIgcmVn
aXN0ZXIgbGF5b3V0Lg0KPiA+Pj4gVGhlIG1vZGUgaXMgc2VsZWN0ZWQgYnkgYSBiaXQgaW4gdGhl
IGdsb2JhbCByZWdpc3RlciwgdGhlc2UNCj4gPj4+IHJlcHJlc2VudCB0d28NCj4gPj4gZGlmZmVy
ZW50IGhhcmR3YXJlIGJsb2NrczoNCj4gPj4+ICJhc3BlZWQsYXN0MjYwMC1pMmMtYnVzIiBkZXNj
cmliZXMgY29udHJvbGxlcnMgdXNpbmcgdGhlIGxlZ2FjeQ0KPiA+Pj4gcmVnaXN0ZXINCj4gPj4g
bGF5b3V0Lg0KPiA+Pj4gImFzcGVlZCxhc3QyNjAwLWkyY3YyIiBkZXNjcmliZXMgY29udHJvbGxl
cnMgdXNpbmcgdGhlIG5ldyByZWdpc3Rlcg0KPiA+Pj4gbGF5b3V0DQo+ID4+DQo+ID4+IFdoaWNo
IHBhcnQgb2YgInNhbWUgZGV2aWNlIiBpcyBub3QgY2xlYXI/IFlvdSBoYXZlIG9uZSBkZXZpY2Us
IG9uZQ0KPiBjb21wYXRpYmxlLg0KPiA+PiBXaGF0ZXZlciB5b3UgZG8gd2l0aCByZWdpc3RlciBs
YXlvdXQsIGlzIGFscmVhZHkgZGVmaW5lZCBieSB0aGF0DQo+ID4+IGNvbXBhdGlibGUuIEl0IGRv
ZXMgbm90IG1hdHRlciB0aGF0IHlvdSBmb3Jnb3QgdG8gaW1wbGVtZW50IGl0IGluIHRoZSBMaW51
eA0KPiBrZXJuZWwuDQo+ID4NCj4gPiBTb3JyeSwgSSBzdGlsbCBjYW4ndCBjYXRjaCB5b3VyIHBv
aW50Lg0KPiANCj4gDQo+IEkgcmVwZWF0ZWQgdHdpY2UgIllvdSBoYXZlIG9uZSBkZXZpY2UsIG9u
ZSBjb21wYXRpYmxlLiIsIHByb3ZpZGVkIGZldyBtb3JlDQo+IHNlbnRlbmNlcyBhbmQgaWYgdGhp
cyBpcyBzdGlsbCB1bmNsZWFyLCBJIGRvbid0IGtub3cgd2hhdCB0byBzYXkgbW9yZS4NCj4gDQo+
ID4gSSBzZXBhcmF0ZWQgdGhlIHN1cHBvcnQgaW50byB0d28gZHJpdmVyczoNCj4gDQo+IEkgZG9u
J3QgY2FyZSBhYm91dCB5b3VyIGRyaXZlcnMsIHdoeSBhcmUgeW91IGJyaW5naW5nIHRoZW0gaGVy
ZT8NCj4gDQo+ID4gaTJjLWFzcGVlZC5jIGZvciBsZWdhY3kgbGF5b3V0LCBjb21wYXRpYmxlICJh
c3BlZWQsYXN0MjYwMC1pMmMtYnVzIg0KPiA+IGkyYy1hc3QyNjAwLmMgZm9yIHRoZSBuZXcgcmVn
aXN0ZXIgc2V0LCBjb21wYXRpYmxlIGNvbXBhdGlibGUNCj4gImFzcGVlZCxhc3QyNjAwLWkyY3Yy
Ig0KPiA+IERvIHlvdSBtZWFuIEkgaGF2ZSBpbnRlZ3JhdGUgaW50byAxIGRyaXZlciBhdCBpMmMt
YXNwZWVkLmMgPyBjYW4ndCBiZQ0KPiBzZXBhcmF0ZSB0d28gZHJpdmVyPw0KPiANCj4gV2hhdCBp
cyB0aGlzIHBhdGNoIGFib3V0PyBCaW5kaW5ncy4gTm90IGRyaXZlcnMuIExvb2sgYXQgZW1haWwg
bW9udGggYWdvOg0KPiANCj4gIkFsbCB0aGlzIGRlc2NyaWJlcyBkcml2ZXIsIG5vdCBoYXJkd2Fy
ZS4iDQo+IA0KPiBXaHkgYXJlIHlvdSBrZWVwIGJyaW5naW5nIGhlcmUgZHJpdmVycyBzaW5jZSBh
IG1vbnRoPw0KTGV0IG1lIHRyeSB0byByZXBocmFzZSB0aGUgcmVhc29uaW5nIGZyb20gYSBoYXJk
d2FyZSBwb2ludCBvZiB2aWV3Og0KDQpPbiBBU1QyNjAwLCBlYWNoIEkyQyBjb250cm9sbGVyIGlu
c3RhbmNlIGlzIGZ1bmN0aW9uYWxseSB0aGUgc2FtZSB0eXBlIG9mIGRldmljZSAoSTJDIGNvbnRy
b2xsZXIpLCANCmJ1dCBpdCBjYW4gcHJlc2VudCB0d28gZGlmZmVyZW50IGFuZCBpbmNvbXBhdGli
bGUgcmVnaXN0ZXIgbGF5b3V0cywgDQpkZXBlbmRpbmcgb24gYSBoYXJkd2FyZS1jb250cm9sbGVk
IGNvbmZpZ3VyYXRpb24gKHZpYSBnbG9iYWwgcmVnaXN0ZXIgYml0cyB0aGF0IGFyZSBmaXhlZCBp
biBwcm9kdWN0aW9uIFNvQ3MpLg0KVGhlIGxheW91dHMgYXJlIG5vdCBiYWNrd2FyZC1jb21wYXRp
YmxlOg0KUmVnaXN0ZXJzIGFyZSBhdCBkaWZmZXJlbnQgb2Zmc2V0cy4gQml0IGRlZmluaXRpb25z
IGRpZmZlci4NClRoZSBwcm9ncmFtbWluZyBzZXF1ZW5jZSBpcyBub3QgdGhlIHNhbWUuDQpCZWNh
dXNlIG9mIHRoaXMgaW5jb21wYXRpYmlsaXR5IGF0IHRoZSByZWdpc3RlciBsZXZlbCwgc29mdHdh
cmUgY2Fubm90IGhhbmRsZSBib3RoIGxheW91dHMgaW4gYSBnZW5lcmljIHdheSB3aXRob3V0IGV4
cGxpY2l0IGtub3dsZWRnZSBvZiB3aGljaCB2ZXJzaW9uIGlzIHByZXNlbnQuDQpUaGF04oCZcyB3
aHkgSSBwcm9wb3NlZCBhIG5ldyBjb21wYXRpYmxlIHN0cmluZyDigJQgdG8gcmVwcmVzZW50IGEg
aGFyZHdhcmUtdmlzaWJsZSBkaWZmZXJlbmNlIGluIHJlZ2lzdGVyIGludGVyZmFjZSwgZXZlbiB0
aG91Z2ggdGhlIGxvZ2ljYWwgZnVuY3Rpb24gKEkyQyBjb250cm9sbGVyKSBpcyB0aGUgc2FtZS4N
Cg0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K

