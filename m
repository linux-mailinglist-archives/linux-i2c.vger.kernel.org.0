Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60F705AFD24
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 09:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiIGHLA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 03:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiIGHK5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 03:10:57 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50100.outbound.protection.outlook.com [40.107.5.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49AAD7B1E6;
        Wed,  7 Sep 2022 00:10:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSmmGoG8qY7VcJL6BUyn1snfWfKwvetg0L4x3nkWLC3k/tgWzsxk2F+/Thpg7xRCKFnj+rdkRevgbtSDbs3vA8fnvXng/zlFrGzoUoYl3pS+A1MbYoRQFgdd2HAFa/2iRcD3nMs4b6sXMiWHJwLiTrCpQDU4jxqXEXsdWyO1c1D4rTOxfUUH6WGUpy/TfPNRnvrtgz5O32hd8NdJhZ/mSfZOqDmu0MQ0lxZ1HVNbn4SGPVOkWEMGQHjB1oKBuhAvBlW0dKS4ltSVDQ3gP+7dmesxao3O47Lo5VL+QEwWb8gZYpJgfAFtnGgfCUVww6YparpvZuvlKtCiWtLuBDA57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pqRzq/gxu8GsE1eNwqiHio4BDsAX/U+dm0/TMvhXRs=;
 b=jQqe0NlaseaABUdPtSP6sOxFjQ70VR82V6wDkjuzyfA6zD90xjL+Lq/dlpPCu/g1ZV5iojItpNwRt2+3z+gmleVP1A5S0H6c6JhwGa91ikw8bLs+HVfdCzmm+IxGRJBJz4ai9vNUpHC2+8TLUQvufI57lknsp9Mqs0yzvrEW7gjTaXNJydDfY7U2jmGKWR0EmsEJi4xNVnSbzAvImngGU09fu1aSvIvuw8Ega2KrXnQiIdGa/u0PYinS9ZcZwz8/4B9GgKXhea/3l4Y0RsNlftwyyJ9S4OllmT3yfQ/A6j/Uft9FSlXkO4CG5O+HwMrVlj295PmVHpkF/heddQ0Usw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pqRzq/gxu8GsE1eNwqiHio4BDsAX/U+dm0/TMvhXRs=;
 b=Gcd9R0hRPD47+yH4U6aYQkflyE8vfu6JfwVZQC30LNhDPriebKLL0e7MJGMpZxYMljJ9bRmbAsPKtaqKcqa78JuQ/oGP/SH+lDK2CcTyy6Gnu7NrdYYOR4ok1FWrGzI7i3DElhxu3LBTduPhiwEX/HdoSXo20Vk2bXPabWRHVFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by DB9PR02MB7916.eurprd02.prod.outlook.com (2603:10a6:10:33b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 07:10:51 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::1d88:3306:c280:3179%6]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 07:10:51 +0000
Message-ID: <31b44b63-4cf3-6fdd-b2b8-6f00070af89a@axentia.se>
Date:   Wed, 7 Sep 2022 09:10:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/2] iio: si7020: Lock root adapter to wait for reset
Content-Language: en-US
To:     Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org
Cc:     linux-iio@vger.kernel.org, wsa@kernel.org, jic23@kernel.org,
        lars@metafoo.de, miltonm@us.ibm.com, joel@jms.id.au,
        linux-kernel@vger.kernel.org
References: <20220906202829.1921114-1-eajames@linux.ibm.com>
 <20220906202829.1921114-3-eajames@linux.ibm.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20220906202829.1921114-3-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BEXP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::15)
 To AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa96388c-4460-4b3c-d091-08da90a018ff
