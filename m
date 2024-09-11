Return-Path: <linux-i2c+bounces-6594-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86561975ADE
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 21:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B15911C2244D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 19:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735501AAE36;
	Wed, 11 Sep 2024 19:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=caliangroup.onmicrosoft.com header.i=@caliangroup.onmicrosoft.com header.b="UjHrapUc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from YT5PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11021108.outbound.protection.outlook.com [40.107.192.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3082B1B5808
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 19:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.192.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726083181; cv=fail; b=ioXLe1p1KZKjh3gU2laePANygHQ51te/Jg85k9EMiApsXtzHUBNV9LHEegTvbXQsJzllNLSEkOAF/uHL7bMUL2B2Dm8/dcaVkcNiwNBkVQ4t2mTlMBTS3mSkHCuuOWhZfPcPLed5yQpORjHCGB5rc49UidRih3CjiHLuWNpXtqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726083181; c=relaxed/simple;
	bh=C4SOcUPH5WCZQbWfb1V4DiHGB24rkt6JO7rzJWGCN1s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V0WO9RbHJLOZVd1w9I01xa9VZO9CKa3DBvx/qoA3f8GSnWTt3n1NZq9ZTLwpudnmEs5Z+wQRkpULEZiruSzFYZCWi2XcXbBaYRF2wbiJjUIe8vBaGMwxt5f9Jq2YpFZtgDEJ1chQSQN+atxgMxr+OgDWkPsBKWIHsEwGwOMa1lE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=calian.com; spf=pass smtp.mailfrom=calian.com; dkim=pass (2048-bit key) header.d=caliangroup.onmicrosoft.com header.i=@caliangroup.onmicrosoft.com header.b=UjHrapUc; arc=fail smtp.client-ip=40.107.192.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=calian.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=calian.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPvCRsvsAqboGZHw8MfgUFF7lULY8VE7u3gBj7VU4R8xLnBvwZwlleT25bn101amSf6NjI5FGF2mwqATD2fQFuM/2pLURkusZtRM1OmvkNuwVmBlXcEIVaJYCaLNAJb+hO2XTHlgL3PZcGJEcBFu8f2D5+OR9/OzZRnOSUD/+cUvvpRr2wP9IKvpvRGYTanz4t1U1F8GgNVAhxk/aCDo3EJ1K8Lvgx3y5yLnG/pCXlaKhf3gv6Ne9YeipvC3tZ8Q33m5C91VycjCc8L2T/spmGGFazbItHfXMWfh+OV+rMTdFGtEayc0YIkyP3ToTEe8ji0O7Yo2Fpmm4IobWvqFZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4SOcUPH5WCZQbWfb1V4DiHGB24rkt6JO7rzJWGCN1s=;
 b=xb+E7yf4BktykqOhD21uAiPbcC7ccUhlk9a01it1IghxCuNSDPWYhxhT6DKIhnxCpBGvWJQEZKyMDOamQ6HmGIfUWYn4Bf/9zNiEziLAv9Qm/7+WKGRq9JLt3JQlq5B+BxiDM5WaZT3YXWJ5zaS9wGLxMUXiIJgRYaDgb6fRShURvENgRW7yGo1KOR3OKe+QbzWg+sCjPm5ZeThIiKhvPciMC5FLuPKt5YRwGHe/B5uYxwZIvjmswL3VogDWL7IFn/aB7nnzRYwNBTHXhDvv1lSYgiXDAhEoOunWWLxtTqfnRpfC/Dg73XZJ+qMr26JOTQhsUA3UT9QCnJYqZm3qiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=caliangroup.onmicrosoft.com; s=selector1-caliangroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4SOcUPH5WCZQbWfb1V4DiHGB24rkt6JO7rzJWGCN1s=;
 b=UjHrapUcd3pkMGHjRDJwRjDmUwaHT+33Lr1Ed3p/GOm+x59pn6bahEFyfuseGU1+BghOn127yu6Ao9oVssoq1bEoydL/iQ+lonHAkPVkK0WJfnyTjSOtjShjDGdC544+Y0GQTd7sazB0SrdOf8d6hotMJbKgA9V44yQY2uPJ+OGjj9ZcYsYvnNkNtMubZM+rJwfHkW65fSHNMbhCB0OgPdwiAM3SHF1gMRAZCVeH4bGVbM196kCFf/JJatv9RmdcHmgqDrW9g+ZGbkeP01bq5kiNvJf8Hlvtk+w1Ulpt0OjcA4lVpeg7fMmVsUL/EKJSS7XeiqODi+fjp5YI6Mphrg==
