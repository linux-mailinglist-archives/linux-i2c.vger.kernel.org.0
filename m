Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F281E583B
	for <lists+linux-i2c@lfdr.de>; Thu, 28 May 2020 09:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725859AbgE1HKS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 May 2020 03:10:18 -0400
Received: from mail-eopbgr760077.outbound.protection.outlook.com ([40.107.76.77]:6177
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725601AbgE1HKR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 May 2020 03:10:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYw1DR7zqhfxWO9sNqnNmu1aJwotM4+pmFhUUBVBgLLL3BoSi9RC5OJG43RVKZsPB2cL8gDUFJdOgPguwvmqBK0SqdcNLoUKYHYqLhuXSSf6c/y7oW9ApBSIputgrwseW39P8jjLgEOGmE21X7m3jpHy8AhB1Q19yK2Vo0bm4o8X8DjP2r0o9m/9zmG7BZ/dtk4NZSm1fXt8P1aPIwl1OjPk8XkIURiL5HSIYIZL5RMDsXO7YRzqavhXJcSy+/kO9HCFHhN+2rvMNdyJKJknQB69KMnZY8AHQctp44AIF+gUOTx2ZYFAif3j8u4dZKLRn8FKaViSVcVrzUW1oSeIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yo5XIVYbcZd3zY2YMVHAGmh9TmM4n0N969d0a7nzNU4=;
 b=eTqmRFSe3jP/DKytbXINrUnVaxj3M8WAWUNlhcYf56vf9rPBkdWeRcKvUzvRd0zxmOWF7nu6nJh4Ilt/XL9FDE9u/+iTOQDaHHO1EYq+eIvup+RDa7POKsaiKUzsE0Z7/Fru66vpX5unxrw7T4eqr+fX4M/9jzvzHKykgdlMNY+d8vhM22eep8tc02Vsjge50p81+rgRvkhW5OMN9/X+7h4/VF/s0qHxA6rMNV7A9CwIXfBTR6Vkd3T+Nw72+dX60PXywHleWC7yaz3lwWBQZi9Z7l6xVuAOUz+ZZ/N6skIhI56fccHnI1SLyk8x5sKXk4npxgOB7nTNrTllkUUgCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=the-dreams.de smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yo5XIVYbcZd3zY2YMVHAGmh9TmM4n0N969d0a7nzNU4=;
 b=HWhXyj6TxsXEhT/vq3TTVjZGDz78HNGZ1KiWq42klfuMJBkgOcitv0vS/Yk7VyRmslSqghz0+Kk8i5D90GlnAgB1qkqQBphjy+PTD1/mHPVqPpVUDQuT8eczyzdyVI7R1j4Z3usYMMUsSItq5cCp1fdeEYMRXhmWFbTIXaD8VxM=
Received: from SN1PR12CA0104.namprd12.prod.outlook.com (2603:10b6:802:21::39)
 by DM5PR02MB2524.namprd02.prod.outlook.com (2603:10b6:3:3a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Thu, 28 May
 2020 07:10:13 +0000
Received: from SN1NAM02FT005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:21:cafe::76) by SN1PR12CA0104.outlook.office365.com
 (2603:10b6:802:21::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend
 Transport; Thu, 28 May 2020 07:10:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT005.mail.protection.outlook.com (10.152.72.117) with Microsoft SMTP
 Server id 15.20.3045.17 via Frontend Transport; Thu, 28 May 2020 07:10:13
 +0000
Received: from [149.199.38.66] (port=56687 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jeCfX-0007hj-D5; Thu, 28 May 2020 00:09:35 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jeCg8-0002qZ-Mt; Thu, 28 May 2020 00:10:12 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jeCg4-0002br-IR; Thu, 28 May 2020 00:10:08 -0700
Subject: Re: [PATCH v3 2/2] i2c: busses: convert to
 devm_platform_request_irq()
To:     Dejin Zheng <zhengdejin5@gmail.com>, corbet@lwn.net,
        gregkh@linuxfoundation.org, michal.simek@xilinx.com,
        wsa+renesas@sang-engineering.com, linus.walleij@linaro.org,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>
References: <20200527142611.9006-1-zhengdejin5@gmail.com>
 <20200527142611.9006-2-zhengdejin5@gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <ff4d3984-f004-f52a-f75b-9bc6c2a467e3@xilinx.com>
Date:   Thu, 28 May 2020 09:10:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527142611.9006-2-zhengdejin5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(376002)(136003)(396003)(346002)(39860400002)(46966005)(47076004)(2906002)(82740400003)(30864003)(9786002)(478600001)(316002)(31686004)(5660300002)(8936002)(4326008)(336012)(8676002)(426003)(26005)(70586007)(44832011)(82310400002)(81166007)(36756003)(356005)(70206006)(2616005)(83380400001)(31696002)(186003)(6666004)(966005)(43740500002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa43a343-3772-4663-7689-08d802d62a69
X-MS-TrafficTypeDiagnostic: DM5PR02MB2524:
X-Microsoft-Antispam-PRVS: <DM5PR02MB25249B60A2A5717261B17238C68E0@DM5PR02MB2524.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-Forefront-PRVS: 0417A3FFD2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YgqIqH+LAsz6PLpZlXo9iw3mC5+CmMpPB45oiXHhhrYoBOHtC566QNPduEyfQqsZjTO5smId11pQd65RIKOtS7dByc2GkLp/wTUKjiSa32qecU0cWZrdHmsvT9arT5uz4U+l3Jjz6j9IYiAwz6g8RDGP0d7pWcclFBsAT8Msqj+CgCLQfErB5bjumtdFf3jWoAAVm9e3oZAnV5k9NG+D1eU63Ra7GGNSNxkJPp98B8XRe4jcsRNRZ24INomo1S2RZiZNWdcM3WvRt5NfQSf9EPr8uR+qu+/FpFP19tltg5JBWm3J9661KtTNe1KDGZDAvPq9WVH+mJkXC9ptmy4379sbV4HSHgFXeHvZYqgVHZHZlwyjhw+O4rG1Dcw7u0BZPWxmF1xdcYphuxdfN6F3JjdeTtzjrNyOExTpWMMMw0G8ANlhAp3wmkFhkCkWPzJbnyvsq15EgS6fUI+U8B9bQE3aHyac2z3do+UkC7Qr+HsFSDbG2SMJGhlMKXVlFjf8
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2020 07:10:13.0596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa43a343-3772-4663-7689-08d802d62a69
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2524
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27. 05. 20 16:26, Dejin Zheng wrote:
> Use devm_platform_request_irq() to simplify code, and it contains
> platform_get_irq() and devm_request_irq().
> 
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> v2 -> v3:
> 	- no changed and Thanks linus's review.
> v1 -> v2:
> 	- The patch content has not changed. just resend it by this discussion:
> 	  https://patchwork.ozlabs.org/project/linux-i2c/patch/20200520144821.8069-1-zhengdejin5@gmail.com/
> 
>  drivers/i2c/busses/i2c-bcm-kona.c  | 16 +++-------------
>  drivers/i2c/busses/i2c-cadence.c   | 10 +++-------
>  drivers/i2c/busses/i2c-digicolor.c | 10 +++-------
>  drivers/i2c/busses/i2c-emev2.c     |  5 ++---
>  drivers/i2c/busses/i2c-jz4780.c    |  5 ++---
>  drivers/i2c/busses/i2c-meson.c     | 13 ++++---------
>  drivers/i2c/busses/i2c-mxs.c       |  9 +++------
>  drivers/i2c/busses/i2c-pnx.c       |  9 ++-------
>  drivers/i2c/busses/i2c-rcar.c      |  9 +++------
>  drivers/i2c/busses/i2c-rk3x.c      | 14 +++-----------
>  drivers/i2c/busses/i2c-sirf.c      | 10 ++--------
>  drivers/i2c/busses/i2c-stu300.c    |  4 ++--
>  drivers/i2c/busses/i2c-synquacer.c | 12 +++---------
>  13 files changed, 35 insertions(+), 91 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
> index ed5e1275ae46..f45acb47552a 100644
> --- a/drivers/i2c/busses/i2c-bcm-kona.c
> +++ b/drivers/i2c/busses/i2c-bcm-kona.c
> @@ -818,20 +818,10 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
>  	       ISR_NOACK_MASK,
>  	       dev->base + ISR_OFFSET);
>  
> -	/* Get the interrupt number */
> -	dev->irq = platform_get_irq(pdev, 0);
> -	if (dev->irq < 0) {
> -		rc = dev->irq;
> -		goto probe_disable_clk;
> -	}
> -
> -	/* register the ISR handler */
> -	rc = devm_request_irq(&pdev->dev, dev->irq, bcm_kona_i2c_isr,
> -			      IRQF_SHARED, pdev->name, dev);
> -	if (rc) {
> -		dev_err(dev->device, "failed to request irq %i\n", dev->irq);
> +	rc = devm_platform_request_irq(pdev, 0, &dev->irq, bcm_kona_i2c_isr,
> +					IRQF_SHARED, pdev->name, dev);
> +	if (rc)
>  		goto probe_disable_clk;
> -	}
>  
>  	/* Enable the controller but leave it idle */
>  	bcm_kona_i2c_send_cmd_to_ctrl(dev, BCM_CMD_NOACTION);
> diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
> index 4b72398af505..9ffae4d231dc 100644
> --- a/drivers/i2c/busses/i2c-cadence.c
> +++ b/drivers/i2c/busses/i2c-cadence.c
> @@ -1204,8 +1204,6 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>  	if (IS_ERR(id->membase))
>  		return PTR_ERR(id->membase);
>  
> -	id->irq = platform_get_irq(pdev, 0);
> -
>  	id->adap.owner = THIS_MODULE;
>  	id->adap.dev.of_node = pdev->dev.of_node;
>  	id->adap.algo = &cdns_i2c_algo;
> @@ -1256,12 +1254,10 @@ static int cdns_i2c_probe(struct platform_device *pdev)
>  		goto err_clk_dis;
>  	}
>  
> -	ret = devm_request_irq(&pdev->dev, id->irq, cdns_i2c_isr, 0,
> -				 DRIVER_NAME, id);
> -	if (ret) {
> -		dev_err(&pdev->dev, "cannot get irq %d\n", id->irq);
> +	ret = devm_platform_request_irq(pdev, 0, &id->irq, cdns_i2c_isr, 0,
> +					DRIVER_NAME, id);
> +	if (ret)
>  		goto err_clk_dis;
> -	}
>  
>  	/*
>  	 * Cadence I2C controller has a bug wherein it generates
> diff --git a/drivers/i2c/busses/i2c-digicolor.c b/drivers/i2c/busses/i2c-digicolor.c
> index 332f00437479..9ea965f41396 100644
> --- a/drivers/i2c/busses/i2c-digicolor.c
> +++ b/drivers/i2c/busses/i2c-digicolor.c
> @@ -290,7 +290,7 @@ static int dc_i2c_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
>  	struct dc_i2c *i2c;
> -	int ret = 0, irq;
> +	int ret = 0;
>  
>  	i2c = devm_kzalloc(&pdev->dev, sizeof(struct dc_i2c), GFP_KERNEL);
>  	if (!i2c)
> @@ -314,12 +314,8 @@ static int dc_i2c_probe(struct platform_device *pdev)
>  	if (IS_ERR(i2c->regs))
>  		return PTR_ERR(i2c->regs);
>  
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> -		return irq;
> -
> -	ret = devm_request_irq(&pdev->dev, irq, dc_i2c_irq, 0,
> -			       dev_name(&pdev->dev), i2c);
> +	ret = devm_platform_request_irq(pdev, 0, NULL, dc_i2c_irq, 0,
> +					dev_name(&pdev->dev), i2c);
>  	if (ret < 0)
>  		return ret;
>  
> diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c
> index 1a319352e51b..cae00a9ec86f 100644
> --- a/drivers/i2c/busses/i2c-emev2.c
> +++ b/drivers/i2c/busses/i2c-emev2.c
> @@ -395,9 +395,8 @@ static int em_i2c_probe(struct platform_device *pdev)
>  
>  	em_i2c_reset(&priv->adap);
>  
> -	priv->irq = platform_get_irq(pdev, 0);
> -	ret = devm_request_irq(&pdev->dev, priv->irq, em_i2c_irq_handler, 0,
> -				"em_i2c", priv);
> +	ret = devm_platform_request_irq(pdev, 0, &priv->irq,
> +			em_i2c_irq_handler, 0, "em_i2c", priv);
>  	if (ret)
>  		goto err_clk;
>  
> diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
> index ba831df6661e..27de0309f211 100644
> --- a/drivers/i2c/busses/i2c-jz4780.c
> +++ b/drivers/i2c/busses/i2c-jz4780.c
> @@ -825,9 +825,8 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
>  
>  	jz4780_i2c_writew(i2c, JZ4780_I2C_INTM, 0x0);
>  
> -	i2c->irq = platform_get_irq(pdev, 0);
> -	ret = devm_request_irq(&pdev->dev, i2c->irq, jz4780_i2c_irq, 0,
> -			       dev_name(&pdev->dev), i2c);
> +	ret = devm_platform_request_irq(pdev, 0, &i2c->irq, jz4780_i2c_irq, 0,
> +					dev_name(&pdev->dev), i2c);
>  	if (ret)
>  		goto err;
>  
> diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
> index c5dec572fc48..2e5a855ff20a 100644
> --- a/drivers/i2c/busses/i2c-meson.c
> +++ b/drivers/i2c/busses/i2c-meson.c
> @@ -398,7 +398,7 @@ static int meson_i2c_probe(struct platform_device *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	struct meson_i2c *i2c;
>  	struct i2c_timings timings;
> -	int irq, ret = 0;
> +	int ret = 0;
>  
>  	i2c = devm_kzalloc(&pdev->dev, sizeof(struct meson_i2c), GFP_KERNEL);
>  	if (!i2c)
> @@ -425,15 +425,10 @@ static int meson_i2c_probe(struct platform_device *pdev)
>  	if (IS_ERR(i2c->regs))
>  		return PTR_ERR(i2c->regs);
>  
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> -		return irq;
> -
> -	ret = devm_request_irq(&pdev->dev, irq, meson_i2c_irq, 0, NULL, i2c);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "can't request IRQ\n");
> +	ret = devm_platform_request_irq(pdev, 0, NULL, meson_i2c_irq,
> +					0, NULL, i2c);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	ret = clk_prepare(i2c->clk);
>  	if (ret < 0) {
> diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
> index 9587347447f0..cff82af3208a 100644
> --- a/drivers/i2c/busses/i2c-mxs.c
> +++ b/drivers/i2c/busses/i2c-mxs.c
> @@ -802,7 +802,7 @@ static int mxs_i2c_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct mxs_i2c_dev *i2c;
>  	struct i2c_adapter *adap;
> -	int err, irq;
> +	int err;
>  
>  	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
>  	if (!i2c)
> @@ -817,11 +817,8 @@ static int mxs_i2c_probe(struct platform_device *pdev)
>  	if (IS_ERR(i2c->regs))
>  		return PTR_ERR(i2c->regs);
>  
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> -		return irq;
> -
> -	err = devm_request_irq(dev, irq, mxs_i2c_isr, 0, dev_name(dev), i2c);
> +	err = devm_platform_request_irq(pdev, 0, NULL, mxs_i2c_isr, 0,
> +					dev_name(dev), i2c);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
> index 5d7207c10f1d..3e249373375f 100644
> --- a/drivers/i2c/busses/i2c-pnx.c
> +++ b/drivers/i2c/busses/i2c-pnx.c
> @@ -718,13 +718,8 @@ static int i2c_pnx_probe(struct platform_device *pdev)
>  	}
>  	init_completion(&alg_data->mif.complete);
>  
> -	alg_data->irq = platform_get_irq(pdev, 0);
> -	if (alg_data->irq < 0) {
> -		ret = alg_data->irq;
> -		goto out_clock;
> -	}
> -	ret = devm_request_irq(&pdev->dev, alg_data->irq, i2c_pnx_interrupt,
> -			       0, pdev->name, alg_data);
> +	ret = devm_platform_request_irq(pdev, 0, &alg_data->irq,
> +				i2c_pnx_interrupt, 0, pdev->name, alg_data);
>  	if (ret)
>  		goto out_clock;
>  
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index a45c4bf1ec01..bd59a13de707 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -984,13 +984,10 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>  	else
>  		pm_runtime_put(dev);
>  
> -
> -	priv->irq = platform_get_irq(pdev, 0);
> -	ret = devm_request_irq(dev, priv->irq, rcar_i2c_irq, 0, dev_name(dev), priv);
> -	if (ret < 0) {
> -		dev_err(dev, "cannot get irq %d\n", priv->irq);
> +	ret = devm_platform_request_irq(pdev, 0, &priv->irq, rcar_i2c_irq, 0,
> +					dev_name(dev), priv);
> +	if (ret < 0)
>  		goto out_pm_disable;
> -	}
>  
>  	platform_set_drvdata(pdev, priv);
>  
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index bc698240c4aa..a8d47689de0a 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -1196,7 +1196,6 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
>  	int ret = 0;
>  	int bus_nr;
>  	u32 value;
> -	int irq;
>  	unsigned long clk_rate;
>  
>  	i2c = devm_kzalloc(&pdev->dev, sizeof(struct rk3x_i2c), GFP_KERNEL);
> @@ -1258,17 +1257,10 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	/* IRQ setup */
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> -		return irq;
> -
> -	ret = devm_request_irq(&pdev->dev, irq, rk3x_i2c_irq,
> -			       0, dev_name(&pdev->dev), i2c);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "cannot request IRQ\n");
> +	ret = devm_platform_request_irq(pdev, 0, NULL, rk3x_i2c_irq,
> +					0, dev_name(&pdev->dev), i2c);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	platform_set_drvdata(pdev, i2c);
>  
> diff --git a/drivers/i2c/busses/i2c-sirf.c b/drivers/i2c/busses/i2c-sirf.c
> index d7f72ec331e8..a593c15bfbf5 100644
> --- a/drivers/i2c/busses/i2c-sirf.c
> +++ b/drivers/i2c/busses/i2c-sirf.c
> @@ -274,7 +274,6 @@ static int i2c_sirfsoc_probe(struct platform_device *pdev)
>  	struct clk *clk;
>  	int bitrate;
>  	int ctrl_speed;
> -	int irq;
>  
>  	int err;
>  	u32 regval;
> @@ -314,13 +313,8 @@ static int i2c_sirfsoc_probe(struct platform_device *pdev)
>  		goto out;
>  	}
>  
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		err = irq;
> -		goto out;
> -	}
> -	err = devm_request_irq(&pdev->dev, irq, i2c_sirfsoc_irq, 0,
> -		dev_name(&pdev->dev), siic);
> +	err = devm_platform_request_irq(pdev, 0, NULL, i2c_sirfsoc_irq, 0,
> +					dev_name(&pdev->dev), siic);
>  	if (err)
>  		goto out;
>  
> diff --git a/drivers/i2c/busses/i2c-stu300.c b/drivers/i2c/busses/i2c-stu300.c
> index 64d739baf480..7893c532b8f2 100644
> --- a/drivers/i2c/busses/i2c-stu300.c
> +++ b/drivers/i2c/busses/i2c-stu300.c
> @@ -881,8 +881,8 @@ static int stu300_probe(struct platform_device *pdev)
>  	if (IS_ERR(dev->virtbase))
>  		return PTR_ERR(dev->virtbase);
>  
> -	dev->irq = platform_get_irq(pdev, 0);
> -	ret = devm_request_irq(&pdev->dev, dev->irq, stu300_irh, 0, NAME, dev);
> +	ret = devm_platform_request_irq(pdev, 0, &dev->irq, stu300_irh,
> +					0, NAME, dev);
>  	if (ret < 0)
>  		return ret;
>  
> diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
> index c9a3dba6a75d..d9143373e688 100644
> --- a/drivers/i2c/busses/i2c-synquacer.c
> +++ b/drivers/i2c/busses/i2c-synquacer.c
> @@ -577,16 +577,10 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
>  	if (IS_ERR(i2c->base))
>  		return PTR_ERR(i2c->base);
>  
> -	i2c->irq = platform_get_irq(pdev, 0);
> -	if (i2c->irq < 0)
> -		return -ENODEV;
> -
> -	ret = devm_request_irq(&pdev->dev, i2c->irq, synquacer_i2c_isr,
> -			       0, dev_name(&pdev->dev), i2c);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "cannot claim IRQ %d\n", i2c->irq);
> +	ret = devm_platform_request_irq(pdev, 0, &i2c->irq, synquacer_i2c_isr,
> +					0, dev_name(&pdev->dev), i2c);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	i2c->state = STATE_IDLE;
>  	i2c->dev = &pdev->dev;
> 

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
