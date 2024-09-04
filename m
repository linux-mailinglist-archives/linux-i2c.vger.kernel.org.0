Return-Path: <linux-i2c+bounces-6143-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E1296B98D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 13:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE9AB1F2161A
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 11:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2221CC171;
	Wed,  4 Sep 2024 11:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B/6TXqhU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CBB1A4E94
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 11:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725447718; cv=fail; b=HUEELgeun3ZWmoQ7vTVINHV/D8a5zeYBh/LJEngUW/Kgdr83eXNEbCUH3Ph98Ad6LOVg2tGg0zkHl3zbu+pKgaMbD+7TD7LRkvZZEKD18Qbfo4hmBiaQ2Wp3oyMAKzGvdnXOdfiDpeT6HpsetO4nQCfr5soBRAv/wBl0/7n8VRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725447718; c=relaxed/simple;
	bh=aDCukuXbVOP1L+qtY/MsR46w+2c3FhOIEeiCjHFvwQc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B3/2gG0z/9+iqMIR2rPaGAGTgx0Kui2Xp03mIlwgciypoMvzHz8Bv70jkqaxaZbKDmF9wPgo4klfofGtwnPDIqvzbPkVEufTWFE3U2XGbAS/DDuNuLCmXEp3LTf0k4WC4hKqnqgM3DryVPtrlzUD6Se013MnDJGZGnvjDUsdPBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B/6TXqhU; arc=fail smtp.client-ip=40.107.243.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRkIHUNM6BMooYjbXnDeeaP5Vg2HzlKgBPxWhB+6CD44b6tnred+dqbZ03O7x2aTfHAOepMnoh5Ommrg+LFbejxZHFuvy+L0q1XqdLbTZY8dV+Znwif0MCf6mONYfLLriuQk18RvQQxTBl3kIzNFeC3Q9eblCi+hKu5iyVAYOuPosb+ZaGl8b85wkOKFHQj7eNkNcK04zdpjIaR36FMNv5B9y1mvPsiusEtjgJpiIcjS2aPmMyxvJl1msZHCBAwWFgOYfr4QlgfYGF1/r6kP4kRVllDTQ7WR+AEWhWTLRQB/jtDExS+C9NBgH7+eZE5bdU4xRh9aMuuYDzXyxgjCpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJv6XOJua2/+xH9Eq4VEROCY7Tey45PGkx6VFAgiCZ4=;
 b=mooEGrmN+tmgLTdk8XxW8oYzF6Zth9pcI85Tsi1TOr6N1jPSY8FZaysj7a4nTkvcmY12g2GLhYWzcYqTAVwZx/6lQ4NGc3EZxqheuOPFZCFUIxbNl37R2kDoIzHwHyAsJDbJMiDQP597Jop1mtP1V0gkuwKOXjSS4ZvMY2UZKTGci0FghHQaIH8He5Hqtm2mpFombJP5BrrYkmlel5OT7XqfefKNG4ZsjEIsnOT3mBWjB9BvOOk4zJ3MKg0gpiMAPq5XMCspseuLf9f0EqnCfMUvckAJKALSvUVATBO4F7cXrxL/RO4RMQvG6dXlxnZBtrjydkFATo7GicEeYqQdIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJv6XOJua2/+xH9Eq4VEROCY7Tey45PGkx6VFAgiCZ4=;
 b=B/6TXqhUuV/kwK4sGK7ipAdUs8NNOHNVw966EyBm+tMYQcCSBhTVD9XZ+M9tGatVddvYixtysAGVG5NR8g6e7x/0SzM0IZYq8R1BfjpfXe1jy27o5Mt8PjyS5ygXe1d9FzjUy4j56Pb/+0bZERh+Dcn0htHtwPD3M1sPea/CPMk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA1PR12MB7294.namprd12.prod.outlook.com (2603:10b6:806:2b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 11:01:54 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 11:01:54 +0000
Message-ID: <f45a7b40-8395-4aec-91bc-37c07eb6c8e2@amd.com>
Date: Wed, 4 Sep 2024 16:31:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] i2c: piix4: Adjust the SMBus debug message
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
 Sanket.Goswami@amd.com
