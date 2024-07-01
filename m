Return-Path: <linux-i2c+bounces-4522-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A8391DEE9
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 14:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB9C2B20398
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 12:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D3E149DF0;
	Mon,  1 Jul 2024 12:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="XyTrVMVf";
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="hmO2hXO+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665DA535D4;
	Mon,  1 Jul 2024 12:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.154.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719836285; cv=fail; b=HVJB+29dnxEBHx4pU84awDqDLMwz5Cj5YXxuGYHCuWrE8lhFVd7OgLkAGbcLUs+zgBBYuDMTTSzME8VFIScIAC2j65OeG1JQly4SgWyyETgsE5RUCvBGt6Xhfn19ojH6sTt09nklY9KxpIbpPbbiaVHah7sjbAryrKMKwY0GE+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719836285; c=relaxed/simple;
	bh=Y4IQd1DSLv+3Mo137mglXIkShjNchP4jVv5kGL7wJeM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D2xFBYxsicLG+HlSu9TVmAIETJRsmWs3ow47vIVKYnh3XennoJsIeef2gbcJ5k32vTWFe3DwEIlNX+Fz2/e9bt9MyVkBXBgLF+lFa8BVtkcYzcBSWAMghEtrbV2dfAowphGneuICHf4SwcDOQc40W/YI5X4uYd+GPqY+QoXFDcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=XyTrVMVf; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=hmO2hXO+; arc=fail smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719836283; x=1751372283;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Y4IQd1DSLv+3Mo137mglXIkShjNchP4jVv5kGL7wJeM=;
  b=XyTrVMVfnXUeRAb74VJSVBC0bHOfsF8A7B6YOvQb93WMpL30KMVgBIa6
   ejwJ26j50SNltZHMb4pcHg+Lu9XeorHMYS1MuV/2KLplDwICfY6TF6ebl
   qwb1b93SIaI0q5BOD4BDuZ+i/gPEgvCUGcNi3TUOecAY72w9WNkNrteR2
   VdU67PeDfuLGxn05pD5evfD+WelJEW3FnUrfzlBI84WKj2eLvtuMufnlt
   Y51A+7t53P88jMFmjf6uhVkvuQClbT9b9FTEcnpF97zbnnkUBu4a2PEcw
   s4LDlou7f0cUU7obZGMf88W09Fg8eHgQB7CpcjBdTZU/g8+0WO7E0kDWZ
   w==;
X-CSE-ConnectionGUID: GHZZH+VZR5u1MJ/tfT3Gfw==
X-CSE-MsgGUID: d7oP6ezQQs2NuoWRQVGLFA==
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; 
   d="scan'208";a="28671090"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jul 2024 05:17:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Jul 2024 05:17:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Jul 2024 05:17:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6AdFPgZLuehtjB222kk8tZei9wlp4KLm75SUhpjQDEfUbu7Nk1TvG5uBa0XIDQwC64JeJPuIn002mHg0Lm2emKfE1BZv6De3GHB/RfXJ9TbKYDUaqTu18NRox4gsQW2hlGIEd/ti+FUA7TE0rNYjbXjydgFEK6kQ8/g563+k4EtswU62lbtJmMR3/bXvclsPxQvlXPfZZQQBoniWhGBMrjemhJ2En6br0G0b+NsBwmHWNzMGWUeO2cZaUYUMRZUH08tEA9RxwqBckyy07FivLtpjHvr1kx4YB3xc2qB4hhMoOp8VI8j9sWGpysjTP5DiIyvYQ/JyZPX/SBwiLqGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4IQd1DSLv+3Mo137mglXIkShjNchP4jVv5kGL7wJeM=;
 b=AfF6QrT0TaIhuMbzRsyCBTUfSxkB2Nc9UvnWX7FjMU2mpal+Bp55irU/k+dgWQlAompcyqSmgRDsmQ4WMSfh0PpyZ7NQtQttb1LdBn6HWaz+sHmbpvNsm2hNz2NiUsTUOxa8uB04Ewt6Vk+QyejplZWuuB+AM0lyu/Z1SSwJNINJ1yNdS2Q3lSGjv8GRu6wL90PsWWv9ECwqyzVfJTj9DsxVqv/hHFNL2SNtdRIdVEaMoxSW+gP9aGzTVO42GMJ+iDeTXIkZqOajGERXFyMY6sv7/kcQ3QONT1g0vBvGqGUJDrAo4Q04YE8lhnvHrYt+rLk5en1OxgTLcxgAfG4NTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4IQd1DSLv+3Mo137mglXIkShjNchP4jVv5kGL7wJeM=;
 b=hmO2hXO+cR7SizixI4Lh+U6sv0C3UU+N0zkHMVT5VzIRqfnAoEtkmIai8ET1CPRMjFMuh0BVsIgQmwAn4s8+EhnM9rpuHnHzY8y/+vQ7TahxKeV6R8IG0MZxAobddPhiHaxaYWfqtyueenPJiD6MwCbwR+W5OJzmBSODJ/WxoiJNuaRP47gLZlN64UK0K1dbJPushQfFFgf8zExRH91A2Xq0LshTAPRRK0EwTZGDE3NCG71YX9q5Z7h9R1oXbaL2Qngg4yC4aHmn5wb2dwI8l1uw4Wh9lTU0mhuLheKWDRSmxPQ+QkDDLMjZwsFbd4V14KgvBoVUKQox64VTXGGXEA==
