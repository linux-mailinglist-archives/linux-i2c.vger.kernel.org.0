Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD2945583D
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 10:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245261AbhKRJv3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 04:51:29 -0500
Received: from mail-eopbgr30134.outbound.protection.outlook.com ([40.107.3.134]:37029
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245260AbhKRJvW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Nov 2021 04:51:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7GC+JlPmkdQez3ibwqp6SSIRb6TYA3JfmsAuGFyPpOX+bf8xKeZfs5fgCJCXHM2sb/ebmnqzlaZPIR63FibZMfO/XeicDOy0iGpmLGLd4ovBwBjkmB/bGHT5byRn+aj6IwqjrNSuVVEf3Pq+620OuLriXTI5XxtieSex7TibkDUkY1200hXe40FJlSkDUL982l15E6Yjt38rg7zpTd4iqTwcVdYEheewHlyqp9HeCC2KsVJZpnqr91nTNQoPES4f0v0GMU61CQlobb7dOeulOmYf/li1AYeEuz+jQwVGRk1eiL4UrqJkK104ZutuYddSzM4dFO3qeGYwKs7sulQIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeznbZCY9xcgIXv4DE7RkyHCHtX4LiCNMUM4GYug3CY=;
 b=ABXPMl5eB3yAnyobQynPq0f5TLHpNPPBynFbonqRiBQBEYJRrYw2HsbOoS26A6YC6quY8OyP1vXHbXfP4UbsA5I90ptr5Jz905ALB7NiXiR33yFxdfhE1mhA0XZLIQMDzlHe2wYdeQATHuvd0+PLd4vcIYCk+QX+qjNkp3GY2ODb2EIQXwx0Cbv33PwTIU8RGLdAHHOOsjDvKao7865ZrUqWgK/Mqai4PMBUFvAuUzBuEcd/vTk7DdNABc53T6CO31aZZ1BbaW0ljvZBlXmXg0M6ppSd0qRik5VF/l2TuCLM7jHamikS0UpeMOQJO3l6DdEqW9zrCf95YNrmoY/fqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeznbZCY9xcgIXv4DE7RkyHCHtX4LiCNMUM4GYug3CY=;
 b=HDZcpK+FnCySCUPIHuP73w3em5vobldTqhs0AANdN3npouQTfSSPwLdw8YWR7eh6EnuVTqa4g1Qk6knFYn0bp3CraUMdunw2Kw+A0c15B66Sqfm8THqhEALKDIZ//kz+s8acWAGh9rZPQIiDVPrOo/jhZ9G044IIt1p87fKacds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB6PR02MB3063.eurprd02.prod.outlook.com (2603:10a6:6:1d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 09:48:20 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::b1d6:d448:8d63:5683%6]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 09:48:20 +0000
Message-ID: <d6e2f855-81c0-118f-96f3-f29c2059c8c8@axentia.se>
Date:   Thu, 18 Nov 2021 10:48:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 2/3] i2c: mux: gpio: Don't dereference fwnode from
 struct device
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Evan Green <evgreen@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Peter Korsgaard <peter.korsgaard@barco.com>
References: <20211115154201.46579-1-andriy.shevchenko@linux.intel.com>
 <20211115154201.46579-2-andriy.shevchenko@linux.intel.com>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
