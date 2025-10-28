Return-Path: <linux-i2c+bounces-13843-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEBAC13014
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 06:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 091204E63D5
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 05:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9E128751F;
	Tue, 28 Oct 2025 05:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gkbUD+07"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011047.outbound.protection.outlook.com [40.107.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEBA2AD3D;
	Tue, 28 Oct 2025 05:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761630326; cv=fail; b=aTFDQwGKw5dmzwqY489yeUyQAsAZ8oZPJ7kBVy38rAYqbkFrLzURfjHVgMKu+LJqIYuiZfAFbN5MbwMT7mg6EDXo1iPQ2VcQurnqLq7XOcurWkgVR8kk9oAPwxsr0Y6XK7zsYJoID92y/tgE3p1zIIuumGcEGpq/v4O9hzBcbDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761630326; c=relaxed/simple;
	bh=bjkd5lis+FQSuSFsh2y7jWdEmdIJOXjflTx0MDY7kQ4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cicS8PxBw1xPWH37+TybFz/9SXlmqNQ47l7sgfX3LsbbqVAifVEYBbPLTA2zRM9ApvTv+4QAgMu9Qiru03MwhSQdBUvgj39mfpeVFtLY1V0mvt+jVoAKqKRR4yACCk+A4BvasRudfiRkH+QJKUKaWV053ARqseJrqNLvoV4F3QY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gkbUD+07; arc=fail smtp.client-ip=40.107.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kO1tOS9qy5z3bmUxv3NA1Csa7PV0or4Hlv4iz8e5F21PBMRKDgQ3stTrjzq1t7qPJjoWSyIhF7yuee5jTqOKCb3glaqZZliiYlyA5F34jADv8xQQYAxHTrXP/jZaczfOfIckLaWh7lqR3ySdlm43RoD2BTkdjguo4MAdL+SDdy5P+4BgnR6vjew3gi/+WgsPi+vVgZ2GFRNDXHdlFDcjqX3Ak5ytEvVRooK702Ck5hZ5tJhWqqpF6Ay2OImOKzcxZTj/Afzg1SMQ2h8NflanpNMnaNVarJQfqFDKM1k5ABLKS/13n1Q+vRGNCezDLuIc6q435atuQiyLsMurRo3XIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKkxppwN1UUCRM3QS33KrwfNBl9fztU1LUOgm5QFjIY=;
 b=X8SWb+2Uqbq+xdpIWDQld+/eKsew2qzw1AvUnBNbh2U874bnsfZn4hnzPMxocGOgMK/v6QdiaW2Re/ur3SCjk/PMjrR51cN6Iyom8gJA1owYqhFO5RfO+261aqNhs3C2+JwpWs36SUSgF/L0sasTFvBBJwnYc7RVBqmKMp7fXGPvfBUgcDvYcdU53qlay7RrwcBzbCCTJVcPlIWEiwkBHsmKX7xK8MOnbPCKIF9955yXUMwqqp5edBm9ye10M+ZAjh7ytuUR+5mnn/QV7AbX5LYqu6nWg+So0//tDedr4OZE8oUjb+LPIG+5tyTK2Xd9I2ypPc1TEWYkr20ZaFtqaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKkxppwN1UUCRM3QS33KrwfNBl9fztU1LUOgm5QFjIY=;
 b=gkbUD+07mH80ZYXbHt/5Zc0f79mG9Qos6UbeqBL7OWzc1zjx5KisAy4IRxKr8DIiQ3KMBDU4l1KKrQC1HoWi/mZkOYjl49OY2agaKcIWM/ov8wYf54Kj443s0VpGC1JklnAZmOH4ummCZEtFIwB+bqJYVNUhpBX2/C1Oq+PPDLiFlE+JUDHBkKrH0NINZz0CCCxUjRsRY5EY1iIl+MkXBZ6HqquCGrrGjZZ94VkKJqBuUt/ftbOMMGoHKga1ivXMo5a89vd2PrW0Oq5nOeegjqSINO56wGlM9At/yaPWILxUveqjl6ulDCm+u1rYgefTNOi08vWJBfOnXcRIVGtPUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by SA3PR12MB9228.namprd12.prod.outlook.com (2603:10b6:806:39c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 05:45:21 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 05:45:21 +0000
Message-ID: <0a32fc1d-c6cb-4090-9ef3-777affe18b87@nvidia.com>
Date: Tue, 28 Oct 2025 11:14:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: tegra: Add support for Tegra410
To: Jon Hunter <jonathanh@nvidia.com>, akhilrajeev@nvidia.com,
 andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, ldewangan@nvidia.com,
 digetx@gmail.com, smangipudi@nvidia.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251001153648.667036-1-kkartik@nvidia.com>
 <20251001153648.667036-3-kkartik@nvidia.com>
 <32cd495d-105d-4026-8fe2-8187bd345b8a@nvidia.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <32cd495d-105d-4026-8fe2-8187bd345b8a@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0111.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2ad::8) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|SA3PR12MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: c0cedb25-97cc-43a3-4007-08de15e52f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anlTVUE2eWhKY0RobG1IaXBTRCtuN0ticGZCVm5pdy8xY3FEbVlISXJBNDZh?=
 =?utf-8?B?VVZhOEJWL0V1SWZUQm15b1hSZTZxWjRkejc0RllodUNFM2d6UXI3TTUwbWdF?=
 =?utf-8?B?QTdyU0E1ZysvbXozcGFVcjhHVFpCbGxkSnNhd1Fsby9UR2x3K1ljbjRJNlhh?=
 =?utf-8?B?Slh2aU40VW5HSHNQRjNvMG5ZbnBFaFBLL1k4UG9PRVpib1g0THhLS3ZMUTJs?=
 =?utf-8?B?WTBlWHFZdjJJUVNFdnhOYTdaQ084WTlxdkllZllVZVV5ODFBRVBrcEo1cngx?=
 =?utf-8?B?TVg1cU80MTdld3k1cnRtQVJIeHZ4U0ZKZkZKMVNWZWpTSGw5dWlaY216dkpT?=
 =?utf-8?B?dVU2a1dFZHhBbjFFOVZPa2JxS2hVN1hham5OTFB4cDRGZkU5V0FTSHNjdEIy?=
 =?utf-8?B?dWJjL1FKTzAxWjJpalRWRnBIMFB6MU4zd2lCdGZWM1ZxMWk1MjhyeDNrUlRT?=
 =?utf-8?B?WnZUOEZGb0dkUGxuQ2grSGNmTjNCbWZWOGhFRkxYRTYwNEpacnB3MlMvMFFw?=
 =?utf-8?B?dUl3RjErNG5Dek5LRGZCc3pwbEpHWk5sNVpYR3ZOM29tN01mWHhsckI5eE5u?=
 =?utf-8?B?V2xGYzVPQlFLQlBwRnJaL1dQSGhXMVlYWit2WHdaN1NXdU56UE95amJLbk9R?=
 =?utf-8?B?VUNkYVJFM3BFWGlWR3Zmc0tzbGxwZ3ExOVlMWlpSWHh6aWYzdHBXNVQxQXZa?=
 =?utf-8?B?U2U4dXNoS3I3OEVpemp2aDVVRllBMHFRa3RQY2l4SEcySnBDUWRTdm91Z2lG?=
 =?utf-8?B?REhmMkxGYkg0VmRNek9rSHhVbDNSZzRreEZKVWc1ZlJNTUhLR3Bnc3RVU2Nz?=
 =?utf-8?B?OSt5M3Rrb2dTVmVDcStBMFh6Tjk4ZU93SzF6dm1YYUhGUlRmby8rNHdPUUJw?=
 =?utf-8?B?SUNRVFdueXd3Z0MvYXFZRGlUanFRbzFJNk1PQzk1U3EzYkhRVHNpSXplMm5r?=
 =?utf-8?B?RS9KdmtwRUxVVDl0d0hBckNvbzB0WnJoMW4vSG5CdUpQMzc1RCtYOTQ1WGRC?=
 =?utf-8?B?dkNGZFNoQm9oODRBcWR5di9IQ1VMTVZMbkwrdXFmRzM4elh4M1VIOGZqeUlF?=
 =?utf-8?B?dHJlSCtzclp5ZTRiaTJRc3BrN1JSRENabS8wMUpCZCsvNVoxb3dyZzdyRjUv?=
 =?utf-8?B?VTJvZldhdzZlay9Gbm8xbXNBbWlmandnOXpIelZOREhsNEgwUDVLYTlMNmxN?=
 =?utf-8?B?WWo3T3lLWnk2cjUzM1hjV1ZhaDRsUlZET0dWWk5QM1NjOHRmOHNXZWg4TVN3?=
 =?utf-8?B?eFZ3OGdSZFZFSlBobnMrcDI4QjlxYUg3bGI3WXVFMGduOU5DQlhudEJJL0J0?=
 =?utf-8?B?ZytSZmZzUFZmTXd3bmRRbzlOOVAwemVMbEgrS3ZaVUdyU2REVWlvR1czMXd5?=
 =?utf-8?B?WUJpM0tJclBKQ2lyL0RBcjB5L1Ria01GYlRSRlVVT0RkS2wrV3F2QVE0cnNq?=
 =?utf-8?B?M0xCN2ZrMEQ3UjNIbjl6OUVvNXJ4NjdlYi9aUm93SkJoaUJxUDdSOTJCOTh4?=
 =?utf-8?B?MGFPK2lrVGtET2NScVJjQ3VFK09NeHFCK1NqeGJ5Q0Job20vWU9pS0ptclE5?=
 =?utf-8?B?Z3pockVLNnl6OWRVY2p4bWswdWo0a05XclZJUGllb2M2NVhDOWxkcmpJV04y?=
 =?utf-8?B?NGJ4Z1B6TFZDdU5tN2RUaW0zUjNzNFF1OUpPR0EydjVrNHc2UlZWSEZWM1hu?=
 =?utf-8?B?eXhjb1BkZ3IrbWpqV3UxWkhobDdxTnJEY1ZLRlpBek9XL25id3FYV1pTa3hV?=
 =?utf-8?B?aWlialFQK2VjOStTd25EcHg5TFVuQ20rTGo3cnA0YVdPMUNwQndNWGZZcGJS?=
 =?utf-8?B?T3RrUGVFZWRETjVmem56U25yWmgwWlAveElSNWVsV1RaeU1nMjRJRkppMjZT?=
 =?utf-8?B?QWxNNVYrMnVwR0FWNVBGWDJEM3MrVTdYR1VEZ1pMWE02UVVqNFRvNENPV2NE?=
 =?utf-8?B?alJPRWp2RFNkUmJxSGdscHJTV1JFVEh2SEJCaXpNcitwRnRSSTVHZVVleGtl?=
 =?utf-8?Q?/TJOe4ZtAx6ZWodhiurdgBzxVEwPCo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUsyK0IrVjVuSWNtUmc2UmtpZ3hBQ29HTG5MS0pKWnlYNXl1WGd2NGxTVi9J?=
 =?utf-8?B?MlVVVmRJSDgzY1pleEFidG53SlhKdzJlZ09mclhGZDBwTi9hUkVtQk5PTzBS?=
 =?utf-8?B?ZzNkMHBiWk5sSlJaTlZIUEJoTlhINGZmOW82M2ZNenJNZWV4MzExYktJVWc2?=
 =?utf-8?B?WEF2QU82L0VzYzJ0TkxhMlVLME9uV1U4ZzVLZ0dubDRDM3k5Tno1aXhNWFdu?=
 =?utf-8?B?Q3AvN3VhQlpvY1hGd3pUZ1JKU2JES2I3QWR0RnVOS3B0TEVGVDhaQkhzS0dm?=
 =?utf-8?B?YUhTWGVUY3JNUHNkSWFzUDFVa1JySEFXa3hybFAyNkdqRVB0VGZJRzdVUzEy?=
 =?utf-8?B?VlVDZ3h3OEhaYVVVUEhhKzB5c2dPZWJLQlFTNFQ2U0srV2Q4YVYydEVic05G?=
 =?utf-8?B?UU5Ib2ZWRWRlVGtFUlZrWUJybDErbVZTSE8xdVB4Q0lmQVNYYTk0YWNCbUZt?=
 =?utf-8?B?RDBCa3VHUDBveGREVFhkNGRvZGM4NmxpVUYyVk5ROFVtTWd4bnUzS1Mvbndq?=
 =?utf-8?B?WjFlbkF2c2p5Tmdab09zekpoUUE2UWVvSFNwVVpidkRSZDA5VW5LZDlweGo1?=
 =?utf-8?B?RlQvWDdwUUlQWVhwbzB6UmJkQ3AyaVdHbHpSSG0zYmlPOStFbjhIdXVzVnYr?=
 =?utf-8?B?RXFRRllWNlNLbHhIaEF0VDR6cDlrbmNpbFRGVmVsZ2UwYnQ5ajRzWFJWaDFO?=
 =?utf-8?B?TFRUeW5kOS9VNUs0TVhYZ2JzQkhIS0tFZjQ4L1VuZUljak9sZ1dVZk0yQW85?=
 =?utf-8?B?ZWs3RlJjSW9aSnFCZm93S20zT09KOFhiYzlDL3d5Qk9tTnNFQURCRUsvQTRp?=
 =?utf-8?B?Z21GSEVlaTgvZmZOUTJ6K2VlMzk1MkliUHB1WGdWTWFNcEdLSVg5Y1pQVmta?=
 =?utf-8?B?UUFoQVNQaERJZERvKzBDNGZyUkVWbnVCdGIwWWUybXA3anJrWXkzbDE5SEY2?=
 =?utf-8?B?WHVuUlMzZHBrY2ZkN1NMV0YxN2xrYmFqSHFkWWcyOGpQUzVoTThMWVZ3eG1W?=
 =?utf-8?B?SGNTbWlOdjBFQzI4MkN5c0RvbFVwYUgzcjVDblNJNHJuTnovN1ZuV3d3NzUy?=
 =?utf-8?B?SS9JL0pSOGdFS09KOXFnMm5NMXN2NGE2SjIvdUorQUxzYzRHL0tZa3lQcnZC?=
 =?utf-8?B?NlY3YVdCa3drTVBnNG9RSmM4QWhTbUpOMW1QR29PR3NFQ0M4NmdhNkhrV2Fk?=
 =?utf-8?B?OTkvOGZwbmtnNytnbTBHcHhaS21OdGJENUp0ZEgvdFdDZ0JwR3dYVk9sd1d4?=
 =?utf-8?B?aU9JUUVTdm1FSFFtc0Z5TWRXdTNIQTdjelBMUSs1Q3pDaVVZUndlOHZKU3Jt?=
 =?utf-8?B?UUZQNDl3UWZTZFgwaUZlWGhnUVpGclJOYUZMWm95ZURSR3MwSGdRanFwVHZT?=
 =?utf-8?B?VHEwQnBoOWUrRmVVUUw4MGpFRDF3SUI2RTF2cm5yY0M3VTR6Y3JhL3dHd0Nm?=
 =?utf-8?B?aGhHRVlna1ZCOGNNa3hoVFJDL2krbnhKU3JoM1MweTJ3ZWpHWnNGTmNlSHpR?=
 =?utf-8?B?YlFaRDlibnBGaTNUdUMvdU5yL2JVZUk2M0dYSXNEaThIQlBBNW9SdVNidnlH?=
 =?utf-8?B?U0VLZnZIUVJmSFMya0dBUnhTTW5PcU16eGllZXAvbUwzK1NYcEI0RzNGMW1l?=
 =?utf-8?B?Mk5DeDNIRDJ6ZlcrR05vS2VBdHBXT3VEM1hSZEFzRlN3NThUdGttbHF2VUMr?=
 =?utf-8?B?ZGFPZEpyVHRJTnNVOHBEL3o5NDZxc3pZR20zZ1FUUWJRUGhQc01qSDM4YW4z?=
 =?utf-8?B?cWkzaVlKNTVDTkZXcjczUnRuWEtQVWYvakZ1aDVUekVCQ0VlbXNjdUoyMEdH?=
 =?utf-8?B?dXZyTTFFK1dSN3REWnozTUk3QThMb1hDSUIyQ055eFRHRmhHblpMcVlLaUNR?=
 =?utf-8?B?Y0NBRHUrQ1RvTnVwemFxc1p0RytqRWV6Q0FLN2xnS2hHUUhxOU9zR2ZBRDVy?=
 =?utf-8?B?THhrd1RZNms3NkVMS290KzFCNGd5WHRqUzNJQW41dHlGZmViaTZUYnM5Ky8w?=
 =?utf-8?B?WFYzOXBnT2VCa01Ud0J6ek03bWRRQ1oxNEpqUGlBaUdlY0FVN0RNNkV3b2hX?=
 =?utf-8?B?dTRZRHJTcHpGcWFPNkJKZlVCYTZWc0tKUGFmSzlGM0VqM2tKck5qUmxoZTho?=
 =?utf-8?Q?T5Lqdv28G6O2c4twfGPCg0lJR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0cedb25-97cc-43a3-4007-08de15e52f01
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 05:45:21.7060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fzHvSXdreGjKMDLG3+l6YRvow+AnUILcFdnPe+pUkcbAflXUlYXPN10GT4R/vMfHTNry/pCMkSvVtET/o+b0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9228

