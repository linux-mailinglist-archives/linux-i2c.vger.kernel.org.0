Return-Path: <linux-i2c+bounces-14003-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A24FFC3C41E
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 17:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A0855666FA
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 16:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E1334BA54;
	Thu,  6 Nov 2025 16:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bE5x1EGj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010042.outbound.protection.outlook.com [52.101.56.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C5534B404;
	Thu,  6 Nov 2025 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762444968; cv=fail; b=Sq/EI1eSzi5VPWNHTUGHXZWDAfIzAcrhoWQVKLI/LybGxS/tA5oVzpTaJWsk9lfMQZaDR9GxGQryKbNyRUVazUkSKlREOMaR7ERRxI77euN+v05yxZUggb/uwd77Syg5H2Wpva23fRUorBM3KFPRI1fH60w8RoPHC4bgAeSJk+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762444968; c=relaxed/simple;
	bh=te8Xh7W50aD96rCdvMAmYGiO+FzuhBr4Vb9SoQmoDTo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BTlmE62SVc910n73HBvUyiCMDahXkYjJGb7CJ0r921qNHH9Z6hcd5y6/+oe4TrU+UrKIcX2Rc7lIRBGopOgiaYr9p98063Srphca79bN8u8HdQz2q4DPkYySpa8EE+nRflKl5Ycfryd9VzWPikQSUPtGGSWWnWkCNViFYijvOAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bE5x1EGj; arc=fail smtp.client-ip=52.101.56.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbxosVxJEGbMst4D+wxHbxEQPArgiMj66vFFb3EPR4tXiLZ8IpqFjiIuaeATyD7lbMGgfKSYNhIc9H0ufT/UdTyyQJ6yjdh69dIU409s627XuI/+Ax//U8TY+NQnRp83y4CdqCJXCBgKUDs/s4ZWlD6x5gOlQR8yW7wKpk8YlQBeHYyxvIrF9tv6u6ce0tx/uZL7aR55o2qLrB91+lM0J/olo3zDz+BZs8meF9tjW0/klQJ648q8JlcUzQNEypAxRy50p4mQlww/e2bvmOPphCcf267oUAoF5cclqxBxNBjHJnyZXOHU4rReWCrDxsIHK0mjU7Z1if+SIzqjCg1xrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXWjvpwJhePzlTbFlqERBrj6uCUetIG51YRAlZw9VDE=;
 b=p97MbKsIJ4LuQOhkpgLMukFtJsD4XRhNPj/Eagtg2CpH1H/ZD5+bg48AF75LAKsk0c4naUCQoNk1qNrmVsWyeX/DfNnP/0CAVuTPF+A30EZ+C1h/nQ237uWefiJaWZVWeU+20u8Qd2QuH2ZWpXDCdkTO9T2LLEU3HcjgU1l2nFUFOlpK79i+Ur50wrslGYFwoGA4Bkk3Z/8Vv6/Wio1n/6aR62Nq3StlroOYUwgcQUJf6jaVupefr3Z+MCfsRea71Z11IdL3jySwnpB1B1Y4OgWnZq8hwzGqFhVUgKcDHnG0OyF1h0VSquTchs68HVru3+eAUHg/OP28ESOAV/xybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXWjvpwJhePzlTbFlqERBrj6uCUetIG51YRAlZw9VDE=;
 b=bE5x1EGjgcrJ73H2dKWZAOwsCGPOYe9xBllfzr616bLFPAPWkP6DS8KTKtPjrQdu4MOQFXQyCzPVebXyUVybE3To7p8Nn6YXOOzuEZqAK95mSaoFTCWvnkYsgEhexY4JFlv4ZyARfixZCGV/0gQLp/gWjWhIT5fIUfCo1dDSw8OMaA6YeMdFU/aC7Gq6FeGjUn1jFxYUELpMV/19GoKn2YDRq8Xc9WXuwGnuzmPquGzo+ehhmWTlDGVflUQnaiJlusp7vjiQT2+Y0N47HKUNmQCC2Nv7WjMWXXaKJqZ/LOlz9n50zNkgicAv3tqyqYkYyRQHs8JsXGwe3dwRuFKYZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 16:02:42 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 16:02:42 +0000
Message-ID: <17d683d1-c306-4860-acc2-9c09bbce0d55@nvidia.com>
Date: Thu, 6 Nov 2025 16:02:36 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] i2c: tegra: Add HS mode support
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 digetx@gmail.com, kkartik@nvidia.com, krzk+dt@kernel.org,
 ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, robh@kernel.org,
 thierry.reding@gmail.com
