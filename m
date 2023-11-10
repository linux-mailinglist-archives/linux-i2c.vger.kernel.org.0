Return-Path: <linux-i2c+bounces-43-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3368D7E82D3
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 20:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A437B20DCA
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241183AC10;
	Fri, 10 Nov 2023 19:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zIeCJUVP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383FC2F86F
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 19:41:18 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B8219EFD;
	Fri, 10 Nov 2023 11:41:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/Cz0k+tlzaLSnaj1lBN8e1dv74hCchmHs16bLKriaquvjUQ3HzmW/Oy5+y+4A773sG24N/94iRJBXulNOY2y+/v1QSQJlhPULlnX4UulIPLTv6B+zXfVvqbOFfyhSqYH0R4YTBa7E0OKslun8wJMc7yXIwC0iSiR/0JC9yKJKa4rZRe/ggylwq4ajH0+LF7TVLxsH6t3M1skDgOdOjGwkmssPiZC5HVu1WopQcQSMk3lXToJyypdh6SwWVFOwmGYm3C9nZeNo7s5uIJ1Ow7FR2L14wBwA1j14qp8v+9hqWuwHp6EUe5JSM+nSD/ShCrqG0zkld/Bo+wLeARk+15tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLgMTBCESTuX80zmdzEkucgwMOpwJafHH7nVjA4WYxc=;
 b=BWqE2C5qtIsqnt/d56T89FOn/7bsD9E7jhCUUndj28OBKw5IhBwPO+71lVfqdpVK0G1DIQh4K0adE75P79PwZMW3GO03c/SSIFIV1GTe+iGiLjBxEn43Ptvm2oVZV3oMchXKkf51zrIT6dJ1iBccStRsucXNBPj1o5orkWewKm3VxgibsovJQMZg6zKh0i+FuBT/gDmyDdxckPrtC/vGpf1QMV2HaD6+QBQnIxwIjhF8o3m2FdDKHyuabQ9okpI9kmM8VkvmVBnfU5OUL40WJNg08spgecq0Fn/0AGir8h98jDIIsG68jOwJHCBnfI/ZbsQ7C3TTi2Vrf6qh1St1Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLgMTBCESTuX80zmdzEkucgwMOpwJafHH7nVjA4WYxc=;
 b=zIeCJUVPk2hhJI23UztgAMTImySCmLRjs9YnVOx/+frn5HSxQqPnML6NpNpVQQu4MBvnfputAwyHaUO16lcGtZ0BgxBcWrfLe2LWxN1pouebSn8LYN3KpVWeLS9VlOCRcniM61ctmU27grRayosiHtPlX6Jc4CX+Ti+Ms2Ybfno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB7515.namprd12.prod.outlook.com (2603:10b6:930:93::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21; Fri, 10 Nov
 2023 19:41:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.6954.027; Fri, 10 Nov 2023
 19:41:02 +0000
Message-ID: <839ed9c8-f58e-495e-97a1-0734b8fa6fb8@amd.com>
Date: Fri, 10 Nov 2023 13:41:00 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/25] i2c: designware: Drop return value from
 dw_i2c_of_configure()
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-14-andriy.shevchenko@linux.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231110182304.3894319-14-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR07CA0098.namprd07.prod.outlook.com
 (2603:10b6:5:337::31) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY8PR12MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ba6ed19-a5f3-4158-db9a-08dbe224f879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xzt6Q6YwWDo8mHCJRHIMjinMAT/jfcLzWzel24OG34yE5IgAHIPc2sKJJ51cxXd4cm+yPJOUWTPqVbzOfQp8WkNfkfIjAOImmwIoDELJTd8JX2zQvw9Cj4NBdPp2N+s4Ky0xHWsqXA7rhxINhvUxIXERTsswSB7Cd1VAxaD2/gG4GdHSYftxZKXlKE0NUvSJYU7SeTXRKDTqpZu1DpsE0OteAno8cYSOh3oyP73e8LeR+NzhmvWwem+TpfnbY3dj1tnn7UUSzaIjlAhjW1NSRU3y0mQfBFBxMBQABMKUY5OHCB2orobyXaVICM2v/JYDqaGGfw6DaRuPp3s1ZmPWgn1jjHpl6+Yfk0WhB0ODxXJo4oqnnK6mb+EmhT7NSjsRpr7C5smdq8W8JNdTljTEDwRJ/nov06PEw5StV7zgZrT/grxFrpzadFGdO8YL+8G+FYhRJCwVDlxx71RCyYiWK7Vvq48Oo8xtU9hyY0n53+I8P9qNctywwyYsrE73jnxeVctiCe8ijBAiyNshcIvgBAidlIQj25RJb8yEMvmNrX47F1hqHtvUMzxSWx9RxsLtYIFqVouRoTyiS60ZRewfA0BWevBymitj9G5N8SMud7PKbAYyrMfmqeOWlJ97eOioDD6vP6Vl6bDuWQXkdZTLeRrgrMy3nyhnVaB2SZQK9xlS7MCuY8hxGysbt7W2p9Df
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(396003)(136003)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(53546011)(44832011)(7416002)(2616005)(5660300002)(6506007)(6512007)(26005)(31686004)(41300700001)(2906002)(83380400001)(66946007)(478600001)(86362001)(110136005)(66556008)(66476007)(36756003)(54906003)(316002)(8676002)(4326008)(8936002)(38100700002)(6486002)(31696002)(70780200001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STNiNnBpYXdIL3F4S2phUzIrbk9JYUN6eG94U3RkVkF2eWRRckdvSzh1Qkkw?=
 =?utf-8?B?a2RiTWhDZzhIMGxQWnUyNSt0aGo2b0srNTJ3Ky9SaTY2ci8veHFMZHl0NUpQ?=
 =?utf-8?B?RUpOZWEvV1RnTWdZYW44NUtpRmx4NGJVMUZlOUw3UnhTTVNzTTBLamZidi9h?=
 =?utf-8?B?UjY0OGRvOVM1TnUyY1BzSkxlWHNkdHRna3hpRk9RL2dNd2UzV1Vwb2RNck1C?=
 =?utf-8?B?ZG10ZFREbjZnaTF3cU1uUmV6TEFoaXcwUXRkR2JBOWsrN3VFMG9ReHRrSndn?=
 =?utf-8?B?cGdlNWRvRUJLdlU1U0hTSE5QS2RUV1ZDVEE3Z0lUeW51aTVaUFZPbDBLMjhz?=
 =?utf-8?B?U1kwUmtueDhzQXREWk9FOXZDYU55ai9ubXN0eHp3c2tkYTllTWlhcmEzdE5P?=
 =?utf-8?B?dUIwUU1XUmhKZUEwcjRiaFEwbWNRWlFYMnRCRE5ybmk5VTkvbVdLaC9ieERB?=
 =?utf-8?B?bFgvSmRvNlpESXQzbXNrb0dNdmdoZTcxM05wbW02c3ZKeUg0U2lqUW9aNDlw?=
 =?utf-8?B?ZjExQjBWcUNyRnZjcWg0MVVBc0FjbGxSMENLN1Y2dFg4emdKYjgvd0QxRjk5?=
 =?utf-8?B?VVQyaXoxdG5EMGNzeTY2MC90MVRtSjhSckhNa2tMeGk4WXhRb1lXcUZIemJo?=
 =?utf-8?B?OG44Y1FvZFd2Tk4zYTBqOFF4WkxaZkFMRXEybkR2b1JIV3ZWR3hkSmhLWE92?=
 =?utf-8?B?blFMTDdXc21td2FlQWZpakpaM1NMWE9aei84L0c0c2dXanhGSmNaTVA5UENz?=
 =?utf-8?B?cTRaaWhPM0J5T1dxTTN1Z3ZwMXdCdmJKWElhSXQ2L21aWDM3bFc0V25BRW8w?=
 =?utf-8?B?dUlNWC9URS9qVjZhZnFVUFZHZlF3dEtvMFp6cnFVbjFYczhGQWdyeDJDcVFR?=
 =?utf-8?B?dWQ1U2NIT08wOUkwYUJDTEQvM3dlZ2FXdCtYOTlGUEJRNXlWWURyQm1JOUd6?=
 =?utf-8?B?dnhrRlphOFBBdXhHTmRsdG5nb0VDQ1d5R3RFdCtycGNDRUxSSS9iUUdmV0dq?=
 =?utf-8?B?Wm5KT09IZk9sOXg1d0pZbk5USXdKWGRkYWh4YUJESXZTeFM1ZHRKZXZzQlV4?=
 =?utf-8?B?bE5mdXJIR25VcFJyYzVseWl2SG5CV2NCczBOTWo1UTN4VnJOcXJLTHdxRDRu?=
 =?utf-8?B?Y1QreVdRRThOcUJuNmNBL29OVEJHbGFIc3JqMU1LR1g1SnJqNTlWeHdmSkdV?=
 =?utf-8?B?WUU2M1ZRdnZUQWIwTXJydTRZenp2MTh0aldHbDkvSnJlL1c0UkMrRFhacWs4?=
 =?utf-8?B?MzAzVVg1YW5SV3c3bXUxWTl2cElDTG1vUG1WaFJmWkZKT0VneFVPNS9ZWFJp?=
 =?utf-8?B?VkxWYnM5OHlsZXZmbDN1a05Da3NUZkdrV3Nid2NUdDlZLzIxSyt4aW1pd0JT?=
 =?utf-8?B?K3pCbURXcmdZdUUxSVhWczJsT3FxK3J2clVHa0xqdTlXS2dtM3BESDhGZGFN?=
 =?utf-8?B?QTJXUUVGb3RwdlVlK0hPeGIrYlpiQWJkQzE2ZFFEL0UyYkkycU9VSkJkWUJy?=
 =?utf-8?B?d0tTaEtCQkU5NE9wYm0zeUxMRE9HcFVEOE54MzhTWHZLQTYrWnRBNjlWSEVZ?=
 =?utf-8?B?TXRzcHE5RndyeitmdjRaWDlkVEI4YjFXRWMrYk5uLzVaVFNHYlN5b3lnZ1Vl?=
 =?utf-8?B?b0FuKzZzeVpZd2dZY2pON1k0c0pCeVNRK2hmL0lmcGl0dVIxa3FrY3RLaXhW?=
 =?utf-8?B?WHdrbHlpSGYzY1ZIcCtEV1pPVlZMSDlvQmY2R3VPSVloejM3bVhlRlA5d1ll?=
 =?utf-8?B?aWY5NnBxUGl6SWVTcWtOdG13a3RHSXNsWlF6cWFOdlVrdjhYZW5lSENQcTkv?=
 =?utf-8?B?dVpid0trR2dtSUdESnBLVnBScHBqemZNOXMzV09FMytvZURrQWI5K29XYUN1?=
 =?utf-8?B?ZTU5S3VVSUR4NjdERTRpR3RIWGE2WWVBNUdzMGpUbmpqODRTQ2dod2NYL011?=
 =?utf-8?B?ZnoxNWU4Q2lSUHdkQWd6WGFMOGZ1dzhuNXBjUU9saFhyQzJOK2w3ZnQ3czZw?=
 =?utf-8?B?czk4blhJNnJ5d3pTeGY4ZXlxclVnWUNDWlA3Wk9rYjhWbGVEYVpnYkhKUlJW?=
 =?utf-8?B?RldtRzNHYXdvbzQ4Z2dWallNd0pneEcydjRBMHR1L25vd2ZkUlVJTGRpOTNQ?=
 =?utf-8?Q?h2ByNvhIPP5CZ+qCTY69EbWtF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba6ed19-a5f3-4158-db9a-08dbe224f879
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 19:41:01.9811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1fj+WVomDscqHiQg7E5NaDBFuokBqbTMsGgSqIBewpurU0unnkeC/0XOvnRjFUmKpQJBLCBLa63ae5DnR87Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7515

On 11/10/2023 12:11, Andy Shevchenko wrote:
> dw_i2c_of_configure() is called without checking of the returned
> value, hence just drop it by converting to void.
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 15f19ec20b33..7449f1b37ecf 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -110,7 +110,7 @@ static int mscc_twi_set_sda_hold_time(struct dw_i2c_dev *dev)
>   	return 0;
>   }
>   
> -static int dw_i2c_of_configure(struct platform_device *pdev)
> +static void dw_i2c_of_configure(struct platform_device *pdev)
>   {
>   	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
>   
> @@ -123,8 +123,6 @@ static int dw_i2c_of_configure(struct platform_device *pdev)
>   	default:
>   		break;
>   	}
> -
> -	return 0;
>   }
>   #else
>   static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
> @@ -132,9 +130,8 @@ static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
>   	return -ENODEV;
>   }
>   
> -static inline int dw_i2c_of_configure(struct platform_device *pdev)
> +static inline void dw_i2c_of_configure(struct platform_device *pdev)
>   {
> -	return -ENODEV;
>   }
>   #endif
>   


