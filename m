Return-Path: <linux-i2c+bounces-3606-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCED8CA81D
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 08:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53DA0282AAB
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 06:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52AA447A7C;
	Tue, 21 May 2024 06:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.b="ibJEDjeA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2131.outbound.protection.outlook.com [40.107.21.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE63510A1A;
	Tue, 21 May 2024 06:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716273989; cv=fail; b=S6tq+ebFb1sJrUnk8q3rBBspADT8rkoE7q5+akrmdkWIe+niurvtlwEat2poToLfNjZ8Kg4Y9vDnTON9wL+1WCF43E33j6AUOwD2JD0F8D/rdBicjVvZn9q36S2UrgmOj/1IJWHFg0FPAYQ3BPYZfxVEjOCdC04pb3gVfpkfY3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716273989; c=relaxed/simple;
	bh=lUGaIxvEhGXM+5vcNYxtk6vqFVPHYsePhBOaT+GhOrA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EgqVtBGZgndDMZPTXFNR5qk+H+WqzfrkRqI21X7Vp8wj3VuD4ZxHW29YA9Q9IWgnkzUo3190rvoWPR7UvhCRrQsk82HyvR/Mz7MHZsWjQXXsWQ+4gpUUrdXmXkIQuuEPShjzBm0DDUVKZQtT7aCIjptTHT3i5GHugJro4wkSnC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bang-olufsen.dk; spf=pass smtp.mailfrom=bang-olufsen.dk; dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.b=ibJEDjeA; arc=fail smtp.client-ip=40.107.21.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bang-olufsen.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bang-olufsen.dk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWIHiXP6g6wO3qqMUcecVEowd0FO7O3Em44JeSFiqHhbsZ/w68azz0zxJluLhiRi6NEOwNejLKy/99yFQrXL83j96fHD/DR0J54tUwhHDcaBd5DxguFfigZHCpSctoicEcqGFSlUhQMDgsoUOp1NvviBsXsHixALAJIHdhqDWCNHFb2CbTMsr3nzcogu6QR0CovwGXIUbRK7n20zIYJNDFnSA7XmlXUUaQwB+E7meRYX3skJQSvCoPhH1ug/AKmKaPAbrmvsYciC+AhFv2lsah8kHdDMU446tEtH7mnnoyyon2o/39c5beBnDKZoKJ+oJ2Dt0WrDdNbE6HM7CDKnHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUGaIxvEhGXM+5vcNYxtk6vqFVPHYsePhBOaT+GhOrA=;
 b=My8nrVzhCiLfY8wFyt1wwgmghQmBeW11d8ms14PGlw23/8J2qCAVBx7slyiuHloojkewM35iTCzjaJI9i9A+egdrJA5Rm85hKZ3tbxBQezxyGY7k5CQ8IR+RvU7nSipICH+Ba3OrMgpmEEZ2sRNv7CVBQEu/o91tXBB7nhxhZgAimFvQ3kaFg1Jw7Ju60CsKL7enMbA0aLwguAcuhcd+KmazWRZjgs0jHMUcSg5IXqLAGNkTW9QBZStFDsOH/rEuiATXo2OIKRBha1tQ69XvWUvCxoHTsmQPAc6V8CJ898JYhIoTJhjklb1BSY0c7Iv+Xn8ZxBpZ62Ytnqn0cRyQ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUGaIxvEhGXM+5vcNYxtk6vqFVPHYsePhBOaT+GhOrA=;
 b=ibJEDjeAojhOpKwQiX2Y2Jj8lDAcTbcnJsB5xSTvBYJkrGDgFC8y2xmuVnLcrLT0w5n4p1Vh0WSlsl2HzW/2wti9DFpgmhPeNc846sunWKjkaj834k2MV+NLA1/I6ifZaughxi3n5Yyji0JCq9nzyYhq2KP0rgSgzWwSNosPXO8=
