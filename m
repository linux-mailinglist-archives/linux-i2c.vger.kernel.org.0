Return-Path: <linux-i2c+bounces-8000-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 810209C972C
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2024 01:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E47F2B20C30
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2024 00:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838DE8472;
	Fri, 15 Nov 2024 00:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="PvtJBqBh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021131.outbound.protection.outlook.com [52.101.129.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B771FC8;
	Fri, 15 Nov 2024 00:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731629916; cv=fail; b=W55dbPwSY+TPJGfbuHA0cytFXGNfEs2S63ZFNRvXO40JQ1V1y8CDMk7QLEk7vlNoy2+HscTZu8F4jQ1gt8IRmeF8H7qUCcP74JcqTIB62cJmEVoR1Aa0UChJJvb6A4i3h86hG9+KSSb5DYU90KC57NzTJ/PDxSp7MrUCn1Mbi5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731629916; c=relaxed/simple;
	bh=FJxsoGTPhyOjifKaJe1Q2h8jvGei4dg1JsKSPXv8QRU=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BuoKn8C9sp4eKYhyzrNXg3Z1BGsMkd3ctST3SMxW/w7bSMZ0IAbQYzgGSIq0NV9TbKHRpvGDNtcEHKfTE/ChG7iFiMxM1IGdZLahN6V2c7OJVBRPgMWcS1qVIETB3F+MrJ04aiu/6Ksu1cQ7jxj8exrfDZyeRCtn/jd5ktu0BNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=PvtJBqBh; arc=fail smtp.client-ip=52.101.129.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOXCZoYSUZYeZYZS69VjGFrV8j6uUrCjsVrfcFAuCd0PFkGgpnTIFpjC0CVIUr/ELk2jfjvLQ1oyn4+9bUvxDJViMvI+ngQBQ6GQE/raz458gQ0mzP/YYhtEo/pOrlTqsDoNLyTvT8c2xjioivnJdH/5NFXFf0rFrMj0R4w4ysVqcn7jNmjUk3IOLejrM8W969TYb21V3/USV+uxEfGugEbNzhLAHGa3xQpNDZFHIAEWDM6BbjJRgf+6/nVhistm+kIL0L+r4WlGx6h0jratKUFFob4cL7rAYsn9UjfsPD1SQKT7xgVAWTRBJ9MBS+Q2wRGXh9/APvq5EQPMBwaTYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJxsoGTPhyOjifKaJe1Q2h8jvGei4dg1JsKSPXv8QRU=;
 b=vKcXLeKpGFF7cLAz8EfbsCDxZIB3be2gKqGkZ1OxnIU1TSIwwQep/X5mvZwFUn41SRyS/OBXxGnaBA+WVnEoMh3knt4L4OvHbzaggD5iiTAyCu2asBEpfXN1Q1Qgl1MEmfTT74yEhL0FHmUVzEhgklY3RwdZPYhxpYPpWbKsRksaXyF/8VQ5nsoLfOPrKzOuwm8aglwlL61U4ETI8fHFFFwXgon+6eIvy8qEhHyQt1XxZT4EDbMgdc7c7q3Z2EuisheD20ovpPrLL+sagRcYTVVO11Aejtm/u2/iioxlw0+x2yRZGiFQ2mg64T45gM8c2XaiWpUHpZAG+uNi2RdkFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJxsoGTPhyOjifKaJe1Q2h8jvGei4dg1JsKSPXv8QRU=;
 b=PvtJBqBhYUBGBoEUyAo3ySYB5aDFLaM/5Zlept9BOEJ3bZsDOdZpuP8ahDWbveYPwyeBTbNK4uvypAMOJakWSXhkKfggRp30Wfn0C5EKioOvyarh5CZ/Bq3UBcdKq01EffDW+lAR5xrmuNDhRxr/8HAkm1ZKeJFLlDCzswXr+QpyXLhBE/ffpqXzUnh+EyjHZrO/WvAl6NR7y8Es6R2+OQQiY7v07m5SZSkgr4hGeTjAnetGwA4TDtPI5XxURaSzqTaLKNB/kUy/zGEBVFkjuuZLhaheiEZwTQQGQLGJwL2CGq9udqifncn/3XHLPnuWu9J4PzHWuuNzOa9MWRsjyw==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by TYZPR06MB5997.apcprd06.prod.outlook.com (2603:1096:400:335::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 15 Nov
 2024 00:18:28 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%6]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 00:18:27 +0000
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
Thread-Index: AQHbGGxcfd5QCYaLt02IHuq/iSVWarKzqJsAgAFlhJCAACe3AIACgPdg
Date: Fri, 15 Nov 2024 00:18:27 +0000
Message-ID:
 <OS8PR06MB75412A3FB0FD82174DD1C7D9F2242@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20241007035235.2254138-1-ryan_chen@aspeedtech.com>
	 <20241007035235.2254138-3-ryan_chen@aspeedtech.com>
	 <6aea003a286162c465d0ee7681988b3697feb103.camel@pengutronix.de>
	 <OS8PR06MB7541739C4D1E69C0981CBCB4F25A2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <6d8a0d8916e185090423d42217262450ee948088.camel@pengutronix.de>
