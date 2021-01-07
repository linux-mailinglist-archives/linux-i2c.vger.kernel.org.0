Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6804C2ECD8E
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jan 2021 11:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbhAGKLA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jan 2021 05:11:00 -0500
Received: from mail-eopbgr30134.outbound.protection.outlook.com ([40.107.3.134]:18223
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726313AbhAGKK7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 7 Jan 2021 05:10:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/YL7avY2uqznBqJc4oZCOeC+6eDgY/jwa3A1KLNp+lF6crVS9VKXxtkKT5jX72gtovLeBzk7YNGMQSn7MRO8l/1bi64ai/oKAHVf83On3Zi7Y9C+Z/6SdcP3in5SuwME1XTkO+DKIjQcBMvJVtdwNtTD5nLyykhF6cMFwaCr2GmmCvgMFGrt8Wz44Il+8ECbkPS1rWh8HQH+fseo2tY/Pqas+nVoA4HRolNhyA9WWXsT9sV5m6aqg5jdNr+N+j1I8hDeLjLvnEacOgxvW1AWq+0tY1FcJMDaxmzVl9jcJvASWMUZ6ZFABY0KJFN7BtCxVBorFVCSS4JwTQR9XpDSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUbeRnkJBRx5P7rd2ZxBEEPorK7WlMUcqfOB+Gb0SOM=;
 b=LWHqurgALytEtpVcgfiUDey1NdZmLj75WB5P01vBoKbWKI8FMEIUNliW1Hk76ols2u3mXZAY+T/o9SDurs9yEmpLEaBPdutbDLua8sa6SNCzXNBkjUhqXFGyeABR6BwbP7zZuDNDs+DgmHpkBMAWZ0SEqEztvRYQxNhJEii1F70maX6ZZKtJWL0zcJHiQsV4MRn2gUc0yPO9H3E8fk/idKslygxqd5Y1QjEvQnA3ihFg6F2ALdUacIgp+R890oVds/jIuWLfn3hotmXxI+b7iRaoAQUq4d6Tm+o8VGMCTrCCZCyw/zuSZ2SP5YB5DbMzZyxbBqJQBqEZeC0Od1ywTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUbeRnkJBRx5P7rd2ZxBEEPorK7WlMUcqfOB+Gb0SOM=;
 b=VDQw03eD68CdF/NCqUoao0JgF0iGSBu+BuR06mgugBDifcDeS5H0nBgbCxdXNkl9Akp72kFA7nmCq9OrXmCOwqDuTLGlPyhsMbh9UU9uFzcTSD75YO/bUIsDnA7xTI+oZbP8Afs8xQZ3bFz7qP3QmQ0GrvuWmG6TaRzGtDaM+rw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB6PR0201MB2454.eurprd02.prod.outlook.com (2603:10a6:4:34::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 10:10:07 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::7975:bb50:c24:9e4f%6]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 10:10:07 +0000
Subject: Re: [Re-send: PATCH i2c-next 6/6] i2c: mux: mlxcpld: Extend supported
 mux number
To:     Vadim Pasternak <vadimp@nvidia.com>, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org
References: <20201118144416.184120-1-vadimp@nvidia.com>
 <20201118144416.184120-7-vadimp@nvidia.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <3102e30c-2f1d-8a41-27ee-a8c2dc949674@axentia.se>
Date:   Thu, 7 Jan 2021 11:10:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20201118144416.184120-7-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.233]
X-ClientProxiedBy: HE1PR1001CA0007.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:3:f7::17) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.233) by HE1PR1001CA0007.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:3:f7::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 10:10:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aefee296-4d0d-4745-3486-08d8b2f4691e
X-MS-TrafficTypeDiagnostic: DB6PR0201MB2454:
X-Microsoft-Antispam-PRVS: <DB6PR0201MB24549F506CD4E9E9202846CEBCAF0@DB6PR0201MB2454.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CkUmfpMFy55d+brvf6O8HZ2rE+Bo0BofbLrIxpmC7eRa1B0QSr20UZmub0zfAcP0f9npkick4GkdMfE0ydYFUKQrN3AkSsxD9NT2mgir5DGKXOlPkvKoPZGn5RpAuu+Vr11OoosyfTD6QY/+96UFWCbY1/kMPX5Mkz52KkX+tlTSRJ8jomeHJRcuvfj828b9cgLsBuxQ3JB3DUq73lG2Bhkct6c6zucq85z0P0HjkzwK0CEf5b/fwisnROPX0cNpDT7GJxaK0sh8pSgBXKZ4kntEL4Vx81FIXsjuPH6Nbc1rdgNim0uKRKmeaNiSvw+F0tMya2kEerVYKy1Nb1QlBL85+nsxaxGXqBfxhqshz8inr8CDE4qxmlfCmmKt+ZtH5LifWR2qsnTjK6oTa/heF0VdKjuzybKA5JqlWRHBr5+6kxVExKthO2OQkFbsS+1yT5Y0JzOpffKsYgKO7egX//2ffbYKeKpGe+8VRkdVj0b4ZYjl7rhlQdupluuJoUNP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(39830400003)(396003)(366004)(376002)(66556008)(956004)(2616005)(4326008)(31696002)(16576012)(316002)(8936002)(16526019)(26005)(4001150100001)(66946007)(186003)(2906002)(66476007)(53546011)(36916002)(5660300002)(8676002)(83380400001)(6486002)(31686004)(36756003)(86362001)(478600001)(133343001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SGU3Skh6ckJTV3NWNnlNdk91K2N0N0tiSXJYVGZTZmxmbkttQ3ZrOHM0ZGhZ?=
 =?utf-8?B?RXVXOTQ2dlgyU081MGFKeWZkeVZiN2hLOXBVbkJYMHRZWVNyaDlaVEdqR1Zu?=
 =?utf-8?B?VjcyemhWd0dmRlRncllOcHQ2N2x3c3ZNeFZRcGxkRWk3cFRqTEdmM1gvcC8x?=
 =?utf-8?B?QVAwWk4zaUYzSUI0dGhtQVVaU21mU0VkaGFIbTNXOVpseWV0VjMyV05acENa?=
 =?utf-8?B?eTFJWllMKzVLQlA4c3VvRE55czZHT2RCcXYzdTRDR2Z3blJLMkQrL3dDV3JI?=
 =?utf-8?B?aFVVWjErQk5rMEMzMEMvdFFsOFhlZWZ2b1NHSm1EK25LcUVNU0J5SmpwZW5m?=
 =?utf-8?B?aXdxaWFWeDR5QXdVYXJyZTVoUVZKWkNMdGNnYzhDWHpBMUFZZ3FHSjEzdWE2?=
 =?utf-8?B?ZUMwU1JqOWdQT0RoTXIyV21hQ0FVbGVGRDFtOUtZUVhEemViMkl6VHh6ZzV4?=
 =?utf-8?B?eTlxVjlYZzZIazZnU3padWY5YWI2U3NwTFcybEVackVrWkRxNjcrdU45cXF3?=
 =?utf-8?B?MDFhajkrcHp4TkoxTm5SanZPcTBrekdHMnRtZnJ2aXN5UmZJMHJsMDBENlFP?=
 =?utf-8?B?V1BrTDgyM0psZnIwVVBRYmJzcGZCQXlHTXArdGdqZzBZVjhkS2ZudVIzOVVS?=
 =?utf-8?B?elpPeTVQcHFZQWpLNkd6TVJWaS96a3luR0x4NjNXL1ZibVc1T2g1RVlnUnpr?=
 =?utf-8?B?VXhkckNPVVREMStGbFRCNkJZVEtaVzdFVmptUkRjVDZKUUM3WmxOSjZvNGox?=
 =?utf-8?B?eHRRbFp6Y3QzNUxRaVY5MmllQWtrWDE2bkc0N1JuWVMvcXZQaVI2RUU1dWJI?=
 =?utf-8?B?VUtTeFJRNGo5QmFrRnlTclpYQURuVWJ1UG0yNnNBR1AvYWZXV3dyREZUK2VF?=
 =?utf-8?B?M09RQ1pBVVFBVmJlRXlPd3g0T0Rrb1VOQXpxMUUxdVk2ZzZ1TTFaNGlxaWxK?=
 =?utf-8?B?Miszek5walN3Q3NRc2FRM0ZhYSszN2dmNkY0M0xvc0NacTBocEtPWms1TjYx?=
 =?utf-8?B?RzJPM1JPTHFhR1R0Y2NFeHFVSkppM0ZJb2JOZmVyQmlvNVBmOWRnOVF5Ykl6?=
 =?utf-8?B?Mnk3MEFpRDcrZm1FYSt4eFZMOEZxTVBoNlBJdkMvOWd3WFFUdGFRVzdPMzg4?=
 =?utf-8?B?Wmo3aWdsenRwYlNpWEkxOVhpUStlVHhyQXVQY3FYdlVWNHFJYXhOakJFdHc2?=
 =?utf-8?B?VlhSczUzS0kwa0JIcWJJMERGdXRiR1c0VHF1R1JVaFRhWE9xaTJhdmw4M2hC?=
 =?utf-8?B?TXZIL0hVMGgyK1Jjd2c5L3ZUSXBBOXYwdlVXQzJkOGlib2w4RVVZOVJLUVY3?=
 =?utf-8?Q?95D4yZK/rdaD9IL+yrf3m5yWxqsfEwHDW1?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 10:10:07.7267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-Network-Message-Id: aefee296-4d0d-4745-3486-08d8b2f4691e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdwRE+Iwa4IYTjCa6T+CsAif9y5WNsk5B0HxrRy3IyE5dfVemsz6xw9ujg9ag/mn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0201MB2454
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

