Return-Path: <linux-i2c+bounces-3611-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B358CA8E1
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 09:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CE6A282140
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 07:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AE34F897;
	Tue, 21 May 2024 07:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.b="qui6FMMl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2124.outbound.protection.outlook.com [40.107.22.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B45179BD;
	Tue, 21 May 2024 07:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716276253; cv=fail; b=BNQtAuOrEOQ9ZgEPiDbYFHb1fzmZIgfDrsI4khfYXYhurqa2kknHfCMxSMVzP4s+IC2CyFIY5iP0gD7pcG3tj7BGhvppYM4MCLgprSt/+eOGJbtGAuzVeKhUuJIDbuyo3wHmjc/xTHyfUfmOIvFnTf4hKUvHF32hFKNZwqTROiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716276253; c=relaxed/simple;
	bh=EvVJ481EuhV8K+ibC5OhCNIk4hWMWyBNam9CEhUdusM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SkSQvdLUlB4f7FpvI5l6vVgY2m3J4fAoR3sEp2bvzO0VDxqfCIr/1fbT5pYwHngHYRdchhafDqOLSsNihU3+xi5BRGRDdjOPtj2PmDCME33+gYjDLm53W6B2AudX/+bojoj55mlWZwopUVyzN2zqtYoXOaRkGnih+5VEu/Aa20I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bang-olufsen.dk; spf=pass smtp.mailfrom=bang-olufsen.dk; dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.b=qui6FMMl; arc=fail smtp.client-ip=40.107.22.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bang-olufsen.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bang-olufsen.dk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fB+uPhijk0u6QjEBcWGXGT1wTe0oik2lwJ/s+kQAMYZ0pWr4nd2bLuhFZyouPoMNmUbmnK1z2mXObvMSpo7q0kJZAGvgVmj4sh7K5/arcSNRLpzn6gpS89mTejH5f+rt/3qI6FBQjsH3LhArBcICjj/DJD58FEX11rkJ4cUtkW0iUkASZqpSzu6qQfhLav86vrehjgOMG9jK3V0NWgB+5fnh1merOGmGW5PpGxgZ5fXMthTnA5g4FpbJTtWjOZW81qnPQcEGO98gFO/NmPqyMgT/ZT8ev5lCe5v+iGF06uaEmWwITl+9TMd6iZFvla2PGR6PSqWwEXL7s0N9vKS0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvVJ481EuhV8K+ibC5OhCNIk4hWMWyBNam9CEhUdusM=;
 b=M5ASWhZ0+Vsy/SIZTwPVxP8bwJggpGEL9ejR66h9/1euBizCFWmFRGwlWIqU0CdSHfUbIWmGGMwhx5NJY0Gh9U8fc8HM/jIDJqVIluqSHrD7mcShfnDuUdR63n/tLiZ0iv+e2O5I2xw3rKF3DDmtuQ8GYWTVhhU4VHsD+GkP6UqlAr2KCH1zwNcGNhQv+kQNGs3r0d90EtskyRB/hNVzWlvhnm8cTkWo+MJ4UsPtVwwCVH4+Wab90O1rdWJFMHhGQD5VyBIQNJkDI/runy6ra8JmE5WHf51VQ3UeS5eEKJG/Z0IyGVldL682j0X2asigxWjjRk28zcaSnX0S2AqfHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvVJ481EuhV8K+ibC5OhCNIk4hWMWyBNam9CEhUdusM=;
 b=qui6FMMlRUlXwHaVdbr/WTQkU1++Xvd0CYpoaxhXm0h/eEO4KWUJ3yjmVWLZLOod2I0S7SxxXiNmLJ/PI1kMExBwiAL4DoBNEkBI99dCkUu3JwL03sJ7jECfnJF7OG1tO8MJ3oS8RLK9K8bpuLL474fPUXham2Gvy9/jmHMSROc=
Received: from AS8PR03MB8805.eurprd03.prod.outlook.com (2603:10a6:20b:53e::20)
 by GVXPR03MB8379.eurprd03.prod.outlook.com (2603:10a6:150:7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17; Tue, 21 May
 2024 07:24:05 +0000
Received: from AS8PR03MB8805.eurprd03.prod.outlook.com
 ([fe80::6ac3:b09a:9885:d014]) by AS8PR03MB8805.eurprd03.prod.outlook.com
 ([fe80::6ac3:b09a:9885:d014%5]) with mapi id 15.20.7611.013; Tue, 21 May 2024
 07:24:05 +0000
From: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <alvin@pqrs.dk>, Mark Brown
	<broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi Shyti
	<andi.shyti@kernel.org>, Saravana Kannan <saravanak@google.com>, Emil
 Abildgaard Svendsen <EMAS@bang-olufsen.dk>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 03/13] dt-bindings: a2b: Analog Devices AD24xx devices
Thread-Topic: [PATCH 03/13] dt-bindings: a2b: Analog Devices AD24xx devices
Thread-Index: AQHaqFn5LB1CHBilT0+Mh47L2WyK6LGecfmAgALdCgA=
Date: Tue, 21 May 2024 07:24:05 +0000
Message-ID: <of6lnkarmtgxg7mhi7ofkfu6obhohkl3gpfycctpyty5dhx4qx@2nxwt3btybdi>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
 <20240517-a2b-v1-3-b8647554c67b@bang-olufsen.dk>
 <f1605873-c36c-4e61-8076-13a7094dc13b@kernel.org>