In-Reply-To: <6d8a0d8916e185090423d42217262450ee948088.camel@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|TYZPR06MB5997:EE_
x-ms-office365-filtering-correlation-id: 75170ea1-fa21-4ccb-2703-08dd050b071e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RWdjdnZHVE51SEU1R0wreDQ2RUZzMmhxTWFNaFJqM0cwOGNxeGg0N2tsSlVO?=
 =?utf-8?B?d2h2MGRlMHF3MFpuaGdyMDF2azZ5YjVBK1dGckNQYTdzbjlqTVZ5UkFrTG1O?=
 =?utf-8?B?RzF6NDhiN053b093dVc3MUc5UVFPMkQ3OFpvQXducXBvSWgzdG1FL1pVcnFj?=
 =?utf-8?B?WW5uS2R5cFNVM21FWFExTk1BWTkrbDIyQmFZUmFlNGJlK05qRURvV0ZrQ1g1?=
 =?utf-8?B?NmZNSDFibjNiNDZhbnBITW1CT0VuQU15RDdCSGdzeDNTTVozN0tNempWUTZR?=
 =?utf-8?B?K3h0aFVBMno3Uno0VXlQbitnWUhwNUpDSHZZNmhIaTZRajRuNkhYS3Mza0hq?=
 =?utf-8?B?eENhZ3EvNW5PYzhZVWNlTW10R1AyYkdLS2lMR080Q0RVa2dVTmllK2t3QXRG?=
 =?utf-8?B?ai8zcjlBRmMyRERQaG9oSkh2SEZqaDNaZVJNU21mSU5WbTIrQ1FPMEhpUitB?=
 =?utf-8?B?dGZ3RmN0SlppWjZkWmVnU1lGKytJQkhZQ3lBdGRaeEkxTGVmaEgvM21nZlc0?=
 =?utf-8?B?UnZHZ3lJeFRFMGR2TXRyOEdnN0tybW8rSndlbG8xNnBxTGRiK25YbnltWEx3?=
 =?utf-8?B?eEhOa1pJV05zRWpZQ2kvWm5KY0k1TVUrZDNXcFA0dHNsNEpLdXVQZmt6ZTdH?=
 =?utf-8?B?QXVoSXAwQ25zVWxrVnIraFVmVmk4ZFdqNllUS0cvSjJaVWY4Rmx4ZUdwWVJx?=
 =?utf-8?B?VDNXVThFSDRJOXNielEySEVncEZ2eWhyWEx0eDhkSk1IV1Y3ZFAwUWdVZ2la?=
 =?utf-8?B?Y0dwZkpLS3lvWFU4bHQvbUNQc2NScktjN016TlVOQVdQZ09KcXc2OHRiNEkx?=
 =?utf-8?B?dkllVElKT3pKaXlVNEtLSnRZNm9ENkVlSVRQMXZKV3U1TkxReTNNbi9iUXhj?=
 =?utf-8?B?NXJCQkJPcW9XNUVacmpBRExFNU9mZkh0K2plemM5TE9MelJ3cFl6UThVQ0oz?=
 =?utf-8?B?ZTNtclI0VlNORzJDZG9xNkw0OHZWTDJST2doeTE2RUFDUTFNcHFGQXpGVmQz?=
 =?utf-8?B?WndVUjE0WnJEMWFsa01oSXM0SDJGV2RzTXF4U3hRblJSK2dHY2FKeWVGdWZM?=
 =?utf-8?B?TEJpM3FMVlR6RVlOWUJTRkg2VDdxQUZnV2Nvc2lDRmY4WldZOUgwSWN6OEJ1?=
 =?utf-8?B?Zytvc3oxZnppdWp4dTBtVUZDOGR5QVNIY3BtRzZuNVQ0T1FabG9SWjY4dnVm?=
 =?utf-8?B?UVNjSEFidHFTaXJ0a3UvZUdYNFRrek0yWlNFa3dJcWMzeVpXOUE4Nnh6Mytp?=
 =?utf-8?B?MGloMUUzNnI4WDBBYWkrN0hwOGMrQUp4aFl3cm9DNTJGM05UVVVPYVQwbU8x?=
 =?utf-8?B?TnVoUkgvZndZcXg1dG9FQ2dUUjZoN00xbmdCZzlhTVp0WmJFamIzc1prNW9E?=
 =?utf-8?B?Qjh0cW5aUEQreCtibUE0S1dRSENCSXd5V3JCdWFkU3gxOFE0SnE0MUQ4dklI?=
 =?utf-8?B?VkVyNmJCU0g3R0RFTWN0aTlYck01TG11Ui9JNTN2bGtWMWRCYVNGM2xVRXVD?=
 =?utf-8?B?WXZTUys5Slk5SXJFTksyMEN0c2N6QUR0dVg3d1ZvcHVzMHpseVVGOVYrNFFP?=
 =?utf-8?B?UXY2TG9KaVp3eE9aYThFSEUyNlEyUTQzSERXNWtUZ0sra2VRcDVsYlNjamN0?=
 =?utf-8?B?eVRETCsyeVFaNmZGRFd5WFNYYmhCZmlLTEZCVnh4ZVhKNXdMN1N4UzAyREYv?=
 =?utf-8?B?alpKYVVoNWI4VGhIcFhUbGZSTHZqejJ2VUR2WjBlMkZDcTFpZjhFZkY2bGJO?=
 =?utf-8?B?UGRCT3h1MmhsS3ZKY3B3bjNFdERqUkx1a0VxRnpoZlVhUEN5TE90Y2FVcGFH?=
 =?utf-8?B?VmxzWmJGdzU3MDFLMHgycTcvSlZNY2pHeGUzMFRGY1VTZFB3czNCa3A1ZVEy?=
 =?utf-8?Q?VdyZRHwJdANc/?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TWhDd09aQ3cra1ZFMVk5eXdSVmh0SFdLblhZcFVBa2NFRmw2REs0OEFjOTE0?=
 =?utf-8?B?Q1JzdCszc24va1kwRUlmMGswY1FjdVJ3QUt6K05uSHpoNzFRV2pWcG1GK1cx?=
 =?utf-8?B?N1JpTFl4TzI2N0FHd2tXSnE2bmRKVFFHZGluNTY4eDZpVElTanE5Y3owUS9M?=
 =?utf-8?B?SVdsK2ZBU05xdUMwZ1VlaDFjbTNCTW5xVVZTSUNPL3hpZjJ5TkIzeGNhc1c5?=
 =?utf-8?B?ZDgxbFJIL2ZTanFMOHhpZXd2TWNHNXljWTVBOFlvN0JKeEorMDBoMTBUTjQ4?=
 =?utf-8?B?SEFDYm1MVTJOTktrMHpGbTB6TjM4cTZrU0JkTFJGUUFrMU9pblh3Y3k1cWNt?=
 =?utf-8?B?MFN3U1dzZXlJZnZQWHlPOSsyeUhDdE5pV3daSWtENkx0Y2Fzb2ZWNlowWTJa?=
 =?utf-8?B?QmNobzNHaXRhWHFJRDl0anYrdDAySWdwbmRpbEVlRVZEZG9NQ2kvaVRGVmxz?=
 =?utf-8?B?cnU2ZURlQytrR0g3RzM0cmd3KzNtN1o3NzdWY0FDZXl4TnpFRHVLL0NEMWdh?=
 =?utf-8?B?eWNwbHJhQlJNckpIMk9GQWFET3hMclFHNU5MMW5PQ3VlSmRpREZTai9zWWN2?=
 =?utf-8?B?eTlaQjYyRlZtVTVNL0tuczViOHBDYXRubGV3TzdrMHJQeXNnK3FqV0VIM25u?=
 =?utf-8?B?TlFnUURmSGlXdE40U3pVMzRwdWlnMHEvME0wdlE0OVU0NGdiQ3RrMzhUTjZs?=
 =?utf-8?B?c0tUcUE2aVBMdHVYUXpzQXRIWHUvU0xWV2R2cEJJQ0MvQnJHdDhqZFVGUkk2?=
 =?utf-8?B?OHdkZUo2R005b3JaQU10N1V0N01VY21GY2Rob1JvWS9oT1VIZzBHcFlhZVY2?=
 =?utf-8?B?Uzl1RC85VXk1M3hYTkdZQ21USTlFUmszNXEyak84cWxQSndZZXJ5RUpVUFNT?=
 =?utf-8?B?VlNRRHZveTVBK1dMeHdvaVVLNUN4R0dkRWJtN1VvcG9zNFRCMXB2WVkvQjE0?=
 =?utf-8?B?bHQ2ZWxSWGs3Wm5OZG9wc1BCVGdkS0tlZjBhazg3Tkw2bGhkazBndm9XQlQ4?=
 =?utf-8?B?UzA0U3YyVVN4Z2x1LzR2c1pHUmFCUEJKd3JCQjZ1U1dDcnc3SWNDZ0xoeUYr?=
 =?utf-8?B?K0NSL3dRWXM0SFBxKzhCajhMcXJtWGhNeC92N3Zmc1lhM3JhN1g1U2tHMUkv?=
 =?utf-8?B?VGNYdWhRQ28zZGliQ0JJS0NmUGdUMVIxQWVVK2R5RDAvVFdvckNFQXVVUWs0?=
 =?utf-8?B?K2JFdVV0RzhpSEpFcTdiVXR1OW52Q0RWcXZxelJtblpiSWpRYm9ZSDF6KzNC?=
 =?utf-8?B?eDRKZjZtL3dLd0pCOWUralE3ZUxaRllQY3FHUUZYK2ZIMm1WYTQ0ZTFUWWdB?=
 =?utf-8?B?YjFvUXFrZkNzUy9vVzVYUVVUMHZvUTU4OWtoYVRxN0lTcWRkaE1EeGpodk1k?=
 =?utf-8?B?ZTNYYmFzQ0hIQVNLejB6cnhtSDBsNWJtRzdURHBLeTM1STJ0eDlRTFRHb3NI?=
 =?utf-8?B?UTQ0bmZZeXpUU1l6M0lFeW5XNzRyRjZ2WDBXMWlnQVlXNlROY2tnUDJBUTgv?=
 =?utf-8?B?cHVWVXQ0ZFJ4UENWT3dDNTFYVE8zUHR3TlpIWkNFaHJ2V3Y5N1RTeFRUdlk2?=
 =?utf-8?B?WUNOUm1VYnUvcExFMzloRjJtdGhOdy8wTkhvV3JIeW5tdTVkY1JwT2dCaHFy?=
 =?utf-8?B?N01pdXdIeUdscStLdnBtK0swTFNEMnBLV20wOGxuTzF2a0plUnlaMTIyenNm?=
 =?utf-8?B?SEZwZmRMTjZaZDFtOTVXTnpyallCSGZRWEJzcWgvbnJueXJ3R3l1QXVsM0Nq?=
 =?utf-8?B?Y2RhS0xzVCtLbklpN1JwSnpsTERMYUhOc3NRTFdaeGpqZ20rZERMQXRxQ3ds?=
 =?utf-8?B?RTg5U1VrWWo2NnpZWXI1bHFXUjVlRjJ2RzQxTW5zK04reDRRUmRlaVZLZ2pW?=
 =?utf-8?B?ajV6cXpkbkhObkg4ZVZBTEVCM3NPWTV2aTJiM01WUDcwMHRaRnNlbzZ6NnVz?=
 =?utf-8?B?SDM2TDBvbDUzQ2lmeGt1ejF6T0tDeVNCaENRbEFKVEZ4Y0xPSklpRW8yb3hE?=
 =?utf-8?B?UGVTTW9xYXAvcHo2eDBLVk13RUhRcDdEdVBsT1MxaHZWRU9HS1FxdXZsd2FY?=
 =?utf-8?B?S2VjZU9aanozQk15MTBLTEJQNUdqd1NMV285Q0NnTGpvcFVMR25IOFZCMkNM?=
 =?utf-8?Q?TSB1ag2pDyrH6DurGuNTR/LyZ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 75170ea1-fa21-4ccb-2703-08dd050b071e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2024 00:18:27.8122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P/qUpYYflMZMW9hIYq+pXT3yK0950gG0msYwrYFNGX36CqtYKwgPUbAtB8YkgNTUsDWkYvjeRNs9QydC8M0Ko7bhSUg219OGyeCtrizwDhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5997

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNSAyLzNdIGkyYzogYXNwZWVkOiBzdXBwb3J0IEFTVDI2
MDAgaTJjIG5ldyByZWdpc3Rlcg0KPiBtb2RlIGRyaXZlcg0KPiANCj4gT24gTWksIDIwMjQtMTEt
MTMgYXQgMDc6NDMgKzAwMDAsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPiA+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjE1IDIvM10gaTJjOiBhc3BlZWQ6IHN1cHBvcnQgQVNUMjYwMCBpMmMgbmV3DQo+ID4g
PiByZWdpc3RlciBtb2RlIGRyaXZlcg0KPiA+ID4NCj4gPiA+IE9uIE1vLCAyMDI0LTEwLTA3IGF0
IDExOjUyICswODAwLCBSeWFuIENoZW4gd3JvdGU6DQo+ID4gPiA+IEFkZCBpMmMgbmV3IHJlZ2lz
dGVyIG1vZGUgZHJpdmVyIHRvIHN1cHBvcnQgQVNUMjYwMCBpMmMgbmV3DQo+ID4gPiA+IHJlZ2lz
dGVyIG1vZGUuIEFTVDI2MDAgaTJjIGNvbnRyb2xsZXIgaGF2ZSBsZWdhY3kgYW5kIG5ldyByZWdp
c3Rlcg0KPiA+ID4gPiBtb2RlLg0KPiA+ID4gPiBUaGUNCj4gPiA+ID4gbmV3IHJlZ2lzdGVyIG1v
ZGUgaGF2ZSBnbG9iYWwgcmVnaXN0ZXIgc3VwcG9ydCA0IGJhc2UgY2xvY2sgZm9yDQo+ID4gPiA+
IHNjbCBjbG9jayBzZWxlY3Rpb24sIGFuZCBuZXcgY2xvY2sgZGl2aWRlciBtb2RlLiBUaGUgbmV3
IHJlZ2lzdGVyDQo+ID4gPiA+IG1vZGUgaGF2ZSBzZXBhcmF0ZSByZWdpc3RlciBzZXQgdG8gY29u
dHJvbCBpMmMgY29udHJvbGxlciBhbmQNCj4gPiA+ID4gdGFyZ2V0Lg0KPiA+ID4gPiBUaGlzDQo+
ID4gPiA+IHBhdGNoIGlzIGZvciBpMmMgY29udHJvbGxlciBtb2RlIGRyaXZlci4NCj4gPiA+ID4N
Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUnlhbiBDaGVuIDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5j
b20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiDCoGRyaXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnICAg
ICAgIHwgICAxMSArDQo+ID4gPiA+IMKgZHJpdmVycy9pMmMvYnVzc2VzL01ha2VmaWxlICAgICAg
fCAgICAxICsNCj4gPiA+ID4gwqBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzdDI2MDAuYyB8IDEw
MzINCj4gPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+IMKgMyBm
aWxlcyBjaGFuZ2VkLCAxMDQ0IGluc2VydGlvbnMoKykNCj4gPiA+ID4gwqBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3QyNjAwLmMNCj4gPiA+ID4NCj4gPiA+IFsu
Li5dDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzdDI2MDAu
Yw0KPiA+ID4gPiBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXN0MjYwMC5jDQo+ID4gPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMTdiYTBlZTc3
YzI3DQo+ID4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1hc3QyNjAwLmMNCj4gPiA+ID4gQEAgLTAsMCArMSwxMDMyIEBADQo+ID4gPiBbLi4u
XQ0KPiA+ID4gPiArc3RhdGljIGludCBhc3QyNjAwX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KSB7DQo+ID4gPiBbLi4uXQ0KPiA+ID4gPiArCWkyY19idXMtPnJzdCA9IGRl
dm1fcmVzZXRfY29udHJvbF9nZXRfc2hhcmVkKGRldiwgTlVMTCk7DQo+ID4gPiA+ICsJaWYgKElT
X0VSUihpMmNfYnVzLT5yc3QpKQ0KPiA+ID4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYs
IFBUUl9FUlIoaTJjX2J1cy0+cnN0KSwNCj4gPiA+ID4gIk1pc3NpbmcgcmVzZXQNCj4gPiA+ID4g
K2N0cmxcbiIpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJcmVzZXRfY29udHJvbF9kZWFzc2VydChp
MmNfYnVzLT5yc3QpOw0KPiA+ID4NCj4gPiA+IFRoZSBzaGFyZWQgcmVzZXQgc2hvdWxkIGJlIGFz
c2VydGVkIGFnYWluIGluIGFzdDI2MDBfaTJjX3JlbW92ZSgpLg0KPiA+ID4NCj4gPiBIZWxsbywN
Cj4gPiBJdCBpcyBzaGFyZSByZXNldCwgaWYgdW5ib25kIGRyaXZlciBhbmQgYXNzZXJ0ZWQgdGhl
IHJlc2V0LCBpdCB3aWxsDQo+ID4gYWZmZWN0IG90aGVycyBkcml2ZXIgcnVubmluZyAod2hpY2gg
aXMgc2hhcmUgd2l0aCB0aGUgc2FtZSByZXNldC4pDQo+IA0KPiBTaGFyZWQgcmVzZXRfY29udHJv
bF9kZWFzc2VydC9hc3NlcnQgYXJlIHJlZmNvdW50ZWQsIGxpa2UgY2xrX2VuYWJsZS9kaXNhYmxl
LA0KPiBzZWUgWzFdLiBUaGUgcmVzZXQgbGluZSB3aWxsIG9ubHkgYmUgYXNzZXJ0ZWQgd2hlbiB0
aGUgbGFzdCBkcml2ZXIgY2FsbHMNCj4gcmVzZXRfY29udHJvbF9hc3NlcnQuDQo+IA0KPiBbMV0g
aHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvZHJpdmVyLWFwaS9yZXNldC5odG1sI3NoYXJlZC1hbmQt
ZXhjbHVzaXZlLXJlc2V0cw0KPiANClRoYW5rcyBhIGxvdCwgSSB3aWxsIGFkZCBpbiBuZXh0IHZl
cnNpb24gc3VibWl0Lg0KDQo+IHJlZ2FyZHMNCj4gUGhpbGlwcA0K

