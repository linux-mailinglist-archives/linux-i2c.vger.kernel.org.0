Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE6830A416
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Feb 2021 10:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232690AbhBAJLM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Feb 2021 04:11:12 -0500
Received: from mail-eopbgr60100.outbound.protection.outlook.com ([40.107.6.100]:41444
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232790AbhBAJKW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Feb 2021 04:10:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnkUX9tpxYccZcJ8pnNiFeFs9+Xf3ag1e8lnz3TARgXUmK1aAy1GZTfFII3rQyWXBtAl0wD3iOtWx0yUoaz8l9apBR57AnxOpP+20Cr/JV7Z9k9+8Hl/fLzQMOazcbablEDPbscskhJb/6Ru4BYKYo52ur9ZbvNGqfRfegj6XFXajwB6YDupp19MInsboE7FcWMNOMekBtm7TX/LZyPgdGPSuzyT/dnw2iim2mz3B/OQ9CrSbPcQHjg5/8VPY8qvOZxLmjuOEfr72M2rVi57plqldnr+TlwZLUOF/OPdwAv8T3ZELjx0nYpJhF1zM3pZQbFXBY4MlsLa3lOvKjsJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COKsYhvPGUW5NwL2cFgAT58uEM2fcZfP8uGbnC27A/Q=;
 b=gekfbw1tbiUELsLm1pOohpESP/vkARZ7Lox4IG9vfVwHPc3zUCK2b5Mx0M5mh3UzbdEne+n4oHEM0qy36ddZFeQHnOaG89Z/QbXOfP4tPsdmPtgMI6w5T0k4wGtawAavIqZhuqh02acqNig66BNAeY+HRgmRHM11jRy/wweEQwP2Mw8rhmjXeLDUBgorkTEXx3P5++/J+tNMMO6T/yXt/6mNEgDwloP3W9dd1n4jIoP54IyN9Dm+yLcl+P4WaL7VLY20QW+zSoJyjmoLkl1N/PfrzJ1NTeVm0mCCPoYC5aWjbziR5uBj3eF6xo0jWlsVV3YfauMSTVrN1D3T1rmuXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COKsYhvPGUW5NwL2cFgAT58uEM2fcZfP8uGbnC27A/Q=;
 b=L78KCJ/OKnbmrFII4/oCPnoCIC54UuNBKMOdQU8TO+EAN2jIYQUHsK2fxBZp8A4semeFj8qgeC7OJ7OBu6MF7Q/hRZ6/Sbz5vIae/4Av21/ILSeMFjjC40BrqSZiLCE8owKicHX7rTx43ihx6rr+BulZa0vNEW/KUEa5FK8cRkg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB7PR02MB5001.eurprd02.prod.outlook.com (2603:10a6:10:33::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Mon, 1 Feb
 2021 09:09:31 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3805.026; Mon, 1 Feb 2021
 09:09:31 +0000
Subject: Re: [PATCH i2c-next v3 3/6] i2c: mux: mlxcpld: Rename mux ids array
To:     Vadim Pasternak <vadimp@nvidia.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org
References: <20210130173447.26328-1-vadimp@nvidia.com>
 <20210130173447.26328-4-vadimp@nvidia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <806db21a-df44-d44d-497a-4e83030dd4e2@axentia.se>
Date:   Mon, 1 Feb 2021 10:09:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210130173447.26328-4-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR08CA0057.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::28) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR08CA0057.eurprd08.prod.outlook.com (2603:10a6:7:2a::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Mon, 1 Feb 2021 09:09:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2475cd38-cd5f-4f7c-506f-08d8c691161e
X-MS-TrafficTypeDiagnostic: DB7PR02MB5001:
X-Microsoft-Antispam-PRVS: <DB7PR02MB5001CB818C7E9CD96F221580BCB69@DB7PR02MB5001.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TACrArVD6Q7Wz9ke/BhSmaj1kBIx8VFfLwAQI/SL01m5QJshlIVSppi0QDR85vHpzwUH+UzOev1WIfJZR6WNPwEbb6nNQwy/2MOpJTT45cXriHYwXPy8bk8xyrgJnU0RC8Gl3pewneotC7d4l7ijqeqBtyArTmEcWVZPDTEJWkoOjAXI4+XZ1rDVOyAiy6ATraVYi5uM25TUPKqWXHG+9nzZaa/Hq5PXRga/DNgCtHhwH/yvcHQXNCoLk5ybrWWZajFfd3CmOOvM1YvDT3narCOvPX1fZxIp1cvLSMk1Yw6zHefBiIw2/rB+gWeVaAl87RAtvG+oHwxA8I4D49iUTecBq8KJ7OI+ngyvIM1Vcimo5hoUEizq0CAzwCUDT7Hdq9FRHEkEZJRAokFn3U9nbo8HhFcsNrn+vvtmaJRRfEkQgfhz3HAAixy5gmBRwgvq2xWdJ/dVT24a0kIbib53IU/BAVHSSwq0S7VwPm9ypSpdeasbdbXbdNJA9j2/gt8WAE5CeEJ7m6po6MSlVi4z1ajqTlc2ghBvhlK8II2Ky90oe2FwlaiNaeb5EzCJrSIYWAE4nRCr0jBMVqpMClLx/BcY+VPCP5MPPbWbkzfQGIdqa0YvWM5EdcEXxEjUzpwg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(136003)(376002)(346002)(39830400003)(186003)(86362001)(31696002)(5660300002)(478600001)(16526019)(4326008)(6486002)(6666004)(26005)(956004)(36756003)(2616005)(16576012)(8936002)(83380400001)(31686004)(2906002)(36916002)(53546011)(66556008)(316002)(8676002)(66476007)(66946007)(133343001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?azIvbFdSQVhPQ2tqWTRHREVGUXJTK1ZsWkVkUGxQMGtmNEk0TTV1UlVtdlla?=
 =?utf-8?B?RjdUU3VWMjJpNHd3THlpaXNQVFRmdlZYRWN6T0lOVmE2Z1BrUGNhN1U0SzhJ?=
 =?utf-8?B?NVJMMEZmVHdEeXBYTmFPejY2Q2lhTFg1OTA1bjJUemlFVHJETCthSXRkUUtk?=
 =?utf-8?B?OHpVQ1JQL1NMa2dEdzI0QWU2RHRXYXhvUHNFZ09xOHhWNVluRi83eEtjQXBP?=
 =?utf-8?B?S2M5YXMrS2c1Mkg3NWJ4ZG5FZ1AvOUdWa2JYOFc2SjdhUXZoN0l3Y01JQ2cr?=
 =?utf-8?B?eWNwZzUrOVpCanVRblJRMUF3NlRVMGt0c0ErcG1kZFRET0NzaSsyYy9PZXlo?=
 =?utf-8?B?QlZNRW5Bdmp5dHBPZDBvVkFkQnp4NW9GWDJvKys3cW53ekF2a2hDT2JWOWRY?=
 =?utf-8?B?K3Fha3lrdm5TL2E2MlJObHdIVWxNRGp2ZlEwcVVkeDhuQnZaYldXVHNXeXRR?=
 =?utf-8?B?WXBqZTVXMldHSHZNZk9sUDRWaXZvNVdVN0dUcVhSL1lqSVJPY3lhUE82aWQ2?=
 =?utf-8?B?R3NZWG14ay9rUkJVY09UYW03UE5yUkF4RjlmZEQ2U3ZRYjRBWnBlc01sU2h5?=
 =?utf-8?B?UVhwcVpzeExEbjU2Q2RXaWNBek1hLy9NRnMrQ1RiWVpLbWlacDNYaHRobk15?=
 =?utf-8?B?VWFCNWpTeDNyR2R3UW4zRitBaW9YbEQxY0poeDFMMldMV0ltVVhOZHJCczFz?=
 =?utf-8?B?M3NVaDVGNGgyUk9teEpNRzcwaFhkd1Jhbmdmb0xkeEVBT0Z6SmZ2THpReDFY?=
 =?utf-8?B?SGtWMjZTSWFVckxYSnhid2tnbFhoeThoV2VuN0ZneGV0QkNON0twalFzWkVw?=
 =?utf-8?B?ODArSlJEU0tXREpRSnNQdXNENWhuNHV6Yk91d1Q3QkY0ejgyVGhKL1VCTkI1?=
 =?utf-8?B?cU9scSt4SEkrNHdtR2YvKzRiaVdWVHVId0Zrc20rcXA2K0MxQ0hSNm1vWExo?=
 =?utf-8?B?czZBM0EwQ29RU1ZEMldpWmhzRStldkJnNUxidmp4QWY2N250cnFHd0NnQnRT?=
 =?utf-8?B?OVc0WVZHQmRmTzlOZFpEY2RDV0F6cWxuZDAyWnpmVERkQXVmRlBYZWlyWDJU?=
 =?utf-8?B?d3kyRXY4clFJMHVhV2JWWk41RDlaS3A1TDRHK3phaVZUOTE1elQwQWh1UnhQ?=
 =?utf-8?B?V0JvZ2xzQk5XNEFKc0IyaHM2ZUZyVm5oR0U5dU5mSUd2U1FlSDRKVHFWTXlG?=
 =?utf-8?B?akNHdThNUkZLSFEzQ2drZDB1NzI1WHZNRWJFVWdTNDdZZW8ya2dFR240Vjl0?=
 =?utf-8?B?MzZsaTNoYjhTVDlaNmN1d1NJZ3EzbU93S09wK3Z3RWlNNmRMeUdWTGR5S1Mv?=
 =?utf-8?B?Yzc4UWE1MTEraTZ5UUZXcEEwSGZlb2lOM0h4ejJpZnp0b2RIbzRpVzVwdTk4?=
 =?utf-8?B?QWRubDhmdEhTQW00RlRoRXhsSlR3VFpHK2RlRFZHVGg3bXNOL2tiVU1Md3hi?=
 =?utf-8?Q?gga+XXsg?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 2475cd38-cd5f-4f7c-506f-08d8c691161e
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 09:09:31.8207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWSBDrC4rFU9cCVNMLvM+KRoj0+UdycxCpO8L0H6xrUjmDehNt0ufk6E25xZbv4G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB5001
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

On 2021-01-30 18:34, Vadim Pasternak wrote:
> Rename mux ids array from 'adap_ids' to 'chan_ids'.
> The motivation is to prepare infrastructure to be able to:
> - Create only the child adapters which are actually needed - for which
>   channel ids are specified.
> - To assign 'nrs' to these child adapters dynamically, with no 'nr'
>   enforcement.

The series is starting to take shape!

However, it's still bad to only change the name of adap_id to chan_id
here. I.e., the division between 3/6 and 5/6 makes no sense at all.
For as long as the variable is used to fill in the force_nr argument of
i2c_mux_add_adapter, the name adap_id makes sense. It's only when the
variable is used to fill in the chan_id argument of that function that
the name chan_id makes more sense.

See, it is not just a rename, in the end you have changed the meaning.
You should change the name at the same time you change the semantics.

I.e., this patch needs to include the parts of 5/6 that deals with
argument two and three of the i2c_mux_add_adapter call (but not the
parts that deal with the CPLD_MUX_MAX_NCHANS to pdata->num_adaps
transition, I feel that should remain a separate patch).

Cheers,
Peter

> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 2 +-
>  include/linux/platform_data/mlxcpld.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> index 113ad84cdd94..9e9d74bd1059 100644
> --- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> +++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> @@ -130,7 +130,7 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
>  			/* discard unconfigured channels */
>  			break;
>  
> -		force = pdata->adap_ids[num];
> +		force = pdata->chan_ids[num];
>  
>  		err = i2c_mux_add_adapter(muxc, force, num, 0);
>  		if (err)
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
