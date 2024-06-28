Return-Path: <linux-i2c+bounces-4471-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 018A791C0A8
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 16:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25EE91C224FE
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 14:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA97C1BF312;
	Fri, 28 Jun 2024 14:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="IOqd2F9X";
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="y9go/CnW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D981E529;
	Fri, 28 Jun 2024 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.154.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719584247; cv=fail; b=Fdz9Au72bFDrSiOeEPJHxhRWSo4AZ8rEMFdehv0AEJoCME7P5tFt2Ogv9UMPOizBtp+xoYjf7guqqiXZ0DRfGa8V9Sfxk6G4dBvp5oUOjhd8JomjwTba2CyLIG54tRXqV5TtxuzWYAFuBmhKDRunEmzmW6RRKA7IfkXGK3fHszI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719584247; c=relaxed/simple;
	bh=we73nVfzwn1QTvZclWYrDmokud2IoPXo1MOu/zqfYHA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NYFV5vcZLbw5WLRaWEmwBZ668A9mfftJQJ3QhhP/EtCcEnKra2H4e82wCDZAz4u8VySrquAQsglSwCO5m887fQwnoWf9mqgHVroIjov+XnVUgKJZ+C/cIRG43Z00LskBb1clgyxhVCIZ/VAPMjKvyANrNOLlLMOQbVaZ2Z8G5Ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=IOqd2F9X; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=y9go/CnW; arc=fail smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719584245; x=1751120245;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=we73nVfzwn1QTvZclWYrDmokud2IoPXo1MOu/zqfYHA=;
  b=IOqd2F9XWYN2M9bETyAuVgycdd/Sj/iLS07AqnVVC3xFVZXfXs1I+pLo
   JYN+seKgdonQNIhOEcOI7UfohwoM85unF8JDVS375jNxnMtOwFY474wtG
   ryyTDEfyfgsfW9q8y3JPJT2gWK7r7WFLdQvMY30Ne8e8e4IJo+oD2anaU
   8UOz6hmkgH2SvEWzLEQf8n/wUt7GBQVuMvxft1pKCirzbNZau7JswEQIz
   La4TlBfpL1v2PrE/liCLzObqT1xmYXgvBEEBNH6q6y4LdMW3l3U78VwHh
   ErypUHWvr5NdPYNVLjbaVKonhmSmdH4y4Bf1tunHxWyR5PIbN2e4gN1Nh
   Q==;
X-CSE-ConnectionGUID: XacWoIeEQayJBm+3eESK9g==
X-CSE-MsgGUID: exyVrq0zRIuENo3GNyI3Vg==
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="28600956"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jun 2024 07:17:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Jun 2024 07:17:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 28 Jun 2024 07:17:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZW1oWdIkfcLM2zXoC3w5vPn8M8BsxTTbO5JMQb9nN0NtEPn02dZ87rQGXFQYNz21DL7BAgslLt30vy09NAUGXD5DyRtOyOkaxpOogKXu6S252fsZvkwZSYAQKVOYySrc543RW6BqTBB/vyrkq94fkJO+HwNM38ZCSMixtD3eDJWLSVxMzNcRlDFP9QpdNNH0BbBlqxyN5ypIn8V7cWhT3xBu4sG3XbNVnt1XzNeU6HopzAoJ3EQjHrjFzRGt2TMKBnCyhGFEueoXYHAss8JsnzOnvkjMRKfK2nMTv1l4wbKAoii16F1T1SVYgvbgVnGZRNpt4DVoFxgSwwcgd5KvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=we73nVfzwn1QTvZclWYrDmokud2IoPXo1MOu/zqfYHA=;
 b=e1Z5zxLS6HmytqjepwQ+GG1EWYXia6iKcrgBFincXdQeBAvp0LPunCvpP5ATjLcunVorP6VbGhmZfmTFN8j4yNB+VJawNSBtIivObv5gNKmtfP2hHTXR16Hqg5s/mWD/UMLsjcsSN8dmSJDI5/G69OcfgLDufnIkrXoElNn3U/gM+1rAjIZHFQXMhELN2P4qzyqk2M4BAFiSpZCj2MMJoP8ZHGtlyfE5PMJ3xKCLnXhuFh1uITvqy9NiKqmSLs8yfddAQbeSAa9rSekf6I7dPHC1V5mmdo0PspApi/mvhPyiFG+XrgtryYiBnJgeg6jNx3pKwiTmO1prIg5adpEFnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=we73nVfzwn1QTvZclWYrDmokud2IoPXo1MOu/zqfYHA=;
 b=y9go/CnWEZw6/Ngchjqs+4p+rlUTrS1iCf1JGdL3AcQ0GAuxvsQu7HbGZB1Vny9aRySxovIxA4caaxsZ5Aq6I2sk+TVvtezOQcU1Go0e8KZGfPP64JcO2ad5jGsaacn65EzoGTINzN+OMlWDsVsVGya5Yo965ZLrRFOO0yrleuSDGuu89m2bbwQesa6ySShE4NHcXdV6diOFDOn2WN+a7hnRiaGx3SO+xDe4IOU8tkI/6VkWe5s5tO2eTwa0xe+Z/HiLggfwLmk20Tnz1IU5350c+thZp5jLXhfbRmOgAuz00tLqrgt8bi0dKFTeRejsFBXKHMMdH3kQnj3FeIOhGA==
