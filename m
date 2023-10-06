Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 335DD7BB296
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Oct 2023 09:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbjJFHqO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Oct 2023 03:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbjJFHqN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Oct 2023 03:46:13 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2110.outbound.protection.outlook.com [40.107.6.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1EAFF;
        Fri,  6 Oct 2023 00:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAWvWLyxBAYYesW6CmlONVhFejgm8KJFzT+nJ/KGUrb0Lnw//SncuaQcGlK/pcFVDtYGA7FsHGxx0cnrXaAk7Z4B+JZ115wR3DlpQin03XO1Ms8l/5GiSs3YVtE/kobSmaHHdXmhNbar1xTzG7f8tSbHQEaFEsf38hlSDMwS4xWTPadxTSwbUwLLGdDSjId81CU32P9ZVy2FNaWkoZ3tSl9cMphZoAqt9I8hWqdk2SvLskwB7e3KJ9ZXi+IlJKN+rmYF3JaeLHc+AFzB/pg5yf4yZJLJ+26rF46pqpR7DvnUKgJciThMjmThRpR3JzMnnHcQxp2EnU504Rni4vFcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQ2KQ0tRjdgmyJSmsZLOXWr+/sKeYLCHQqYhACpnfJg=;
 b=H2c9oG9AD5Htp6w7vrLKlQNQi6E/7cj85E0NLTp1i9e73eukuPnGd20Sh9QObKQ7S937A756AeMuicHbEnYJ9FKh8D1nq3WGm2VVYktzrAS5dAbvxskfvN0yxoMntna3EsMW97WOPa/CEQaHpVg3BLouE55NEG+t16zPwA18z9vDuxWgP8fLrxbWhhg4+3Ru7l2nmZJFrPypUJa1intG//f7tSLjcMy2FEcKIMofTz/xalLodpc1w5tWgCU7dF3mMZOhalWJq+/bHVob6IpnQutFQIxx2eSDq6WzW3Ronv/TqU3QBrkmi7T/3aLrdCGLJ+YCcRbciLYieGVXZnBxUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQ2KQ0tRjdgmyJSmsZLOXWr+/sKeYLCHQqYhACpnfJg=;
 b=Q8uLZq/uYGXhNEoIYZr5WEKGLCyvXd8J3c2GGnynDSryI65K3mt6+PD0MZLQFZcyUIAb3xcumq6tvwzT7jUO25oWeFUFrFXnFqfqmXuca13u3HqJ6LgsY8/AVuwr7elZdw6PcUbe+ETDd/wHEvjic1IjV0QY+a7tUasN6zKKpPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by PAWPR02MB9949.eurprd02.prod.outlook.com (2603:10a6:102:2e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Fri, 6 Oct
 2023 07:46:06 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::4ba4:83a5:e60c:3a5d%7]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 07:46:06 +0000
Message-ID: <29485a37-1f45-9f7f-9cc5-5d6a9fcc5e08@axentia.se>
Date:   Fri, 6 Oct 2023 09:46:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 2/2] i2c: muxes: pca954x: Enable features on MAX7357
Content-Language: sv-SE
To:     Naresh Solanki <naresh.solanki@9elements.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231005134541.947727-1-naresh.solanki@9elements.com>
 <20231005134541.947727-2-naresh.solanki@9elements.com>
From:   Peter Rosin <peda@axentia.se>
In-Reply-To: <20231005134541.947727-2-naresh.solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0108.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:9::9)
 To AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR02MB4436:EE_|PAWPR02MB9949:EE_
