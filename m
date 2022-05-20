Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3658952EB0D
	for <lists+linux-i2c@lfdr.de>; Fri, 20 May 2022 13:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348618AbiETLme (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 May 2022 07:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348594AbiETLmb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 May 2022 07:42:31 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140117.outbound.protection.outlook.com [40.107.14.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B2E8FF96;
        Fri, 20 May 2022 04:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwLzr+Onwamu1kn9WhttfjaIW6Pr/3wpThgFurSWfUVA9tmvii2ZRz2Jv3EpgoTic3sHk4OBU6SnWqLDnmDDBWT0D6A2JXJV1TKJT2KNIXHzv0zMQO8nb/k9HqNEfLDga4+C+9N+weuU8lkXuIAV7YU0h/sP1ex+2u+hPNJCpngx3RQ9DCY16uFpmX44DdyXkibJzyRR+4GvkVMGO+6hIrgqEt4+vsAagGbcYHlBuoS7zcqNR3tJ/E7XZb5DVSV4qoVbuh4mVWDyO9VkGNZAM9E5az0uqS2gjwZrqRTHNNHMI0xIe18MpUUlwZxLs/bA+7M20+15eBqWCBGZlab2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUhnJ6aIQcdn/MniEnZVZ1cTO2nNN2gtIws6wMsHr+U=;
 b=MujS9QMbKA3ve0nnidkT/egUVKNaMzxPebRZ7e8LsvBZGDzqr38hSpupvwmiIGOGzf2ZXVUrDv5chcPGsDn5g2i3GWwcB20UIGfIj2CYYEVGOPgHa8nVXO33n66IRVL0FTzmeBkW4V99TtiCjQdKJfFv8J4BAOi8JwV2U0VuVEJC9eSrESslfnJARFOv2yvY0IwbD2BvlZo0ok3sjDaTXjdhGBIoH1T7+WZKYm18f0NAY2EOvENmCLQkmNcKpeKhg6DIxgGgti6MCooHPXgrRQ041Ug/n8KQ9cSi1AzmaLFjmXkxqAj1glwVv6fHWiqfb/eUiFqCmPI5jnoT4Zdrgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUhnJ6aIQcdn/MniEnZVZ1cTO2nNN2gtIws6wMsHr+U=;
 b=CeciRMzekeiXq6dIB3LnIjqUwCesOXK8LSCsoao0fF6vxZXkoLikek/KIWBrHAJjqCuQy9aiE7xNEZQPGaVME9UdBdI53I4SqzRMyWABkAG4PUasNXg8u1wfswFtlllo+yHufx2omFAZT9riFg5kxEnzg0nA5EW4KQ7Un8LbXds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AM0PR02MB3777.eurprd02.prod.outlook.com (2603:10a6:208:46::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 11:42:25 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::dcef:9022:d307:3e8a]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::dcef:9022:d307:3e8a%4]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 11:42:25 +0000
Message-ID: <5f17793b-1008-f78d-6b4c-771e779b7920@axentia.se>
Date:   Fri, 20 May 2022 13:42:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC 1/2] i2c: core: Add adapter transfer callback
Content-Language: sv
To:     Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        jic23@kernel.org, lars@metafoo.de, wsa@kernel.org,
        milton@us.ibm.com
References: <20220518204119.38943-1-eajames@linux.ibm.com>
 <20220518204119.38943-2-eajames@linux.ibm.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220518204119.38943-2-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0064.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::16) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4454604-b73b-48bf-3b40-08da3a55cf96
