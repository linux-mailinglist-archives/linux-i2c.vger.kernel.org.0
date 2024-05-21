Return-Path: <linux-i2c+bounces-3608-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 117018CA875
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 09:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD4D9284C5D
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 07:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631A14B5A6;
	Tue, 21 May 2024 07:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.b="EftjdsEY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2111.outbound.protection.outlook.com [40.107.8.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E00C4F897;
	Tue, 21 May 2024 07:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.8.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716275328; cv=fail; b=XG9z4Q2hqUNvdwmigfBG2dPxP5109UENWSuW68l3IBb4B9nfxEjB0tZ3g+g5S4gu9dfCVvTjFsQoz5DPtMxi1OfrMStSSC7sr66/3SZ4Dux7xOLKxVfLjsn8JD9HurZXiOOVi+tJeLO2SwrkDi5C3KRGGgjiWdduXZFzqI4x4m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716275328; c=relaxed/simple;
	bh=ujSm2z3FX/XNtHEYqK+gO5UW85UyvZm9OCkqHi/kcWQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dxU0LlE7EPd5yyibWS8ImUYwjTirU0gDXV/9ecPmDOG7KSQqrAKo4XpXI++3+rMziXqyPglSvPFF4m9eiCIwebe9ghX5F0Lrcd1Erqv/trXnQyh4d0YOUZC7oZvKIIanQN/lnReSzp4VIfI/KW0n1UskanswN9d8t51fDV5+Xng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bang-olufsen.dk; spf=pass smtp.mailfrom=bang-olufsen.dk; dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.b=EftjdsEY; arc=fail smtp.client-ip=40.107.8.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bang-olufsen.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bang-olufsen.dk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2O2Rm/9Sn4e7u9k32S55NIazqYpnDf3QNeBpsfOfls8DiFPAiahmCatCu8jkbG/YlieCdRSDsnlrsCU5nFd5OKfy6jjTrMzxpTDf7CLo+wWlX4F/9j+WQ9AkdaqO95Gq/JRHqmvIX6/+2KnG0W7WCKh+ihDh3dGJ8fecs6TGOAqf8RfUzUrQYW/hR8E0Isp+v6Etfczft5KIGFM0/AXHthEZApX445dmPqQ8xlkW/YHuAykXO2JM663lbUKgTlz6G/7z/mTVjLoWeYISsuFuNKYTlFM33QCOHcPGey8Y+rDNpUdllKytpx5hD9rjk5xRJYjnSp4HZ8PV0tINImfRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujSm2z3FX/XNtHEYqK+gO5UW85UyvZm9OCkqHi/kcWQ=;
 b=EKqX8UHggLMAE0F0AMdzmI3Cv9Lbq/AecgVFEEHv/959NVWLunX6dEfwfzvHDUvz3BlcXFxSgrXkiuKDbJ2ZQfZwMUcXEh20Opg5H7bIZ8mVWmHmH2hlL+FYk3ItRkuYJazNlWEpkcDSrVPuYY15Soom4S+dor+LrtPzPNMBmibDtO04TDVs5F006brbjfngDjrUkd8PMpTmwg8vg2KEnIAQpnP/7LCRRPXlb/xGfap/fTsXmZLz2W3nfnRMRrgrez48JkqIkeGUj6jFh42/IdFgRjIHRDOqy662/TjRMLxfUEn/iMSmwVE6YzLCIOyv4hkC0J6laf0FUTXVWHgulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujSm2z3FX/XNtHEYqK+gO5UW85UyvZm9OCkqHi/kcWQ=;
 b=EftjdsEYj3mKbQa03yxeIbTftKZEX0lW5nC0dwFto0yV+0q7BA5iSXuidrXuXXg3mi1lqWqqdu2I8oN0iiZAFl0uYnYTjbMKNt6hO7M+wpH/7GoS5K3t/0jq/lXM8BxN4ddoyjMTpFD+HyTzDOqHwoRdm9X/dlxn+7faMwt8nCo=