Received: from YQBPR0101MB4129.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:13::12) by YQXPR01MB6012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:29::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 19:32:53 +0000
Received: from YQBPR0101MB4129.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::f136:60c4:8f93:d352]) by YQBPR0101MB4129.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::f136:60c4:8f93:d352%5]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 19:32:52 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC: "michal.simek@amd.com" <michal.simek@amd.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "ben-linux@fluff.org" <ben-linux@fluff.org>,
	"manikanta.guntupalli@amd.com" <manikanta.guntupalli@amd.com>
Subject: Re: [PATCH v2 1/2] i2c: xiic: Wait for TX empty to avoid missed TX
 NAKs
Thread-Topic: [PATCH v2 1/2] i2c: xiic: Wait for TX empty to avoid missed TX
 NAKs
Thread-Index: AQHaHKYehxqHQRxHX0um/MNCnhIwPLJUVlsAgABzIIA=
Date: Wed, 11 Sep 2024 19:32:52 +0000
Message-ID: <6206ffaf483a389dea37e5b8203f4bffd4487069.camel@calian.com>
References: <20231121180855.1278717-1-robert.hancock@calian.com>
	 <20231121180855.1278717-2-robert.hancock@calian.com>
	 <4x5gqlah6dfpbn2ih2gynrfdgxx7pkqyfcd7t3cle62zhyuexk@vhsdz3njvneh>
