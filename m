Return-Path: <linux-i2c+bounces-3605-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F308CA806
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 08:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECA242824CC
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 06:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA6747A48;
	Tue, 21 May 2024 06:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.b="CmcBTfZy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2110.outbound.protection.outlook.com [40.107.21.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3791C14286;
	Tue, 21 May 2024 06:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716272847; cv=fail; b=idPSJFpqvQdxy8fg9gOnbvtsUKDMfpwoASuUzjMmPvf0+NUZJrDKw+t0pdTOJIsXJK7Cn5Ico23CaBziQpJrkfHC99dwXfnKEYfqWs71IqQTW3/E5YsaGqZrZrNLDCIiL6hkrO+kM8EEPQz9p5gHA5e89WTZEY5yP6cs3te9jSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716272847; c=relaxed/simple;
	bh=82FRuo+HkfjU37EGnANn2AWD3fNUiNoRw6MlyRmNSAQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cw5RkEiiOBVvbG8lbldRYCUspCmwQA2nMe3fa2D32wWXuwbf/S1MIqIYMSkDWJI4gpWr6pnX3z25l3g3kWLBwoKJK4+477Msc1Vmf+jeOa3SevMCPR3b2GcOLUsI1O8WxEpg7g9XLXV65BYXSC8RPHEpvyBwfjL0RDxzcd1ZyvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bang-olufsen.dk; spf=pass smtp.mailfrom=bang-olufsen.dk; dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.b=CmcBTfZy; arc=fail smtp.client-ip=40.107.21.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bang-olufsen.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bang-olufsen.dk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRIj9j6P8BvjDHfSIpYX3FP39MtilgMXHokKz9GTTAoCCLDylsZY8Ff3WWIvwnr6bT89thzwHzV8fPdUPmCa9zhRD5IJFo5ymoBgY6zFcB3fgpShOgI1QDVkYUtNxWO3lI7E8VVpeDvshSLknRL18QPhM1SUpVFTi+XFJzuo5FTk3l7GEbkEBrlLU2xOMnmT2V74KhKYF1wkJUSV6TXlhJHAexwo4ApQHVoIaGtcCk+S4BaQ3nM5NHYg9PZaCTysCM5kZVsNNWiCw5v0xcZdnP8UL+U92EjH9K/4lkb0woVj4POcp4Lkob21Kz2lum/x4vR5QGd62Ih8dB3Io4Oe+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82FRuo+HkfjU37EGnANn2AWD3fNUiNoRw6MlyRmNSAQ=;
 b=U+c3v+GFwrPSdxyfuHfdG2OAJJWqmAFla3bYYOgRDqZuSRxe7qLw/hShvLqrXGglR6I+9Sg3J7jURvKqnxxJ9MlphxFyBx97ihAp/W1XdPp2CxYTKugkdBXC4r9pcPTcEmPV9OANBaKuLrhGLBv9dBzXSkBVYHalYnF37tVS0pd3nr16aK1fHWNe/t6ZWWll2AYkfEcUROiDAO1rLXSyOHwPf77w9Kc3T8cdP6vqE2fImGq06ph6yD/xk4qzd8HbN3DbpFklL1RSigIZfhzgrBBz1TcP9JNrykhwSLOGVS75qSHsK/T4a7Tl6JgSKrUVeS2XiFdbMva/UD5jvFUlOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82FRuo+HkfjU37EGnANn2AWD3fNUiNoRw6MlyRmNSAQ=;
 b=CmcBTfZyvp/1VraeaXP1/a7P2Ou/H8riZRlolgRi586iZWvDjgO73ywH0YO5Rqmf9ItE8yyVH6+FQPbrfP6CenSJqJC/4MifYA7uOlMfr7yD0/Eftydy0QMpxyCMZXYWLoYEbFBmZbmZo3kjqGdzNQUg3DaFvpBXUbf3/BiqMts=