X-MS-Office365-Filtering-Correlation-Id: 113d490a-be73-42b3-f686-08dbc6404c0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: euxoh76qn5238HqYd7CTKWq384L0bXNPgQSFu1qPS5/d8zqrBAj/tfkpTzJlx1rVoAnstly0JW13avCdzT0Mj7Zut+/ITG/ZLvBRVRPh2G1ee6hbBXMcg9BJWrrvczwypnJHeVmNzCyYZmh1wlXnCz4++9/aQG2hw+HO4e2UHvjYk6e4K5XFja/0MfXcVFrjn1v2sX97IIopniyJVAYYiEOKii15hhdkMOvXbJoDP5nXk/600CMXcwcBBi3ICnNh6CH30iwtE38CDwABHt5NAI607zPUzBgvDykEYtrgzTicjnMNVRmO5bOH1KV/LeS7P3yqXL0ia23K7faHakmR8SQQET9UZu+nOrrGnLHXxMXwUYbFUoavA6/JG9pMRLMjtTWxaVc24eTmGurnYDG1lc1rMLUimAsyKlSlqPEcD7z/MY/mxL1lktWi+O6Jdb2pS4yUKu04IHnUwLcaXMSwjCyCgvbEcQeOKrJ/uOMvhCsbZIb98trKrCM6jDGfHhMn4gV+drAeUT/gUsf1rqUpLhRy944RELegT/PS9HeqVYwNcs4wsa5qFcWK9c9m15AZnIkznja+NJts8zuXJwiGIBO2b44xOYvQJhYWXmLAF9eRPysHz6P3CO6vW0VjRezj3xpRc6WiH1F9HKDONmdqDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39840400004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(31686004)(83380400001)(6486002)(478600001)(6506007)(6512007)(38100700002)(31696002)(86362001)(2906002)(26005)(2616005)(316002)(36756003)(8676002)(5660300002)(41300700001)(6916009)(66946007)(4326008)(66556008)(66476007)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVNwelFwb0lMWjI2NjBTdDltUTcxa3hZZkpJY3RCdzROM2YzSWVNRUlJb2Rh?=
 =?utf-8?B?SU9DYlJ3bURsY21uOUZTSFdnQjVDdEdUYzBsNUg2QVZydFY3WUYxRlVqWG9M?=
 =?utf-8?B?Q2FUMnE1QnV0UUlQUFQ5c0h6RXdDSFZ1dEF3bU9ZMExVV3o2SFg3WDI2eExt?=
 =?utf-8?B?cjAwVTdlVzBTMXZmVmpRa3l3WDhlNGZUSklWbGdFWGxuemUxSTl4WVBKMEww?=
 =?utf-8?B?b1luSmpJaXdHMUFVc0FUUm96Ky91QjFPUWJsSWd3U0ZlSHJZalI5d28reHJF?=
 =?utf-8?B?QzExRFg1ZWw5S0loYkZCNHpxTERiSnQ1RDVMNEk1SVZuYnBRYWV1R1BJcXla?=
 =?utf-8?B?MmxteWgwbU5DVUNISkF0R2VTeEhXOTFXdDJnMjk3eS9KWTZkaFdNZVpESFZM?=
 =?utf-8?B?SzJjVEpHaGtKVG55MjdhckFtR2F2cENGdU5HNG5qMEc1amtnVDA2Y3ZhNmNi?=
 =?utf-8?B?S291SWxQYTl4Z2gwTVJYc21GZ2pCTXdaWXp5R0ZDbjY5WFZZc2NPeGlZSmNR?=
 =?utf-8?B?UlV4Q0NFVTZYdzIybGE2QVh6RkFLcS9pKzB6UnJLMGhBV3BFUGpoKzhGaG1m?=
 =?utf-8?B?KzdIcS93ell3OXZEeERuejNZeVlGMk9vbGdxaXVVa2xWZTR0QlZxMTVQWk9q?=
 =?utf-8?B?UmN2Q3ppejdYVm4raWdXcys0Q1huYVZrZUUrL0lCMXhtNDBTQUV4OG54NUxP?=
 =?utf-8?B?azhaQjlXL2l5aFVIQTZBWXlTYWdRRTNMY2FXZERMUVdFUmVxU0JNVktvUHR5?=
 =?utf-8?B?QkhRczVCRmdPcWhBWkJyZzgyRFZTR2gzMjcrQlZsMUZOUmsvMjhhb09obE1u?=
 =?utf-8?B?NHN5Vm51K0FEd2VlS0pYWXlFNXF1YmkwcXAxOTU2cnZRYm9tTzZvbGQ2YXR1?=
 =?utf-8?B?Z0tHeHJTb3Jxc1J0Q3VnUFE0akNOSDhiVEI1YjV3U2plNXBCYWNFenoxcEMv?=
 =?utf-8?B?aWRGSHhoSHFzU0Z1Vk1XazVJblFvVXE5NFZRTjVVZlFjVlBDbGMza3NZc2RV?=
 =?utf-8?B?R3RKbGJuYzVKQVhtaTZPYVJ4dmdxZ2s2eTRVMkk4Zi9JOTFVd3F3Y3RndGwv?=
 =?utf-8?B?YSttRmRvSXc4RTV5NTFRV3FFSlEvSUk0dFFPVTZrWmVSS2JZWjM3VWJScitO?=
 =?utf-8?B?U0gvMHdEL0JPWjQxblRnNzZlM3lvZFVrNVN5OXNGd3dLTFozNWdUa0xvL0ZV?=
 =?utf-8?B?eFR5c2RzaElEdEJxdkRhdEJkdnQxVTIvMHd0ZVRTcWJSdmlCNTcvckdMQ1ZP?=
 =?utf-8?B?azVYeFI5UWNKUGttVFFrcUdMdXk3dFkrN3NkQWM4dXFoR3BMUWRXNFpWTElZ?=
 =?utf-8?B?M05XVnJUSkJ5eDg5Q3JZR0kzVW5CdytrbGszVTNqU1UrZmV4Tzk5dy9JUHBa?=
 =?utf-8?B?amVqandYRnlXRWFSUUppZFNKdmw5dXRKc1ZaV1BQZFVoc3lvenQzQXNKUHNn?=
 =?utf-8?B?Zy82Uk5KT2ZPVUZjdzgvRndxelphdWsxSStNNkhRRHZMdUkwUzBHV2hNbGtI?=
 =?utf-8?B?b2J2NktYb1pMOUVmWUJRYVQ5eGlzalY5UXNrNnhhRzhGSmRtR1BWQWhzVitp?=
 =?utf-8?B?QkhtLzZETmptQ1ZrdG55RzZjcmtNTk5jK2VVVmQ5S2p0NFRCeGRveUc4bXFh?=
 =?utf-8?B?U1I2eDRqTXdFYjZXNXA5d2g3K0EwQXF6b1ludHpCMXNoaTE1Q1lrZWZCRXF4?=
 =?utf-8?B?ZjJKYnRCWmVxWk1MbFVKODVBWmZyTzluRXlGSlZLSWUrR2RKMzdlbnpJZzlX?=
 =?utf-8?B?R0IwZ1Erc2doZURJRlNlcGNxazJkT0h2Mmw3V2hIalhUVEp5WG55ZmhGc05V?=
 =?utf-8?B?S3cvbC9wbkU3L3U1RVdjYm0vVlV1dmUrakRXemMvRkdaazNVM1czcm5HM1Zr?=
 =?utf-8?B?Slh3a1ZpNGMySVhjZUN2RG9kcUM0SzVLY2g0SEcyb0tDVUJjejJ1UERHWlV3?=
 =?utf-8?B?SXdNeURiRVJ6U1Y2eW9HeER2YWY3LzlJVXRYSWd0VGFaQmloSmF6VWhxOFVw?=
 =?utf-8?B?bWVjQTNJYTR5SW1Ddm51Ly9GeFhUNVJoQVBOcExhWG5HVG1uemZuKzVJVmZ5?=
 =?utf-8?B?TGRxdXFDZ0FRVzRxa1BYa0pUdGZtbm5iR0Rick9iWnZpMGVQcWhIT3Q4M1JV?=
 =?utf-8?Q?5OFwjNGYx0G1ygMCCaH7w7mC8?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 113d490a-be73-42b3-f686-08dbc6404c0c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 07:46:06.1623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 50SX5XgY9XG8dexIurtw0V1lQAUeAQWxZGv5e0skHdTUD1RntgOoBgBkgUvsQBby
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9949
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

