Return-Path: <linux-i2c+bounces-9468-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C4FA37E7B
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2025 10:31:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49F4516E6CC
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2025 09:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF0B2153D9;
	Mon, 17 Feb 2025 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="caqCgcip"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDDA21519F;
	Mon, 17 Feb 2025 09:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739784658; cv=fail; b=o/ET7C9abANACY0h5iuX1TSGqZGl/GNXwRLqcsuuMpgpwnwLXiPJgumL8dvktQDjlixjIli7jJ6svaF8fwtthCJIfUJUrikZUZvdeGQNJ8xN3uPkxm9HxHqvDw1TIbxPrG1XiK5AhW6FRefI8ohcmOgFAAZz0rTzKlQklU79r9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739784658; c=relaxed/simple;
	bh=9GmHVRNoMmOqNclb5mJnwueH7hnlhUg/eukTpROSB60=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k6XQB4Ebc/27TG+kduQmz2JGtg3dTgI/KdrsRAOB+1qmbOstgx47MZOHVbJY4ipAnQm2R0E+Wn5rueBKcpuXJyn/BLGcuBNcCCA/s8VWa4uPljpuIF1wt7tnyQsT7T5XGk8QHEC08FcUV9qZpmSjggOmdd04tl5pCY3pRbdr+Vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=caqCgcip; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H59Axr021323;
	Mon, 17 Feb 2025 04:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=9GmHV
	RNoMmOqNclb5mJnwueH7hnlhUg/eukTpROSB60=; b=caqCgcipo0rG77mFV0syA
	jfswl3mlfLVeCgI+tT4HFF418iupgySiTQogAvrZ7tOWCVczAQcrpLe/WgCbX4Wc
	F1OeVJqEUXXbfs4mMkVLf4bZ87ekniP75nbofX6NtJ/qQzdI3yU8XsOnIXOR+YLq
	y/BiGmgHOFvLtlciDSvGfPSWkaYp5f+BZ8akQSC/e7hj6GlfjMes+UU7X7/HFLdV
	eBMaCmPNyuMoTI17QkwEKAbT3Nibmte5byZrMmqvUtVesqa4RyWbO7xUA9HDv/y7
	WGCFysa6ez+aJ4xv5gNQ8weLCpVZha8YX7nGgHTZvAM/IjsTo2iReHk4ewdsJDMs
	w==
Received: from bl0pr05cu006.outbound.protection.outlook.com (mail-BL0PR05CU006.outbound1701.protection.outlook.com [40.93.2.9])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 44uxqch036-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 04:30:28 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUWFTwLuBmhx+oyXJbf0N7Up9NUQ7XHGE4dJpeA4nxbyC+Ejs/oHSHBtUVn2zOoa8QzuMYY8i1S5L6hlsofTwqXDTQ8UD/5rMIxRYJ/mUK5Q+6S0o872yrXGkVv/PLrwJr5SCPPVB6A1QCab10EaoC+KtGc/GI2/WdtG8USRr9v/FAyuWfZS4Yr98nn5L0UWWM43LVVq6M5CwrzRq5JvsfStQeWEhn2bmaygiCIYPqeRGu+veVsSq24RPrqY7+tXAxZDqtG6U6Bi8zWEBBcypNSlkGRIJuA2r+DebsWOnLO3AzFKhkARrwHr8gCC/EH/tlONBOZDhBz0WhHqU1KYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GmHVRNoMmOqNclb5mJnwueH7hnlhUg/eukTpROSB60=;
 b=hjO282nHHnyXyh2VfjPcLJfiCOndp2m0nIdkvNQwFUHvEHrUfwxGkJcCTp0iHI2NcaYkNyDrDIY42GV8k+ubXV4m9KbxyIKciSB+qgQbLWjx/ZKtur+D2QuAVwldfP5jfwe66krLLP+O1pC72peWXsOCPqoIdSmRed5/+PUIEnzCbuO8XFQfzFjCjLiF9bgOAMzmIh7hRRdPJ4GbgSjBark8Sth9w8I74jOJvCfGWTV/mAKrvx6lYO8j+pZofWWCb3JRbxOVL70GcU1qMtwg60jA3jfQCQ7BzkMDGde3XQvrm9LJchTUuSiQhKp3x4UJkcVJkR+2qRZb/ZLJUV8x6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6938.namprd03.prod.outlook.com (2603:10b6:510:16c::9)
 by PH0PR03MB5830.namprd03.prod.outlook.com (2603:10b6:510:38::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 09:30:26 +0000
Received: from PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446]) by PH0PR03MB6938.namprd03.prod.outlook.com
 ([fe80::966:43bd:a478:b446%6]) with mapi id 15.20.8445.013; Mon, 17 Feb 2025
 09:30:26 +0000