In-Reply-To: <4x5gqlah6dfpbn2ih2gynrfdgxx7pkqyfcd7t3cle62zhyuexk@vhsdz3njvneh>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=calian.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YQBPR0101MB4129:EE_|YQXPR01MB6012:EE_
x-ms-office365-filtering-correlation-id: a8b86507-f718-4aa7-0973-08dcd298873c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?azFhd2wxSkQ2ZWdiQUNZUEY5a2FTSTRXTmlBK2g2MEJ4eFhxUWhYZDlLa2J0?=
 =?utf-8?B?TDNyb3YvK2VLMjNxNHpZNVB5YWIvNjQ2K0tBUTR1ZlRmRUk3RUpxOE5NeGRa?=
 =?utf-8?B?KzYwck43T2tKZFQyVTlKZHRSMnJ4SlVVVmh4S2dhUi9sbUIzQkVGM1ZQc1R2?=
 =?utf-8?B?NnhSRVhsZkljeTh6SnZoc1hOK2VtVVRxVjFsWVhzMFRaYnpJZFhnaFBnZlJT?=
 =?utf-8?B?MmlhTGZ0ODc4VWdzd1lqc2RMcHd5WExlOVNYUjhoZjJ2QzNkSzdjeFZTUkJV?=
 =?utf-8?B?SFlqQlB1T0tpZHJoNmc0eHFwZ05udG9ZYWxDWnpTeUhQTUZYMW55bUVqQnZU?=
 =?utf-8?B?d1dTRHBtV1JyT2kxaWJxcmJLRVkvbjQ1dTZ6eWg4cWFFQ1UzZml2aUFqZDhQ?=
 =?utf-8?B?VlNNWDF4TnJEWGxCNDl5ZVhaSUpWVUtNdFdpY3Bidk0waXpua04zWHc5NFFS?=
 =?utf-8?B?VlFxWjBoSHYwclBXdmlyQTYzVElPY3RVQ2Q5QUU2R25oWnhRblJQeEJXYnBl?=
 =?utf-8?B?YkcxTVF1R2xkR29wL0gwMzNEOWJIRWlHSEdXTllLVnJKUU9adnpBZFMzVVZp?=
 =?utf-8?B?QjNzUW92ZmJzTEpLQ2NyVVgzUDQyalJhVk8va0p1YlNFV0tIbCtLblUvWmVB?=
 =?utf-8?B?Tlo3NDJIbHpYQ2NJTHpWQmlKQlZGYUxtaEdCU1M4bWxScHE4eTRyc3hlbjVP?=
 =?utf-8?B?WHh4VGowTTdLQTFhbmNuMDVmOCtobFJWQ2FKMU9VcXVLdVhFSlNrbEE2RGxE?=
 =?utf-8?B?ODEyTnNNTzZpdXdGODh1Rm8rZTZJVGU2WEhleTVhT3dkTWtMemsrSXZ4NDdU?=
 =?utf-8?B?VVlxSTNrNVRnalRRSTIvQW1kSTRYaXE4MUZsNmx6cEI3anFrUTdVR0UrQTdU?=
 =?utf-8?B?SzB3M1cxdUJkallIQ28xcXVialRTZGNtYTVWS2pYV2k0Mm9zVUE3QUNPMjE3?=
 =?utf-8?B?QTg3OFQ4SUNydlhFcEJYVjdVekJkcDVQaDRvZldnL0J0cFAwbmVDRWpKZE1W?=
 =?utf-8?B?OUI3akVEa3VZSm4xajBLRWVTYW8wdzdmczlJcW5BQzNuYkpKb3Q4ckI2RkdX?=
 =?utf-8?B?aU1seDlSUzdoTzFqL3FIK0NlaGFPaVpHQ2F4aUFWM092QTNwOVMxNnJMVUs3?=
 =?utf-8?B?cjVYSGpFTVB4V0FUQWxwVEVKdFRzMUJqdktkbVc4S2k1c3hmNGNtMytKNC81?=
 =?utf-8?B?K1lJYW1KeEx5c1FPeXpQQWNEWEFLUHJ3QmF6V2xRQ2YzQkdEenEwdTFUYzg2?=
 =?utf-8?B?R25wdlc0dnJYL0svbG9KUHVETXJSdWw4ZVc4a1hQL1FhN0t3RDROV2owdXR5?=
 =?utf-8?B?c0xkeGxXYytJMGRQL0tZUGlOWkVLTDQ2OW44Z3RzWkIxT21Dc3hwY1RwQkN0?=
 =?utf-8?B?ZExwbWNaeGJhWE9mcVVMMkYwb0xBWkZ1NU41TnN3Z0oyTnVPSnMzNEV5WFFu?=
 =?utf-8?B?TGpweEFkeWxsbTNSRXB1Wm5SSlhJcldPM3VKVnJyckt1RjZyZEJiU09HWXR5?=
 =?utf-8?B?MFNRZ0dkV2V3Q1ZYWURYQkphKy95RHFtSmZ2aFdIajVscHJzVXFNaFQ3OWY3?=
 =?utf-8?B?NHRTUGd2MzBqT1pxaHprc2NTK1ZhZVNRQ3NSMWYwMUY1UGhhbDM5QzNvelp5?=
 =?utf-8?B?ZG9ZS2FXeTRTMnAweEprSFF6bTc4TnJWM0lqZHFITW1uNEtzOFZYTzNwRis5?=
 =?utf-8?B?c1M0VnJwQ0tVK0l6TFJYajFPZjdyTDd4b3JqWm83N3pkcjc4OUpzSmlNaTM5?=
 =?utf-8?B?NGZIL09obE1DVElveTlMcXRHYmgwRWRhalY3TGlDZ0lOWk54VmlqN3NralZx?=
 =?utf-8?B?YUt1R24xc2FYY1pqV1pUT1c2V2lFc01Ob1lyNmVsWktueGxCVk91Yy9RTlBU?=
 =?utf-8?B?RFBsdjFYTUhMRmJhR2l6ODk4WFZCc0F1UzRkQkR3OVhlb2c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQBPR0101MB4129.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZVNVOVJGbExVSEkvSjZRNEowb2EvdlR2Ylc3ZEQyQ1BRbElyalkvUkhLUnlk?=
 =?utf-8?B?NVY1NGdpaU5mNlJvSklqY1FSUVhnT21USXkvMWNxZ3lqM1B0SkxTYkhndVVj?=
 =?utf-8?B?dmRMUlQyTEo3REVpNVlxckNqNVhZZlUxODMwbXEzV3VNZ21ndm9WdmRnNWdh?=
 =?utf-8?B?eHlCNDJDTEZXSE1sQ1BRcjM3cE43MVBmRmpSeXdESGxlM3N5L21nOWdwWEdH?=
 =?utf-8?B?czhwRVNVcDFHeHFBWStyZnlDZWJNcWkwN3p5d2o5Ris2d3BBb3NRQzFCSEFr?=
 =?utf-8?B?ckptSHI1V0tOZnpKbTRzT1pVcXBTVzdHbEZkVHVCRHZSTzJXRmVYenhBenVV?=
 =?utf-8?B?MEdSZzc2N25zZmRxbWxIZGFrT3dLUitKaGlCbGUwUC9sS0RPdVpoWUZWUlNI?=
 =?utf-8?B?bU4yT3BmbkQvM1gvdXFTNUkvNU9YamlnbkF6ZHZBQ2lsMzVaTTZaUStlMVUw?=
 =?utf-8?B?NVBNWUk5OERicjlCeWtLeUJCQndrVnUwUUlmODR6Vm5Od0pCSWdFaXFEcU9l?=
 =?utf-8?B?VTIwZ1JsUVFsMnhjWVhpYlVMYlJYeHhJeWo2WmZTdjVBS2thUGhHT3JBM2R2?=
 =?utf-8?B?U0tOei9UQ1Q4N0w1VGFJS1JnaVlmWDFmVmdqd0dxQkxBK3Jqajg2UTBnUHVD?=
 =?utf-8?B?RjQxQ2lFYVIzL3NFaG5vM1N1eS85RVZNRUhPTkpXbW1DZjhTTThOQUVQY0xH?=
 =?utf-8?B?bU5FYWFtMThRSzY3TmZuTFFSb0FHQ0lNd3pXL1FzbmNwY1dNSER5WXFJdnVO?=
 =?utf-8?B?SjkvZGt1YndjZ2FXU2RqYVZadUprenJwTE5SdlBQNGplcWMzd3JTcFJpQ1Mw?=
 =?utf-8?B?OWlBY1ZyL0NYSUVmbm15WC96YkcyMTNlZm5rdGVvaStObkZGL01iRXV0M0lr?=
 =?utf-8?B?ZG9HcEVzUTdHYWZYRDZOcnYxSldlRnlxQkZ2WjQwVk5rRk5FTXJ6cTc0OS9U?=
 =?utf-8?B?RFBsTjIyeVhsY3daUjZxV2pCa3ZtZlVhRTVkWUQ0Tndka0ZuVnBBVFgzdVNq?=
 =?utf-8?B?eGtrcFVOVVZ4N3BQd0l1eUgyRWdHN2hqKzc5endCZ3JFZndsaWZMYWd0KzMx?=
 =?utf-8?B?TG1VV1VGRVBRWTd3V1I3WUk3Y2txM3EzT1JqR3N3Vjl6WlBtY256anhaR1dh?=
 =?utf-8?B?WUhPRExBUzQ2K2ZUV3ErSE8xbmxuaXhXdEZRSURtbUc4bWxNMVdXdG9SOFAr?=
 =?utf-8?B?SDErOW5qeVFHSWo1U0EycENKK0NidGlvbTh3M0tZTmphVmsvc0dRU3JEQlBO?=
 =?utf-8?B?V3d4SnJRRlFHcHhLUHhEa1NYMUlMTXA0dmphM3dGU3NiUTJjZDRSN0tTVFA3?=
 =?utf-8?B?RWFPZk44bnp6aENKN3VrQmJUdkJwQWdnQTZLVXRXQkhkYmc1eEQzYUVuK0sx?=
 =?utf-8?B?UDFFczdaVUUyT0ROa256aWtwUGlKOUt4blZEekJ3UmtqMkg1czA4SVVQdFpU?=
 =?utf-8?B?bjNaRmRqaWcwdzlTZlNXN3FpTE82MHErU2toTzMrSll2NE01RjlmWWtBQUZG?=
 =?utf-8?B?NmhsZUw5UWJiMWM3V1RLZWRpZlBDZ0NkcXozOVhKK0lGc2JTZHg4WU9iWUpX?=
 =?utf-8?B?cE16M1E1czA0a2hqZkh5eHRPZ0pIbENaWlFKL2V4eEw4dG0yRGorajVMZ0VV?=
 =?utf-8?B?R3hhVjZtMlV0SDBHNjlLMTB3VmVES3lzL29IbzFETWx0RXV4S3IrejMwZVM1?=
 =?utf-8?B?WW8reDVLVFRGU3E1WmNuODF1K1d1dGtqSERmcnlJYUtCQXlzaXRjYkZBNXJM?=
 =?utf-8?B?cURuYUIycW10RmRvdEdpWnJHSkozM0VHaDhERDdMdUdMeWU4MFBLeU9kc0NC?=
 =?utf-8?B?ZEpwM3pTWDBQcmFjaitOTmpTeGtjRkVjUWtKVUlURGpOTEh6S1Y2U3RXQjN2?=
 =?utf-8?B?cnE3NnRCank0cTY1VGx2M0piTHF1R3JaWGcrcEJOL2dXazdlQXd6SHMwZTBG?=
 =?utf-8?B?K3pUZU9SL3gvd1VLQjBNK3hnY2VPaFNheWwvTXhTdjNRb2pFbjA4ZFE1WmM4?=
 =?utf-8?B?RzlFUHAxVUoxVHV4UGk2RWtkeU1WT1ZzdUxOSmJJVjlGS3hpSGc2UW80NmVq?=
 =?utf-8?B?NzlSYTYzclVaeG1vMzdvNHR5bnpBMkE5elNvajR1R1h0OTJkUWJONGIySTYz?=
 =?utf-8?B?YTErNnBibEh5TUFMblZrdUNCNzBzTFA5Q2pVVnJoUkNBdXR0MTQzeVZ6MEVu?=
 =?utf-8?B?ZnRlM2g3RkpLWVZ3QnFqUmRwMDJKdjYyRE9STVJUeFozQjI0ZlQwNk9rM1Qw?=
 =?utf-8?B?MnNUMDlXTEltdEFaRWJsVUtGTUVBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <18FE55C5B7CCE446BC3BB1255DE95C7C@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQBPR0101MB4129.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b86507-f718-4aa7-0973-08dcd298873c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 19:32:52.5449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1QCL0p97xPFlcekfrsB6+Edw/UZNhpsNJToMkeopz+4ei9Xmk5FmbxAEdNEYbOb1y4LvmNBMUWrPyZwdr1nv7+xYWu0qPjTGIjsqOrlZKd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB6012

