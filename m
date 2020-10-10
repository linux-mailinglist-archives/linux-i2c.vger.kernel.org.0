Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0DA28A334
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Oct 2020 01:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731395AbgJJW5U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Oct 2020 18:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730700AbgJJS7Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Oct 2020 14:59:24 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0703.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::703])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4460C08EA71;
        Sat, 10 Oct 2020 10:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GiJ0r45n6YsG9/gTQj+J4s7xxZKiVvLTlOicUv0BncVlXi40YVkRyEr2cDrMLNANcgGHnutjMZJHAf33A3SXVXAFpWX+PQrSnVQFJ5THVnKqjP8b4TTwbnoKHRswmlb7Ts9+enT6yWZCVTrXgpJMmJiIJbMrlHfTeSqRZYq1oAyUGBIkD+GJZ5bVnvrKi2uxQRTrM9EYoMtzYwYivBhXEj5zfqikeNJFak/aCcmcqP/zhIT+f/kUTvh2gbsupA+rH4WYAL5oWciAR6br/gqCRv7b1AhdtfrIDngHqAIQQjFXOBkm4bBjKbZqjpVQbI78lEJT+MgaTdIRmHrBnBjL3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CFzM7uftIbpwZSa+LlBSXpl7H/wpdXXMDwE5ke9eS0=;
 b=fvDI0o5sJiw9aJqfaef0wQGeqA9gbQSmDV7jcQjiwOwQacmYFRS+t7q4mdgONkDLgZ7lGU3dx97Equo+S8w2qUqnEFU6VuLyWZel5F5kaLy5oHwfDrUL+m3kTgclITYpiChFfEwk93pNcLmlzVpmQ07qmtys7pc/ZAguSI36JU+XC/hBzsD541EWRh/TGNC7vKbwOgI5hEncFjQrAd4JbBzc5Zw+NZVSxphlMIYDvvWKJhc8iKYBYSCt327h7Yydi7yriO9oaViiCTUyoewte2AHxJzg54geQg9gAI1qjyUSK7XEkdp0gFCW/xxBoF03jY0VPgzYcLV5sYXEqZTkCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CFzM7uftIbpwZSa+LlBSXpl7H/wpdXXMDwE5ke9eS0=;
 b=mKjmp+NE4kRN/T8Byc3yk7wME2kHyZczF3rOKcCo4CNCfI3RGtMFuWjC11h/ErpOkj9fTQx8QKHN7drXKo0Z2dJUNSA4xbiFQ0yBI1pa7LK0OgmVmTTHR2fQTfQQL0lIg9CXHA6l0j7YFGLPpKLUYQupU8JOPDnj5FuysawX1+s=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DBAPR02MB6485.eurprd02.prod.outlook.com (2603:10a6:10:19d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Sat, 10 Oct
 2020 17:03:36 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::9178:a26c:c1e1:636b]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::9178:a26c:c1e1:636b%4]) with mapi id 15.20.3455.028; Sat, 10 Oct 2020
 17:03:35 +0000