In-Reply-To: <20211115154201.46579-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0036.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::23) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
Received: from [192.168.13.3] (185.178.140.238) by GV3P280CA0036.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 09:48:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9998f2a4-5206-4013-c84a-08d9aa788dc3
X-MS-TrafficTypeDiagnostic: DB6PR02MB3063:
X-Microsoft-Antispam-PRVS: <DB6PR02MB3063B1D1CF85D36D78DE41FDBC9B9@DB6PR02MB3063.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A/pYrOUEqEunmurXCLfB7rcoY2lmytGZtD2Uyw8Ugygn2lPwJbw7F+/6xbr5bnMZh91y4iFdZPQ+YFEptilT8Q9Q5oPplcRbLpJZhRcRQbdHpePsjAT2ZPDxqvSed2dIEUzyzWL34Os46k09jDJZLc7H6c1IjMIpZCy1+R/pNDleFhjSNs167PoPkfcqyQtcdbP+A7yLA41GZQ/601RAeq/Is3NrNCwPAUZ/0O+kT0ehEIoqK26o7uhOK581l8dG7fgmSD13Gx8WrCqac1XeGFV0xw2iI1cEGFl7KQjo+AAW3mPQhdR09n6tDYjQOx2Lr3xTyzsOznoLETHN/xTV6zBsUAD+Dxsg8MYNB7kOBDfHlMO3/rN3ua978FZzTypiIrUznn7+r06uD9a+jjaimndHJVgVdQyv95hlDPGXk4cuPiz2KuqHlP2uIV9ycfJEy3tRERKtGZ9GcY7RnZ/eo+cVGaUmimtYUGLwk8pKekNKSvV25/3XLfoJY8KEofPBkZM4IZCgauanW4rllTh2lz0wJvdOooIxrh1hldf0Jcv9tLLBYPnZUbcXZm1GavVxsmlxKfjxNI+86SOfvMBTo9eC0ECImxJotl30NCyzvUDAEjf6RNjjQGW4KwjZvjek7y/GAIw8njJ3IBc44aY7W8KM8H8DToP93URwmUO92Q+jp6gW1EPCwkeeOz8NW52/LXDql8yaBs91hgiZuPuqh/rUT6F64XnEqnvMTw/LsFIHIIEEUHQHmfzwunXOF9Sn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(136003)(346002)(39830400003)(66946007)(66556008)(4326008)(66476007)(31696002)(16576012)(26005)(110136005)(83380400001)(53546011)(2906002)(36916002)(86362001)(956004)(508600001)(5660300002)(2616005)(31686004)(4001150100001)(8676002)(38100700002)(6486002)(186003)(36756003)(316002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wkg2NGE5S3RJSmxFOU93dUlta3VhVGU1MlRGY2lDYklkVGRDZEUvQlNZSG9t?=
 =?utf-8?B?eFlRTkpJbU4xY0hNRzEyR1Fybms5cmFzK2tQVmt5TXZGMkxXYkRwemxFeW5Q?=
 =?utf-8?B?YVpJd01FbEowYkVxczZRSWQ0cmlmN1M4bWRBU1ZFSmE5cVdwS05GblJ3d1Vq?=
 =?utf-8?B?Mmw5UUdnVjRudGg0TkE0RGtmK3BwZTdJYjNKbml1TGdVcUwwTkM4R0NEcmlV?=
 =?utf-8?B?VmtxL2RrUENGSHBsVklwTFY2V3pObk15Kzl3NXJrU0FTajFuRGw0M0s2MWl6?=
 =?utf-8?B?QXZkd3J2M05TeHNpRlhvSGxkRzdQTENrWGxRQ2Q4UTdRTDd1RkZ5aVFRdVgr?=
 =?utf-8?B?d2RZdjFkZndrYjJoUmJ3RUlxdERrZ3haRHhqRlVPS2NYRWJRUkNKbUtVSzkr?=
 =?utf-8?B?bmRHQmhpaEhMOWhFaDB5NHJQSkUxZlBYRTUydXpkRndDME5HbkMvVkE5bUI5?=
 =?utf-8?B?bmNKd05kZXFZbnB0ZERjK2pwOFpWYkxiZG5iYk1iWFlDS3k5U0J6UmpvMXFo?=
 =?utf-8?B?M2oxTXI5Y0hPZHJxMlZLcUZIR1l1WVRzb2lRcmFoR0JiV0E4TVNVTUUzelo5?=
 =?utf-8?B?OGZVbXB3anM1SnJtM1VBMUF3Q0xOcmlqeGR3T3FINFBYVEFEMU9Rd2MzY211?=
 =?utf-8?B?blA3OS9iaWVOZUxkLzZpY1B2UVNwclpMRzZGeVQ4cjY3T3ZrUXQ3U3NoQmlh?=
 =?utf-8?B?VkhOM0pwWjNYTEQzVDNTNHdpY3lxWTNUZE5jWkN1cTdkZ2g0a0MrdEdBR0xR?=
 =?utf-8?B?anRmdTkzeVkvMmJIVWhTRmlPU3N5SHZvTEhQSGxuaWpKQUlmSWp6QmorWG5R?=
 =?utf-8?B?OWFVRHYrenc2T3VQK2xFQy8zR2YwbEVZQm4vbU95ZUltOU1JWjBWK0dhNXFy?=
 =?utf-8?B?YzBqZ0xzaVFnRjFQSjRGZUtKTlhpSHVRQUh3ZUV5RlhMTnpEREZONDRWNEZi?=
 =?utf-8?B?N1d5akRwTDhOL3E2N1pCS2pjTE0wb1hZSk5CbVczTTh0UExWeDZCNVgxWGI3?=
 =?utf-8?B?QUVsQ2xVRi8vWmNGQjlhYVo4dTVuL285YzBEeUNpODJENHpxcmtOUDNFR2Zr?=
 =?utf-8?B?bFNXbDdoN21MZ1ZCTDYrMnhXbkZmYzJtaGxSL3Vab2lqVG9iSzFHSEZpQ21y?=
 =?utf-8?B?eXkxQi8wdzRQbURJUE8vRWI3UTNnSGhrSkZGRXBEMGp2SnNvcWlBY0c0UEhI?=
 =?utf-8?B?V216ZUJ4SUNjeW5YdDZCNjUxaTJrWno4TlJyUS9SVXhiMUdtbVhzTG1qTGJM?=
 =?utf-8?B?UmJrQURpc3BMYkpOcTkwOGh5VzJWRTlwOWplWWhzQitkTkdmd0hSdWJOOUpO?=
 =?utf-8?B?bnU3a2RVd2Z0dXJTK3l0ZmVYVklDVGIvQ200RDB1MXlFOTFmRzhreTBBTTM2?=
 =?utf-8?B?Z0RQYWJvNjU3cWFjeGFYUFpzc0kyZ2Z6RVE0UTNiSG1WaG1WVXdveUxiRThV?=
 =?utf-8?B?SmN4eXFFUk9mbWlGcnYreGNEUktKTG5qMnpJVXArcW5BZFE1UjRibTRMcTls?=
 =?utf-8?B?NnFmTmx3NGJrV1JPdHhLZ20wZnZNUm9kTnBISzFSQXB6NzlOVjF2b0p0MU1E?=
 =?utf-8?B?VlB3VHV5enp4R3lGVmdsL3VtVHA5eXcrdVVNOU53S1NrTUs3SXAwb1ZtbkY2?=
 =?utf-8?B?Y3dSU20rRkFlZXNoY3ZVM1A4Njdmd0xZN1F3eUZkZUM5OWQvc2Q5LzVhNFMx?=
 =?utf-8?B?MHNtRzN6WVY2ZG90QWFaeldYM2lQVVV6WHdCeVBJY055cUtPZXlZd2lJV0ZN?=
 =?utf-8?B?aCtXVUVTbzhjRThkZnU5SWQ5aVFxOFJ2V053eGRwcDNrOHJHSkFpV0lYKzM3?=
 =?utf-8?B?MU9WeWFoN1pHYkpGVXRZcE9sNkpQMGpsNnREWEFhdDVudXFGZmZSVEZWUXRs?=
 =?utf-8?B?UGovYWNRYkxqK3orQjI1Q3pHM2JaT3ZOUkw3VHZNWnVQMDQ5L3MwSTQrbjRs?=
 =?utf-8?B?Y2lJRHJkOWxTQkxxd0dSVFlLaG5Qc3VJYlhGUnpIUHJIZm1oUjFJOERnWVdM?=
 =?utf-8?B?THJLT0xJUzlaUkVuYVVteldjTks5bUx4QS82bDJERkIzaDcyUVF4NEdlb3k4?=
 =?utf-8?B?cmw1UlJ3VDVTYVZUZ2xJRXpHQVdhaklvSHBIa293amJVeGJPYi95SWlBbWh1?=
 =?utf-8?Q?zCp0=3D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 9998f2a4-5206-4013-c84a-08d9aa788dc3
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 09:48:20.2570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fNLD1VoKN3MCeIHQQjFy7OjXL/Rsjrh+nHJMfdMUmlHMz5U2JV+LeSXL18npZKvv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3063
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

On 2021-11-15 16:42, Andy Shevchenko wrote:
> We have a special helper to get fwnode out of struct device.
> Moreover, dereferencing it directly prevents the fwnode
> modifications in the future.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/muxes/i2c-mux-gpio.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
> index 31e6eb1591bb..b09c10f36ddb 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpio.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
> @@ -53,6 +53,7 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
>  				 struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
>  	struct device_node *np = dev->of_node;

It feels like there is opportunity to get rid of np, but I suppose that can be
done later...

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter

>  	struct device_node *adapter_np;
>  	struct i2c_adapter *adapter = NULL;
> @@ -60,7 +61,7 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
>  	unsigned *values;
>  	int rc, i = 0;
>  
> -	if (is_of_node(dev->fwnode)) {
> +	if (is_of_node(fwnode)) {
>  		if (!np)
>  			return -ENODEV;
>  
> @@ -72,7 +73,7 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
>  		adapter = of_find_i2c_adapter_by_node(adapter_np);
>  		of_node_put(adapter_np);
>  
> -	} else if (is_acpi_node(dev->fwnode)) {
> +	} else if (is_acpi_node(fwnode)) {
>  		/*
>  		 * In ACPI land the mux should be a direct child of the i2c
>  		 * bus it muxes.
> @@ -111,7 +112,7 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
>  	}
>  	mux->data.values = values;
>  
> -	if (fwnode_property_read_u32(dev->fwnode, "idle-state", &mux->data.idle))
> +	if (device_property_read_u32(dev, "idle-state", &mux->data.idle))
>  		mux->data.idle = I2C_MUX_GPIO_NO_IDLE;
>  
>  	return 0;
> 