T24gV2VkLCAyMDI0LTA5LTExIGF0IDE0OjQwICswMjAwLCBBbmRpIFNoeXRpIHdyb3RlOgo+IEhp
IFJvYmVydCwKPiAKPiBGb3Igc29tZSByZWFzb24gdGhpcyBwYXRjaCBhbmQgdGhlIG5leHQgd2Fz
IHNldCBpbiBwYXRjaHdvcmsgYXMKPiAiQ2hhbmdlcyByZXF1ZXN0ZWQiIGFuZCBkaWQgbm90IGFw
cGVhciBpbiB0aGUgbGlzdCBvZiB0aGluZ3MgdG8KPiByZXZpZXcuCj4gCj4gT24gVHVlLCBOb3Yg
MjEsIDIwMjMgYXQgMDY6MTE6MTZQTSBHTVQsIFJvYmVydCBIYW5jb2NrIHdyb3RlOgo+ID4gRnJl
cXVlbnRseSBhbiBJMkMgd3JpdGUgd2lsbCBiZSBmb2xsb3dlZCBieSBhIHJlYWQsIHN1Y2ggYXMg
YQo+ID4gcmVnaXN0ZXIKPiA+IGFkZHJlc3Mgd3JpdGUgZm9sbG93ZWQgYnkgYSByZWFkIG9mIHRo
ZSByZWdpc3RlciB2YWx1ZS4gSW4gdGhpcwo+ID4gZHJpdmVyLAo+ID4gd2hlbiB0aGUgVFggRklG
TyBoYWxmIGVtcHR5IGludGVycnVwdCB3YXMgcmFpc2VkIGFuZCBpdCB3YXMKPiA+IGRldGVybWlu
ZWQKPiA+IHRoYXQgdGhlcmUgd2FzIGVub3VnaCBzcGFjZSBpbiB0aGUgVFggRklGTyB0byBzZW5k
IHRoZSBmb2xsb3dpbmcKPiA+IHJlYWQKPiA+IGNvbW1hbmQsIGl0IHdvdWxkIGRvIHNvIHdpdGhv
dXQgd2FpdGluZyBmb3IgdGhlIFRYIEZJRk8gdG8gYWN0dWFsbHkKPiA+IGVtcHR5Lgo+ID4gCj4g
PiBVbmZvcnR1bmF0ZWx5IGl0IGFwcGVhcnMgdGhhdCBpbiBzb21lIGNhc2VzIHRoaXMgY2FuIHJl
c3VsdCBpbiBhCj4gPiBOQUsKPiA+IHRoYXQgd2FzIHJhaXNlZCBieSB0aGUgdGFyZ2V0IGRldmlj
ZSBvbiB0aGUgd3JpdGUsIHN1Y2ggYXMgZHVlIHRvCj4gPiBhbgo+ID4gdW5zdXBwb3J0ZWQgcmVn
aXN0ZXIgYWRkcmVzcywgYmVpbmcgaWdub3JlZCBhbmQgdGhlIHN1YnNlcXVlbnQgcmVhZAo+ID4g
YmVpbmcgZG9uZSBhbnl3YXkuIFRoaXMgY2FuIHBvdGVudGlhbGx5IHB1dCB0aGUgSTJDIGJ1cyBp
bnRvIGFuCj4gPiBpbnZhbGlkIHN0YXRlIGFuZC9vciByZXN1bHQgaW4gaW52YWxpZCByZWFkIGRh
dGEgYmVpbmcgcHJvY2Vzc2VkLgo+ID4gCj4gPiBUbyBhdm9pZCB0aGlzLCBvbmNlIGEgbWVzc2Fn
ZSBoYXMgYmVlbiBmdWxseSB3cml0dGVuIHRvIHRoZSBUWAo+ID4gRklGTywKPiA+IHdhaXQgZm9y
IHRoZSBUWCBGSUZPIGVtcHR5IGludGVycnVwdCBiZWZvcmUgbW92aW5nIG9uIHRvIHRoZSBuZXh0
Cj4gPiBtZXNzYWdlLCB0byBlbnN1cmUgTkFLcyBhcmUgaGFuZGxlZCBwcm9wZXJseS4KPiA+IAo+
ID4gRml4ZXM6IGUxZDViNjU5OGNkYyAoImkyYzogQWRkIHN1cHBvcnQgZm9yIFhpbGlueCBYUFMg
SUlDIEJ1cwo+ID4gSW50ZXJmYWNlIikKPiA+IFNpZ25lZC1vZmYtYnk6IFJvYmVydCBIYW5jb2Nr
IDxyb2JlcnQuaGFuY29ja0BjYWxpYW4uY29tPgo+ID4gLS0tCj4gPiDCoGRyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMteGlpYy5jIHwgMTkgKysrKysrKysrLS0tLS0tLS0tLQo+ID4gwqAxIGZpbGUgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMteGlpYy5jCj4gPiBiL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMteGlpYy5jCj4gPiBpbmRleCA3MTM5MWI1OTBhZGEuLmZkNjIzZThhZDA4YSAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMteGlpYy5jCj4gPiArKysgYi9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLXhpaWMuYwo+ID4gQEAgLTc3MiwxNCArNzcyLDE3IEBAIHN0YXRpYyBp
cnFyZXR1cm5fdCB4aWljX3Byb2Nlc3MoaW50IGlycSwgdm9pZAo+ID4gKmRldl9pZCkKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiA+IAo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB4aWljX2ZpbGxfdHhfZmlmbyhpMmMpOwo+ID4gLQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAvKiBjdXJyZW50IG1lc3NhZ2Ugc2VudCBhbmQgdGhlcmUgaXMgc3BhY2UgaW4gdGhl
Cj4gPiBmaWZvICovCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICgheGlpY190eF9z
cGFjZShpMmMpICYmIHhpaWNfdHhfZmlmb19zcGFjZShpMmMpID49Cj4gPiAyKSB7Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh4aWljX3R4X3NwYWNlKGkyYykpIHsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhpaWNfZmlsbF90eF9maWZvKGky
Yyk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBjdXJyZW50IG1lc3NhZ2UgZnVsbHkg
d3JpdHRlbiAqLwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGRldl9kYmcoaTJjLT5hZGFwLmRldi5wYXJlbnQsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIlcyBlbmQgb2YgbWVzc2FnZSBz
ZW50LCBubXNnczoKPiA+ICVkXG4iLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2Z1bmNfXywgaTJjLT5ubXNncyk7Cj4gPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaTJjLT5ubXNncyA+
IDEpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIERv
bid0IG1vdmUgb250byB0aGUgbmV4dCBtZXNzYWdlIHVudGlsIHRoZQo+ID4gVFggRklGTyBlbXB0
aWVzLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHRv
IGVuc3VyZSB0aGF0IGEgTkFLIGlzIG5vdCBtaXNzZWQuCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAoaTJjLT5ubXNncyA+IDEgJiYgKHBlbmQgJgo+ID4gWElJQ19J
TlRSX1RYX0VNUFRZX01BU0spKSB7Cj4gCj4gY2FuICJwZW5kIiBiZSBib3RoIFhJSUNfSU5UUl9U
WF9FTVBUWV9NQVNLIGFuZAo+IFhJSUNfSU5UUl9UWF9IQUxGX01BU0s/Cj4gCgpJdCdzIGJlZW4g
YSB3aGlsZSBzaW5jZSBJIGxvb2tlZCBhdCB0aGlzLCBidXQgSSBiZWxpZXZlIGl0IHBvdGVudGlh
bGx5CmNvdWxkIGJlLiBIb3dldmVyLCBpdCBzZWVtcyBsaWtlIHRoZSBiZWhhdmlvciBzaG91bGQg
c3RpbGwgYmUgY29ycmVjdCAtCmlmIHRoZSBUWCBGSUZPIGlzIGVtcHR5IHRoZW4gaXQgaXMgYWxz
byBoYWxmIGVtcHR5LCBidXQgcmVhbGx5IHRoZSBmYWN0Cml0IGlzIGVtcHR5IGlzIHdoYXQgd2Ug
Y2FyZSBhYm91dCBpbiB0aGF0IHNpdHVhdGlvbi4uLgoKPiBBbmRpCj4gCj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGkyYy0+bm1z
Z3MtLTsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaTJjLT50eF9tc2crKzsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGZlcl9tb3JlID0gMTsKPiA+IEBAIC03
OTAsMTEgKzc5Myw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCB4aWljX3Byb2Nlc3MoaW50IGlycSwg
dm9pZAo+ID4gKmRldl9pZCkKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIlcyBHb3QgVFggSVJRIGJ1
dCBubyBtb3JlIHRvCj4gPiBkby4uLlxuIiwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZnVuY19f
KTsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSBpZiAoIXhpaWNfdHhfc3BhY2UoaTJjKSAm
JiAoaTJjLT5ubXNncyA9PSAxKSkKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC8qIGN1cnJlbnQgZnJhbWUgaXMgc2VudCBhbmQgaXMgbGFzdCwKPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBtYWtlIHN1cmUgdG8gZGlz
YWJsZSB0eCBoYWxmCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICovCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4aWlj
X2lycV9kaXMoaTJjLCBYSUlDX0lOVFJfVFhfSEFMRl9NQVNLKTsKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfQo+ID4gwqDCoMKgwqDCoCB9Cj4gPiAKPiA+IMKgwqDCoMKgwqAgaWYgKHBl
bmQgJiBYSUlDX0lOVFJfQk5CX01BU0spIHsKPiA+IC0tCj4gPiAyLjQyLjAKPiA+IAoK