2023-10-05 at 15:45, Naresh Solanki wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> 
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
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> ---
> Changes in V4:
> - Drop max7358
> - Update #define
> - Move conf variable
> - Print warning when I2C_FUNC_SMBUS_WRITE_BYTE_DATA isn't supported
> Changes in V3:
> - Delete unused #define
> - Update pca954x_init
> - Update commit message
> 
> Changes in V2:
> - Update comments
> - Update check for DT properties
> ---
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 44 ++++++++++++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 2219062104fb..f37ce332078c 100644
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
> +#define MAX7357_CONF_FLUSH_OUT			BIT(1)
> +#define MAX7357_CONF_RELEASE_INT		BIT(2)
> +#define MAX7357_CONF_DISCON_SINGLE_CHAN		BIT(4)
> +#define MAX7357_CONF_PRECONNECT_TEST		BIT(7)
> +
> +#define MAX7357_POR_DEFAULT_CONF		MAX7357_CONF_INT_ENABLE
> +
>  enum pca_type {
>  	max_7356,
>  	max_7357,
> @@ -470,7 +484,35 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
>  	else
>  		data->last_chan = 0; /* Disconnect multiplexer */
>  
> -	ret = i2c_smbus_write_byte(client, data->last_chan);
> +	if (device_is_compatible(&client->dev, "maxim,max7357")) {
> +		if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_WRITE_BYTE_DATA)) {
> +			u8 conf = MAX7357_POR_DEFAULT_CONF;
> +			/*
> +			 * The interrupt signal is shared with the reset pin. Release the
> +			 * interrupt after 1.6 seconds to allow using the pin as reset.
> +			 * The interrupt isn't serviced yet.

I'd suggest dropping the word "yet". The interrupt isn't serviced for
max7357, period. The "yet" in combination with that 1.6 second window is
a bit cunfusing and readers might think that the interrupt is serviced
at some later stage or something, when I think the intention of "The
interrupt isn't serviced yet" comes with the silent implication that it
is simply not implemented yet.

> +			 */
> +			conf |= MAX7357_CONF_RELEASE_INT;
> +
> +			if (device_property_read_bool(&client->dev, "maxim,isolate-stuck-channel"))
> +				conf |= MAX7357_CONF_DISCON_SINGLE_CHAN;
> +			if (device_property_read_bool(&client->dev,
> +						      "maxim,send-flush-out-sequence"))
> +				conf |= MAX7357_CONF_FLUSH_OUT;
> +			if (device_property_read_bool(&client->dev,
> +						      "maxim,preconnection-wiggle-test-enable"))
> +				conf |= MAX7357_CONF_PRECONNECT_TEST;
> +
> +			ret = i2c_smbus_write_byte_data(client, data->last_chan, conf);
> +		} else {
> +			dev_warn(&client->dev,
> +				 "Write byte not supported. Cannot enable enhanced mode features");

Missing \n at the end of the string.

Cheers,
Peter

> +			ret = i2c_smbus_write_byte(client, data->last_chan);
> +		}
> +	} else {
> +		ret = i2c_smbus_write_byte(client, data->last_chan);
> +	}
> +
>  	if (ret < 0)
>  		data->last_chan = 0;
>  
