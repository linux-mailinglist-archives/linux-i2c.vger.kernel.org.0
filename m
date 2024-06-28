Return-Path: <linux-i2c+bounces-4449-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E4891B9C6
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 10:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59E361C2364E
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 08:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89291487C5;
	Fri, 28 Jun 2024 08:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="H0nKpcH2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2072.outbound.protection.outlook.com [40.107.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACB0146599;
	Fri, 28 Jun 2024 08:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563057; cv=fail; b=D9nmdyQodbTIHBHqCkKcElIUDQFYxJ743pbS/eCqKCP6GbaekIdnrY7StOgMKKT//yGVQRMZP5KKfmZj9xLlzEKr69rCUwO7Aaoqu+pqa+iB2g91de4nH7+kpetvmUqMkTEp6Lr9WPRikIqGKiY6Kc9IsD7SHl5aqjasRcFNaME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563057; c=relaxed/simple;
	bh=we6Rg0FcNhPYaub4J352lszc4IaQI12DwhSyi9eeouc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ldl9vw6SGcHL65G7TUq+yddUTzrHLthh+QFX6N9wRZkDVIhg/1GhEYRQk3LVriteHPSM3F5/z8V53Zg2RojsEaKbYRCLSX5kxMXFRvv0plfoYbQJON3XLdzjkx021gLLLxwf37vbQ/GivByohvHZxvWiOom9HGweLLgBJN3XS1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=H0nKpcH2; arc=fail smtp.client-ip=40.107.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYVhVMYUOkQ///vHvVLmXT9Kj4ohUSsUZLA/toE5d9HYXImUhEKQ746OxmteM8ZnnUZEEjPFJh5/SwYgyw14H/6AYwE7VCOEwyceFF22HetoqDAXZ1RBy//77+qp0FnReS3K+LnN27k16uvg3vgtTptIhIIgs5a47ubMpPW3+bPjjcycl0VRkh/J2MAqaGRla6+rXaNnaFc6AFZ+iF/cjYcxZW4IUSWHum9SS2qKsJNtv4cC77ubdar0N6sKUIEeXG2LSEpikL1YOasoVDmD89SpBoUprnBn6rXPWMv25Y96laXUl5xZlTopep8l0SV9kKJiBYemC8rtOD532qU3Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=we6Rg0FcNhPYaub4J352lszc4IaQI12DwhSyi9eeouc=;
 b=cTvGMwiaaV+F7Gso09J//zMX96P4riGSaJj4ce7u9zpokG3MKN2Sgs/bjhkeWcXtf0LskCP1uEHGtm/366fERqKCnCKR4CWIsAPIkvqARSBBS3OVJzy/HCb8PlafzXgx/H5kbYiNrFTTeo6JN7kC7T3d8y8oAo6PAQQBFjXrVIMMbeCdXMxuwqotp6nh90yXKCnGtfePENQJTbo3l1IBuDD0W2t52PA9wWGoFumFBw1sIh0yWTvln3uRzaX4kXPaycEKpxOzTNB4FKisJy9gnTknhNxVzB9MIEfRZU1tWGYugE00tAXLWh/aSoVeEj7yxrGJnXKj1WX+iotaMcy+tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=we6Rg0FcNhPYaub4J352lszc4IaQI12DwhSyi9eeouc=;
 b=H0nKpcH2WdySe6qCWLIJFY8UmZsYMdpSJUw2uV+k2qNkfXNySWPacSmLMfqlyIzBIznU7oUjfhLIcqt5u1COCwXjoePL9rWGNkZ6ohY8HwVELKu2N96ZsxSCVIcKK46bCz7FbVPvnwd5nznRiR/stlhf9cXZCTY3QLLBMKV2UK0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB5420.jpnprd01.prod.outlook.com (2603:1096:404:803f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 08:24:11 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 08:24:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Chris Brandt
	<Chris.Brandt@renesas.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
Thread-Topic: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
Thread-Index:
 AQHaxvl1VmkioavocEOGYVCwgbbtfLHcsPSAgAAbwoCAAAXZcIAAAqEAgAAAkfCAAAI1gIAAAhDQ
Date: Fri, 28 Jun 2024 08:24:11 +0000
Message-ID:
 <TY3PR01MB11346A2DFBD7FE81337A748D386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346EF9A001F68162148B70F86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <6289f329-118f-4970-a525-75c3a48bd28b@tuxon.dev>
 <TY3PR01MB1134603F92C72D9B6C6C3733C86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2f162986-33c5-4d80-958c-4f857adaad20@tuxon.dev>
 <TY3PR01MB11346CA73575CF61B2024F3B386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <79c26030-4b92-4ef3-b8ce-d011f492161b@tuxon.dev>
In-Reply-To: <79c26030-4b92-4ef3-b8ce-d011f492161b@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB5420:EE_
x-ms-office365-filtering-correlation-id: eb0e8c57-ab45-4615-a0cd-08dc974bb009
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?YWtDSU41MmZESGNLUW5BMjVtYU9tdXM5VzV5aXNlSHE2V01Qa3gzbjA1ZDdI?=
 =?utf-8?B?c1B6VzBiNEo5T29yckl3SHJkZWJqYUtyY0lNTlVuVklkdlYrOTBPL2R1ZjZ3?=
 =?utf-8?B?Nmtwa0pndGFzaURua0JJY3JybW1PemtFZ2FzK1FnVXYxUHZoZDU3eGlkTEx2?=
 =?utf-8?B?eHJiajZYRHdnOFU3NDNVS25FU1daMnYyVWNhZXBKcDdxTzM1UUhSMk9veGFm?=
 =?utf-8?B?dTltSUhoM1pSK0ZhN1kvVUkwTHE2UmVZeWEyMW94MW0zc3VlRzBlUmoydjl2?=
 =?utf-8?B?MncyOUl5ZldIekZiWEdpWi9KVk50aVNGTkY0MDJGbjVPcndSdnlWcnd1Mlcr?=
 =?utf-8?B?dFI5UTh6K1RaY01ib3lzRVdLcGxhMW1kTUVpMHdhWVpPM0hoLzB6dEVGbnZD?=
 =?utf-8?B?KzFmZXVFNldkR2Q4VFE5eHBVbnhjTkptMnhuc3J6aTV2V2ZXZVdqcDVMN0Nj?=
 =?utf-8?B?MXRHOW4rOUl0UjVCL3p4QVpGWVlVWjdhZnFGb3dDay9waUREZW5ob3VQOStR?=
 =?utf-8?B?Q1Y1MVJ4WEQ3LzBUSVdUNXN6RkpxNURkVExmdUlZdEtQL3pIY25JYUVydzBi?=
 =?utf-8?B?S0x4WC94azN4a0I1QjVEUUF4elpYWHdkaERVaEFWYTU2dkl6V1FXMXhHbkQw?=
 =?utf-8?B?SmZuTDI5TFZWbGdqNE5TeWlUeDkzbmptek5BRGpUT3BKenJDNEhGcnNqUi9a?=
 =?utf-8?B?RnR0dHRKa3FFeHJiZ0c2ZThHYStxUDJsMzN1dncyeFkvSmQ2MjB3VmRaaDI0?=
 =?utf-8?B?RS9VRWZ2aWxiRmZRTFB0WHRaQlJ1QXhYTUlLWmtpWXVZVzRlWnJSMzB6KzdF?=
 =?utf-8?B?d0hPV1lOLy9aSTM5bGFxWjgwQkp5Q0hCSkRzUk9QT2N2ZGhMMjEvUXBZVXIz?=
 =?utf-8?B?K3N3Z1l6cEdFYVdRVElkZFl3ajlTWmlMRzZyNUJ2azFhY0Uyc0dmK241TFM3?=
 =?utf-8?B?Uml4WEs3NXZSNmtqL2VvbjFmbjlUclliS0drakYwYkJOSTVxbnJZSEF1ZHY5?=
 =?utf-8?B?Z1BQTExEUVgrbjNXOEViS2J4MzlmK0cvWXFINktxejh2ZEE5MFV6SDYxd2xO?=
 =?utf-8?B?VXNURGcxYzlTRjJraUtFellxeXkvZ3k3SmM2RXo0cUd2eDRWaWYraVhrcXJQ?=
 =?utf-8?B?bUJPUVF6bENhRkxMWFgxcW1ETWVMajNzSHZoRmx3Sk5GWGpHL0F4Q0grSnhs?=
 =?utf-8?B?cytNNThGYXpwdGc2QmRJdnpVWFNhdzlNdFF4UXp4blJBTzB6eTZ4UXp0UEZi?=
 =?utf-8?B?L3pXb2hFNTB1SUFTM3d0MzFSeWVneGZOMG1XeDFLTGk5ODcyNnpMVVJwa25V?=
 =?utf-8?B?YS9XQmVHYXd3eGhtc3FnZERGOWtYbjQrSS9teHJ3UFVFblJrTHREaWVXMzJr?=
 =?utf-8?B?UEplNnJDZ2sxcSt3Sjl3TEQwWTF4Z3VjcXplZ3Njd0FTQk1NZWM0TlZVNnNs?=
 =?utf-8?B?YldSaU9naXNVQUZpZ3B1MlltRzNFdExGRUNwMUN6WUV4TjFGbllOQlA5c09n?=
 =?utf-8?B?emx6R1dvZkFVUlV1SnM5bmdaay9EZ3QxS2lrTXBSZmJkY1Z5cHdHaEVIbW1n?=
 =?utf-8?B?Q29XWVNQWDFLSzJmR1ZGK1c0Smp5Mm5zS0JZVEhoVzAxdk1xQk0vSkN1U1Ji?=
 =?utf-8?B?Vnl2SkV3THFSdXBVWnowU0dPblNPSS9TRWJFcURLbDFabG5iR1VEcDRXQnhB?=
 =?utf-8?B?YWcvQVR2S3lzcHM1bVFLMzByMlVGZmZKdXZpaWVrN3dnNVhjQzFBSDRwN1Z5?=
 =?utf-8?B?bk9qcGRYTmJhQlBTOVZ0OXhRSFo5SG05QTRMdDRrN2ZZVHdSUG45VlAvNlFq?=
 =?utf-8?B?WTBUYnBqUzljTWtnWmZsSUZ3U0Jva1crTDZ2MkVvOUwyYUtJSWY0YmxJMmpT?=
 =?utf-8?B?TXFSbm1uL3d2SXVuaGpOenYxWFFITUxUQ3N1WlFEc2RIaytRRlhuMG5PSHlF?=
 =?utf-8?Q?LfXlTatc7Ik=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZCtPN2U4L0RxTldnelZxOHlnL2h1Uk44QnB2UGdDODQyU3FUS3prazIzQ3BE?=
 =?utf-8?B?c0t5Rm9sS25vZlZWUWpPTjAvZEZTd1BNOUR6NXhmNWdKWk1HdnFSQ2lla2ZE?=
 =?utf-8?B?ZkdNUWNCU1Y3ZWRQWWhMTmJ2aDhMaWxXbDF0VUNOMTBZd05mSGE5NEYvc2pl?=
 =?utf-8?B?cUFtZG1lczV5SHh4RTYxdHgvc2ZaVFZQVEFPVWZuR0pZOFdmbmZ2L1A2Tldh?=
 =?utf-8?B?bkxjOUNvZ1owajdKeFB4VUo4dWxmejVIRkM1QUdrc0puU2E2OGpweGFLdmVF?=
 =?utf-8?B?V0Roay84SUovMHJiYW5ocktCc3ZzOVdWZjZzY1djclpwcVRDeDFseVJxQWta?=
 =?utf-8?B?bmQ1Z2VJRnROM0xHRjBZVVdOeCt6M0d4aE96VkRrdGk1Wk16M2NzTWxPajZW?=
 =?utf-8?B?YWlOZDJwRTB3MVgwN2czNm42Q0pHWDZhS3gwd3dVMnJJZmJOeVA0Y1YydWJl?=
 =?utf-8?B?UnlIbUgzbXdSZEdEeTVEb0cvM3BENjZDamw2djc0ZDZ6bGp3cGh6UWlHZVNY?=
 =?utf-8?B?aEdGd2lVU2tDU250UktJU2JqU09QWHJHUW1aNEZ6SlBkQ1p6dzNLNlE5cjVj?=
 =?utf-8?B?VkRZZG0rSkNnTDVDRnBsMXFJMmVZd1VsYUJweWc2TnVJcHlRbWdwSExOcmNE?=
 =?utf-8?B?UEliVEQzRVN5QnkrdFpSSFVYN1ZqTWhSWE9ZemtGM2l0Ly85WndFRHBQV0Iw?=
 =?utf-8?B?NTYySjlsWFE1Vlo3NitLbWV3NEV3LysvdmxQdk9DVjdqb3QrWk5LdE5HdWNW?=
 =?utf-8?B?ZmZsYXpxSllXK1A5ZkZaSXVIa3pMRlduUWJnN1lWaWtTWjMrUjlMemovM3E0?=
 =?utf-8?B?NFh0dGk3S1UrVm9DcEpBbEJya01DM1NXNUZObVRNSk1UWDgzWVpKaldaSm1w?=
 =?utf-8?B?T1VKZjUzUHBicXRyNDV6NnVLYlgyNVgza0dXUGNyQ2hvNklrNjFPd0pyMVpy?=
 =?utf-8?B?MUN2WGxaZTcyV29sTzVHZ2c2dHpuWXZ6OHQ0UHZXbkNrY1Z2YjRvT1IvbmM0?=
 =?utf-8?B?ZlFDR2VNRDFadEFZMkMxU1UwS2cwRUxhWVk0SWI2NE93WTNKUjgrcWRlQjRH?=
 =?utf-8?B?M2wrYWZOYmFuYURWUExOM2l2cXdmUFNrMHR3SDExZWpFVGRVeVZITEdzNktp?=
 =?utf-8?B?eHhrQ2FlbC91dWVKRU91cUN5VTd3VUNjMmZPWlBZZjFuVk9oQ3VwSGUrc3B2?=
 =?utf-8?B?UEhzbUR0NlRDaWQ4VGpIeDZQOXNEZlZsSVEweEI4eXFrVWh1dU80bWsvTFlK?=
 =?utf-8?B?dFNtRmF1SlJBL2RyZ1F5M3NGaEk2MnFReE16VU8yMVlNTk10K2t1cklVYUty?=
 =?utf-8?B?c1dwckQ4WmU1eVcyeS83RnJRZkRoTkZsNDNPNHpyUTAzWDZtQmxMV1hyaXZN?=
 =?utf-8?B?QXJoYjEzT0VaQWdzaythZDkrUFcrVE43U0dKd0NQVHQ2TitHZk93dERNRTRk?=
 =?utf-8?B?T2F6U2lxeEoyTVFOZk9HUXFNb2s5TTNOL05HQkNPUCtnYmtnRVRwcCtYZGt4?=
 =?utf-8?B?ZWZvQTZ5LzU3K3h5U0krc29vMkwrdmJ2T2hsUjIxaWtha2ZoV1NDZEJNUHVt?=
 =?utf-8?B?TWwzYXZiNk9BV0sybnNCbXk2U09ma2VHZ2EreUd0QXhzYkFLbWdhKzJLNDJv?=
 =?utf-8?B?dzlBdGRGeHlXNFVPUTUvZzgyMlVCTWZWdnMzUkFQZUUzY29wMUlGNmp1QTBz?=
 =?utf-8?B?bkUwaGFSb0pkNkh5cWI1OFVYdGxjRDRTelA5MVAwYWJkSWlseUdBN1lvTXd1?=
 =?utf-8?B?Qm5xYWpkdWpxTVVyWGNXMlJnc0hFVzhRbUFZOVp6ZXUvRndQM1BxM29pY2Jw?=
 =?utf-8?B?OVdWVnhhQW5MU08xa2NUclZNUkh5cU95YlhsL0gzc1RQbFkwdktsc1l1RUJm?=
 =?utf-8?B?dldFWkJxMmgrbHZxbndKNGp0TTF4TC9PM0F6VWljY253bTJ1VnJPYWx5S1gr?=
 =?utf-8?B?V3pmU0hRRU0yK3JaMjcxN3MxVkhCTzJ3R0NtcmI1cmFkUWpvbDMxSitrWFY5?=
 =?utf-8?B?NEsyM3pTb01qV2FHZGlvdzIvUHJ0OFY5SUkvOFQ0OVU3dGYzUDk1Q1g3bkdi?=
 =?utf-8?B?Q3RXMVVKVENOQnVHN3VSVDBjd2VzWjkvd0xJeTZQVWxSMjJJZHNSMU1YSXUw?=
 =?utf-8?Q?rQe/6/Cy7J/hi5Zj3zdU5d+/l?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0e8c57-ab45-4615-a0cd-08dc974bb009
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 08:24:11.1114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hqlBbilObB0hsAKF2q55jLY9SnZcqmUtFaad+AqdXvN/Yu9Vx/UrQnDT2FfK8NntI16YpiNhT1K25ghPqoCoOVXQC4/x8ELM5/T/SYP7t1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5420

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiBGcmlkYXksIEp1
bmUgMjgsIDIwMjQgOToxMyBBTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA3LzEyXSBpMmM6
IHJpaWM6IERlZmluZSBpbmRpdmlkdWFsIGFycmF5cyB0byBkZXNjcmliZSB0aGUgcmVnaXN0ZXIg
b2Zmc2V0cw0KPiANCj4gDQo+IA0KPiBPbiAyOC4wNi4yMDI0IDExOjA5LCBCaWp1IERhcyB3cm90
ZToNCj4gPg0KPiA+IEhpIENsYXVkaXUsDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4gRnJvbTogY2xhdWRpdSBiZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRl
dj4NCj4gPj4gU2VudDogRnJpZGF5LCBKdW5lIDI4LCAyMDI0IDk6MDMgQU0NCj4gPj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MiAwNy8xMl0gaTJjOiByaWljOiBEZWZpbmUgaW5kaXZpZHVhbCBhcnJh
eXMgdG8NCj4gPj4gZGVzY3JpYmUgdGhlIHJlZ2lzdGVyIG9mZnNldHMNCj4gPj4NCj4gPj4NCj4g
Pj4NCj4gPj4gT24gMjguMDYuMjAyNCAxMDo1NSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4+PiBIaSBD
bGF1ZGl1LA0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+
IEZyb206IGNsYXVkaXUgYmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+Pj4g
U2VudDogRnJpZGF5LCBKdW5lIDI4LCAyMDI0IDg6MzIgQU0NCj4gPj4+PiBTdWJqZWN0OiBSZTog
W1BBVENIIHYyIDA3LzEyXSBpMmM6IHJpaWM6IERlZmluZSBpbmRpdmlkdWFsIGFycmF5cw0KPiA+
Pj4+IHRvIGRlc2NyaWJlIHRoZSByZWdpc3RlciBvZmZzZXRzDQo+ID4+Pj4NCj4gPj4+PiBIaSwg
QmlqdSwNCj4gPj4+Pg0KPiA+Pj4+IE9uIDI4LjA2LjIwMjQgMDg6NTksIEJpanUgRGFzIHdyb3Rl
Og0KPiA+Pj4+PiBIaSBDbGF1ZGl1LA0KPiA+Pj4+Pg0KPiA+Pj4+Pj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPj4+Pj4+IEZyb206IENsYXVkaXUgPGNsYXVkaXUuYmV6bmVhQHR1eG9u
LmRldj4NCj4gPj4+Pj4+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMjUsIDIwMjQgMToxNCBQTQ0KPiA+
Pj4+Pj4gU3ViamVjdDogW1BBVENIIHYyIDA3LzEyXSBpMmM6IHJpaWM6IERlZmluZSBpbmRpdmlk
dWFsIGFycmF5cyB0bw0KPiA+Pj4+Pj4gZGVzY3JpYmUgdGhlIHJlZ2lzdGVyIG9mZnNldHMNCj4g
Pj4+Pj4+DQo+ID4+Pj4+PiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpA
YnAucmVuZXNhcy5jb20+DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gRGVmaW5lIGluZGl2aWR1YWwgYXJy
YXlzIHRvIGRlc2NyaWJlIHRoZSByZWdpc3RlciBvZmZzZXRzLiBJbg0KPiA+Pj4+Pj4gdGhpcyB3
YXkgd2UgY2FuIGRlc2NyaWJlIGRpZmZlcmVudCBJUCB2YXJpYW50cyB0aGF0IHNoYXJlIHRoZQ0K
PiA+Pj4+Pj4gc2FtZSByZWdpc3RlciBvZmZzZXRzIGJ1dCBoYXZlIGRpZmZlcmVuY2VzIGluIG90
aGVyIGNoYXJhY3RlcmlzdGljcy4NCj4gPj4+Pj4+IENvbW1pdCBwcmVwYXJlcyBmb3IgdGhlIGFk
ZGl0aW9uDQo+ID4+Pj4gb2YgZmFzdCBtb2RlIHBsdXMuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMu
Y29tPg0KPiA+Pj4+Pj4gLS0tDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gQ2hhbmdlcyBpbiB2MjoNCj4g
Pj4+Pj4+IC0gbm9uZQ0KPiA+Pj4+Pj4NCj4gPj4+Pj4+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJj
LXJpaWMuYyB8IDU4DQo+ID4+Pj4+PiArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LQ0KPiA+Pj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlv
bnMoLSkNCj4gPj4+Pj4+DQo+ID4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1yaWljLmMNCj4gPj4+Pj4+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yaWljLmMgaW5k
ZXgNCj4gPj4+Pj4+IDlmZTAwNzYwOTA3Ni4uOGZmYmVhZDk1NDkyIDEwMDY0NA0KPiA+Pj4+Pj4g
LS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yaWljLmMNCj4gPj4+Pj4+ICsrKyBiL2RyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtcmlpYy5jDQo+ID4+Pj4+PiBAQCAtOTEsNyArOTEsNyBAQCBlbnVt
IHJpaWNfcmVnX2xpc3QgeyAgfTsNCj4gPj4+Pj4+DQo+ID4+Pj4+PiAgc3RydWN0IHJpaWNfb2Zf
ZGF0YSB7DQo+ID4+Pj4+PiAtCXU4IHJlZ3NbUklJQ19SRUdfRU5EXTsNCj4gPj4+Pj4+ICsJY29u
c3QgdTggKnJlZ3M7DQo+ID4+Pj4+DQo+ID4+Pj4+DQo+ID4+Pj4+IFNpbmNlIHlvdSBhcmUgdG91
Y2hpbmcgdGhpcyBwYXJ0LCBjYW4gd2UgZHJvcCBzdHJ1Y3QgYW5kIFVzZSB1OCoNCj4gPj4+Pj4g
YXMgZGV2aWNlX2RhdGEgaW5zdGVhZD8NCj4gPj4+Pg0KPiA+Pj4+IFBhdGNoIDA5LzEyICJpMmM6
IHJpaWM6IEFkZCBzdXBwb3J0IGZvciBmYXN0IG1vZGUgcGx1cyIgYWRkcyBhIG5ldw0KPiA+Pj4+
IG1lbWJlciB0byBzdHJ1Y3QNCj4gPj4gcmlpY19vZl9kYXRhLg0KPiA+Pj4+IFRoYXQgbmV3IG1l
bWJlciBpcyBuZWVkZWQgdG8gZGlmZmVyZW50aWF0ZSBiL3cgaGFyZHdhcmUgdmVyc2lvbnMNCj4g
Pj4+PiBzdXBwb3J0aW5nIGZhc3QgbW9kZSBwbHVzIGJhc2VkIG9uIGNvbXBhdGlibGUuDQo+ID4+
Pg0KPiA+Pj4gQXJlIHdlIHN1cmUgUlovQSBkb2VzIG5vdCBzdXBwb3J0IGZhc3QgbW9kZSBwbHVz
Pw0KPiA+Pg0KPiA+PiBGcm9tIGNvbW1pdCBkZXNjcmlwdGlvbiBvZiBwYXRjaCAwOS8xMjoNCj4g
Pj4NCj4gPj4gRmFzdCBtb2RlIHBsdXMgaXMgYXZhaWxhYmxlIG9uIG1vc3Qgb2YgdGhlIElQIHZh
cmlhbnRzIHRoYXQgUklJQw0KPiA+PiBkcml2ZXIgaXMgd29ya2luZyB3aXRoLiBUaGUgZXhjZXB0
aW9uIGlzIChhY2NvcmRpbmcgdG8gSFcgbWFudWFscyBvZiB0aGUgU29DcyB3aGVyZSB0aGlzIElQ
IGlzDQo+IGF2YWlsYWJsZSkgdGhlIFJlbmVzYXMgUlovQTFILg0KPiA+PiBGb3IgdGhpcywgcGF0
Y2ggaW50cm9kdWNlcyB0aGUgc3RydWN0IHJpaWNfb2ZfZGF0YTo6ZmFzdF9tb2RlX3BsdXMuDQo+
ID4+DQo+ID4+IEkgY2hlY2tlZCB0aGUgbWFudWFscyBvZiBhbGwgdGhlIFNvQ3Mgd2hlcmUgdGhp
cyBkcml2ZXIgaXMgdXNlZC4NCj4gPj4NCj4gPj4gSSBoYXZlbid0IGNoZWNrZWQgdGhlIEgvVyBt
YW51YWw/DQo+ID4+DQo+ID4+IE9uIHRoZSBtYW51YWwgSSd2ZSBkb3dubG9hZGVkIGZyb20gUmVu
ZXNhcyB3ZWIgc2l0ZSB0aGUgRk1QRSBiaXQgb2YNCj4gPj4gUklJQ25GRVIgaXMgbm90IGF2YWls
YWJsZSBvbiBSWi9BMUguDQo+ID4NCj4gPiBJIGp1c3QgZm91bmQgUlovQTJNIG1hbnVhbCwgaXQg
c3VwcG9ydHMgRk1QIGFuZCByZWdpc3RlciBsYXlvdXQgbG9va3Mgc2ltaWxhciB0byBSWi9HMkwu
DQo+IA0KPiBJIGludHJvZHVjZWQgc3RydWN0IHJpaWNfb2ZfZGF0YTo6ZmFzdF9tb2RlX3BsdXMg
YmVjYXVzZSBvZiBSWi9BMUguDQoNCk1heWJlIG1ha2UgdGhlIHJlZ2lzdGVyIGxheW91dCBhcyBw
ZXIgU29DDQoNClJaL0ExIC0tPiAmcmlpY19yel9hX2luZm8NClJaL0EyIGFuZCBSWi97RzJMLEcy
TEMsVjJMLEcyVUwsRklWRX0gLS0+ICZyaWljX3J6X2cyX2luZm8NClJaL0czUyBhbmQgUlovVjJI
IC0tPiAmcmlpY19yel92MmhfaW5mbw0KDQpUaGVuIGV4Y2VwdCBSWi9BMSwgc2V0IEZNUC4gDQoN
CkN1cnJlbnRseSByZWdpc3RlciBsYXlvdXQgb2YgUlovQTIgaXMgbm90IG1hdGNoaW5nIHdpdGgN
CkhhcmR3YXJlIG1hbnVhbC4NCg0KQ2hlZXJzLA0KQmlqdQ0K

