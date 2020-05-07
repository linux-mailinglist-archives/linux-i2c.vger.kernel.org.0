Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD041C9DE9
	for <lists+linux-i2c@lfdr.de>; Thu,  7 May 2020 23:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgEGVuN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 May 2020 17:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgEGVuN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 May 2020 17:50:13 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06323C05BD43;
        Thu,  7 May 2020 14:50:12 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id f18so7969663lja.13;
        Thu, 07 May 2020 14:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=41U6IdGyl2aTqqJFmI2Vbfv7pSlY6pFytOZNp3BPIx4=;
        b=aLjM1FrD1GKUPsueKURI0156vKweVH0WCOtQKAx0dDerAO0ienZ9BYmGwzZd/uX2rR
         D3KzJjMZCdEXJ0iRkEevaw8UwjQzqrdtZxZrVFV4d3dgpH64iqsgnk5W3U/7pGRXq9Na
         MmJOGzjpboBpdnNhPk4rsKogO0JInJksWn1cRteKPuKH3ULdYdG0VzDXR3TLGqVh0pFl
         kUkDFPlrHxfvjvnSVEzQezqVsiL89qmF687dgqr0oV7MpLe8XsjwJRjHO1nJaxNCOnuu
         7l6THFHL0LLSDdGU+ap2b//3+kxNG6BublK1Ho3OmgoCcQmboaLBaHED0jUi6dvqZLs2
         SQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=41U6IdGyl2aTqqJFmI2Vbfv7pSlY6pFytOZNp3BPIx4=;
        b=g3jxqaZLskUzrCbA6aQsMQjHcu4BoW9I1JQRuRinfC0o2/AbroXf3WsaYMakwLZEfD
         AMLHDBechsR6l3q4ukLvWX8azlGE7waJDMdTDhKutfmkN4ctilLn4pOBEtv0VJyZ6ZNF
         JA9lmEZoRkXrBKsrKDZe8KwlS2cW25rrBn/uht3PJgtfmnIdx73tm8YLGpziD6uCZ/FE
         0Xgoo7PwC/9Z+OaKXMqWFeCoeSGmXKzBQvI/ToS2JAMvHXpg5lSHpaKJS9giNvgaM6jT
         2efwyvVX89M16oofa86E44D9ujXayOAU5c+L/m0/fgsaWV3ZY2Ph1cu5mMP8T6VqdXyK
         Ielg==
X-Gm-Message-State: AGi0PubmbeypC59aQyT5g50fztns3WG2b4cagat1gi3amA+GZIpxJbyZ
        1ge2+qQ4+9bt7dkR7x5fZFjbXKwF
X-Google-Smtp-Source: APiQypL3//HahkAsh+LvPvIsbb0YvzC3Llst/eQYvuvZd6UtyMfHkmA6xwDXUmxBPH7verQyo5hMBQ==
X-Received: by 2002:a2e:80d2:: with SMTP id r18mr9526882ljg.269.1588888211030;
        Thu, 07 May 2020 14:50:11 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id a25sm4531668lfb.87.2020.05.07.14.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 14:50:10 -0700 (PDT)
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
To:     Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2a0404ac-73bf-2f27-9147-8bef28ae995f@gmail.com>
Date:   Fri, 8 May 2020 00:50:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506193358.2807244-3-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

06.05.2020 22:33, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Depending on the board design, the I2C controllers found on Tegra SoCs
> may require pinmuxing in order to function. This is done as part of the
> driver's runtime suspend/resume operations. However, the PM core does
> not allow devices to go into runtime suspend during system sleep to
> avoid potential races with the suspend/resume of their parents.
> 
> As a result of this, when Tegra SoCs resume from system suspend, their
> I2C controllers may have lost the pinmux state in hardware, whereas the
> pinctrl subsystem is not aware of this. To fix this, make sure that if
> the I2C controller is not runtime suspended, the runtime suspend code is
> still executed in order to disable the module clock (which we don't need
> to be enabled during sleep) and set the pinmux to the idle state.
> 
> Conversely, make sure that the I2C controller is properly resumed when
> waking up from sleep so that pinmux settings are properly restored.
> 
> This fixes a bug seen with DDC transactions to an HDMI monitor timing
> out when resuming from system suspend.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 7c88611c732c..db142d897604 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1769,10 +1769,14 @@ static int tegra_i2c_remove(struct platform_device *pdev)
>  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>  {
>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
> +	int err = 0;
>  
>  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
>  
> -	return 0;
> +	if (!pm_runtime_status_suspended(dev))
> +		err = tegra_i2c_runtime_suspend(dev);
> +
> +	return err;
>  }
>  
>  static int __maybe_unused tegra_i2c_resume(struct device *dev)
> @@ -1788,9 +1792,11 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
>  	if (err)
>  		return err;
>  
> -	err = tegra_i2c_runtime_suspend(dev);
> -	if (err)
> -		return err;
> +	if (pm_runtime_status_suspended(dev)) {
> +		err = tegra_i2c_runtime_suspend(dev);
> +		if (err)
> +			return err;
> +	}
>  
>  	i2c_mark_adapter_resumed(&i2c_dev->adapter);
>  
> 

Is it legal to touch DPAUX registers while DPAUX is in a suspended state?