X-MS-TrafficTypeDiagnostic: DB9PR02MB7916:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gCNTYsy+ScZBzs+3feTiGEFEZ2eF3BP0u4U9oM4/9XnQjQ6EZbwH2kTFbrbAwy1xU2q1vhilXcBug749Tl/SY1FOln7TnZwBZyMiMJ8rNm2m3J81z9WFAvQX+6m+hyuQRlkrQZEkrd6PDORhULS1HXDWUEVMPEstuo+icXvcXDBgscbU1UzHzTDFgpdpefa33puf3FdnRc1uKd7LDK15X6zRFewg+I3xJhsv9KRMmO0ErH2nYaaSR+Pv91CkkjQVLmg+CJay/kkj4tFqo0xjFlSaOkiDckq05PE5KCtklRrGoTcDdtR+eQf5cT28n12MpQY1LFnNyU3sG5v3PQZX4obIhz9tBRix9SuGpd3CYz5Nf2QfSSgDqqGtSdAlzZ3j+znkXbC27JvQ4XCdM71bNYfuVS+9emsVn1zzMJ0XcxYelrMnPXZqYPT8AyxBNDLXItz3FR6YC1+sPu6KOYZ7bqOlemjW/ws0L9cTmznNjAMMRZe9z7W1HnxzMhXw+Ba8gTha3CL08nmMSkmF/u6D/KeQ2pr0VPdl6Kb4/ou9/3dYsvhv+FxZTzRMF8m+S9cR0o1PVN+itGwj2u8Wf17XO5Cj77XfcDLdaZaEoIRK8tGeKlTjiYS8R9jo3ApgEzGKpeAnJMS24EaEj13JE98hfqG7Mm4zj18+UotzsfJf1jZxfeygvrTsaEhtHIb814l+jS0QHo/YIgw0I8vlMez+1/3NG+eT4UO21nidL8E4AuR5FGacP4044HfVBpGOjIuK2qee4zhK9/1KPrGhm+G/Xw0RrmcSTIEoCOxG1O7XYk9mn/awP5BZvAo6PbA6sMRU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39840400004)(366004)(396003)(376002)(346002)(136003)(66556008)(4326008)(478600001)(83380400001)(41300700001)(66946007)(186003)(2616005)(316002)(66476007)(31686004)(26005)(6512007)(6506007)(8676002)(36756003)(31696002)(86362001)(6486002)(2906002)(8936002)(5660300002)(966005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmo0NmZnWlZYYkhTTkg0Yk1Sam9KSHhjUFd6Z3V2TXpIcGRPWGdNeHFQc3Q0?=
 =?utf-8?B?d09hUi92d28yQkZ0UWZjQTIvUHlDQkJISFoxSjBEME9PeFVaZVkwa21oWDZB?=
 =?utf-8?B?TUl5c3dPSGwvd2pwKzg3UWJnVCtlTzJaL1NnUEY3aTQ2ZmpyWm9iaUVyUkpR?=
 =?utf-8?B?TEFUcW1kU1NhTzVNd0RseXVQejdKT0kvMFdvNjIzZnVTSDZubStVaUJTdFFU?=
 =?utf-8?B?aG9RSXJYV0swNndqMzNvUmxGWjFNdW5OWjduMUlMNW5wUDFQM3I3SGllcG44?=
 =?utf-8?B?di93Lzl2TExOajhYb1ZvaTZURWhKUmkwZ2ZudXMyOG1tUDdWNXhVYm9sTy9h?=
 =?utf-8?B?NTRReS9FMy84TFJzZFdYREhyaGtpS2tMUHpNcnp2ZmsyK0o2ZnYzQUZPZmdR?=
 =?utf-8?B?b0dqU3NZdUtDR055bGwxKzNaTXloQlg1WDVRQjNrV3pVclByVC8rZHFSZHhu?=
 =?utf-8?B?dnBYdkdWQkJXWlN5ZlBQS28xb213ZkVudHA3bnNEQUNYWDZpR0xjMlpzZ1ZV?=
 =?utf-8?B?SnNJVTgwRVVkb2NTdDYzRnY4K01NR1hKNE1WdGxBdWUwa2xHQlBDN3dJZHV3?=
 =?utf-8?B?bFpqMVFrSC9BcFZvQ2NtalhJdVdBYWRRaGt5aUsyN1VpTHA0a0xjY3BGbFdK?=
 =?utf-8?B?djVxSWI5WExlWWNvNFV3RXJSNFliSUxLYnhWOHlQbVNEUUVEUlZTTHlyRitu?=
 =?utf-8?B?R2l3NFFMSmxhb1RwNkkzeXEvSDVFeXpoNEtuS1czTUFraVY3MFJwWHRrNk5M?=
 =?utf-8?B?MkRWcDk1T0pDTFliRTVJQUd6cUR1b3ZwQms2RzBleHl2d0JlemJIaitjTnh0?=
 =?utf-8?B?NE1TY0o2SDFmbjZhZFh3K0xGelVYRTh0M2h4bXJoSHZRS3d5QVBIOUljdzdn?=
 =?utf-8?B?b2l1dEwwbHJWS2Y5M3FwZUEzY0F6MkJ5UTlObHVNeUpvZnU1TG1obFFaV3BF?=
 =?utf-8?B?b3pFZkxabUtvTHExOXZrQmdib2wwNEFiRDg4R3MxNk0xVy8wK3YvR0Y4RHNY?=
 =?utf-8?B?ckNpc1VtZE9aNDdkV3ZjaXByTkp2czBrT0Q1MUVyV05RdUFUWndLRG1GQmpl?=
 =?utf-8?B?anVnRE5UTmUyTklFWGVmN21lL1Zod3JvSUl1amlhOE1CbHEwZmFHamZ5TFpY?=
 =?utf-8?B?RVRSZVAwVkwySVNNS1ZjeHpZeFdLOWtvNzcrRFNaUmh6bFg1TTFCNm1oNmR2?=
 =?utf-8?B?ZjZLbmEwT2xQMHNkdTJNU3J5d1VKSEdCT1R6S1BJLzJsZ2M1Z2J4VW9qdWN0?=
 =?utf-8?B?RStxVnFrNUsvU2grMXVVam4wNEdzV0NKb04yNDExeGZ6U05DaE9oS0wwck5s?=
 =?utf-8?B?WXRuTlJNMHo5czNuK3M0U1h5eDBxYXFtKy9rb2lweHJVWjVreEU0ZkhTc0l5?=
 =?utf-8?B?Q2JOb296K3Y0cGZIOGlZTGVqN1VwSFZLN3pvdEdRbW92NkowQzdIVU92VmJn?=
 =?utf-8?B?L2trbWwzNEEyTjRIYW1ESEpWd0p3bk9LV21BdlN4dWwva1FEMGRzdytLTFM0?=
 =?utf-8?B?aHhJSDdKZlF4UXAwYitTY1lOQlJCT294dXhpTVBZU3FScU9VWDRjdjdrTytr?=
 =?utf-8?B?eUJkK093djFieXZaeGR6Q2dJa21Ua2VjM3dhY1h6V1RkM2RhL21rR1c1bkdQ?=
 =?utf-8?B?anRHckdVQk5TYS9pY3FHY2dBejNIVmVUTEtPbzZkLytENHVVdC85VW5nZUhE?=
 =?utf-8?B?Rjh3S1I2UUtqYjV2N2FBdXViOTVsQWpPWFMxYXJDd3R2KzRwVlhyK2VVcFpX?=
 =?utf-8?B?Z0RrTVR0RnMxbW04RmZnYkZhbHR0VTQzb0Zla2RFcGJMKzNoTlRTUzFhS25Z?=
 =?utf-8?B?d3dQbmx4NnZrbGp0ZlVHeXV2TWVQaytzTVphS1htYk03aFhQZFp2cUoyQkEw?=
 =?utf-8?B?SWJDcXlpSmdLS3FnekJWMGdVd1p0VTEyL29TOUE1cTZSVncrSlNVMCsweUx6?=
 =?utf-8?B?ZjIyTXkyaFdtdzdHeXpqUkdLZDVoQUlGa2hRYzkvdVRCUi9iUjNXSGRpcDNQ?=
 =?utf-8?B?OHJZaXdrQ3ZBUHd1em8zMmFmZWpFNGpJc2NldFJtMnFtNmFsTFBvdHBRNlJF?=
 =?utf-8?B?VUgvMWRIcnprUDlSa0s0VTdRZWxBUmlNaWdJMWl1TFR5TEdDMk15NklIUGcv?=
 =?utf-8?Q?9xHzmPwYvtUU5hX1lYkUoPSqB?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: aa96388c-4460-4b3c-d091-08da90a018ff
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 07:10:51.6806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7fU5U+NgkBN0IQ1DOc98dxnzV77JsGpxE1G65hZxBiJKWj9YwVqJIghfTRbHkMR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7916
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

First off, I'm very sorry for being too busy and too unresponsive.

2022-09-06 at 22:28, Eddie James wrote:
> Use the new mux root operations to lock the root adapter while waiting for
> the reset to complete. I2C commands issued after the SI7020 is starting up
> or after reset can potentially upset the startup sequence. Therefore, the
> host needs to wait for the startup sequence to finish before issuing
> further I2C commands.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/iio/humidity/si7020.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/humidity/si7020.c b/drivers/iio/humidity/si7020.c
> index ab6537f136ba..76ca7863f35b 100644
> --- a/drivers/iio/humidity/si7020.c
> +++ b/drivers/iio/humidity/si7020.c
> @@ -106,6 +106,7 @@ static const struct iio_info si7020_info = {
>  static int si7020_probe(struct i2c_client *client,
>  			const struct i2c_device_id *id)
>  {
> +	struct i2c_adapter *root;
>  	struct iio_dev *indio_dev;
>  	struct i2c_client **data;
>  	int ret;
> @@ -115,13 +116,24 @@ static int si7020_probe(struct i2c_client *client,
>  				     I2C_FUNC_SMBUS_READ_WORD_DATA))
>  		return -EOPNOTSUPP;
>  
> +	root = i2c_lock_select_bus(client->adapter);
> +	if (IS_ERR(root))
> +		return PTR_ERR(root);
> +
>  	/* Reset device, loads default settings. */
> -	ret = i2c_smbus_write_byte(client, SI7020CMD_RESET);
> -	if (ret < 0)
> +	ret = __i2c_smbus_xfer(root, client->addr, client->flags,
> +			       I2C_SMBUS_WRITE, SI7020CMD_RESET,
> +			       I2C_SMBUS_BYTE, NULL);

I'd say that this is too ugly. We should not add stuff that basically
hides the actual xfer from the mux like this. That is too much of a
break in the abstraction.

Looking back, expanding on the previous series [1] so that it installs
the hook on the root adapter, handles smbus xfers and clears out the
callback afterwards is much more sensible. No?

Maybe the callback in that series should also include a reference to
the xfer that has just been done, so that the hook can potentially
discriminate and only do the delay for the key xfer. But maybe that's
overkill?

Cheers,
Peter

[1] https://lore.kernel.org/lkml/20220518204119.38943-1-eajames@linux.ibm.com/

> +	if (ret < 0) {
> +		i2c_unlock_deselect_bus(client->adapter);
>  		return ret;
> +	}
> +
>  	/* Wait the maximum power-up time after software reset. */
>  	msleep(15);
>  
> +	i2c_unlock_deselect_bus(client->adapter);
> +
>  	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
>  	if (!indio_dev)
>  		return -ENOMEM;
