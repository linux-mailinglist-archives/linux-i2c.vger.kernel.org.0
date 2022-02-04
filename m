Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4820D4A9EDD
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 19:21:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377502AbiBDSVP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 13:21:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232792AbiBDSVP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 13:21:15 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0C2C061714
        for <linux-i2c@vger.kernel.org>; Fri,  4 Feb 2022 10:21:15 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id r27so9481803oiw.4
        for <linux-i2c@vger.kernel.org>; Fri, 04 Feb 2022 10:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Sjg3/h2nK5uyxhoSAH+qELASNv/xBxoCTa1jePZCaCY=;
        b=IO/TkgdLu64llDCWqOzo75erYz/vjtMgwCU0O3m7Tg5IysMgr5DG9VmVeV0A2K49zW
         HfVoPaAodqvSSxTkTcGyAY7E54/FnpX2AsjMxrTPtwgsa8fGTXLiFH+itiI7VAQj3NH+
         b2KC9XeuqbGnf8SAtI7XIecDO1/DQho8BQ2YsThnXGwq9TgexYlS/om3PA8RoNfuHMDQ
         23pja2nJv1U/LdniMxN7kiInFQmaYYJ+LNbv/5qevh6f1JWjMDsi2lXoMPyDBJ9ZZzPS
         ShenpnzPAESO91Vkned0gn9bU3zTozcKMxktFhXPhcyD7aWmt2eDWUArjePpEpqcpdLD
         /QwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Sjg3/h2nK5uyxhoSAH+qELASNv/xBxoCTa1jePZCaCY=;
        b=TrOfe+ItlM3gkx9rHhCOLJSv2LIpM7OZ/LSbfEkQ15Rl/q7w+giEeTYQ8TnwvGZyWn
         b0Tf7c9V4VHCzeVBIavAyRGg2fdfNMmJaO++l5HB3OgZPCXW9doQzTmRVfllWomQAC3G
         04FQpttstMLXgus+TQHLfuPrtXjyGRHveeqmnRovz+abm4/1udeH17mmRRHUggOcO1G6
         H+NrxfVP6AOs5m8GpTWW482Yw0nujZp3Bfm8dtbEyHeLFntUlBz70YD6WA8j3IoAlI2P
         /11XTf4Q2bqk+pXcwIhOX5T7X8taxk5wlvLxiLyIfZCgyV++vQAhM0k4yAJjiOGLR4Xs
         +FDw==
X-Gm-Message-State: AOAM532N6KtN7buR0HIvHHRY1oaOzv+ClW997Ym2DXa1uNq322i3IDmk
        1SIzL7RtSYVVTw7TFMt0DuzlfQ==
X-Google-Smtp-Source: ABdhPJzrfnqdaF/1te/cwRLLNKqTKp6nM2zSXppa+/JdLfdcLjOYW1zqVxEFUz8Phe/p4sbNF7rKRg==
X-Received: by 2002:a05:6808:1444:: with SMTP id x4mr135738oiv.6.1643998874454;
        Fri, 04 Feb 2022 10:21:14 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id v78sm1072126oie.18.2022.02.04.10.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 10:21:14 -0800 (PST)
Date:   Fri, 4 Feb 2022 10:21:30 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 8/9] i2c: qcom-cci: add support of optional vbus-supply
 regulators
Message-ID: <Yf1uqi/lzF5N1txV@ripper>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164711.1712090-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203164711.1712090-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu 03 Feb 08:47 PST 2022, Vladimir Zapolskiy wrote:

> The change adds handling of optional vbus regulators in the driver.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 49 +++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 775945f7b4cd..2fc7f1f2616f 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -11,6 +11,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  
>  #define CCI_HW_VERSION				0x0
>  #define CCI_RESET_CMD				0x004
> @@ -480,6 +481,20 @@ static void cci_disable_clocks(struct cci *cci)
>  static int __maybe_unused cci_suspend_runtime(struct device *dev)
>  {
>  	struct cci *cci = dev_get_drvdata(dev);
> +	struct regulator *bus_regulator;
> +	unsigned int i;
> +
> +	for (i = 0; i < cci->data->num_masters; i++) {
> +		if (!cci->master[i].cci)
> +			continue;
> +
> +		bus_regulator = cci->master[i].adap.bus_regulator;
> +		if (!bus_regulator)
> +			continue;
> +
> +		if (regulator_is_enabled(bus_regulator) > 0)
> +			regulator_disable(bus_regulator);
> +	}
>  
>  	cci_disable_clocks(cci);
>  	return 0;
> @@ -488,12 +503,30 @@ static int __maybe_unused cci_suspend_runtime(struct device *dev)
>  static int __maybe_unused cci_resume_runtime(struct device *dev)
>  {
>  	struct cci *cci = dev_get_drvdata(dev);
> +	struct regulator *bus_regulator;
> +	unsigned int i;
>  	int ret;
>  
>  	ret = cci_enable_clocks(cci);
>  	if (ret)
>  		return ret;
>  
> +	for (i = 0; i < cci->data->num_masters; i++) {
> +		if (!cci->master[i].cci)
> +			continue;
> +
> +		bus_regulator = cci->master[i].adap.bus_regulator;
> +		if (!bus_regulator)
> +			continue;
> +
> +		if (!regulator_is_enabled(bus_regulator)) {

regulator_is_enabled() tests if the regulator is enabled, not if you
have enabled it. So if this is a shared regulator you might learn that
it's already on, skip your regulator_enable() and then the other
consumer turns it off behind your back.

If you want the regulator to be on, you should regulator_enable().

> +			ret = regulator_enable(bus_regulator);
> +			if (ret)
> +				dev_err(dev, "failed to enable regulator: %d\n",
> +					ret);
> +		}
> +	}
> +
>  	cci_init(cci);
>  	return 0;
>  }
> @@ -593,6 +626,7 @@ static int cci_probe(struct platform_device *pdev)
>  	dev_dbg(dev, "CCI HW version = 0x%08x", val);
>  
>  	for_each_available_child_of_node(dev->of_node, child) {
> +		struct regulator *bus_regulator;
>  		struct cci_master *master;
>  		u32 idx;
>  
> @@ -637,6 +671,21 @@ static int cci_probe(struct platform_device *pdev)
>  			master->cci = NULL;
>  			goto error_i2c;
>  		}
> +
> +		/*
> +		 * It might be possible to find an optional vbus supply, but
> +		 * it requires to pass the registration of an I2C adapter
> +		 * device and its association with a bus device tree node.
> +		 */

I'm afraid that I don't understand this comment. The regulator is
optional because most of the time we don't control it explicitly.

So a comment like "Control of IO supply is optional" seems more
relevant.

Regards,
Bjorn

> +		bus_regulator = devm_regulator_get_optional(&master->adap.dev,
> +							    "vbus");
> +		if (IS_ERR(bus_regulator)) {
> +			ret = PTR_ERR(bus_regulator);
> +			if (ret == -EPROBE_DEFER)
> +				goto error_i2c;
> +			bus_regulator = NULL;
> +		}
> +		master->adap.bus_regulator = bus_regulator;
>  	}
>  
>  	ret = cci_reset(cci);
> -- 
> 2.33.0
> 
