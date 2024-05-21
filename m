Return-Path: <linux-i2c+bounces-3617-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF818CA9F6
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 10:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEB0EB20DFB
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 08:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477D85579F;
	Tue, 21 May 2024 08:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.b="LSTU/wTJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2102.outbound.protection.outlook.com [40.107.104.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFD041C63;
	Tue, 21 May 2024 08:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716280291; cv=fail; b=eal7vnKULt/gOh4/Bns518ZcHdReBk51g/vYcZjCqlnDCMcsrZyYpeKy+lDgLm/rXo6LFUlb9+Emx1ApnaTGx6Fk9QvURlCMGxqsgX4RBi9iENek27e0bEMaIQgwF3lRI2hvH/xTlOduzpcWPthmtKV4LiAljJj9/H6EtxYbyro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716280291; c=relaxed/simple;
	bh=vjPTq04funW1Mvk+LbW0JOCp1xGVAHvyJpLQLqLP+Po=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uQqZs68Lw6t79MwnwYFQNsLiMDXBnk9wtCbhzr762yD6FcyL9eBpQXsmCkEdvwSFODn/+TneWgvJHaVLLhSqIlFMd4NoqwIxygBvTh5shl5DoXDXcePstKgJsQLWJ3CAD88SMmTbp1BAJDgEo5YL3LFbVwr5Gouv+JWD7pO35vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bang-olufsen.dk; spf=pass smtp.mailfrom=bang-olufsen.dk; dkim=pass (1024-bit key) header.d=bang-olufsen.dk header.i=@bang-olufsen.dk header.b=LSTU/wTJ; arc=fail smtp.client-ip=40.107.104.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bang-olufsen.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bang-olufsen.dk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDrQCvZtxDBhhUcj3gkoIWIGm3cs4p7RB97lU8r1VjkV7bhx1A9U0Je+6Wj8oXF9QYxg+zTqfYu4It8EFOmUr10zZOPZxmtw4e8ykjT5DhTiwZW71FVaKZOJygjE8S2nd0oUO7B3cEQv65FfOgREf1lPD9+jBoyeHxT4uKgo7y7XarW9Fn4+qTyzCAEbQttvPojviCc2b9Csyu9+2uZLclbxQis86JNDUZZDfcvVqUzd95KBYtM2tQsp1RKnkHQwpZsVQHbSXzq/K5L7BF2lnNcyk0XvQPWs7qkcTV/3ijKbX59UNpN5izREZOsJK5IOrF71raOXzNjz8Tbg9ckGzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjPTq04funW1Mvk+LbW0JOCp1xGVAHvyJpLQLqLP+Po=;
 b=mvv1JUpozYCBC3k57GT2NpMy/UYOLLpKbBGOKuCdNoFCrT2ZJwjArGxM2YfdMUkKnotNe49JtoWVejvoAXzV3m5zKspmzCv83zI+3UFhQZyYN1eFd6dMdVd9L/lqTXzi9vp7PRiU1Sv1iILbTj0qgxMRfz/VP5oQFVXEORp4wOww8Pkp3pQrAG4HbH06b4VaWlP5s5nGOaR3LKjnKGQuzGD7NW4QKHA7ncANi03uzyyxYa2YGErNEe3ddpuI3yPj3KBlXKQFcNmnKMdygKDVu8Jf4blazSbXaN16e/LKv2A//FBTrXhYLFcnyepTiuAuo/M7hp+bdluQ+eCGVUm1fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjPTq04funW1Mvk+LbW0JOCp1xGVAHvyJpLQLqLP+Po=;
 b=LSTU/wTJ2bySYyhyplUogT0i8DZ6nHtzuVKxQkTu52wO0w9VtR3m5p3A2WOURD8rcBu8zenUDWI+XfA6I1ftvio+X4WyLes9dyUhrZ7dgvicuXSSLbeSAJT9cy09oDjqvdP6kMI2KFIsNwhASCkzT5RBZZEiOhaZjSFm4fMcmr8=
