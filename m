Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C41ED707FEA
	for <lists+linux-i2c@lfdr.de>; Thu, 18 May 2023 13:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbjERLlI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 May 2023 07:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231480AbjERLkw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 May 2023 07:40:52 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511631BC7;
        Thu, 18 May 2023 04:40:30 -0700 (PDT)
Received: from [192.168.2.250] (109-252-144-198.dynamic.spd-mgts.ru [109.252.144.198])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 788F66605961;
        Thu, 18 May 2023 12:40:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1684410022;
        bh=9s7JuhCsRWy8UUnc5Jev3wSLlYiHVqEY4WpnFD5bDyI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=PzbmXSqD99QEEEgn8VlUSEUvOVGEBqtc3C+B1rXOUfCUk5S/lX3oHiiTYp0TSWtKy
         dnBFhSsPui1XCmeJzJLl8xTGp3KAO7WNXGy1hB0mn1IrLZ7BN7P/CfheU5fjAkIUCS
         V9qzDN8zcXoBbGS/iFKpO8V/+qsPDJAyrLkPSdfep+fVEQ6CAIhxs4UFW+8v/LLOe/
         juz3HPNC7WcwjS2bat/JCmQsDT4++HvET81SKibvZDYXgFUq0YCtOiY1oTmEoXq8b4
         MuOWhqxViddppo7hwvsmNndNqfBGzsqYFXxBGqZoN1YTqNJNJboOhy4RoX+wgofVL0
         jRKt8paKPoK7g==
Message-ID: <18254e89-4fc4-a265-3af6-7efc60a58b68@collabora.com>
Date:   Thu, 18 May 2023 14:40:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 4/5] mfd: tps6586x: use devm-based power off handler
Content-Language: en-US
To:     Benjamin Bara <bbara93@gmail.com>, Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee@kernel.org>, rafael.j.wysocki@intel.com
Cc:     peterz@infradead.org, jonathanh@nvidia.com,
        richard.leitner@linux.dev, treding@nvidia.com,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
References: <20230327-tegra-pmic-reboot-v6-0-af44a4cd82e9@skidata.com>
 <20230327-tegra-pmic-reboot-v6-4-af44a4cd82e9@skidata.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v6-4-af44a4cd82e9@skidata.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/9/23 22:03, Benjamin Bara wrote:
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
> index 2d947f3f606a..b12c9e18970a 100644
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
> +	/* Put the PMIC into sleep state. This takes at least 20ms. */
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

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