On 24/10/25 20:47, Jon Hunter wrote:
> 
> 
> On 01/10/2025 16:36, Kartik Rajput wrote:
>> Add support for the Tegra410 SoC, which has 4 I2C controllers. The
>> controllers are feature-equivalent to Tegra264; only the register
>> offsets differ.
>>
>> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 64 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 64 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 1e26d67cbd30..bc9f60b69020 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -262,6 +262,38 @@ static const struct tegra_i2c_regs tegra20_i2c_regs_vi = {
>>       .dvc_status = 0x00c,
>>   };
>> +static const struct tegra_i2c_regs tegra410_i2c_regs = {
>> +    .cnfg = 0x000,
>> +    .status = 0x01c,
>> +    .sl_cnfg = 0x020,
>> +    .sl_addr1 = 0x02c,
>> +    .sl_addr2 = 0x030,
>> +    .tlow_sext = 0x034,
>> +    .tx_fifo = 0x054,
>> +    .rx_fifo = 0x058,
>> +    .packet_transfer_status = 0x05c,
>> +    .fifo_control = 0x060,
>> +    .fifo_status = 0x064,
>> +    .int_mask = 0x068,
>> +    .int_status = 0x06c,
>> +    .clk_divisor = 0x070,
>> +    .bus_clear_cnfg = 0x088,
>> +    .bus_clear_status = 0x08c,
>> +    .config_load = 0x090,
>> +    .clken_override = 0x094,
>> +    .interface_timing_0 = 0x098,
>> +    .interface_timing_1 = 0x09c,
>> +    .hs_interface_timing_0 = 0x0a0,
>> +    .hs_interface_timing_1 = 0x0a4,
>> +    .master_reset_cntrl = 0x0ac,
>> +    .mst_fifo_control = 0x0b8,
>> +    .mst_fifo_status = 0x0bc,
>> +    .sw_mutex = 0x0f0,
>> +    .dvc_ctrl_reg1 = 0x000,
>> +    .dvc_ctrl_reg3 = 0x008,
>> +    .dvc_status = 0x00c,
> 
> We define dvc regs here but ...
> 

Ack, I will remove dvc related regs from here.

>> +};
>> +
>>   /*
>>    * msg_end_type: The bus control which needs to be sent at end of transfer.
>>    * @MSG_END_STOP: Send stop pulse.
>> @@ -2020,6 +2052,37 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
>>       .regs = &tegra20_i2c_regs,
>>   };
>> +static const struct tegra_i2c_hw_feature tegra410_i2c_hw = {
>> +    .has_continue_xfer_support = true,
>> +    .has_per_pkt_xfer_complete_irq = true,
>> +    .clk_divisor_hs_mode = 1,
>> +    .clk_divisor_std_mode = 0x1d,
>> +    .clk_divisor_fast_mode = 0x15,
>> +    .clk_divisor_fast_plus_mode = 0x8,
>> +    .has_config_load_reg = true,
>> +    .has_multi_master_mode = true,
>> +    .has_slcg_override_reg = true,
>> +    .has_mst_fifo = true,
>> +    .quirks = &tegra194_i2c_quirks,
>> +    .supports_bus_clear = true,
>> +    .has_apb_dma = false,
>> +    .tlow_std_mode = 0x8,
>> +    .thigh_std_mode = 0x7,
>> +    .tlow_fast_fastplus_mode = 0x2,
>> +    .thigh_fast_fastplus_mode = 0x2,
>> +    .tlow_hs_mode = 0x4,
>> +    .thigh_hs_mode = 0x2,
>> +    .setup_hold_time_std_mode = 0x08080808,
>> +    .setup_hold_time_fast_fast_plus_mode = 0x02020202,
>> +    .setup_hold_time_hs_mode = 0x090909,
>> +    .has_interface_timing_reg = true,
>> +    .has_hs_mode_support = true,
>> +    .has_mutex = true,
>> +    .is_dvc = false,
> 
> dvc is not supported.
> 
>> +    .is_vi = false,
>> +    .regs = &tegra410_i2c_regs,
>> +};
>> +
>>   static const struct of_device_id tegra_i2c_of_match[] = {
>>       { .compatible = "nvidia,tegra264-i2c", .data = &tegra264_i2c_hw, },
>>       { .compatible = "nvidia,tegra256-i2c", .data = &tegra256_i2c_hw, },
>> @@ -2330,6 +2393,7 @@ static const struct acpi_device_id tegra_i2c_acpi_match[] = {
>>       {.id = "NVDA0101", .driver_data = (kernel_ulong_t)&tegra210_i2c_hw},
>>       {.id = "NVDA0201", .driver_data = (kernel_ulong_t)&tegra186_i2c_hw},
>>       {.id = "NVDA0301", .driver_data = (kernel_ulong_t)&tegra194_i2c_hw},
>> +    {.id = "NVDA2017", .driver_data = (kernel_ulong_t)&tegra410_i2c_hw},
>>       { }
>>   };
>>   MODULE_DEVICE_TABLE(acpi, tegra_i2c_acpi_match);
> 


