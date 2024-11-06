Return-Path: <linux-i2c+bounces-7819-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8FF9BDF66
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 08:27:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A01EE1C22DD3
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 07:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05E31CC8A4;
	Wed,  6 Nov 2024 07:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b="RHRR/TFW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2092.outbound.protection.outlook.com [40.107.255.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5458F192580;
	Wed,  6 Nov 2024 07:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730878062; cv=fail; b=FPq+lJ8BQIUFwyfjv5frM0+eRVzFW/QDv1kgv+rvRB+2CatZ4w60LikN9ijABJtu4nL/0crpB9K/kwnCeATAb2Le/J+R/BEocLpj7wH4d+l52oETXcl2f9iLa9VevdFtmH35OYDaedUYBFgeMpEU8itCJQN+5Lu7x6xQLD6nkTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730878062; c=relaxed/simple;
	bh=E8yQIjKoO6MBvYhkMPYGNMZ9QE86p0UnG/zHGPTQyhI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iCqZGK4tnjnonWgaTEWt4TyeDdvRdkp4yoz9uoo4J2HmoYVy8yxDMyb5rJgWZGXSxedirOkVsfnKhoWgKl4DMS2X/7I78s3YGnG3FauUR7zmW5bcfDFejuNWRLq96agyXqtD+2St9oIUwkYyAuW3doiciUIpXOBvmNEPMyDf1oA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com; spf=pass smtp.mailfrom=jaguarmicro.com; dkim=pass (2048-bit key) header.d=jaguarmicro.com header.i=@jaguarmicro.com header.b=RHRR/TFW; arc=fail smtp.client-ip=40.107.255.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jaguarmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jaguarmicro.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lad18Di2fGb9CgAa3Zhx76Hhl6Iow+EhDcvAvq8YFxyw0Z/jX1CsoLkOuzAUB5rogQoYTAqIqOQX33PzuQYE9HJlI/CwEDfNQMFCgLR1SPWOGxge7RVDfitzXjhzqx2QTG8dED8onif8GYCAYiiPojP8JaRC8dpDfudB8h6nVs7J5KoO1G1pevY5KuGK79SQ1u2UqsVHgq9GrlgQrMt7XM4G/QR48on7YWi5wB0HC+1GBU/2MuhFlPW+X/8Stpv/ZzMMZhqpXmHEkoyIh1ZDr5ADLdYGwMreCF+wJkA9RZdNbaP7fcswlOWsvXVqNyQ2cpw5i3QoCqEpQ5NzlNmO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gv0fC9m0tC2PCS08scaDFq497dE+Qv5u29/7RQdHRfc=;
 b=pNgRjmweYP6RNJK3WTdYGDoxvYdxHxAA73qI7XNHTkp6Gr2/0iRa2ykK+iuqg5LFeNJ8wo9Jtv/skpY2iBifSAtmuRZxjiab0Eoosgz3SbSM4/RbxbB1jxZb/wmBVVSOvumHwtVX/P9jl2o/1ptb+S3oDs+zp0pYnpsqF47en46MdAMIcjeyQg/KRz8OJLmjoFz93HZFTMTnLt/4dj6TORa1R7l9eEqSsQEIgyQ2EKEAyj7dlKO1vsyDdOEKtuMsxcnMXnB+VSgzyzjy/cv4QVU6PF6hFQOh272lYWr94tJC8o5lBzjDGHWWoEFKeOa9qOjFlx0gcLN8YoanNTBGgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jaguarmicro.com; dmarc=pass action=none
 header.from=jaguarmicro.com; dkim=pass header.d=jaguarmicro.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jaguarmicro.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gv0fC9m0tC2PCS08scaDFq497dE+Qv5u29/7RQdHRfc=;
 b=RHRR/TFWL3OXVzSdb9Gjqkh5WzUZ8SEtq8wsb9kWdu+js/hNQUFjgFx5XlVIetPrToUyedo4iyKMmH14A8vditA1lb9YCwV1ZuyZQqeKnQLWCTgyChzli77DyOpUHqrYTy0a6uGobrLe+qc8K6Kqg37Bxw9P6gA4h8YTVtWUQpsPdVndDVYQIaWiZJoCFk2Rt+Um0lNpK0h00+p7ECsy8UD/DLQUSpkarArrq8jq7vquXtXNiH4pYPJZqf5UbV167LPVfbZAi/NVKJmVKirIW8A7iE5VqmP5iWy+yztsG4QzRSBmKAnHqL/tJDur+xifXDcfRHGv95PfyZqnouFjiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jaguarmicro.com;