Received: from AS8PR03MB8805.eurprd03.prod.outlook.com (2603:10a6:20b:53e::20)
 by GV1PR03MB8430.eurprd03.prod.outlook.com (2603:10a6:150:59::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17; Tue, 21 May
 2024 08:31:19 +0000
Received: from AS8PR03MB8805.eurprd03.prod.outlook.com
 ([fe80::6ac3:b09a:9885:d014]) by AS8PR03MB8805.eurprd03.prod.outlook.com
 ([fe80::6ac3:b09a:9885:d014%5]) with mapi id 15.20.7611.013; Tue, 21 May 2024
 08:31:19 +0000
From: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <alvin@pqrs.dk>, Mark Brown
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
	<linux-i2c@vger.kernel.org>, =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?=
	<ALSI@bang-olufsen.dk>
Subject: Re: [PATCH 04/13] a2b: add AD24xx I2C interface driver
Thread-Topic: [PATCH 04/13] a2b: add AD24xx I2C interface driver
Thread-Index: AQHaqFn5xcQQFwwbQEyFnb+oK/IfhrGbghgAgAXftYA=
Date: Tue, 21 May 2024 08:31:19 +0000
Message-ID: <rfpiw5sgrcqmfxtcjjvt33gsyv62i25xt54vo26d5ori2uptkl@b2az7r3z54gm>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
 <20240517-a2b-v1-4-b8647554c67b@bang-olufsen.dk>
 <iyxpcmz5okfzvplla4glmuqsoky4cd6fv7orhsgqjepvdrivnp@63z64jwlsks4>
In-Reply-To: <iyxpcmz5okfzvplla4glmuqsoky4cd6fv7orhsgqjepvdrivnp@63z64jwlsks4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR03MB8805:EE_|GV1PR03MB8430:EE_
x-ms-office365-filtering-correlation-id: 7f2d3313-d4a3-4cea-2bb0-08dc797063d1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|1800799015|376005|7416005|366007|921011|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?L09aVDJtbnc4bHpDM0hORk41TFJidm1LanBRSkRHVlRLMnJyc1gxZlBYSzZQ?=
 =?utf-8?B?SkVwZFBKTktQT2lDdU1VZHI2Vkx0NFFpcTIxMEJTKzQyRUF5UTFxc0wreW12?=
 =?utf-8?B?RHptTkhpUjV2alFZZHo2WnQvOWllcXNxV3AzK0daZzkrT25aNG5NNTkyZ0xL?=
 =?utf-8?B?UDJrMkswVWdlYWFLZ21OWGVmekx3cTA2Z2FMZW5yQUtYeWVDbTRMRnNXWm5H?=
 =?utf-8?B?a3kyU28xcThFSHR1ejlwYjFvVmhWK3ZKOVkvbkQxdGwzbTFFMW1WclJWcFZT?=
 =?utf-8?B?QTNtR2NjeEc1OHJXZ2dqV3FrTEFrR3AzSzZ6dXpicmhSMkM2WjVQRS9zMmQz?=
 =?utf-8?B?djhVdGR1YVBqRnh2MnFHNmFveFA1ZEdZZVY3S3JGWHJYRXllNVk3cjVkRGJj?=
 =?utf-8?B?SFprTkZqa1Y4RDFnZEdLcEtwd2NYU0ZqSE5QM0lFbUlneUxiUU93TjlxVVll?=
 =?utf-8?B?S0pQb3FuSmhEU2tLU3d3RlIxOUI5Qkp3NG9tSitIQVdVemN2Vkp3UmxjTGYz?=
 =?utf-8?B?NlV1eGhmOVhrckZiOUhaalpReUFjdHIzYkovYUMyVTBNUDZiVUxCNEpwTTRS?=
 =?utf-8?B?WGZBR2huS1JLbkhadHdqVUZLRHNROGxIbWQwQWp5ME5BNGpZb3JLZk9Ubk5i?=
 =?utf-8?B?MlU5cW9IbVY1aWlLL2svMENnUXF3Zk9KOHNDUUo3akdLdXF6WUtsejVmWkFs?=
 =?utf-8?B?Uk5vdVRaQWgxVlhaOFZOOEU4eVd5TFRGOHAxcVE4RnJRVGhtQnJKODBEejhC?=
 =?utf-8?B?eURYMk8vdDhZdGEvTGxxSjhxTUE5bUFTRml1MjlXUHhhWUE5RTk3cWxjQlh5?=
 =?utf-8?B?QzcyR3RMQlp0cXpQSVNqalBTTi9JQllqNFBjMkk5MVJWZXJZVFBVVjhOR0wz?=
 =?utf-8?B?ZHVmeFJZWEtKMVVreWVGQXJNTkl6c05Vb2JHU1VxS3RMWm9qSEJnOFlQRlEv?=
 =?utf-8?B?amlsSUlJc1pra09WVnJvZ0YvYkRQQkZxQWtwYW1qNXVEKy8zVTJnMlRXN3I0?=
 =?utf-8?B?RWJObnl6ZDFseTRncWt2RFdRa1J1S1QxTFp6M0NCVDJCWmxGVVYvb3JGYnQw?=
 =?utf-8?B?S0pkVGRsUzVFbzFQd0lTT2I1djlwQnFRanZSck5JaTRXN0xCSHhsVkZJd1JN?=
 =?utf-8?B?WFBLNFpEUlhoOXRGY3haSjBpOVltb2ZNbkE3eWhLRWMyN04vRWZzNVJnTjV3?=
 =?utf-8?B?Y25NU2d2b0g4VTVUV3dVNHk3RlBScTgxWUJRSlNuU2pjSGJoNE1ZY09naEg1?=
 =?utf-8?B?U2RhWmYvb3lqRG8zU0NPR1ZzcVhuNVVkczdEOEV1N1JRRHNodG5lT040eEsz?=
 =?utf-8?B?L21YWWVFcGlFaEVjbVRHK2drZzQ1YkExSi9QNnh5Mzd2dFAyVjZFaG5KeTk1?=
 =?utf-8?B?dG1CQWl0VlYvU2FZNlRxYzVXRCtqREZKdjZjMFhqT0IrYy8xY0NXQXhFSVQ5?=
 =?utf-8?B?dzJ6WGtNUmorL2dTSEsvSkU1aWNXYWJtYWxkekp2cFNrMzloQUtoRTBLS3Fh?=
 =?utf-8?B?UWpnMHg3ZGNBbTNuSGZINkxrVW9tcDc5cWVuWElhWnVsZ0x2amhBSWtDL2I1?=
 =?utf-8?B?RnVJN3JUempyaklOMHRKZlE0Z2VWaTZRMEozZGpya0F3NXFzTDB2SnUyRXht?=
 =?utf-8?B?ckpFUVF3bEdmSElGY0lGV3d0S2hMcVk2TU82YnA4dDZWY1kwR0Q0ZWkrb0dk?=
 =?utf-8?B?eFdsbHNPaDc5dFI0aFB3QmliUTNmenBsV093d05QYkJFS1J6RDlhM2RzVzda?=
 =?utf-8?B?MmVxeSt4OTY2Z2I0TzlheW15SUNJRkhNUlFyQjd4Y1FIOCswSmxRMHVGaWVO?=
 =?utf-8?Q?OdYT9REvUNbz7e0kWZIM0MU3mZ9EORJ6nAq4k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8805.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(366007)(921011)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eHRuTER5UWltdUJGR1dwdVBCSjY4TnJ4dEd4WjNTUGhQbTVHR25xays1S1Fx?=
 =?utf-8?B?WSs3dlJXQjJOcy90L1RpY21aaVU5YW1STXFmQzA1am02bXkrbVRDQjVta28z?=
 =?utf-8?B?NzdyNUdkWDVXTTRvOEVEUDRrdElZZDUxbERUbHFYbVlJZlFvZEdwY2l3amZC?=
 =?utf-8?B?YzBIaGpnenp4aTByRGV4Y1VhRW1IYUN0ek1QaFQxbkliQlM5YXpGL3lZVDNk?=
 =?utf-8?B?aHRjS04xQXNNR3k4UjJyZ2tTZjJteXgwOVIwT20yb1pDK1dxSzlGbU9SQ0RH?=
 =?utf-8?B?aDU4QTZXQStiUzFaU2hrakV1N29mcVEraU1PZmR2bjdOdEhLQ3NOamNhdHFr?=
 =?utf-8?B?T01nNkt3V2xzSzRZNlVlQkw4WGg0NE1FY3hHbHQwcmR0SG5kRWZobDBieS8w?=
 =?utf-8?B?RzltNmhxRWNBdjhnb0hVK080a3VmeWdDMDg2K2pXWDA1a2QvNGZDQmUyQUdI?=
 =?utf-8?B?bG1xSW14L2duTnlRcGVlSGVPcURWOGJXTTdISjFXazZzUnphRE01bFVRUlEx?=
 =?utf-8?B?ZHcwY2VpUjZlQlY4eWFqcTVwL3dhRzBYS1ZUMWpIQnN2aEUyM0twQlE5M3F1?=
 =?utf-8?B?QndCOU1mdGtOMVJLTDhxaGhBRTRpNWJDZVhvSTZIUzg2TEk4cmtmZkdmSHdv?=
 =?utf-8?B?bndYaGZyVWxkMDdBWkdJbjBMTjBJVW13VTd6d1F1cFFLNncrK090MkdZc3RD?=
 =?utf-8?B?Y3VWSnNwaGJTeTJhNjlPSHE2UStBeDN5aUdQZkhjSUxYbDY1UTAvNWtLRndT?=
 =?utf-8?B?cjBtVVZieGdpWVAxcERtNWI2eTlDRzhrNEZ1V0tuNDZFZTVySFNCUUpCUDNz?=
 =?utf-8?B?L0YrOE9COTBONjQ2WTBFTWdqSk9IUGExaVRGSmRTMGl0azFCWE1pYWFsSTJE?=
 =?utf-8?B?bUxhOUxCVlMzcE1DUEk5bjA0aWsxa0ErSVVnYS9MMjZtZGh2TVplMGM5MWtz?=
 =?utf-8?B?VFBXai80cHJZZnJ4bW8yUnhRckRPWDZZTjJUNkUvYnpGb2JOV1RSN1hmWm9z?=
 =?utf-8?B?ekF6Z0pGYkpDeklRUWdhbnNCckJFcm5idTlQWmh6WWlQVm4zVDF6eXpKSWVC?=
 =?utf-8?B?YlFBRWlCdzZiOXNUQmdIWDlqblhJV0djZlRUQnNxemxwdUU1bVdlMUZUWjFS?=
 =?utf-8?B?ZXpnT1BDblpTRFFCRStlNnJ5OEFUY0l3NVUwaW1zMG5kN281SmxaZ2U3aXEw?=
 =?utf-8?B?bFJzRC9wZ3pERzRvaWNMS2taejRvVkVHRW5GMkpyem93MWw3aU9yZlBjb1pp?=
 =?utf-8?B?elBKbGRldXNIcmY1UU16WWVxamkySmsxcXROWkMvTjFITExCMUl2akFjalhI?=
 =?utf-8?B?bmpRRVJ4cW1jd1R3VUFoVFh3V0VYMW5NTEtaRDZQb1Evek1YQjdjY1F1QzJl?=
 =?utf-8?B?ZUcwMXQwNXN1VUtVTHFFTXluOW5rNkNYRklFZXl6OUVPd0c5dWdqd1BFQ2Vs?=
 =?utf-8?B?bE1sSlFFbWRLMVM2RzdtMEJWTUpXODYyZGI1R0M2bnA5M3NWK1F1NU1XUUdH?=
 =?utf-8?B?YTFycE1EZWZQY2RuT0g2TjU2cTc4cmswbjMwemNVYzZyaytlZG1IMzhVTDdw?=
 =?utf-8?B?QUJwSW5pczQrejNWN25RUkZjRWs1RmJ2cmEyYUdVNkIwa0RmTFE4Z2hVU1My?=
 =?utf-8?B?ZlhTN1ZUakhiY0pNa1VlU2QxQnZPalpwRDlvZHpSajhMckdxWXk2RkZLZERr?=
 =?utf-8?B?TUE2bkVkQXVIVUxTUHA0UGx6ZlVXdkhQRGF5R3ZWNmxmRVpoQTZBUkNuN2tv?=
 =?utf-8?B?SWJmMjlwc2xDUEVoWDc3T1JtU1VUMkw3YkJ1RFM5emZ5ZlMyK0c2YUJaRFdm?=
 =?utf-8?B?MGVMMVd0TmZOUDFXWU40YVFSMCtjTFhmWG5HSHlXNE4vY1pPdVE4YXE3Z1lK?=
 =?utf-8?B?aGZGbXpMYzNsVHcyQTdSQlo2K1UrYzFzNXhiVnZCZDBDQXRSSDFTUFVJOEEz?=
 =?utf-8?B?KzN1SFhBcFZ0azlsbTlJaHFqNWlnNkM5czIrQ3dwK3Bid2xCdWhQSFpqNTBN?=
 =?utf-8?B?WjU5bCtSaC91bjVHV0p4RHlvRllidzhXSy91RHoyU1FWS3VSMmNrc0N5TjdE?=
 =?utf-8?B?a1FsQ2RjMUY0eFk3TTkzNXUvYTgzVGwvNGIrWFVjb3ZDZXZRNGFKbmpDbkNt?=
 =?utf-8?B?KzRSdlgxemZqUXhHRUpWS1NTV2Vza0JnYzZKMmxiVHJIRFE4RzNpdXZFeVNp?=
 =?utf-8?B?cWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9944D09F812D394A8D2C47476CA71563@eurprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2d3313-d4a3-4cea-2bb0-08dc797063d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 08:31:19.7464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8mDxmji5RcZJ5av9FK6pkM28MClF7mPLNfrAP2+5k+tEA4dzGlPX8RxTNHTKrqja2yMryJZzBbInJxJ0c/FQvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8430

T24gRnJpLCBNYXkgMTcsIDIwMjQgYXQgMDQ6NDk6MjBQTSBHTVQsIFdvbGZyYW0gU2FuZyB3cm90
ZToNCj4gDQo+ID4gKwkvKg0KPiA+ICsJICogRW5mb3JjZSBzb21lIGJhc2ljIGFzc3VtcHRpb25z
IHRoaXMgZnVuY3Rpb24gbWFrZXMgYWJvdXQgdGhlDQo+ID4gKwkgKiB0cmFuc2Zlci4gSWYgdGhp
cyBwcm92ZXMgaW5zdWZmaWNpZW50LCBzb21lIG1vcmUgY29tcGxleCBsb2dpYyB3aWxsDQo+ID4g
KwkgKiBiZSBuZWVkZWQuDQo+ID4gKwkgKi8NCj4gPiArCWlmIChudW0gPiAyIHx8IChudW0gPT0g
MiAmJiBtc2dzWzBdLmFkZHIgIT0gbXNnc1sxXS5hZGRyKSkNCj4gPiArCQlyZXR1cm4gLUVPUE5P
VFNVUFA7DQo+IA0KPiBBcyB5b3UgcG9wdWxhdGVkICdhZDI0eHhfaTJjX2FkYXB0ZXJfcXVpcmtz
JyBpbiB0aGUgSTJDIGRyaXZlciwgeW91IGNhbg0KPiBkcm9wIHRoaXMuIFRoZSBJMkMgY29yZSB3
aWxsIGRvIHRoZSBjaGVja3MgZm9yIHlvdS4NCj4NCg0KVGhlIGkyY194ZmVyIGZ1bmN0aW9uIGhl
cmUgaXMgYWxzbyBhdmFpbGFibGUgYXMgYSBnZW5lcmFsIEEyQiBBUEksIHNlZQ0KYTJiLmg6DQoN
CiAgaW50IGEyYl9ub2RlX2kyY194ZmVyKHN0cnVjdCBhMmJfbm9kZSAqbm9kZSwgc3RydWN0IGky
Y19tc2cgKm1zZ3MsIGludCBudW0pOw0KDQpUaGlzIGlzIHVzZWQgYnkgdGhlIGJlby1zaGFwZS1u
b2RlLmMgZHJpdmVyIHN1Ym1pdHRlZCBsYXRlciBpbiB0aGlzDQpzZXJpZXMgdG8gcGVyZm9ybSBh
IGZpcm13YXJlIHVwZGF0ZSBvZiBhIG1vcmUgcGVjdWxpYXIgQTJCIGhhcmR3YXJlLg0KSW4gdGhp
cyBjYXNlIGl0IGRvZXNuJ3QgZmFjdG9yIHRocm91Z2ggdGhlIGNvZGVwYXRoIHlvdSBtZW50aW9u
LCBoZW5jZQ0KdGhpcyBjaGVjay4NCg0KSXQncyBjb25jZWl2YWJsZSB0aGF0IHRoZXJlIHdpbGwg
YmUgb3RoZXIgc3VjaCBjYXNlcyBpbiB0aGUgZnV0dXJlIGFzDQp3ZWxsLiBBREkgZm9yIGV4YW1w
bGUgcHJlc2NyaWJlcyBhIHNwZWNpZmljIEVFUFJPTSBhZGRyZXNzIHdoZXJlIGRldmljZQ0KaWRl
bnRpZmljYXRpb24gZGF0YSBjYW4gYmUgc3RvcmVkIHdpdGggYSB3ZWxsLWRlZmluZWQgZm9ybWF0
LiBJbiB0aGUNCmV2ZW50IHRoYXQgdGhlIGRyaXZlciBzaG91bGQgc3VwcG9ydCBzb21lIGtpbmQg
b2YgZGV2aWNlIHR5cGUgZGV0ZWN0aW9uLA0KaXQgd2lsbCBhbHNvIGhhdmUgdG8gcGVyZm9ybSBz
b21lIEkyQyB0cmFuc2ZlcnMgb3V0LW9mLWJhbmQgbGlrZSB0aGlzLg==

