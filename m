Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89FD47493C5
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 04:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjGFCbm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 22:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjGFCbm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 22:31:42 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15DF2DA;
        Wed,  5 Jul 2023 19:31:41 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QxL6l41pwz67KNf;
        Thu,  6 Jul 2023 10:28:15 +0800 (CST)
Received: from localhost (10.34.206.101) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 6 Jul
 2023 03:31:37 +0100
Date:   Thu, 6 Jul 2023 10:31:33 +0800
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 10/23] i2c: img-scb: Remove #ifdef guards for PM related
 functions
Message-ID: <20230706103133.00006b5f@Huawei.com>
In-Reply-To: <20230705204314.89800-11-paul@crapouillou.net>
References: <20230705204314.89800-1-paul@crapouillou.net>
        <20230705204314.89800-11-paul@crapouillou.net>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.34.206.101]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed,  5 Jul 2023 22:43:01 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
I thought the _DEFINE macros weren't really intended for driver
usage and it's good to keep the ability to change those details
without updating lots of drivers.  Perhaps just express it long hand here?

Jonathan


> ---
>  drivers/i2c/busses/i2c-img-scb.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
> index 4b674cfbc6fb..a92e3082542e 100644
> --- a/drivers/i2c/busses/i2c-img-scb.c
> +++ b/drivers/i2c/busses/i2c-img-scb.c
> @@ -1454,7 +1454,6 @@ static int img_i2c_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int img_i2c_suspend(struct device *dev)
>  {
>  	struct img_i2c *i2c = dev_get_drvdata(dev);
> @@ -1482,14 +1481,10 @@ static int img_i2c_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif /* CONFIG_PM_SLEEP */
>  
> -static const struct dev_pm_ops img_i2c_pm = {
> -	SET_RUNTIME_PM_OPS(img_i2c_runtime_suspend,
> -			   img_i2c_runtime_resume,
> -			   NULL)
> -	SET_SYSTEM_SLEEP_PM_OPS(img_i2c_suspend, img_i2c_resume)
> -};
> +static _DEFINE_DEV_PM_OPS(img_i2c_pm, img_i2c_suspend, img_i2c_resume,
> +			  img_i2c_runtime_suspend, img_i2c_runtime_resume,
> +			  NULL);
>  
>  static const struct of_device_id img_scb_i2c_match[] = {
>  	{ .compatible = "img,scb-i2c" },
> @@ -1501,7 +1496,7 @@ static struct platform_driver img_scb_i2c_driver = {
>  	.driver = {
>  		.name		= "img-i2c-scb",
>  		.of_match_table	= img_scb_i2c_match,
> -		.pm		= &img_i2c_pm,
> +		.pm		= pm_ptr(&img_i2c_pm),
>  	},
>  	.probe = img_i2c_probe,
>  	.remove_new = img_i2c_remove,