Received: from AS8PR03MB8805.eurprd03.prod.outlook.com (2603:10a6:20b:53e::20)
 by AS8PR03MB9673.eurprd03.prod.outlook.com (2603:10a6:20b:5ee::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17; Tue, 21 May
 2024 06:27:20 +0000
Received: from AS8PR03MB8805.eurprd03.prod.outlook.com
 ([fe80::6ac3:b09a:9885:d014]) by AS8PR03MB8805.eurprd03.prod.outlook.com
 ([fe80::6ac3:b09a:9885:d014%5]) with mapi id 15.20.7611.013; Tue, 21 May 2024
 06:27:19 +0000
From: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To: Mark Brown <broonie@kernel.org>
CC: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <alvin@pqrs.dk>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andi
 Shyti <andi.shyti@kernel.org>, Saravana Kannan <saravanak@google.com>, Emil
 Abildgaard Svendsen <EMAS@bang-olufsen.dk>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 02/13] regmap: add A2B support
Thread-Topic: [PATCH 02/13] regmap: add A2B support
Thread-Index: AQHaqFn4BKUlfNnD6ECEFoqig/wX6bGbgDCAgAW+9wA=
Date: Tue, 21 May 2024 06:27:19 +0000
Message-ID: <hpid3fdj3igswrqtwavudhgicsadnacbyxbg65to5yr4hduzst@yjspwxnwsw6c>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
 <20240517-a2b-v1-2-b8647554c67b@bang-olufsen.dk>
 <49cd7b8e-d104-4136-bf7d-7eb45725c596@sirena.org.uk>