Received: from SEZPR06MB7060.apcprd06.prod.outlook.com (2603:1096:101:1f3::11)
 by SG2PR06MB5082.apcprd06.prod.outlook.com (2603:1096:4:1c9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 07:27:34 +0000
Received: from SEZPR06MB7060.apcprd06.prod.outlook.com
 ([fe80::666b:290b:a932:b60]) by SEZPR06MB7060.apcprd06.prod.outlook.com
 ([fe80::666b:290b:a932:b60%5]) with mapi id 15.20.8137.014; Wed, 6 Nov 2024
 07:27:33 +0000
Message-ID: <d2abc63a-884d-4d48-b652-56989e55d0cd@jaguarmicro.com>
Date: Wed, 6 Nov 2024 15:27:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND TO CC MAILLIST] i2c: designware: fix master holding
 SCL low when I2C_DYNAMIC_TAR_UPDATE not set
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, "xiaowu . ding"
 <xiaowu.ding@jaguarmicro.com>, Angus Chen <angus.chen@jaguarmicro.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241101081243.1230797-1-loven.liu@jaguarmicro.com>
 <ZySU7bEvct4_FbBX@smile.fi.intel.com>
 <3580ce2a-963b-4a50-98b5-52ecac43871c@jaguarmicro.com>
 <anhqlov5vdsicmopulnvbaerhctjaauwsvl6nlc3llsh4hi5sn@d3jmeqxnlhpl>
