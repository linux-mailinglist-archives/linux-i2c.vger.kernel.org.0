Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9485A7493CD
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 04:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232505AbjGFChr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 22:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjGFChq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 22:37:46 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E003199E;
        Wed,  5 Jul 2023 19:37:45 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QxLFl5mgpz67HqD;
        Thu,  6 Jul 2023 10:34:19 +0800 (CST)
Received: from localhost (10.34.206.101) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 6 Jul
 2023 03:37:41 +0100
Date:   Thu, 6 Jul 2023 10:37:37 +0800
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/23] i2c: kempld: Remove #ifdef guards for PM related
 functions
Message-ID: <20230706103737.00007497@Huawei.com>
In-Reply-To: <20230705204314.89800-12-paul@crapouillou.net>
References: <20230705204314.89800-1-paul@crapouillou.net>
        <20230705204314.89800-12-paul@crapouillou.net>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.34.206.101]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
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

On Wed,  5 Jul 2023 22:43:02 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Note that the driver should most likely be updated to use the
> platform_driver.driver.pm.{suspend,resume} callbacks.

Agreed.  In this particular case I'd be tempted to do that first
so that we don't introduce pm_ptr() usage for these hooks.
Look at the platform device core, I suspect they should be pm_sleep_ptr()
but not 100% sure.

Jonathan

> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/i2c/busses/i2c-kempld.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-kempld.c b/drivers/i2c/busses/i2c-kempld.c
> index 281058e3ea46..cb61e7b9202c 100644
> --- a/drivers/i2c/busses/i2c-kempld.c
> +++ b/drivers/i2c/busses/i2c-kempld.c
> @@ -350,7 +350,6 @@ static void kempld_i2c_remove(struct platform_device *pdev)
>  	i2c_del_adapter(&i2c->adap);
>  }
>  
> -#ifdef CONFIG_PM
>  static int kempld_i2c_suspend(struct platform_device *pdev, pm_message_t state)
>  {
>  	struct kempld_i2c_data *i2c = platform_get_drvdata(pdev);
> @@ -377,10 +376,6 @@ static int kempld_i2c_resume(struct platform_device *pdev)
>  
>  	return 0;
>  }
> -#else
> -#define kempld_i2c_suspend	NULL
> -#define kempld_i2c_resume	NULL
> -#endif
>  
>  static struct platform_driver kempld_i2c_driver = {
>  	.driver = {
> @@ -388,8 +383,8 @@ static struct platform_driver kempld_i2c_driver = {
>  	},
>  	.probe		= kempld_i2c_probe,
>  	.remove_new	= kempld_i2c_remove,
> -	.suspend	= kempld_i2c_suspend,
> -	.resume		= kempld_i2c_resume,
> +	.suspend	= pm_ptr(kempld_i2c_suspend),
> +	.resume		= pm_ptr(kempld_i2c_resume),
>  };
>  
>  module_platform_driver(kempld_i2c_driver);

