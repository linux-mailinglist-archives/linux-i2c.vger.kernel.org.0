Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F18A6D3AD2
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 00:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbjDBW3A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Apr 2023 18:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDBW27 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Apr 2023 18:28:59 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43A376BC;
        Sun,  2 Apr 2023 15:28:57 -0700 (PDT)
Received: from [192.168.2.163] (109-252-124-32.nat.spd-mgts.ru [109.252.124.32])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5C11B6602173;
        Sun,  2 Apr 2023 23:28:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1680474536;
        bh=625/nrS34ytvlIXe3/qd7/fKUOfpATTV6iMwKPLv1Gg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=YkoSUAfWgowghwHWPzMNtdvJLH4le5vI/b8B4iTL/FyYSf9izLnRPUNn8RE7z2VQb
         04pUEGH7sO7VvV5EiCbyeUPVn4RDHLK0M5kKWMa5ux3hi5hoh0k5i7x7ZXOQjow3d+
         vgkJAbkTYHgH85kHECww6ylLaf5SgmmvTS9P2XdwUF5j928Ydk9/o83swqOHoe7QV9
         xsnvRm5I88NXHfku1/ivOM9m8vKf5PPJtw8Q+zwSfTcE0cY54n4nkbbcQ/maRu7lxk
         E6lVdPRzpedFqUeyt4pd3yUmyUruAcYKZiASqfAC6HFPslyOEJaMX5QTEvSQOOtC0A
         QzbFnBGmjQslg==
Message-ID: <a6d757b6-1dc7-2bc8-dd19-988baac9aca7@collabora.com>
Date:   Mon, 3 Apr 2023 01:28:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 3/4] mfd: tps6586x: use devm-based power off handler
Content-Language: en-US
To:     Benjamin Bara <bbara93@gmail.com>, Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee@kernel.org>, rafael.j.wysocki@intel.com
Cc:     jonathanh@nvidia.com, richard.leitner@linux.dev,
        treding@nvidia.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Benjamin Bara <benjamin.bara@skidata.com>
References: <20230327-tegra-pmic-reboot-v3-0-3c0ee3567e14@skidata.com>
 <20230327-tegra-pmic-reboot-v3-3-3c0ee3567e14@skidata.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230327-tegra-pmic-reboot-v3-3-3c0ee3567e14@skidata.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/27/23 16:57, Benjamin Bara wrote:
> From: Benjamin Bara <benjamin.bara@skidata.com>
> 
> Convert the power off handler to a devm-based power off handler.
> 
> Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> ---
>  drivers/mfd/tps6586x.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
> index 2d947f3f606a..93f1bf440191 100644
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
> @@ -457,13 +458,16 @@ static const struct regmap_config tps6586x_regmap_config = {
>  	.cache_type = REGCACHE_RBTREE,
>  };
>  
> -static struct device *tps6586x_dev;
> -static void tps6586x_power_off(void)
> +static int tps6586x_power_off_handler(struct sys_off_data *data)
>  {
> -	if (tps6586x_clr_bits(tps6586x_dev, TPS6586X_SUPPLYENE, EXITSLREQ_BIT))
> -		return;
> +	struct device *tps6586x_dev = data->cb_data;
> +	int ret;
> +
> +	ret = tps6586x_clr_bits(tps6586x_dev, TPS6586X_SUPPLYENE, EXITSLREQ_BIT);
> +	if (ret)
> +		return ret;
>  
> -	tps6586x_set_bits(tps6586x_dev, TPS6586X_SUPPLYENE, SLEEP_MODE_BIT);
> +	return tps6586x_set_bits(tps6586x_dev, TPS6586X_SUPPLYENE, SLEEP_MODE_BIT);
>  }
>  
>  static void tps6586x_print_version(struct i2c_client *client, int version)
> @@ -559,9 +563,13 @@ static int tps6586x_i2c_probe(struct i2c_client *client)
>  		goto err_add_devs;
>  	}
>  
> -	if (pdata->pm_off && !pm_power_off) {
> -		tps6586x_dev = &client->dev;
> -		pm_power_off = tps6586x_power_off;
> +	if (pdata->pm_off) {
> +		ret = devm_register_power_off_handler(&client->dev, &tps6586x_power_off_handler,
> +						      &client->dev);
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

