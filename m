Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6D53844B
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 08:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfFGG1t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 02:27:49 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42374 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfFGG1t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 02:27:49 -0400
Received: by mail-lf1-f66.google.com with SMTP id y13so698394lfh.9;
        Thu, 06 Jun 2019 23:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rQ9b6+/u+diNabiHcRE//MFPJUhb+OGFksp8HDzi/hU=;
        b=fBgZarhjfXorlEMGFSQnX2nUvbQdTLuG9hbfjj00rUQdWHreO7GeDMonHkak3356zy
         r11ZrF2piYb/v3hUy7iiv/Wh8V7YlJFFJUDpv8hzwrJv/ptm0rKFAtnc4mrEMVdytLuJ
         LgoD+hd7n7gpiWO7fp5Yej+S9s14nKj2Y+pvAhE3m/7QFftSoKlR/M1wX8n/ARkGinBK
         zAF1+UeD0w4/Xg2ItOhwIdMTyLN97TS6Qly6rfggDx01T4dZvkOFp1HchvJBVtL425Fh
         cYovjG/p8pjJGzJitCWdXShIj7C+HYJt0HZY9J0dciRM0SYxuc7SSEdZlemRXF/a6LXd
         nKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rQ9b6+/u+diNabiHcRE//MFPJUhb+OGFksp8HDzi/hU=;
        b=oBtTO6hmOnfJcA+u2jdhRtXYo1GzhNuDajRDw3effiP8Xs4CtS4OmPdQmWu7k7utuZ
         pMN3qCYy/AEK/9y2ro8tDMP2tdXGRs3xSW6AdaBm3mj8qie+teD5gaxIfr6RdBtAj8ub
         OvC7OPYZ0XEIvQkq9v0y7CdyBxsUmrkMO5zxfh3NScZagudzcw+kB+oXsBoIITCZ2nw+
         GMT4YLd5jZApJTiYn7hou6R5J8bRXeiiaBKiZdY/rgXckONbedZ+UQhI1FZpEqbUwQ2Q
         uqxKN/IMQtb+nXuoKIIrLR0h5+syqJHUUnvW15ewAzHDJ2PUFIR0APlT+qCBaMUrh+eF
         ND8Q==
X-Gm-Message-State: APjAAAXN78kCMZWAzx65fm/kibM8DDdPHxm7WkebVpqkaaPBn/L40MGk
        yYiCPD43RuuC34bXN/yjSKqDnxvR
X-Google-Smtp-Source: APXvYqxgAO53ZX14VWcFn/HznS/BNE1wjsgjAQRx60U637GDtOlOSMD0nwqNg6QtiaOekwCEfkjKLA==
X-Received: by 2002:a19:c14f:: with SMTP id r76mr15665324lff.70.1559888867472;
        Thu, 06 Jun 2019 23:27:47 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id k82sm212388ljb.84.2019.06.06.23.27.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 23:27:46 -0700 (PDT)
Subject: Re: [PATCH V3] i2c: busses: tegra: Add suspend-resume support
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559885867-10190-1-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <21a2b722-cd1d-284f-2a4d-99bb12c98afd@gmail.com>
Date:   Fri, 7 Jun 2019 09:27:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559885867-10190-1-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.06.2019 8:37, Bitan Biswas пишет:
> Post suspend I2C registers have power on reset values. Before any
> transfer initialize I2C registers to prevent I2C transfer timeout
> and implement suspend and resume callbacks needed. Fix below errors
> post suspend:
> 
> 1) Tegra I2C transfer timeout during jetson tx2 resume:
> 
> [   27.520613] pca953x 1-0074: calling pca953x_resume+0x0/0x1b0 @ 2939, parent: i2c-1
> [   27.633623] tegra-i2c 3160000.i2c: i2c transfer timed out
> [   27.639162] pca953x 1-0074: Unable to sync registers 0x3-0x5. -110
> [   27.645336] pca953x 1-0074: Failed to sync GPIO dir registers: -110
> [   27.651596] PM: dpm_run_callback(): pca953x_resume+0x0/0x1b0 returns -110
> [   27.658375] pca953x 1-0074: pca953x_resume+0x0/0x1b0 returned -110 after 127152 usecs
> [   27.666194] PM: Device 1-0074 failed to resume: error -110
> 
> 2) Tegra I2C transfer timeout error on jetson Xavier post resume.
> 
> Remove i2c bus lock-unlock calls in resume callback as i2c_mark_adapter_*
> (suspended-resumed) help ensure i2c core calls from client are not
> executed before i2c-tegra resume.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index ebaa78d..1dbba39 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1687,7 +1687,31 @@ static int tegra_i2c_remove(struct platform_device *pdev)
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> +static int tegra_i2c_suspend(struct device *dev)
> +{
> +	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
> +
> +	i2c_mark_adapter_suspended(&i2c_dev->adapter);
> +
> +	return 0;
> +}
> +
> +static int tegra_i2c_resume(struct device *dev)
> +{
> +	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
> +	int err;
> +
> +	err = tegra_i2c_init(i2c_dev, false);
> +	if (err)
> +		return err;
> +
> +	i2c_mark_adapter_resumed(&i2c_dev->adapter);
> +
> +	return 0;
> +}
> +
>  static const struct dev_pm_ops tegra_i2c_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(tegra_i2c_suspend, tegra_i2c_resume)
>  	SET_RUNTIME_PM_OPS(tegra_i2c_runtime_suspend, tegra_i2c_runtime_resume,
>  			   NULL)
>  };
> 

Thanks!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

-- 
Dmitry