X-MS-TrafficTypeDiagnostic: AM0PR02MB3777:EE_
X-Microsoft-Antispam-PRVS: <AM0PR02MB3777144D828CDC2B93A9F8F7BCD39@AM0PR02MB3777.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GgXfaWlVWxTwFDY8dtizvXTsLzk6hnsd+O79WW6MnkKlmVOnhCDetsbwOVMSKYc58mJPyVQZbKa6cRSAJxrmE2ydvNn0KB+kmItGLe0xD8EtcK4j+Z8zrnw6uZ0bJCNzVih73676edqMUGy82YwCzuTalpueLziMGemAxMzQAUfN4MK0oTNJOn4kiUpFKmFI6em1L5fyfsGW+/B+WpvhDytGWEFFoVni71rlyd09Anbc05MQfWoPTHt2hj1FhAnryRNfwEjyRbzAodhzENBiQjBHTcG9gQJh4jqcKwg+/awiehreOU1SdB4eDoqQNzuWQ7FPBITCKPn5V32nZSj6kyAMKiv5hzp40mBzfTE9aFdCiB24nWm1V6zwOpDEm8K26EFp84D+pjGBdZGSExOt3qaItaiudvSe6BlCrdBf6JQvfpyTnSkaKgJ7ohGMb/mSiGZ7foDCOr5AqjF7eUiJmz9DPuPrji17YQwCSSl0VFI8nshqHuNsdVxCwqaKUz4Gx/A326rKiIhIAF0TMugRDRRkb3Dm9MvgWTEB74gg9oq1b1awdyeP1lA37qiq7jD5rlBRKCgSWCe1IyRtW9m91qtK7D1Be9vldHA90jVwn6YF2n6tVIMpByn9eW93bJ0Ljldig3YTCG1xydRVLLKPACKdb8BSsOW/DP1qA3sT3CY+ba7I3PJ1uBQiDzKj1+PXGNbFw/aq8Aj3TRSOhtZ+RLWzVjJZNFVOu5M33OyyE1I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(39840400004)(376002)(136003)(396003)(366004)(346002)(6486002)(8676002)(2906002)(86362001)(66476007)(508600001)(316002)(31696002)(83380400001)(66946007)(66556008)(36756003)(8936002)(31686004)(41300700001)(6512007)(186003)(2616005)(5660300002)(6506007)(4326008)(38100700002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnRQRGRXNU5ZY0M5bmhKc2ExaThSSEo0Y2tvVFJzWXJPSDFUbVBHanpoWWNK?=
 =?utf-8?B?ZzFSREh5NUVLY0VKRDlybHRTRVp5U1V3a3NXOXZaQ2JCMXRZWEtsZE9QU3k4?=
 =?utf-8?B?K3h6elJ6OEk1THE0cEoveTJLSW13a0VmZU1XSHJ1UFpOQnl4UmY0d2k2VldB?=
 =?utf-8?B?MDF2MGNnV3JGSXpXOHhlSjZwZ25PVGFhdHhsd2syWlp6WXNBTFlDVmwvVWVR?=
 =?utf-8?B?NWNxTWZwMnp6RHpKeEN3eVdFUkNNajhtUXloSUdiSHFZa3J4MWxyRW91SnJO?=
 =?utf-8?B?Z0xYQ0dkZndIZ284RHBKdGRVMSs3dDJyZ2lld1B5NDA0T05RUm9JMmVqMUUy?=
 =?utf-8?B?MjMydkhkdU5SejFXYTBtWnI2alBsRTdTMEd6QzBZNE93RU5MWTJucmZYR0ZY?=
 =?utf-8?B?akhQMFVhMURkQnJsOHdRRXdyQnUwcEpoN3A2YWJ3ZjExK3JGeXJjMEFOM0Z2?=
 =?utf-8?B?V0toME55cVphSTROcTF0Q3pyTHZnQkQ4b0dRKzg0RWF0WmZDS0E2VHFIK0FX?=
 =?utf-8?B?NzdJVi8rWTZxZ3Rsc29SNlE2Z3NqSVFKWkEzaG52dWNBa2FsaVMyQXNsbSta?=
 =?utf-8?B?TUxoTERJTG5KeU9IME0wSlZoWG1XSjBMYm5GNmxZaWVuV1JuSEZmRmNmcWNk?=
 =?utf-8?B?dHN1YmQzRDU0QWN3dGlUTlA3eHBRYUEwM01rQXRJYTJyUmNxMTFMUUd0dEZT?=
 =?utf-8?B?L0dNK1VDeFZ5Q29rUjlPR0ZzdVA1QWVWMjN6cFpkdWxnUlZVbk8xczNrc1Zt?=
 =?utf-8?B?b091Tk5SaVBPRFdsUWxmWU9ZU1lrSVpUVzVrRFFaNkloOUlrcWExV01ZMGZt?=
 =?utf-8?B?QmsvWWhiSHN6SU5xVHhRYTZhbHNhWVQ3ZHlZc0EzaklrbDVZTXNPVEtWUHNi?=
 =?utf-8?B?SW9xMmtEc29mSVZWWFFnUkxrNm9wK1lHV2ZKRWgrZWV6UytSdStYU21iYXRU?=
 =?utf-8?B?bDIrbFRiZWJ4OE52V0ZVVkduVFBWK3dMbE1ZR1BETnRQM2VTc3lHdmUrY1U2?=
 =?utf-8?B?NDNzd3N3aFAra2EzRUYvY000OEZZaXlXZ3FJSVBRd3VSSkxrb2VYWEJsaU1x?=
 =?utf-8?B?c2ExL3hRVVo2c0t0VmE1dk1lMWlRSW5FdU8rQ0dQeVhPYWdiaERxMi9XdU1i?=
 =?utf-8?B?TWs2bXF3c1ZwQW1KWmtoOURWSFF3WVBCRGVXTVZrMzdkZTlKZGMwandaRC94?=
 =?utf-8?B?RFUrZlhJb2o2bkNUUGxuV3ZoWndhUWlnMHlEMXVEa1lNSUxIYkhqZ2NOMi9n?=
 =?utf-8?B?VlpLSWo1S3A5UWtuYWlDeFo4cVl1cm5lemhYMFZ6d0dTeWIzRzFJc2tiVXBF?=
 =?utf-8?B?b3NLRW5aZUpXY0M1YmJjMDlNOUxOL3QwRjZ3WVNkZkNHYzBPQkVlYWh1cHpC?=
 =?utf-8?B?cW9pUytTenFKYzBuQkoxWVQ3Y3lKamRJNGwxdy9FenJnTTVQUEZRTjc0QVk2?=
 =?utf-8?B?a0puYTlBSlVCZlVYTWpvZ01ZNFZLUTVhNnV1ZnBtU0RaeFE3d3NDT2k4SEUz?=
 =?utf-8?B?a3VzME9PRm9QOWt2MHpYaGV4TFN4em1KQTltbnlTNUp1bDRJYmZKQmhKY0ZY?=
 =?utf-8?B?MVcyOWJLSEo5V1dlc0NsZ1h6U3pvTitGZFY2QTVGNkJOVG1OOTZISVhsK3JS?=
 =?utf-8?B?OEVvSVhBWDk1dVpzRWVSOU9PRHlabFBrNWY3cmdEZE0vVk14ajBvSlRpQU1k?=
 =?utf-8?B?WUZKYVA1SGZhMytsUDhlOURMSElEdk9YQzJWMTNadVhDbXA5UFVVeHRHWmo0?=
 =?utf-8?B?SUl5OEFUbUhWZktXSjg3cHdwc05sWFVvZlVEYVc4NGVDdG9rWmh3bitUMExj?=
 =?utf-8?B?NWlyNDVPNTJhUTFsOTN2MjdTaG1mZ0JoYTl5REhoRlVUQXBYYU5sU1A5U2xZ?=
 =?utf-8?B?ZzQ0djBkQStyME1tTkRhVzVDQkdPckNVT015ZVRoVlJGSEhDYnNVOWZrVEFQ?=
 =?utf-8?B?eWZISmwrc09Vd0JBWm1QSFF2TnRsRXEzTkRkdEY5Qmk4bS8wOG5EbDA1RHRN?=
 =?utf-8?B?enNDeXUxUVA0aVlmMGhtUjFiVDdXc0YrN0NKRTB4MktDYldFNWc0QnhENzhw?=
 =?utf-8?B?K3ZvMW0xcW9aelBhYnh6V2NGYktPU0FCdXhsdkNaKzlYTDN3Y1J5eHFVNEgw?=
 =?utf-8?B?Q2xiVnpEdFFJNklHSHNuRnBKRklMY2NoczBRVWxZdS94WG9PTmJvT21BTnMv?=
 =?utf-8?B?Y1IxUCtaYzNTOHZmdFFkRVcxRmVmUVZZcEtMN1FmOXByT0NRVFVWdXZsWVhC?=
 =?utf-8?B?dEJPbVdweUFoREJ6ZlByWFI1UG81OW15c3d5M0NseGNLbWhaeFBzYlgxenVP?=
 =?utf-8?B?akVtWVFVZXh0bXVlNCttWjUrTmQyVkdSSEsxMXpQMmxCajZma1FXUT09?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: e4454604-b73b-48bf-3b40-08da3a55cf96
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 11:42:25.7113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTmPFkI0zxymQAtQxnhwCtlkIclw6sVfg7TFxy3QqbmvNQ8qvOZLwJSTWOmtvPHs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3777
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2022-05-18 at 22:41, Eddie James wrote:
> Add a callback function pointer to be executed after the adapter
> performs a transfer. The purpose of such a callback is for a client
> to execute some code while "owning" the bus entirely. Holding the
> adapter lock is insufficient in the case where the client is behind a
> mux, as the mux driver could perform mux selection operations on the
> bus while locked.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/i2c/i2c-core-base.c |  3 +++
>  include/linux/i2c.h         | 25 +++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index d43db2c3876e..a46bfee2d845 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2128,6 +2128,9 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>  		trace_i2c_result(adap, num, ret);
>  	}
>  
> +	if (adap->xfer_callback)
> +		adap->xfer_callback(adap->xfer_data, ret);
> +

