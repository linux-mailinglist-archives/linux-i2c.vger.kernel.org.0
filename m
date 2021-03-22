Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2278344C14
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 17:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhCVQp7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 12:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbhCVQpx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Mar 2021 12:45:53 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C05F6C061574
        for <linux-i2c@vger.kernel.org>; Mon, 22 Mar 2021 09:45:52 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id q29so22187170lfb.4
        for <linux-i2c@vger.kernel.org>; Mon, 22 Mar 2021 09:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bGPclpoLMW2vetsVOkk6/xn8Xws0sXzmlSNtidJfaeE=;
        b=RYsm4yUJSIW87Uv22dyw0mIP/8nDAsqBKWtC7HkMgiRqO3qR87SH5IVn8yOybtTTkh
         x79SRV4sI+Msr+IPne1pCx6jK4V10qVBGTowTXH0pYbYsKfCq8HWigI86iSMMCkeiLjl
         tpKfRmnjZk8fdSKeNe99n5JXZWrI7Mi3VZgXWmjf8b/SYFVgtiJj0/fD3zYhUB2y0jLE
         26f3CApT6+kTqk5Df9qq39kZ04tYEqXq+JuNrV/E4f0p8+qHoiHeuhlPLsfu2wV+HymH
         Na8vLEqmM+6pFFtdlrYAASOMSg1jMnAO3sI5C5e9nQTG27+aAGrK/7tdDKWODNov0ASK
         IItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bGPclpoLMW2vetsVOkk6/xn8Xws0sXzmlSNtidJfaeE=;
        b=YHmXWPPODqwzqB/B57KvzYSGp2o8Rl9SLwAPwczsTfBRlCQoxQlTqN9noHgCM/MDYP
         9Xr7VXWVW2ViDFIXnkXypHQxv9AT3lxlHsAKNnpdxfm5ZmmgUjtXas87BWoVwvoALJWD
         07ndAHxHdp9sGwBwUJpX/IMzzHsSJflaY1umEd5NrIrnGe9OcRGWpxB17yVb4kqtH+o+
         vmM43sWl9sknTufFQ9FGAVAEvqqbKLmOG2EyBO43cCGWiD3cXoKxwjWb7w8QlDqTyqPG
         ydVnS9tO5GxI8rtd7aJoE0NZ6Z4KnLj43EYPZ2K+Bl1wqkW+j/YrzHbt/K2lJhYMbL1X
         YE3g==
X-Gm-Message-State: AOAM5309AbEP8+7LI9ICmIWU6ujkBOVMPuKX5aTod3InEXTiJEs8VDAx
        enYrV2uiMlRGEg2EvXRFihk=
X-Google-Smtp-Source: ABdhPJwn3JDolid9WAdalQXRvVebpmb7FPjlmpfN6oVtaFMCSVpiWBSaGJk0mwV7L99cDGOzhoNbZA==
X-Received: by 2002:ac2:5221:: with SMTP id i1mr166418lfl.160.1616431551286;
        Mon, 22 Mar 2021 09:45:51 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-47.dynamic.spd-mgts.ru. [109.252.193.47])
        by smtp.googlemail.com with ESMTPSA id a1sm1996055ljb.76.2021.03.22.09.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 09:45:50 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] i2c: core: add managed function for adding i2c
 adapters
To:     Yicong Yang <yangyicong@hisilicon.com>, wsa@kernel.org,
        linux-i2c@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, treding@nvidia.com,
        jarkko.nikula@linux.intel.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        prime.zeng@huawei.com, linuxarm@huawei.com
References: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
 <1616411413-7177-2-git-send-email-yangyicong@hisilicon.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c306cfc0-8574-9903-af4e-f27b99888d03@gmail.com>
Date:   Mon, 22 Mar 2021 19:45:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1616411413-7177-2-git-send-email-yangyicong@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

22.03.2021 14:10, Yicong Yang пишет:
> Some I2C controller drivers will only unregister the I2C
> adapter in their .remove() callback, which can be done
> by simply using a managed variant to add the I2C adapter.
> 
> So add the managed functions for adding the I2C adapter.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/i2c/i2c-core-base.c | 39 +++++++++++++++++++++++++++++++++++++++
>  include/linux/i2c.h         |  1 +
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 63ebf72..61486dc 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1550,6 +1550,38 @@ int i2c_add_adapter(struct i2c_adapter *adapter)
>  }
>  EXPORT_SYMBOL(i2c_add_adapter);
>  
> +static void devm_i2c_del_adapter(struct device *dev, void *ptr);
> +
> +/**
> + * devm_i2c_add_adapter - device-managed variant of i2c_add_adapter()
> + * @dev: managing device for adding this I2C adapter
> + * @adapter: the adapter to add
> + * Context: can sleep
> + *
> + * Add adapter with dynamic bus number, same with i2c_add_adapter()
> + * but the adapter will be auto deleted on driver detach.
> + */
> +int devm_i2c_add_adapter(struct device *dev, struct i2c_adapter *adapter)
> +{
> +	struct i2c_adapter **ptr;
> +	int ret;
> +
> +	ptr = devres_alloc(devm_i2c_del_adapter, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	ret = i2c_add_adapter(adapter);
> +	if (!ret) {
> +		*ptr = adapter;
> +		devres_add(dev, ptr);
> +	} else {
> +		devres_free(ptr);
> +	}

This could be simplified using devm_add_action_or_reset().

> +	return ret;
> +}
> +EXPORT_SYMBOL(devm_i2c_add_adapter);

EXPORT_SYMBOL_GPL
