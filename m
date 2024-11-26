Return-Path: <linux-i2c+bounces-8227-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 407E29D96FC
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 13:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E537AB21917
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 12:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFED61CD219;
	Tue, 26 Nov 2024 12:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jS7qS2Bs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2045.outbound.protection.outlook.com [40.107.249.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870071C4616;
	Tue, 26 Nov 2024 12:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732622886; cv=fail; b=esumJ9zbP5GJbYCIaYt8FBA1cgoMM+YAFFEOsv78U6bZco0oA3ngqcfXRfyLp+PgcCud9+cxk3i/xUg/YduOgOVezd/PIgq0gwqHhYBRU+4ihO9Ou6se7xz5ruzE6EU6/40IuXyI3SXLoWovrVhnClBA039renXdscbZIn3DPso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732622886; c=relaxed/simple;
	bh=wr+bEXroiWnLIgk+QrEWBPUECxIDb1kFgTo12MAKEJo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rJk3ElkSuZHfVQWmmRl3eUbW+4dn1y8ApAuSSq2eiHNpSZPSC3deRbg4xeEh23eM65Fdo+xs95IGUUTXWfwSYpAciW5JY61rdMNZyBMQQ94vnx1szZoz6BhlRluL+MPV2Bathigkgi3MzrAbJG61jzHZq4Ydv0eEoGC0jMcTNzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jS7qS2Bs; arc=fail smtp.client-ip=40.107.249.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMia/UhTTm5vp0JR1Q0ymmXftykfv2W3Pg4zhyaxo0OHXjcWTPsU2ewXSs+l6T8fHWjx8OIPlZuJ8hGv1dOJHXvhtzcGZrtkHgwWdnaLBY55rydQeMJEixcZgkHFkMR97GeyP5tODWs3Ld9Aj0IyHE9f5pLJkerf9K1vRvaLOMvrQs9oULnJWoajywNO24bFu5J9gt1WBdaGBwom4MgJVa/3FSpwgPayy8yAKhNEkIQ8vLJjjyVyd/Rd72pP3dSK+xIEisNqE/LvKmNaGPh3GYpvy7vezDf34Qr0tbvRLP9/LT6vZgZS9DbkBb1MzvJ9boJJmQKpAFzMUmhvJDOHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wr+bEXroiWnLIgk+QrEWBPUECxIDb1kFgTo12MAKEJo=;
 b=O8t+a7HIl+HemYTsLNenIei2mZ600Jg0oL8n6mdNEUxSFRkyoiTrxsZOH4CP0iDbqqDqhzcR/QtejOIqZ4YqsF9sxHRVgp009oP9uqovaDxhF5Ncrpl1iJgIkMWgwuQDgfDSDyB9P3L1BDdUlHp/71QVyub6I+In68dV8HXs2Eia4fN6DS+3YOW6wie4FL/uTDBAcFiSoIj/WtRadmjfxSnaFozcqEwK4pX2iZJHwB94g977vEp3YF85CUUvm1EFsuRAxlERMMMNJ1nE7+OiiJ28hOfYRc0lMifxY6F/sxDF7qsw2mf5eDB84t1TRbq4OGCnoD6A2g/81M6YqlFwKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wr+bEXroiWnLIgk+QrEWBPUECxIDb1kFgTo12MAKEJo=;
 b=jS7qS2BsSAoFEkYk/TDjeKTdlaExXqVPAdNp/bmyDzGAjzwU85JcNaop6SUp0EjLDLy5ov+JB9Ttb0u24W41ctFSD2j38Y3T2eD7wIRHjzXR47RIdHrZkYHyGJn4OdBGIrBA4sQkE4O0XSNnrqokVtw0iEfgcL3/D0M8QKyz4P44upPmhK6RRTGyiErbbhersRaXzGVtKjqji+r5pmvbfcdIdUNHRPbLsGEghxBZCIhgOriniHMe/BVi/nGjbjN9L73110j0p0FlvdtvvlGCH8wj6zXhvVwLIrdQpliPRrW/bMncbr+jpisxbf8TQF4naXWui9dcK9zBixUbCeeLyw==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AM8PR04MB7876.eurprd04.prod.outlook.com (2603:10a6:20b:240::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 12:08:01 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Tue, 26 Nov 2024
 12:07:59 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
CC: Frank Li <frank.li@nxp.com>, "o.rempel@pengutronix.de"
	<o.rempel@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: imx: support DMA defer probing
Thread-Topic: [PATCH v2] i2c: imx: support DMA defer probing
Thread-Index: AQHbP/vVyVyybYP9ckKIUXcPdVN3vQ==
Date: Tue, 26 Nov 2024 12:07:59 +0000
Message-ID:
 <AM0PR0402MB39374E34FD6133B5E3D414D7E82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241126082535.1878554-1-carlos.song@nxp.com>
 <20241126-economic-energetic-junglefowl-5197a9-mkl@pengutronix.de>
 <AM0PR0402MB39372380307BC4252BD131ACE82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <20241126-paper-nightingale-of-wealth-de17e7-mkl@pengutronix.de>
In-Reply-To: <20241126-paper-nightingale-of-wealth-de17e7-mkl@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|AM8PR04MB7876:EE_
x-ms-office365-filtering-correlation-id: 61bb3d79-e0cc-45df-9ebd-08dd0e12f868
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bjByUmVSMU0ydWZuakpydUVacnpRRHY1OGovSTlmNHpNR3QwZFliQlc1Wjcx?=
 =?utf-8?B?cUlhZ2JhTGYxbUkvQVJLc05mbHVzTVFFeFNTaHpQWisxNTJzdllkc1FCK3E2?=
 =?utf-8?B?S1haRWY1NCtkenozQ1Z5UFhBT2NnaWVQR2JUL0Z0S3NNaVZaVHJRTEsyUUxI?=
 =?utf-8?B?RWhReHFZU1BLQ2pBbStUT2c0cmxTcmtMZTFheXpFVE9DTm1LM2F6VE5kZ1U4?=
 =?utf-8?B?U0JRWVd6L0tuUzRKMEplK1REeGhZYWtUUlVXTVBkWVZ1QnppQTJZT25mUUx0?=
 =?utf-8?B?Qm1ZSE00elNCUE9wdlppaEtyY1ViYUxPaTVITktROHZGMjRobTdJUUlrRXNp?=
 =?utf-8?B?Q010bVZieVRVaDhlRUdIUGtDWTFRaG9Xd3VSaU9lckpHQUZpOUVhYjljalJt?=
 =?utf-8?B?ZVhEdmVsdVova3BPNE54RW5JVFhHcWRsS2t4Z3p5K3BJL01jOWFTRnZPZmpw?=
 =?utf-8?B?WnpMUDBBaDl2U1FQdTBuV3EyZHNUZEVLNzQ1UXJpVVJJMGtiMUVrK2lRZUpi?=
 =?utf-8?B?WUtqc1JlTEF6TEhKaElQZUQxT3FxekFka0lEdEpaL3d1TjlKWXdubzJGNEl2?=
 =?utf-8?B?M3EyRDBVSVhSNU5WZ3RGUVgzUVJ2ZEZ0b0gvZmI4YTBwRjE2NCtta2VUMWRB?=
 =?utf-8?B?UTl0c3IzSTR6VW9ITVh5cGt1U25sMG1TVU5MN095ZlVKZWdNT0RSNVNuRS83?=
 =?utf-8?B?SVN5QnNpYzBUeTY1dDNLYmtUaVltMTJLL0FLVVJnbWl3c0Z3ZnRiL2xGajhv?=
 =?utf-8?B?Y0QxYXEzTGZiVmkzN1hGOGpaL0R2NDd4UXJwcGw0YnJFWFBhdVN4bUJHTDZn?=
 =?utf-8?B?WXh1TDhEREVVb253K3JBc2owM09zaVJUWSsxNllFNzBrK0VLNlVPYmhOblpj?=
 =?utf-8?B?VDViaGpQQVhMRG5aTVhkTG5mR2wrSEhrNFhoU3hFdkRMSlR2TTdockV2dDFy?=
 =?utf-8?B?L1ZUSTBKNzY4QlJSOHZHbkFPY3BVVTM3SDI2eXNQMjg3cW5xcjBKMkxxbFBr?=
 =?utf-8?B?T0xqWG5vOVdONEpmcU5jUm42L3pCMSs5dS9IUEpBWXdVeHg2RzQ1eVA1U0Ey?=
 =?utf-8?B?ZnBCalE3K2lZb3ZhSTNacWFkS284WmdmUWl5V0k4aEwvOEZ5c250ZGFtY3RQ?=
 =?utf-8?B?V3V6cC90LzV4L3JKcDFsZjdTaXhCcDY2WVJ5aEV2KzQvOGhoK09XZDBURnFL?=
 =?utf-8?B?ZnFJUnZ0TktzaW5VbHh5c2Y1RlpocUlsU3FRSkZDYncrcnA5SUk2Zld4d2VL?=
 =?utf-8?B?Y1FNalNyaWVBczFUYWthSzVvYXJ3NDV5NU5KN1haZXRSVFYzUUFZaGo4QzlY?=
 =?utf-8?B?QVdZT3RpYlV0bXhaVUE0cjFlblphSTNHWlA4TFdocy9Ba0ltSXBRR2FIcHE1?=
 =?utf-8?B?RjlvQXpiTGpYckNwMmpObmQ3L09kc1N3dFgwcFFtcnBBdmIyYmVhaTBiRXlT?=
 =?utf-8?B?alg4TDR2WU1kT0Z0bFU2VGRmRFdqaVVFcW1SOVgycS8yaXpMOEJ6UmJFYk9R?=
 =?utf-8?B?cFhpVVFacnR6M05jaHM2d3Q4ZnRwc1VZamprWExEUHNvYWY0VHlHL01wczVE?=
 =?utf-8?B?bWNEWGpIZGY1ZFhHZjdMVlE3ZjhsY3pJL3RsVkxiZVRZUElwVG15L0hBVExR?=
 =?utf-8?B?YTZNeEM4eEt4eXZkd0Q0Q1pHaC9Hei8yb0JUdmJsVmpSYVNZaXlYR2JKMkp6?=
 =?utf-8?B?QjZmQ3BmZjNHV0l6aFFTaDM2MFd4aWRBZmdHSkNKRnVFT3ZvRkQxZzN1eWM4?=
 =?utf-8?B?MGgxNDZPVEE1eFZoNHdCaVlWWUNQZFMvOFZFQlBQRXJHSFc2UTRjVUQxUGdh?=
 =?utf-8?B?Um9sdmlaeGZ4eVdrQy9sZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QUlHUVdJU2hmaW5VZ2NNS1hKSVh6aFdjaEcvMXZIejZNVitTdUpmWmpIQmk1?=
 =?utf-8?B?Uy9IMzlKM2ZGdWdRdFpWUVRUSWUrSHkvbU5XbWNmNm10MVpoaER1UFY3QkFv?=
 =?utf-8?B?ZmJnMjBWR3Z3czk0c0dnZ3ppVUxocmJ1T1ZKeklmb25iZnhCN3hENkFKZ0ho?=
 =?utf-8?B?bUxjcnkvRjJNTWdRREl3MzhhVkRTNU1TZkVWMEt4bEJ4R1MzcE9KZm5SZ2hM?=
 =?utf-8?B?SmxxL0hramJpUkgrcUtKZ09lcGR5OVRtQm94NEthN0dlejFha3NnR2FZWkJV?=
 =?utf-8?B?cEs2ajg2MUVxei9ZTnpFSHZ2bVlZUDVYVVdJNTJGNzcwUDlFQ1ZNWjUwRWdM?=
 =?utf-8?B?QUx2ZkpXc3V1WlErNUoxMm9iYkh1SytiVkJIK1lrOUxKa2J2bGVEVFhiOEFk?=
 =?utf-8?B?ZHNzcXQ0M29BMHpZYWJ5SUdHZHRQMEZwWFVuZzRTb0lPdEUwY1ltWGdFUFJE?=
 =?utf-8?B?b1k3czVWcWdsOUU3VEdqb3ZkVjkwWkRMcmEwSXlkQWhoZWdSQW5WQ1RYZHQv?=
 =?utf-8?B?dFRKaU41cXRIYmtUZmdPUmgrdzFHVFBTZDY0eGNZV0E2M24vdFdFdUQ5NFFs?=
 =?utf-8?B?RkJHVSs4ekFQQjZ5VXhWNUlpa0MwMGdWQUxXMWkvNjVJQzBNZS9JY2l6WGpL?=
 =?utf-8?B?S3ZobGhUTmdrK0RsY0xRSHpTd2lSYjB5L1hDSU1SMGQzcVRjb2pPMzRhNm9G?=
 =?utf-8?B?R1Jxa1d4alUzUElWMkV2RXFCYk40WmtPQjduQzVPVFVuTTRzWEdoR1pBS3hP?=
 =?utf-8?B?VzRwREZNT1ZNSlI2QkN6VW9VenlVZXI2OGdFa0VFVE05dFp5RFRGM3cxK0sy?=
 =?utf-8?B?SVNqNVV5UUh2cGljbnpySnV2bjZXZmw1RW5kbUNQZkFRMXVNRTlSRlFYZU9l?=
 =?utf-8?B?QkRqRjlvT2xDMFd1TW9aQWo1azB3M1lWbmVQNWlaT2w5TGNvVUd5WmZiL3FD?=
 =?utf-8?B?QTRkUjhTaHhVdVUxT3I2d01OdmJOa0FpRXBHN0w2TmdFNU5rZkw3amxYd0ZY?=
 =?utf-8?B?WVEwT3pXd01iTkQ1WVRtMGpGQWVRM21UaDh3MVJwQnZkb0h4LzRuMndCSUhx?=
 =?utf-8?B?RFZFNHlnOTd4VXNGcXRCc2pJbHpvcURpWURkZnhIZHJEN1cyKysremxHVkpL?=
 =?utf-8?B?cXhpNUlQbWRUR0U0SnVXV2NqZGhLOGlvaWtSUnFIdzBpdEN0M0c3SGM4SGhZ?=
 =?utf-8?B?Um8wd3M2NCtsM3lnbGJiekZ1TWRUVHE5bWJBZ3VWdlpYQVlzU1l2U3FZZjRB?=
 =?utf-8?B?UVJ0bCtneVFCRTdQNHJDUWdudVpaWkFGazZzRVVndHFud2V3WkFYMkt2eC8v?=
 =?utf-8?B?ZVI2WDNyZDdBN0I4QmlCZ2c4ZVRITzRpLzZadzV5aTdoNGs1c1VpbDlxZnk2?=
 =?utf-8?B?UW5pTWhFTGlFeUFYSDI3ZDhHbGpLdnczcWRFeStwZm9iUmNjUlc5VHdwWDNk?=
 =?utf-8?B?L3lSUDRKZWRVRFNZaTc0c2ppcWo5M1A5UWhnR3NucWR2ekhLQnA0K04vWmNo?=
 =?utf-8?B?Ly9Ia3BUY2dlRVVmWEZnYVFGRmNXNndBczZ4b0s3MVlUL21COSsrSkRxR2l0?=
 =?utf-8?B?dkM3ei94TjlMMFZtK1UrWE1zdFFjSjhmSE5xWDJQWndqd3cydDQ2ZjR3bWt6?=
 =?utf-8?B?dURxSE8vRDcxQzhiK0c1endHSFNWRUJCKzVhdVF3SGlSMkQzckt2RGlNSmM1?=
 =?utf-8?B?SkdQSlZpdWFrZGlaNFZCcG9IcHVrSVA1dGMvaFR0SlN6V2FENjlQVFVBMGxz?=
 =?utf-8?B?WVhkSE4wY01ERlVoTmJVdHRUM2ZvSWxCSmU4T2F0OVlyUmtwOVhTL3ZtZ1c0?=
 =?utf-8?B?bjdZaXlsSUR2RVJVRHQzODB4YlNwb3pNdHFYaTdvSVZwdUdxZ2VTV1lNb240?=
 =?utf-8?B?c3Y5Y0RHVjZTQjlBUVU4bzBpM1BSZWR4WlUvVko5YkhxT2lGNk9CYlNQaWtj?=
 =?utf-8?B?NTdldFpaVE9tTFZqVThqL1FpSnZWM2hHUHRHUEg5elpYMjkwZXNwNithaHEv?=
 =?utf-8?B?aE4wb25OZnZIUzN5eGM2NnF6WlJUVTFFdUhPeGY2eVlpaStzZ1FRNFpUSnRB?=
 =?utf-8?B?VEdENUlEZ1MxTGNDaTJmTENKRGtzQmZrbm8wdU03VitBWlNoTG1YdDB1bmts?=
 =?utf-8?Q?y2TV3wx6apKuLcnJarYh0hGDC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61bb3d79-e0cc-45df-9ebd-08dd0e12f868
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 12:07:59.6248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /At2MzPdR8J13aMyCcB0Zunxbuip8knnY552D12XDdhxJwpZOzc7rYdfCsGrMS4sKYM6JyAONfIZJMYdkxv3Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7876

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyYyBLbGVpbmUtQnVk
ZGUgPG1rbEBwZW5ndXRyb25peC5kZT4NCj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMjYsIDIw
MjQgNjoyNCBQTQ0KPiBUbzogQ2FybG9zIFNvbmcgPGNhcmxvcy5zb25nQG54cC5jb20+DQo+IENj
OiBGcmFuayBMaSA8ZnJhbmsubGlAbnhwLmNvbT47IG8ucmVtcGVsQHBlbmd1dHJvbml4LmRlOw0K
PiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGFuZGkuc2h5dGlAa2VybmVsLm9yZzsgc2hhd25ndW9A
a2VybmVsLm9yZzsNCj4gcy5oYXVlckBwZW5ndXRyb25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29t
OyBpbXhAbGlzdHMubGludXguZGV2Ow0KPiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcNCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2Ml0gaTJjOiBpbXg6IHN1cHBv
cnQgRE1BIGRlZmVyIHByb2JpbmcNCj4gDQo+IE9uIDI2LjExLjIwMjQgMTA6MTU6MjcsIENhcmxv
cyBTb25nIHdyb3RlOg0KPiA+ID4gPiAgc3RhdGljIHZvaWQgaTJjX2lteF9kbWFfY2FsbGJhY2so
dm9pZCAqYXJnKSBAQCAtMTgwMyw2ICsxODA0LDEzDQo+ID4gPiA+IEBAIHN0YXRpYyBpbnQgaTJj
X2lteF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ID4gPiAgCWlmIChy
ZXQgPT0gLUVQUk9CRV9ERUZFUikNCj4gPiA+ID4gIAkJZ290byBjbGtfbm90aWZpZXJfdW5yZWdp
c3RlcjsNCj4gPiA+ID4NCj4gPiA+ID4gKwkvKiBJbml0IERNQSBjb25maWcgaWYgc3VwcG9ydGVk
ICovDQo+ID4gPiA+ICsJcmV0ID0gaTJjX2lteF9kbWFfcmVxdWVzdChpMmNfaW14LCBwaHlfYWRk
cik7DQo+ID4gPiA+ICsJaWYgKHJldCA9PSAtRVBST0JFX0RFRkVSKSB7DQo+ID4gPiA+ICsJCWRl
dl9lcnIoJnBkZXYtPmRldiwgIkRNQSBub3QgcmVhZHksIGdvIGRlZmVyIHByb2JlIVxuIik7DQo+
ID4gPiA+ICsJCWdvdG8gY2xrX25vdGlmaWVyX3VucmVnaXN0ZXI7DQo+ID4gPiA+ICsJfQ0KPiA+
ID4NCj4gPiA+IERvbid0IHNwYW0gdGhlIGxvZ3MgaWYgdGhlIGRyaXZlciBkZWZlcnMgcHJvYmlu
ZywgaXQncyBub3QgYSBlcnJvci4NCj4gPiA+IEFuZCBpdCBsb29rcyBzdHJhbmdlIHRvIGlnbm9y
ZSBhbGwgb3RoZXIgZXJyb3JzIGhlcmUuIEVpdGhlciBhZGQgYQ0KPiA+ID4gY29tbWVudCBoZXJl
LCBzb21ldGhpbmcgbGlrZSAiY29udGludWUgd2l0aG91dCBETUEiLCBvciBsZXQgdGhlDQo+ID4g
PiBmdW5jdGlvbiByZXR1cm4NCj4gPiA+IDAgaW4gY2FzZSB0aGUgZHJpdmVyIHNob3VsZCBjb250
aW51ZSBhbmQgcHJvcGFnYXRlIHRoZSBlcnJvciBpZiB0aGUNCj4gPiA+IGNhbGxlciBzaG91bGQg
dGFrZSBjYXJlIG9mIGl0Lg0KPiA+ID4NCj4gPg0KPiA+IEhpLA0KPiA+IFRoYW5rIHlvdSBmb3Ig
eW91ciBzdWdnZXN0aW9uISBJIGFncmVlIHdpdGggeW91Lg0KPiA+IEkgd2lsbCBjaGFuZ2UgdG8g
dGhpcyBsb2dpYzoNCj4gPiAJcmV0ID0gaTJjX2lteF9kbWFfcmVxdWVzdChpMmNfaW14LCBwaHlf
YWRkcik7DQo+ID4gCWlmIChyZXQpIHsNCj4gPiAJCWlmIChyZXQgPT0gLUVQUk9CRV9ERUZFUikN
Cj4gPiAJCQlnb3RvIGNsa19ub3RpZmllcl91bnJlZ2lzdGVyOw0KPiA+IAkJZGV2X2luZm8oJnBk
ZXYtPmRldiwgInVzZSBwaW8gbW9kZVxuIik7DQo+ID4gCX0NCj4gPg0KPiA+IFJldCA9IDAgIC0t
LS0tPiAgZW5hYmxlIERNQSBzdWNjZXNzZnVsbHkgIC0tLS0tLS0+IG5vIHByaW50DQo+ID4gUmV0
IT0wICAtLS0tLT4gIGRlZmVyIHByb2JlIC0tLS0tLS0tLT4gbm8gcHJpbnQgYW5kIHRyeSBhZ2Fp
bg0KPiA+IFJldCE9MCAgLS0tLS0+ICBmYWlsIHRvIGVuYWJsZSBETUEgLS0tLS0tPiByZW1pbmQg
bm93IGlzIHVzaW5nIHBpbw0KPiA+IG1vZGUNCj4gPg0KPiA+IERvIHlvdSB0aGluayB0aGUgbG9n
aWMgaXMgYWNjZXB0YWJsZT8NCj4gDQo+IFllcywgdGhlIG90aGVyIG9wdGlvbiBpcyB0byBtb3Zl
IHRoZSBsb2dpYyBpbnRvIGkyY19pbXhfZG1hX3JlcXVlc3QoKSBhbmQgbGV0IGl0DQo+IHJldHVy
biAwIGluIGNhc2Ugb2YgRE1BIG9yIGZhbGxiYWNrIHRvIFBJTywgb3IgYW4gZXJyb3IgaW4gY2Fz
ZSBvZiBwcm9iZSBkZWZlciBvciBhDQo+IGZhdGFsIGVycm9yLg0KPiANCj4gVGhpcyB3YXkgdGhl
IHByb2JlIGZ1bmN0aW9uIHdpbGwgbG9vayBsaWtlIHRoaXM6DQo+IA0KPiAgICAgIHJldCA9IGky
Y19pbXhfZG1hX3JlcXVlc3QoaTJjX2lteCwgcGh5X2FkZHIpOw0KPiAgICAgIGlmIChyZXQpDQo+
ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCByZXQsICJG
YWlsZWQgdG8gc2V0dXANCj4gRE1BXG4iKTsNCj4gDQoNClNvcnJ5LCBJIGhhdmUgc29tZSBkaWZm
ZXJlbnQgaWRlYXMuLi4NCjEuIERNQSBtb2RlIHNob3VsZCBiZSBvcHRpb25hbCBmb3IgaTJjLWlt
eCwgYmVjYXVzZSBpMmMtaW14IGNhbiBhY2NlcHQgRE1BIG1vZGUgbm90IGVuYWJsZWQsIGJlY2F1
c2UgaXQgc3RpbGwgY2FuIHdvcmsgaW4gQ1BVIG1vZGUuDQogIElmIHdlIHVzZSByZXR1cm4gZGV2
X2Vycl9wcm9iZSgpLCB3ZSBoYXZlIHRvIHJldHVybiBlcnJvciBhdCBpMmNfaW14X2RtYV9yZXF1
ZXN0KCkgZm9yICJzb21lIGZhdGFsIGVycm9yIiwgaXQgd2lsbCBjYXVzZSBpMmNfYWRhcHRlciBj
YW4gbm90IGJlIHJlZ2lzdGVyZWQsIHRoZW4ga2lsbCBpMmMgYWRhcHRlciByZWdpc3Rlci4NCiAg
SWYgd2UgYWx3YXlzIHJldHVybiAwIGF0IGkyY19pbXhfZG1hX3JlcXVlc3QoKSwgZGV2X2Vycl9w
cm9iZSB3aWxsIG5vdCB3b3JrIGZvcmV2ZXIuIFNvIGZyb20gbXkgcG9pbnQsIGlmIERNQSBpcyBu
b3Qgd29ya2luZyB3ZWxsLCBqdXN0IG91dHB1dCBhIGxvZyB0byByZW1pbmQgbm93IGkyYyBpcyBh
bHdheXMNCiAgd29ya2luZyBhdCBDUFUgbW9kZSwgd2UgaGF2ZSBubyBETUEsIHRoaXMgaXMgZW5v
dWdoLg0KMi4gd2hlbiByZWFsbHkgZGVmZXIgcHJvYmUsIHJldHVybiBkZXZfZXJyX3Byb2JlIHdp
bGwgcmV0dXJuIGRlZmVyIHByb2JlIGRpcmVjdGx5LCBidXQgd2Ugc3RpbGwgbmVlZCB0byBnb3Rv
IGNsa19ub3RpZmllcl91bnJlZ2lzdGVyIGJyYW5jaCB0byBmcmVlIGlycSwgY2xrX25vdGlmaWVy
X3VucmVnaXN0ZXIgYW5kIGRpc2FibGUgcnVudGltZSBwbS4NCiAgU28gd2Ugc3RpbGwgbmVlZCBt
b3JlIGp1ZGdlbWVudCBhdCBwcm9iZSBmdW5jdGlvbiB0byBoYW5kbGUgdGhpcy4NCg0KU28gSSBw
cmVmZXIgdGhpcyBsb2dpYzoNCg0KcmV0ID0gaTJjX2lteF9kbWFfcmVxdWVzdChpMmNfaW14LCBw
aHlfYWRkcik7DQppZiAocmV0KSB7DQoJaWYgKHJldCA9PSAtRVBST0JFX0RFRkVSKQ0KCQlnb3Rv
IGNsa19ub3RpZmllcl91bnJlZ2lzdGVyOw0KCWRldl9pbmZvKCZwZGV2LT5kZXYsICJ1c2UgcGlv
IG1vZGVcbiIpOw0KfQ0KDQo+IA0KPiByZWdhcmRzLA0KPiBNYXJjDQo+IA0KPiAtLQ0KPiBQZW5n
dXRyb25peCBlLksuICAgICAgICAgICAgICAgICB8IE1hcmMgS2xlaW5lLUJ1ZGRlICAgICAgICAg
IHwNCj4gRW1iZWRkZWQgTGludXggICAgICAgICAgICAgICAgICAgfCBodHRwczovL3d3dy5wZW5n
dXRyb25peC5kZSB8DQo+IFZlcnRyZXR1bmcgTsO8cm5iZXJnICAgICAgICAgICAgICB8IFBob25l
OiArNDktNTEyMS0yMDY5MTctMTI5IHwNCj4gQW10c2dlcmljaHQgSGlsZGVzaGVpbSwgSFJBIDI2
ODYgfCBGYXg6ICAgKzQ5LTUxMjEtMjA2OTE3LTkgICB8DQo=