Sorry for the late review.

On 2020-11-18 15:44, Vadim Pasternak wrote:
> Allow to extend mux number supported by driver.
> Currently it is limited by eight, which is not enough for new coming
> Mellanox modular system with line cards, which require up to 64 mux
> support.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
> ---
>  drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 17 +++++------------
>  include/linux/platform_data/mlxcpld.h |  3 +++
>  2 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> index c76180919fc3..760636b507fa 100644
> --- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> +++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
> @@ -15,8 +15,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  
> -#define CPLD_MUX_MAX_NCHANS	8
> -
>  /* mlxcpld_mux - mux control structure:
>   * @last_chan - last register value
>   * @client - I2C device client
> @@ -24,7 +22,7 @@
>   * @sel_buf: I2C message buffer for mux select 16 bits transactions
>   */
>  struct mlxcpld_mux {
> -	u8 last_chan;
> +	int last_chan;
>  	struct i2c_client *client;
>  	struct mlxcpld_mux_plat_data pdata;
>  	u8 sel_buf[3];
> @@ -94,7 +92,6 @@ static int mlxcpld_mux_select_chan(struct i2c_mux_core *muxc, u32 chan)
>  	int err = 0;
>  
>  	/* Only select the channel if its different from the last channel */
> -	chan++;

This breaks a property of _deselect which previously always triggered a write to the
register. It's also a subtle change without any motivation. How is this connected to
extending the mux channel count?

>  	if (mux->last_chan != chan) {
>  		err = mlxcpld_mux_reg_write(muxc->parent, mux, chan);
>  		mux->last_chan = err < 0 ? 0 : chan;
> @@ -143,7 +140,7 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
>  	if (!i2c_check_functionality(client->adapter, func))
>  		return -ENODEV;
>  
> -	muxc = i2c_mux_alloc(client->adapter, &pdev->dev, CPLD_MUX_MAX_NCHANS,
> +	muxc = i2c_mux_alloc(client->adapter, &pdev->dev, pdata->num_adaps,
>  			     sizeof(*data), 0, mlxcpld_mux_select_chan,
>  			     mlxcpld_mux_deselect);
>  	if (!muxc)
> @@ -158,13 +155,9 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
>  	data->last_chan = 0; /* force the first selection */
>  
>  	/* Create an adapter for each channel. */
> -	for (num = 0; num < CPLD_MUX_MAX_NCHANS; num++) {
> -		if (num >= pdata->num_adaps)
> -			/* discard unconfigured channels */
> -			break;
> -
> -		force = pdata->adap_ids[num];
> -
> +	for (num = 0; num < pdata->num_adaps; num++) {
> +		force = pdata->base_nr ? (pdata->base_nr +
> +			pdata->adap_ids[num]) : pdata->adap_ids[num];
>  		err = i2c_mux_add_adapter(muxc, force, num, 0);
>  		if (err)
>  			goto virt_reg_failed;
> diff --git a/include/linux/platform_data/mlxcpld.h b/include/linux/platform_data/mlxcpld.h
> index da4f7e8f5721..ea88817b3b35 100644
> --- a/include/linux/platform_data/mlxcpld.h
> +++ b/include/linux/platform_data/mlxcpld.h
> @@ -11,12 +11,15 @@
>  /* Platform data for the CPLD I2C multiplexers */
>  
>  /* mlxcpld_mux_plat_data - per mux data, used with i2c_register_board_info
> + * @base_nr: base I2C bus number to number adapters from or zero for setting
> + *	     to adap_ids vector
>   * @adap_ids - adapter array
>   * @num_adaps - number of adapters
>   * @sel_reg_addr - mux select register offset in CPLD space
>   * @reg_size: register size in bytes (default 0 - 1 byte data, 1 - 2 bytes data
>   */
>  struct mlxcpld_mux_plat_data {
> +	int base_nr;

The changes related to adding a base is not mentioned in the commit message. It's
totally unrelated to extending the number of supported channels, AFAICT.

Cheers,
Peter

>  	int *adap_ids;
>  	int num_adaps;
>  	int sel_reg_addr;
> 