References: <20240822142200.686842-1-Shyam-sundar.S-k@amd.com>
 <20240822142200.686842-5-Shyam-sundar.S-k@amd.com>
 <7jdrjtyln26ikkm6wjz4jc2hcynqniejepjjlm66ukxeayfkbo@u4tgx3bmqtqq>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <7jdrjtyln26ikkm6wjz4jc2hcynqniejepjjlm66ukxeayfkbo@u4tgx3bmqtqq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0201.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::13) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA1PR12MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 071907fa-71dd-4daa-0a7b-08dcccd0fcb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjdjVHNpQ2JaRm1CTVhwYnlzUit4SzRBN2Yzc3RWUU1GOTlCTTM2Rk9hY0sr?=
 =?utf-8?B?TDgxVmVzMmtlOWt6cHlrUXpORWZzRDJKQTBudUMzaGVWWmk3d2ZtRFkrYU54?=
 =?utf-8?B?bkEzUTROb0hpZFlESVpKZVFSTGdxR2x3MTd5WC9qOGFzMFRVdmorK2FBWTVi?=
 =?utf-8?B?Z1pRaG1OL1VESVRnM2NsWHN3TWJiczF4V3VGZkZXNUxLTWViMEkxQmRJbG5x?=
 =?utf-8?B?TDBxdy9SNDhlc1Y3L2xrY2J1QkJrM05nSVZQVmZGRnhHVXBVYVdha2VzMERX?=
 =?utf-8?B?NjNtK2o5RUJ4ckYrY2VqNEN2bEtqUmJTSDlORnV4R3Yxb0Q1SXVVbnZodWtS?=
 =?utf-8?B?MnFUbjFxdEllMHNGUDhYSi8rU0pIaEVsSmE2OTd0dEdOSncwa0VPTXBhQkl0?=
 =?utf-8?B?dkNvSWhLNDZWcENvL2R4dWJHQ05OMTN6NkYvdWdPVGtUNEVaczFOZzRhRENk?=
 =?utf-8?B?RDAxMk5sanF1TGpNOGZ6cXVkS0pNc0FMajNaSFI0Y2EzZE9PNlhOQ3pKWEZU?=
 =?utf-8?B?L00rS21xNkg2VlB3QjBmL3Izc1hnZVJ2elMwSHk0Wm1Bc1FDMEFiaHlLek9p?=
 =?utf-8?B?VUxlMmN6MkQ1a3Y4Qk5NK1JELzRLSlRjckMxZUs0VGlvaGRTa1gxR1haK3Mw?=
 =?utf-8?B?ekVUQlhSWis2UnRHRzJ5YkhrOTVXaG5lY1hFM1poYSs5WDFVQWxaZFVtOWZ0?=
 =?utf-8?B?L3NCaCtGUGVqVWo0a2R4Vmk3NzFaMFF4dis0dGQ4RmF0K0xkWmdpSFU2QkU0?=
 =?utf-8?B?cVI0QnozRzQyUk9QdGFKeGlaZHh4SDBja1U1ak1UK3ovL1JVK0JXOWVvZmNQ?=
 =?utf-8?B?WjBxSTY5TUNNS0VWemN4ZHovTlRHbER5aVV6d1BhNnQ2ODYyT0swemEyVkZj?=
 =?utf-8?B?K0xhRituZ0FicUdyVDZrK3NIT3F0SXVVZnIyUW1UUDRkV2xDQzJ0QlV1ekZk?=
 =?utf-8?B?SmdtbGVRZnh1OHVoa1JNbmhoTXcxMllhZlpydTNJRGJ6aEtyTy9BbWpyODhJ?=
 =?utf-8?B?Qzdpamh2R25DYytUQ0xKeHJELytNMjQvVnJCRm1iNHJzRWx2ZmZHdHJMS0Uz?=
 =?utf-8?B?NnhMWnV3VGJVVnl6OUhETCtiRy9id2RnYk94WUVYcHNYOWUzVXVQdXJUKzF2?=
 =?utf-8?B?Q1NVejR6N2JNS2pBcHFrbWl1ajdEc2NpQ1hjK2ZZaktOZitlUndQY0EyQzhx?=
 =?utf-8?B?SDhQV0ZIWGpmcU92a2RtV1pQbjNxR0N0VXFYQjdvWGhyeGtLd2xMdVVTZC90?=
 =?utf-8?B?WW9OenB3LzMrRTBPbWNUY0JzRk1sd1ZvMHNFb05raUJQdjMya0V5RWhXVTRV?=
 =?utf-8?B?a05qV2lJM0J6dlNlM2ZpV2s2QWlVakJhQjVVYjhLWXFQRnprc0NhSDBUazhq?=
 =?utf-8?B?QUttZFVIL3VDMDJLajlzeloyTmh0R0F2T3NOR2hMWkxXRGFJQ0U4blkvWk5j?=
 =?utf-8?B?NGkxSU81MXFwMkNvSkRjems0c2lYWFpTREpjY1RWWXBjWGptOVNVcms0Uk9M?=
 =?utf-8?B?TEdxekEwaFQvNCtJT0pGZzJqeTU0UDRubEFFSlQzcEdCVDhMNGgzSjEyNVhy?=
 =?utf-8?B?d1VkbE9HSloydzFTdEhOdkJFTnNNc1dZQnQ0cDlzbFdRaHlWSkdMK3RwK1Yw?=
 =?utf-8?B?c1NHSVliRVhrazdqaUpBV0djQU53Vm9HRm5iZllCakNET3BYYld5eGZrdFBQ?=
 =?utf-8?B?STVRNVB6K2M4bEk1bUltTUpHOXAyVnpuZE45SnBOWXNOa2NOaGlxQS9WeGNj?=
 =?utf-8?B?c1ZzaGU2U1B4N1FuTlhJQTdZd05Jd1g0V2FYL05zYWZQM0NWbjkyUFZoTC9G?=
 =?utf-8?B?OTZzNkRNMUQzYTQrNWJ0UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2h0U2ZmcE5BYTFvMzdTaTJHcHExSURQclF5dDFyL2U5WWhoQ1pOd3pBRXdO?=
 =?utf-8?B?VUlRK25WcTJhVm1iWGtWMXYvUGJkdXpLZ01EQXhCYlM2dlQ2TDNmTUhpWXZR?=
 =?utf-8?B?cnJ1dEZpQVFOVkFFc2Zzei9uak5waEpoVUU5ZnZqRHdsekJ1a3JOMmlGRnJJ?=
 =?utf-8?B?K1UzN3l1RVp1NEROS2VKdGJycVp3bVFjNU5CdjBERHNBUGRSYmUwVHVqcWRB?=
 =?utf-8?B?cUFOckIwTktIUkFRZVZWamdmYStyVDBla2ZNL3owTFZ2NHNXelUvaVdpdU1n?=
 =?utf-8?B?ODZMMnRyaUR5WkR0bDV3Tml2eHNhT0tEZU1TL01iUmJMODBVMVJUbjYwQkZ1?=
 =?utf-8?B?R2N5YjZ1NnBQaU9QT2pXY1NRa3N6b1JUbWFKNmp0NGdUSkhVaXJYMnh5Tkw1?=
 =?utf-8?B?RDVKUHdEZDZaRUtOeHZidWJLcWdUTFdSNEo0NVFNb3pQZlFZMlNuUXBxVExo?=
 =?utf-8?B?TmdwOEhmdzcxangxUEZTTzhVSlYwVnlCR054Z01iUFVCb2RJOWpld1dub2NS?=
 =?utf-8?B?bmZXdGZqU2ZrcUFIZERGc3pRKzBiRHhiK1NoNGQwdnpqamxwckNGK1AzRWJO?=
 =?utf-8?B?OWVvRUg0Ym9aWFEyK0JwTkJKK3dQeEhUOTI1NWJpbHdENDF1NDJmUjJPUnJ1?=
 =?utf-8?B?YmUzK1RrZ3RVRURhUmdwTHNzS1NJRzZUTEd6Ui9HMVE5ZW4zVm1SbjhsYXVS?=
 =?utf-8?B?d3o0OUJIaHZIVDd5NVZuZUZ5eDVIQTI3cHovbHdPdzJNQ3RmTktHMTVvd0FV?=
 =?utf-8?B?KzU5cnBnZzh4WkFJaDVqNE51TWN4cGZrQm9weXJ3TGgzUWNQV3ZVNnE3RDNw?=
 =?utf-8?B?SmVPM2ZVUDJMbk5UZ1ZmZ0tqc3NIRmFZWUlsOTdsRzVPQlBOaEJjdWRTNTdP?=
 =?utf-8?B?ZXZGQUFmS1YxMUxWdDhqSzFRN0F2ZE80SGUySmNFMUM3YVpZM2ZPdVIwMXlx?=
 =?utf-8?B?ZDZoK0FLOTgyU293ZUxRL2szU0hCdFN1NFZPQy9vRTA0MkdBb2toaTVITXl2?=
 =?utf-8?B?M2JTVzVrRkFlWCtIc2w1Qmo2SHdKdWNPaWFRRjhPQ0sxQjVuMUFCd1l2VFJB?=
 =?utf-8?B?em9RcER2N2xBQXc4eXdMTXM2OCt1b3NyajcwNzA3RUtwNEVrcmphNHV1Ty9v?=
 =?utf-8?B?OXZIVmtuQVJmazVZRmovRm9PNE8rVVlIdzV1SHNnZTgrYS9Hdi8rOWhSM0Yy?=
 =?utf-8?B?OVVQQmhLd3FhZDlJaUFkNFYyd2V3VnZYVWt5YXhBOWNla2hESG1SOEJLWWpF?=
 =?utf-8?B?SFRydFlUdnZPZFN4U09MdnRwY2VBeVVWdkJkYnZ6OFE2ZjltVmRHTWFOWXM4?=
 =?utf-8?B?RVVhWWJodGRBOVdCWmJ4cUlvRGRzOXdvcDh4ZUFPMjNHWFNROGhHWHJkS0hH?=
 =?utf-8?B?elJaVStkNlBnNXgrK3Q4V0UzbEdvQUUvVUFrWkhBdFhlMHpYUUxWS2U0Mmhn?=
 =?utf-8?B?clpQbDBtdjhHQng1TFhxWHBCUEZRaE54aHg0VWJ0Z09Bek1zeTVHaVo4bFlS?=
 =?utf-8?B?UFZNNGRTdGVJZ2lRK2pvTTV3b3pqZmVmZENUdjg0L3JNTGs1NWNlaTN0Nnc2?=
 =?utf-8?B?ak93RE9NazN4amROUWN5L25xT0lXTjZzeFZzc01WZHd6MkRiNzBCUFpoQjJ6?=
 =?utf-8?B?Z20vMDQ4Vk00M2ZWWEN4d3E0MjFRcUpmUUk2RWloUm5HeTQyZTJ4RG5BeTQ3?=
 =?utf-8?B?NVkxM1QvTVloRy9FeWM0NjM3WnZsNnk4amtxTmRwTzlINVhKQTJra25XRXVF?=
 =?utf-8?B?c2dKUGFFdEYrWlo3ZEZIL1dGMWlmdTBpUUsrTEZZRkZPKzUzZnIxR2ZLY1Iz?=
 =?utf-8?B?dmwweThjTVVKVzY0YnVOT0NpN0JmMkMwemUybkMvTHlDK2JCb0tZdk8zM2ZR?=
 =?utf-8?B?dFRhS2p4K1F6K2ZKWU1ycUVIY0hNcWVFOTNWbkFGVnRiVzBjU01aVWttVTdM?=
 =?utf-8?B?Um9tRTMvL09KcGNjV2JKS0VTQmxsRmxPcHBmRk9IUklMdXphYzR1TS9zWHZU?=
 =?utf-8?B?RXpEaW9OdUovOWUyQzludFNMM21aUmtlWTlPd293UXA4WW5VbnI5ZzVPenNX?=
 =?utf-8?B?WHZNT2J6QVFDTUxiKzdLdHZ1K3B2bTNITUtDNFNLSkF3eXo2TTRObEVJUi9F?=
 =?utf-8?Q?ielU++X+v7ue3rt33cv24gt8b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071907fa-71dd-4daa-0a7b-08dcccd0fcb4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 11:01:54.8824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCFFep6HdQ57Y+CunfjkMhWnmjBxQlm4eet38zGvzrbj408OvM1ndrjUysJwjOyIybkZYLYtwJU5hjifyV4t0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7294

Hi Andi,

On 9/4/2024 03:21, Andi Shyti wrote:
> Hi Shyam,
> 
>> @@ -1194,6 +1194,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
>>  {
>>  	struct i2c_adapter *adap;
>>  	struct i2c_piix4_adapdata *adapdata;
>> +	char *node = "PIIX4";
> 
> please, make this const and initialize it...
> 
>>  	int retval;
>>  
>>  	adap = kzalloc(sizeof(*adap), GFP_KERNEL);
>> @@ -1213,6 +1214,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
>>  		adap->algo = &piix4_smbus_algorithm_sb800;
>>  		break;
> 
> ... here.
> 
>>  	case SMBUS_ASF:
>> +		node = "ASF";
>>  		adap->algo = &sb800_asf_smbus_algorithm;
>>  		break;
> 
> shall we have a default case here? I thought checkpatch complains
> when no default is specified.

checkpatch does not complain about it. I have added a default case
based on your suggestion in v2. Kindly have a look.

Thanks,
Shyam

> 
> Thanks,
> Andi