From: "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter
 Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC
 Chiu <Delphine_CC_Chiu@wiwynn.com>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: trivial-devices: add lt3074
Thread-Topic: [PATCH 1/2] dt-bindings: trivial-devices: add lt3074
Thread-Index: AQHbbnYvInDA7tfAaEmQRrSmjEJRdrMqQ+CAgA+7WbCABPiBAIAMZJHA
Date: Mon, 17 Feb 2025 09:30:26 +0000
Message-ID:
 <PH0PR03MB693845F71D14B21D447D701A8EFB2@PH0PR03MB6938.namprd03.prod.outlook.com>
References: <20250124-upstream-lt3074-v1-0-7603f346433e@analog.com>
 <20250124-upstream-lt3074-v1-1-7603f346433e@analog.com>
 <20250127-outgoing-ibis-of-respect-028c50@krzk-bin>
 <PH0PR03MB6938B71327DAADC17492A5538EF62@PH0PR03MB6938.namprd03.prod.outlook.com>
 <5d2b71a9-a62b-418c-91ae-fa2a195aa27c@kernel.org>
In-Reply-To: <5d2b71a9-a62b-418c-91ae-fa2a195aa27c@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6938:EE_|PH0PR03MB5830:EE_
x-ms-office365-filtering-correlation-id: 8ec7c6e0-fd18-4304-8b3d-08dd4f35b625
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WmY3Z0NBdnJkTGIwOFpNbEdiV2xrNm9aMlRnRTlFdjBRMDVnNnVCZFdVdlpw?=
 =?utf-8?B?d2xlcVdRWEZqMGpMd1N4Qk5pRHB4MXBsVkVwM1dpNVlPYmE0QVBBYjZWeXlu?=
 =?utf-8?B?NU9vTjRLWUdadWVzZzE1VWppT0xFbDB3VFlRZFRIOW1FaGRGLzc2TXhzZ2ZJ?=
 =?utf-8?B?QWFubkFvRXJXWjVtR1V2V3RPczRvR215NloydDJNTWlYdjdpRHJkV2lBUjg4?=
 =?utf-8?B?MlFSQmg0TXhnTTBzMC9FSzhheGgxOWRrN2J1UlJXT0dGc2NudkJJZTBHQklI?=
 =?utf-8?B?N2RZZC9GZ0dYcDBhYkNveDNHNDZqdFhueFpMUG1GVWVqYjJPcVF6NUdBUGIv?=
 =?utf-8?B?Z083TXp5YUNCaTVtMjM1ZExqZ3ZJdjR2TXV5K2daRk5SMmg5bTh5Q1o3RjVB?=
 =?utf-8?B?TXljcS9peGVSNzFuc241Si9xb081aDlTY3Fta0YyaWlwaE1oWE5EMVhvV1Uw?=
 =?utf-8?B?YUtnSVowei8ybUh4c0JveEd2RDNXblRYcmxlM3Y4SHp6b1FVUndZckM5OFNJ?=
 =?utf-8?B?Ky9QYSt6VmRGN0dUbWNPTXc1bmFWYTBTc24xaFRTQ0o4WDVqVGJrNHJJUkRZ?=
 =?utf-8?B?TDNZYWNIQUtnSmdnSHhLckp6SS9uVkJ4cnM3VThCYXdWa0NyN0FwNzZUMjQ5?=
 =?utf-8?B?UXowZEIrdWdadjR5UEFLMm4wWHZkUStqQjIvOHUycnluUFpBbGF6cnM5b1hO?=
 =?utf-8?B?a09TR2hHOUozRkZRMy9aS013MHUwU1hkczM1eDhFV2g4VEhzZU9RRW56Y00w?=
 =?utf-8?B?U2JqUk13QXgvcm1ORVRPU0wvRjJhaXNpY2Nxb0NQNnZZejVVMU4wZVFJM3dE?=
 =?utf-8?B?aVRId28wRTFkRzZ6SjkvVjVCNXE4b2hwdlFkSmhkdzRaMUxuNDZkb0xQS2hV?=
 =?utf-8?B?S0hPT1pIVzczRFdZOUFRbzhWOTVEOE5vaW1JZ0Z3RzRYcUNUOTBSSGpuNFZn?=
 =?utf-8?B?b0hXczhaTWpGMzhTT3BkK2JCVVNxNGs3ci9senVITks0RWtKT21YdGZBTlhE?=
 =?utf-8?B?K3ZrSHJmdktUUkc1d01wTjlxOTkyRTY0NXgwWHJ0Rm5uSVVEZTJqckl4ckZB?=
 =?utf-8?B?aGd3SnlTNkZTZm5nQVcraW9uQWljV0VuS09ES3J4RExnQ1VMUnNnbWJNdkx0?=
 =?utf-8?B?eDcwc3JjdGFZRE9ocU8xTnBiUGZBaGF3bFpud3B3VU1yckQrUDNiSTQvTHFo?=
 =?utf-8?B?K3RtdkpRaVphZWR4bDR5NmwzMU1rM0c4MzFlWTVWUGhVdnNISVVLWmgzYjU4?=
 =?utf-8?B?b3VqSDhyUDM2K3ZOaC95T05PR3V0RXNBeXBYZ0g5WEkxaUhxbTNSd2lrU21k?=
 =?utf-8?B?cVRaT1cvbTRQQ0NucWNvbzNPejlaNHpiOU1UcG9wYTQ5QUVENUdCZTJLYTRp?=
 =?utf-8?B?d2NQNElYNjdMZjdlSnFIZ2NxMXk5NEt3ZU9jNEhIY2xnd2NRaUtCYlZnWnJJ?=
 =?utf-8?B?bng5VngxZXI0bWJGQU9tUGt1d0RETFBtdjR6S3V6Q08rK0RUeFlJaStEZU5N?=
 =?utf-8?B?UThJNDF6MWJ2NmdvT1ZsZHhoMzh2QkhNOW1qanIxNng0QUozT0NsaWUrVE9R?=
 =?utf-8?B?M3FGWjNubjhTN3lTSS9VU2JaNU4vZXhtd0FOMHAzdnZqYnpwRHB5bXFvVkhF?=
 =?utf-8?B?K1lTRDNjZXdzNFhBTmVhdXI5d0RHTGhIb1lqeTNWL081ckhhZmp6azhOa3po?=
 =?utf-8?B?d0dQeWZzWER0dUxjSmM4RkVtYVF5b1dqMksxT09nQjJWM2FaQW8xMk1WVm85?=
 =?utf-8?B?bmt2SWtUL1IxMkFtYUNTY0habXgvRUdqUHpzNldKWjVjV004VUVtaHpmcHdp?=
 =?utf-8?B?cmJUNStmaWIrUVVreGhCU0hHUFA2K21KMHVGM3Y4VDkwd2Fjc0h0K0tDd2wy?=
 =?utf-8?B?RWY4N2RKTElxMjA5bk8rRllZZjdTanJ2cnY0VjNlYWh1VjB0S2ZSelpPYi9J?=
 =?utf-8?Q?BP6kR2i0rYNSLYTHBIZuxS91e8CZ7lBt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6938.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T3dvWWhscnl6ZGxaK2svOERScnNDSXN0YjUrMDBsUUNNVnZnUTBianZRcnlP?=
 =?utf-8?B?OWl6MVJIV1BLYlQyMTd1WTJoZXg3WGllQ1hMcy9NeFVlYlI4bWkxRnNTTUgx?=
 =?utf-8?B?bXFIS1g0Tm5SOVYzNnZCUlZRT3Ewd1plRGFNRU9nR0tsekhWUzIyZ3pYY1ZE?=
 =?utf-8?B?YXNSVjlWaytJUnVsWkpzQWxFMVF0Qm5uZ2lJM0pFL2d5OS9vcTJaa2c3UVlE?=
 =?utf-8?B?bFdYd3ZHSXMvU1QzVTlFc3RmRUhkRWNLdHZwSzRDVlZQWG93ZVRaYjhtd1Bo?=
 =?utf-8?B?OEQ0QkpCWllWMjRYYlhqc1E3b3RBSTlFby9CN2VoNVpEbVlKditrYlhUZGJ5?=
 =?utf-8?B?SXV4bGpwbFZRR05LOXEwMllZOFFLUzJjd2tkQ2xkL2hyK21DR1ZXMWg5cE9G?=
 =?utf-8?B?Rzhvc3RVSXV0bmltN0l6M1ZWRGN6Q2ZpblVRQWh5VFhRaTU1OTVUZFBQTWJ2?=
 =?utf-8?B?Q3poWno1WG53bEg3YklTNEtrTzZEUUpKQ0haUVFnQmtDREpuNXB5V2t6bkkr?=
 =?utf-8?B?bExZSjB3TjhaSnJVdUNKRktVNTU3MDVTOURKSHpmdlZVbHYxWXcxM2RpMFh5?=
 =?utf-8?B?RXY4K0VpYXMrQTJvWFVQc3c3S2p4VDNDWjAwakpHWjV2SFJ5b2NSSjB0NjI2?=
 =?utf-8?B?RytuZ2xSWWs3cENRZjFKT0hseUNYcC8wK2pWVmVjYjRkTERaZElEaWVvN01X?=
 =?utf-8?B?bnJZVW1kZzAzbEozN3R3U2dxTU0zR2xQeUhiUTlDbm14SDhCeUM4R3JMNmk2?=
 =?utf-8?B?WC9pNE9ZQjVrM0E3cDVJRDk0YmM5R3Z1c3luSzhOSTBTY2drc0JJak9ZaUlm?=
 =?utf-8?B?bVFrNzRkakNJOE1rZUdZS1hlNVJteCtUU2JFdldzNXdhTGpEdHFXRlk0NHli?=
 =?utf-8?B?NHR0c3ltdm1PSld1NEE0SFVjYXVWN3VvcDVYQkFadU15cXRNS3NkNG1mQWNP?=
 =?utf-8?B?RnhtU1VuV3FnNThzMXo1UVo3SEdwMEVtZVZvUm1jOTBJWnBheFVrMm5RUGpw?=
 =?utf-8?B?ZlpiZkFzYTZSQW5tMU9EZEswUlFsQllJRWVXaTBNNVpkMjN4VnI1dG1xNTJO?=
 =?utf-8?B?RU43QmZQZGhnNk13YUllYjVEU3Bad1RDc1o5Z3g2ZFl2WDhxV2JjQWZJMVdK?=
 =?utf-8?B?RExzcW5iazBxTlkyMmEyMytHSWRDUmFSTlVEUXJ3WnhLQkJSQXF2dnRtekg0?=
 =?utf-8?B?dXhnTUFLYktSWWpKaHRHK2JYNVIzTEV4WEt4LzFaVDNzeVlGbDR5T3Jzb3dy?=
 =?utf-8?B?Z1ZWUEx6TzUzRWd4RUNFcXRJYlR6RHhuVCtoanZGK05rVWhYTElsUVllRkMv?=
 =?utf-8?B?YUEwT0xYK25yZW5KVlhvM0JpUU5FR3J5TU1sMVN1SFJpNHo3ckNENnlJVnlD?=
 =?utf-8?B?SXpOY0ZyY2w3UUgybks0L21yckxhdTV6UHBzNWl3SDBiMDBYMFZoemxjSFJU?=
 =?utf-8?B?ajZGa3BEb1MzYVQ0dVdocGhHa3dFMnZhRGFSSmtZakNOZTBBYUYwcW41SmJ0?=
 =?utf-8?B?LzNncVBXejVNT25VRUsyU0lRczVORXZIQnN6WCtjcW5UUVFFTUhBanZZS2Ez?=
 =?utf-8?B?cldKa1ZPTEFoUjJrU1krcEdaODZJenFYUXFOZmMxOVFmMjZDK0thYlFxYUd0?=
 =?utf-8?B?NnlEenZ5M0NjbVh3M01rNjlJRFl2TzdJUlN1K2U0cGxkTTZ2Z2tESWpsaGhC?=
 =?utf-8?B?RGgzZzJGeHFIU2tmMktEd25LNFQ5bExrTVM1dy9NaGtabGoreW5Vd0huR1FS?=
 =?utf-8?B?RnlwSkZ5TVVtWmFHL2k0WFBJRHBKNXRlNjNJSjNxSGtJYWtWa2hxM2c2R2NX?=
 =?utf-8?B?THhyOCtUR01rd00yVGR2WUg1cCtBeENTSTV4STJaTlNraExybkNvYUl1T2E3?=
 =?utf-8?B?akFDVWE3NUZMVXBRVVQ3R1F3TWhVZXJnUE4yRkIyZkZqTmhJMlp4SXpLUnhT?=
 =?utf-8?B?QW9mQlRmRHVtWGxRckZHRm5YWmNBK2h6a0V3OURsNStPdXN4R3FLL1NubzVx?=
 =?utf-8?B?NHh6N1NUeTJTL0hVWU94MEdsWGx3by9IWWxRbFRVSmk0NUZEQkxqUUVyUU1V?=
 =?utf-8?B?TENWMUdxKy9UOStydHJKTHk3ZXZwQXp5SGhuNENueUNvcjZTWFNNQmwwMWww?=
 =?utf-8?B?MWtBMTBUZHZHZ1VldThDYkdwNDR5OGlRTW53Qnk5MGpWNWhjR29nd2h5YjF2?=
 =?utf-8?Q?ZQHj+2M+GM9dsDfXbAab96w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6938.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec7c6e0-fd18-4304-8b3d-08dd4f35b625
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 09:30:26.4023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IOyNO2+mNxLyJPnZjKNavuGWk39B9NEwIZvjtnZw9AUQRFVP65zAGPGzMVUuAIe4voi2PAsL9ER8ob6LUXvHcVCaBvRBTvdkYF9L0ohO2jwHXMSi9UnGqMyKqgoiMTqS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5830
X-Authority-Analysis: v=2.4 cv=SuRq6OO0 c=1 sm=1 tr=0 ts=67b301b4 cx=c_pps a=yfQ+ne3pfVgCfke9fm/9IQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=udXclQch7WkA:10
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=iox4zFpeAAAA:8 a=_jlGtV7tAAAA:8 a=07d9gI8wAAAA:8 a=cPYzWk29AAAA:8 a=WVNPHqRAAt8skBq_yosA:9 a=QEXdDO2ut3YA:10 a=xjj0GC5SL0ELW4ibpBgG:22 a=oVHKYsEdi7-vN-J5QA_j:22 a=WzC6qhA0u3u7Ye7llzcV:22 a=nlm17XC03S6CtCLSeiRr:22
 a=e2CUPOnPG4QKp8I52DXD:22 a=oSR2DF9YFqZEN4IGatwP:22
