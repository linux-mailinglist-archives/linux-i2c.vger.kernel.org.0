Return-Path: <linux-i2c+bounces-4819-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDAE92CC69
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 10:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFE161C231C1
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA8F84A3F;
	Wed, 10 Jul 2024 08:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="elx3hYJw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021129.outbound.protection.outlook.com [52.101.70.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454D412A14C;
	Wed, 10 Jul 2024 08:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720598547; cv=fail; b=tgLPQy3Ae4qmVVVikPPlJOM9a2doVHZwlmVpPoZi5od4Jd0wsqbKb0RcLG041BpMrItj5d0fSNzIWYG1JTFdpRTFrX7a28vRGSejOwOjC9L9Ihsn7MHIPVxyJ6bqMVWwOyzmmElQQiqFVwIpQT56ECVlemHEXhdsLsjYrc/YEf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720598547; c=relaxed/simple;
	bh=pCixUFW+/hiSSfCSY52Y6I76ZvAbyV8JuBLXTcNHN1s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kpFdhiIevukljGPP660nbjHBQwf9tPuo7ERpl4sasXqTtflisGrVF4YrbNo34Dp2IChhrBIftG3VQ3LR/kN/lYE1BAhhHZz/yr0jqeg91s/6D2vD4+GhIhHGYrNq6DAEGMn26fe3mXWvkiTpYPvhS0NUvPTC/KoC0FiU/2io5F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=elx3hYJw; arc=fail smtp.client-ip=52.101.70.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQ8opeQFROHRT94wZlrac2P5RbgubwE1gDSLIgiJb2DWm2X4IN9sbQ58DX0t2zASuf8rcP1TPGOcq1eZWBW9lSIOC5/uOcNW9bLfB6QFPlSUROV9YQ6cpub1IMpHXhbrzW1Z8dBx5wCBLzf/PESAsBD/eVYhwcKYUvvP2u69hchSeBNQX+F1Q+kzQ5zFNh/T6czrTY1EGy6Oq/jgkdVBBzymNoY4bEAKtaDK30IJGex5NeW8yga+uhPAKhyGjUIe1YyuyFvoocFhUNQuCrnAdKZWvPFdN63l11C2dye+IyLfQKL4y3wZTFOHYITMMX/hE9bLdbMD4cmbAjq+nimcPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EiQCC8sfta0dMglJVvsBsOUqlSmezB7QzmlCdN7grE=;
 b=nVaSkZ05AeN4FJ3smCTYSkZD9wswYWAifcI1CiS87BoOv6mCy9DwZfKCp3ijytJVEH5IvM0LH+9g3j0NgOqGFdGRRdsanzrG+b60oTASKeG5g6PIAVbUfoo8u48IO6dbY0mQPog4zDYZZnwN6ezH/wX+ao1ngbXwjxa5gwskzn9RMxcij70A5k22Qsh8UWxoUisn+cg6AowGhyDHt96pB7zfH31JOnR3q+9l0Y/dDi07hEX5rhrwpGH1q+oz6aCIuxIITJl7BjlIHGEciZnCgy3izTc4wFmr4vs6AGurFJP6JF82h72Ai0t2ndFLjojVylqqlNOOwXo1gBEnfEVyUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EiQCC8sfta0dMglJVvsBsOUqlSmezB7QzmlCdN7grE=;
 b=elx3hYJwdh7sTZe74o1spG9BuDAK/8mPcbRtncbzmgUYw0qPhmTBFlGzctQYyFONf7qAlRe8NSgeserxrmPWa5ntKN1FlKhdLdoXTLWbdjriuP9cIFkLslg48pwl3wiw3vBcelx+nXtAsRuFVnzx+9xaR4s/ny1EsKP/d3xfvJY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by DB5PR02MB10333.eurprd02.prod.outlook.com (2603:10a6:10:4a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Wed, 10 Jul
 2024 08:02:21 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%6]) with mapi id 15.20.7741.030; Wed, 10 Jul 2024
 08:02:21 +0000
Message-ID: <ee983ab9-c1aa-3c36-4e61-1604f0b1fa5b@axentia.se>
Date: Wed, 10 Jul 2024 10:02:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/3] i2c: mux: gpio: Re-order #include to match
 alphabetic order
