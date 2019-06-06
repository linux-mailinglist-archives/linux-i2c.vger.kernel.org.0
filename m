Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC19373C8
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 14:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbfFFMGx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 08:06:53 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36439 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726922AbfFFMGx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 08:06:53 -0400
Received: by mail-lf1-f65.google.com with SMTP id q26so1355174lfc.3;
        Thu, 06 Jun 2019 05:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R7ZNJlaqp8GSpG9iatV9CsosxNubuXEWB8hYZg3ZABo=;
        b=KSyEVJWQEAGeNjkM0M25ea194Kr78Z0HoM1QpSkVGhD2e7pB9J2vbVJ/G4sCHXMCFn
         DDmW8pFDKIQugaRdyOHf3C+AvfcyKJyHELE4j/JzZUxBBidg1v5uB6kYRRzO88wHQbrK
         oa6eUu57sSpximL+edAi8vlcsrWLz/728il0PtWj1d+HOUf31d81lt0VSIwQKK+yzEOk
         dPefFCB+ZTLKVs73eGPukGyf6l0nCxpDp0rsDY28b+7aDcuFWi/GUsgLzCSh7hEwzjfi
         sbXOMaGbm6pviz3ab4z34mJmcvZhzu6fsMOCsEns9VmA3u6oHQCO3rf5YvSqN80zELZ8
         PoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R7ZNJlaqp8GSpG9iatV9CsosxNubuXEWB8hYZg3ZABo=;
        b=e5EA9v6fkEaTqYFIjYyqByCquWiYwXiCKYh4jL0LcdHmrKjof8iL8i4ePjY9WUbQPU
         jTEiNvEHc3XOafVBmVWHkYJXhNKLwv3gYl50uv4P1SG5xTUwPNzgXk0Sv0V6215TR2iL
         2HI9L0Y2CzSvOKT9o//sdkxpeZVAd/3dQJ3XH0kNXuVJ1ZWZAEGquRzg5+UZ5I56gJbY
         VzQf7Wem9A4npHpdGkLJi6ktBi3lXMkFjLy/KqMsp2/oj+ab4LRwJCTt60VDnZjNL77z
         4lTcmWIS6JNuWM3IGDGqPftDK2kzj4LbhCcVp6YpGF3DBXYoo/RRGrSsZissMrTdl2Ma
         uZ/g==
X-Gm-Message-State: APjAAAVG2zUCZkg1kEKbawZFdulmP0lLUw0ArRMJ/osuWkhTbjBhkd0/
        VciDAFcPlrPsVS8+c5rM075u7HAr
X-Google-Smtp-Source: APXvYqxO+aCdvSb2nD0dOik+RwlSYkhPGiPvJpNMWZMh2EeMXfs6t6PoEUMrsGEKeXF5z7iiVWJ13A==
X-Received: by 2002:ac2:5446:: with SMTP id d6mr23084965lfn.138.1559822810432;
        Thu, 06 Jun 2019 05:06:50 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id 1sm304424ljt.78.2019.06.06.05.06.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 05:06:49 -0700 (PDT)
Subject: Re: [PATCH V2] i2c: busses: tegra: Add suspend-resume support
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559800475-5446-1-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <bf93e88f-cbed-3bb0-223a-74ad0b08aa9e@gmail.com>
Date:   Thu, 6 Jun 2019 15:06:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559800475-5446-1-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

06.06.2019 8:54, Bitan Biswas пишет:
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
>  drivers/i2c/busses/i2c-tegra.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index ebaa78d..76b7926 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1687,7 +1687,30 @@ static int tegra_i2c_remove(struct platform_device *pdev)
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
> +	int ret;
> +
> +	ret = tegra_i2c_init(i2c_dev, false);
> +	if (ret)
> +		return ret;

We're expecting that tegra_i2c_init returns a error code on a failure
and nothing else, hence it will be a bit more expressive to name the
returned variable as "err". There is nothing wrong with yours variant,
this is just a very minor recommendation from me. Please note that a bit
more wise choice of the names makes easier to follow the code for other
people and hence results in a cleaner code.

> +
> +	i2c_mark_adapter_resumed(&i2c_dev->adapter);

Please add a blank line here for a better readability and to make the
patch consistent. You added the blank line in a similar case of
tegra_i2c_suspend() and this makes it inconsistent.

> +	return 0;
> +}
> +
>  static const struct dev_pm_ops tegra_i2c_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(tegra_i2c_suspend, tegra_i2c_resume)
>  	SET_RUNTIME_PM_OPS(tegra_i2c_runtime_suspend, tegra_i2c_runtime_resume,
>  			   NULL)
>  };
> 
