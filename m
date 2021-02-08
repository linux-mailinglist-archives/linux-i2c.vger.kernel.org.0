Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6B68312B38
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 08:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhBHHmz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 02:42:55 -0500
Received: from mail-db8eur05on2103.outbound.protection.outlook.com ([40.107.20.103]:22595
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230122AbhBHHmx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Feb 2021 02:42:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvyBz9256KrCXAdUk2f/Zdpw738p9u7v+0OFkWJ4HFepWHsxGgE0hHY9QvJmFQHTvMy306/GESuVNsbvhMaqLGfOVmb0JMZRWeBfP3JuhVycoKfFHrzuiSZt2SBsSdQ0t0fRt37oSJqG+/XluWn4H7uDrorfWUra4OexxUsJ/sz+kSWnnkItBRBlm2j9dZ72hmUaHi1OzclmxvFz4V561xCyNnwXfJQKKPn2yOh8WT/rYWQSAMlVppQr1wp7ijZJGTARqnUVd2sprMTVry3rKa8ilkmGHcpw3U7sqrRKSmuSrTFRmkuCtY9Ipp+xuUdx/iTqnkK2sb1o3YR6oU7uQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyHdI14SLrnEE8oDTYkhWKntFT+YPkvok9ncRC5jg4E=;
 b=SOYRfwZDK2s+DxM677OUzlVR10KgTyIJ4qGOFwFdnrNoNdBw8Q4ZwZ7hfRsMQhUyn7o+54qTVYlILBxyo7r/np7kG5/SBmJYFf53F2F1LzN0RYFSWqS2t0BZkq0CncGGbRepuqdGO71j8mfkTp/c40Sa/0DRMbrVxud8FXpvdHl38R6Yk/MSh52SaUXDpF1BtZk11HSJPQ2Z1nKVEZjlC+Jp0Cz5ISSxu3v4YST04PK2lnnPHTiX7jr1MhV5XwH8Pn258SgVNcFJ/rCTazrz/WW7KiFsqeS0HBeSj/sWhBMXjAYDQBIU7+MbTM2YiiWeXCCyucnaQYEUuGAoepPrvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyHdI14SLrnEE8oDTYkhWKntFT+YPkvok9ncRC5jg4E=;
 b=eONc4DscePV5D6BWrw20RPYvVqAlDiZ0l3H38mEnafOcyfmp8wF5ZPTeCUfAxZCmihi/Wyp0+wv4sdfIkVfpvRmPJkD62OmsqbFATqL/nH5J8tcSXyq6Q0tlaW/5sFOJEXRDHDI2WR5C/6Zb//Kwe2056/H7U+/RQ74zKBJvTdE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB7PR02MB5241.eurprd02.prod.outlook.com (2603:10a6:10:74::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 8 Feb
 2021 07:42:03 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 07:42:03 +0000
Subject: Re: [PATCH i2c-next v4 3/6] i2c: mux: mlxcpld: Get rid of adapter
 numbers enforcement
To:     Vadim Pasternak <vadimp@nvidia.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org
References: <20210204162451.29518-1-vadimp@nvidia.com>
 <20210204162451.29518-4-vadimp@nvidia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <f53726f7-5b06-7847-7c01-838c7903e8fb@axentia.se>
Date:   Mon, 8 Feb 2021 08:41:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210204162451.29518-4-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR05CA0243.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::19) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR05CA0243.eurprd05.prod.outlook.com (2603:10a6:3:fb::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Mon, 8 Feb 2021 07:42:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d35fe1b-08c2-4716-a0d0-08d8cc050685
X-MS-TrafficTypeDiagnostic: DB7PR02MB5241:
X-Microsoft-Antispam-PRVS: <DB7PR02MB5241F940B091194726D6D355BC8F9@DB7PR02MB5241.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sm9GLCrIeXmTS6KJ92iDIa9yzi5KPgK5HSZ2MTqq+XJHmw1FXIB39f1ZIr4V9UjfALEKrKnxEv5uLnAt2dwh7rN6Te1EuVTdjYKq3wsT8EjQNHwWDdwGW+ZX6xD38pUU4WtuX9ENYEtlygx3MRI4AwH0yarddyXmn4YueL1VSo9hzzTXAgtYapy5H+YTPeWIeDQkg7yjkEWW0Iqt9IcDYxbkvYQbaJTtIV5bXM4AfyFeyV3oIIn8mcYPC9xr8kgK/FIVaucsxbkyF2RKZIdrCLjcL51iQB/kWGHnTo+zun9sPxhYjOEvszMY9X6BlsfLCXIOuk/LzHqlquXGsw0gw1VlXjwRb7dg+GV2Sli5+IWnTkz52MVenFbDaEtuMTuWvtHWxLL3VZzWQo+pf8sZNN1gwB8Lix0caQO6TwdAzZ5Tbf/eYbS2nllXqLrnp7T93YkqGYNnYdpPNerRD7f6Bk5ElpTALSfhnr+nJbrxphvbi5v8JE1YFi0blqtwZRdTSjRz5WTAbFoQ002ALdLyB7w5Jy/vHbsc7tmFDMfnLTPwLS6PGo3uSDbQWeHHwA8zq1jl+QyyJSW9QQpYr+yq0H0JiPVfE8QYR+QnD5vxcjZgGRnhFNbDn8U5UfrGVSTC77UHrVgWKtp++JMOwx3oYyvxXQNPDtU1hXiCSKJ6qPU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39830400003)(396003)(376002)(346002)(6666004)(16576012)(66476007)(66556008)(5660300002)(53546011)(4326008)(316002)(66946007)(2616005)(16526019)(186003)(956004)(8936002)(31696002)(83380400001)(8676002)(36756003)(86362001)(6486002)(478600001)(36916002)(2906002)(26005)(31686004)(26583001)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z3J0aTJVNEJoaFFvbmswS2h5ZkJKRUxkVldIUHJwTFpKQ1NFR2RlZ3Q1eHNM?=
 =?utf-8?B?RVlHd2xoWTZ6cUNUM0hka3ZwbERlR0VDOXVPOUhDWFhKVmtETkQxZTJ6ZExF?=
 =?utf-8?B?QnZ0N21KVTVuNG9lOGtBajZqZVgrMWVHYTFPeXFLQzdCdDJuYWtPTm9kVjI1?=
 =?utf-8?B?enNuOWRDSEZwL0hiT3Q3eFpXTmN5Q1g0Vi9USVVUbnhrekxSajRBYkVTK0wx?=
 =?utf-8?B?RlprY3hpVmVXWW5yWUZ1NEQ2S3VEZ2R4bGFSTTFjQjJmL0xUVUFpbGlFV0U5?=
 =?utf-8?B?TEprMXg2Y3lkanZGMDdXR3RueUgrZjR3enFTQUhJVHFkQ2dkenAzVjVkUnp3?=
 =?utf-8?B?V2dScWVRQ21OL0ZTNnFxdStGZmErRTBLUU5hbWVqaFc2bmVvc29yQk8zN2lQ?=
 =?utf-8?B?WjNPUStSN3BpRHRPcVVYNFhYUHlWcnNVaWF3QlZRMTc3VmdTQURkTm1mTC9T?=
 =?utf-8?B?YTBpQmRzSFZOam92OE55QktscDJVYml0dlVENzZpeVozRkdsTXN6NnV6RVcr?=
 =?utf-8?B?UXpnVjk3M3I1RGZ2OXJuWE5kSmVVRzVNclkwSWJPRGFFZ3pqSWZWQXFVVUY5?=
 =?utf-8?B?d0d1eFZWM1l6Ung1dmNiSXBrQXFWbDlybjdGTDFteEgwUGFrMEhUNkVCYTl2?=
 =?utf-8?B?OFNtWCsrS29PTHd6VmpyTEFDRWkvSmFqK2lHaFBlbUZFY0NJUStNcVgzWnJV?=
 =?utf-8?B?dTlkdDdwZ2x3NmhCVzI5RzdDZWttQmRtY0RWOVQ0bXRVdFkyUFB2UUZ3Zi82?=
 =?utf-8?B?OHdVTUQ1Z0oyRTZ2Z01yT3ZhZUY4VUU0VFMrenpPeEJrK2taQjAvRXo4Zmlr?=
 =?utf-8?B?V0tjQjhwVmppdFE1blVlMXM1bEVaOHFoR3czRmVDd0FGVm0vWk9ZV2JnWDZi?=
 =?utf-8?B?VDRJNFVONm9jeVU1S3lGNUZpcVRsd1JCTHpqNG5TN3FvY2NNeEd3R0xUMUxQ?=
 =?utf-8?B?M1VFcHNUYVpTWHlwUmpSR0VqelpEVk5FdXlPQk9Md0ZtYUVNNTY5cFpyWENX?=
 =?utf-8?B?VXhyUVU5d0dYRXErYnJBS05uMzQycVZjK1ZXb1RwRk5SSks4TnptWndDQ3VP?=
 =?utf-8?B?eDc2bG1IYll0WWx4UnhJRUlZK0hDUlRLdDF1S3k3dS9wZVhKRDhRdnYrcVd1?=
 =?utf-8?B?L1l4T1hOYWFnK2Ircml2VXY2c2pJeE5LZTNhRlJhYnhCWnlXQlJkeVl2UXUy?=
 =?utf-8?B?dFp5MXdJSklqUGhDUkdhSHZOeGp6alA3UkhtMW5QVldUSnpIUHNVelltNGQx?=
 =?utf-8?B?aTFlODZVOTdjZE1Md3JEbERSdmR2TmFEUGtMeFZ2SjdoK3RjdnZDanpMNkk5?=
 =?utf-8?B?TGdHcVRsaUt0WjkwQTNjZGdvYmNkSXd3VGR3QkxVSGVrUnpucTBVM1J6MDFq?=
 =?utf-8?B?c29lWVJqWFZqa2pqNXJXMjJtY1JvcE5wck95SlRuRUMzVm9QNks1Rmh5Znll?=
 =?utf-8?B?WXBlSjdpYlNpOEZxOElYMUVFMENVU2k3VmZiTEwvM2RCTFZsZ0s5Tkh1VXBq?=
 =?utf-8?B?NGFQS0hEMjMwOVdPTGpQVis5TDNDdk5NRDhvNTdvOGdEMkVsTUh5Z2NGSS9L?=
 =?utf-8?B?YVl3RnR3RzV0UWdkTEpjWm1yQkNjekgxcnUwM0pIY3J5Q1NjVk1zWW5jUjZI?=
 =?utf-8?B?Vy9LeDc3S0RnRzM4Z3NKd0g1V1NnNjFyOTB4d0podFAvRDg2REthRUxrMzBt?=
 =?utf-8?B?V2w1M1JVbGNRRTFFSERyMHUyeGNsclJQV2E5ZnRUdEJiVE5CYkFtcitMdm8x?=
 =?utf-8?Q?ermvMkI8D2mRRGhbOfDW3EBw5QjFcO66aqKWFai?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d35fe1b-08c2-4716-a0d0-08d8cc050685
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 07:42:03.0887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UKy8kskQraRaxpWyVYwrSiRH6v0gdXLNpGC30at62aRNr7q+rTRWQuvVGBEleoq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB5241
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2021-02-04 17:24, Vadim Pasternak wrote:
> Do not set the argument 'force_nr' of i2c_mux_add_adapter() routine,
> instead provide argument 'chan_id'.
> Rename mux ids array from 'adap_ids' to 'chan_ids'.
> 
> The motivation is to prepare infrastructure to be able to:
> - Create only the child adapters which are actually needed - for which
>   channel ids are specified.
> - To assign 'nrs' to these child adapters dynamically, with no 'nr'
>   enforcement.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> v3->v4:
>  Comments pointed out by Peter:
>  - Extend patch with the code from the next patches dealing with
>    argument two and three of the i2c_mux_add_adapter() routine.
> v2->v3:
>  Changes added by Vadim:
>  - Rename patch from "Rename mux ids array" to "Get rid of adapter
>    numbers enforcement".
> ---
>  drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 11 ++---------
>  include/linux/platform_data/mlxcpld.h |  4 ++--
>  2 files changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> index 113ad84cdd94..388fe5c080aa 100644
> --- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> +++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> @@ -101,9 +101,8 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
>  	struct mlxcpld_mux_plat_data *pdata = dev_get_platdata(&pdev->dev);
>  	struct i2c_client *client = to_i2c_client(pdev->dev.parent);
>  	struct i2c_mux_core *muxc;
> -	int num, force;
>  	struct mlxcpld_mux *data;
> -	int err;
> +	int num, err;
>  
>  	if (!pdata)
>  		return -EINVAL;
> @@ -126,13 +125,7 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
>  
>  	/* Create an adapter for each channel. */
>  	for (num = 0; num < CPLD_MUX_MAX_NCHANS; num++) {
> -		if (num >= pdata->num_adaps)
> -			/* discard unconfigured channels */
> -			break;

It's premature to remove this check here. At this stage, the loop must
still be broken when either CPLD_MUX_MAX_NCHANS (can't hold more adapters)
or pdata->num_adaps (no more chan_ids are provided) is reached.

So, move these three lines to 5/6 where you actually change the loop
condition. With that change I think we're done with this series. Yay!

Cheers,
Peter

> -
> -		force = pdata->adap_ids[num];
> -
> -		err = i2c_mux_add_adapter(muxc, force, num, 0);
> +		err = i2c_mux_add_adapter(muxc, 0, pdata->chan_ids[num], 0);
>  		if (err)
>  			goto virt_reg_failed;
>  	}
> diff --git a/include/linux/platform_data/mlxcpld.h b/include/linux/platform_data/mlxcpld.h
> index e6c18bf017dd..04d93c563c04 100644
> --- a/include/linux/platform_data/mlxcpld.h
> +++ b/include/linux/platform_data/mlxcpld.h
> @@ -11,12 +11,12 @@
>  /* Platform data for the CPLD I2C multiplexers */
>  
>  /* mlxcpld_mux_plat_data - per mux data, used with i2c_register_board_info
> - * @adap_ids - adapter array
> + * @chan_ids - channels array
>   * @num_adaps - number of adapters
>   * @sel_reg_addr - mux select register offset in CPLD space
>   */
>  struct mlxcpld_mux_plat_data {
> -	int *adap_ids;
> +	int *chan_ids;
>  	int num_adaps;
>  	int sel_reg_addr;
>  };
> 