Content-Language: en-US
From: Liu Peibao <loven.liu@jaguarmicro.com>
In-Reply-To: <anhqlov5vdsicmopulnvbaerhctjaauwsvl6nlc3llsh4hi5sn@d3jmeqxnlhpl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To SEZPR06MB7060.apcprd06.prod.outlook.com
 (2603:1096:101:1f3::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB7060:EE_|SG2PR06MB5082:EE_
X-MS-Office365-Filtering-Correlation-Id: dbdfa1dc-073e-4fdd-45ad-08dcfe347af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1VVY1FDT3kweTY4b0dBYlc4VStTd2p2R2w5Z2lQMXp5TjlKcnVXVjlKMmpU?=
 =?utf-8?B?aXJtZnROU1d4U3g0NW1yZ1ZINVcrV3hzMUZhZXR1Z2J2Y2FRdEs5U244NDht?=
 =?utf-8?B?bG5zVHZqWWFZbmFHRmNvMTJsTjdEMy81d1ZzM2VDOFE4UlBOTUR3VE1UeEpn?=
 =?utf-8?B?d1JoaU1MZzkxNWFadkhTcTlWdVh3OWtDYWFOVVY1SEdsT25tS01td3EweXdm?=
 =?utf-8?B?bHZvdTZFVWExZ1Bkb05tVGo5WUZZM29iS0QvNXgzRHNDTzdsN2dIUTNVazZQ?=
 =?utf-8?B?clZWY1gwVC8rWUpBYjNpMGxlUmFzb2dQUUJobU1MVjZPUzZkTnpKdUdKSTNP?=
 =?utf-8?B?eHNhVVhOZFZ0ZWNVQ2tKdEczY09Ha2tLQ0ZBS3FXQjZLU2FoMGltY1QvZlg3?=
 =?utf-8?B?SWxrODJwcFhDNmxnR1RDem40NlRGTUFWRmVPbWljQzhsUVNPd1V6WStpRDRM?=
 =?utf-8?B?THBNV0swaXdTWjMzckxkdEZEL0huYm9FQ0VzR0hNVU1qK1ZaNXp4MXdqbFBP?=
 =?utf-8?B?dTJQUEJSMzQvQnp4eHhqVTFSaU9Scy9kRjB0cHRRUkZQN25US3MzREtVdHNp?=
 =?utf-8?B?bjRGelFuT3lOWXZadm9CNHhWRHBWcWYyRURqc0xuSUVVUnAvOGJJaTZVcVhk?=
 =?utf-8?B?cnM4SmdKUDBkVEFhdWdZa1ZQVTlsdStNbCtIdFowcHlrdTlEMURFaElwMEdM?=
 =?utf-8?B?NGNhRWF6QjIrWkJ5NmU1TThvU2FWL2xqWnJSUm5rajdMZmd5dTNGdjZLZk1Q?=
 =?utf-8?B?MHo1SW9MSVZ6L292RFRVczFFT2VNTU5yaWk5bTlLbGY3VndVQTJzVUU0L21K?=
 =?utf-8?B?d3lCcGh3NWM3KzZCdDdpYStlOVJDeW5UbFJNbUIvQytvckEycDMyY2dxL0Er?=
 =?utf-8?B?d20wcmlVd0s1alBqK2FSZ1lDeC94UjNBTXJ6M2dvTGhqZjBZd0Q2b29MVWp4?=
 =?utf-8?B?NUhqZ1RLcTh3MktyaUMyYkEyYmhpd3p3THN2NTIvNEJzOHNjdEdacE5tQnFF?=
 =?utf-8?B?ZnUwWVFaOGJGRkRpSzdDanJLYVBlZ1pjQnJUVndlbXJURXhKZE9IQW5LTEVO?=
 =?utf-8?B?b1NMa2xOaW1odml4c3B3QnFaVk9GcWdydTlSSU4wNjBraXZzaXZHQTlvNUpt?=
 =?utf-8?B?aS9QcFpCNEVVMWVybjlJaW9BWXFxbWtURmRSK3E0NU9yd2RISi83WkMxYk9D?=
 =?utf-8?B?alBsampOeG1kV1FYTHRxcVo0MVRDYkhKOUY3cFVyNE81WTFoc0ppWXNPZkE2?=
 =?utf-8?B?NWxUQjVEQXhrbXB0MkJBdkdRYTlKc1kzemxOOWFibW90SmN1cGF1Mno4WEFs?=
 =?utf-8?B?S3dyLzdlVGQ0cUlieEZKbDVWYnBXdXNKZTBvWnU3UWVoNDJsYitQTnZJY3lZ?=
 =?utf-8?B?a01YQ1ZwM3JuRytGWGU5OHhQTjNXMDVRWDhyb2FxeE1FWE5uMHd3dnYyUTJu?=
 =?utf-8?B?TmlNYmdzVTkzM3hVeUFrTTUzSjVGaEJ3dHJtZWZOa084emwyanlBbit5UEwy?=
 =?utf-8?B?SHBDTHpZL2N4TExLVVdpVTRMWlZxWk9yb2dTQ3g3ZTZuRWVqblZRWlNJRUd4?=
 =?utf-8?B?RkdPVVEzQWlSWjB1eGdobENJSmIwQnZxZmxwbzk1azBabmIrZjdtYnR2Tzhn?=
 =?utf-8?B?VkZLU0M1Y0lteVpCNXZuTFlCcVl4K3lscndZZFBuMzVuelFiMFZMdnd2TTVX?=
 =?utf-8?B?emIwTGR3VnlKTE9EdkNFVit6SG1ZdVV0M2VvSkxLd1B6MTllQ0lsek5Mbll0?=
 =?utf-8?Q?z+3R1mQ5xU2qSBaxyeq0pRZoZ5I13x7ovufa07Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB7060.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c04xMjkrS0hOcFpXNHl4UVFwWjg5VTBLZm9ISml3eTdPUU5kaG5VQldJVWQy?=
 =?utf-8?B?V2VSN2FDYlhRYjJTUmtHLzY3cGNNcml0VDYxMVZpVHNNcEtZMngrY0Fmd3pT?=
 =?utf-8?B?OU8vWFBjanZkRjdJVCtvVHBhVGI4VHdLRFhUWURWU3dQdFVTdHpxclJ5ZHor?=
 =?utf-8?B?MXdidUxXVWRUMUl2c01YdEJJZUZpM3NUV2ZJZWQ0MVBpTk14Z2Z3a0JkMXl0?=
 =?utf-8?B?OGc4aU05L0J4MFJkdmQxTWNqbkZ6MlNJWWdjRXVTOVkwZWZ0d1YwbW9HaGR0?=
 =?utf-8?B?ckZLRW4yMlZ3a0RuVXpNYkpEclRLZjczbnB4N1lrVDA0U0V6aUVXYW5vYmhZ?=
 =?utf-8?B?dWFSY3hGQ0hkcm00REpxSDI2MkVkK2VnM2pYeE5zN01jcTc4NFFjUTkyeUIy?=
 =?utf-8?B?cW5TWDNUVERXY1JaNnVNUUx0ak1lRE5MUEdhd2ozakZBM3RPUHFWajF6VXZZ?=
 =?utf-8?B?YTlseno1SnVoWGRESGRBNHFnanl5UWJwNlJjSnU5blM1SWF5RHdMSnEzNHN3?=
 =?utf-8?B?MWFDekVjZldDWlNNQnZyU3M0QzlqS3Z4NTZiOWxjTFd5bFVMV0RUWjc5VDI1?=
 =?utf-8?B?U08rU0tjUnNXWWg3czlOTkgvRUk1b1pjUE52SFdvWE94SndZWjhjc2J5d0VG?=
 =?utf-8?B?Y0xSQ3gwa1hvNStCcUpOd2NJTUVLZndCRXZ5bzJnQjBGWU1QL2JQcHBBVGtu?=
 =?utf-8?B?bGFPeEtnekRGMW41S1V1WXFRak1Jc1FFb2RnRUpDUzZ5WmJlR24xWXo2QVFa?=
 =?utf-8?B?dGtEdmRpcTQ3d1hxU2lsQVUybEZleXlGSkgzZzk4TnB4ekxIVGxLN2lKK1E2?=
 =?utf-8?B?R0lKNTN0WHRGUk5SYW1QdmltUnJrT0VNaCtaWFh3WHVPdUQweEZqekwxQlZB?=
 =?utf-8?B?Ukx2aUpYeTg1VjFWYTY2TlQyT0lmQWVGV1hSVmVGRGFSL285VElPZ0djVThy?=
 =?utf-8?B?ZHFpdit5bEx6clozUnFiOTJIVWhGa0NWZ3cwbk42OEtsakJrRDFJNW5ocFR0?=
 =?utf-8?B?SjBrbG9ncUpNenpIWlNGQjl0bjVtZURtWHQvZHlFN0ZXVUFaQ0NGcFZPYXo3?=
 =?utf-8?B?SG1QRVRxMnF2Ny9Yb0NxUUpvbzRsT0FXYm45OXNxUEVGeG55KzJCR0tOYzJK?=
 =?utf-8?B?LzJZOGV2MXVmMGZvM0lyeFZFSEJ3ZEFRTEM3SjVJQmpQNFhpb2RMMU1OZjdF?=
 =?utf-8?B?WGVwd3pPM1RGd2x0ekJ1aFVxU2RyN2VQU0M3U0pZYzRBMVhCTGxERU1VTWhv?=
 =?utf-8?B?OG1BN3g5QTRKRzVRMFpKT2dMZkV6bDlLYmtlMXZONFNOQVdBVHFZZXhPcXl5?=
 =?utf-8?B?RENxcm5hNUtJOFhqQS9SVE9TVm4vTDRsWFVrczFsVGdEVVJVNFhrQi9Gb1p6?=
 =?utf-8?B?OVBWc2JmbDcxU0NPQzNSb3VNUEF5QldPS3hkY3dmVU00R0hDVjhSQUdjb1cy?=
 =?utf-8?B?NWkram5oSkdRVlFZeE95dFQvTzRBYU02VVBYTnRLNExMNUs5c3RmRlJ2MGZo?=
 =?utf-8?B?K0cwcmV2K0g1UVcxczNLU0Y0R2gxbzlvOWQvbUFlZEh6MzlUb2Mybm5KN01u?=
 =?utf-8?B?S0pFWnZjWWFyWS9VTUNONUk3MThKODhMWnZ3NG9BQ3FJWk5wK2ljcm16VHI3?=
 =?utf-8?B?S3hlUlNBRjJBY1FBdC9ZcDVQM2UxME5VWTlDb3RVL1FHWkYzRDlCU0tNRW0y?=
 =?utf-8?B?Y2t4TVE5TmdsWHBka2hkeXBQclY5NUZuRWUzNE11LzZzVEVIVHZoNWsyQ3Uy?=
 =?utf-8?B?aGZtK0dzNGYvYkJ3VWh4b2tqY2JFSlR5dTNWbCtUS0piRUptQTd1OVZnNWhU?=
 =?utf-8?B?SXRaSzlQaEtjUk0zeWhZd1Z5WDFMVkVKT0hUb3Ird0cxeENuMU54Z2dIUVRS?=
 =?utf-8?B?RXdYZjVET2xmYWtkZG5vRndtZ2Q4RS84OS8xNTdmNnNlR0V5Y0hMeXRPQ1h5?=
 =?utf-8?B?Qnp3d1E3Q0JkTElzZWFFUnJDZkZ4NDc2S3B6RVIxbXEyY0xuZ09CQlpNS3NB?=
 =?utf-8?B?U3Z6ZE5NRmlFeWdyNUc3bzVxNXFGV3R4Uld4Qm1nYXhUK3phaDZqeTI3cnZX?=
 =?utf-8?B?NWZXM1lGdVVhK3ZGYm5QcWlvYmtseWx6VGsxeFk0Mnc5Tzg5d2F5Zk51Uk5L?=
 =?utf-8?B?RDRtOUZSaEkyQVh5SlI3Y2t2MXNwZ0w2RFRxYi9sSEtnb0tkWDVXSmxoem95?=
 =?utf-8?B?dHc9PQ==?=
X-OriginatorOrg: jaguarmicro.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdfa1dc-073e-4fdd-45ad-08dcfe347af0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7060.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 07:27:33.5443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 1e45a5c2-d3e1-46b3-a0e6-c5ebf6d8ba7b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXKrYZEcu/SJvZaA2RWhjAnDsMfD55AuiGc7d4lnFtte6eVrORCOOU0BD73/WDCsk7Y2uGKwe4MtO3jdcE9+DXkprDCJXbkFCXEVYQtdjSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5082

On 2024/11/6 4:30, Andi Shyti wrote:
> External Mail: This email originated from OUTSIDE of the organization!
> Do not click links, open attachments or provide ANY information unless you recognize the sender and know the content is safe.
> 
> 
> Hi Liu,
> 
> On Fri, Nov 01, 2024 at 06:18:36PM +0800, Liu Peibao wrote:
>> On 2024/11/1 16:44, Andy Shevchenko wrote:
>>> External Mail: This email originated from OUTSIDE of the organization!
>>> Do not click links, open attachments or provide ANY information unless you recognize the sender and know the content is safe.
>>>
>>> On Fri, Nov 01, 2024 at 04:12:43PM +0800, Liu Peibao wrote:
>>>> When Tx FIFO empty and last command with no STOP bit set, the master
>>>> holds SCL low. If I2C_DYNAMIC_TAR_UPDATE is not set, BIT(13) MST_ON_HOLD
>>>> of IC_RAW_INTR_STAT is not Enabled, causing the __i2c_dw_disable()
>>>> timeout. This is quiet similar as commit 2409205acd3c ("i2c: designware:
>>>> fix __i2c_dw_disable() in case master is holding SCL low") mentioned.
>>>> Check BIT(7) MST_HOLD_TX_FIFO_EMPTY in IC_STATUS also which is available
>>>> when IC_STAT_FOR_CLK_STRETCH is set.
>>>
>>> Who are those people? Why Angus Chen is not a committer of the change?
>>> Please, consult with the Submitting Patches documentation to clarify on these
>>> tags.
>>>
>>
>> We have discussed and analyzed this issue together. I developed this patch.
>> This patch was also reviewed by Angus Chen and Xiaowu Ding.
> 
> The tag list follows a specific order: tags are sorted
> sequentially, with the last Signed-off-by (SoB) being the person
> sending the patch, which is your email.
> 
> The other SoBs are fine, but if someone contributed to
> development, consider using "Co-developed-by" instead.
> 
> If someone tested the patch, use "Tested-by"; if they reviewed
> it, use "Reviewed-by"; and if they simply agreed with the
> change, use "Acked-by."
> 
> Please ensure that "Reviewed-by," "Tested-by," or "Acked-by"
> tags are visible in the mailing list. I do not typically accept
> offline R-b, T-b, or A-b.
> 
> This is why Andy asked about those contributors. Three SoBs can
> seem unusual, but it's acceptable if justified. Reviewers may
> ask for clarification, and it's fine to specify contributors'
> roles. You can also provide extra details after the "---"
> delimiter.
>

I think this tag list should be much better than the original. ^-^

Fixes: 2409205acd3c ("i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low")
Co-developed-by: xiaowu.ding <xiaowu.ding@jaguarmicro.com>
Signed-off-by: xiaowu.ding <xiaowu.ding@jaguarmicro.com>
Co-developed-by: Angus Chen <angus.chen@jaguarmicro.com>
Signed-off-by: Angus Chen <angus.chen@jaguarmicro.com>
Signed-off-by: Liu Peibao <loven.liu@jaguarmicro.com>

>> And in this case, should I replace the "SoBs" with "Reviewed-by"?
>>
>>> Also, sounds to me that Fixes tag is needed.
>>>
>>
>> How about this tag:
>> Fixes: 2409205acd3c ("i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low")
> 
> Sounds reasonable.
> 
> For accepting this patch I need an ack from either Andy, Jarkko
> or Mika.
> 
> As long as the fixes are limited to the commit message there is
> no need to resend the patch.
> 
> Thanks,
> Andi

Got it!

BR,
Peibao

