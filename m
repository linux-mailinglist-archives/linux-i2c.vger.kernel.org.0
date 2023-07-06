Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66FA4749386
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 04:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbjGFCKt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jul 2023 22:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232923AbjGFCKs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jul 2023 22:10:48 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C1A12A;
        Wed,  5 Jul 2023 19:10:41 -0700 (PDT)
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QxKhJ6srmz6J6dK;
        Thu,  6 Jul 2023 10:08:48 +0800 (CST)
Received: from localhost (10.34.206.101) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 6 Jul
 2023 03:10:37 +0100
Date:   Thu, 6 Jul 2023 10:10:33 +0800
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Wolfram Sang <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 02/23] i2c: au1550: Remove #ifdef guards for PM related
 functions
Message-ID: <20230706101033.0000207e@Huawei.com>
In-Reply-To: <20230705204314.89800-3-paul@crapouillou.net>
References: <20230705204314.89800-1-paul@crapouillou.net>
        <20230705204314.89800-3-paul@crapouillou.net>
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

On Wed,  5 Jul 2023 22:42:53 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> Note that the behaviour is slightly different than before; the original
> code wrapped the suspend/resume with #ifdef CONFIG_PM guards, which
> resulted in these functions being compiled in but never used when
> CONFIG_PM_SLEEP was disabled.
> 
> Now, those functions are only compiled in when CONFIG_PM_SLEEP is
> enabled.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/i2c/busses/i2c-au1550.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-au1550.c b/drivers/i2c/busses/i2c-au1550.c
> index e66c12ecf270..8e43f25c117e 100644
> --- a/drivers/i2c/busses/i2c-au1550.c
> +++ b/drivers/i2c/busses/i2c-au1550.c
> @@ -342,7 +342,6 @@ static void i2c_au1550_remove(struct platform_device *pdev)
>  	i2c_au1550_disable(priv);
>  }
>  
> -#ifdef CONFIG_PM
>  static int i2c_au1550_suspend(struct device *dev)
>  {
>  	struct i2c_au1550_data *priv = dev_get_drvdata(dev);
> @@ -361,21 +360,13 @@ static int i2c_au1550_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static const struct dev_pm_ops i2c_au1550_pmops = {
> -	.suspend	= i2c_au1550_suspend,
> -	.resume		= i2c_au1550_resume,
> -};
> -
> -#define AU1XPSC_SMBUS_PMOPS (&i2c_au1550_pmops)
> -
> -#else
> -#define AU1XPSC_SMBUS_PMOPS NULL
> -#endif
> +static DEFINE_SIMPLE_DEV_PM_OPS(i2c_au1550_pmops,
> +				i2c_au1550_suspend, i2c_au1550_resume);
>  
>  static struct platform_driver au1xpsc_smbus_driver = {
>  	.driver = {
>  		.name	= "au1xpsc_smbus",
> -		.pm	= AU1XPSC_SMBUS_PMOPS,
> +		.pm	= pm_sleep_ptr(&i2c_au1550_pmops),
>  	},
>  	.probe		= i2c_au1550_probe,
>  	.remove_new	= i2c_au1550_remove,

