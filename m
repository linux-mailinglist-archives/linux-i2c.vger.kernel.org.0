Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63D94356B94
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 13:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237345AbhDGL4F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 07:56:05 -0400
Received: from mail-bn8nam11on2055.outbound.protection.outlook.com ([40.107.236.55]:48481
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230280AbhDGL4D (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 7 Apr 2021 07:56:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJf73LOgfvOUeKo9psP7OOLYxbKHlgDkIKbG33MllBr4ncUpfVrWN6AuzoVcRpvoKtymFXGTjLPXnmmq4t99mdbtHq0rt3NL7UM//I1adiF0lmS5PrhsJOzZG8sKivnfTDH31gxj2EmoyOFLg5X59+B3MKwXx+6uYf+QkqOJZHXKMEAa6L2dNgEZQq9cKsAhWBexITu7Ol459dWRHibGe4OcDeQ+V5gj5zTQcgdYUvtatpLYS0uJrLBa7vyhDGYvFeqjtN7QveBuxsfe1lX3fQ4fw5TUtCUIfWK6PlFMYlftu+q3rCSR+kobYJz/aG8l6HFYAS2MhrO1hFzlklvIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9m3lHwvFb9gOBac4O+LU/Zs1JVGO4kaUQknQn0X8mo=;
 b=TlHk+RAzQmaAzXekHyvsV1+EEbkljwHwHPvbnG+bhwigBdHqtVbs2DuXENe75n2vnz2kMyTye51fFRJ8lQqNMQoWTvDNmCiYvAboFa1xOTEjTdAOZx0wl/mja5Qk/fDxtGezsA9WI9+VETJDutTKZqiuZoVRRbUjc8zZwX652rmq+pLOSPRHqymU5yM/YedC+Sc13U1LJVzksA5zDmQGYX9imdkzZ+qb3MF6bho6HreylKC9wYdQBKSPxtz0AHJsZHiTta/dxu+kYWX9paIl4HmEJYmZlt7LISu7MtQLH7vMfnscIZpsGpjrFHTmhbKR/IZrz6TAOhgawBH2vzOaLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9m3lHwvFb9gOBac4O+LU/Zs1JVGO4kaUQknQn0X8mo=;
 b=mk6sKfeTnVbu4WkRx3Z7eXe3r/7NOR+9B1gFE3JkC/idEULn0rmqPFPJhyVLpPhDwkEvLDDnoT3cXeEaZyHRVqdfVR8gW5RlweiAo66p9UMS8CaYQPBkvXm5Y14SPii3XHVyksRJn1m1rqxEEprFmtKDE/qndW/b9D8PEHjVF5k=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3508.namprd12.prod.outlook.com (2603:10b6:408:6b::19)
 by BN6PR1201MB0035.namprd12.prod.outlook.com (2603:10b6:405:4d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Wed, 7 Apr
 2021 11:55:52 +0000
Received: from BN8PR12MB3508.namprd12.prod.outlook.com
 ([fe80::94e5:fa02:4a06:8e81]) by BN8PR12MB3508.namprd12.prod.outlook.com
 ([fe80::94e5:fa02:4a06:8e81%3]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 11:55:52 +0000
Subject: Re: [PATCH -next v2] i2c: designware: Fix return value check in
 navi_amd_register_client()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
References: <20210407031137.2750993-1-weiyongjun1@huawei.com>
From:   "Goswami, Sanket" <Sanket.Goswami@amd.com>
Message-ID: <53737d54-d2c0-d4e4-43ca-48734b51b65f@amd.com>
Date:   Wed, 7 Apr 2021 17:25:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210407031137.2750993-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.157.251]
X-ClientProxiedBy: MAXPR0101CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::16) To BN8PR12MB3508.namprd12.prod.outlook.com
 (2603:10b6:408:6b::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.136.34.232] (165.204.157.251) by MAXPR0101CA0030.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Wed, 7 Apr 2021 11:55:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21a3a7bb-f493-432a-c3ba-08d8f9bc17cb
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0035:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0035405E2CB24848E449F0439C759@BN6PR1201MB0035.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kWPBlwrSbxHG39lTlLKcIlrUHLw8GYsrmWTJMonqvyvXA1phPbIywH8nba2NSMn3yjGman7kTM1hb+pRFsCKOSIr0BMVITdzr10HtzG6lvF7FpeR8rbYvDVIFNanK6xqdSYbWul7AHmjOIny1/hYbLGHQeV5jOGmfwGpkD8wT8jZ6mDkgJuOW8/ZYS41wvewdAQYzyV5NPsaUo2zEuP3OhvmWG/GRPiVTdJwnpOcfyVeTG7yUgDNjFO+uR6jWwXQDFjUdwN9XLL188mvUo443DqaN9Rq6jCJxdgKTsWdSI+SBqB1B6MP77qJmcecgqZoAE9CHPyHI3C+SF9E69QervO7T7/tiIkqIEGNx4klPGSrAdWYfprQimfudv0G0YhSw6Ugq3TBoT1j3fcTX0DY0mNi2XGN7UBVIZmF1Dg1kO69/obWNW+6og7mWAYHm4YNQIGfHnNSJRLljpiUX7PTXA4JfruU9W1S1nKVP2kIFuxgPmOqC1eITCqFeRYZuC6u23Ikla4ld4fPzoHukVdlSXNkcX5uxAyB9juK4QFWZslKSbLJ6A0HES+iGwuTFdgaztoqtOXyIHBe8eCkDOmkfMeLwNHdecI5X7RQ5pARs0RZSxVMFy/QVjdBd+4SKRvmvGqcJN2S0W/bB6dVul8ZhXgmmReyqQMmgc67u3skV7Pajt2ny9948sUVMayrWjSt8/KFkumNoWpBohSwSmwf4HLjHI8+8T+SaxdbKrJvCvuASuoLIqVEaVq7eTblGWXO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3508.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(38100700001)(316002)(66556008)(26005)(38350700001)(956004)(6486002)(66476007)(6916009)(66946007)(16576012)(54906003)(5660300002)(31696002)(8936002)(2906002)(8676002)(31686004)(6666004)(16526019)(186003)(36756003)(86362001)(4326008)(2616005)(52116002)(53546011)(478600001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y0J6TnBtU2Fxd1ZxUEtreTY4bldoTkdOZEFLUHdxemZtSHltb3l0RGc5M0hV?=
 =?utf-8?B?OTZLYUJyMklLS0VpZ3A1L0Z5RTFpZ0ViaHZDNEEvZDZzMllpejFNN1I2U2JQ?=
 =?utf-8?B?ZFVIQWZmVFJzTmxBS29jd1FLOUYwMzlMaVNYZ0lwTThad3VTWXFZZGowcmFw?=
 =?utf-8?B?UVZYWmxkK3hMejdtQWgwdnoxNFRub0JOUjAvSkJyd3UrcEs1WUlDMXd1QUVS?=
 =?utf-8?B?NGVNbW9rbWVpbHRmYTJZUVp6aHdvcDdxdmltUDEreXcwOXUzZFdhZDVvK3do?=
 =?utf-8?B?WHpLcEpzai9sMzNjNjE1cS80OGE5cG5jNkVuNW9jdDg1QXFrc1ljMmRaT0Vw?=
 =?utf-8?B?cTBLelNlL0tsQU9EQzFDd3lndXM3SFErZWkveWlZN3JUY29ITWs5a0F0ZUdD?=
 =?utf-8?B?d2ZiRkxBVUxyc09OQTZEeVJwaU9PeUtkRTRkemVwemZ0ZkJJcXEzYlM5K0xP?=
 =?utf-8?B?VDhmNGl0KzUrU0ZhOXd2clBWOXR3ekZ5ZXhxSFpuY3RlOE9OSm5ib211ZStO?=
 =?utf-8?B?MkxMZnpnUHFKSm4zM3E5VzMyV2FOOTJLSldRajZPSk51OEF4YlgrVFJvREtP?=
 =?utf-8?B?bHI0SWJ1bkZ2SGVoMmVVWFJFcHFOaFp5NmZON1RXSTZ2VDhzSjZHdWV6ZGkx?=
 =?utf-8?B?K091VHQreE5wS0ZOTEdwL0gzSGNpUExDUVA1N1hSYlpxSkZmbTd5dFhPS21l?=
 =?utf-8?B?eHc0UkdkakhuZEZENGJnRU94dVp3bzhwK0hwUlo2QjUyOTNGUFZ0cXZBR0FI?=
 =?utf-8?B?YWZROG9WOTI4bXBVd05WNEZYTWhzb0w5Rm1wNWVxSkNyL0FRUTJzTVc0cXhP?=
 =?utf-8?B?dGNyKzBrc2hKV3pOenhZNmxrRFZ6bkdVaktHNDg1cE5SRE1IV3lWVDh1SmpQ?=
 =?utf-8?B?dnRkSnM1eVZ2Z25zcldtTDR4c3M3ekRyUXBxclk4Y0tWUFB5S2ZvajNDc2Zi?=
 =?utf-8?B?OWg0dmxkZVVnR0xyTFRXSmlsRkJrSS9ZbmxiVWd2Rmw2UEYxSklyK2R0cnVy?=
 =?utf-8?B?YzFzOHpEOFNFTkZuaUJUOTNJTldCNmVDYU9Gb0gyNE9ZR0pQTWRoLy9ucTZr?=
 =?utf-8?B?WVpwaXhmWDhlVGhIVW50UEtzL3hVUUJlVmpHazNjeU5rNnJKbzBtMWVVL1FB?=
 =?utf-8?B?aXZ6V0htZTVidlZjN2ZZaFJ4eTRFNEg5VnlIWlh5SnhPNm5aTDh5RTRjS2pn?=
 =?utf-8?B?MUY0dDZpNG1qU01kbm9mU2w0YmQ1cE5XUWlmcTBQcFcrZVZwcHphMFo5WTNx?=
 =?utf-8?B?T1BFaFpoYzRwbm5yYjBSeVBVTWNCdS8veU16czBHZGZya3dtbmNUSXRsV2t0?=
 =?utf-8?B?QWs4Q2o1M0FvNnRDQThrQnVEY2JYWXlZeDltSjNlZHdES0lyWkxIU3V5N3g0?=
 =?utf-8?B?NjhWd1JiSldjUmhvTXpkdHNmK2hwcndWanJ6ZkwxQnlKeCtLaDBJbFdTNHBu?=
 =?utf-8?B?ZjdNV3NlVDc2YXFsQ0UyaHlhclNySUd1S0FKT1Z1dkRPL3NremdsL0VXeEFx?=
 =?utf-8?B?WmV4cjBXWlp5djVTZlRQN3hmajlkTTBlR05NL0JFRjc4NEhxUzhGZ3dJVWl0?=
 =?utf-8?B?ZDdXL05obXBnbThzcXpHTjI1ZWVXdHJTMVdYQnhIQVhtelFWd1UvMEFuT1BX?=
 =?utf-8?B?YVQybU1EWXZoZVh3d0g3QTFaUGcxbWh2TmhoSlk0ODVOcVBxVEUzOGR3YnhK?=
 =?utf-8?B?Vi9YNUdLTTFnVkpwZ1lRNGJIWVVGeUxVNXRJTlZMak9PWlFaeVRpZ3pkNVlV?=
 =?utf-8?Q?hTx2ofFBtFnH/FSSzp6RNmTre4h8HVW9XvWHnyg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a3a7bb-f493-432a-c3ba-08d8f9bc17cb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3508.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 11:55:52.2262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5Rf/8boGgx7E8EG7e6LEaSzqvhfXtSdObBzoIxopusdlY3I72+CjsB2zyIjz2AEAh5aPlHIqxO1SpUtiNg+5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0035
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wei,

On 07-Apr-21 8:41, Wei Yongjun wrote:
> [CAUTION: External Email]
> 
> In case of error, the function i2c_new_client_device() returns
> ERR_PTR() and never returns NULL. The NULL test in the return
> value check should be replaced with IS_ERR().
> 
> Fixes: 17631e8ca2d3 ("i2c: designware: Add driver support for AMD NAVI GPU")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> v1 -> v2: fix description format.
> ---
>  drivers/i2c/busses/i2c-designware-pcidrv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index 7ca0017883a6..0f409a4c2da0 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -132,8 +132,8 @@ static int navi_amd_register_client(struct dw_i2c_dev *dev)
>         info.irq = dev->irq;
> 
>         dev->slave = i2c_new_client_device(&dev->adapter, &info);
> -       if (!dev->slave)
> -               return -ENODEV;
> +       if (IS_ERR(dev->slave))
> +               return PTR_ERR(dev->slave);

I got your point, applying mentioned change in my patch.

> 
>         return 0;
>  }
> 

Thanks,
Sanket