In-Reply-To: <f1605873-c36c-4e61-8076-13a7094dc13b@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB8805:EE_|GVXPR03MB8379:EE_
x-ms-office365-filtering-correlation-id: 9399c95c-4460-492d-f9d7-08dc7966ff00
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|376005|1800799015|7416005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?Nkl3MWs2RWFYRXpSaEJRSFdpMTh6UXVpdkllKytNSzBXdzZGMnlBYXk3emFE?=
 =?utf-8?B?dVUrSU1CdXBrQnRlNGZOTUxOK2orYmFua09DYlZzT3FkdWRydnpYdHBCRzNF?=
 =?utf-8?B?UitESHlIRlUwOU1nbnZFZi9IVEl0S0E2ZW5NSHFLcXNiVTc3RStZYjhQeUQr?=
 =?utf-8?B?RWI3dWN4MXYyMmc3MXFYTTJOZnFORGRpZ0xIelUrWTFSQ1hkRWlIQk5KVlF5?=
 =?utf-8?B?QXd5VXluY0FvRU9NNk8wNVBjcVB4Z3djS0F2S2dLR0F6YUlkR0JWa2RJSUhG?=
 =?utf-8?B?Rnp0OTY5T0VST2YxSlRnT1ZMUGVZbW1FSDNPTE95amVrWURhMFQ3UWZGTXlB?=
 =?utf-8?B?Uk92anlNYklIVHhvTEIzUFZ4V0lLV0U3cy9sQ3l5U3p6WHkyWnNVY2lYMWNu?=
 =?utf-8?B?MTcwQ2c3c09sQnl6eHYxT1B1TUI1cEZ3SlI2OUNjRWNqTTQxcVNGUEZkYjhv?=
 =?utf-8?B?U0RIQ3IyYkxZY0QrVUd6UWZEWTVRSTNGVHhQWW9PTzdIRHBkdDRpV3NrMUJl?=
 =?utf-8?B?Zy9xVFpzV2ZTaGE4eWJlMjlULzFUMXp0YmZMb2k4NUFDdTdxTWpIWEJmWkFG?=
 =?utf-8?B?UXg5RUlvbStSRmVwckpNZ1gwaFJBUHl0cndKMHQvc3RIblVhcnozZUQ3RnM4?=
 =?utf-8?B?MjdsR0FwMmJVQzZ2Z1JMeE1JczN1SkpUZzRmRXRKZkI1bWF2MnNDQjg3VDhJ?=
 =?utf-8?B?cDdsNmlKK1lVbittQ3dUT29JN001SlNoM3E1TXYwQXJSNFhtRmZLeDlYci9k?=
 =?utf-8?B?UXozejFKTnhSNkFJZktKeVduTXJTeE5ub0dzZXg3czdXbStzZ2pTQzFRUTRl?=
 =?utf-8?B?MmF6K1RQQWN2MkVBY2xHTXJjNUpTZUF0OFhhazhHdnVpcHNVQnhyNnBoU0NP?=
 =?utf-8?B?Si81b0hmVWtidSt6aVZxSytrbWltU3pud2tBT29CK3Q1R09YN0JTT1F3bmtD?=
 =?utf-8?B?NTd1RUk5RDFmbC9BVUQ3Z2hqSjljV1pKRGphcGVKLy9EcXVaQzRsMzZPbm91?=
 =?utf-8?B?MjVmMXpYZFdXWkdIOEc3Y21TL28yMzJtQVA3WVMvZ3VyWTBydVdZdlNkMnFk?=
 =?utf-8?B?ZXVORG4yZzU0QUJBNVBvYW0xTWJ0WDkwd3hMSUhpWkdGR0YyU3UzUzJNcXlp?=
 =?utf-8?B?dHFQdytqUFY1ZGJLaUFJcmxTdytURm5tdjVDeXJ5ZldRK2dyZHlJTUNEMkVO?=
 =?utf-8?B?RU5nQ00wd0lVWjc5Y3hYam5DdTZTbGdUUnZabEFKVVgvczFXOFY4WVNvVS9p?=
 =?utf-8?B?NTIzRVBCOWpNTHlCU2pIU2xtVkZEZXhXaE1RaFFWMi9WSEcvNWlScjZQSXNJ?=
 =?utf-8?B?bXQwNzBodmZ6N0wrMFMvSitFSGVyUlJ4UTRKSzNLL3pCeHY5MHNoWjEzNFVi?=
 =?utf-8?B?Tk5BQ1k1ODVOdmpQT3NLNE5OdSszM2dUaHh3dHd1dDZ2RS9tNUxWVm1ZbGtJ?=
 =?utf-8?B?aWZGZlkvWndhNTNDR3kwRnc1L2lnMkgxSXRjKzBSMTIyVVNUYXVPcG80VkN3?=
 =?utf-8?B?R2Fqcmt0b20zM29aOFVML1VOQVl5QStvblVRcStjY2EvdXV1RnA4aTE4OFdl?=
 =?utf-8?B?eGpvUGpIZGo2N3pCVzB4aGw3YUpSVU9oMDZsRzVNbFdzT29VWkxFUkJ4QkdR?=
 =?utf-8?B?YnA3MXZYSWZybTJ6Q2V5SkpMTnZ5OURGZGRsSnRCczAzR2lFeFcvRWQ3ckVI?=
 =?utf-8?B?clV2ZUdwTFpVRUEwcndwdzRhQVRRSnFYS241bDNSVFZlNG9wQ09VN2lBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8805.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZHF1a3psS1pKTFdwNUdkL2t1YUxaeThvdlVRM0JKcDBEZ095ZEIvQ3pUblVV?=
 =?utf-8?B?YWZ4NEFaamtjUU4wd0JndjRKRVNqWHAweVV4OWswTjdkZGlKRDdIaXd5d0Js?=
 =?utf-8?B?L0ZTdk1XNDhSUExPQ0pLUzRFcTYzeGFiU2RGcm5zOFpHNzFlSUhlL2NwU1cz?=
 =?utf-8?B?YmoxUXF2NzNmcXJoL2NKTnoxQkhFYWhNWjNiMzdRWmF1S2dvbS90TWk2enZ1?=
 =?utf-8?B?OThVZlFrVEpibTlTSnlzMFRjOHN3SzN4TGhWbEtObnp6ZFdsZ0FtRDNaanNZ?=
 =?utf-8?B?NHAwOE4zTmxJUDFCUVBvWktPc2w4Vm8rTy91RUJhM2hzWVNScjhsZlRvaVk0?=
 =?utf-8?B?WkJwUVFNZi84ZlYrWldDb3ZCTDNjbFF4N1N5YkdmaDF5YjYvR1pWZHFzTFli?=
 =?utf-8?B?aURCTXlwV2lvYURBNUtsRUFVWjdCcHJNT09zWGd5cVU0SC95STJ1SStaS2hS?=
 =?utf-8?B?V3ZMWWF6cE1VclE4cURMM3RyWVhNTTBWUzlxTEdFRTF1b1Uvb1lnaU41VWRl?=
 =?utf-8?B?VU13Q3JSWmRoYTdKTVZUZENJTXhETUNFQWdKa0dEQ1FQUHY3S2ZUdUNIdG5Q?=
 =?utf-8?B?UHk4TTZqN0xCblpDM093RlhlcVU0NUJCdGdOQ2FUYUEwOU94bnAwQmhiMUZN?=
 =?utf-8?B?blh5NXlPRG9iTHl1SjNvVVBxMTZMWWhROU5SY3NTdVRiZzJaNng1WEN5ZFIy?=
 =?utf-8?B?VVorcmxXU1AzYjBqd0RaM2FLd1JjSVdkY0FLVXZMSHN3bXpIUnNkQ2R3YkM3?=
 =?utf-8?B?cVhNR3F6dXhsemp2bG9xTHYweHdHRnZrQTA3WHVkYnJ5bWpQcHl2WEI0bFFh?=
 =?utf-8?B?WkY1Q2FiaDd6WjRXMnJ2Z0daKzE3T3l4Uk44NEZCK243OG5XMEhvNXU1SlNG?=
 =?utf-8?B?ZkN1YnZqK2NWcUFaeklvMlA1SE9UZVVadUJvYy9sN3dGUC9ZT1Z1aHkrTE5k?=
 =?utf-8?B?M1lEaWl3a0VOZGdDcDBnK2Ficyt4S2ttUWJ2aUdjbjl2V05NNXpJNnhlUHNn?=
 =?utf-8?B?ZUJCS2hydC8zYm5aME1nbFZ3MkdJMmZZdVd6V0NBTXZHTWIrV3NQWE12N0o0?=
 =?utf-8?B?T0tLOXM2cnVkWURlTTVGSW9WYU5JUU01UUl2Q0pLcm1DU1JSMGw2TXIrQ3Rr?=
 =?utf-8?B?RUkvcHRhcDMvcHZnVFF1RjVjT0dia1JVN0RGdVR6a2dXQlV4M2g3cTlrWFp4?=
 =?utf-8?B?NWtRczF3MDdtM3AwdHdRNG9YZWR6ZzBPbUdiL05uaVdFaUtLVHpRcU1lYWc0?=
 =?utf-8?B?KzF6VG5WVFRyRGNvb0MrZWVuS3lkcGxraHZzWW92dkFIV2RzNVJySml2b3Nm?=
 =?utf-8?B?UVpLSmxrUnZFT1hMdmcxU3V1UXZ5NUpDL0xRb2V0L2UzMlNJUXhlSmRtLzRN?=
 =?utf-8?B?Q3VWNXRlVldPRkVLVlpSK2xGK1lweXVta3A1ZUI5L1BNTnpmLzBqeEhvVVpT?=
 =?utf-8?B?TEswWUExN0kreXlxUTFhT0E1aVdneEZ1SHB0U3ErQTZkNXFOOHZhdWFtSmVN?=
 =?utf-8?B?U1VXTEdyZkVldklpSU43d0c4azNsaGxuRXpXMUhOL0hTMHVaYnlCdGJpQXla?=
 =?utf-8?B?ZHMxYWFCd0wyc1BSM1VRZHViUEtnQ3RrbkhmUURZVkpQbjY0NitzWis3dVdC?=
 =?utf-8?B?Vlk0T0R3UHBNa092YXNZTjNxZlpFVzQxSVFlekNPVmNxNCtpc0hVTkcvcXNP?=
 =?utf-8?B?eVdRL2tvL2Uyb0tTMGtZbzE2Yk5sVGNtejl4THlOUHVvbjIrU0duRmNOTS80?=
 =?utf-8?B?Q294MHVNaGRYRnZFRmN0UFBYTTdDL1FVYVVLKzNmZEZsSTJIcUxXYTlBbkJy?=
 =?utf-8?B?OU0vSFl5aGhyMkVLRlZDRjJiN2V1dVZMQ2orcHVydWpsOGxzbmNhQjVXUFNh?=
 =?utf-8?B?bmdCR2FwUVhKZytWMitLQnhFUWdGdjVDdGhZdUMyN2lSYmtRY0lvQ1VnM0hW?=
 =?utf-8?B?RThWR1BWdWlNZUVxaGpESUhZcmo0eHAyMVBnTDQyL0JPeTVkV1dHOFZ4dUw0?=
 =?utf-8?B?eXJTcVAzNGZndHU2TUlYTE13ak1TUFpsTlFnbHp1bE1uYXRlbS82T0o0QmtU?=
 =?utf-8?B?NzhNb0owUE03R0xRclFMdGdWYnJtWm0xK0ZKMFVobUNvemhCTUVjZEpwQkph?=
 =?utf-8?B?VDNkck5ad2swa3h6V2Z1T2VHVGwwRjZraC9VYVJDZWhNa2VmRFczOUlvT1pC?=
 =?utf-8?B?d0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <491CED10303BEC4EA7D2CA052D82AD49@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8805.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9399c95c-4460-492d-f9d7-08dc7966ff00
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 07:24:05.1608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8IvBc/UfC+UzoEdTJUP4+nV/1neGxXlQmYHzL+z4WH8CZmPJRU/7Bphvax6OUBd4qp5btJy/Y49CaNM9z3eCzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8379

