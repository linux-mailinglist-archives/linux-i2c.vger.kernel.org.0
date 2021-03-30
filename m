Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6A734EDCE
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 18:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbhC3Q2U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 12:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231979AbhC3Q2M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Mar 2021 12:28:12 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC977C061574;
        Tue, 30 Mar 2021 09:28:10 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i26so24631718lfl.1;
        Tue, 30 Mar 2021 09:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5S9vYD+Y1macvYqVLIckE0dRGgUHR6sshoajCP4oJTg=;
        b=YEMFen9XPQcc24ENlo4f9OqAr7PAgDIdGHXznIZu7OrwthEc3R3uSs1RtJaQJemc2B
         zKUzYF0KGIkuAQcEhTbeUYRTYGwn1MFGCQQoGH+jDAymqZ0TXNzNFW+c2ny/a/zodk4r
         ZyaxJT7A60byhsl6XLfWTVIoAQBbUsK75l5VF9gb4YBeHxWzo/14GKVa9c4FOse9fja1
         d6o2FNCCYVRdaMfIPEREies3HUfJhw/SrIooWEOn+P3Fm6BPSCWKizSJ3YokLsjzXLzi
         Owo4zLV3ffEWd2RDcV9nTfVUH64CWlr+JKTseUuNTSArJWoX+OVdNUsfMtIPjqa6Azyb
         EhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5S9vYD+Y1macvYqVLIckE0dRGgUHR6sshoajCP4oJTg=;
        b=fvSH9t9hTGP1SPBatqczCtiM0m/p4eJ5Y7zjK5IQbagNo/tx94FNeI9DBFy5akGO05
         u1vbqYCood9fiXnLnNiWhPjfFyrlE0uJB6RDqaGaRjGA+Vb161wUVknifenbjnb7pBg0
         DBiXfH8pDx2mgq6aVA3N/bY80QZTqiZatvwGUed3hRPyqagFZJD0Fvhhn5gKcMBNwRxx
         ouqPkR5aNZX+0tTGtJyTuJTYytSiQ/kFYQBnjNkg5Ks7xNHW96CkgxWg4wTArWIcoYrk
         wVT0IJK9tcXnF6RVGmT00tcbYlpEiBJ3g+h+i6AQkRbEjtMloJx6TCvRdMSlk64jiQiY
         FH8A==
X-Gm-Message-State: AOAM5328+dfB759xCNtuQt1P7U/NeYY6kX9nlmJTH8M6RU34l6y2J40L
        Y7oKI9uGmIFTAvVn5xpULPY=
X-Google-Smtp-Source: ABdhPJwv0NhEcbxAuDoHp8aGllGq1nPQws85PKtVvjKabjjuOjs4zYwjMZpaOsmj5LLWEdRlicqomA==
X-Received: by 2002:ac2:414c:: with SMTP id c12mr20048018lfi.538.1617121689231;
        Tue, 30 Mar 2021 09:28:09 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-98.dynamic.spd-mgts.ru. [109.252.193.98])
        by smtp.googlemail.com with ESMTPSA id u14sm2324973lfl.40.2021.03.30.09.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 09:28:09 -0700 (PDT)
Subject: Re: [PATCH v5 1/5] i2c: core: add managed function for adding i2c
 adapters
To:     Yicong Yang <yangyicong@hisilicon.com>, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org
Cc:     treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, mika.westerberg@linux.intel.com,
        prime.zeng@huawei.com, linuxarm@huawei.com
References: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
 <1617113966-40498-2-git-send-email-yangyicong@hisilicon.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <511f7da1-1a65-884b-cce8-55ffeba76c7c@gmail.com>
Date:   Tue, 30 Mar 2021 19:28:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1617113966-40498-2-git-send-email-yangyicong@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

30.03.2021 17:19, Yicong Yang пишет:
> Some I2C controller drivers will only unregister the I2C
> adapter in their .remove() callback, which can be done
> by simply using a managed variant to add the I2C adapter.
> 
> So add the managed functions for adding the I2C adapter.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/i2c/i2c-core-base.c | 26 ++++++++++++++++++++++++++
>  include/linux/i2c.h         |  1 +
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 63ebf72..de9402c 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1703,6 +1703,32 @@ void i2c_del_adapter(struct i2c_adapter *adap)
>  }
>  EXPORT_SYMBOL(i2c_del_adapter);
>  
> +static void devm_i2c_del_adapter(void *adapter)
> +{
> +	i2c_del_adapter(adapter);
> +}
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
> +	int ret;
> +
> +	ret = i2c_add_adapter(adapter);
> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, devm_i2c_del_adapter, adapter);
> +}
> +EXPORT_SYMBOL_GPL(devm_i2c_add_adapter);
> +
>  static void i2c_parse_timing(struct device *dev, char *prop_name, u32 *cur_val_p,
>  			    u32 def_val, bool use_def)
>  {
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 5662265..10bd0b0 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -844,6 +844,7 @@ static inline void i2c_mark_adapter_resumed(struct i2c_adapter *adap)
>   */
>  #if IS_ENABLED(CONFIG_I2C)
>  int i2c_add_adapter(struct i2c_adapter *adap);
> +int devm_i2c_add_adapter(struct device *dev, struct i2c_adapter *adapter);
>  void i2c_del_adapter(struct i2c_adapter *adap);
>  int i2c_add_numbered_adapter(struct i2c_adapter *adap);
>  
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