Subject: Re: [PATCH] i2c: i2c-mux-gpio: Enable this driver in ACPI land
To:     Evan Green <evgreen@chromium.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201009154235.1.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <18912642-12b2-92fa-8667-4e6f4abc3838@axentia.se>
Date:   Sat, 10 Oct 2020 19:03:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <20201009154235.1.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.207]
X-ClientProxiedBy: HE1PR0402CA0047.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::36) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.207) by HE1PR0402CA0047.eurprd04.prod.outlook.com (2603:10a6:7:7c::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend Transport; Sat, 10 Oct 2020 17:03:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 471b95e8-a142-45a4-0083-08d86d3e6cdf
X-MS-TrafficTypeDiagnostic: DBAPR02MB6485:
X-Microsoft-Antispam-PRVS: <DBAPR02MB6485957D4635E30A4AFAC4A2BC090@DBAPR02MB6485.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oU16LidLMGi3yN981Y7JUEQlSGMLybQT4Mw60xzH3+nJEco7YEMCaTkweXQtNyfyv+pkysptO+s3/aVJJa/GXmGtwHIB9/w6sd3W/3itipKErNJsVnTPeHRQ/G4L8MH0Fe376my8ekMdtPI9ypcLlsjV0/V7ik1krDuKG2hvg+m/BJdE0RzrzHGn0mBCb6S6HHPNI6d6CWI4YzRtzmeSHyNLNk6wPcnvg/WqNxlh3GMpuNrpxLChSgKJyoYti10JTvhBDVHkduRZpTSQZIGXVHHJns0RbJZ8YRyVcFj5pvbiTAzF7UwhSYBzFudMojUnCdVdudO2YP7/tf7Ofq+K/MTTAYclcVPv+BRdH0Zi4NJkTIfp0elS3Lvu2Wh+Cat2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(376002)(396003)(39830400003)(346002)(366004)(36756003)(86362001)(31686004)(31696002)(66476007)(66556008)(66946007)(4001150100001)(4326008)(6486002)(478600001)(2906002)(5660300002)(6916009)(54906003)(186003)(26005)(16576012)(956004)(316002)(8676002)(2616005)(8936002)(83380400001)(52116002)(36916002)(53546011)(16526019)(6666004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: eMmx8JAuz5RSQ5H09OzfJ4sd4glXTirjDbkyqks1la11cHpUpUJigBcNWmfyhd5ILRBsc2zAm4KO8UcgOkX0tC2Fv37Brh5CKSdCEuEsofpNxSrdUQZ1AnEXgTXY2fLHEPgKa5BniQxUJOUXXQWIwoKATjC9Vs/DUtXuCJCD9XJxvmkZpbwPavog6MTxKxVJQ6mnBR5e3h/tj+FKQJ+GDBMxBEgkDz0jEyO421H7q6RydB9CR/NEBVBjisgeFC5+yCUhFLDxNRVKX04oVMWF0eRJ4nQqD8gt2GmTQO87wPiPIGJhbXwjRJIbpFEvgD134cPHGyvgwPXACqfGxQJLhjjn8AzSno+Fv3MLWAVpgRe9Q+fKKPwFTBVvrt4fmfimt25KlLfOy5LC5munEY0nl9WRs17l3QszwZt52oP+lMaD8ml5X6GxWC4uU2nELXTkReGeRV0z6OCBdXUVCjy32e7K2kBGWTTusyARLkdLPik2obG5dn1Zn1/2nD5OWSB8+gKMRC/RjAeGHcna8edPEh6VLpCdNaoFLnu/B3fDbRx6XG30cPU9GmCYarZgPpCy0J3q2TM8raJWgQVT3RbwfZDwIF2N7yKUhTuaGKGsmitDMi8VsWp36C6+NjOVUQ8wTjyjsvXmT+jBZfiy/LlVyA==
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 471b95e8-a142-45a4-0083-08d86d3e6cdf
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2020 17:03:35.7427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RmXEyt8w1XIkOULdChR9eBQKNb6w7w2GOdA+k38P0Ru7WMAh+Y9wH1Zp6l7zbfrK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6485
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

On 2020-10-10 00:43, Evan Green wrote:
> Enable i2c-mux-gpio devices to be defined via ACPI. The idle-state
> property translates directly to a fwnode_property_*() call. The child
> reg property translates naturally into _ADR in ACPI.
> 
> The i2c-parent is a little trickier, since of's phandle definition
> suggests the i2c mux could live in a completely different part of
> the tree than its upstream i2c controller. For now in ACPI,

This is so since the I2C gpio-mux predates the "i2c-bus" sub-node of
I2C controllers. At that time *all* sub-nodes of I2C controllers
represented I2C client device, IIUC. With that knowledge, you could
perhaps rephrase the above?

Also, a nit below.

> just assume that the i2c-mux-gpio device will always be a direct
> child of the i2c controller. If the additional flexibility of
> defining muxes in wildly different locations from their parent
> controllers is required, it can be added later.
> 
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
> 
>  drivers/i2c/muxes/i2c-mux-gpio.c | 77 +++++++++++++++++++++-----------
>  1 file changed, 50 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
> index 4effe563e9e8d..f195e95e8a037 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpio.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
> @@ -49,34 +49,46 @@ static int i2c_mux_gpio_deselect(struct i2c_mux_core *muxc, u32 chan)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_OF
> -static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
> -					struct platform_device *pdev)
> +static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
> +				 struct platform_device *pdev)
>  {
> -	struct device_node *np = pdev->dev.of_node;
> -	struct device_node *adapter_np, *child;
> -	struct i2c_adapter *adapter;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	acpi_handle dev_handle;
> +	struct device_node *adapter_np;
> +	struct i2c_adapter *adapter = NULL;
> +	struct fwnode_handle *child = NULL;
>  	unsigned *values;
>  	int i = 0;
>  
> -	if (!np)
> -		return -ENODEV;
> +	if (is_of_node(dev->fwnode)) {
> +		if (!np)
> +			return -ENODEV;
>  
> -	adapter_np = of_parse_phandle(np, "i2c-parent", 0);
> -	if (!adapter_np) {
> -		dev_err(&pdev->dev, "Cannot parse i2c-parent\n");
> -		return -ENODEV;
> +		adapter_np = of_parse_phandle(np, "i2c-parent", 0);
> +		if (!adapter_np) {
> +			dev_err(&pdev->dev, "Cannot parse i2c-parent\n");
> +			return -ENODEV;
> +		}
> +		adapter = of_find_i2c_adapter_by_node(adapter_np);
> +		of_node_put(adapter_np);
> +
> +	} else if (is_acpi_node(dev->fwnode)) {
> +		/*
> +		 * In ACPI land the mux should be a direct child of the i2c
> +		 * bus it muxes.
> +		 */
> +		dev_handle = ACPI_HANDLE(dev->parent);
> +		adapter = i2c_acpi_find_adapter_by_handle(dev_handle);
>  	}
> -	adapter = of_find_i2c_adapter_by_node(adapter_np);
> -	of_node_put(adapter_np);
> +
>  	if (!adapter)
>  		return -EPROBE_DEFER;
>  
>  	mux->data.parent = i2c_adapter_id(adapter);
>  	put_device(&adapter->dev);
>  
> -	mux->data.n_values = of_get_child_count(np);
> -
> +	mux->data.n_values = device_get_child_node_count(dev);
>  	values = devm_kcalloc(&pdev->dev,
>  			      mux->data.n_values, sizeof(*mux->data.values),
>  			      GFP_KERNEL);
> @@ -85,24 +97,35 @@ static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
>  		return -ENOMEM;
>  	}
>  
> -	for_each_child_of_node(np, child) {
> -		of_property_read_u32(child, "reg", values + i);
> +	device_for_each_child_node(dev, child) {
> +		if (is_of_node(child)) {
> +			fwnode_property_read_u32(child, "reg", values + i);
> +
> +		} else if (is_acpi_node(child)) {
> +			unsigned long long adr;
> +			acpi_status status;
> +
> +			status = acpi_evaluate_integer(ACPI_HANDLE_FWNODE(child),
> +						       METHOD_NAME__ADR,
> +						       NULL, &adr);
> +			if (ACPI_SUCCESS(status)) {
> +				*(values + i) = adr;

I would write that as
				values[i] = adr;

Cheers,
Peter

> +
> +			} else {
> +				dev_err(dev, "Cannot get address");
> +				return -EINVAL;
> +			}
> +		}
> +
>  		i++;
>  	}
>  	mux->data.values = values;
>  
> -	if (of_property_read_u32(np, "idle-state", &mux->data.idle))
> +	if (fwnode_property_read_u32(dev->fwnode, "idle-state", &mux->data.idle))
>  		mux->data.idle = I2C_MUX_GPIO_NO_IDLE;
>  
>  	return 0;
>  }
> -#else
> -static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
> -					struct platform_device *pdev)
> -{
> -	return 0;
> -}
> -#endif
>  
>  static int i2c_mux_gpio_probe(struct platform_device *pdev)
>  {
> @@ -118,7 +141,7 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	if (!dev_get_platdata(&pdev->dev)) {
> -		ret = i2c_mux_gpio_probe_dt(mux, pdev);
> +		ret = i2c_mux_gpio_probe_fw(mux, pdev);
>  		if (ret < 0)
>  			return ret;
>  	} else {
> 