Received: from AS8PR03MB8805.eurprd03.prod.outlook.com (2603:10a6:20b:53e::20)
 by DU0PR03MB8463.eurprd03.prod.outlook.com (2603:10a6:10:3b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.16; Tue, 21 May
 2024 07:08:43 +0000
Received: from AS8PR03MB8805.eurprd03.prod.outlook.com
 ([fe80::6ac3:b09a:9885:d014]) by AS8PR03MB8805.eurprd03.prod.outlook.com
 ([fe80::6ac3:b09a:9885:d014%5]) with mapi id 15.20.7611.013; Tue, 21 May 2024
 07:08:43 +0000
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
Thread-Index: AQHaqFo0SMnbu61NEECPfAr7oK1v6LGbhiUAgAW+UoCAAAZBAA==
Date: Tue, 21 May 2024 07:08:43 +0000
Message-ID: <xy5vbu56qsyl4kxt3fvaag3d4x6in7447iqtns4kghq5cusk7u@bsmwqvzguuhs>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
 <20240517-a2b-v1-7-b8647554c67b@bang-olufsen.dk>
 <e5782aef-d64d-46f3-ab5c-dc01285e08c2@sirena.org.uk>
 <edv5aqfnb5gdxfmrh5nywnzg3tzfdq27kfvpkhg2t2q2jwf7ej@vjqgiw3ssv3b>
In-Reply-To: <edv5aqfnb5gdxfmrh5nywnzg3tzfdq27kfvpkhg2t2q2jwf7ej@vjqgiw3ssv3b>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB8805:EE_|DU0PR03MB8463:EE_
x-ms-office365-filtering-correlation-id: 88742cad-2204-4842-06dd-08dc7964d9b3
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|1800799015|366007|7416005|376005|38070700009|27256008;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZGg0TmltODFxc3dOcTlNcmVTSDhUU3RWai8wcU5QcFNDTFF5SG8yUVZwQXpv?=
 =?utf-8?B?K3l5ODM0d1dqYVoyQ1ROYmN3Vk40TjRRdHJ6bFA2V2hhQUQwOWNwY2o2dDYw?=
 =?utf-8?B?aGNKSnIySEFObDZRUnZkZXhpWXZnVFJkbUQrZ1A5Z1JYZmo3TU8rS1BiM2Zh?=
 =?utf-8?B?aksyM0JaMjFQYkNLYVE1RnpCYzdaYWNNR0Mza21lZlFmdEMyMUREUjFMb2J0?=
 =?utf-8?B?aWRpOW4vUXNWQ0hzZW0vTHZjd012bnF3ZDUxTW8zcnVtcWJid2lwWVNLRExR?=
 =?utf-8?B?eGtGVVpNTElSMGpiZFZhaE80RnpPOVkyeUdFRDJnYTU4WGdzSWw4bW9IVW4z?=
 =?utf-8?B?dDN2TUFHTXErYU5lditpT3NtcndmdlREbXZQalowUnYyNDNVY2RuQ096Ykxu?=
 =?utf-8?B?WGd6WklxcGx4K3pTWVRRUXdROTFNSFBadm1HZGNLb0VvUTlKNUI4Mk1uQjZj?=
 =?utf-8?B?b21LVTlaL1l2YWdZVlJaNDd3OVROWmRJenJONnU5cnBYQ29pUjg1cnRXamQ0?=
 =?utf-8?B?ZlIwNC9pNEx3OENoSWMwTWdMWDJyY1I5NE9pUDc0TG9wc2x6Vnp2TWUzSGl2?=
 =?utf-8?B?dkEzYTFBN3BzZlM0NEhTTGprWUlCN1N0K1VESEoydVFVQ3c5cXdjY0RYNVR3?=
 =?utf-8?B?dUs5MU53b3BqeUNDK3dqZUU0TEFaamVNVElDell1UCtiOG9aSEx0RVVkVDhZ?=
 =?utf-8?B?dlQrRjREZHIrRGFIKy9qRktZSjE2WnBJNko4eXhvd0I0dFNjZFdnWVJ1ZXRp?=
 =?utf-8?B?WFhOTXZONk1DWXFwR3lGWnFzZ3luaCt4UWgxTkZua2N2dEZSanhDcE1wWjVq?=
 =?utf-8?B?N3RXbnFUQTZDclFFWGFWNDhJRmVkcEo2c1JNbHh6V3VBS2I4WkZJWm5XRzZn?=
 =?utf-8?B?NitKemZWVVRTNE0rYW9GdWRPYVFMRHVKM1ZzNVpnNnVpM2E2MWdrTDlCM0pQ?=
 =?utf-8?B?VXRtWklTTExJN3k5bHhNRjZXMExXNlFHYmpEaWhEeXQ0eWFFemdYYnN5Nk9E?=
 =?utf-8?B?WlIrRnpuOU1DVWplSEZsM0YrUHBJZDJyMW1iK0Y4ZXdHTTFqcHIyQnRhN3Jx?=
 =?utf-8?B?T1BNdXRTelpHQkVYVFBFVytJZFBDRXA3L0g2NDRQd0FsaTZYYXcxRnhnRzk4?=
 =?utf-8?B?c2VuR1lSTE9ic0FPZ0dZNjlIaVNjdHAwQmFkR3B4N1JBTFZMU3RwN2NLZEFL?=
 =?utf-8?B?R0pWTW9tcGdyUzF5YStWcExCMlNjUHArNkF1Ryt6VFhPelh6eUpvdHEydE1q?=
 =?utf-8?B?UzNDeWErS3UySHQ3SmRzdUpEZWgvOTlQZWNtZnFRSmhhS25PQUgveUFEaUNU?=
 =?utf-8?B?MlNjVDRyZHpaYk1iT0wzQ2xySkhQWVZRWWNsREFFcTg5RUs1V1BxZFJlb2Nk?=
 =?utf-8?B?YUZpRE11UExLRlhoWG1OTy9MTUdPeUpQdFkyNjhmMFl2by9xZjJZK2J5OUs3?=
 =?utf-8?B?R2ZVQ3ZzS2U3c3JEVUFUSCtDWVB6UFNtNUZGZktCdGJLRDdRVHc0WERRMGdN?=
 =?utf-8?B?ZUJuWU1YK09nRC9semgzQVpjaEpYWDB3L0VBc25kb2ZSaFgzbUtNMHFYZG5x?=
 =?utf-8?B?R1VUK08vSDBlOTlkK2dScEp3bjJiNlBvRTlrMUhSTzcwaHdrQXZ2ZUw5Nk9D?=
 =?utf-8?B?S3FSYkI0M1NlSURMbDNoRnFOZnBabjN6MGx4dGFYRjdXdkZ3Uk9kOXhOMzEv?=
 =?utf-8?B?OWkxeGFoWUlUUlJiLzdwYUx0SG1Wa2l3MWREcFdLbDRPWGpUY2czTlVvMmNp?=
 =?utf-8?Q?55BATT9p1H2ZFkF/VMAoDbGjzPNe4evR4zcLETT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8805.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(7416005)(376005)(38070700009)(27256008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OW9vQ1JTQk1IclFLcWFMTTFIQlRSdVZFeVFWWXgxbm5sVFhLV2VaRSswT2g2?=
 =?utf-8?B?RVp4U2JyaUp0MWt2VGM4QThOV3BuN2xBZFBWUzVkV3laY09zZXVWZjlYMHE1?=
 =?utf-8?B?ei82R04yR2JmSitycUFoeHlBVVZZV3RSTHIrT2JobDlVNTlXeU9KaTlDYmZh?=
 =?utf-8?B?c2V3Q0t4aitNOXA2UVAweDJYaTdpdEFibGNwY29ma0RLMHoxc1dvZ0NUY2JH?=
 =?utf-8?B?cG9zL1dES29NNU1OWU9pdXlRKzR2OWxjWElqSXI4ZjZ5VDZxa3hnbCtVdU1R?=
 =?utf-8?B?WnloVnJjSWdrQVZHWUwwaGp0TWdYZHRXTzBZKzhhcEN4UFhwOUg4VUt2bisx?=
 =?utf-8?B?NTc4SWQwbjdhRDlBc0JBSU9MaHBNYWJUZGVwViswTVBLeXF0SFRjVTBLSTBm?=
 =?utf-8?B?ODlwK0VJeVA2bjlzcHJUNlZDWHkwdGhhY3g0bXduVy9jZi82bmlOV2JGcVZC?=
 =?utf-8?B?RkpDcFZ6Y3dLODR1dzhrU3haVkxDQk9zMTBrTlpEcWlkTnZMNm9iT3lIVk9J?=
 =?utf-8?B?UE8zcVZDV1RPZC9takErV0JSYWJMNjJXbmdhd3pjazVGcUsrNURmcm5yV0FB?=
 =?utf-8?B?YUFhcmFEZ2RHU0xCMDZNbXVrU0c4Q0Q2TUJ4RkxzWWEvZzBSRS9tdGg1SEZV?=
 =?utf-8?B?WnBhNmhPMW1SVFBNbExhOU96RjUyWVdadHRaTHNkZ2J5UEpsa2lobTB4dU5G?=
 =?utf-8?B?cHFpZXA0bXo3RGtLVk5wK0NTSlhBRXZNcER0a2xNZWlpSnNRMnQvSEZ2c3R5?=
 =?utf-8?B?eHA4NGdoRVliaU1wNDM2cDU3NXZXczNwL0U3aHRNNVBhZkZhZFoxYTVnSkhr?=
 =?utf-8?B?ZVltZDMzdFhwOVQ5WUVHSlNnM0l2OXhYR1NCa3JZYkRSKytSZGZpN09keXdM?=
 =?utf-8?B?eUx5VTFXS0tHdmE3Y3Y2K3lqVG4yb1pjNjJnYkhXUUZLV28zT2VHK0FMdVhL?=
 =?utf-8?B?L21ENGRTdlNXZ20zcGIzYy9wbUh5MjFGcGtreEpITEFwTTRpTld1bUFhdXhM?=
 =?utf-8?B?dUI2S29pOCtmVHQyNFV6M3BaYlBFYlY5VDlZbi83by9DRTNRSTRzeXc3YWdt?=
 =?utf-8?B?OVh6dEsvNXMrRHI4bnFqMFlFTElzZGlLNnZvRVZkRjVCMjIyRXpDcTBPNmZX?=
 =?utf-8?B?Y29VNWM0TjFlc1k3WFhKYU9oaXAzNEtZdkZHTGtEWVJTd2tJa3d0MitFcUZs?=
 =?utf-8?B?MlRjVHJ1T2F0MmdxLzNkVkZUMVAvZG5PU2VIOXY0cHY2RVZpYWZtT1EwdkJH?=
 =?utf-8?B?NzNFUVpxSkJ4Q01qYTdMYjFDRlU2SktTTmhpTHNtNGVzcGlNMGpvY1ltMkxr?=
 =?utf-8?B?N1gvaW9heFI2NmtjekVERTMwMG9KdFoySjFORGd1ZjErMzlnZU1PTWUvelcz?=
 =?utf-8?B?R0VXUGNrU3FvRCtCS0M4VUpUY3h5N0Q0VXg3NzEyZlZZUE90WDFyRDFxaXZO?=
 =?utf-8?B?VG5xNlBaNnV5dWNGQUcyM004aWVSWnRWekJ4RmRTaE8zbkZxbXoxcFZxd05x?=
 =?utf-8?B?a29GYTlXUXRSczhYVm84SnlmeStlaHJZSTFXSzJPcHlBQ1JOQWx5OXY1WnM0?=
 =?utf-8?B?bjZCbmZyak0yT2lNUFo2SWViY1VJeUhFUUNXc0lvK2Q4NFRyMEZFSHo5ZmNY?=
 =?utf-8?B?WTZtQm4yOE5rdzg4djZaQUtTOGhDb2gyRnRBdFBxQTB0Wm10eElkVzVodm05?=
 =?utf-8?B?K3dYVlpwL3ZuTGdOeklrTGNZWjJVcFRvRXM3T3REZkMyNjlPd2tlbS9KT2k1?=
 =?utf-8?B?VHh3R0RxSHJMMFBxb1ZCVTJvZzdpNTJBdkhCa3Q1N3pLUmdNUlpoTWhzbVd3?=
 =?utf-8?B?QnZ6bjhYZERBTW9mNXF1ZHlGVkhUY1MzWDlNRm9lbnJpYXJlS1J2VU83ZjYv?=
 =?utf-8?B?ZmxzSkdYa3J4SllVYUg5NUVocnIvT3ZFZDI1UmFpQTdhM0pib3pvUmlrRGN2?=
 =?utf-8?B?SC9NK1R3emdmTlBjdXN4aHpSTUtQZmgxUXB0RlJtNGpYWlBxOVA0aDBjemQ4?=
 =?utf-8?B?aXdISHNmMlRxY0ZUaUFIU2w2N2JvcUZhenQ1MXVXRGVXUHZHN3ZUWDJyN09Y?=
 =?utf-8?B?Y1E2OVlkYW42L1R0UTlqY0pxeVdmT1lIN1FPYkJ2K1VxbkZxZnh1VFFwTTdT?=
 =?utf-8?B?V3g1ejN3MHVuc0ZlUnQ3OTV4MmUvNlZzMlFOSUh5NzdIeEk3TlFvazdRVVkv?=
 =?utf-8?B?b3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0F4897B7B8B1C488D757CB3A29C0429@eurprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 88742cad-2204-4842-06dd-08dc7964d9b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 07:08:43.5518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TP8PVt2bVJtmVy1/F8gfSox4h9wTmF+jRz+yywFghs0uXiVzg6tzivA061k5wVsOKKk54IWPW/xOnAkryJ0OEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8463

T24gVHVlLCBNYXkgMjEsIDIwMjQgYXQgMDg6NDY6MTlBTSBHTVQsIEFsdmluIMWgaXByYWdhIHdy
b3RlOg0KPiBNb3JlIGRldGFpbGVkIGluZm9ybWF0aW9uIGNhbiBiZSBmb3VuZCBpbiB0aGUgbWFu
dWFsIGluIFsxXSBzZWN0aW9uIDMtMjINCj4gIkkyUy9URE0gUG9ydCBQcm9ncmFtbWluZyBDb25j
ZXB0cyIsIHdoZXJlIGFuIGFuYWxvZ291cyBleGFtcGxlIGlzDQo+IGdpdmVuLg0KDQpGb3Jnb3Qg
dG8gZ2l2ZSB0aGUgbGluazoNCg0KWzFdIGh0dHBzOi8vd3d3LmFuYWxvZy5jb20vbWVkaWEvZW4v
dGVjaG5pY2FsLWRvY3VtZW50YXRpb24vdXNlci1ndWlkZXMvYWQyNDJ4LXRybS5wZGY=

