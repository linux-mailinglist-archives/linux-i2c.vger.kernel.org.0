Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBCA728F020
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Oct 2020 12:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731114AbgJOKXr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Oct 2020 06:23:47 -0400
Received: from mail-eopbgr150110.outbound.protection.outlook.com ([40.107.15.110]:8233
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726358AbgJOKXr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Oct 2020 06:23:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBWGo9Thf6satLLvLHJGrcAHjrhMPDWzltiFlZJLGXWVL9q+1gxZO5dfTaUD3u3wkiGWM3rb0Khg15Q7g6L7G9XYsYiRJgZ1UL0wGtQwhiAWIAbCaCeg+ERRB/zHNyrui40jgoDjMtucwq4wfkYx/SqmV1wx4aUl9VhdqY7BO9lzo3o2GlEoxhj8roBuUKkFyptrcVgPmbwfQFqTvms4RCsuy5iso4nK1XRYuMLCKsNwFSBmR8c5hRl0DPV7ufe1ioCLYejL9LcMINb+CHTngY4H5hOFgqxVQ3kJjM7BujqyhwkWvyCs5Zx5BFkrIuWRSWKEsvIez9NCa09V+0gAEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I899ycCOudjr1kdzmlERuq15qGXmmTTyIbz2AXqrbkg=;
 b=IAO++a1SKnywkx+FkIdkBzAoarVlmgXnCtgCmlIcYiPnCfuD0AT/grROQ2JQul5wxtCyqamhQsJn9UlFHEDAF1boTIW9jH2RXpdkfmK3rzpLd3w2lfo1lMNrejmiRLse5mpleuSU7xszK4svkIP0WTrer6nb5S778pR1DcPzAj4hVy61da/n+Q6v/xKAhtn2sWt2j1pcJTuyg7zlH3+ECOnlj8f80mb6juFxl5BbDCC7DR/Lpd2z0QX+MRZrnxL8bEWj0sDh6Yg4nlRmH34tSiz660jWeWKe4SIQQ1RJYjOYMnMcSk0ec1TpzwApkVaLVHNVX2vGOotJ6uGqNVXDTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I899ycCOudjr1kdzmlERuq15qGXmmTTyIbz2AXqrbkg=;
 b=FR067iYrqUWITpk81dfDULRs7CTTOFA9RJyUW3rcuGIG0KCLT09DjeK43AnwcfBhbZHQSi6A0LaJn527uLkObsHVLIVmaNvj3HDz4mkeFWzLt+KoSsAHouUdeBceKsXKPo/ydrVcBaSLhQAUBBD16BYhZR4XUf1qIFRHcRPlubI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5963.eurprd02.prod.outlook.com (2603:10a6:10:fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.27; Thu, 15 Oct
 2020 10:23:41 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::9178:a26c:c1e1:636b]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::9178:a26c:c1e1:636b%4]) with mapi id 15.20.3477.020; Thu, 15 Oct 2020
 10:23:41 +0000