Received: from BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 by CH0PR11MB5266.namprd11.prod.outlook.com (2603:10b6:610:e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 14:17:15 +0000
Received: from BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395]) by BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395%5]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 14:17:14 +0000
From: <Andrei.Simion@microchip.com>
To: <brgl@bgdev.pl>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<claudiu.beznea@microchip.com>
Subject: Re: [PATCH v3 1/3] eeprom: at24: avoid adjusting offset for
 24AA025E{48, 64}
Thread-Topic: [PATCH v3 1/3] eeprom: at24: avoid adjusting offset for
 24AA025E{48, 64}
Thread-Index: AQHayTGBv1mzh/dtb0KvO1vdxjAYGLHc2IiAgABg1AA=
Date: Fri, 28 Jun 2024 14:17:14 +0000
Message-ID: <67d3646f-1b84-4d2d-9e36-be898f13be90@microchip.com>
References: <20240628080146.49545-1-andrei.simion@microchip.com>
 <20240628080146.49545-2-andrei.simion@microchip.com>
 <CAMRc=MeJyByMvcFT2aJDK87bz4=+UXEuMtQ4G4MZUAUt39SS1Q@mail.gmail.com>
In-Reply-To: <CAMRc=MeJyByMvcFT2aJDK87bz4=+UXEuMtQ4G4MZUAUt39SS1Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5289:EE_|CH0PR11MB5266:EE_
x-ms-office365-filtering-correlation-id: 93a253f4-bf3d-4d20-112a-08dc977d0266
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bVdkc2hvQ1BTaXdFdUVEMVh4MDROaXRqbWI0N0lNOEJzcktlZTFxTlFkT1ky?=
 =?utf-8?B?QW5QTm1tUDJTYVZPM2JWcnh4YnlyVGJrb2NpdmZCT1hPSkNwS3B1VTRqd3ZT?=
 =?utf-8?B?OUM5eFdId2lLUzZyRjdMWGxOakllSnNHK0xxRWx2bVc2VVJsYTFKYkRydjlK?=
 =?utf-8?B?ZmhqWTQvTWpueVV1U2VLSHNJQVVjSzczUWRTUCtsK2NMbVFMcVNabHR1Tlpk?=
 =?utf-8?B?WG5VelNtQzkyNHpySnRLa29IV3VMbGRGV1VtdGhVelhCTnNZQXlvdnJPOGY2?=
 =?utf-8?B?UWNsV0RtNkJGR1F0NkhsUDQrT0VVRyt5MHVuR09QOE41TzhaTG1JeVV6VC80?=
 =?utf-8?B?dmd2d3FBdksyTEpmNnJtWGxWMzZ0ckhEaWFteENwZllmeitYVXA3bFNGSVFm?=
 =?utf-8?B?YkcxZ2RvZ3JRT0RtVmJyM2wvVkV3M0R2bnYwcGZ4aVJmU1plcEhGUEtDbWFp?=
 =?utf-8?B?QUVzNzFBODJwbi9zMEszRHpGN091ZXhMc2lrenRHTEZvMW1yS2pMRDZxeFRS?=
 =?utf-8?B?MS9iWVRZSS8xb1FHQkVlSTJFamN6OEU5U2Rid09rMDJ5dDFBUHJLbGtwSWl1?=
 =?utf-8?B?a0ZLQXJ1NGwzVUpJcnk1akt0akdLU3BFUTdPOTdMeWhobXlLMzV5RzhsNFBk?=
 =?utf-8?B?V3dYNnhXeWpJRmg2S1BON3RxekZBemxFZVdGZHFxZllTQU9rZDRld1MyQkhx?=
 =?utf-8?B?Sk5TV0NvUGJscS9IK2JIU1gzTmVsNU5pQ3cwVDN3NnEwWDNrY2FwbTBGQVR3?=
 =?utf-8?B?NVhFalQ0SkUrZTc5a2JXN2lGbkRFYWlQYXZFZ1dpZjZlR2hNSVY2N1FtUXh3?=
 =?utf-8?B?QXRUTk1zU3FZbkJqN25MWmJLdU9XYkRSOXV4TXNnNkFnamtRK0VQOTVjSUlJ?=
 =?utf-8?B?bkpXWERJT3FJbDBpTHlwMDVDWWFMMitRSkZFblVWOVZOaWo2QmZyMXFYUU5z?=
 =?utf-8?B?TVRid09UekVxU3djYS9XaUVGY01EWW9MWUhSS1VUSTBhRW1LdHllenVkanZk?=
 =?utf-8?B?SzdPS2cvajdGR0ZhSEljTzF2enQrTStqNXFHQndINFJ6dEFCMVgrMys2SWY1?=
 =?utf-8?B?ZHJPUmxvbkVta252eDN0aE1kc21MWDVCWWRjbGNkYzVZUjJ6RTlMeXY4RUww?=
 =?utf-8?B?SjVkTmlYQjNRSFpvM1ZEYnlYdHVKMWhySm4xVmRmT2JhTDZZWmdyZG5wUDRK?=
 =?utf-8?B?SHZ4MVBVbFpJLzgyektHWE1JSUtRV29LcFJwT29tZklpcG5jS1hOemJYOVhK?=
 =?utf-8?B?UnFUbk1tSnVWSkVoWnFuMDNORXdGNk5kOG9JMkhOQWJPSVMvSGdJUzU4aVdJ?=
 =?utf-8?B?S1prMktkaXA5Q0lVK3Zobk9EVnR5SzdCMVBEOGpLRUtsYVo0RVpJSjFmRmIz?=
 =?utf-8?B?bEZLU2ZaaWxsMTVZaWYrOEN2M1hockllYW4yVUV4NHY3ajZsdkVjZ1BtOUMv?=
 =?utf-8?B?bFVSeXNDekk4YVF6aldZMXdZZFZvOUpZL0w2WGhHc2VMdUtteFBSTURMMkxz?=
 =?utf-8?B?YjJNZ2FRMkM0aEt2YVNKWnZRcXY0ekRqanMzVUlsN05sbHRaYmNNWFM3SUNY?=
 =?utf-8?B?SnpuWHdoL2xmdHowOFRQbWZHSDJNdUgxZEFOYnFGdEczVjU3K0FsRGZpeWR3?=
 =?utf-8?B?eDY4cVgvWG1VT3VsLzhDZU93bWtOT2crbFVxOXNMMmR5d2dLQS9UZ21Ga3Jn?=
 =?utf-8?B?aWI3OFVtMVBRcHlKNmhpRzFJS0Zoand5WkdlNkc5ZkF4UFhnbDBlRVcvYkpN?=
 =?utf-8?B?Y0p0SGtRKzdtUExaYTRLZ0sxRk5uNmhzUjg4YmxGdlNFYkhNWlpDZXlETjky?=
 =?utf-8?Q?Zsullqkk0uhzQWUW83roFe37ywR3u/EvQCyoQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5289.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0dqZVcwdk03Y0twb2JJK2lSNzB5aXZsWEIxNDU4MTVGNlYwUUsrZkc1Wkc1?=
 =?utf-8?B?VkI3UzZ3d1VTOVpXazV6SVEvemlFRU1pL0hEdjNRVklqakNRMXNQaVhBYnVs?=
 =?utf-8?B?RkpLVytPVis3MVhVYTNQdXdSajZnOFhyenRPWForWlN6R2E0VWRuOUlXY3Ew?=
 =?utf-8?B?N2hWRThITE5EUUF5emJQalB3YjB0dGp6MXdvMloxc2VxZjdMcEh5SGtlWE9E?=
 =?utf-8?B?STBSZ0o3eHIyM2NaUi9SWVBKbTFPaDRlS1doRC9STSs0b1ZRTkRGWlR2YWpR?=
 =?utf-8?B?RjVBUy9mVFNPUFBzSlBHOE5rUlgwNFptR1k5cVczeFExRDFleGd1NjU4ajhl?=
 =?utf-8?B?QnFGMHFWeEJBQWFldDJka2FKRDhIZDZKcC9uTFNjcTZPYVZXNXExb0Q5RnIx?=
 =?utf-8?B?QzZ6c09tR091ZWZSQ1oyTzlVeFE5WGhNdjQvWkFTS2JPK3psMlhiMGN5WVVv?=
 =?utf-8?B?WnBBL2hlb3hvVU44eC9pYUw1WnNVUnMraUFUTHM3UnJhRGVlRUpOM25xajV5?=
 =?utf-8?B?ZVgvTFFWcVBqM05kMUI0Wnd3RysrWkZNbTRMbDlFNzRtWmZ6WTFRTXY1Y3VE?=
 =?utf-8?B?d1pxS3hicFFOay9PY2ZPQmFwTFk4Y0NNR1JkVW52RnZjb0NlNkRWYldJT3hD?=
 =?utf-8?B?WWJwTHk1amhhTldYRTd0bE9JTE14cDJzK0tPaGhNNk8zUXJreUFCcUlPdDBj?=
 =?utf-8?B?b2gxZGVua0FMOWdYMXBhdnlDV3BQOFp4T1IrbTNKTENxRWFkYW1YVnkwQ1Nm?=
 =?utf-8?B?YlhCVnZiUndVcTc4MnJKNzlxTCtSYzVMMTdHbTFQZG02RGRKc3ZrTVdPSnNO?=
 =?utf-8?B?Zzl3V0FaSEVOZGdLNjM3NHd6NEJyRi92d1JRWEFkUmM2YkxiTkNVUDhmSVEx?=
 =?utf-8?B?R2ZRcmhvSHlyWkFTVFlLTEpCL1ZteTFiY2ErRTNCaVZGTEdpNG5acGRkSlly?=
 =?utf-8?B?Tk1nWUlxaHlnVVlMZFAyQjd2NUJjZElEd0xQR0I4QVdLdjNmTHdVR1FDdWxR?=
 =?utf-8?B?SncrOWZrVEJUclhJZHg4Y1ZEcTU2VFdoeWpFYVdqVEhZdUVvNFFjZE56SlA2?=
 =?utf-8?B?eXk4TTF3WHNjY2RSVS9xRHNGc0lZbWo3MWw5cGpobjRLL0VnWXlSN0l5VlNv?=
 =?utf-8?B?WE9XbW5YTm1IQkRRa2tzWWlIYmRIczBWKzd4QnhJWjYzMTFHV01DTG1FditE?=
 =?utf-8?B?Z0l4Z0twTC9rM2FTdjJiNWdDb2cyckt0ZjRmZUVpVlFpNjZveXZ2YS9YN1Ay?=
 =?utf-8?B?UkNXZkp0U1plUEQ5UXNsN0xIRVg1OW5keHF5aG1aVlpGR0JOa1JxR2JQUXJ2?=
 =?utf-8?B?V2lRV0R4ZDg1L0N3M0JOL2dWS1dldjhyN0E3dnMxUjZET3FWK003cy9RZ3lr?=
 =?utf-8?B?cXZVaHJ4cjZ5VXI1Z2lKVjdqZEtKSmNKcWJuaXZpbFFZbHVzYksxaUFTelJQ?=
 =?utf-8?B?L3Q3a1NJeUJxYUd5MG1VSnpPU0FPSUYvWlNHendieEhybkRBd2VFRlJCTjll?=
 =?utf-8?B?QnJPdWZRaTArWW85eVBTK1dScnNmSGtlaWlHRGNwUi81UDA2b2I0WHE4RFN4?=
 =?utf-8?B?T2tiYlJBQndGbitzaVVITlVuRzJnb3Y5dnp3dStMVWZZa1cvM0xjekJJQUhX?=
 =?utf-8?B?U3k1aGtVOE9wSXZJMWgvMWk2Z3htcVRxdzJlcnpFUHJpdlBhSU1yaWFBOThQ?=
 =?utf-8?B?LzZRRnR4a0J3dGdLNXFYR3lWQ2pVUld1L1ZRZWxuSnVwSVFYM1E1ZjVudytm?=
 =?utf-8?B?Vm5UaFNHQ3BWZU9kVkp2UkR5NzBNWHpUZ2tVakw5aWhQQUVIMm5odElYYlBx?=
 =?utf-8?B?SGJsUGJhZVVtQUpQVks2M3Y1V0VwVENtMWFXd2J2WWJrZEdsYUFWOENPRDBa?=
 =?utf-8?B?bk4rZzlwWGE0S2RCQ3R3M1U0N3VCcEpsQ3JPMVg0YVRrTlgra1NXdlZXWHNk?=
 =?utf-8?B?UWdwV0kvRW1qcTJJVllHRUpJOFQrdnRyUlA0Yks5MVZZblRlSWUyNVlkWDNR?=
 =?utf-8?B?N2UrTnZqejExRnVOUk9mb2ltWlUvSlEvcEVuMXZQNEJKL0FuUHo1ZlZSQ3di?=
 =?utf-8?B?N2k4UDNwQzZPWXg5UzIxdnBhNTUwL2RZdzYzNXVhMkl5SElmMjd4QllkT3or?=
 =?utf-8?B?UzRkTjFvcVMra0FlRWFxc0hOYTJjRU81eFBvL0JqNzVOWGcwU29zU3E2M21G?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D3589A41150A04B8F7FC41A733207BC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5289.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a253f4-bf3d-4d20-112a-08dc977d0266
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 14:17:14.6457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peGeVkT9bpQMlxDkRG1aJ/POTD2tVWyMNTJtqfkmNoJiXoK56VAYQCh3l94L2vsf2HG44E7jlbNbiE+fJ1Z/i2LvXi7WdGPAEetQtpi9cYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5266

