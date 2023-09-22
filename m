Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD67D7AAF86
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 12:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjIVKc2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 06:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjIVKc1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 06:32:27 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2132.outbound.protection.outlook.com [40.107.8.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF5899;
        Fri, 22 Sep 2023 03:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DR8Phhf7HUjX3T7YQaEExSLmoSnA0Wz97ZNDpbKBuwtf0yoTUZ8yhfbwqgKcJ/C6zFFdjmo5C+ruehj+ThuLkLC30o3DfTEcaR0tLn/bpXBoBr1tZr+FTG8VMCT11qOR+nioKnscI7BKBPmpHvDomvi03NPC45f+Q3mBfFZ9qHHbFzJVLUiiyWC8HJNYDafUPj+VrzcOq87zIC3lSF9DVxa7AK4LC6ZKfmN/xzBpX5gJBGVwLGtSlt0boti+IPe5O3MGwDApYzObSeesw3dF4RdZH3ZXL6Y4RCZnIUP9XZcpZ3hVIJhbw2LsutxlUG0/ZXcbl/boLF6pVX2Fhc3KDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4AgLpqw+z8V8DPQTVH1y3IWtwz/hM23hLRQFuLzFEo=;
 b=W8HKasE1/dTbc7XC8F7q5ltPAnDErRX/mVSeeuYJyiE/cuR1Sgz+MkAHZ796fnDy1/yPWCVBFBvSJySI+AUYq9WC61aAVmze/PJfpfUo1eNzAZIZb7p1SGA9qoJLtDooKB/+Sd2/4STVhXUlBN+SrMhiJcKm+Ku+2hndQVnUC7aZVCmmEhoUSqVngtf1GMtWXrpDXLwFiC29qgOOb9i8ex2clPJkK7VJg072JfDSC5/OC34sN2kB1OO048fqvh7GNNNG0rTNm2LdO+nwmRQ27gIShceV6mISL+4xc5o2OVN/iq5YjaDj17jhx5ruO5SUcRLsCNllGGSPK6gjO7emuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4AgLpqw+z8V8DPQTVH1y3IWtwz/hM23hLRQFuLzFEo=;
 b=P/8ADVTxk/PVrB0ipcfHyHgZDcKmStaPTs1VadqbvorZDI85CR7NddzEmhCw6TnJgBvcKaaHjB3Ses015o7uJTSWejMJI0LnqpEE/nefGwYM5o+87wzrTBRlODOvsmt/inUEVr87FSJIHuvJqwB2a7lTmRqQJt+L2ixRkSZFMn0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AS8PR02MB7288.eurprd02.prod.outlook.com (2603:10a6:20b:3b2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 10:32:18 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::7b40:7a7d:595e:623c%4]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 10:32:18 +0000
Message-ID: <8ec35702-54a7-ad6e-99c5-7ed49667c94b@axentia.se>
Date:   Fri, 22 Sep 2023 12:32:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND PATCH v3 2/2] i2c: muxes: pca954x: Enable features on
 MAX7357/MAX7358