X-Proofpoint-GUID: pKkZNEiEvQHGUGPDS1u4aNUDvAM7XBkd
X-Proofpoint-ORIG-GUID: pKkZNEiEvQHGUGPDS1u4aNUDvAM7XBkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=977 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502170083

PiBPbiAwNi8wMi8yMDI1IDEwOjA1LCBFbmNhcm5hY2lvbiwgQ2VkcmljIGp1c3RpbmUgd3JvdGU6
DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEtyenlzenRvZiBL
b3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gPj4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDI3
LCAyMDI1IDM6NTIgUE0NCj4gPj4gVG86IEVuY2FybmFjaW9uLCBDZWRyaWMganVzdGluZSA8Q2Vk
cmljanVzdGluZS5FbmNhcm5hY2lvbkBhbmFsb2cuY29tPg0KPiA+PiBDYzogUm9iIEhlcnJpbmcg
PHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyemsrZHRAa2VybmVs
Lm9yZz47DQo+ID4+IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IEplYW4gRGVs
dmFyZQ0KPiA8amRlbHZhcmVAc3VzZS5jb20+Ow0KPiA+PiBHdWVudGVyIFJvZWNrIDxsaW51eEBy
b2Vjay11cy5uZXQ+OyBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PjsNCj4gPj4gRGVs
cGhpbmUgQ0MgQ2hpdSA8RGVscGhpbmVfQ0NfQ2hpdUB3aXd5bm4uY29tPjsNCj4gPj4gZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LQ0KPiA+PiBod21vbkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LQ0KPiBpMmNAdmdlci5rZXJuZWwub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
MS8yXSBkdC1iaW5kaW5nczogdHJpdmlhbC1kZXZpY2VzOiBhZGQgbHQzMDc0DQo+ID4+DQo+ID4+
IFtFeHRlcm5hbF0NCj4gPj4NCj4gPj4gT24gRnJpLCBKYW4gMjQsIDIwMjUgYXQgMTE6Mzk6MDZQ
TSArMDgwMCwgQ2VkcmljIEVuY2FybmFjaW9uIHdyb3RlOg0KPiA+Pj4gQWRkIEFuYWxvZyBEZXZp
Y2VzIExUMzA3NCBVbHRyYWxvdyBOb2lzZSwgSGlnaCBQU1JSIERyb3BvdXQgTGluZWFyDQo+ID4+
PiBSZWd1bGF0b3IuDQo+ID4+DQo+ID4+IFJlZ3VsYXRvcj8gVGhlbiB3aHkgaXMgaXQgdHJpdmlh
bD8gTm8gZW5hYmxlLWdwaW9zPyBObyBJMkMgaW50ZXJmYWNlPw0KPiA+Pg0KPiA+PiBCZXN0IHJl
Z2FyZHMsDQo+ID4+IEtyenlzenRvZg0KPiA+DQo+ID4gSSBiYXNlZCB0aGlzIGRyaXZlciBwcmlt
YXJpbHkgb24gdGhlIExUNzE4MlMgZHVhbC1jaGFubmVsIHNpbGVudCBzd2l0Y2hlcg0KPiA+IHJl
Z3VsYXRvci4NCj4gDQo+IA0KPiBJIGRvIG5vdCB1bmRlcnN0YW5kIHdoeSB0aGUgYmFzZSBvZiBk
cml2ZXIgbWF0dGVycyBoZXJlPyBJZiBpdCB3YXMgYmFzZWQNCj4gb24gTFRGT09CQVJHUk9VTkRI
T0cxIHdvdWxkIGl0IGNoYW5nZSBzb21ldGhpbmc/IEkga25vdyBuZWl0aGVyDQo+IExUNzE4MlMN
Cj4gbm9yIHRoZSBMVEZPT0JBUkdST1VOREhPRzEuIEFuZCBkcml2ZXIgbWF0dGVycyBoZXJlIGV2
ZW4gbGVzcyAtDQo+IGJpbmRpbmdzDQo+IGFyZSBhYm91dCBoYXJkd2FyZSwgbm90IGdpdmVuIGlt
cGxlbWVudGF0aW9uIGluIE9TLg0KPiANCj4gPiBUaGUgTFQzMDc0IGlzIGEgc2luZ2xlLWNoYW5u
ZWwgZGV2aWNlIHdpdGggYmFzaWMgZW5hYmxlIGFuZA0KPiA+IHBvd2VyLWdvb2QgR1BJT3MsIGZl
d2VyIHJlZ2lzdGVycywgYW5kIGZld2VyIGZ1bmN0aW9uYWxpdGllcyB0aGFuIHRoZQ0KPiANCj4g
U28gaXQgaGFzIEdQSU9zPyBBbmQgYnkgR1BJT3MgeW91IG1lYW4gd2hhdCB0aGUgU29DL0NQVSwg
dGh1cyB0aGUNCj4gb3BlcmF0aW5nIHN5c3RlbSwgc2VlcyBhcyBHUElPcyBvciBzb21ldGhpbmcg
ZWxzZT8NCg0KWWVzLCB0aGUgT1Mgc2VlcyB0aGVzZSBhcyBHUElPcy4NCg0KPiANCj4gPiBMVDcx
ODJTLiBMaWtlIG90aGVyIFBNQnVzIGRyaXZlcnMsIGl0cyBHUElPcyBhcmUgbm90IGV4cG9zZWQu
DQo+ID4NCj4gPiBIZXJlIGFyZSBvdGhlciBQTUJ1cyByZWd1bGF0b3JzL3Bvd2VyIG1vZHVsZXMg
Zm91bmQgaW4gdHJpdmlhbC1kZXZpY2VzDQo+ID4gSSBhbHNvIHVzZWQgYXMgcmVmZXJlbmNlOg0K
PiA+DQo+ID4gLSBpbmZpbmVvbixpcnBzNTQwMQ0KPiA+IC0gZGVsdGEscTU0c2oxMDhhMg0KPiAN
Cj4gDQo+IEkgZG9uJ3Qga25vdyB0aGVzZSBkZXZpY2VzIHNvIHN0aWxsIG5vIGNsdWUuIFBsZWFz
ZSByYXRoZXIgZXhwbGFpbiBpbg0KPiB0aGUgdGVybXMgb2YgdGhlIGhhcmR3YXJlLCBlLmcuIHdo
YXQgdGhpcyBkZXZpY2UgaGFzIG9yIGhhcyBub3QuIFNlZQ0KPiBhbHNvIHJlZ3VsYXRvciBiaW5k
aW5ncy4NCg0KVGhlIGRldmljZSBoYXMgZW5hYmxlLWdwaW8gYW5kIHN0YXR1cy1ncGlvLiBJdCBh
bHNvIGhhcyByZWdpc3RlcnMgb2YNCnNpbWlsYXIgZnVuY3Rpb25hbGl0eSB3aGljaCB0aGUgY29y
ZSBkcml2ZXIgYWNjZXNzZXMgaW5zdGVhZCBmb3INCnRvZ2dsaW5nIGVuYWJsZSBhbmQgbW9uaXRv
cmluZyBzdGF0dXMgb2YgdGhlIGRldmljZS4NCg0KVXBvbiBjaGVja2luZyByZWd1bGF0b3IgYmlu
ZGluZ3MgYW5kIG90aGVyIHJlbGF0ZWQgYmluZGluZ3MgZm9yDQpQTUJ1cyBkZXZpY2VzIHdpdGgg
cmVndWxhdG9yIHN1cHBvcnQsIHRoaXMgaW5kZWVkIHNob3VsZCBiZSBhDQpzZXBhcmF0ZSBiaW5k
aW5nIG91dHNpZGUgb2YgdHJpdmlhbCBkZXZpY2VzLiBQbGVhc2UgbGV0IG1lIGtub3cNCndoYXQg
ZG8geW91IHN1Z2dlc3QuDQoNCkJlc3QgUmVnYXJkcywNCkNlZHJpYw0K

