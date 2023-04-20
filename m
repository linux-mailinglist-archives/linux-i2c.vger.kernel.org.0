Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4521A6E968A
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Apr 2023 16:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbjDTODG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Apr 2023 10:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjDTODF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Apr 2023 10:03:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8821269E;
        Thu, 20 Apr 2023 07:03:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4B25F621C0;
        Thu, 20 Apr 2023 14:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCF6C433EF;
        Thu, 20 Apr 2023 14:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681999381;
        bh=CwmiKbG2qMMWKyV7Za5sDQLPEK5nvRLIFuIy31VVq0Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ooVO/sDaTq7Pn7hnyFpx7c4b8EsXpnTqku8MOD11yybFf3BmKwFyfia2d0nTtIGXo
         eivszhuo/HXIBdnQOroLoRiXwFv+zREVghlr28z6n4Nb2VXCxPPQsvsrgP6cnEQoaa
         bplrR3Zfd5bDWNXLBu2PdWID0+BfVqt0dEZu4+jHV4p93Qrvoil3qFe4a3aF5A5ciH
         wGLr1LzJaeO58XqoE3Dase+6wIXrTg3C0m0Dx1+3oyhjBVFjlc8INULQLHad80AuCy
         d6a4e3Dw216qEw6Rq6AUDfy48jc1d7ZD2m4P5xOLGvZ/O9g+3NOJ5JoJdtnsyb+XUg
         yaqqS/7FItxDA==
Date:   Thu, 20 Apr 2023 15:02:56 +0100
From:   Lee Jones <lee@kernel.org>
To:     Benjamin Bara <bbara93@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, rafael.j.wysocki@intel.com,
        dmitry.osipenko@collabora.com, peterz@infradead.org,
        jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v5 5/6] mfd: tps6586x: use devm-based power off handler
Message-ID: <20230420140256.GG996918@google.com>
References: <20230327-tegra-pmic-reboot-v5-0-ab090e03284d@skidata.com>
 <20230327-tegra-pmic-reboot-v5-5-ab090e03284d@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230327-tegra-pmic-reboot-v5-5-ab090e03284d@skidata.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 18 Apr 2023, Benjamin Bara wrote:

> From: Benjamin Bara <benjamin.bara@skidata.com>
> 
> Convert the power off handler to a devm-based power off handler.
> 
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
>  drivers/mfd/tps6586x.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
> index 2d947f3f606a..226e856e34e0 100644
> --- a/drivers/mfd/tps6586x.c
> +++ b/drivers/mfd/tps6586x.c
> @@ -22,6 +22,7 @@
>  #include <linux/err.h>
>  #include <linux/i2c.h>
>  #include <linux/platform_device.h>
> +#include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/of.h>
>  
> @@ -457,13 +458,21 @@ static const struct regmap_config tps6586x_regmap_config = {
>  	.cache_type = REGCACHE_RBTREE,
>  };
>  
> -static struct device *tps6586x_dev;
> -static void tps6586x_power_off(void)
> +static int tps6586x_power_off_handler(struct sys_off_data *data)
>  {
> -	if (tps6586x_clr_bits(tps6586x_dev, TPS6586X_SUPPLYENE, EXITSLREQ_BIT))
> -		return;
> +	int ret;
> +
> +	/* bring pmic into SLEEP state. this takes at least 10ms. */

"Put the PMIC into a sleep state. This takes at least 10sm."

> +	ret = tps6586x_clr_bits(data->dev, TPS6586X_SUPPLYENE, EXITSLREQ_BIT);
> +	if (ret)
> +		return notifier_from_errno(ret);
> +
> +	ret = tps6586x_set_bits(data->dev, TPS6586X_SUPPLYENE, SLEEP_MODE_BIT);
> +	if (ret)
> +		return notifier_from_errno(ret);
>  
> -	tps6586x_set_bits(tps6586x_dev, TPS6586X_SUPPLYENE, SLEEP_MODE_BIT);
> +	mdelay(50);
> +	return notifier_from_errno(-ETIME);
>  }
>  
>  static void tps6586x_print_version(struct i2c_client *client, int version)
> @@ -559,9 +568,13 @@ static int tps6586x_i2c_probe(struct i2c_client *client)
>  		goto err_add_devs;
>  	}
>  
> -	if (pdata->pm_off && !pm_power_off) {
> -		tps6586x_dev = &client->dev;
> -		pm_power_off = tps6586x_power_off;
> +	if (pdata->pm_off) {
> +		ret = devm_register_power_off_handler(&client->dev, &tps6586x_power_off_handler,
> +						      NULL);
> +		if (ret) {
> +			dev_err(&client->dev, "register power off handler failed: %d\n", ret);
> +			goto err_add_devs;
> +		}
>  	}
>  
>  	return 0;
> 
> -- 
> 2.34.1
> 

-- 
Lee Jones [李琼斯]
