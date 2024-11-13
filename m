Return-Path: <linux-i2c+bounces-7951-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A74AC9C6A22
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 08:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07451B2566A
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 07:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB2A187355;
	Wed, 13 Nov 2024 07:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="GjzLrIv/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2133.outbound.protection.outlook.com [40.107.215.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62147185939;
	Wed, 13 Nov 2024 07:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731483793; cv=fail; b=sDnLXPyt1qo+6h981lyHbmidHRCR3YyrbbvorQzh1IIy23DFVmH3QtHt+9laT4vq+8ZWjrruvpLL0JmPqjcK0JVNuYK7YH+14BxtI5lHyx2bZEAkiJjgITK2hQCf6rvR4McsnnRwVpizP42umUNjWIQ32QcsV13ZoInGHaaPBRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731483793; c=relaxed/simple;
	bh=EQwrC1ckcf9nadNUe1ds3GTsu6b6cpAWAq7m5xIXxG4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Nwm1ZoAIY207cv7R8UJEHWwY2a7+ht0OEBfqhBlOIxBVPzltMuaZ+raR3UznqVOTfHw17cq5udE+JZ0jcTgHIIzbxlRJSzlmRNyxRS2Kg1G34Q7bW08c3V0247cRCvEQKNqXgxGk7lOyqTFa6phvaUFsikygcv6XvwBHURpw7q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=GjzLrIv/; arc=fail smtp.client-ip=40.107.215.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXML4wiOVQnbW4EOfWknyJznAV3pwzL6ocdU72SSTfYBgydZVaNHrZXONHDQKbxhjEEHAYop6LSue63TlV1IhrmfmcHolFJRn9Xq1Zt9PM0XWcU1N4IigLe8esXJF3EKyOiMDo5eqQj9jZ5hjlZMs/QRM/2dwoGLnNWHWvzYvJs6uyN5Bj+6MDWCEf7AoyH3qXaviD07VSEtWC5ho69lXUZ5JrNrWqCmvKuahGDZUg1gbB+jgWaIc63fBONl29TgxYgdATduIPbB6CBypgYg66ISrsUSotSKWlapplTnQUDzJul8gDNQsN5adgdV0IEp1vXeR33bzQd7ApvR+h35Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQwrC1ckcf9nadNUe1ds3GTsu6b6cpAWAq7m5xIXxG4=;
 b=cORBpnrEcRSfxQv2YSVY0k7q04Mhjnmmulrg9+I9Ptl2VfI2F5I8mYhNGaYUanqfM3bzmsO8xNKBObBbFGAZdP+74BVWa/kFKV8Zo/p49lXv6Bach60tv1KjrHxlOlVcA6bEgqi6NevkovdBHI66zX2SqhZTLb14fD9tEkWl03wq4iYVvC6qFZeX7SSXKv8n5Mc5UMn1ptuoldNe2v5FPgiiIRwEqRyAZiqpy81Dnm0ae/BLaphlNH+2UP8WlqEldu25JpQUPaLw5B8EnDzkSyZSDIIB9IYYKI0qbqkz8rnQYOwvFlogwK8bUkXSWTK6DBaW/qkN1qjNJHnPKxeDKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQwrC1ckcf9nadNUe1ds3GTsu6b6cpAWAq7m5xIXxG4=;
 b=GjzLrIv/fGk+zu/G/o/WE4EOJVA+Dr3Y+Dwk3p6OZG1aeFyx0dMc2kmcTz4DJURS5gTKRP95mRB2GDaWUlt/YqjgOJPirTRk0e05MYYU68JmnEQvuTi8TgVeHAstPDo00mwSGoIG8HSUyt72YUgxm4NMyF9OLCCZwQe31dBYhdUfpv9yWYwYVe/ddcSaA/6QFqy9VBQj7vIhm69xQ5zFK5c4dRm5wLiJc9z9SUEzVv2P8A+tzC1TCwZ0bYf1lZHLBLjyJaJ8kaB/IbhNRrtI7tlWAII2ym5lKzMN5N49P7pmXBj7bYQnbu4XZkwqei7kF+meU9mRwUlByME/geDEwQ==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by TYSPR06MB6749.apcprd06.prod.outlook.com (2603:1096:400:470::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 07:43:04 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%6]) with mapi id 15.20.8158.011; Wed, 13 Nov 2024
 07:43:04 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "brendan.higgins@linux.dev"
	<brendan.higgins@linux.dev>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v15 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Topic: [PATCH v15 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Index: AQHbGGxcfd5QCYaLt02IHuq/iSVWarKzqJsAgAFlhJA=
Date: Wed, 13 Nov 2024 07:43:04 +0000
Message-ID:
 <OS8PR06MB7541739C4D1E69C0981CBCB4F25A2@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20241007035235.2254138-1-ryan_chen@aspeedtech.com>
	 <20241007035235.2254138-3-ryan_chen@aspeedtech.com>
 <6aea003a286162c465d0ee7681988b3697feb103.camel@pengutronix.de>
In-Reply-To: <6aea003a286162c465d0ee7681988b3697feb103.camel@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|TYSPR06MB6749:EE_
x-ms-office365-filtering-correlation-id: c78005d3-13da-4f51-0cbb-08dd03b6cf0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NzRaWXBSRldtbXl6S1ZFTWFvTXcvcE1takVvR2NobmZnbDJ2R0k0MzNKZHNz?=
 =?utf-8?B?bURxa045ajMrS0x2ejdScmZHRko1VVFRU0ZMSW92OTVoSS9mNmRGb0NMNXhK?=
 =?utf-8?B?ZllKR21tekw4NmQrU1BxVlhyQUhhMGZkYitYamdxRU5iVWo4MURCV2pvUktQ?=
 =?utf-8?B?eFQ2UlBnNW9pV0VKYm1Zd0pqN08zY3V4V3VlZDJ1WHpSU2kwMituZmxXUEto?=
 =?utf-8?B?MGVwUnVNVHVQOW5DbFJvWmFPdWx3dktlWmZUa2YzTWNYMmdpTzM3MkJRS3c3?=
 =?utf-8?B?RldiaDRDdDluUWlkVWlMcXNpaUd3dVBXdGpvT2JVdElxL1plcWh2YUFxV01V?=
 =?utf-8?B?Nk1FUlB1R2NTZFJ5V3hVSlZoSnlEalBHNW1UWFJKejFkRUZvYWRrdVdPcU1a?=
 =?utf-8?B?Z2pTUmsyS3pLbkhyZU1Ed0JrZWtqTXhwOUFLRmpEbWx0cFN4UkljQUl6T21t?=
 =?utf-8?B?eXNDYXFpTzVZMHM2WU9UL0lHdzBpM2F6dGdUNGVUbUxSSk1ReXdRM2V5N0Y2?=
 =?utf-8?B?blRxSHJXMHRuanNma2h2bDgrUzZuV044bmxZYjBySlpGY0lIb0Vhd2VMbjlp?=
 =?utf-8?B?TW5oL25ma0lNWTViOVNrdnVNeVFSV3NvdHo3OUZkalczNzFWRXhaeWxmMFBm?=
 =?utf-8?B?NzM0QXBRUkhPL1V6TE5lSWhkQWpnaWFhZXBQK3hucThqdnpuYmUvbkxjVTI3?=
 =?utf-8?B?WEFzaDJyK3dUZ0NLbGxBYlZ3YWJKbDdPZnE5aDVDaGkwKzJEMDh6RzltK21R?=
 =?utf-8?B?MU1laVhCbWtzd25QSE9MOHpvOVVjeGZSS2FZMU9aVjV5TktLZUh4UzM4OFFN?=
 =?utf-8?B?R0RseEhqYTN6b1IyV2orcTRyWVc3dzBqSmpBQXBCTEpUbFdVVHZaU0d6ck5q?=
 =?utf-8?B?bkZYYWVuaVNJYno5NHNTc3V6cCtCTlQ0di9yM2FGdUQ2UHlIcWhkQk9UUzlk?=
 =?utf-8?B?TS9GUXBqdmhsZkZUdXZqQlpvMGZXM2dWczJWbjdxeGk5U3p2QWtxYWY5TG44?=
 =?utf-8?B?VGhoVkhrTVM3NlJaUGxTUjI2VExGQWk4T283QkFjc3JIUlFudzA5blU2U245?=
 =?utf-8?B?ZlJlbXhDTnVYRlBiTi96ZUx3TUVyQS9GUWw3Q2pwL0F4YWJDUUs5YzIzMmc0?=
 =?utf-8?B?VzdtU2IxZE44M0RXa0RDdXc2MExpNTc2VEsrODNEbkxjR2VBdUQ2VVdiSjFz?=
 =?utf-8?B?cFRQVFl6eXdhZW85KzUrd2FhZzJyQ0V1R3dNb2MwRTRoLzhqVlh3RnlkcjRU?=
 =?utf-8?B?V2oyUnl1bGQzQitLUG1pTjYyMm1VUEpFM012YU44QmFmZmJ2SytMUXo3U3dI?=
 =?utf-8?B?RnFkOE91azY0WnRMNEkvZGVzL2dUc2V1c0lQNzQ1dUR4WDhYZmljb2IxTVJS?=
 =?utf-8?B?LzFZTXNnSGFUV2xNWlM4SzNhQ1RSNG9wU1Q3Z05tK1FIUGh3aXdNTytMSXhi?=
 =?utf-8?B?SDdrVmRQSzg2MzlTNzF2Wlk1SDUrSi80NHFsR0kwY08yVjNCSGZIRTJoY1Rx?=
 =?utf-8?B?cFFkdDRBQkVOb1pYOXdQeHhkRVlsN3VkdVc3Q2M4RzlWT0U4VUxScEQ3YmRT?=
 =?utf-8?B?UkpCNFl5THg4UEJMQXZnV09pUEZVVmszeVJ5aGlYQ3B5Z0haUVNqWkdGQUZU?=
 =?utf-8?B?T1RQTXY3cnZYdHp2MVFRMnpxbmI4U3hsaCtKVWw2NDlOWDl6Y0g1c2o4US9m?=
 =?utf-8?B?VkhwVmlzdGlndlhYbDZNbzl2a2ZWbmFOblkwamYrREc1c3ZrS3dIT2h6dVFK?=
 =?utf-8?B?dlVuTkYvcFlIWGhrVnl2OTRhaWgwNEo3KzRuMm8rREFKbEhPN1dCY1VBOE5H?=
 =?utf-8?B?K2pDak5BMWhNVGNxaE43b0p5V0N6ekVzL0dvZFpEWmlvSlQ0Uml4TTlJRkIr?=
 =?utf-8?Q?HJfup4S9kN4gG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZnA5ZUROc3lzR3MzRkNabVJIc2ZWR0psQXl5M1orTWx4RVE0ZVkybDBGMzdw?=
 =?utf-8?B?MHQ4d1hUWExNU1RuY1ltbDIrZkd4TkJBdWQ4NjN1NWU5ajlEdlA5ME9KWUds?=
 =?utf-8?B?M2s5aVh0V3hTOFdybzdZYk5TaGVKZjlkd3poN1V6QXdzWEtyS2NEMVhkczNz?=
 =?utf-8?B?cmJZdkl1QkRYVlFaM2Jrbk4rOUhaSXNyMjJZTHZDRDM3QUpraTNzZlZTbE1u?=
 =?utf-8?B?S0hUWEpSVENBeFRlQ280TlVBWnhhZUIrUklSS1B2aEl6UG1kWm9FbEVRVFhr?=
 =?utf-8?B?cUNGL3NTQzdoZDA3OXR6YmUrNjJjNEpEc0tWTkpUNFJOZXpoMldrdGQ5RHNz?=
 =?utf-8?B?R0lOTUtjay9VdFNrRTc2NFJBRzJTM2RsY2RYbmlDeTlNK0srVFlpSWJFTmk2?=
 =?utf-8?B?WkUySzQycmdHZmRCdHgzL2RLcGZ2VFYreHcvUEtlaktXdFovbGFDdURDbmh4?=
 =?utf-8?B?aUc3b2twYzY2cnZ6NHRrWk5WVFFiT0ZUbjBxRjFJTkpzYThrS0Jna2ZpUHFu?=
 =?utf-8?B?aGpjeDJhTHMvMVRVWVh6cUhuWVBtS1RkVXFJd3ZIeUJUdjlvRVVNdm5aT2JK?=
 =?utf-8?B?NkhMRnV4TGJJemFjYVBQWVVRSkxONFFGSlhkNDFtQXY1VnlHdUVNMFRLMHVa?=
 =?utf-8?B?ZUJEdzcreVlUQUNqMTZRN05rL3hVRlZtVW5jMERXcy80WG45YkxGQmVRQjEx?=
 =?utf-8?B?MVcrdWEwbm5BV2V6T2Nxa1Z6WG1pdHNsbUVmQUhDSm9Ed2x5VmNWQ1pBM1py?=
 =?utf-8?B?SEJoNDEveHVHYlBPdGNrVTJrNlo3a2p5VjBMMmJzcmJaay84aXd5T1ZlZ04y?=
 =?utf-8?B?WTJack10Uk9YU1FXWm5LWXhSbVlNdkdPclJvaW5SelZ0R2dMWjlrZEF5czRm?=
 =?utf-8?B?YmdNZHBBWXNibnlCR2tMMTFNbEQ1cHBzYjNxeVRrUEFWMnJtc0k2ZjdRbHdU?=
 =?utf-8?B?QzQ3VmZVaGZYVHp2K3BRMDRRVW5OeG5wRjg5S3hjemZHMkNYYnRmNkhQMVVI?=
 =?utf-8?B?YllnOVBLbzhVYTlsSVJ4VjJtaFNnZVl4RTc1bE04SlZMTEFMd0FDeXlKdTlU?=
 =?utf-8?B?amJyNkczY1hBeTRMMGRzK0ZSUWRybnQ1aDJEWUVrbjNhZWtrbytzTTBMWHZM?=
 =?utf-8?B?czR3Yzc3SjhZQzVETFJOblBoc2hHc3FHYWtPOFFTdVlEQU1VQ0Z0RTFnOWpO?=
 =?utf-8?B?YXZROW9zWnNFQlRDVkFlbmVHd3NVM2NkZlBBenhqa0s3b2FMYlRvREo0NGsv?=
 =?utf-8?B?bjV5NlVwZzJiYTlhTllIUG9rT1JWU2x4OGkyZ2JaZ0VGczFseVArOFJadmFI?=
 =?utf-8?B?WlR6UURPdXQrRXFWdTFrT3BTRDlIaUlpZzRUWjViMk1IYkZ4aldoMHpoWm9a?=
 =?utf-8?B?akNGN0wwV21jaTY0ZTFyc3ZUelZhRWVjMTBVYklTTk81dVg3L1JpUTdFblQ1?=
 =?utf-8?B?YVhtYkZGOUM3RERDSGRjR1Q4MXc0d2paeUxvdFZ3K3dsMlg4ZEVUUWJDbmxG?=
 =?utf-8?B?bllncFhuWTlHMWRDdXRVY203cGttUWRiUHMvSUdQQXc3VWRvS1p4eHNXbkRz?=
 =?utf-8?B?VjcvMjJlUGVuV2FvZFRGUHRHeDhFOFBsOHpOc29jdGYwbjI5UmxFUU8xWEJi?=
 =?utf-8?B?UXc5UHlVRko2eVVGVFd0S0h3ZkJOelJRQVR2c2RPdEh5UFVjdk9rQkZIclNO?=
 =?utf-8?B?aXFQczRMdXZETlFpcUdvNUV1OGV3dnM1TFhuZnNldG44bjhkSTJmSGErT0RT?=
 =?utf-8?B?OHF1bzkrSnpaaXZUczZPRzJLUGVueWg3WXJuMDB3dy83VlE0cXA0M0M4LzNR?=
 =?utf-8?B?OURHcWJGVDFseEd1VHljT3pBYklLTGQ2VUs0YW1Vc3kxaVl5eXYrdXQ3d2RW?=
 =?utf-8?B?YW9QNTAyRzRlM0hhZWpNRWNoVXFNZEVSQzFqRm1NTXJRb2l3YjVhUHRqZ25X?=
 =?utf-8?B?anVMVEZoUFRFVzRmM2d0UkdDVnRCa1o2MlBQRXZuUm8yT3RRQWhodlVraFRG?=
 =?utf-8?B?UElRTUlWckZmRGo4YkY0WVB5VStrVmM0QjdKbmVqZlpENEY1RGI2bTkzWmFt?=
 =?utf-8?B?TTNnVnROWk5qSkUzWEluSHB2RGRUSlFHMU5EdW5lN1Q3T2Z2UkNlVlRiYmk4?=
 =?utf-8?Q?Bymoe21N6I7kxkGgW2S9MHTIY?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c78005d3-13da-4f51-0cbb-08dd03b6cf0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 07:43:04.8838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XrhPtkHK0MOQL4eHBtEvgPjHsPZaX2mV5dQgKEDdrdXDe8vd4q1NiTOtNinqAI7FwLxWupuGT3wJGq/ECCehy00B+xqL7JGHsSDO3crYqHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6749

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNSAyLzNdIGkyYzogYXNwZWVkOiBzdXBwb3J0IEFTVDI2
MDAgaTJjIG5ldyByZWdpc3Rlcg0KPiBtb2RlIGRyaXZlcg0KPiANCj4gT24gTW8sIDIwMjQtMTAt
MDcgYXQgMTE6NTIgKzA4MDAsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPiBBZGQgaTJjIG5ldyByZWdp
c3RlciBtb2RlIGRyaXZlciB0byBzdXBwb3J0IEFTVDI2MDAgaTJjIG5ldyByZWdpc3Rlcg0KPiA+
IG1vZGUuIEFTVDI2MDAgaTJjIGNvbnRyb2xsZXIgaGF2ZSBsZWdhY3kgYW5kIG5ldyByZWdpc3Rl
ciBtb2RlLiBUaGUNCj4gPiBuZXcgcmVnaXN0ZXIgbW9kZSBoYXZlIGdsb2JhbCByZWdpc3RlciBz
dXBwb3J0IDQgYmFzZSBjbG9jayBmb3Igc2NsDQo+ID4gY2xvY2sgc2VsZWN0aW9uLCBhbmQgbmV3
IGNsb2NrIGRpdmlkZXIgbW9kZS4gVGhlIG5ldyByZWdpc3RlciBtb2RlDQo+ID4gaGF2ZSBzZXBh
cmF0ZSByZWdpc3RlciBzZXQgdG8gY29udHJvbCBpMmMgY29udHJvbGxlciBhbmQgdGFyZ2V0LiBU
aGlzDQo+ID4gcGF0Y2ggaXMgZm9yIGkyYyBjb250cm9sbGVyIG1vZGUgZHJpdmVyLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogUnlhbiBDaGVuIDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+DQo+
ID4gLS0tDQo+ID4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnICAgICAgIHwgICAxMSArDQo+
ID4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9NYWtlZmlsZSAgICAgIHwgICAgMSArDQo+ID4gIGRyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtYXN0MjYwMC5jIHwgMTAzMg0KPiA+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDEwNDQgaW5zZXJ0aW9ucygrKQ0K
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3QyNjAwLmMN
Cj4gPg0KPiBbLi4uXQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFz
dDI2MDAuYw0KPiA+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3QyNjAwLmMNCj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMTdiYTBlZTc3YzI3DQo+
ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXN0MjYw
MC5jDQo+ID4gQEAgLTAsMCArMSwxMDMyIEBADQo+IFsuLi5dDQo+ID4gK3N0YXRpYyBpbnQgYXN0
MjYwMF9pMmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikgew0KPiBbLi4uXQ0K
PiA+ICsJaTJjX2J1cy0+cnN0ID0gZGV2bV9yZXNldF9jb250cm9sX2dldF9zaGFyZWQoZGV2LCBO
VUxMKTsNCj4gPiArCWlmIChJU19FUlIoaTJjX2J1cy0+cnN0KSkNCj4gPiArCQlyZXR1cm4gZGV2
X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoaTJjX2J1cy0+cnN0KSwgIk1pc3NpbmcgcmVzZXQNCj4g
PiArY3RybFxuIik7DQo+ID4gKw0KPiA+ICsJcmVzZXRfY29udHJvbF9kZWFzc2VydChpMmNfYnVz
LT5yc3QpOw0KPiANCj4gVGhlIHNoYXJlZCByZXNldCBzaG91bGQgYmUgYXNzZXJ0ZWQgYWdhaW4g
aW4gYXN0MjYwMF9pMmNfcmVtb3ZlKCkuDQo+IA0KSGVsbG8sDQpJdCBpcyBzaGFyZSByZXNldCwg
aWYgdW5ib25kIGRyaXZlciBhbmQgYXNzZXJ0ZWQgdGhlIHJlc2V0LCBpdCB3aWxsIGFmZmVjdCBv
dGhlcnMgZHJpdmVyIHJ1bm5pbmcgKHdoaWNoIGlzIHNoYXJlIHdpdGggdGhlIHNhbWUgcmVzZXQu
KQ0KDQo+IHJlZ2FyZHMNCj4gUGhpbGlwcA0K