References: <84f7f5d4-bb6a-4e2a-9579-0d957b692de2@nvidia.com>
 <20251106061733.36157-1-akhilrajeev@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251106061733.36157-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::10) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|LV8PR12MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: ee3113f5-e521-4bdf-155a-08de1d4deab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blk2UVR3ZHczM2x6K24yckp1bDdKQUk4Q1AyejBnVUxuOXFQNnlGeHVDVk42?=
 =?utf-8?B?dGo4WXhuQVVvMUw1QzZJYXprd2hkWkducXp3LzZMSCt0bjg2bEZwMklaNEJ6?=
 =?utf-8?B?cTd1Qk44cFpEL1NrRzVkMmRqUWwwdTduV1FYaml1TzZUZXNXMllDeFlVR05K?=
 =?utf-8?B?dXZDbjRyMlBGSkY1aU9NbWdldWNKTk95L0ZSY3BEaGFBTzIrNkMrSFF6bmRR?=
 =?utf-8?B?djVoUCt4M3VXQWlVWEZJQmpxNmlGdEE3RmtOdWZ4OTZ1Zkx1T010YTRKQ3Nw?=
 =?utf-8?B?L0hQenczT1lCYkNmUXk0TmIxOFV3K3FWTW9sSkZpbGxhamtUR3NGdmdnNm9Z?=
 =?utf-8?B?U2YxdCtpbFI4ZFRsMUIzalQrSW02d0pYSnBlSHJ2UDB6QXc2Q3FDeGdtUWdk?=
 =?utf-8?B?UklTTFRqQTNJYlEzVWdVRWhXQWdrcUxBRGRLSWtKdG4ySnlxM2Z0QzlRa1BV?=
 =?utf-8?B?LytwcDZlemNhd3h3b3kzTjd6K0htN28xR0Z5azJBRE5BeXdKb09KdEJ1Rkp5?=
 =?utf-8?B?bENvZGx1NjlkZDRzNnV5SlVmM0pBYnQySmN3M3daalZYUEdNTTJ2STlvd3RZ?=
 =?utf-8?B?cWphb3p3TnF5T0l6VmRTZVhnK1BUVGJYa0h2blFNdi8yNzlwTGp5aVQvNFhz?=
 =?utf-8?B?NWI3N3JGVERhWTBBT2dhNWdZWHk0YkpwTHQ1VFV5Q2ZJSDVsbXJLK1FJdjND?=
 =?utf-8?B?VnR4UmM3VHU1MXJBNnR5UlUzUk5xaXpFRnI2UnZLM3ArbWVUUzl3R3VsUSto?=
 =?utf-8?B?TFppTlZpeXlFT3QwN1Z0UlBBa3IwcStWQmZvZkg2RDBFMS9FcVBLNm1XT2dn?=
 =?utf-8?B?SXlieGZQM1AweStGNWwzNFVpNjZuVTBCOWxFQzhVbkZGWEdqQmJhLzI2cDlS?=
 =?utf-8?B?S2hkQWV5b0M0V0pJQmNob2ZucWpQV21tMUN0Y211eWpNRXRBQmI4dGpBbjRE?=
 =?utf-8?B?TE9xRTdrWGdzdnlWZks5VGVCSmVDSnZqTTlPd09mcG1jc3BTcjRmU3ZRYlFD?=
 =?utf-8?B?SWhCVFRjb2VHWHM3Q2EzVW9sQmxab0dXckNONUtudUhjVExPRTVLaC9YOXAr?=
 =?utf-8?B?WWlqUUFzZ1Q1a2RqamR3VFFRWUxzTVVaaWEzSEl2K0RsNWdPZUM3d0Q5aWFw?=
 =?utf-8?B?VGRLdTREOXRWUk9MQlBEVHZ0eXkycnQ0aEdyT05MdkVZUjcxb1Ywa3pKUDFF?=
 =?utf-8?B?a1hnNzl4QTJSc3k4QWl6ZDU0a0VLazJkdmI1ckdwT2dzR3RYZG0xVFRnZlp2?=
 =?utf-8?B?YzE4eWZoK2tQbEZFRmlBTDVNVlFpeHRjcE54TjQrNkpCMTlOalFrR0d2OGxM?=
 =?utf-8?B?OGRBUVowbHJwM0tUTy80WmJtUnBVSjNRalh3N1J6Ukx5Ylh4bTlqckZCc2hh?=
 =?utf-8?B?ZENXVEVvaWlJdTFKUjg4Y25YTzZ4d3FNVWxJVDNaRGxOVVZ5M0tDRXg2SnMx?=
 =?utf-8?B?UmU5QkFXYTVFNkdlNVM3RGREYkU2NGs1R0hUYitUVktoNzdsRUtibU43Q3Vt?=
 =?utf-8?B?MWZ4Ui9XeitmczhXTWJtbkpXMG16ZXlGWTArdkc5TWxmTDJmSXVQd0QrejVH?=
 =?utf-8?B?M3MrYVBISENETllnYlkxaXQ1VDUwR1dUV0E3RHdjM3A1amNMT1dGWWFUQ1lG?=
 =?utf-8?B?UDBRUHlCZzFJNU9NMVlGQURSVWFKK2p3V2R2a1RIT0dGRXhlY0NYZEQyRm9H?=
 =?utf-8?B?c0dDQTZDRVVRdjBhOUozMW5HUlFlTDdCNmQwOWp4bzJEaEI2Ni9DZThiOENp?=
 =?utf-8?B?NDAxa25FTWdrN04zK1BWV2kxamx6Z0ZGcnFBb1BDeWcvYjM5M0lqNCt4dXVv?=
 =?utf-8?B?eTNtWUlMTUNnQnZCNUJrY29qSG9KMTlRdnBlTCtMVlZIYzlrUHppSWM0TG5w?=
 =?utf-8?B?YUVaM1oyeS9jTkdMMS82VitZc3dRaDIrZW00SGkwVXliQnh3WHBPbCtmSzBk?=
 =?utf-8?Q?Ej4zp3ZCO2IzUB0GARLSFHzUu9evlbKQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVFsQytMN1F4aGFCSVdCckNjeDh6ZkkyWlcrb0pOYVNpaFhqemZxVWlFVmg1?=
 =?utf-8?B?cDV3L3crM0crOHRsTUtZWHI4OHpnam5aS3lUa0FQOU9kU2NWWmZBYVozMkh2?=
 =?utf-8?B?L3NEdkFEQ0hud0NlSTJNWGZkc0N6ckJ4RHUzQ0RMV3FFUkZwWjFJYXFYNVVY?=
 =?utf-8?B?L0JuT3ZJak9Kb2FqOTNvUmMxV1ZPeUZWMlM3L2RhY2VPc0VWaXlIQ0J5YnlP?=
 =?utf-8?B?SnNFVGw5aklsc0YvdW5zZzVRcGpXUEdqSXZCdXM1VjRNRk9TRjlIQmMxNFNa?=
 =?utf-8?B?NXIzTUZBMVJ4Qnk3MU52bG00eUNoK214WDVqMSthTnp2alJTMy9RVURPaURE?=
 =?utf-8?B?SGh1cE1BYUdZUjVsQVFIZmU4MnlnVEtXK2hXdHRZdlVXLzhjUm0xUWFwUUU4?=
 =?utf-8?B?NEVnWUVLYnNGWjBXVi9Pb0FSekxsN0hJanhrdy9kc29WWTF5cFVyNE52bFY4?=
 =?utf-8?B?OXdkR0grSVYrNks4K3BlK04wcExpRnNvR2tXVVpqQlZzRHJ1ckVtakNkaWlR?=
 =?utf-8?B?eVBDTVZwZ2VYeHV3MjBUOGdDYms1K1ZVNEFYN0VrUFAvWHBERXhjb3RaY25Y?=
 =?utf-8?B?TFBUSXhMVU85L3BoLys3Q1ZBd0pxakoxanNUSHJkRFV6OHlUQTJyNDREam9v?=
 =?utf-8?B?WVUxLzRpcEZzalVNaHpWOGhValhSNFhIWlp6T24wLzNTQnQ4aGVBbmIxOWhL?=
 =?utf-8?B?enZuZ0daem5PUTdtMkxBWGNaSGV3d0JNbStMcXBHelVxa0t2eC9UNjVWSHRu?=
 =?utf-8?B?Sk43b1NlQk9jNmVLSU5VOWRyazBKSldSSVRaVmxVZ3ljVTJKcGpCZ3laSkFk?=
 =?utf-8?B?bm5lMzJyd090WVI3Yis4ckUvMW5yaTVJT1NwK2ZONzJLY3lpVGtka1o4ODFC?=
 =?utf-8?B?ay9tTkFWL0tYNFVZaWJkQysxcW1OWk5SaXQrU1lscElzbUJDRVhPSkNnZ3Nq?=
 =?utf-8?B?VnNWZlViclFEOUVUR1JyUVBTUXg4dDl0VVh0QnRFV1FYYkYzYXZRbTkvRVlT?=
 =?utf-8?B?b1kvOVBNWmNGMk9xZXJTa2pObldabTM0eDcvT2daSTRscmJaNEdoNWtTR0hs?=
 =?utf-8?B?a3M0ZkFUS0MrdlgzdVYrTUkxRzIrZHRVemNuWlp4KzIxcjNGRDhieXd2Mi9C?=
 =?utf-8?B?ZC81QnNKZmp6M0hsM283RUtJMDY3RUJjTitrZ1BVUDh2RURkbm4xVFJMNlpP?=
 =?utf-8?B?c0RDdGFGS1k2UkNsL1h2bzE0dGtqbkh2ZEhQRkJyNlovQzlPcGwwOEM0TkJy?=
 =?utf-8?B?NFJFSkY4MEhLdU4xeVFEL1NNd1ByaEdtN2NJam9RT0NNajNMdlJ0Vkp4SHNS?=
 =?utf-8?B?Q3gwNjd3ZkI4U0cvNFRsRlV4U3A4WHphdzIxcEIrK0Q2ajd1Z2hvdVd4WnJx?=
 =?utf-8?B?Wjl4R2NDY3kxa3N4QnNFRloycUxxdGw0NXYwMzI1U3ROZTVsSldXeFdpR1lG?=
 =?utf-8?B?em83alJzWUpFaG1haDA0U09wU1Z2aFcxYjJDS3FjQUk5S3FhbGV1UFF6T3gx?=
 =?utf-8?B?VDBTcDNKeXRPcm83RGhTKzMxa3RMNURpSWp2dFdxc1RrQnk3azNQOTl6VzdS?=
 =?utf-8?B?UTJkL09jenZnbzg0a2ZqMHlmaXd6L1dSSVRZWlozdXlGdUViTGRQSDBzVXgz?=
 =?utf-8?B?YklHekIwZitYL0lhTVJ0djgrMWViSFdhejVYWmdBSWQ3NDZLZ1BRcjI5YmIz?=
 =?utf-8?B?bnF2YzNBcWp5WW1Xa3QvSFBhNEdxczgyNDdRNUJBcXp2VXFTeHFJdkQzMjQw?=
 =?utf-8?B?cmw1ckhjY3g5cHhQZlhVYW8xWW1MS1JUdU42SCtVdVE2MmJxdDRDV1IwdElk?=
 =?utf-8?B?aG04bVA3K0xKU1l1OFdMS2o0QlIrVmgxTWtXSWpGSUxVclNWaGZnU1NaYmFT?=
 =?utf-8?B?emcvY2R2YW8wVExxNk9RNDN6MHdDdlkycnZJVmhucTZWclVWWDkzWU81Mm40?=
 =?utf-8?B?eFJkOVlmUlhyd0U0dzNzQ0cwMnNaajcxM3ZVeDNDcFh1MnhKSEtVb0tLSlp2?=
 =?utf-8?B?T3JMZXYrakZOdFZBSUQvOWc2OUE1QWhHQndLK0RrVkFNUVBoZlpCTGVTQUdQ?=
 =?utf-8?B?T1VYNHlGcUJ3dEs0OFI1Ti96OHZWdDdzSEVYcGE5bzVoS0g4TkxSc2Fwa0I1?=
 =?utf-8?B?YUsxQmJEbDkzYk9WNEVjQ2JaZE80Wlo4TDZrSWFheDRHbEYyTmE0NWRXdllQ?=
 =?utf-8?B?NW9GYlMxemIwS3pVMDNiVVY4d255cE0xQk9MMzJjRVY3aGl6bW0xbTQrRnQr?=
 =?utf-8?B?Ny9oemp3djc0enR4OUZIYit6Q2p3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3113f5-e521-4bdf-155a-08de1d4deab7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 16:02:42.3175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HthLz4XGU5q37UyQDBbXSz3I5/wGP1GCYA6pCCkIBIOTSGq/h+KkyIeRuPpYx7uvAg59IXfZh7FlP+jiUVjk+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9133