T24gU3VuLCBNYXkgMTksIDIwMjQgYXQgMDE6NDA6MjVQTSBHTVQsIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6DQo+IE9uIDE3LzA1LzIwMjQgMTQ6NTgsIEFsdmluIMWgaXByYWdhIHdyb3RlOg0K
PiA+IEZyb206IEFsdmluIMWgaXByYWdhIDxhbHNpQGJhbmctb2x1ZnNlbi5kaz4NCj4gPiANCj4g
PiBBZGQgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBBRDI0eHggc2VyaWVzIEEyQiB0cmFu
c2NlaXZlciBjaGlwcywNCj4gPiBpbmNsdWRpbmcgdGhlaXIgZnVuY3Rpb25hbCBibG9ja3MuDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQWx2aW4gxaBpcHJhZ2EgPGFsc2lAYmFuZy1vbHVmc2Vu
LmRrPg0KPiA+IC0tLQ0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hMmIvYWRpLGFkMjR4
eC1jbGsueWFtbCAgICB8ICA1MyArKysrKw0KPiANCj4gV2hhdCBpcyBhMmIgYW5kIHdoeSBjbG9j
ayBiaW5kaW5ncyBhcmUgbm90IGluIGNsb2NrPw0KPiANCj4gPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYTJiL2FkaSxhZDI0eHgtY29kZWMueWFtbCAgfCAgNTIgKysrKysNCj4gPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYTJiL2FkaSxhZDI0eHgtZ3Bpby55YW1sICAgfCAgNzYgKysrKysr
Kw0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hMmIvYWRpLGFkMjR4eC1pMmMueWFtbCAg
ICB8ICA1NSArKysrKw0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hMmIvYWRpLGFkMjR4
eC55YW1sICAgICAgICB8IDI1MyArKysrKysrKysrKysrKysrKysrKysNCj4gDQo+IFNvcnJ5LCBh
bGwgdGhpcyBsb29rcyB3ZWlyZGx5IHBsYWNlZC4NCg0KQWxyaWdodCwgSSdsbCBtb3ZlIHRoZSBi
aW5kaW5ncyB0byB0aGVpciByZXNwZWN0aXZlIGRpcmVjdG9yaWVzLiBXYXNuJ3QNCnN1cmUgd2hh
dCBpcyBwcmVmZXJyZWQuDQoNCj4gDQo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgNDg5IGluc2VydGlv
bnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2EyYi9hZGksYWQyNHh4LWNsay55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2EyYi9hZGksYWQyNHh4LWNsay55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjgxOWVmYWE2YTNmOQ0KPiA+IC0tLSAvZGV2L251
bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYTJiL2FkaSxh
ZDI0eHgtY2xrLnlhbWwNCj4gPiBAQCAtMCwwICsxLDUzIEBADQo+ID4gKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPiA+ICslWUFNTCAx
LjINCj4gPiArLS0tDQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvYTJi
L2FkaSxhZDI0eHgtY2xrLnlhbWwNCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwNCj4gPiArDQo+ID4gK3RpdGxlOiBBbmFsb2cgRGV2aWNl
cyBJbmMuIEFEMjR4eCBjbG9jayBmdW5jdGlvbmFsIGJsb2NrDQo+ID4gKw0KPiA+ICttYWludGFp
bmVyczoNCj4gPiArICAtIEFsdmluIMWgaXByYWdhIDxhbHNpQGJhbmctb2x1ZnNlbi5kaz4NCj4g
PiArDQo+ID4gK2FsbE9mOg0KPiA+ICsgIC0gJHJlZjogL3NjaGVtYXMvY2xvY2svY2xvY2sueWFt
bA0KPiANCj4gRHJvcC4gVGhlcmUgaXMgbm8gc2luZ2xlIGJpbmRpbmcgZG9pbmcgdGhpcywgd2hp
Y2ggaXMgdXN1YWxseSBhIGhpbnQgeW91DQo+IGRvIHNvbWV0aGluZyBub3QgY29ycmVjdC4NCj4g
DQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBl
bnVtOg0KPiA+ICsgICAgICAtIGFkaSxhZDI0MjAtY2xrDQo+ID4gKyAgICAgIC0gYWRpLGFkMjQy
MS1jbGsNCj4gPiArICAgICAgLSBhZGksYWQyNDIyLWNsaw0KPiA+ICsgICAgICAtIGFkaSxhZDI0
MjUtY2xrDQo+ID4gKyAgICAgIC0gYWRpLGFkMjQyNi1jbGsNCj4gPiArICAgICAgLSBhZGksYWQy
NDI3LWNsaw0KPiA+ICsgICAgICAtIGFkaSxhZDI0MjgtY2xrDQo+ID4gKyAgICAgIC0gYWRpLGFk
MjQyOS1jbGsNCj4gPiArDQo+IA0KPiBUaGlzIGlzIGp1c3QgaW5jb21wbGV0ZS4gU2VlIG90aGVy
IGJpbmRpbmdzIGhvdyBjbG9jayBjb250cm9sbGVyIGlzIHdyaXR0ZW4uDQoNCk9LLCB3aWxsIHJl
dmlldy4NCg0KPiANCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAg
LSBjbG9jay1vdXRwdXQtbmFtZXMNCj4gPiArDQo+ID4gK3VuZXZhbHVhdGVkUHJvcGVydGllczog
ZmFsc2UNCj4gDQo+IGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KDQpPSw0KDQo+ID4gKw0K
PiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArICAgIGEyYiB7DQo+ID4gKyAgICAgICNh
ZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gDQo+
IE5vdCByZWxhdGVkLCBkcm9wIGVudGlyZSBub2RlLg0KDQpPSw0KDQo+IA0KPiA+ICsNCj4gPiAr
ICAgICAgbm9kZUAxIHsNCj4gPiArICAgICAgICBjb21wYXRpYmxlID0gImFkaSxhZDI0MjUtbm9k
ZSI7DQo+IA0KPiBOb3QgcmVsYXRlZCwgZHJvcCBlbnRpcmUgbm9kZS4NCg0KT0sNCg0KPiANCj4g
PiArICAgICAgICByZWcgPSA8MT47DQo+ID4gKyAgICAgICAgaW50ZXJydXB0cyA9IDwxPjsNCj4g
PiArICAgICAgICBhZGksdGRtLW1vZGUgPSA8MTY+Ow0KPiA+ICsgICAgICAgIGFkaSx0ZG0tc2xv
dC1zaXplID0gPDMyPjsNCj4gPiArDQo+ID4gKyAgICAgICAgY2xvY2sgew0KPiA+ICsgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJhZGksYWQyNDI1LWNsayI7DQo+ID4gKyAgICAgICAgICAjY2xvY2st
Y2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICBjbG9jay1pbmRpY2VzID0gPDE+Ow0KPiA+ICsg
ICAgICAgICAgY2xvY2stb3V0cHV0LW5hbWVzID0gIkEyQjEgQ0xLT1VUMiI7DQo+ID4gKyAgICAg
ICAgfTsNCj4gPiArICAgICAgfTsNCj4gPiArICAgIH07DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hMmIvYWRpLGFkMjR4eC1jb2RlYy55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2EyYi9hZGksYWQyNHh4LWNvZGVjLnlh
bWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZWVl
MTJmMWM4MTBlDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hMmIvYWRpLGFkMjR4eC1jb2RlYy55YW1sDQo+ID4gQEAgLTAsMCAr
MSw1MiBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9S
IEJTRC0yLUNsYXVzZSkNCj4gPiArJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2EyYi9hZGksYWQyNHh4LWNvZGVjLnlhbWwNCj4gPiAr
JHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwNCj4g
PiArDQo+ID4gK3RpdGxlOiBBbmFsb2cgRGV2aWNlcyBJbmMuIEFEMjR4eCBJMlMvVERNIGZ1bmN0
aW9uYWwgYmxvY2sNCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gQWx2aW4gxaBp
cHJhZ2EgPGFsc2lAYmFuZy1vbHVmc2VuLmRrPg0KPiA+ICsNCj4gPiArYWxsT2Y6DQo+ID4gKyAg
LSAkcmVmOiAvc2NoZW1hcy9zb3VuZC9kYWktY29tbW9uLnlhbWwjDQo+IA0KPiBXaHkgZnVsbCBw
YXRoPyBJdCdzIHRoZSBzYW1lIGRpcmVjdG9yeSwgaXNuJ3QgaXQ/DQoNCkluIHRoaXMgY2FzZSBu
bywgYnV0IHdoZW4gSSBtb3ZlIGl0IGludG8gc291bmQsIHllcy4gU28geW91ciBjb21tZW50IGlz
DQphY2tub3dsZWRnZWQgYW5kIHdpbGwgYmUgYWRkcmVzc2VkIGluIHYyLg0KDQo+IA0KPiA+ICsN
Cj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgZW51bToNCj4g
PiArICAgICAgLSBhZGksYWQyNDAzLWNvZGVjDQo+ID4gKyAgICAgIC0gYWRpLGFkMjQxMC1jb2Rl
Yw0KPiA+ICsgICAgICAtIGFkaSxhZDI0MjUtY29kZWMNCj4gPiArICAgICAgLSBhZGksYWQyNDI4
LWNvZGVjDQo+ID4gKyAgICAgIC0gYWRpLGFkMjQyOS1jb2RlYw0KPiA+ICsNCj4gPiArICAnI3Nv
dW5kLWRhaS1jZWxscyc6DQo+ID4gKyAgICBjb25zdDogMA0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6
DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSAnI3NvdW5kLWRhaS1jZWxscycNCj4gPiAr
DQo+ID4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1wbGVz
Og0KPiA+ICsgIC0gfA0KPiA+ICsgICAgYTJiIHsNCj4gPiArICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8MT47DQo+ID4gKyAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiA+ICsNCj4gPiArICAgICAg
bm9kZUAyIHsNCj4gPiArICAgICAgICBjb21wYXRpYmxlID0gImFkaSxhZDI0Mjgtbm9kZSI7DQo+
ID4gKyAgICAgICAgcmVnID0gPDI+Ow0KPiA+ICsgICAgICAgIGludGVycnVwdHMgPSA8Mj47DQo+
ID4gKyAgICAgICAgYWRpLHRkbS1tb2RlID0gPDg+Ow0KPiA+ICsgICAgICAgIGFkaSx0ZG0tc2xv
dC1zaXplID0gPDMyPjsNCj4gDQo+IFNhbWUgY29tbWVudHMuIExpbWl0ZWQgcmV2aWV3IGZvbGxv
d3MuDQoNCkFjaw0KDQo+IA0KPiANCj4gLi4uDQo+IA0KPiANCj4gPiArDQo+ID4gK3JlcXVpcmVk
Og0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsNCj4gPiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVz
OiBmYWxzZQ0KPiANCj4gU29ycnksIGJ1dCBub3QuIE5vIHJlc291cmNlcywgbm90aGluZyBoZXJl
LiBEbyBub3QgY3JlYXRlIGJpbmRpbmdzIGp1c3QNCj4gdG8gaW5zdGFudGlhdGUgZHJpdmVycy4N
Cg0KRG8geW91IG1lYW4gdGhhdCB0aGVyZSBpcyBubyBuZWVkIHRvIGludHJvZHVjZSBhIGJpbmRp
bmcgZm9yIHRoaXMgY29kZWMNCmlmIGl0IGhhcyB0aGUgc2FtZSBiaW5kaW5ncyBhcyBkYWktY29t
bW9uLnlhbWw/DQoNCkJhc2ljYWxseSB0aGF0IGlzIHRoZSBjYXNlLCBidXQgI3NvdW5kLWRhaS1j
ZWxscyBzaG91bGQgYmUgPDA+LiBJcyB0aGF0DQpub3QgZW5vdWdoPw0KDQpJIGFtIE9LIHRvIGp1
c3QgZHJvcCB0aGUgYmluZGluZyBpZiB5b3UgdGhpbmsgc28sIGJ1dCBJIHdvdWxkIHRoaW5rIHRo
YXQNCnRoZSBjb21wYXRpYmxlIHN0cmluZyBzaG91bGQgYmUgc29tZXdoZXJlIGluIHRoZSBiaW5k
aW5ncy4gQ291bGQgeW91DQpleHBsYWluIGEgbGl0dGxlIG1vcmUgd2hhdCB5b3UgbWVhbj8NCg0K
PiANCj4gDQo+IC4uLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2EyYi9hZGksYWQyNHh4LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYTJiL2FkaSxhZDI0eHgueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5kY2RhMTVlODAzMmENCj4gPiAtLS0gL2Rldi9udWxs
DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2EyYi9hZGksYWQy
NHh4LnlhbWwNCj4gPiBAQCAtMCwwICsxLDI1MyBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gPiArJVlBTUwgMS4yDQo+
ID4gKy0tLQ0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2EyYi9hZGks
YWQyNHh4LnlhbWwNCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2No
ZW1hcy9jb3JlLnlhbWwNCj4gPiArDQo+ID4gK3RpdGxlOiBBbmFsb2cgRGV2aWNlcyBJbmMuIEFE
MjR4eCBBdXRvbW90aXZlIEF1ZGlvIEJ1cyBBMkIgVHJhbnNjZWl2ZXINCj4gPiArDQo+ID4gK2Rl
c2NyaXB0aW9uOiB8DQo+ID4gKyAgQUQyNHh4IGNoaXBzIHByb3ZpZGUgQTJCIGJ1cyBmdW5jdGlv
bmFsaXR5IHRvZ2V0aGVyIHdpdGggc2V2ZXJhbCBwZXJpcGhlcmFsDQo+IA0KPiBXaGF0IGlzIEEy
Qj8NCg0KSSB3aWxsIGltcHJvdmUgdGhlIGRlc2NyaXB0aW9uIHBlciB5b3VyIHJldmlldyBjb21t
ZW50cy4NCg0KPiANCj4gPiArICBmdW5jdGlvbnMsIGluY2x1ZGluZyBHUElPLCBJMlMvVERNLCBh
biBJMkMgY29udHJvbGxlciBpbnRlcmZhY2UsIGFuZA0KPiA+ICsgIHByb2dyYW1tYWJsZSBjbG9j
ayBvdXRwdXRzLg0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBBbHZpbiDFoGlw
cmFnYSA8YWxzaUBiYW5nLW9sdWZzZW4uZGs+DQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+
ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBlbnVtOg0KPiA+ICsgICAgICAtIGFkaSxhZDI0MDMN
Cj4gPiArICAgICAgLSBhZGksYWQyNDEwDQo+ID4gKyAgICAgIC0gYWRpLGFkMjQyNQ0KPiA+ICsg
ICAgICAtIGFkaSxhZDI0MjgNCj4gPiArICAgICAgLSBhZGksYWQyNDI5DQo+ID4gKw0KPiANCj4g
cmVnOiBpcyBzZWNvbmQgcHJvcGVydHkuDQoNCkFjaw0KDQo+IA0KPiA+ICsgIHJlZy1uYW1lczoN
Cj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGNvbnN0OiBiYXNlDQo+ID4gKyAgICAgIC0g
Y29uc3Q6IGJ1cw0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAg
ICAgLSBkZXNjcmlwdGlvbjogTm9ybWFsIEkyQyBhZGRyZXNzIG9mIHRoZSBjaGlwDQo+ID4gKyAg
ICAgIC0gZGVzY3JpcHRpb246IEF1eGlsaWFyeSBCVVNfQUREUiBJMkMgYWRkcmVzcyBvZiB0aGUg
Y2hpcA0KPiA+ICsNCj4gPiArICAnI2FkZHJlc3MtY2VsbHMnOg0KPiA+ICsgICAgY29uc3Q6IDEN
Cj4gPiArDQo+ID4gKyAgJyNzaXplLWNlbGxzJzoNCj4gPiArICAgIGNvbnN0OiAwDQo+ID4gKw0K
PiA+ICsgIGNsb2NrLW5hbWVzOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gY29uc3Q6
IHN5bmMNCj4gDQo+IEFnYWluIG1pc29yZGVyZWQuIC1uYW1lcyBhbHdheXMgZm9sbG93IG1haW4g
ZW50cnkuIEFueXdheSwgY2xvY2stbmFtZXMNCj4gZm9yIGp1c3Qgb25lIGVudHJ5IGlzIG5vdCBy
ZWFsbHkgdXNlZnVsLg0KDQpBY2sNCg0KPiANCj4gPiArDQo+ID4gKyAgY2xvY2tzOg0KPiA+ICsg
ICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IFNZTkMgaW5wdXQgcGluIGNsb2Nr
IHNvdXJjZQ0KPiA+ICsNCj4gPiArICB2aW4tc3VwcGx5Og0KPiA+ICsgICAgZGVzY3JpcHRpb246
IE9wdGlvbmFsIHJlZ3VsYXRvciBmb3Igc3VwcGx5IHZvbHRhZ2UgdG8gVklOIHBpbg0KPiA+ICsN
Cj4gPiArICBidXMtc3VwcGx5Og0KPiA+ICsgICAgZGVzY3JpcHRpb246IE9wdGlvbmFsIHJlZ3Vs
YXRvciBmb3Igb3V0LW9mLWJhbmQgc3VwcGx5IHZvbHRhZ2UgdG8NCj4gPiArICAgICAgc3Vib2Ry
aW5hdGUgbm9kZXMnIFZJTiBwaW5zDQo+ID4gKw0KPiA+ICsgIGludGVycnVwdHM6IHRydWUNCj4g
DQo+ID8/PyBUaGlzIG11c3QgYmUgc3BlY2lmaWMuDQoNClJpZ2h0LCBpdCBzaG91bGQgYmU6DQoN
Cm1heEl0ZW1zOiAxDQoNClRoYXQncyBzcGVjaWZpYywgcmlnaHQ/DQoNCj4gDQo+ID4gKw0KPiA+
ICsgIGludGVycnVwdC1jb250cm9sbGVyOiB0cnVlDQo+ID4gKw0KPiA+ICsgICcjaW50ZXJydXB0
LWNlbGxzJzoNCj4gPiArICAgIGNvbnN0OiAxDQo+ID4gKw0KPiA+ICtwYXR0ZXJuUHJvcGVydGll
czoNCj4gPiArICAnXm5vZGVAWzAtOV0rJCc6DQo+ID4gKyAgICB0eXBlOiBvYmplY3QNCj4gPiAr
ICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4gDQo+IFdoeT8gVGhpcyBtdXN0IGJl
IGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZSwgb3IgSSBtaXNzIHNvbWV0aGluZy4uLg0KDQpJ
IHRoaW5rIHlvdSBhcmUgcmlnaHQsIGJ1dCBJIHdpbGwgcmV2aWV3IHRoaXMgYmVmb3JlIHNlbmRp
bmcgdjIuIFRoYW5rcy4NCg0KPiANCj4gPiArDQo+ID4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+ICsg
ICAgICBjb21wYXRpYmxlOg0KPiA+ICsgICAgICAgIGVudW06DQo+ID4gKyAgICAgICAgICAtIGFk
aSxhZDI0MDEtbm9kZQ0KPiA+ICsgICAgICAgICAgLSBhZGksYWQyNDAyLW5vZGUNCj4gPiArICAg
ICAgICAgIC0gYWRpLGFkMjQwMy1ub2RlDQo+ID4gKyAgICAgICAgICAtIGFkaSxhZDI0MTAtbm9k
ZQ0KPiA+ICsgICAgICAgICAgLSBhZGksYWQyNDIwLW5vZGUNCj4gPiArICAgICAgICAgIC0gYWRp
LGFkMjQyMS1ub2RlDQo+ID4gKyAgICAgICAgICAtIGFkaSxhZDI0MjItbm9kZQ0KPiA+ICsgICAg
ICAgICAgLSBhZGksYWQyNDI1LW5vZGUNCj4gPiArICAgICAgICAgIC0gYWRpLGFkMjQyNi1ub2Rl
DQo+ID4gKyAgICAgICAgICAtIGFkaSxhZDI0Mjctbm9kZQ0KPiA+ICsgICAgICAgICAgLSBhZGks
YWQyNDI4LW5vZGUNCj4gPiArICAgICAgICAgIC0gYWRpLGFkMjQyOS1ub2RlDQo+ID4gKw0KPiA+
ICsgICAgICByZWc6DQo+ID4gKyAgICAgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgICAg
IGludGVycnVwdHM6DQo+ID4gKyAgICAgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgICAg
IGludGVycnVwdC1jb250cm9sbGVyOiB0cnVlDQo+ID4gKw0KPiA+ICsgICAgICAnI2ludGVycnVw
dC1jZWxscyc6DQo+ID4gKyAgICAgICAgY29uc3Q6IDENCj4gPiArDQo+ID4gKyAgICAgIGdwaW86
DQo+ID4gKyAgICAgICAgJHJlZjogYWRpLGFkMjR4eC1ncGlvLnlhbWwjDQo+ID4gKw0KPiA+ICsg
ICAgICBjb2RlYzoNCj4gPiArICAgICAgICAkcmVmOiBhZGksYWQyNHh4LWNvZGVjLnlhbWwjDQo+
ID4gKw0KPiA+ICsgICAgICBpMmM6DQo+ID4gKyAgICAgICAgJHJlZjogYWRpLGFkMjR4eC1pMmMu
eWFtbCMNCj4gPiArDQo+ID4gKyAgICAgIGNsb2NrOg0KPiA+ICsgICAgICAgICRyZWY6IGFkaSxh
ZDI0eHgtY2xrLnlhbWwjDQo+ID4gKw0KPiA+ICsgICAgICBhZGksdGRtLW1vZGU6DQo+ID4gKyAg
ICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+ID4g
KyAgICAgICAgZGVzY3JpcHRpb246IFRETSBtb2RlDQo+IA0KPiBQbGVhc2UgZG8gbm90IGFkZCBk
ZXNjcmlwdGlvbnMgd2hpY2ggYXJlIGNvcGllcyBvZiBwcm9wZXJ0eSBuYW1lLiBZb3UNCj4gYmFz
aWNhbGx5IHNhaWQgWkVSTyBoZXJlLiBTYXkgc29tZXRoaW5nIHVzZWZ1bC4uLg0KDQpBY2sNCg0K
PiANCj4gPiArICAgICAgICBlbnVtOiBbMiwgNCwgOCwgMTIsIDE2LCAyMCwgMjQsIDMyXQ0KPiA+
ICsNCj4gPiArICAgICAgYWRpLHRkbS1zbG90LXNpemU6DQo+ID4gKyAgICAgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+ID4gKyAgICAgICAgZGVzY3Jp
cHRpb246IFRETSBzbG90IHNpemUNCj4gPiArICAgICAgICBlbnVtOiBbMTYsIDMyXQ0KPiA+ICsN
Cj4gPiArICAgICAgYWRpLGludmVydC1zeW5jOg0KPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBG
YWxsaW5nIGVkZ2Ugb2YgU1lOQyBwaW4gaW5kaWNhdGVzIHRoZSBzdGFydCBvZiBhbiBhdWRpbw0K
PiA+ICsgICAgICAgICAgZnJhbWUsIGFzIG9wcG9zZWQgdG8gcmlzaW5nIGVkZ2UuDQo+ID4gKyAg
ICAgICAgdHlwZTogYm9vbGVhbg0KPiA+ICsNCj4gPiArICAgICAgYWRpLGVhcmx5LXN5bmM6DQo+
ID4gKyAgICAgICAgZGVzY3JpcHRpb246IFRoZSBTWU5DIHBpbiBjaGFuZ2VzIG9uZSBjeWNsZSBi
ZWZvcmUgdGhlIE1TQiBvZiB0aGUgZmlyc3QNCj4gPiArICAgICAgICAgIGRhdGEgc2xvdC4NCj4g
PiArICAgICAgICB0eXBlOiBib29sZWFuDQo+ID4gKw0KPiA+ICsgICAgICBhZGksYWx0ZXJuYXRp
bmctc3luYzoNCj4gPiArICAgICAgICBkZXNjcmlwdGlvbjogRHJpdmUgU1lOQyBwaW4gZHVyaW5n
IGZpcnN0IGhhbGYgb2YgSTJTL1RETSBkYXRhDQo+ID4gKyAgICAgICAgICB0cmFuc21pc3Npb24g
cmF0aGVyIHRoYW4ganVzdCBwdWxzaW5nIGl0IGZvciBvbmNlIGN5Y2xlLg0KPiA+ICsgICAgICAg
IHR5cGU6IGJvb2xlYW4NCj4gPiArDQo+ID4gKyAgICAgIGFkaSxyeC1vbi1kdHgxOg0KPiA+ICsg
ICAgICAgIGRlc2NyaXB0aW9uOiBVc2UgdGhlIERUWDEgcGluIGZvciBJMlMvVERNIFJYIGluIHBs
YWNlIG9mIHRoZSBEUlgxIHBpbi4NCj4gPiArICAgICAgICB0eXBlOiBib29sZWFuDQo+ID4gKw0K
PiA+ICsgICAgICBhZGksYTJiLWV4dGVybmFsLXN3aXRjaC1tb2RlLTE6DQo+ID4gKyAgICAgICAg
ZGVzY3JpcHRpb246IFVzZSBleHRlcm5hbCBzd2l0Y2ggbW9kZSAxIGluc3RlYWQgb2YgMCBvbiB0
aGUgYXNzdW1wdGlvbg0KPiA+ICsgICAgICAgICAgdGhhdCB0aGUgZG93bnN0cmVhbSBub2RlIGlz
IG5vdCB1c2luZyBBMkIgYnVzIHBvd2VyLg0KPiA+ICsgICAgICAgIHR5cGU6IGJvb2xlYW4NCj4g
PiArDQo+ID4gKyAgICAgIGFkaSxkcml2ZS1zdHJlbmd0aDoNCj4gPiArICAgICAgICAkcmVmOiAv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4gPiArICAgICAgICBkZXNj
cmlwdGlvbjogQ29uZmlndXJlcyBkcml2ZSBzdHJlbmd0aCBsb3cgKDApIG9yIGhpZ2ggKDEsIGRl
ZmF1bHQpLg0KPiA+ICsgICAgICAgIGVudW06IFswLCAxXQ0KPiA+ICsgICAgICAgIGRlZmF1bHQ6
IDENCj4gPiArDQo+ID4gKyAgICAgIGFkaSxpbnZlcnQtaW50ZXJydXB0Og0KPiA+ICsgICAgICAg
IGRlc2NyaXB0aW9uOiBJbnZlcnQgcG9sYXJpdHkgb2YgSVJRIHBpbiwgbWFraW5nIGl0IGFjdGl2
ZSBsb3cuDQo+ID4gKyAgICAgICAgdHlwZTogYm9vbGVhbg0KPiA+ICsNCj4gPiArICAgICAgYWRp
LHRyaXN0YXRlLWludGVycnVwdDoNCj4gPiArICAgICAgICBkZXNjcmlwdGlvbjogUmF0aGVyIHRo
YW4gYWx3YXlzIGFjdGl2ZWx5IGRyaXZpbmcgdGhlIElSUSBwaW4sIG9ubHkgZHJpdmUNCj4gPiAr
ICAgICAgICAgIHdoZW4gdGhlIGludGVycnVwdCBpcyBhY3RpdmUgYW5kIG90aGVyd2lzZSBzZXQg
dG8gdHJpc3RhdGUgKGhpZ2gtWikuDQo+ID4gKyAgICAgICAgdHlwZTogYm9vbGVhbg0KPiANCj4g
SXQgbG9va3MgeW91IHB1dCBhbGwgY2hpbGRyZW4gcHJvcGVydGllcyBpbnRvIHBhcmVudCBub2Rl
Li4uIFdpdGggc28NCj4gbGl0dGxlIGV4cGxhbmF0aW9uIHRyaWNreSB0byBqdWRnZS4NCg0KSSB3
aWxsIHB1dCBzb21lIG1vcmUgaW5mb3JtYXRpb24gaW50byB0aGUgYmluZGluZyBzbyB0aGF0IGl0
IGlzIG1vcmUNCnVuZGVyc3RhbmRhYmxlIHdpdGhvdXQgcmVhZGluZyB0aGUgY292ZXIgbGV0dGVy
LiBIb3BlZnVsbHkgdGhpbmdzIHdpbGwNCmJlIGNsZWFyZXIgZm9yIHRoZSBuZXh0IHJldmlldyBh
bmQgeW91IGNhbiByZWNvbnNpZGVyLg0KDQo+IA0KPiA+ICsNCj4gPiArICAgIHJlcXVpcmVkOg0K
PiA+ICsgICAgICAtIGNvbXBhdGlibGUNCj4gPiArICAgICAgLSByZWcNCj4gPiArICAgICAgLSBh
ZGksdGRtLW1vZGUNCj4gPiArICAgICAgLSBhZGksdGRtLXNsb3Qtc2l6ZQ0KPiA+ICsNCj4gPiAr
ICAgIGRlcGVuZGVuY2llczoNCj4gPiArICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXI6IFsgJyNp
bnRlcnJ1cHQtY2VsbHMnIF0NCj4gPiArICAgICAgJyNpbnRlcnJ1cHQtY2VsbHMnOiBbIGludGVy
cnVwdC1jb250cm9sbGVyIF0NCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsgIC0gY29tcGF0
aWJsZQ0KPiA+ICsgIC0gcmVnLW5hbWVzDQo+ID4gKyAgLSByZWcNCj4gPiArICAtIGNsb2NrLW5h
bWVzDQo+ID4gKyAgLSBjbG9ja3MNCj4gPiArICAtICcjYWRkcmVzcy1jZWxscycNCj4gPiArICAt
ICcjc2l6ZS1jZWxscycNCj4gPiArICAtIGludGVycnVwdHMNCj4gPiArICAtIGludGVycnVwdC1j
b250cm9sbGVyDQo+ID4gKyAgLSAnI2ludGVycnVwdC1jZWxscycNCj4gPiArICAtIG5vZGVAMA0K
PiA+ICsNCj4gPiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhh
bXBsZXM6DQo+ID4gKyAgLSB8DQo+ID4gKyAgICBzeW5jX2Nsazogc3luYy1jbG9jayB7DQo+IA0K
PiBEcm9wLCBub3QgcmVsYXRlZC4NCg0KSWYgdGhlIGNsb2NrIGlzIHJlcXVpcmVkIChhcyBpdCBp
cykgdGhlbiBJIGhhdmUgdG8gcmVmZXJlbmNlIHNvbWUNCnBoYW5kbGUgaW4gdGhlIGV4YW1wbGUs
IGVsc2UgdGhlIGV4YW1wbGUgd2lsbCBmYWlsIHRoZSBjaGVjayAobWlzc2luZw0KcmVxdWlyZWQg
cHJvcGVydHkgJ2Nsb2NrcycpLiBUaGF0J3Mgd2h5IEkgcHV0IGl0IGhlcmUuIFBsZWFzZSBhZHZp
c2UuDQoNCj4gDQo+ID4gKyAgICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4g
PiArICAgICAgICAgICNjbG9jay1jZWxscyA9IDwwPjsNCj4gPiArICAgICAgICAgIGNsb2NrLWZy
ZXF1ZW5jeSA9IDw0ODAwMD47DQo+ID4gKyAgICB9Ow0KPiA+ICsNCj4gPiArICAgIGkyYyB7DQo+
ID4gKyAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAjc2l6ZS1jZWxscyA9
IDwwPjsNCj4gPiArDQo+ID4gKyAgICAgIGEyYkA2OCB7DQo+ID4gKyAgICAgICAgY29tcGF0aWJs
ZSA9ICJhZGksYWQyNDI4IjsNCj4gPiArICAgICAgICByZWctbmFtZXMgPSAiYmFzZSIsICJidXMi
Ow0KPiA+ICsgICAgICAgIHJlZyA9IDwweDY4PiwgPDB4Njk+Ow0KPiANCj4gDQo+IFBsZWFzZSBm
b2xsb3cgRFRTIGNvZGluZyBzdHlsZS4gRG8gbm90IGludHJvZHVjZSBlbnRpcmUgZGlmZmVyZW50
IHN0eWxlDQo+IGFuZCBvcmRlciBvZiBwcm9wZXJ0aWVzLiByZWctbmFtZXMgSVMgTkVWRVIgdGhl
IHNlY29uZCBwcm9wZXJ0eS4NCg0KT0s=