Subject: Re: [PATCH v2] i2c: i2c-mux-gpio: Enable this driver in ACPI land
To:     Evan Green <evgreen@chromium.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201014180137.v2.1.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
From:   Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <6ac96561-0415-0ac6-8771-99c8bdee0881@axentia.se>
Date:   Thu, 15 Oct 2020 12:23:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
In-Reply-To: <20201014180137.v2.1.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: sv-SE
Content-Transfer-Encoding: 7bit
X-Originating-IP: [85.229.94.207]
X-ClientProxiedBy: HE1PR0402CA0018.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::28) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.229.94.207) by HE1PR0402CA0018.eurprd04.prod.outlook.com (2603:10a6:3:d0::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend Transport; Thu, 15 Oct 2020 10:23:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 605107cd-33fe-46f6-3508-08d870f46381
X-MS-TrafficTypeDiagnostic: DB8PR02MB5963:
X-Microsoft-Antispam-PRVS: <DB8PR02MB5963D5C50950322AE01B6BAEBC020@DB8PR02MB5963.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 75tjpJs7dnFVPGYmOVuBXhmzFgsYTLi9CH7Y7y/bYEf0RI3VHoiBva7Zglp5TclLoPd2CcF+um8u9P+OpPKsORLfnWMJvBFvVrUBmUyPnKR1QbWvi7c3XptNthu5bbthlxx3c71TDJa0tOotKrNCg4J23HRse4xMlQtbeRlh8Ypc6Ylq07EE6E3ZPOEZHPsOwgbnawBCNGWatyXMCFPVCD9t8BYyJE2C98S2r5rEAsMvDlhclVzBOCluVBhikZFSQTCD8wXX0BrZsGw3myhn8g6z82hiooZ/hhWE06meZwMMZLUpIilVHXOJu4fSFjLaEbyo75434kOMpdf27XNr1iAEfuSTv6MgfeVGssFISS8Myi1gpBSF+/AGkgDbdyvv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR02MB5482.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(366004)(376002)(136003)(396003)(346002)(31686004)(2616005)(8676002)(54906003)(8936002)(36756003)(6486002)(83380400001)(316002)(36916002)(5660300002)(4326008)(52116002)(66946007)(16576012)(6916009)(956004)(66476007)(66556008)(53546011)(2906002)(478600001)(16526019)(186003)(6666004)(4001150100001)(26005)(86362001)(31696002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 98zBnN8kQEDi4ITZoYJjaiRN+cvGSAIcEgPgjRK7kfdqoBWRMAQapRDQVLG02HqOvnuxLbSRlRkCt3qnVIh2HI0QngyvO4FNie0MKTuBD1kuVEPX+zrYGZAPJ38c6q9JOv4PZ9zCWRaGrVjUMztKfRVT7T0vMQO51RJCvRXIl1Q49CFRd/gEk2pb3jce8P+ZsFY+LvyjU1zTQZta4Z6dAMiO/bMc6jYPSBlaiOEq3p+U0XuzoC6Es6inaawGfWCI5BwNdVgKXb7A3zt3i8I/thnF9XX+PMzVpVcuHx3cGxdDc0kbOYlhMFYHcMIRCe6wdfZtyqualCNeNbAR1O2pgyRIbBCrkOZxX6t18p4JxIBk7K4wXZJCH7KT0woKwnxZbg7L8PmglG/FpId9AKSk3TOITVfZabuwOOrjS+hPX21Ao5lPV7eQ2wgCtiuET7SUutAUrxlcX79T6WEnXVZhkyQGc9kE5SZq75bAW/H5Ljz4w7runQ7P5L3BagpEbeW01In7rG8Hn0j7WpsOhlgpbXCjyfDwiBH4WpjmHdIuRmoFLG9mDtQZxuMPmGL37B4StjeMNt5WQ4g+CP4a85vgzxyD04owzOYaCtM1YFS2BTtkgfFSH34qJy3Jlm4+gIDmCTzbdulKTVyJ4TnKq5RnFA==
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 605107cd-33fe-46f6-3508-08d870f46381
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 10:23:41.7887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fR9DslfXHW3ob9+d2D94OKvs/CJUPJzXAyBB7xyzBtUAnDBq56jwgbFw8ATzW8Nk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5963
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

On 2020-10-15 03:02, Evan Green wrote:
> Enable i2c-mux-gpio devices to be defined via ACPI. The idle-state
> property translates directly to a fwnode_property_*() call. The child
> reg property translates naturally into _ADR in ACPI.
> 
> The i2c-parent binding is a relic from the days when all direct children
> of an i2c controller in Linux had to be i2c devices. These days that

I2C controller. I2C devices.

I fail to see why this "relic" has to be explicitly blamed on Linux? In the
beginning, the bindings for all I2C controllers (sometimes implicitely,
sometimes explicitely) specified that all child nodes had to be I2C devices.
The *bindings* were simply not as flexible before the i2c-bus subnode was
invented only a few years ago. So, there are arguments that the "problem"
was in DT-land and that Linux just followed suit.

> implementation detail has been worked out, so the i2c-mux can sit
> as a direct child of its parent controller, which is where it makes the
> most sense from a hardware description perspective. For the ACPI
> implementation we'll assume that's always how the i2c-mux-gpio is
> instantiated.

There is potential to match this and make i2c-parent optional for the
DT case and require it to be a child of its parent in such cases, if
someone has the time/energy...

> 
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
> 
> Changes in v2:
>  - Make it compile properly when !CONFIG_ACPI (Randy)
>  - Update commit message regarding i2c-parent (Peter)
> 
>  drivers/i2c/muxes/i2c-mux-gpio.c | 103 ++++++++++++++++++++++---------
>  1 file changed, 75 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
> index 4effe563e9e8d..8e4008f4a9b5d 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpio.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
> @@ -49,34 +49,80 @@ static int i2c_mux_gpio_deselect(struct i2c_mux_core *muxc, u32 chan)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_OF
> -static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
> -					struct platform_device *pdev)
> +#ifdef CONFIG_ACPI
> +
> +static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
> +				     struct fwnode_handle *fwdev,
> +				     unsigned int *adr)
> +
> +{
> +	unsigned long long adr64;
> +	acpi_status status;
> +
> +	status = acpi_evaluate_integer(ACPI_HANDLE_FWNODE(fwdev),
> +				       METHOD_NAME__ADR,
> +				       NULL, &adr64);
> +
> +	if (!ACPI_SUCCESS(status)) {
> +		dev_err(dev, "Cannot get address");

Missing trailing \n

> +		return -EINVAL;
> +	}
> +
> +	*adr = adr64;

Maybe this is too pedantic? Optional, ignore if I'm just being insane...

	if (*adr != adr64) {
		dev_err(dev, "Address out of range\n");
		return -EINVAL;
	}

> +	return 0;
> +}
> +
> +#else
> +
> +static int i2c_mux_gpio_get_acpi_adr(struct device *dev,
> +				     struct fwnode_handle *fwdev,
> +				     unsigned int *adr)
> +{
> +	return -EINVAL;
> +}
> +
> +#endif
> +
> +static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
> +				 struct platform_device *pdev)
>  {
> -	struct device_node *np = pdev->dev.of_node;
> -	struct device_node *adapter_np, *child;
> -	struct i2c_adapter *adapter;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	acpi_handle dev_handle;

Remove the dev_handle declaration here...(push)...

> +	struct device_node *adapter_np;
> +	struct i2c_adapter *adapter = NULL;
> +	struct fwnode_handle *child = NULL;

Why do you need these two " = NULL" here? I can't believe compilers are
that stupid? If they are, fine. But otherwise, why single out these two
pointers and add NULL only there and not everywhere? But NULL everywhere
would be ugly...

>  	unsigned *values;
> -	int i = 0;
> +	int rc, i = 0;
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

You should do "&pdev->dev" -> "dev" here, because I hate having
the dev variable and then not use it. But that should perhaps be
a preparatory patch, because I see more instances and this is an
orthogonal change.

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

...(pop)...and perhaps say

		acpi_handle dev_handle = ACPI_HANDLE(dev->parent);

here?

Cheers,
Peter

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
> @@ -85,24 +131,25 @@ static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
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
> +			rc = i2c_mux_gpio_get_acpi_adr(dev, child, values + i);
> +			if (rc)
> +				return rc;
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
> @@ -118,7 +165,7 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	if (!dev_get_platdata(&pdev->dev)) {
> -		ret = i2c_mux_gpio_probe_dt(mux, pdev);
> +		ret = i2c_mux_gpio_probe_fw(mux, pdev);
>  		if (ret < 0)
>  			return ret;
>  	} else {
> 