T24gMjguMDYuMjAyNCAxMTozMCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBGcmksIEp1biAyOCwgMjAyNCBh
dCAxMDowMuKAr0FNIEFuZHJlaSBTaW1pb24NCj4gPGFuZHJlaS5zaW1pb25AbWljcm9jaGlwLmNv
bT4gd3JvdGU6DQo+Pg0KPj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQG1p
Y3JvY2hpcC5jb20+DQo+Pg0KPj4gVGhlIEVFUFJPTXMgY291bGQgYmUgdXNlZCBvbmx5IGZvciBN
QUMgc3RvcmFnZS4gSW4gdGhpcyBjYXNlIHRoZQ0KPj4gRUVQUk9NIGFyZWFzIHdoZXJlIE1BQ3Mg
cmVzaWRlcyBjb3VsZCBiZSBtb2RlbGVkIGFzIE5WTUVNIGNlbGxzDQo+PiAoZGlyZWN0bHkgdmlh
IERUIGJpbmRpbmdzKSBzdWNoIHRoYXQgdGhlIGFscmVhZHkgYXZhaWxhYmxlIG5ldHdvcmtpbmcN
Cj4+IGluZnJhc3RydWN0dXJlIHRvIHJlYWQgcHJvcGVybHkgdGhlIE1BQyBhZGRyZXNzZXMgKHZp
YQ0KPj4gb2ZfZ2V0X21hY19hZGRyZXNzKCkpLiBUaGUgcHJldmlvdXNseSBhdmFpbGFibGUgY29t
cGF0aWJsZXMgbmVlZHMgdGhlDQo+PiBvZmZzZXQgYWRqdXN0bWVudCBwcm9iYWJseSBmb3IgY29t
cGF0aWJpbGl0eSB3LyBvbGQgRFQgYmluZGluZ3MuDQo+PiBBZGQgIm1pY3JvY2hpcCwyNGFhMDI1
ZTQ4IiwgIm1pY3JvY2hpcCwyNGFhMDI1ZTY0IiBjb21wYXRpYmxlIGZvciB0aGUNCj4+IHVzYWdl
IHcvIDI0QUEwMjVFezQ4LCA2NH0gdHlwZSBvZiBFRVBST01zIHdoZXJlICIyNGFhMDI1ZTQ4IiBz
dGFuZHMNCj4+IGZvciBFVUktNDggYWRkcmVzcyBhbmQgIjI0YWEwMjVlNjQiIHN0YW5kcyBmb3Ig
RVVJLTY0IGFkZHJlc3MuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2xhdWRpdSBCZXpuZWEgPGNs
YXVkaXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+DQo+PiBbYW5kcmVpLnNpbWlvbkBtaWNyb2NoaXAu
Y29tOiBBZGQgZXh0ZW5kZWQgbWFjcm9zIHRvIGluaXRpYWxpemUgdGhlIHN0cnVjdHVyZQ0KPj4g
d2l0aCBleHBsaWNpdCB2YWx1ZSB0byBhZGp1c3Rpbmcgb2Zmc2V0LiBBZGQgZXh0cmEgZGVzY3Jp
cHRpb24gZm9yIHRoZSBjb21taXQNCj4+IG1lc3NhZ2UuXQ0KPj4gU2lnbmVkLW9mZi1ieTogQW5k
cmVpIFNpbWlvbiA8YW5kcmVpLnNpbWlvbkBtaWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiB2MiAt
PiB2MzoNCj4+IC0gYWRkIHNwZWNpZmljIGNvbXBhdGlibGUgbmFtZXMgYWNjb3JkaW5nIHdpdGgN
Cj4+IGh0dHBzOi8vd3cxLm1pY3JvY2hpcC5jb20vZG93bmxvYWRzL2VuL0RldmljZURvYy8yNEFB
MDJFNDgtMjRBQTAyNUU0OC0yNEFBMDJFNjQtMjRBQTAyNUU2NC1EYXRhLVNoZWV0LTIwMDAyMTI0
SC5wZGYNCj4+IC0gYWRkIGV4dGVuZGVkIG1hY3JvcyB0byBpbml0aWFsaXplIHRoZSBzdHJ1Y3R1
cmUgd2l0aCBleHBsaWNpdCB2YWx1ZSBmb3IgYWRqb2ZmDQo+PiAtIGRyb3AgY28tZGV2ZWxvcGVk
LWJ5IHRvIG1haW50YWluIHRoZSBjb21taXQgaGlzdG9yeQ0KPj4gIChjaHJvbm9sb2dpY2FsIG9y
ZGVyIG9mIG1vZGlmaWNhdGlvbnMpDQo+Pg0KPj4gdjEgLT4gdjI6DQo+PiAtIG5vIGNoYW5nZQ0K
Pj4gLS0tDQo+PiAgZHJpdmVycy9taXNjL2VlcHJvbS9hdDI0LmMgfCAyOCArKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9lZXByb20vYXQy
NC5jIGIvZHJpdmVycy9taXNjL2VlcHJvbS9hdDI0LmMNCj4+IGluZGV4IDRiZDRmMzJiY2RhYi4u
ZTJhYzA4ZjY1NmNmIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9taXNjL2VlcHJvbS9hdDI0LmMN
Cj4+ICsrKyBiL2RyaXZlcnMvbWlzYy9lZXByb20vYXQyNC5jDQo+PiBAQCAtMTIxLDIwICsxMjEs
MjkgQEAgc3RydWN0IGF0MjRfY2hpcF9kYXRhIHsNCj4+ICAgICAgICAgdTMyIGJ5dGVfbGVuOw0K
Pj4gICAgICAgICB1OCBmbGFnczsNCj4+ICAgICAgICAgdTggYmFua19hZGRyX3NoaWZ0Ow0KPj4g
KyAgICAgICB1OCBhZGpvZmY7DQo+PiAgICAgICAgIHZvaWQgKCpyZWFkX3Bvc3QpKHVuc2lnbmVk
IGludCBvZmYsIGNoYXIgKmJ1Ziwgc2l6ZV90IGNvdW50KTsNCj4+ICB9Ow0KPj4NCj4+IC0jZGVm
aW5lIEFUMjRfQ0hJUF9EQVRBKF9uYW1lLCBfbGVuLCBfZmxhZ3MpICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwNCj4+ICsjZGVmaW5lIEFUMjRfQ0hJUF9EQVRBX0FPKF9uYW1lLCBfbGVuLCBf
ZmxhZ3MsIF9hbykgICAgICAgICAgICAgICAgICAgIFwNCj4gDQo+IFBsZWFzZSwgZG9uJ3QgdHJ5
IHRvIHNhdmUgc3BhY2Ugb24gYSBmZXcgbGV0dGVycywgY2FsbCBpdA0KPiBBVDI0X0NISVBfREFU
QV9BREpPRkYoKSBmb3IgYmV0dGVyIHJlYWRhYmlsaXR5Lg0KPg0KDQpJIHdpbGwgY2hhbmdlIGlu
IG5leHQgdGhlIHZlcnNpb24uDQoNCj4+ICAgICAgICAgc3RhdGljIGNvbnN0IHN0cnVjdCBhdDI0
X2NoaXBfZGF0YSBfbmFtZSA9IHsgICAgICAgICAgICAgICAgICAgIFwNCj4+ICAgICAgICAgICAg
ICAgICAuYnl0ZV9sZW4gPSBfbGVuLCAuZmxhZ3MgPSBfZmxhZ3MsICAgICAgICAgICAgICAgICAg
ICAgIFwNCj4+ICsgICAgICAgICAgICAgICAuYWRqb2ZmID0gX2FvICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+ICAgICAgICAgfQ0KPj4NCj4+IC0jZGVmaW5l
IEFUMjRfQ0hJUF9EQVRBX0NCKF9uYW1lLCBfbGVuLCBfZmxhZ3MsIF9yZWFkX3Bvc3QpICAgICAg
ICAgICAgIFwNCj4+ICsjZGVmaW5lIEFUMjRfQ0hJUF9EQVRBKF9uYW1lLCBfbGVuLCBfZmxhZ3Mp
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+ICsgICAgICAgQVQyNF9DSElQX0RBVEFf
QU8oX25hbWUsIF9sZW4sIF9mbGFncywgMCkNCj4+ICsNCj4+ICsjZGVmaW5lIEFUMjRfQ0hJUF9E
QVRBX0NCX0FPKF9uYW1lLCBfbGVuLCBfZmxhZ3MsIF9hbywgX3JlYWRfcG9zdCkgICAgIFwNCj4+
ICAgICAgICAgc3RhdGljIGNvbnN0IHN0cnVjdCBhdDI0X2NoaXBfZGF0YSBfbmFtZSA9IHsgICAg
ICAgICAgICAgICAgICAgIFwNCj4+ICAgICAgICAgICAgICAgICAuYnl0ZV9sZW4gPSBfbGVuLCAu
ZmxhZ3MgPSBfZmxhZ3MsICAgICAgICAgICAgICAgICAgICAgIFwNCj4+ICsgICAgICAgICAgICAg
ICAuYWRqb2ZmID0gX2FvLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwNCj4+ICAgICAgICAgICAgICAgICAucmVhZF9wb3N0ID0gX3JlYWRfcG9zdCwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwNCj4+ICAgICAgICAgfQ0KPj4NCj4+ICsjZGVmaW5lIEFU
MjRfQ0hJUF9EQVRBX0NCKF9uYW1lLCBfbGVuLCBfZmxhZ3MsIF9yZWFkX3Bvc3QpICAgICAgICAg
ICAgIFwNCj4+ICsgICAgICAgQVQyNF9DSElQX0RBVEFfQ0JfQU8oX25hbWUsIF9sZW4sIF9mbGFn
cywgMCwgX3JlYWRfcG9zdCkNCj4+ICsNCj4+ICAjZGVmaW5lIEFUMjRfQ0hJUF9EQVRBX0JTKF9u
YW1lLCBfbGVuLCBfZmxhZ3MsIF9iYW5rX2FkZHJfc2hpZnQpICAgICAgIFwNCj4+ICAgICAgICAg
c3RhdGljIGNvbnN0IHN0cnVjdCBhdDI0X2NoaXBfZGF0YSBfbmFtZSA9IHsgICAgICAgICAgICAg
ICAgICAgIFwNCj4+ICAgICAgICAgICAgICAgICAuYnl0ZV9sZW4gPSBfbGVuLCAuZmxhZ3MgPSBf
ZmxhZ3MsICAgICAgICAgICAgICAgICAgICAgIFwNCj4+IEBAIC0xNzAsOSArMTc5LDEzIEBAIEFU
MjRfQ0hJUF9EQVRBKGF0MjRfZGF0YV8yNGNzMDEsIDE2LA0KPj4gIEFUMjRfQ0hJUF9EQVRBKGF0
MjRfZGF0YV8yNGMwMiwgMjA0OCAvIDgsIDApOw0KPj4gIEFUMjRfQ0hJUF9EQVRBKGF0MjRfZGF0
YV8yNGNzMDIsIDE2LA0KPj4gICAgICAgICBBVDI0X0ZMQUdfU0VSSUFMIHwgQVQyNF9GTEFHX1JF
QURPTkxZKTsNCj4+IC1BVDI0X0NISVBfREFUQShhdDI0X2RhdGFfMjRtYWM0MDIsIDQ4IC8gOCwN
Cj4+ICtBVDI0X0NISVBfREFUQV9BTyhhdDI0X2RhdGFfMjRtYWM0MDIsIDQ4IC8gOCwNCj4+ICsg
ICAgICAgQVQyNF9GTEFHX01BQyB8IEFUMjRfRkxBR19SRUFET05MWSwgMSk7DQo+IA0KPiBBbmQg
dGhpcyB3aWxsIG5vdCBicmVhayBleGlzdGluZyB1c2Vycz8gSSBndWVzcyB5b3UgcmVmZXIgdG8g
dGhlc2UNCj4gY2hhbmdlcyBpbiB5b3VyIGNvbW1pdCBtZXNzYWdlIGJ1dCBpdCdzIG5vdCB2ZXJ5
IGNsZWFyIHdoYXQgeW91J3JlDQo+IGRvaW5nIGFuZCB3aHkuDQo+IA0KDQpGb3IgdGhvc2UgdHlw
ZXMgb2YgZWVwcm9tIDI0QUEwMjVFezQ4LCA2NH0gYWRqdXN0aW5nIG9mZnNldCBpcyBub3QgcmVx
dWlyZWQgKGF0MjRfZ2V0X29mZnNldF9hZGooKSkuDQpTbywgaW5kZWVkLCBpdCBpcyBhbiBlbnRh
bmdsZW1lbnQgaW4gbG9naWMuDQpUbyBrZWVwIHRoZSBpbXBsZW1lbnRhdGlvbiBhcyBpdCBpczog
DQphZGpvZmYgKHdoaWNoIGlzIGEgZmxhZyB0aGF0IGluZGljYXRlcyB3aGVuIHRvIHVzZSB0aGUg
YWRqdXN0aW5nIG9mZnNldCkgbmVlZHMgdG8gYmUgMSBmb3Igb2xkIGNvbXBhdGlibGVzIGJ1dCBm
b3IgdGhlc2UgbmV3IG9uZXMgbmVlZHMgdG8gYmUgMC4gDQoNCkkgdGhpbmsgdGhhdCBpcyBlbm91
Z2ggbm90IHRvIGJyZWFrIHRoZSBleGlzdGluZyB1c2Vycy4gV2hhdCBhcmUgeW91ciB0aG91Z2h0
cz8NCg0KQmVzdCBSZWdhcmRzLA0KQW5kcmVpIFNpbWlvbg0KDQo+PiArQVQyNF9DSElQX0RBVEFf
QU8oYXQyNF9kYXRhXzI0bWFjNjAyLCA2NCAvIDgsDQo+PiArICAgICAgIEFUMjRfRkxBR19NQUMg
fCBBVDI0X0ZMQUdfUkVBRE9OTFksIDEpOw0KPj4gK0FUMjRfQ0hJUF9EQVRBKGF0MjRfZGF0YV8y
NGFhMDI1ZTQ4LCA0OCAvIDgsDQo+PiAgICAgICAgIEFUMjRfRkxBR19NQUMgfCBBVDI0X0ZMQUdf
UkVBRE9OTFkpOw0KPj4gLUFUMjRfQ0hJUF9EQVRBKGF0MjRfZGF0YV8yNG1hYzYwMiwgNjQgLyA4
LA0KPj4gK0FUMjRfQ0hJUF9EQVRBKGF0MjRfZGF0YV8yNGFhMDI1ZTY0LCA2NCAvIDgsDQo+PiAg
ICAgICAgIEFUMjRfRkxBR19NQUMgfCBBVDI0X0ZMQUdfUkVBRE9OTFkpOw0KPj4gIC8qIHNwZCBp
cyBhIDI0YzAyIGluIG1lbW9yeSBESU1NcyAqLw0KPj4gIEFUMjRfQ0hJUF9EQVRBKGF0MjRfZGF0
YV9zcGQsIDIwNDggLyA4LA0KPj4gQEAgLTIxOCw2ICsyMzEsOCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGkyY19kZXZpY2VfaWQgYXQyNF9pZHNbXSA9IHsNCj4+ICAgICAgICAgeyAiMjRjczAyIiwg
ICAgIChrZXJuZWxfdWxvbmdfdCkmYXQyNF9kYXRhXzI0Y3MwMiB9LA0KPj4gICAgICAgICB7ICIy
NG1hYzQwMiIsICAgKGtlcm5lbF91bG9uZ190KSZhdDI0X2RhdGFfMjRtYWM0MDIgfSwNCj4+ICAg
ICAgICAgeyAiMjRtYWM2MDIiLCAgIChrZXJuZWxfdWxvbmdfdCkmYXQyNF9kYXRhXzI0bWFjNjAy
IH0sDQo+PiArICAgICAgIHsgIjI0YWEwMjVlNDgiLCAoa2VybmVsX3Vsb25nX3QpJmF0MjRfZGF0
YV8yNGFhMDI1ZTQ4IH0sDQo+PiArICAgICAgIHsgIjI0YWEwMjVlNjQiLCAoa2VybmVsX3Vsb25n
X3QpJmF0MjRfZGF0YV8yNGFhMDI1ZTY0IH0sDQo+PiAgICAgICAgIHsgInNwZCIsICAgICAgICAo
a2VybmVsX3Vsb25nX3QpJmF0MjRfZGF0YV9zcGQgfSwNCj4+ICAgICAgICAgeyAiMjRjMDItdmFp
byIsIChrZXJuZWxfdWxvbmdfdCkmYXQyNF9kYXRhXzI0YzAyX3ZhaW8gfSwNCj4+ICAgICAgICAg
eyAiMjRjMDQiLCAgICAgIChrZXJuZWxfdWxvbmdfdCkmYXQyNF9kYXRhXzI0YzA0IH0sDQo+PiBA
QCAtMjcwLDYgKzI4NSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIF9fbWF5
YmVfdW51c2VkIGF0MjRfb2ZfbWF0Y2hbXSA9IHsNCj4+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9
ICJhdG1lbCwyNGMxMDI0IiwgICAgICAgIC5kYXRhID0gJmF0MjRfZGF0YV8yNGMxMDI0IH0sDQo+
PiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAiYXRtZWwsMjRjMTAyNSIsICAgICAgICAuZGF0YSA9
ICZhdDI0X2RhdGFfMjRjMTAyNSB9LA0KPj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gImF0bWVs
LDI0YzIwNDgiLCAgICAgICAgLmRhdGEgPSAmYXQyNF9kYXRhXzI0YzIwNDggfSwNCj4+ICsgICAg
ICAgeyAuY29tcGF0aWJsZSA9ICJtaWNyb2NoaXAsMjRhYTAyNWU0OCIsIC5kYXRhID0gJmF0MjRf
ZGF0YV8yNGFhMDI1ZTQ4IH0sDQo+PiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWljcm9jaGlw
LDI0YWEwMjVlNjQiLCAuZGF0YSA9ICZhdDI0X2RhdGFfMjRhYTAyNWU2NCB9LA0KPj4gICAgICAg
ICB7IC8qIEVORCBPRiBMSVNUICovIH0sDQo+PiAgfTsNCj4+ICBNT0RVTEVfREVWSUNFX1RBQkxF
KG9mLCBhdDI0X29mX21hdGNoKTsNCj4+IEBAIC02OTAsNyArNzA3LDggQEAgc3RhdGljIGludCBh
dDI0X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+PiAgICAgICAgIGF0MjQtPnJl
YWRfcG9zdCA9IGNkYXRhLT5yZWFkX3Bvc3Q7DQo+PiAgICAgICAgIGF0MjQtPmJhbmtfYWRkcl9z
aGlmdCA9IGNkYXRhLT5iYW5rX2FkZHJfc2hpZnQ7DQo+PiAgICAgICAgIGF0MjQtPm51bV9hZGRy
ZXNzZXMgPSBudW1fYWRkcmVzc2VzOw0KPj4gLSAgICAgICBhdDI0LT5vZmZzZXRfYWRqID0gYXQy
NF9nZXRfb2Zmc2V0X2FkaihmbGFncywgYnl0ZV9sZW4pOw0KPj4gKyAgICAgICBhdDI0LT5vZmZz
ZXRfYWRqID0gY2RhdGEtPmFkam9mZiA/DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGF0MjRfZ2V0X29mZnNldF9hZGooZmxhZ3MsIGJ5dGVfbGVuKSA6IDA7DQo+PiAgICAgICAg
IGF0MjQtPmNsaWVudF9yZWdtYXBzWzBdID0gcmVnbWFwOw0KPj4NCj4+ICAgICAgICAgYXQyNC0+
dmNjX3JlZyA9IGRldm1fcmVndWxhdG9yX2dldChkZXYsICJ2Y2MiKTsNCj4+IC0tDQo+PiAyLjM0
LjENCj4+DQo+IA0KPiBCYXJ0DQo=