Have you actually tested this_ Because it is not handling your issue
AFAICT. The master_xfer for muxes include the select/deselect which
(potentially) does xfers on the parent bus, so your hook is in the
wrong place when a I2C mux is involved.

Also, the hook should probably trigger for SMBus xfers.

Cheers,
Peter

>  	return ret;
>  }
>  EXPORT_SYMBOL(__i2c_transfer);
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index fbda5ada2afc..ea773f2ee9c8 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -747,6 +747,9 @@ struct i2c_adapter {
>  
>  	struct irq_domain *host_notify_domain;
>  	struct regulator *bus_regulator;
> +
> +	void (*xfer_callback)(void *data, int xfer_rc);
> +	void *xfer_data;
>  };
>  #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
>  
> @@ -814,6 +817,7 @@ i2c_trylock_bus(struct i2c_adapter *adapter, unsigned int flags)
>  static inline void
>  i2c_unlock_bus(struct i2c_adapter *adapter, unsigned int flags)
>  {
> +	adapter->xfer_callback = NULL;
>  	adapter->lock_ops->unlock_bus(adapter, flags);
>  }
>  
> @@ -849,6 +853,27 @@ static inline void i2c_mark_adapter_resumed(struct i2c_adapter *adap)
>  	i2c_unlock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
>  }
>  
> +/**
> + * i2c_adapter_xfer_callback - Register a callback function that is executed
> + *			       when a transfer completes.
> + * @adap: Adapter to which the callback function will be registered
> + * @cb: The callback function pointer
> + * @data: The data to pass to the callback function
> + *
> + * This function should be called with the adapter locked with
> + * I2C_LOCK_ROOT_ADAPTER to ensure that the whole bus is idle while the
> + * callback executes.
> + * The callback is automatically removed when the bus is unlocked to avoid
> + * spurious executions of the callback.
> + */
> +static inline void i2c_adapter_xfer_callback(struct i2c_adapter *adap,
> +					     void (*cb)(void *data, int rc),
> +					     void *data)
> +{
> +	adap->xfer_callback = cb;
> +	adap->xfer_data = data;
> +}
> +
>  /* i2c adapter classes (bitmask) */
>  #define I2C_CLASS_HWMON		(1<<0)	/* lm_sensors, ... */
>  #define I2C_CLASS_DDC		(1<<3)	/* DDC bus on graphics adapters */