In-Reply-To: <49cd7b8e-d104-4136-bf7d-7eb45725c596@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB8805:EE_|AS8PR03MB9673:EE_
x-ms-office365-filtering-correlation-id: 28d66fc3-4ef5-460d-7872-08dc795f1107
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|1800799015|7416005|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?UWRnWGNrSitHeEpkZFRsUFhTQ1Ura2NNajRmUno3eFBVemwxRTdNY29BZEdD?=
 =?utf-8?B?ZlZjSmVORmxEK0JLVmRtODNsRGFoMmtsNEpZWEFBSC9TbllWVTBFY0tmNnlB?=
 =?utf-8?B?OHBpc0Y3Ym5rZzVXWEtyRWlHd2FrZHdOZnpGQWIyR1dvSWxxck9wWjdHSW8x?=
 =?utf-8?B?bVVXbklvZ2ZvM0lFbFB4djVucjQ5QnZPOStKSkRQdUIwY0o3dHp6bXhuaUxI?=
 =?utf-8?B?VmEwTEVpOGVXdkpOZE8rVVNRVldJSk40cVoyZ2F1MjhSZWdtYUpocFdZekJT?=
 =?utf-8?B?TTkvYzE5dG5udkx3THVZYjhXNWhtVmwwTnpkNTZyd3lDank5ZUlUNmtJdjk3?=
 =?utf-8?B?R3BKVFNDUWI3Y3MzQkVvWUtsR1FKM09RZ2dMQ2dhOEdEazhvZnlFN0NiS2Uv?=
 =?utf-8?B?L0hvRmlwWkcwRTdaWjdNY2hWcGgvaHgyejZaSnpvbWpjZ1o3UW9wV1p5Mllp?=
 =?utf-8?B?bVNBTkhNaWlKaThkRXEzTUgyMm5tTFphWlVoLzMycWo1YW5QVW5wRWRDZjdo?=
 =?utf-8?B?cjAranBDclVlVUlFdUpIVU5NUHJSaXQvTlFGa2JWL3lHaXpjcnR1bVpQamFp?=
 =?utf-8?B?MFFrOVI1MG1HZlhud0ZXMnY3VFRETVZrVXlPNUlBdzA0djJoWkZnR0V1UkdD?=
 =?utf-8?B?MzFCL1YvUThxbitMb2lwUDhhL1lEQkloYVllU3E1Y20xdUhFNDlHSzg2Wnhq?=
 =?utf-8?B?R2l2YURUUllTNUp3OE9tdUh6V3FMOWM2THNvcDVxN2xoUVJ2c0EwUUw4MldC?=
 =?utf-8?B?MGx0b2ZsbHlLUTNheE9WdHB6SmJqYUFjTFNoMlFUNEYzaWQwcG9kWi9JdjRF?=
 =?utf-8?B?MDRBT2JBTXhhc1JmUkhCcFhDRUNqUS9RUGdLVlhjQlBFOEFreXVNWldiVms4?=
 =?utf-8?B?RWNKNk5YeVdsOXJIb1IrTkxSMzY2OThSeHZjYk5VdXVuYmVwQVhOZjRwMWtT?=
 =?utf-8?B?dW9wRU9zR3BIditCVXVBQWVCWk1xcTFIU2c0akVwMEhic24vcnJ0Y2VZZGFa?=
 =?utf-8?B?V1BpYS9nNGhNYVlOZnFXdVErL1NCSjdXdjhxejU1YmpEUi9QL3ltVkdmMVVk?=
 =?utf-8?B?NWo3MTFINytCRnRHS1hPT3pXdFpQaHZkQ0hkblBkRXVHNjhlVXU5UGVLb3E4?=
 =?utf-8?B?dndBQXlOdTRnYjlzQ1BUbE9oR3hvZWVHUjRCcFlkS1dFMHEya2w5QmhndUV5?=
 =?utf-8?B?d3VkaFdaUTBmNU1xK2xreGE2U0EvamxuR1YrMlZ2RWdoR2hzR3JML3dlU3dW?=
 =?utf-8?B?ZGV2M1VDWlphWHFQRS83aGlHY1BpZ3RsTmpuQWhxMWxENFg3elp4S2xtY0JV?=
 =?utf-8?B?MHNreGRuVkEzcERCVFhZM3JaQTZadS91bFZhTHF1akNvVCtUekxobXN4MFVB?=
 =?utf-8?B?U1Q5Q1B3MWdXWWVRZkZLQkp2SUxZcE5NUmh4aUxTVHRVbGhnNjJQdmovSlpM?=
 =?utf-8?B?QzdnQ3dLT2R6V2poMjgzWkVGTGQxd1MreExGUEo0aENBWmRra1VDVG9kbkxW?=
 =?utf-8?B?d2diUWdibW9aWktlb0xIOUVBa1R5QWZRVWkxUnRrcVZwS00remZMMHJ3TEI5?=
 =?utf-8?B?U1ZCMzZXRm9zZjExekVGMGE1NDJkRzNDWWtMWlppeWVVVTJyVTNZNWZEckcv?=
 =?utf-8?B?ejhjelB1TkZHRXVlOVFzbGtvcHQ3S2ZMejFNU0pIdTIzMGVOVFNhUXpuaGpY?=
 =?utf-8?B?aFFrUER4aDZBTENiM2xyeGIwOFlGWkdmemJrSUcrMXRwZ0hsRUZTMWZydkFj?=
 =?utf-8?B?a21MeEdQalo4bS9Pb3dkNG1vaXA3WDI3LzN6ZUp0R1EybDVES0krR3JRSXIy?=
 =?utf-8?B?d0VQMjNKcWlJQVNwTFltZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8805.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OWx3Z2Zrb3EwaHU2VExsQnBKb2hBTmt0TS93SDVxM3lqTkFNZmFnUDNIWUhX?=
 =?utf-8?B?clhvYUtOa1o1SXl5RWczOG1VSkJ0VldveHdZTFZsN2FHUFpvRG5SVXNQaVZi?=
 =?utf-8?B?c1dxTENPMnFncmZ1SDZGOEkyN0RMYU0veUp5NEJoazl5SjNnMjM3eEhKVm52?=
 =?utf-8?B?T2RZYmZwcmZndmVsM0Z6YjNFeGM4Y3NEMDZVV2tLbGZLcW9PcUJJekpTc2tN?=
 =?utf-8?B?TG9MVTJxcGEyQythZmExUytVVFRhVU0ycURtUVRtOHdhaDg1b0NGdUdRL0pa?=
 =?utf-8?B?UGk2cGtYVjdPclVpUENPNUxMQ3RJakVOeHFTbGowV2NUNTlpK2xFSUVKZG9P?=
 =?utf-8?B?YklCVzlLcmNoOHVJVUdFU1ZOK1NzMkRTdktURHZ4NjlxeDlXMzZxeHIzb0Zr?=
 =?utf-8?B?MHhwOCs3d0l1RDM5ZTlFY3BWWXU4Tit3T3QrejQyYlRxN3BMS0VyTXY0ZHNS?=
 =?utf-8?B?dUhQbnduOUxHVTV4WCtyRGR5di95RkN3U3V5eGlHbzkxVnJBRVMxb0dDb1dn?=
 =?utf-8?B?T2lDVEFxc1N6aFJGNFg1YUl1djBUSUxkYnMwZDkzb0hvTEkzc0N6RXNDTEZO?=
 =?utf-8?B?WitiV0t4ekp6WGxYZ2U5akRWczFpL1FRZExubDYvK2hVcjA0ZXFqTmJ3cFhB?=
 =?utf-8?B?L0FVejYxVFp6S3l3WExBL3lUWWZab0Q0VjBDTFcyeE9FUU5IRXNwN1M0eExm?=
 =?utf-8?B?azBlSE1YNWVQVGdqcmowYTljSXpoRUN1RVlNOXJiOTlLSHpvMzd2NDNRKzJu?=
 =?utf-8?B?eGw0NkRvUGJlSmxOUld5amRrVkxrUWhqYTVJNy93cVREV2dHUmN1OXlRU3dQ?=
 =?utf-8?B?bXBKc0thcEQ0ZG1LU01kVjRRWVA3MnVWMlVEcXR3dmNCc1dCNFk4MnVvM3kx?=
 =?utf-8?B?Zkk5TlA2MHZkMnZjYk8walVsMmQvWkprSHVSM3VRdVdBT2dKODhFK0l2bytj?=
 =?utf-8?B?M0hFMGxJS21MTnhKeitTNnNueG5rNjJvTDFjeFEvQ3dIazR3UEVleHNNODBW?=
 =?utf-8?B?clMrL3hXdVNOY1dtdmJrbEd0bWhvOUxrV29UZGhKWG0xbFlFb1dpTkJienV1?=
 =?utf-8?B?NklpYTg2bjRSTHdEcEQ3WFZDV2YvSTE3ZXJsNkpWaDdVdEtITzI4Tk5JT1di?=
 =?utf-8?B?OUgrdmdoa0RxRTJXZitpYTg1ZEwwMS9NdE14N2VYNU05QVJHSkF1azBXQUdT?=
 =?utf-8?B?THJqMEhGQTZuZzFsbnhNczBFT1VuZWRJNjA2cFVRWkFvYkx6dm8vUGozdEFw?=
 =?utf-8?B?ZmVXdFpRZUtGMlR6b1JIT0UzMW54cEN0Mkp3THhMYjhTaUFtSGM5OG1SeitL?=
 =?utf-8?B?NDNNTHhqem1DTVNXcG9tWHk1VEt1TFZvd2Q1OHFjN21DM3pSazhsVHMySFZ2?=
 =?utf-8?B?Uk5JdjVKZzkzNDZtZzVic2VtQ0tmRFdlZFI5QmV4QUtiUWZRcGRIOGhid2xO?=
 =?utf-8?B?WjNkQWRZMFhrbmVwZlM5bnc4ajBKSTB2Zmp2QUNoMnFTNUdBT0JGMEw0VnBx?=
 =?utf-8?B?WVRQV3k5cVk0SlRBQ0czcGgyNFBMUEI2ZURnNDlTMFozTGRHc0JtRlM2UUhs?=
 =?utf-8?B?dUNwWVhtRXBYZkxMMk9GWC9SY3NWQlJhTzNFYXhBWDN3eTdOR3p1M2UvRHNm?=
 =?utf-8?B?bFhEbTNBSy9jbHFIeFVYK0dFdFVnMGI5ZmhYcnVIT2o4U0RTWWgzTlh1Q1Rz?=
 =?utf-8?B?TFBkeFlOR1Q1UWxCTWZoVk85NFZOTHZSK2dmL2pmR2FMWTFaOVlqbGlIMllO?=
 =?utf-8?B?RW8rTnZHZE9zdFFVMW1iSmIzYzlKdllab2JZeEpaZUQxU0xtQk5LZWcraEhO?=
 =?utf-8?B?SSsvVmdxVWd5WHRjRlZSTHphZnd6cTVyd3BHc2pIR0RERGlTRVVPNjN4ckoy?=
 =?utf-8?B?V2dHRnIvejUrQmE4M2JLbDlRVjVncHhvUE1TYXczTmtGWWpDdk8xSmRzU0JM?=
 =?utf-8?B?cU9ZUDZJUXNlSnlyMG5NNlFVZDBud25GdEJiOS9vVnlQYjZCZmUyV1VYSTFj?=
 =?utf-8?B?NHNsN1BOb1BaWlVoN2xGN1FYY1dFQUN1bkRzblRPdlhCVXdnclc4emhGUldO?=
 =?utf-8?B?RjRGREZQNnFCaTNhV0ZXNWJuOEJSNnF0SnFiNDcvdmlqcTN4c24yL2s0QkxE?=
 =?utf-8?B?STJRellWRTR0OU1ZZFRYRkhmRXVDcGVISGIxcit6dFZkVlhETUMzN1hab3pW?=
 =?utf-8?B?cGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D212373E1AF694CB36D30CD372BB1DD@eurprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d66fc3-4ef5-460d-7872-08dc795f1107
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 06:27:19.3887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eNKj1kgiFVnKb6RCdEE9MMRVupzK0oBWgeQL/Q2Yv5NS7BbgStYYOmKg3kv6FXYd742ucFYpQWGZgGLQCBvtHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9673