Received: from BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 12:17:15 +0000
Received: from BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395]) by BN9PR11MB5289.namprd11.prod.outlook.com
 ([fe80::93b4:c87a:32b4:c395%5]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 12:17:14 +0000
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
Thread-Index: AQHayTGBv1mzh/dtb0KvO1vdxjAYGLHc2IiAgABg1ACAAAgwgIAEOxWAgAAXVgCAABohgIAAD6QAgAARGQA=
Date: Mon, 1 Jul 2024 12:17:13 +0000
Message-ID: <e9878950-5751-475c-aa39-cb96ddec3911@microchip.com>
References: <20240628080146.49545-1-andrei.simion@microchip.com>
 <20240628080146.49545-2-andrei.simion@microchip.com>
 <CAMRc=MeJyByMvcFT2aJDK87bz4=+UXEuMtQ4G4MZUAUt39SS1Q@mail.gmail.com>
 <67d3646f-1b84-4d2d-9e36-be898f13be90@microchip.com>
 <CAMRc=MeJM4LmczCbZ8bKytLZKY_mP=Q8eaUprLMmO8BYHecStw@mail.gmail.com>
 <c1b53308-d1d5-412b-9558-9f40dd237397@microchip.com>
 <CAMRc=Mewx0NAdFBX6hpes_oa62M_Jp=LtzAPK73tZv+tKxnScA@mail.gmail.com>
 <dbba7a80-dc91-4685-bb62-34503eed1a02@microchip.com>
 <CAMRc=MfiYZOzA+T6+_jZgz-=UsHxGO5vhS8zhjX2ckUf2YxG_w@mail.gmail.com>
In-Reply-To: <CAMRc=MfiYZOzA+T6+_jZgz-=UsHxGO5vhS8zhjX2ckUf2YxG_w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5289:EE_|PH7PR11MB6377:EE_
x-ms-office365-filtering-correlation-id: fec6caf2-f7c8-4a84-45c4-08dc99c7bdb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ODRKUGJURng1SFJEckpGYW1QWE45SFBDUi9CU1Z4RjhSK1FSVDVWQjI3QXJr?=
 =?utf-8?B?RDJ0dG9xaktLdDBmMnRNUGhFT2F6Zy9WbFVXMHptZnRTSmlVVVYxWFl1cS9J?=
 =?utf-8?B?eXF1bkFvV0NnYmtxa25TWWN3bGt0UTh0aEtjMjVGYkdKT0J2cTMrRGNBRXFj?=
 =?utf-8?B?M2NaRUd1bTJoTE5VQk5ZK1pTOXJicHByL25PLy9BdFd6ZXZqMit0N0FZZFp2?=
 =?utf-8?B?NFB4RnpYN3lYWmtLa0ppRzh6QTNrdjJrTStrWGFlWUE5bi9xajhkcHFXZyt3?=
 =?utf-8?B?UkZaOVN3cUNBV3U0NmtJMGZWelE0MXk2ZkQycFMwb2NqdVg3WHFrQzhSY3RB?=
 =?utf-8?B?cC93TVFpOUVYTU5ncnltUk1mZm50UzluUkt5Y09oVGp3ZzBDTWtkVmZKNzRo?=
 =?utf-8?B?amtrTHRvMjBKc0ZGNlgxeU5WcmtoMkIxTWpHaXE3ZUZPZ0xST0JUOHpRbnFR?=
 =?utf-8?B?enVyNlU0TFRDbDRRSCtrSy95Q1NlVWJaV3UxMG5kbUN2U0U3dXdxQlhZNmRQ?=
 =?utf-8?B?WmtBVlFoUFlkVDFmN29pV3hUN0xZblA1SHVKNlJ1ZnlnZjJFVnpIVmd3d2xK?=
 =?utf-8?B?OFg1bDgyMWU2eG1ubUdaZlZoUHRWV0QvNzFxTzNlTmIwS2EybzZQYmlqV241?=
 =?utf-8?B?VVQyNmNBYXo5bWNNUWNNeVNJelVxY2NXR0lHTkhvZzh1WGxWV3A3RU51a3lE?=
 =?utf-8?B?enlkdFFFc1dsVFFNTWs4MlRWSmJLQS9URGVJbm1iTlVac1BTWCt5V3poeTU4?=
 =?utf-8?B?N3YydVdIc3E1MldSbG1WYW9ocHZXVjJTWnQ4amJmeVdxQTFMOU5sS1pHRlox?=
 =?utf-8?B?NVFkUUQ4VnRLZ0tTdTJSaVhYbm1BQzgrclQvU2hJTVdDRGp0T3VyMDVGUy8x?=
 =?utf-8?B?SGhFaGZ0dGwxWXRrOXd6SkVWd2luUWUzbitqNFJwcXpxbjZXSXZzWUF5MjZH?=
 =?utf-8?B?RnFlaUxTb3ZwaUlmY2hzZDJmOHoxKzVyeVVvcDIvTWdzRHNjSjZJcEZmWXQy?=
 =?utf-8?B?UFBuWEM4OUJiSmd2SVlZWkhIUzJ1Wnd3VGppZGhDaEJVQ2k2M2I0NWdxQzA3?=
 =?utf-8?B?V3ovK3FlL3lidHpzU0hrdGJEV0NNSTkzNTU5d1hrSlRYcndtYnk4OWQycmJj?=
 =?utf-8?B?WGFlVFNSYjdRZ29WMS9ReVRoV29nQ0tQZUFQb0x5R3VqU3lxZ0w1eVg1RDRI?=
 =?utf-8?B?akxIYmdrMWlXOFhBTGV2Uy9Ua3FTaXlXcy9zNElaWFJqbnM4Ykl1WkFzdTJG?=
 =?utf-8?B?S0s4OTVOZ1dPbU94bEs2TUpTbmpMaGluejdZNmxRQjJVUmdmdzZwQ3hEekFn?=
 =?utf-8?B?R3ZKQzBLNnRITDFvTmRMNjh0RUFjQ2tITkF0UHZVTmltbU5BaTVuUkt4YXMz?=
 =?utf-8?B?Q05lL0JrSE1oWGw3azY2eXlQRWl4NGh6NGlpNXllNXgxc053U3JIelhVdktt?=
 =?utf-8?B?UGpQbGl4dW96bDFjYnl6YTYxdjlBWTNaMWVqcFVSbFNFeCtUVm10emVEVEg1?=
 =?utf-8?B?VHlFWktUTW9FQ2N0TThtSDhzM1laZnFPbjFXcDNtTklOY3FTbFhaUEt0WVhy?=
 =?utf-8?B?ckQycTN4QlV1NW1iWjRyeElsRE1hbURVZ3M5N2M1RjhuS3NMUzRvUlhMVnlX?=
 =?utf-8?B?RjcrTWFjK3E4Snd5QnJvd3lBNXhqTkZDeG44bjhhRk9GTXdmN2xPY1ZSczR1?=
 =?utf-8?B?TE1QVGJxeVh5WjJJSWpockFlWjBsSXBiR0FtelFsaG1jay9TOThVQ3dPa29q?=
 =?utf-8?B?M3NQSzlpLzNrTWhzemNMcHpZU0diSHFUSGFyYTFIOEpDZGx0MitJRjdZWm1O?=
 =?utf-8?B?cmRBSlp2amtPeUZmWitmaDZ5S1RRK1RNNGZ2djhqZ2FyL0ZraUo5UCtLcS9w?=
 =?utf-8?B?QjR6MXF0ZFlhWWw2SUtCeFRZczloMGlJS0dIaFByV2o3UlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5289.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnRReGdML0R3RVFUMWJtQmhEaHJWZzN1WnNYUkY0c0taclQ3U2VTa3haVDZ6?=
 =?utf-8?B?M3V6Y1dicGthWWw2NDRBSVlxSlVPWW42Zy9qUTkzUjlEZVBKQnliYjd1VUls?=
 =?utf-8?B?aCtuOWZhei9nc3YxMU9UUWlteEQvVU9iNVFIdC9nMVgrNHB5TC90OU5KVk04?=
 =?utf-8?B?K0RCZWppR1FJakxFaWJ2TVdnT0pSNCsrTVZ5c0k4V1VTN1lyS01OK3BkdUxv?=
 =?utf-8?B?OGxTUm9mNWFOajFveWRLY0lNSmxNeVY3ZVY4Y01OZU9XMkY4cTNqNVRad1Fk?=
 =?utf-8?B?aEpFcG1tVm93TGd1YTdYa05RV0NPckFyeGRZa3U4T2dFOEJxRDVXVDRGaDAr?=
 =?utf-8?B?b2Ywd2M2a1d1ZTJqcEx2UGZoNGFPazV4dFhtV0hvMExtcWhpM3Yrc01maThO?=
 =?utf-8?B?dXo4Q3ZYc09YMlJOaUhsRUV3RUxFSlBzbGxZZ0pYMjh2aU52RXQ0bVEzQlE4?=
 =?utf-8?B?TWZ3Ny9PbXdWNGlnY2lkTEVrbzZaZ0NYUmxybkk3M1h6cjVFOTVUMWRkdGdE?=
 =?utf-8?B?TnpFYk56NWdtZ1Jiejh3ZzFNSGo5K2kzQnR5WUw0UzFmRk04MTJBSGtkZnlJ?=
 =?utf-8?B?SnpuN1lQSHdsck1rTTMzd1RZL0ZINHpNRnJPaWtiQlgvM2E2bFpDUnFlZG9k?=
 =?utf-8?B?aHlESFV1WnlrdjVaV2xRRTVlY1BGYmRkdTNmTDRhWWRTSjE1clB2dkNHNUZP?=
 =?utf-8?B?THcrQnpUeTAxOTVuOWlOMnV6aWo2cjhuNytxa0ptaUhNR0lkNkZvYVdQanda?=
 =?utf-8?B?SS92c0k5c21hRDZyS3p0bExCMk5HUU5JRU1DeFBRUnd1NEsyMUYyZWFRMTJZ?=
 =?utf-8?B?YjU5WUFMTEdyczZhYXpZaFpmUUtCMWwyYXhieHg4RVkyMWlROFdzRXlDczly?=
 =?utf-8?B?ckcwL1VCOGNmZkY1UFRRZ3phOHdtSnd6RmNlcEs2M0ovN0E0WGVLdkpoRXY4?=
 =?utf-8?B?VWRRc3hWUXBzZWQzM3hVWHllTElxa1FtQzFScDlaRkVuWS9qa1RlZEs1ZGtn?=
 =?utf-8?B?RTEyc01lVWJ3dXBEaHRZb0pER21UZHF6ZkRzZGhoTW93Q1ZMVFRCRUN3US91?=
 =?utf-8?B?bFBVRzI0ZnZiSVpNeUxJenNtTEMwV3R1a1JYek8rR3BRckpPM0ZydHlMM3BV?=
 =?utf-8?B?MjVBcUxxemw3ZUxMU2pVSFFKU3A4OTN1bDJHVm1XeVB6UGRORjBtVTZEVUpV?=
 =?utf-8?B?d2RiSmFQUFBxZEdUQ0FDaE1DNmdjb2UyeGRuNEE4Q1lUeTRXNzIwbCttSEtX?=
 =?utf-8?B?Q3Z5WmU2TXFBNEdnOVRyQndhKzZDaFByTDdxSm9kazFDNHEvRDh4SERuZVV6?=
 =?utf-8?B?ci9Vam9oSkVlKzU5Qmc5d2hwWkJWYlpPc1cwbUdSSzBKMWl6dlYvSXQwY0I0?=
 =?utf-8?B?azRqWGlTT0ZCUmFxbFJzWXl4TitOZEV6MG9QZ3Y2cUJ0ZkRxVjhua0RGTHdz?=
 =?utf-8?B?MytvR0Mvd0FYT0E4SkJzSzhqR3ErVG54K1hDY0tXV0RBejBWeGx0SDBSMHk4?=
 =?utf-8?B?dTVESmY3VFJQZU1Vdko5UGJGUWNsZ0todG4wclIrRWcxUWxDenBMZlA3S2Ny?=
 =?utf-8?B?MGxoSmRnSFpJNlBEWkl4cUFlZ1h2THU2eWZWZC9tU1N5R2h0M1U3OHhRZS83?=
 =?utf-8?B?Q3ZZWk1tZjZ0UjA3UkRVU2VoVGhWOHM4MTlweUZQV3BmQVI4d3lrNDgwSWli?=
 =?utf-8?B?dmZQM20zb0Q0NGNPRkhaZTYvWUs1TzgwcXd6QVNtZVNYOWhLS0c1QzhiZ25S?=
 =?utf-8?B?WVg5UzlaRDRLTlhpR3JFNjVOVDRmVXJ0aTY2bk1BU0p2LzFXQ0ZTRGtVR3Fq?=
 =?utf-8?B?QktSUnVtSExCWC9tK2lsTnZWT1VMNW5QdUVDSktBMndJVkdlM05zRnhwWUlo?=
 =?utf-8?B?ZEVhazBuSHdraWllYTFWNE9SRDBnMnZGNHJFRThPMkVBNWNTWGlnTG93VGFm?=
 =?utf-8?B?ZDJ3OEc1TWFvdGtXMkxadkQybDJ4NkhETzFOTUt5S2VCZCt3eWJhNXhlNGdI?=
 =?utf-8?B?Q1JMZnN2c0JRZDk2b3k1Z3dGbWJoejZsalFYKzErWnVMVjhqVDAxbnorQ3JT?=
 =?utf-8?B?S1REWEd1RWxSNXVCR09tNkVtcDgreGJ1Y05jaytiM1R5TnFSdWZOTVdzdTBV?=
 =?utf-8?B?MVlseGZwWEllSnBlSUg2ZnpJZG1DcXc2bWhYNE5LMTlUREpjNVVIby9waUd6?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6170D84B679684286A7C49EB386B784@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5289.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec6caf2-f7c8-4a84-45c4-08dc99c7bdb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 12:17:13.9845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yg4qUgzPX+juQVekNKPmOANAUJld2IwyGqVnvURLt+AlMdtELACDECTeYqcxNOV5S9bDvNruNg0b58S18KHd5rcV0jCzST2IXXODjWJ33Vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377

T24gMDEuMDcuMjAyNCAxNDoxNiwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBNb24sIEp1bCAxLCAyMDI0IGF0
IDEyOjIw4oCvUE0gPEFuZHJlaS5TaW1pb25AbWljcm9jaGlwLmNvbT4gd3JvdGU6DQo+Pg0KPj4g
T24gMDEuMDcuMjAyNCAxMTo0NiwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToNCj4+PiBFWFRF
Uk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pg0KPj4+IE9uIE1vbiwgSnVsIDEsIDIw
MjQgYXQgOToyM+KAr0FNIDxBbmRyZWkuU2ltaW9uQG1pY3JvY2hpcC5jb20+IHdyb3RlOg0KPj4+
Pg0KPj4+Pj4+DQo+Pj4+Pj4gRm9yIHRob3NlIHR5cGVzIG9mIGVlcHJvbSAyNEFBMDI1RXs0OCwg
NjR9IGFkanVzdGluZyBvZmZzZXQgaXMgbm90IHJlcXVpcmVkIChhdDI0X2dldF9vZmZzZXRfYWRq
KCkpLg0KPj4+Pj4+IFNvLCBpbmRlZWQsIGl0IGlzIGFuIGVudGFuZ2xlbWVudCBpbiBsb2dpYy4N
Cj4+Pj4+PiBUbyBrZWVwIHRoZSBpbXBsZW1lbnRhdGlvbiBhcyBpdCBpczoNCj4+Pj4+PiBhZGpv
ZmYgKHdoaWNoIGlzIGEgZmxhZyB0aGF0IGluZGljYXRlcyB3aGVuIHRvIHVzZSB0aGUgYWRqdXN0
aW5nIG9mZnNldCkgbmVlZHMgdG8gYmUgMSBmb3Igb2xkIGNvbXBhdGlibGVzIGJ1dCBmb3IgdGhl
c2UgbmV3IG9uZXMgbmVlZHMgdG8gYmUgMC4NCj4+Pj4+Pg0KPj4+Pj4+IEkgdGhpbmsgdGhhdCBp
cyBlbm91Z2ggbm90IHRvIGJyZWFrIHRoZSBleGlzdGluZyB1c2Vycy4gV2hhdCBhcmUgeW91ciB0
aG91Z2h0cz8NCj4+Pj4+Pg0KPj4+Pj4NCj4+Pj4+IFdhaXQuLi4gaXMgdGhlIGFkam9mZiBmaWVs
ZCBlZmZlY3RpdmVseSBhIGJvb2xlYW4/IFdoeSB1OD8NCj4+Pj4+DQo+Pj4+DQo+Pj4+IHN0cnVj
dCBhdDI0X2RhdGEgY29udGFpbnMgb2Zmc2V0X2FkaiB3aGljaCB3aWxsIGdldCB2YWx1ZSBjYWxs
aW5nIGF0MjRfZ2V0X29mZnNldF9hZGooKSkgaWYgYWRqb2ZmIGlzIHRydWUgKDEpLg0KPj4+PiBZ
ZXMsIGFkam9mZiBuZWVkcyB0byBiZSB0cmVhdGVkIGFzIGEgYm9vbGVhbi4gSSB3aWxsIGNoYW5n
ZSBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KPj4+Pg0KPj4+DQo+Pj4gTm8sIHdhaXQuIFdoeSBj
YW4ndCB5b3UganVzdCBkbzoNCj4+Pg0KPj4+IEFUMjRfQ0hJUF9EQVRBKGF0MjRfZGF0YV8yNGFh
MDI1ZTQ4LCA0OCAvIDgsIEFUMjRfRkxBR19SRUFET05MWSk7DQo+Pj4NCj4+PiBhbmQgYXZvaWQg
dGhpcyB3aG9sZSBuZXcgbWFjcm8gdmFyaWFudCBlbnRpcmVseT8NCj4+Pg0KPj4NCj4+IGp1c3Qg
QVQyNF9DSElQX0RBVEEoYXQyNF9kYXRhXzI0YWEwMjVlNDgsIDQ4IC8gOCwgQVQyNF9GTEFHX1JF
QURPTkxZKToNCj4+ICMgaGV4ZHVtcCAtQyAvc3lzL2J1cy9udm1lbS9kZXZpY2VzLzEtMDA1MzIv
Y2VsbHMvZXVpNDhAZmFcLDANCj4+IDAwMDAwMDAwICBmZiBmZiBmZiBmZiBmZiBmZiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwuLi4uLi58DQo+PiAwMDAwMDAwNg0KPj4gIyBoZXhk
dW1wIC1DIC9zeXMvYnVzL252bWVtL2RldmljZXMvMS0wMDUyMS9jZWxscy9ldWk0OEBmYVwsMA0K
Pj4gMDAwMDAwMDAgIGZmIGZmIGZmIGZmIGZmIGZmICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfC4uLi4uLnwNCj4+IDAwMDAwMDA2DQo+Pg0KPj4gd2l0aCB0aGlzIHBhdGNoIChhZGpv
ZmYgZmFsc2UgYW5kIG5ldyBtYWNybykNCj4+ICMgaGV4ZHVtcCAtQyAvc3lzL2J1cy9udm1lbS9k
ZXZpY2VzLzEtMDA1MjEvY2VsbHMvZXVpNDhAZmFcLDANCj4+IDAwMDAwMDAwICAwNCA5MSA2MiBb
dGhlIHJlc3QgYnl0ZXNdICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfC4uYi4uLnwN
Cj4+IDAwMDAwMDA2DQo+PiAjIGhleGR1bXAgLUMgL3N5cy9idXMvbnZtZW0vZGV2aWNlcy8xLTAw
NTMyL2NlbGxzL2V1aTQ4QGZhXCwwDQo+PiAwMDAwMDAwMCAgMDQgOTEgNjIgW3RoZSByZXN0IGJ5
dGVzXSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwuLmIuLm18DQo+PiAwMDAwMDAw
Ng0KPj4gIw0KPj4NCj4gDQo+IE9rLCBidXQgeW91ciBnb2FsIGlzIGZvciBhdDI0X2dldF9vZmZz
ZXRfYWRqKCkgdG8gcmV0dXJuIDAsIGlzbid0IGl0Pw0KPiBUaGlzIGlzIHdoYXQgbGluZQ0KPiAN
Cj4gYXQyNC0+b2Zmc2V0X2FkaiA9IGNkYXRhLT5hZGpvZmYgPyBhdDI0X2dldF9vZmZzZXRfYWRq
KGZsYWdzLCBieXRlX2xlbikgOiAwOw0KPiANCj4gaXMgZWZmZWN0aXZlbHkgYWNoaWV2aW5nLiBX
aGF0J3MgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGlzIHBhdGNoIGFuZA0KPiB0aGUgc29sdXRp
b24gSSdtIHByb3Bvc2luZz8gSXNuJ3QgdGhlIG9mZnNldF9hZGogZmllbGQgMCBpbiBib3RoDQo+
IGNhc2VzPyBJcyB0aGVyZSBhbnkgb3RoZXIgZGlmZmVyZW5jZSBJJ20gbm90IHNlZWluZz8NCj4g
DQo+IEJlY2F1c2UgSSBzdGlsbCB0aGluayB3ZSBjYW4gYXZvaWQgYWxsIHRoaXMgY2h1cm4uDQo+
IA0KDQpJJ3ZlIHJlY2hlY2tlZCB3aGF0IHlvdSBzYWlkIGFuZCBzZWUgdGhlIGZ1bmN0aW9uIGlt
cGxlbWVudGF0aW9uIGF0MjRfZ2V0X29mZnNldF9hZGooZmxhZ3MsIGJ5dGVfbGVuKSBhbmQgbWFk
ZSBhIG1pc3Rha2UuDQpJIGRpZG4ndCBzZWUgdGhhdCB5b3Ugc2FpZCBvbmx5IEFUMjRfRkxBR19S
RUFET05MWS4gKFNvcnJ5IGZvciB0aGUgd3Jvbmcgb3V0cHV0KQ0KT2ssIGlmIEkgcHV0IG9ubHkg
QVQyNF9GTEFHX1JFQURPTkxZIHRoZW4gYXQyNF9nZXRfb2Zmc2V0X2FkaihmbGFncywgIGJ5dGVf
bGVuKSAgcmV0dXJucyAwIC0+IEkndmUgZ290IGluIGJvdGggJ2NlbGxzL2V1aTQ4QGZhXCwwJyB0
aGUgTUFDIGFkZHJlc3MuDQoNCkJlc3QgUmVnYXJkcywNCkFuZHJlaQ0KDQo+IEJhcnQNCg0K