To:     Naresh Solanki <naresh.solanki@9elements.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230922093117.3030977-2-naresh.solanki@9elements.com>
From:   Peter Rosin <peda@axentia.se>
Content-Language: en-US
In-Reply-To: <20230922093117.3030977-2-naresh.solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0077.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::20) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|AS8PR02MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: f7bfb354-4579-474a-8a48-08dbbb573227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4oZxnuytA6xWj5utj+OgB9tlxGUs2RFlRb1EHAwW+9O4YJ+9OFw3TSOP7EkurFU2nnGlqIvnvBKRGOWRK5WYR5pZH8OiiAw3cXwmDRfxlHBrHSwup1mDxNOxp7xkuA1RWOVu3eDgvyqQC0OgusubOV3m3uMDG6cC5H+Aa/T1aGqh2tqpiwl1TZ1CXsYQF1CSbMBGbDA0oTsvIy7HAioH3G00XpbJ47h31ysR7bpF6LKAxzkEI4HZMDZtu/7YhzVRyQCB3M5BMvj7WuhwhiFEEmGwKhes9Kjtz/JOyMb3qtgZqdoBxvtnnGQkC3IhFJidUojupOBFrCe/3ZfroobhjK/4gFSJMmi6x3dLt8Sj+Uw+hNzI+BVTV6UnyMUcIqu9fHz3/usDvnjK0tJ+D/9lfMoIKeME8nujiAKmZEhweWfza9kAd7PJdqYFa1SXB6WD/y6UJGcu6Dw55jEgRGCnN5i9AbmtQFXGGrLqQJXES5etRoJvmjD4xa+RhXDZZ2g6Ew9/BFzcSTD89TSgIWp3PSylsueO0DOieyocqiXn+RgmAnyAwnfl9G0YHqLsG3G9PO43I32sgloqyOU5ZpSaxBbfC2meB0ZOWZXepo2FUIGOMJ6D6FABir2L1FeEEZHc2uv4PnGgLLGnJn3OAA725w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(136003)(376002)(39840400004)(451199024)(1800799009)(186009)(4326008)(8676002)(8936002)(66476007)(2906002)(66946007)(66556008)(478600001)(5660300002)(6916009)(316002)(41300700001)(26005)(38100700002)(83380400001)(31696002)(2616005)(86362001)(31686004)(6506007)(6512007)(6486002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YURmSHBXa3JDMS9jQXFqSFhla1VuVVBzNno5aDRMMm0zVEQvMFMxaUpyM0tt?=
 =?utf-8?B?Tml4eUtzWEN4ZXJiSmxyblZBV0Y4a2o5QmFtbk5aUHdPcnBZVHFuYXFiU3o0?=
 =?utf-8?B?ZkFpeEQvWjVUelMwbk13cHA4aFdjaUlDSHpaaXBydkJPQ2I2QlNrMDYvYnYv?=
 =?utf-8?B?ZkkzTUFIVmVhWXd3b2ZDeEJrZi9NQnV5SFZOYU03WWNNUzNnL21tQXFqdTBT?=
 =?utf-8?B?UGpSTUhMeC9QUHlNWFI1V0dQUVp1WCtwajFVL1JSU1hDbmliUVpuY1kvQnRy?=
 =?utf-8?B?TXg2eTlpT05GaHovZERVdEgrTjYrdGdmUDdoaHc5bmhVVm9KdFZtNkUweFJT?=
 =?utf-8?B?NFh6ckt6aVRKRTROdWcxUUZHUS84T0VEZWdPV3pOejZRbXk3cWpVS0k5NGJW?=
 =?utf-8?B?ZS9PdFJjMUNDeS9YVkZFS0lVMElwR01JVlIrNWl4VFVFeWdJVU1od1FGQ3Z6?=
 =?utf-8?B?Qi9tay9OQkY0R0FtdU50Q1RMOVFOZjYySHR0djJDZHhGUzAzc1l1YVJ3cURo?=
 =?utf-8?B?ak1ndm5YTzF6b1lGbjc0YldSTkdkbE1ZdDhkUk8vL2tERHFRbEcwNm5ualhF?=
 =?utf-8?B?TVM4NkZXYXpHV2oyQVZxVTFDWThVcEYwanBqenNpazBiY2h0NE9DMWVlbEJU?=
 =?utf-8?B?TXdBRmZlMjZYako4V0tHcG1NYllOSUs4aDkwVmMyY3E5bU5ycXdyZFhDQVkr?=
 =?utf-8?B?TlZubnB1L1FwM2RpRzVZb0hld0U2SEpXZGVsckdDelliaktmTWdLSmhXRXlF?=
 =?utf-8?B?KzNzdnpDK1c4NHZXYmI4L1pEWXBBS3lVTVFUT3hudWp5bzd0em5QNjhXWXBB?=
 =?utf-8?B?eUUvNEc4djhSYktvNlRYZTVOMEU3OG1sdzluL2R0OGFWWjAwK0pxMDRaWlBF?=
 =?utf-8?B?Ymp0cVNyTmt1L243WVJob0IwZ0ZNeWVsWCtNRFNpM2d2bWhQZUtvOGtkbEQx?=
 =?utf-8?B?TFVVaU90dDlmbEkwMFA3YTk4Qldtc1h6MUxjSkJkRDRXek1vNkc2Q080cS8v?=
 =?utf-8?B?VFdTc0VWOCtLWnFnLytDV2tGNVJianlzK3pJZTMrNzUvbFROYlBWZ0lXaFRx?=
 =?utf-8?B?bFF2SmRHMFZrNkQ4ekNNNVFHZm9NczM3Um9JYzZLSUdQV0VjaFB4V3F1QkRV?=
 =?utf-8?B?by9qSEJwYW0yRlRQc0dhaTU1NmJWNWJCOGJOMHRDS0dzeFh6dThodGFXNW9o?=
 =?utf-8?B?L0NCNm1YVTA3cVUra0doU2V0eC9UV0pIakZiRzdyeURheVA1Y3dHa0poL3hC?=
 =?utf-8?B?SVZPOEs2MEJ1ekVTb2o1ZkNjcURxTTdyY2Y0NVdNeXhGQm10bi9rZHdna3ha?=
 =?utf-8?B?Tzd6WEZMMFNqMHg5ZHN4QVp4SXIvMTE1bG4relVTK1g0VGdGbGJ0RzI3QXJt?=
 =?utf-8?B?TnN1WXVYa1p0eUMwVlFML3lISldFVzl1dHhqSmR5czNYNzBMQk82bkNyL1Mv?=
 =?utf-8?B?SUcrT0lqaHBmUldyeHZwL0tUS1FoVExLdG9uNUZad2xQWGptOUkxOHA3UWth?=
 =?utf-8?B?UHlGaWZHV0ZhNHQ5RHhWRW9wUzI5V2x0NDFJRmFSNE5HVUtMVHJubEE5LzJv?=
 =?utf-8?B?b3AzeWhYOFJtZGkyQStFZFVJQnQ4aUFOSWFXSURlMU50TUdnMEgyMkczVVVZ?=
 =?utf-8?B?Zjl1Ly9ONWsvNnJJdlNEZ2V5M3dTdWg3Z3E3cktjV1ZOdVY1WXZXaFZid0c4?=
 =?utf-8?B?d0ZsQnY4MS91VUZ6Z3dMd0RMNXVremFia3lzdkFyeFFyQ1lndHhKclFNdFBv?=
 =?utf-8?B?TnlNMWc4d0xueW5qT21oZmErekpzb1ZPVlBYV3dqVFlibVdmSzNqSWVzV1hI?=
 =?utf-8?B?bms1bWhiUnNWOUN4bjJVWkNRNTNOMXFCaGM5S0VvR0xBRHk0dG9weGp1WXo1?=
 =?utf-8?B?NlhtMVhUQUU2cjJKb0xsTXc5aFQrUFhMUEFQMEpPalUvZEZWWi9XL1U2a2la?=
 =?utf-8?B?SFYyQ2hVRVpBVndoemVxcVRZQUo0cXF3cGlDVkJuRWVLYWhIcUhGT1FlYXVr?=
 =?utf-8?B?eXJpb0lvRHZZS3lXcXFXeHZra21aTTAzbWZRY2RVV3NCdTEzYzJvZXV1UWIx?=
 =?utf-8?B?Z05FSHB3VTdrQjZXcGI2YzN2V1NsYnNrWVFCKzcycS9ha0tSZkpOVm9wNStX?=
 =?utf-8?Q?grbfrLAvSdK7003UTG06LZ9FQ?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: f7bfb354-4579-474a-8a48-08dbbb573227
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 10:32:18.2305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhouBzgCNlNxzwBsxvirBVGUNxbplLUz7A/iOp88a3bpK74Esi6eZh5oNfujHYyZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7288
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

Sorry for being unresponsive...

The subject, description and the bindings patch talk about MAX7358, but
since it not actually handled it is misleading for the subject to say
that features are enabled on MAX7358.

2023-09-22 at 11:31, Naresh Solanki wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> 
> Detect that max7357 is being used and run custom init sequence.
> Enable additional features based on DT settings and unconditionally
> release the shared interrupt pin after 1.6 seconds and allow to use
> it as reset.
> 
> These features aren't enabled by default & its up to board designer
> to enable the same as it may have unexpected side effects.
> 
> These should be validated for proper functioning & detection of devices
> in secondary bus as sometimes it can cause secondary bus being disabled.
> 
> The init sequence is not run for max7358 that needs to be unlocked
> first, but that would need the unimplemented function
> i2c_probe_func_quick_write().

Is that correct? If that is all that missing, why is it not sufficient to
open-code it instead?

	i2c_smbus_xfer(client->adapter, client->addr, client->flags,
		       I2C_SMBUS_WRITE, 0, I2C_SMBUS_QUICK, NULL);

> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> ---
> Changes in V3:
> - Delete unused #define
> - Update pca954x_init
> - Update commit message
> 
> Changes in V2:
> - Update comments
> - Update check for DT properties
> ---
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 38 ++++++++++++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 2219062104fb..91c7c1d13c89 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -57,6 +57,20 @@
>  
>  #define PCA954X_IRQ_OFFSET 4
>  
> +/*
> + * MAX7357's configuration register is writeable after POR, but
> + * can be locked by setting the basic mode bit. MAX7358 configuration
> + * register is locked by default and needs to be unlocked first.
> + * The configuration register holds the following settings:
> + */
> +#define MAX7357_CONF_INT_ENABLE			BIT(0)

This define isn't used.

> +#define MAX7357_CONF_FLUSH_OUT			BIT(1)
> +#define MAX7357_CONF_RELEASE_INT		BIT(2)
> +#define MAX7357_CONF_DISCON_SINGLE_CHAN		BIT(4)
> +#define MAX7357_CONF_PRECONNECT_TEST		BIT(7)
> +
> +#define MAX7357_POR_DEFAULT_CONF		BIT(0)
> +
>  enum pca_type {
>  	max_7356,
>  	max_7357,
> @@ -463,6 +477,7 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
>  
>  static int pca954x_init(struct i2c_client *client, struct pca954x *data)
>  {
> +	u8 conf = MAX7357_POR_DEFAULT_CONF;

This line can be moved inside the block below handling max7357. The POR
default conf is not the same for max7358 anyway.

>  	int ret;
>  
>  	if (data->idle_state >= 0)
> @@ -470,7 +485,28 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
>  	else
>  		data->last_chan = 0; /* Disconnect multiplexer */
>  
> -	ret = i2c_smbus_write_byte(client, data->last_chan);
> +	if (device_is_compatible(&client->dev, "maxim,max7357") &&
> +	    i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_WRITE_BYTE_DATA)) {

I would have liked a message that any requested extra features cannot
be enabled if the chip happens to be connected to a bus not capable of
...write_byte_data(). That might be plenty helpful for anybody who
happens to find themself in that hole...

> +		/*
> +		 * The interrupt signal is shared with the reset pin. Release the
> +		 * interrupt after 1.6 seconds to allow using the pin as reset.
> +		 * The interrupt isn't serviced yet.
> +		 */
> +		conf |= MAX7357_CONF_RELEASE_INT;
> +
> +		if (device_property_read_bool(&client->dev, "maxim,isolate-stuck-channel"))
> +			conf |= MAX7357_CONF_DISCON_SINGLE_CHAN;
> +		if (device_property_read_bool(&client->dev, "maxim,send-flush-out-sequence"))
> +			conf |= MAX7357_CONF_FLUSH_OUT;
> +		if (device_property_read_bool(&client->dev,
> +					      "maxim,preconnection-wiggle-test-enable"))
> +			conf |= MAX7357_CONF_PRECONNECT_TEST;
> +
> +		ret = i2c_smbus_write_byte_data(client, data->last_chan, conf);
> +	} else {
> +		ret = i2c_smbus_write_byte(client, data->last_chan);
> +	}
> +
>  	if (ret < 0)
>  		data->last_chan = 0;
>  

Would there be any point in configuring max7357 to be in basic mode?

Cheers,
Peter
