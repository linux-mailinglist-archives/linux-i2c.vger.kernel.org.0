Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCE77493D3
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 04:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbjGFCmD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 22:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232978AbjGFCmC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 22:42:02 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA53F19A0;
        Wed,  5 Jul 2023 19:42:01 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QxLLh2btWz67HqD;
        Thu,  6 Jul 2023 10:38:36 +0800 (CST)
Received: from localhost (10.34.206.101) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 6 Jul
 2023 03:41:57 +0100
Date:   Thu, 6 Jul 2023 10:41:53 +0800
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 14/23] i2c: nomadik: Remove #ifdef guards for PM related
 functions
Message-ID: <20230706104153.00007c5f@Huawei.com>
In-Reply-To: <20230705204314.89800-15-paul@crapouillou.net>
References: <20230705204314.89800-1-paul@crapouillou.net>
        <20230705204314.89800-15-paul@crapouillou.net>
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

On Wed,  5 Jul 2023 22:43:05 +0200
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
> 
Might be worth rewrapping the runtime pm line. Otherwise LGTM

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/i2c/busses/i2c-nomadik.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
> index 1e5fd23ef45c..4a4b5bc257ae 100644
> --- a/drivers/i2c/busses/i2c-nomadik.c
> +++ b/drivers/i2c/busses/i2c-nomadik.c
> @@ -873,7 +873,6 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int nmk_i2c_suspend_late(struct device *dev)
>  {
>  	int ret;
> @@ -890,9 +889,7 @@ static int nmk_i2c_resume_early(struct device *dev)
>  {
>  	return pm_runtime_force_resume(dev);
>  }
> -#endif
>  
> -#ifdef CONFIG_PM
>  static int nmk_i2c_runtime_suspend(struct device *dev)
>  {
>  	struct amba_device *adev = to_amba_device(dev);
> @@ -925,13 +922,12 @@ static int nmk_i2c_runtime_resume(struct device *dev)
>  
>  	return ret;
>  }
> -#endif
>  
>  static const struct dev_pm_ops nmk_i2c_pm = {
> -	SET_LATE_SYSTEM_SLEEP_PM_OPS(nmk_i2c_suspend_late, nmk_i2c_resume_early)
> -	SET_RUNTIME_PM_OPS(nmk_i2c_runtime_suspend,
> -			nmk_i2c_runtime_resume,
> -			NULL)
> +	LATE_SYSTEM_SLEEP_PM_OPS(nmk_i2c_suspend_late, nmk_i2c_resume_early)
> +	RUNTIME_PM_OPS(nmk_i2c_runtime_suspend,
> +		       nmk_i2c_runtime_resume,
> +		       NULL)

rewrap?

>  };
>  
>  static unsigned int nmk_i2c_functionality(struct i2c_adapter *adap)
> @@ -1080,7 +1076,7 @@ static struct amba_driver nmk_i2c_driver = {
>  	.drv = {
>  		.owner = THIS_MODULE,
>  		.name = DRIVER_NAME,
> -		.pm = &nmk_i2c_pm,
> +		.pm = pm_ptr(&nmk_i2c_pm),
>  	},
>  	.id_table = nmk_i2c_ids,
>  	.probe = nmk_i2c_probe,