T24gRnJpLCBNYXkgMTcsIDIwMjQgYXQgMDM6NDI6MzFQTSBHTVQsIE1hcmsgQnJvd24gd3JvdGU6
DQo+IE9uIEZyaSwgTWF5IDE3LCAyMDI0IGF0IDAyOjU4OjAwUE0gKzAyMDAsIEFsdmluIMWgaXBy
YWdhIHdyb3RlOg0KPiANCj4gPiArc3RhdGljIGludCByZWdtYXBfYTJiX3dyaXRlKHZvaWQgKmNv
bnRleHQsIGNvbnN0IHZvaWQgKmRhdGEsIHNpemVfdCBjb3VudCkNCj4gPiArew0KPiANCj4gPiAr
CWZvciAoaSA9IDA7IGkgPCBjb3VudCAtIDE7IGkrKykgew0KPiA+ICsJCXJldCA9IGJ1cy0+b3Bz
LT53cml0ZShidXMsIG5vZGUsIHJlZyArIGksIGRbaSArIDFdKTsNCj4gPiArCQlpZiAocmV0KQ0K
PiA+ICsJCQlyZXR1cm4gcmV0Ow0KPiA+ICsJfQ0KPiANCj4gSnVzdCBmb3JjZSBzaW5nbGVfcmVh
ZCBhbmQgc2luZ2xlX3dyaXRlDQoNCkFoIE9LLCBpLmUuIHJldHVybiAtRUlOVkFMIGlmICghY29u
ZmlnLT51c2Vfc2luZ2xlX3JlYWQgfHwNCiFjb25maWctPnVzZV9zaW5nbGVfd3JpdGUpIGluIHRo
ZSBpbml0IGZ1bmN0aW9ucyBiZWxvdz8NCg0KPiAobG9va3MgbGlrZSB5b3UnbGwgbmVlZCB0byBh
ZGQNCj4gdGhlIGhvb2sgZm9yIHRoZSBidXMgdGhlcmUpLg0KDQpJIGFtIG5vdCBzdXJlIHdoYXQg
eW91IG1lYW4gYnkgdGhpcywgY2FuIHlvdSBlbGFib3JhdGU/DQoNCj4gDQo+ID4gK3N0cnVjdCBy
ZWdtYXAgKl9fZGV2bV9yZWdtYXBfaW5pdF9hMmJfbm9kZShzdHJ1Y3QgYTJiX25vZGUgKm5vZGUs
DQo+ID4gKwkJCQkJICAgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcgKmNvbmZpZywNCj4gPiAr
CQkJCQkgICBzdHJ1Y3QgbG9ja19jbGFzc19rZXkgKmxvY2tfa2V5LA0KPiA+ICsJCQkJCSAgIGNv
bnN0IGNoYXIgKmxvY2tfbmFtZSkNCj4gPiArew0KPiA+ICsJcmV0dXJuIF9fZGV2bV9yZWdtYXBf
aW5pdCgmbm9kZS0+ZGV2LCAmcmVnbWFwX2EyYiwgbm9kZSwgY29uZmlnLA0KPiA+ICsJCQkJICBs
b2NrX2tleSwgbG9ja19uYW1lKTsNCj4gPiArfQ0KPiA+ICtFWFBPUlRfU1lNQk9MX0dQTChfX2Rl
dm1fcmVnbWFwX2luaXRfYTJiX25vZGUpOw0KPiANCj4gU2hvdWxkIHRoZXJlIGJlIHZhbGlkYXRp
b24gb2YgdmFsX2JpdHM/DQoNClllcywgSSBjYW4gYW5kIHNob3VsZCBlbmZvcmNlIHJlZy92YWwg
Yml0cyB0byBhbHdheXMgYmUgOC4=