On 06/11/2025 06:17, Akhil R wrote:
> On Fri, 24 Oct 2025 16:28:50 +0100, Jon Hunter wrote:
>> On 01/10/2025 07:47, Kartik Rajput wrote:
> 
> ...
> 
>>>    /**
>>> @@ -678,16 +685,28 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>>>                 tegra_i2c_vi_init(i2c_dev);
>>>   
>>>         switch (t->bus_freq_hz) {
>>> -     case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
>>>         default:
>>> +             if (!i2c_dev->hw->has_hs_mode_support)
>>> +                     t->bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
>>> +             fallthrough;
>>> +
>>>
>> This looks odd. I guess this is carry over from the previous code, but
>> now it looks very odd to someone reviewing the code after this change
>> has been made. We need to make the code here more logical so that the
>> reader stands a chance of understanding the new logic.
> 
> Would it look better if I update as below?
> 
> @@ -678,8 +685,26 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>                  tegra_i2c_vi_init(i2c_dev);
>   
>          switch (t->bus_freq_hz) {
> -       case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
>          default:

I can't say I am a fan of this 'default' part. I don't find this very 
clear at all.

> +               /*
> +                * When HS mode is supported, the non-hs timing registers will be used for the
> +                * master code byte for transition to HS mode. As per the spec, the 8 bit master
> +                * code should be sent at max 400kHz. Therefore, limit the bus speed to fast mode.
> +                * Whereas when HS mode is not supported, allow the highest speed mode capable.
> +                */
> +               if (i2c_dev->hw->has_hs_mode_support) {
> +                       tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
> +                       thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
> +                       tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
> +                       non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
> +
> +                       break;
> +               } else {
> +                       t->bus_freq_hz = I2C_MAX_FAST_MODE_PLUS_FREQ;
> +               }
> +               fallthrough;
> +
> +       case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
>                  tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
>                  thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
>                  tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;


Looking at this code are we better off converting this to a simple 
if-statement?

So we have ...

     if (t->bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ) {
         tlow = i2c_dev->hw->tlow_std_mode;
         thigh = i2c_dev->hw->thigh_std_mode;
         tsu_thd = i2c_dev->hw->setup_hold_time_std_mode;
         non_hs_mode = i2c_dev->hw->clk_divisor_std_mode;
     } else {
         ...
     }

Jon

-- 
nvpublic


