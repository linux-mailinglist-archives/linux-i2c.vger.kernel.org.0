Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7592FAE0
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2019 13:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbfE3L1e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 May 2019 07:27:34 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41462 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbfE3L1e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 May 2019 07:27:34 -0400
Received: by mail-lf1-f66.google.com with SMTP id 136so4728984lfa.8;
        Thu, 30 May 2019 04:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JENy3lopc80MuuiSTYnGTbQpOx3WqOUAndzP5hkjx4w=;
        b=ZmxKCWRrz772eNoIL9TX0K3sGashtoYX5uOJp2C3SxKFtNwWHviuIyyVM27VV8EUAc
         6JzDONOGIMSpa91cqdy1Ia28gt5UpF1DM36qH5Zi29Dnbeh1EuaEEDSvzcM4RGQWiK+o
         s9kiRxd+55flyoBu43by+e7FpZ7KmYGy+/GpyXHB+VjfTihSbh+pHhHOrh59aMNJsrn3
         9wAngvmmzrwFM/FYwMHPid+RxbUhoONswax/4cQ1MgWJMpgzNJFh9vkhcRuV/e/yjER5
         A0iSX12zYze0fOuKcKdYHul/g53iy7DrtYePXCPsVO14kxWmI7DeUhTk2tYClGOWjge5
         zEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JENy3lopc80MuuiSTYnGTbQpOx3WqOUAndzP5hkjx4w=;
        b=iPkslVXGN79rc0pngp/J6KSXZCAB9GVyiU9QjAV81+AbGyaO8FmmRyUjO5K697EpF+
         2MQPwIQI76wrieGoH3a9hSpME297WeTnu5CABq/HxMxrJxdxWa6dTBPSbnhMo0qG+AWm
         eCyj4je4Eg+gknTI1WqN52O6aK0470qF4FVRZZNQWgJGclIiKEOWlVcvTywLdDw+xNQf
         PeMrDawThJ94qO8XVrn9BQlnI+CfnhojU3+tjI9u27qEEEQnYp9eVOJZh5FR7Hb693jF
         EocaOeZQQgj8TTY7WGpSEKNuWu4bEehA8Lwy+xtxEsCApbT++zqGJSx2TsuO6S3u47JT
         so0w==
X-Gm-Message-State: APjAAAWZAo+NCvX0M5r52MocUK8uGe/CJW/5IbaLhEb7tRF4q1tbjrLK
        lrKibOa3nIQA+6y+hAu6dxkq2HKS
X-Google-Smtp-Source: APXvYqwTSfyXXvpfDT8aiAY/fiws1afRBScx7FfoqwY3K0Gu+QtxuoAsy0swpn2Y4fWUmFFcH92JfQ==
X-Received: by 2002:a19:7905:: with SMTP id u5mr1815085lfc.117.1559215652093;
        Thu, 30 May 2019 04:27:32 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id u13sm440578lfm.16.2019.05.30.04.27.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 04:27:31 -0700 (PDT)
Subject: Re: [PATCH V1] i2c: busses: tegra: Add suspend-resume support
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559195718-6693-1-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c8bad04b-67ef-bcdf-04df-4aa61271e81c@gmail.com>
Date:   Thu, 30 May 2019 14:27:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559195718-6693-1-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

30.05.2019 8:55, Bitan Biswas пишет:
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
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index ebaa78d..f6a377f 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1687,9 +1687,33 @@ static int tegra_i2c_remove(struct platform_device *pdev)
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
> +	i2c_lock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
> +	ret = tegra_i2c_init(i2c_dev, false);
> +	i2c_unlock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_ADAPTER);

Why the locking is needed here?

> +	if (!ret)
> +		i2c_mark_adapter_resumed(&i2c_dev->adapter);
> +
> +       return ret;

A very minor nit.. will be a bit more straightforward to write this as:

	int err;

	err = tegra_i2c_init(i2c_dev, false);
	if (err)
		return err;

	i2c_mark_adapter_resumed(&i2c_dev->adapter);

	return 0;

It is always cleaner to return 0 on success.

--
Dmitry
