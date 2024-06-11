Return-Path: <linux-i2c+bounces-3982-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDF69041D9
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 18:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DA211C20B52
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 16:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3503E4F602;
	Tue, 11 Jun 2024 16:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="atX25q6I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2123.outbound.protection.outlook.com [40.107.22.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA01C4F88C;
	Tue, 11 Jun 2024 16:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718124770; cv=fail; b=XMZyJ/SUHyD5y8BlCT6uCAvMDVbKWHJYrMUzg3shsUbKxOtx8dY5udGVijJ5N+heQu0nsLIqqaPYJI6uBezzGNJ5ajw0llPuwbqxLWNwf4rQrqsq2YYAyK+QJ6k0KJXtLvmqAjnCA5pMdYhJ3/bfZaI1qaXsI5xhoVdbjO5hbKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718124770; c=relaxed/simple;
	bh=XSFxAOifKJ2jQQsXPNRLYBKlxiab1sjNGTgH2BFCv70=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dgEfkuhElPQiNPBl2WRRcMOTfXztHoQ2MU4l2LX8rbT/1htsyy21ExI3+Ky4MRUyjzMst0TY+Fw0YJKhFL+7kW1JxaiVH28lxCYqSSRiHvp8thf31+L5PGCxS9ZYovyDQFiVDCQXUrHfV9I7CuO+h1EBXfESoVQNIq/q5Z5dLxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=atX25q6I; arc=fail smtp.client-ip=40.107.22.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJCQownJAfSb4pJXM1q511wjxBPv9kGMkIizVI/ZQ2uGiIHmTmb/FqZGtWXY/7JQLbjbooN+hl2lhoyZTAn0+8GABEibBp4lcZpzFj08MknOCnMETdHUtTQFnCS17CWjGADoG8FCLS1jbu2iV7K2V6AAhR/B4h9rUCedko9DzxEeIso17SGAGdxhXhpMm+PayZJl5CvSuwDHKTVSemrPQ0p5ABqjBtHmmBnFz2Y+XKifJamDK48YcOuvARQKc2NOP5eLBBEtDvL9lcHoiSad2ZwftmctF00xPHfEYg4hQkGOBFpXahqNShbeRE/+8PIfilVvTtk/0kTjtNDYyNAB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCrxHHgsnNgmXSuQpBor3JJh+cRZRToA2zeyZd++VcQ=;
 b=lDOHntKHeUBdPMvU7VWzIgIsnh5ojjypacQCtDEtXaKXGeaET5Q8gO+LFhPaFdvvk6R/9cS4g4tzzmhfKMIKxLa3YMA+fl8ScrX4JA0TBSmDWc1o5aEkNLNZ2a9HrKY0ljqrRVEg+YMjN/OMoU5gIVNCvkKxsFje4h3Ns1yxLJxlnjNoZ2gsvq2/YoYhLXofo+pA4FHUKOFBnjQcNzbHDfYuppcVbHecSeMaATZ21GBp1ShZwAUlfP//WGXCCozrPoYTQHTTm09RzGVwhnr7f8DZSYGaBR+e4Dq1LQivJURMXxj2atmrJ+HW/PwMWyj9+/gEQALWrw++ccw8g7g58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCrxHHgsnNgmXSuQpBor3JJh+cRZRToA2zeyZd++VcQ=;
 b=atX25q6IdwcfeTqZ12BsRyYc9RPYbCKbAv6Vv2y9l9RrhWW8WsaZpY0IL6nQy9wdp8EnKRmznPG06wz5moJgewatsPPFnh4GCAWc45TxxnAj9Ht7lZ2x5jP3xm2gyQigML6oiWi9l1P5UN3rXttT3Ef/d3sexCuaDQLmntgGTyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 by AM7PR04MB6918.eurprd04.prod.outlook.com (2603:10a6:20b:10c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 16:52:38 +0000
Received: from VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6]) by VE1PR04MB6382.eurprd04.prod.outlook.com
 ([fe80::2a24:328:711:5cd6%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 16:52:42 +0000
Message-ID: <80883dd5-2be0-4f8b-8298-ca076e6ac558@cherry.de>
Date: Tue, 11 Jun 2024 18:52:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] i2c: muxes: add support for mule i2c multiplexer
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Quentin Schulz
 <quentin.schulz@cherry.de>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240611-dev-mule-i2c-mux-v3-0-08d26a28e001@cherry.de>
 <20240611-dev-mule-i2c-mux-v3-3-08d26a28e001@cherry.de>
Content-Language: en-US
From: Farouk Bouabid <farouk.bouabid@cherry.de>
In-Reply-To: <20240611-dev-mule-i2c-mux-v3-3-08d26a28e001@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To VE1PR04MB6382.eurprd04.prod.outlook.com
 (2603:10a6:803:122::31)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:EE_|AM7PR04MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f66499-b142-41bf-a549-08dc8a36e89b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|376006|7416006|366008|1800799016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anY2U1daa3RROTB1dnNQRis2SmNsdTB1K291RnhkZXpRcDVwamM4aFE0V3Yr?=
 =?utf-8?B?czZYVUxZVkU3eEJONDhxNWVKbGdYR2JPaFZqdHZPQzNlSnh2YXBMcXRPTUpy?=
 =?utf-8?B?UTh4VTFpeVZya3NpTWJLbGZsdFdLRzc5b3VuMVk5MHVNVk1sSW45U3c5OUtU?=
 =?utf-8?B?bDgwNVFjc3NPc3gzVy94WkZuRUtBNnBLN3kwUTBSTVNrWjBKMkJuREw4MjVn?=
 =?utf-8?B?b3RWVFI2VHlXS2JUZmlLekFTdkRiM3pDNDNEaEFKalFEMEZ5SGpUZWlMSnpy?=
 =?utf-8?B?OTlqOVlrQnphTWRrRkhLcmtNdUZtVStJL1RuaThxc0xIRXFZdWRZK1RyZmd1?=
 =?utf-8?B?YUs5RFpUUldUQVZiTlZBbkRuTGxIdFA4WVVnUnh5TURRQnA2R1g0YU9sTFlT?=
 =?utf-8?B?Slp1WjlRMGlKNGc5VGpNKzN2VjQwSWRwMEdIVUZhTml0cU8xcVFhT25La3Ba?=
 =?utf-8?B?Q09LdWdEUGM4MUhrR0YwMGFaNmQzQVJBeG5nNGcrOVpHTUUwUWhyVVJ2bmI3?=
 =?utf-8?B?eGEzT2Z3YjBsa3Bia09yKzVLRk9kZWtOZjF5SXM5QjZxNDYrdVoxLzlLcUNy?=
 =?utf-8?B?UWVIdXJoK0k3aDBFUmt5UUVReEFTZ3lud2tCR0hpcXR4RDdFeVkvaDBBWER2?=
 =?utf-8?B?TlZPT3lzR0tBWGdrcjNnMExId2NGSjVHbG56WklkZ1oyRnNwRUYvdjQ0WWFD?=
 =?utf-8?B?cmhVQ1pNREFMTW5UMzBldzJKVkFxQjBwTDJDUHNXU0M3Wnl1c2o3QTBFRWFw?=
 =?utf-8?B?WGl0MlhpR0FNWnR4WVYvV0FEM3FJaHBhT2Z6UHh4bzNWdUNzTHk4dlduWHpZ?=
 =?utf-8?B?cWNBc0FZZ2lpV01zOGV3MHBQMFE4eU1sekR6Y2pTWDJZcm1SYzdnSnF3Y1Q3?=
 =?utf-8?B?eGVUVWdXaE5MKyt4d3hBa2FZdUhFd2h5b1dGOWlEdkhPK1IwZmxzYVdESmxj?=
 =?utf-8?B?aVEzeWptNVBBRG5ibHBnYXVJQVNFb2tjODh1eThGazZYM2hBQ1FBQTRWbG1Q?=
 =?utf-8?B?VFJXUktVeW1Zei9BYiswY0NTbi9DREhUbXVwMjlpNzViZ0pTRjFtbEM3cE4x?=
 =?utf-8?B?SGxEYngzcWxYcVFWVEhMU29oODUwdzVyQklsZU5aTkJqVUV3UU40MVZrMkl1?=
 =?utf-8?B?UEF1UUVqVXlaSE5XV1ZpYk9QUW9uTVR1Z0VtMVcybGREQk5uRVFIYjdHMGh3?=
 =?utf-8?B?S3U0Zk1QQm1BVysrbVBRcTVmaytlZlh4bFg0T0F3ZkV3VGlBOGtrNHpLMXJz?=
 =?utf-8?B?c1Y5MGtXYnBORUdSVE5QaUtoRmVRQVhWOTUrbGxxS29hVC91Rys5eFN6VlZI?=
 =?utf-8?B?TWRGbXRpWTljdmFRR3drOUpDS29KZE9TY2Q5QnVJOU4xaXZmTisvVEtSWTAz?=
 =?utf-8?B?b3gxZ3VqRmFzNUxVbmE4UVByanprMldEbkJDVU9JbU1kNThBQ0ovcHdleTRC?=
 =?utf-8?B?NVFFVWprUlZnWlpsSzdOREgwNUV1Q0dMYSt5OFRWWGJWZ0I2ZTMxc0RZNldF?=
 =?utf-8?B?WlQxSmt3V2YxU1BrZzZRRmt5UCt5ZjJZMmVYMWd4NWtCdnlLVTVMaGk5RFNR?=
 =?utf-8?B?SURXYzZCdDFFZEVZV1FuL0J0RGhiRjVNVDYxVW9Kejdtam43SmNvaE0rS3N3?=
 =?utf-8?B?R0dZdngxeDJCaTNob2kwMUlyNHhiY2NoM0F4NlRsUEpkVXNJczF5b0V6Q2hk?=
 =?utf-8?B?SFJUOGxiQnN1T3lNNEtFaUVyeHdYK3ZpVW9oakI0a1oxQXhSV0pCczMzdXRt?=
 =?utf-8?Q?uAmTs7S4iXTiujMICliZkDcqs8tLW6ldZ8YNkn/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6382.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(7416006)(366008)(1800799016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjBZbFpmTmVSbTZqYXE5QUtNL2JpSGdDSy9tZWszNVBNUngvRGxIT0pnSUZm?=
 =?utf-8?B?b0s4cWFTTlQwdmt5WnhCOWMycVRBUkRJSU1mRGI3Q0pSSWRISTdzZVBtZFZh?=
 =?utf-8?B?KzBXRUxYTXFaMzZKWnphM3JMRHFnS3BDOHUvMkE3TmcrVEFjNm9aY1ZoQnlD?=
 =?utf-8?B?QUlyZG5HVnRoL2JXdVVEWUtBOXl3M0xQOGU2NWdjM2ZyVmt4SWZvVXhkUEdl?=
 =?utf-8?B?Mk1CaXpmMmFRR0xoZHRtL3lycThIclg0d0xjVUVLeDVmUXhCOTl5Z2FMWjZ0?=
 =?utf-8?B?QUR4Qk1rQnNQQU1EcEg1czB5ZVIwQWN0a0s1OWtSUWltckhkZG1yT3NzZDYy?=
 =?utf-8?B?YnFxL3ZXRVN4Tm1seUJTVTlQd2R3Q3FPdUp4d1FYaElGaGVnd0RON2NEMzlF?=
 =?utf-8?B?ZTQwRmI3eUd6UXNTaG02dXVBTnpqcFJnamdBUTVGNnYxNjFza1V6Ukd3YjR3?=
 =?utf-8?B?dHJyYkpiNkRjT1I3TmtQalpFV3NyWVdyS3J5bzN2U3RQYVBPc2NHOFc2TTB5?=
 =?utf-8?B?VktMV0NiZHJsQjlaM2ZGYjRwcUdoOXJGNHlnVVhqQVIyVTZEemVZYmlRRlBt?=
 =?utf-8?B?ZkpuRURKNUhPc25xT29FNWc2cW1QeU0wVlJYcktnT012UjR6ekUvM09TZXkr?=
 =?utf-8?B?eE1kYWxrZFc2OEhRVnhLWjZmSkZZS2VVMzN1RHFITlpaeVZ6bDdDbHRvN3lz?=
 =?utf-8?B?VEJWWGNoZVB2VlB0UHUyT0twYitVY1kraWF5aFRnaG5jaUZQdGVpQjM4WkZq?=
 =?utf-8?B?NytEWDZuVGFST0hscG94VEVUUnJvTURMS2lONFk5VWV2dzV3L29CSVZNQ3lq?=
 =?utf-8?B?SEJ2MTZCd3FYa3UwTVFFTGdTYS94WFoyaUpuVzVzam9FdU9SOVdyVjdsemx6?=
 =?utf-8?B?NUFFaEJrNFNTalhFcER1dWluR1NVRWMrOGMrejQrTTZYd0dtNWNpSHZTSnNC?=
 =?utf-8?B?UEduZ1Y2UVl4VC84VGdJUCs2Z1ZIaUp0TTN5Njloc3pKSVYvUkRZaWJmTWlm?=
 =?utf-8?B?N2c4R0w4VU9udFlJRVBDN3JJaFF2ejBXdS8zMjdGUUllUVB0aTU3dERmVnVk?=
 =?utf-8?B?aHh6VVJleXVrQUVWMWZHSUNldG95L2NmNUxaandSb0VVWDBUUE4vbkxzQU9h?=
 =?utf-8?B?VlcyZ3BmbU5GbGdpOVJxaEFlczN2M2xzNmpnaXhidW1XTytEYkRzdmFHMWFv?=
 =?utf-8?B?Z00yM1NFSjBjYTVRSW5KTHFlWHpGU09zUncxWG9CS1NhZnVKNXNnVGNINndQ?=
 =?utf-8?B?ZmttY1NZTjhtd3N6dTE5S1lJV2F4NEhHVzVoK2JEQzFOSUpXVHJZQjlGVjFw?=
 =?utf-8?B?Z204d3UzM25JbHRmcThOdVR6U1hoUXlQS1ZSSDlPVEl1Q1pLVE40RGRIWk5N?=
 =?utf-8?B?alI5K2lSbTdWN05zdi9RaTU0alo2Ykh3eUdjR2RSWCtIWmpha2FETlBHNmda?=
 =?utf-8?B?SXQzYy92cTNHWEF3RGZjQmhVZDRBKzRNV2FFckVseWNINjYxMS90VlhhNEw2?=
 =?utf-8?B?Zm8ybURoT09YaGZYQkhCRmUzVC9EL0tBY1cydWJQV3lsT2NyRWNZWW9Qd2NS?=
 =?utf-8?B?c2VzRExwcnF6S3lPOGgzNEFoRHVKS3c2MmpuWXBicEQzTHlUQklkRDBJanhH?=
 =?utf-8?B?WWFEUUlLL3d3aGJlU0Z2ZC9YMXQvYitML2M2NVV5aDlPR2x5czMwVlhTNzZR?=
 =?utf-8?B?ekRpWEN5c0hSZE9BUThBbVpGUzlWUlpwc014Mm9SYkJMeXRRenZRcFF5cnJO?=
 =?utf-8?B?aTBIanRhaksybi96S1h1Y2tQOUtlWUd6Vm12VU5KdnBoc1diYnVkMDE1eUJ1?=
 =?utf-8?B?ZmZzLytTVDJ0OERZS3dvT28xeWk5T3ExR05qY2V2RmF6WHovNzAyUEwxS0lt?=
 =?utf-8?B?dG9vUXByWWRVYmVqNW1FWkFPd2NjcEJ5U3liVWowd016SHBDOENRUGpTKzln?=
 =?utf-8?B?a2VZakxIbmtiZUczK1R2UUNOeFNVWXVlRE1sNUxFektzMGlpSVdxZ2VDMGpn?=
 =?utf-8?B?MWZqQUxHWFFJdUNnc1M4SnZNcHNQSVVkY252MUFrcDE3cVBhZ1BqOFpDd1p2?=
 =?utf-8?B?R3FXY0dkdjlWL2hIRkdSTTNTTk5hbUx2TXpvbTNlU2F6R0RKZ3pCcFB1bkZp?=
 =?utf-8?B?S3RXNjhvQi9iQ2xMYmE2Q0wvNzhaS3VpKzB0RTNQVm9yNmYyWnVuQXJ3elVv?=
 =?utf-8?B?Q2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f66499-b142-41bf-a549-08dc8a36e89b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6382.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 16:52:42.2522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ExkMDZwtW1JMrWj3SaSIkp/lwdJMVy0wgNe+PnP8bbzX4sCEM3k4kUiexPRdASJCHypSRvuMhH2VPP5FSNOsn9VKRQoeha7UKzP6f18TlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6918

Hi all,

On 11.06.24 13:43, Farouk Bouabid wrote:
> Mule is an MCU that emulates a set of I2C devices which are reachable
> through an I2C-mux.
>
> The emulated devices share a single I2C address with the mux itself
> where the requested register is what determines which logic is executed
> (mux logic or device logic):
>
> 1- The devices on the mux can be selected (mux function) by writing the
> appropriate device number to an I2C config register (0xff) that is not
> used by any device logic.
>
> 2- Any access to a register other than the config register will be
> handled by the previously selected device.
>
> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
> ---
>   drivers/i2c/muxes/Kconfig        |  18 +++++
>   drivers/i2c/muxes/Makefile       |   1 +
>   drivers/i2c/muxes/i2c-mux-mule.c | 157 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 176 insertions(+)
>
> diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
> index db1b9057612a..70876259796d 100644
> --- a/drivers/i2c/muxes/Kconfig
> +++ b/drivers/i2c/muxes/Kconfig
> @@ -119,4 +119,22 @@ config I2C_MUX_MLXCPLD
>   	  This driver can also be built as a module.  If so, the module
>   	  will be called i2c-mux-mlxcpld.
>   
> +config I2C_MUX_MULE
> +	tristate "Mule I2C device multiplexer"
> +	depends on OF
> +	help
> +	  Mule is an MCU that emulates a set of I2C devices which are reachable
> +	  through an I2C-mux.
> +
> +	  The emulated devices share a single I2C address with the mux itself
> +	  where the requested register is what determines which logic is executed
> +	  (mux logic or device logic).
> +
> +	  If you say yes to this option, support will be included for a
> +	  Mule I2C device multiplexer. This driver provides access to
> +	  I2C devices connected on the Mule I2C mux.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i2c-mux-mule.
> +
>   endmenu
> diff --git a/drivers/i2c/muxes/Makefile b/drivers/i2c/muxes/Makefile
> index 6d9d865e8518..4b24f49515a7 100644
> --- a/drivers/i2c/muxes/Makefile
> +++ b/drivers/i2c/muxes/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_I2C_MUX_GPIO)	+= i2c-mux-gpio.o
>   obj-$(CONFIG_I2C_MUX_GPMUX)	+= i2c-mux-gpmux.o
>   obj-$(CONFIG_I2C_MUX_LTC4306)	+= i2c-mux-ltc4306.o
>   obj-$(CONFIG_I2C_MUX_MLXCPLD)	+= i2c-mux-mlxcpld.o
> +obj-$(CONFIG_I2C_MUX_MULE)	+= i2c-mux-mule.o
>   obj-$(CONFIG_I2C_MUX_PCA9541)	+= i2c-mux-pca9541.o
>   obj-$(CONFIG_I2C_MUX_PCA954x)	+= i2c-mux-pca954x.o
>   obj-$(CONFIG_I2C_MUX_PINCTRL)	+= i2c-mux-pinctrl.o
> diff --git a/drivers/i2c/muxes/i2c-mux-mule.c b/drivers/i2c/muxes/i2c-mux-mule.c
> new file mode 100644
> index 000000000000..db27fa560995
> --- /dev/null
> +++ b/drivers/i2c/muxes/i2c-mux-mule.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Mule I2C device multiplexer
> + *
> + * Copyright (C) 2024 Theobroma Systems Design und Consulting GmbH
> + */
> +
> +#include <linux/i2c-mux.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#define MUX_CONFIG_REG  0xff
> +#define MUX_DEFAULT_DEV 0x0
> +
> +struct mule_i2c_reg_mux {
> +	struct regmap *regmap;
> +};
> +
> +static const struct regmap_config mule_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +};
> +
> +static inline int __mux_select(struct regmap *regmap, u32 dev)
> +{
> +	return regmap_write(regmap, MUX_CONFIG_REG, dev);
> +}
> +
> +static int mux_select(struct i2c_mux_core *muxc, u32 dev)
> +{
> +	struct mule_i2c_reg_mux *mux = muxc->priv;
> +
> +	return __mux_select(mux->regmap, dev);
> +}
> +
> +static int mux_deselect(struct i2c_mux_core *muxc, u32 dev)
> +{
> +	return mux_select(muxc, MUX_DEFAULT_DEV);
> +}
> +
> +static void mux_remove(void *data)
> +{
> +	struct i2c_mux_core *muxc = data;
> +
> +	i2c_mux_del_adapters(muxc);
> +
> +	mux_deselect(muxc, MUX_DEFAULT_DEV);
> +}
> +
> +static int mule_i2c_mux_probe(struct i2c_client *client)
> +{
> +	struct i2c_adapter *adap = client->adapter;
> +	struct mule_i2c_reg_mux *priv;
> +	struct i2c_mux_core *muxc;
> +	struct device_node *dev;
> +	unsigned int readback;
> +	int ndev, ret;
> +	bool old_fw;
> +
> +	/* Count devices on the mux */
> +	ndev = of_get_child_count(client->dev.of_node);
> +	dev_dbg(&client->dev, "%u devices on the mux\n", ndev);
> +
> +	muxc = i2c_mux_alloc(adap, &client->dev,
> +			     ndev, sizeof(*priv),
> +			     I2C_MUX_LOCKED,
> +			     mux_select, mux_deselect);
> +	if (!muxc)
> +		return -ENOMEM;
> +
> +	muxc->share_addr_with_children = 1;
> +	priv = i2c_mux_priv(muxc);
> +
> +	priv->regmap = devm_regmap_init_i2c(client, &mule_regmap_config);
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(priv->regmap),
> +				     "Failed to allocate i2c register map\n");
> +
> +	i2c_set_clientdata(client, muxc);
> +
> +	/*
> +	 * Mux 0 is guaranteed to exist on all old and new mule fw.
> +	 * mule fw without mux support will accept write ops to the
> +	 * config register, but readback returns 0xff (register not updated).
> +	 */
> +	ret = mux_select(muxc, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(priv->regmap, MUX_CONFIG_REG, &readback);
> +	if (ret)
> +		return ret;
> +
> +	old_fw = (readback != 0);
> +
> +	ret = devm_add_action_or_reset(&client->dev, mux_remove, muxc);
> +	if (ret)
> +		return ret;
> +
> +	/* Create device adapters */
> +	for_each_child_of_node(client->dev.of_node, dev) {
> +		u32 reg;
> +
> +		ret = of_property_read_u32(dev, "reg", &reg);
> +		if (ret) {
> +			dev_err(&client->dev, "No reg property found for %s: %d\n",
> +				of_node_full_name(dev), ret);
> +			return ret;
> +		}
> +
> +		if (old_fw && reg != 0) {
> +			dev_warn(&client->dev,
> +				 "Mux %d not supported, please update Mule FW\n", reg);
> +			continue;
> +		}
> +
> +		ret = mux_select(muxc, reg);
> +		if (ret) {
> +			dev_warn(&client->dev,
> +				 "Mux %d not supported, please update Mule FW\n", reg);
> +			continue;
> +		}
> +
> +		ret = i2c_mux_add_adapter(muxc, 0, reg, 0);


The class parameter was recently removed from this function but I forgot 
to remove it. Sorry for the noise, I will send a v4 for this fix.


Cheers,

Farouk