Received: from AS8PR03MB8805.eurprd03.prod.outlook.com (2603:10a6:20b:53e::20)
 by PA6PR03MB10307.eurprd03.prod.outlook.com (2603:10a6:102:3d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.16; Tue, 21 May
 2024 06:46:22 +0000
Received: from AS8PR03MB8805.eurprd03.prod.outlook.com
 ([fe80::6ac3:b09a:9885:d014]) by AS8PR03MB8805.eurprd03.prod.outlook.com
 ([fe80::6ac3:b09a:9885:d014%5]) with mapi id 15.20.7611.013; Tue, 21 May 2024
 06:46:22 +0000
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
Subject: Re: [PATCH 07/13] ASoC: codecs: add AD24xx codec driver
Thread-Topic: [PATCH 07/13] ASoC: codecs: add AD24xx codec driver
Thread-Index: AQHaqFo0SMnbu61NEECPfAr7oK1v6LGbhiUAgAW+UoA=
Date: Tue, 21 May 2024 06:46:21 +0000
Message-ID: <edv5aqfnb5gdxfmrh5nywnzg3tzfdq27kfvpkhg2t2q2jwf7ej@vjqgiw3ssv3b>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
 <20240517-a2b-v1-7-b8647554c67b@bang-olufsen.dk>
 <e5782aef-d64d-46f3-ab5c-dc01285e08c2@sirena.org.uk>
In-Reply-To: <e5782aef-d64d-46f3-ab5c-dc01285e08c2@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB8805:EE_|PA6PR03MB10307:EE_
x-ms-office365-filtering-correlation-id: 9b7ce719-3a06-47d8-e8ef-08dc7961ba0f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|7416005|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?blo0anNvd3l5MUE0WTQ0Q0J0SkcwTVlPYlVpTEJSZ3dHdmpSU3U1N3hqSUJs?=
 =?utf-8?B?UVBPZFZVL3MxcUJhR0FtR043RDJlaHRIVVNkeDRwN2tDbDVydEZMaEljN1lQ?=
 =?utf-8?B?aWc4ZTJmZWc3SFNSdXVWTUlqKzFTV0lRZnFtd0R4WVMyNWdVTllMZldWRVY1?=
 =?utf-8?B?d0h5MGRuWlJZQk10VmVoNXNiS2J3ZHpXWU5zMVNmZERrRmR1YTFkYWY2b2NF?=
 =?utf-8?B?K2NNSURaSllYL043dkMxOWc3UnhSWFhyKy80Zm8wVWtUWTVNR0F5d05yTlF4?=
 =?utf-8?B?NzJMWXk0K3RlRnN2WWJDN0RESzVpSEZ5Z0xFWGdEL2pmNUtLQnRjLzdONG02?=
 =?utf-8?B?TU9aY1pFZkZkSkFiZmhrTWpvVXJJSjR6Znl3VjR3aytPNjBqTlAxN3hWbjB4?=
 =?utf-8?B?OU1xZ09yNkRlSjAxZ29ZMytwTXROMStPeUxJNmdqS0RmZGdrS2xiaEt0eTFB?=
 =?utf-8?B?Mmo5SjIvV0NBRlZtdFJBam9LUUhxQ2lGalZhUDV5OUtzbXhteVp2Nm1DNVVq?=
 =?utf-8?B?Ukcvc3FKZTQ1TnFkdlo4c1dONi9HbUx6aGhFL3lpZElyZVY3eHQ3aDJqS2M4?=
 =?utf-8?B?cFFyU1lVZ3l4YldoN0g0RlR2alhJaFBaUG9vNUtXdTZuTEdlVWNxT3o0WlFX?=
 =?utf-8?B?bWdlajJyWm5qdHR6d1BLYzNGZEZ5ZkV1YXR5UzlJN1M4ck5nTHA3YzRWeWov?=
 =?utf-8?B?M1h5NHpOTGdnSFp1NEw2cVYwOVBDNDg3eGx4a0VaQzlYQXMzNVl3RnF6Y2lX?=
 =?utf-8?B?a2FxRllMRG45b1dRSGI2ajF1eWwyeFJKVGdyTlk2R1RXL3EwaUFCcGlqS01M?=
 =?utf-8?B?L1JoZnFuRFdjam1zUm5ZZ0QvWncyUHQwWXBsek9kWENyVVZPUEtzWjVkWnhm?=
 =?utf-8?B?Z0pXQXhKQWo3dkpTbFd2cG01cU5NS3FzWFRWcVRRdTZxbUlsSnRra1NVck0z?=
 =?utf-8?B?cVF0NzVxY1RlZ2lkTXdkcUFwc1ZucWJMSjFkTGJjOS9Zb2k4NXk4RVVnMVNt?=
 =?utf-8?B?KzVIOFBxK1hjR3haZVJZeDl6bk1KMUJGakpXcXUya3FQRWUyZldLV1FQSUZs?=
 =?utf-8?B?a09JT1Ixd3hVbmtFS3hSWFlJbTVJSWVSUXliUHdzVy9zcVlSL1Bib2tDR1Qv?=
 =?utf-8?B?V3JMcHFYTE5PNTEwcHJveldMTlVYM2twMTIrWDNIRjMwT3R3RjVCRTdSa2RK?=
 =?utf-8?B?YVdYZlF0QWZ5T0F6dmxwRDU1amJMdTBnUS9jRzlhR2laclNKOG93SThma2Y2?=
 =?utf-8?B?a1RRemM1VFVmbzVzVHpsSUVFWDRPVlBzeTNjRHM4bFFNdHpmdDZMcEVRN1Ey?=
 =?utf-8?B?enBvZXNDd216UkVxMnpVWTdXeWI0T1A5VGp6bFl6ajkzS2VFSXUvVkpCSUlF?=
 =?utf-8?B?RDZJN1dsMDJtR1JtSDUrMmRTblVaOHluczQwY3RsOWVpdmhWbWxUVHlVVTdt?=
 =?utf-8?B?eDVoYk5GMnNxb1BEckgwR3U0M0FyOHRYOXRpNFExYldYaW1jTVJNYndLaFl6?=
 =?utf-8?B?UmpIcS9nTmdVMmNiY2RVTTVNb3orN1FOT2p1ZlRmb1Nva2s0eXM5VWptTkdU?=
 =?utf-8?B?T0lLSnRpdTVTb2RKYkFESC9hOWN2bmwvTjB5WHNiTzNLOW90RVYzOUdST2p1?=
 =?utf-8?B?OTBFLzdyakd5dENRcGVIeC9zMDVZV3YxN1U1bXgydlgxVEVacWQrQk1DOTZn?=
 =?utf-8?B?YkQvYUVRVUduc3FRUWNWS1hKNFJlcHFxRXRUQ0ZtTHRFbUxxKytwbDR1ckZh?=
 =?utf-8?B?emJEamcyVGNqYUVQeGMzSlhmTkRWenh3bDZDeUtreWd2RnhGK3VCVFJ3SDNy?=
 =?utf-8?B?dTFmY2IwM3VCRGlSMjlmUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8805.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YzJ5MjhUa2hMNFFRamlBcWRGUnEwTXJCTHR6dzROcTVKTUtkemVsblBXNkJl?=
 =?utf-8?B?dmEvbHdLcll2bG1iSVRkUFozeWl1SmFRNWo3L3UrdEl6M0NHYnhzN3kvK1VK?=
 =?utf-8?B?T1hPK0duQUVmWndKWElNQml2ekpLTlN6NDNKKzl4RmRzdEl6VHhXeVpuMlFE?=
 =?utf-8?B?Um1Qb1pHS0RCUFBuMGQ1bUw1dUpvT2hRamdXb1VSZHk1SmRUY2JiNzYrU3hX?=
 =?utf-8?B?WlcvcTFRYkNoUzhUdmxmNjY5L3RjSUdzUnJrRmRjYTVrVFM1SnlyQXd1OTJT?=
 =?utf-8?B?bDZ1N3B5aG9zUnNnaFZaa0hialc0R205Mk5CNmxmeDdzQThsSVcvUTZWZ0hp?=
 =?utf-8?B?MEk5ZkY0bzhFdXQvOUI2MzBTekxoS0FzblZNR1pHcytHc0tORFRuSVNlNVBJ?=
 =?utf-8?B?UzB3Yzhtb3RwaUJPSTVjYi9xZ2NEVDlpaUhNVkQ5MFFHY2ZHSEZ4U3dBVFhh?=
 =?utf-8?B?RnMxeTNaci9XQ3pERkczOHlpM2dmNFVEbTAxbWhpMmdRTWMzb24wS1g5NFl4?=
 =?utf-8?B?SUdrbndRcHI2L0h1YVRDYTBtMnl4OWlyN3o5NVN3dzNyRmRZbFFTNGhkR0Rz?=
 =?utf-8?B?eW42Y0VJSitGWHc5NFVXY1JCZFhaUGlXRzlENFU5WHBGcmt2ZFVtMUdjLzhK?=
 =?utf-8?B?NkI1U0dlOG55SWprNFV6NmV0Vk12eXV6NlB4WDhNcHFGL2ExZmdBcHFncEll?=
 =?utf-8?B?cTljMVQwbUNXUXFaK3ZnYnc5c1BpQmRFZTlEZHZkZDRNRTE0VlYrNXJlTE1K?=
 =?utf-8?B?TzY0V0luZjJ1MGdPOWt3U3VPUm5Ud0JXTk5BaGRreUZNbFNyZnZpamFiZ29C?=
 =?utf-8?B?Sm5TMDlHaW9FaTBkZ3c2RE9ITjkxdVdDRWxWT0k0Ny9jVko1VzZSUW53TEVQ?=
 =?utf-8?B?SFVIWE5GM3pTSW9KWDJFS2puRnhnMGtXaFMrZVhwMmMrNDZWL1UvZUV0MWts?=
 =?utf-8?B?ZW1yYUhBQ0RXNFloTkhBMXFXSUd3SEwzcmdnM2ZlVWxnRGt1OGl2R254SGpo?=
 =?utf-8?B?L1cwdkxUUmhBTTlWTjBiTTYrSm1tQWt3bjZkRDE2b0RDdjN4VzlRejJUYU1Y?=
 =?utf-8?B?SGpjUzd3aUtXU243SFh1VElhV3NNT0tDM3EyMEd2UGprUGM1RWlyRVRpN21w?=
 =?utf-8?B?WVJKVTY5dDdyNGtWMmt4ZHorSW1YbFFtcU8vTDc4NmlWaFRQS3ZTenJyYVhP?=
 =?utf-8?B?NEV6dXNPTUtCejJqOFNnK1Jkc2pyMVhtamVMMDZsSjc1UFhXNmhVM3hDdEpX?=
 =?utf-8?B?U1VJWVZBalJaMWc4MTc2bTZ3YWl4SG5tVDdYSEZzNXo1K0Q5ekI2M21OdlJ4?=
 =?utf-8?B?RnF3dmZxd2JYR3NkbVd2UFNxNlplZ3h6MjNGSU5LWC9RK2dYYTI2MFlHQVhB?=
 =?utf-8?B?U2NFK1VmUW5lWEwrZDZFWTErc1lzSG1OTmNVM3ROU1VzcHlrMnBhd1I2TmlO?=
 =?utf-8?B?TXIvZ0pRVHRmV3l1QkFEWkJPaTIxSEFUWENxejUyWTloWXdTUHRDbHN2ZVp4?=
 =?utf-8?B?bVl0YmJTOC8yMWtuN21sTFlsSmRZYVdmL2RQSWhKb050WElQWUtnTVlqdkFw?=
 =?utf-8?B?ZThNQ3hmL0hZSlZ0M2NzRHUrZXhRNEw2RW1jODMvQ21DaU04MkNJdlUzMkM2?=
 =?utf-8?B?aXpYNkw1T1B5VnE4TEppazN4ajdSQmNoTlZjM1ZNeHkzR2pmUHhJS1ZhbXQ2?=
 =?utf-8?B?bU9scmNLZS9BWUxmVGFzVjc4NjdBbkFSbExtdXdQN0FjbVdWdFRhN1BiQStY?=
 =?utf-8?B?Vm5iM2RuOXZiV2xUZFJPUXF4MjBFYSt0RmdweWE0eGdOMG1uV2oyQjArM01u?=
 =?utf-8?B?OHF3TEk3OEVoeVU3bDVwK3dwblNGanRuQjJjUVdqd25nT2ZzcGJBMnpRUGt0?=
 =?utf-8?B?YVRjZFRDN2FyYklVMFMrUjJ4NUlNd3ViYVhHZUxIMUx6ZCtVeUpzcW85azZy?=
 =?utf-8?B?d2sreGd1MGJXWXArd05ES0ZLQVE4RGZzYjhjQzI1aGkvVmxDTlU3dUNOazA2?=
 =?utf-8?B?NmhBbUppYzhlelJNVFgxbi83NDNBaEpacW1sWTVLbUNZRVJiNHM0UVNua3BP?=
 =?utf-8?B?QnUwYmM0cUg4eUhQYnpnc1FYM2NFREwwMWJ1OVEzOEpKU2grOXN1R0IwV0U2?=
 =?utf-8?B?ejBoLzg4REJWcy9IUjFlSXZHSndhSkt3cTdrUWRSdkVjQW5OaVlaL3NQOGxi?=
 =?utf-8?B?L3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6096C915A5472848A15619D0F3F62380@eurprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7ce719-3a06-47d8-e8ef-08dc7961ba0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 06:46:21.9855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DituBkLJymu/jFq6bIS8w0dJIVXSOhhv5NfiUgmprtIT4DII6On9VXPbgolmKCeFMb57XX82JQHCyYC+1+U5dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR03MB10307

T24gRnJpLCBNYXkgMTcsIDIwMjQgYXQgMDQ6MDM6NTBQTSBHTVQsIE1hcmsgQnJvd24gd3JvdGU6
DQo+IE9uIEZyaSwgTWF5IDE3LCAyMDI0IGF0IDAyOjU4OjA1UE0gKzAyMDAsIEFsdmluIMWgaXBy
YWdhIHdyb3RlOg0KPiANCj4gPiArKysgYi9zb3VuZC9zb2MvY29kZWNzL2FkMjR4eC1jb2RlYy5j
DQo+ID4gQEAgLTAsMCArMSw2NjUgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAtb25seQ0KPiA+ICsvKg0KPiA+ICsgKiBBRDI0eHggY29kZWMgZHJpdmVyDQo+IA0K
PiBQbGVhc2UgbWFrZSB0aGUgd2hvbGUgY29tbWVudCBhIEMrKyBjb21tZW50Lg0KDQpPSw0KDQo+
IA0KPiA+ICtzdGF0aWMgY29uc3QgY2hhciAqY29uc3QgYWQyNHh4X2NvZGVjX3Nsb3Rfc2l6ZV90
ZXh0W10gPSB7DQo+ID4gKwkiOCBiaXRzIiwgICIxMiBiaXRzIiwgIjE2IGJpdHMiLCAiMjAgYml0
cyIsDQo+ID4gKwkiMjQgYml0cyIsICIyOCBiaXRzIiwgIjMyIGJpdHMiLA0KPiA+ICt9Ow0KPiAN
Cj4gV2h5IGlzIHRoaXMgY29uZmlndXJlZCBieSB0aGUgdXNlciByYXRoZXIgdGhhbiB2aWEgc2V0
X3RkbV9zbG90KCksIGFuZA0KPiBob3cgd291bGQgb25lIHVzZWZ1bGx5IHVzZSB0aGlzIGF0IHJ1
bnRpbWU/DQoNClRoaXMgY29uZmlndXJlcyB0aGUgc2xvdCBzaXplIG9mIEEyQiBkYXRhIHNsb3Rz
LCBub3QgdGhlIHNsb3Qgc2l6ZSBvbg0KdGhlIFRETSBpbnRlcmZhY2UuIFR5cGljYWxseSBvbmUg
d291bGQgZXhwZWN0IGl0IHRvIGJlIHRoZSBzYW1lLCBzbyB5b3VyDQpxdWVzdGlvbiBpcyB2YWxp
ZC4gQnV0IGl0IGlzIG5vdCBhIHN0cmljdCByZXF1aXJlbWVudCBhcyBmYXIgYXMgdGhlIEEyQg0K
YnVzIGFuZCBoYXJkd2FyZSBpcyBjb25jZXJuZWQuDQoNClRvIGdpdmUgYSBjb25jcmV0ZSBleGFt
cGxlLCB0aGUgVERNIGludGVyZmFjZSBtaWdodCBydW4gd2l0aCBhIFRETSBzbG90DQpzaXplIG9m
IDMyIGJpdHMsIGJ1dCB0aGUgUENNIGRhdGEgaXMgaW4gcmVhbGl0eSAyNCBiaXRzIHBhZGRlZCB0
byAzMg0KYml0cy4gSW4gdGhpcyBjYXNlLCBBMkIgYnVzIGJhbmR3aWR0aCBjYW4gYmUgc2F2ZWQg
YnkgY29uZmlndXJpbmcgdGhlDQoie1VwLERvd259c3RyZWFtIFNsb3QgU2l6ZSIga2NvbnRyb2wg
dG8gIjI0IGJpdHMiLg0KDQpNb3JlIGRldGFpbGVkIGluZm9ybWF0aW9uIGNhbiBiZSBmb3VuZCBp
biB0aGUgbWFudWFsIGluIFsxXSBzZWN0aW9uIDMtMjINCiJJMlMvVERNIFBvcnQgUHJvZ3JhbW1p
bmcgQ29uY2VwdHMiLCB3aGVyZSBhbiBhbmFsb2dvdXMgZXhhbXBsZSBpcw0KZ2l2ZW4uDQoNCj4g
DQo+ID4gK3N0YXRpYyBpbnQgYWQyNHh4X2NvZGVjX3Nsb3RfY29uZmlnX3B1dChzdHJ1Y3Qgc25k
X2tjb250cm9sICprY29udHJvbCwNCj4gPiArCQkJCQlzdHJ1Y3Qgc25kX2N0bF9lbGVtX3ZhbHVl
ICp1Y29udHJvbCkNCj4gPiArew0KPiANCj4gPiArCX0gZWxzZSBpZiAocHJpdiA9PSAmYWQyNHh4
X2NvZGVjX3VwX3Nsb3RfZm9ybWF0X2VudW0gfHwNCj4gPiArCQkgICBwcml2ID09ICZhZDI0eHhf
Y29kZWNfZG5fc2xvdF9mb3JtYXRfZW51bSkgew0KPiA+ICsJCWlmICh2YWwgPj0gQVJSQVlfU0la
RShhZDI0eHhfY29kZWNfc2xvdF9mb3JtYXRfdGV4dCkpDQo+ID4gKwkJCXJldHVybiAtRUlOVkFM
Ow0KPiA+ICsJCXNsb3RfY29uZmlnLT5mb3JtYXRbZGlyZWN0aW9uXSA9IHZhbDsNCj4gPiArCX0g
ZWxzZQ0KPiA+ICsJCXJldHVybiAtRU5PRU5UOw0KPiANCj4gSWYgb25lIHNpZGUgaGFzIHt9IGJv
dGggc2lkZXMgc2hvdWxkLCBzZWUgY29kaW5nLXN0eWxlLnJzdC4NCg0KT0sNCg0KPiANCj4gPiAr
DQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiANCj4gVGhpcyB3b24ndCBmbGFnIGNoYW5nZXMg
YnkgcmV0dXJuaW5nIDEgd2hpY2ggd2lsbCBtZWFuIG5vIGV2ZW50cyBhcmUNCj4gZ2VuZXJhdGVk
IGFuZCBicmVhayBzb21lIFVJcy4gIFBsZWFzZSBzaG93IHRoZSBvdXRwdXQgb2YgdGhlIG1peGVy
LXRlc3QNCj4gc2VsZnRlc3Qgb24gbmV3IHN1Ym1pc3Npb25zLCBpdCB3aWxsIGNoZWNrIGZvciB0
aGlzIGFuZCBvdGhlciBpc3N1ZXMuDQoNCk9LLCBJIHdpbGwgaGF2ZSBhIGdvLiBUaGFua3MhDQoN
Cj4gDQo+ID4gKwkvKiBNYWluIG5vZGUgbXVzdCBiZSBCQ0xLL0ZTWU5DIGNvbnN1bWVyLCBzdWJv
cmRpbmF0ZSBub2RlIHByb3ZpZGVyICovDQo+ID4gKwlpZiAoKGZtdCAmIFNORF9TT0NfREFJRk1U
X0NMT0NLX1BST1ZJREVSX01BU0spICE9DQo+ID4gKwkgICAgKGlzX2EyYl9tYWluKGFkYy0+bm9k
ZSkgPyBTTkRfU09DX0RBSUZNVF9DQkNfQ0ZDIDoNCj4gPiArCQkJCSAgICAgIFNORF9TT0NfREFJ
Rk1UX0NCUF9DRlApKQ0KPiA+ICsJCXJldHVybiAtRUlOVkFMOw0KPiANCj4gUGxlYXNlIGRvbid0
IHVzZSB0aGUgdGVybmVyeSBvcGVyYXRvciBsaWtlIHRoaXMsIGl0IGp1c3QgbWFrZXMgdGhpbmdz
DQo+IGhhcmRlciB0byByZWFkLg0KPiANCj4gPiArCXZhbCA9IGJjbGtfaW52ZXJ0ID8gQTJCX0ky
U0NGR19SWEJDTEtJTlZfTUFTSyA6DQo+ID4gKwkJCSAgICBBMkJfSTJTQ0ZHX1RYQkNMS0lOVl9N
QVNLOw0KPiANCj4gU2ltaWxhcmx5LCBwbGVhc2UgdXNlIG5vcm1hbCBjb25kaXRpb25hbCBzdGF0
ZW1lbnRzLg0KDQpPSyB0byBib3RoLg0KDQo+IA0KPiA+ICtzdGF0aWMgaW50IGFkMjR4eF9jb2Rl
Y19od19wYXJhbXMoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sDQo+ID4gKwkJ
CQkgIHN0cnVjdCBzbmRfcGNtX2h3X3BhcmFtcyAqcGFyYW1zLA0KPiA+ICsJCQkJICBzdHJ1Y3Qg
c25kX3NvY19kYWkgKmRhaSkNCj4gDQo+ID4gKw0KPiA+ICsJLyogRmluYWxseSwgcmVxdWVzdCBz
bG90cyAqLw0KPiA+ICsJcmV0ID0gYTJiX25vZGVfcmVxdWVzdF9zbG90cyhhZGMtPm5vZGUsICZz
bG90X3JlcSk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+IA0KPiBOb3Rl
IHRoYXQgaHdfcGFyYW1zKCkgY2FuIGJlIGNhbGxlZCBtdWx0aXBsZSB0aW1lcyBiZWZvcmUgc3Rh
cnRpbmcgdGhlDQo+IGF1ZGlvIHN0cmVhbSwgd2lsbCB0aGlzIGxlYWs/DQoNCkkgd2lsbCB0YWtl
IGFub3RoZXIgbG9vayBiZWZvcmUgc2VuZGluZyB2Mi4NCg0KPiANCj4gPiArCQkJCXN0cnVjdCBz
bmRfc29jX2RhaSAqZGFpKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQg
KmNvbXBvbmVudCA9IGRhaS0+Y29tcG9uZW50Ow0KPiA+ICsJc3RydWN0IGFkMjR4eF9jb2RlYyAq
YWRjID0gc25kX3NvY19jb21wb25lbnRfZ2V0X2RydmRhdGEoY29tcG9uZW50KTsNCj4gPiArCWlu
dCByZXQ7DQo+ID4gKw0KPiA+ICsJcmV0ID0gYTJiX25vZGVfZnJlZV9zbG90cyhhZGMtPm5vZGUp
Ow0KPiA+ICsJaWYgKHJldCkNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiANCj4gV2hhdCBpZiB3ZSBj
bG9zZSB3aXRob3V0IGhhdmluZyBjYWxsZWQgaHdfcGFyYW1zKCk/DQoNCkRpdHRvLg0KDQo+IA0K
PiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFpX2RyaXZlciBhZDI0eHhfY29kZWNf
ZGFpX2RydltdID0gew0KPiA+ICsJW0FEMjRYWF9EQUlfSTJTXSA9IHsNCj4gPiArCQkubmFtZSA9
ICJhZDI0eHgtaTJzIiwNCj4gPiArCQkucGxheWJhY2sgPSB7DQo+ID4gKwkJCS5zdHJlYW1fbmFt
ZSA9ICJJMlMgUGxheWJhY2siLA0KPiA+ICsJCQkuY2hhbm5lbHNfbWluID0gMSwNCj4gPiArCQkJ
LmNoYW5uZWxzX21heCA9IDMyLA0KPiA+ICsJCX0sDQo+ID4gKwkJLmNhcHR1cmUgPSB7DQo+ID4g
KwkJCS5zdHJlYW1fbmFtZSA9ICJJMlMgQ2FwdHVyZSIsDQo+ID4gKwkJCS5jaGFubmVsc19taW4g
PSAxLA0KPiA+ICsJCQkuY2hhbm5lbHNfbWF4ID0gMzIsDQo+ID4gKwkJfSwNCj4gPiArCQkub3Bz
ID0gJmFkMjR4eF9jb2RlY19kYWlfb3BzLA0KPiA+ICsJCS5zeW1tZXRyaWNfcmF0ZSA9IDEsDQo+
ID4gKwl9LA0KPiA+ICt9Ow0KPiANCj4gV2h5IGlzIHRoaXMgYW4gYXJyYXk/DQoNCkl0IG5lZWRu
J3QgYmUsIHdpbGwgZmxhdHRlbiBpdC4NCg0KPiANCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBy
ZWdtYXBfY29uZmlnIGFkMjR4eF9jb2RlY19yZWdtYXBfY29uZmlnID0gew0KPiA+ICsJLnJlZ19i
aXRzID0gOCwNCj4gPiArCS52YWxfYml0cyA9IDgsDQo+ID4gKwkuY2FjaGVfdHlwZSA9IFJFR0NB
Q0hFX1JCVFJFRSwNCj4gPiArfTsNCj4gDQo+IE5ldyBjb2RlIHNob3VsZCB1c2UgX01BUExFIHVu
bGVzcyB0aGVyZSdzIGEgc3Ryb25nIHJlYXNvbiB0byB1c2UNCj4gc29tZXRoaW5nIGVsc2UuDQoN
Ck9L