Content-Language: sv-SE
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Korsgaard <peter.korsgaard@barco.com>,
 Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
 <20240617120818.81237-3-bastien.curutchet@bootlin.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20240617120818.81237-3-bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF0000FA83.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:4:0:18) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|DB5PR02MB10333:EE_
X-MS-Office365-Filtering-Correlation-Id: 536b4268-680c-43a5-c76c-08dca0b6a016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHNLOU12SCtTTnBhWW1CdGU3Yko5VS9XdjYvTk11RlNNVzBDZWRsTXc1Ujh2?=
 =?utf-8?B?bzRDZ2IyVjlQeWh6Q2VxR2hHMTdPSlh4OFk0WWluVGNHUXovUWFkZGpQdXM1?=
 =?utf-8?B?aTVWZTh6WXFWT2FVQVZJbnU0a0M4L0RCTm84ZUxJdVdkbWNCME91UHFOR3R5?=
 =?utf-8?B?NUtaeXRjKzE3ZEl3eW9TelV3cmdQVDVKcVdHc0RvSmEzcGEvNGJrSkx2TUVr?=
 =?utf-8?B?d3gvV0xCZmpFVTNEUHpadDU4VjZWaUVnV2V5SVEvUWx6SFVQaEN1WVhqazJT?=
 =?utf-8?B?WG1lalFZUXpCcmVOTFdMRHdJL3ZrOWhqYlUycm03SmtSN0JUalFaN2g3cXMz?=
 =?utf-8?B?UDB0M2tIWGZnVWQ3VzJ2clRSVlg5dWg3L0lIejYrOWJSRTE1UkhMclJYMnEw?=
 =?utf-8?B?M1lzYXFNTHIxV0hWWXdZVXQzMjVWR0xmTitEUmhMcmZQa3ZPN3dDNUd6RDRP?=
 =?utf-8?B?ZEFJWm8zWFV4d05jckowUWVLd3RBQWlBbDBkV05DUmZNbzFlOXROMThHQnl0?=
 =?utf-8?B?YlA2dnkyRm1oWTZqUlkwa2gwQU1uNGhxMVR2OVUxeFV1RG5uWlM2c1A4WEV1?=
 =?utf-8?B?MUtCYlZtcnllMUNjVnJuVEF1M2RxTmpFdkFkYzdQd0YyU2NxcCtKK2pYMXlX?=
 =?utf-8?B?eWdzMFZ5RXpXYXRSam9BOWxsVzhJZXZObDQ2Q29WZDV6ME1veldVVUxGVkZM?=
 =?utf-8?B?WDdXa2NOUEZnR3dzNHpSWlRvcHdmeUtPNlBrbEZZWUxPMHNhanNXMHMyd1Rq?=
 =?utf-8?B?bHNNTmUraWI3UFRvUzFzYWV6T0Y4NDVwR2gwZWNRMUIwZXRYOHRIRVBaNjlT?=
 =?utf-8?B?K1VBUmk4Z2k2OXNKbTJmTXJ2Y0tZbWtPVjVveDRBYnVldXFCNERNS0lRUEJw?=
 =?utf-8?B?cHhHd1F2cDFVRFRLOXZFeXpwdWRPQmhtVE4yS2NXd1dZM29mRTJpOWRqbm0x?=
 =?utf-8?B?TzFvWFpCa1RwdzE4enA2dnBZZERVZ2NEemVPMmFMMHJSMFJkc2Z2WFQyYVdu?=
 =?utf-8?B?dHE5Tk5ucVlpYlNmSURhaVhxdjlnbkxObDJxU09Fc1B4THZodC93Um5Bb1ZE?=
 =?utf-8?B?SUlsMEhZenlCL0o3TEZTUzdFUXI0cXVlTGJ5ak1jaGE4b3I1TVd2WHJYN1o3?=
 =?utf-8?B?M29wMXdjNUFZeVV2U0RITy9VU2hIT1BIZVp0Y2o5SDlaQUo0Nno0NnBnSHJh?=
 =?utf-8?B?MkFZWDZLQnRRU3lLNnQ0dWQ2c2dWRGl6cklGQy9hd3AxZndrV1Vjc2hJTCtF?=
 =?utf-8?B?bTc3SFFJS3ZxV0t4WkZNRjVXSlVoS1B0UDRmK0NyNHhMWW8rZy9GVHNVVU9i?=
 =?utf-8?B?eUVRUkg1TDN2bXZSNi9EbmxMdnM2VW5ZQXB6dWMrSTZJRSsyTkVEd3E2R3lK?=
 =?utf-8?B?NG4yOWcybVY3c2FvaGh4RUppNC9jclZkK1ZvaURMWHlYRnRrRzFCZFFHT0JC?=
 =?utf-8?B?UVZkR2xEMzZ6OG1oT2sxUTM1dzlNQmtnV1hXZkpPcFoxckVlYnNabUtBQkJq?=
 =?utf-8?B?ZExVYnRiQ0U3WjArVjF2NGhYMkt5b3Q1OWtUQzZscytHOTBzSDhFbENTZlcy?=
 =?utf-8?B?N1RMR1c3MU5kenRFK3VGblBiOWQ3UUFEdzJBZXc3QjE4VXRURm5qejViZ3Vs?=
 =?utf-8?B?YStBNVFRQkorZXpGZEFTK0REVTNWR1RwSWxiUkNWTWs4dWQ3QW5vNG91b2xY?=
 =?utf-8?B?Q1RIZWwvTDBCcnJtU3lVd1ozRTR6RG1UWVZjYUxQSHV4bEtCR2tHQUxJODJZ?=
 =?utf-8?B?RmY1YzA4YTNRcE5US2JrWktqZXFReHoyR00ySnM3SFZQVXFPbmtiK2ZsNkl1?=
 =?utf-8?B?Sk9xdkQzY2JiYW1PcEFOZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0xYdERrT25hRnVUYkxaeDI5WElFY1luRVovbVVrMHVKVVJMbGdhNWwxQjlU?=
 =?utf-8?B?WlR0cFhrRzN4N0g4bndlT3NxdWhrQzJTL0FQWllwRjNNVmk2RjlPMmp2QUFn?=
 =?utf-8?B?TGtPSzdvZm4rQ2l0SnIva3k2c2VtRXU0RUFadXB2QlFxKzNBcjdtRmJ4aXB4?=
 =?utf-8?B?clNmcXZPQmU0ZHhENWdmeitQbkpiTWYzWW9SUFFFR1BiNWlTbEdObjVDVy9I?=
 =?utf-8?B?NGk2bDRSbUNwTjBxaVh5SElRMU03UnJQdzdzS1hkc3VmSXhGQnRFQ3dTWGN2?=
 =?utf-8?B?aTZWRFliVzRoVHI4aXNiYXVtQ1lScEZRc0xCL0YraDc0TURKckozUUV2U1BL?=
 =?utf-8?B?SlRPUlFwY2Jjalo0K1YvaVBtVHpLRmIvZmhnOGtacERwY25hTEE5RGhjT1VE?=
 =?utf-8?B?MHhUN1JaQTRhYzRycC9EMDBDRG9VY3ZoQTNreUlsbHBJam5MUFZhWmw3Y1pJ?=
 =?utf-8?B?NnA0SDl6TExTRGdKalVJTmIyWExPVHIrcWhTT2wwSUk1bklVSmZTWU1tN2hD?=
 =?utf-8?B?SjdjbnV4UXprdHdZWm5VRWNkSkk3aVY3OWJ6b0F5SEN1aC82alIvWktMQWJu?=
 =?utf-8?B?OVBsVnBhT09QcENOQVh4T3libDJQWVpqNm9TYnpGbHN1bFhuUUFtd1FzQUhy?=
 =?utf-8?B?ejVhcTZ4NEN6R0lSWGhiWS9VcUF1azlnK25tTStWcy82R2w5RHVzbzNndkZT?=
 =?utf-8?B?ZjlUZUJJUityYU5hVUpwU0F4OThMb0Y2WGJLU0ZxbFJpN3NUbmJJampCcVNl?=
 =?utf-8?B?UHJMQUFvTjBRZlZVcFljRHE3eFBGVTh4TVJSZS93QmhraXVQT1ZVWmVpY0cx?=
 =?utf-8?B?aXQrK1VXMGVWR25nVUt5Z3BxVFJpZmZ5UXU4NWgvWHduSWFMNG84bWhSZDh0?=
 =?utf-8?B?aW9aL0ZHNUhYRWxSalRrQjk3ZjZUamZFQkRTVzUvMlZxKzBjOTFvWTNoM1hx?=
 =?utf-8?B?SnZNU0tzSElNRGprWXRCRWRlTVJwUTJWenFiUkYwZU8vRXVYbzFLTjEwUjRp?=
 =?utf-8?B?WUNGNDRxNVpnNG01aW9jL2VSS0ZjbTZYNStlWFROa3NJTVhzRWVhdFJnd0R4?=
 =?utf-8?B?QTUxQm1DS3UzV3gyUDdyZ2dEVVA2QUpjZmIyRzZZL2trNlpDR3VqUDNla2M0?=
 =?utf-8?B?ZjU0cG1FV1JmQVNLTlFMN0pINHN4QktqMDVFZXloNlhha2FKcTlZRkFwTG5I?=
 =?utf-8?B?YyttTll3RnBucEg4eG4zeE9DVms3cFhyQUI0RkJ3cFVBMWlreVZmbUdtenQz?=
 =?utf-8?B?VktkUWlZL1J6Q0pldjNqOFNNa3FZTUxsVUQ0V3pzN2ZqM1hxV0xkbGtNbjdU?=
 =?utf-8?B?Z2FYOU16SXExcVFvS3RPVFdCZG9yWCtJN0lFblZSbDJ6TjdWOWZiL05hamVt?=
 =?utf-8?B?b0FCTEw4TW5lcnhVYXpWb0R1VGNScmpEbDhoWUdQZm9oUVZ0S2NmOFEydUt4?=
 =?utf-8?B?bG9PbC9Xam1YbEhCK1hwV0txY01xNGgyWEN4VlUwVHZzcjVKMWJsSFV3emFM?=
 =?utf-8?B?d1BOVC9zSFFCYmx2U3VQeU4vRkpMVlV3YllpSTJQckFrd2hva1loZkx6TzlT?=
 =?utf-8?B?Y2VMakVhZm16MFZUeXFOMmdtOUNHbjlLNmhmU3VrSWFLS3lac2IzbWl6czdG?=
 =?utf-8?B?YUFaenVwWUwyWGxTNWR5REFFYk5DVGlNays3OEJzV1VtSXVLWCtubTlrbk8y?=
 =?utf-8?B?NEROSG9Bc2FnSjMzQnJOLzZsaVZjTDFzVU5NT3grNGxhWDFNS2tmL0srNktD?=
 =?utf-8?B?WDAzcWZid08xQkJYclVKY05ic0dPbUY2bHNNK0N0ZVFBNzJFRnRWdDl1QzhG?=
 =?utf-8?B?RzVEZmFYVW9xK0ZTZU9FR1hwM2dUTzFTRkRBeDN3NG9VNWdDVW5sSGdTVm9F?=
 =?utf-8?B?UytqOGdUaU9aUFVFZS9jWmRZNE9SbGI1cnlabVFTZ05Bd01OY203NFBWSi9I?=
 =?utf-8?B?OXVDOXJ6RFdjNFhHa08rdVRUYWFpQjI0TktCbWdyWmgvNzZDOElTdmFsVUx4?=
 =?utf-8?B?eUk4cC9jNUl0ZGVVM0p5SWoxbVBsSVQ2WFJTZHZoQWo1Tnd0TFkxNG55cUpM?=
 =?utf-8?B?aDBwZFJsbnZNQ1ZJS0s1Q1Y0T2wxN3dwT0Q5WTRwcmIyeG54eU1mbjBjNWRp?=
 =?utf-8?Q?lgyIM+6Pk7cBsre1QkQMPyCYM?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 536b4268-680c-43a5-c76c-08dca0b6a016
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 08:02:21.3954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZEU1+ZvYh7SiHmiWPUji4n2QZwN2uJ8SG3kH7rVuGtLBV37NDZbnIssNK7BBWfe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB10333

2024-06-17 at 14:08, Bastien Curutchet wrote:
> The #includes don't match alphabetic order.
> 
> Re-order #includes to match the alphabetic order before adding a new
> one.
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter


