Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FEEC11E590
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 15:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbfLMO3q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 09:29:46 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39740 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfLMO3q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 09:29:46 -0500
Received: by mail-lj1-f193.google.com with SMTP id e10so2853197ljj.6;
        Fri, 13 Dec 2019 06:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dzOJoViZyzmlBce2YvVe0rRd6r7H8bV+TzqfDck3oOc=;
        b=KeZKPMZoIO7wUHMwZsZ9W3IjN9Ys8z+dw72Qio7PWqWDLsiGiXE6Gx4VBuCcdUIByX
         CNU/eGA9oqca9M7zJJmDuUM+ucvK+riOiqhaAD3ffHNre7hvMzW1OYecExBRHEwN/yh3
         3QZuPMyP/5a0mI/QRKUbImIx7XbjXJB1dRXB5hB1ZmhajpJnpJ2EDR2eclAnMCOlyQlb
         0oHO4Y/kG4JGU4tEEamirI4zhDATVisSs2JxgAzaD0KHb7qYW9KW5tvK+uwWUchN6yTk
         tX/D6xXYZsJCQ5LiHPXT9wPCgnVAHdjylnimxacw9WRhqLX4SHjw9NDSDaLspfDaVW5Z
         h3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dzOJoViZyzmlBce2YvVe0rRd6r7H8bV+TzqfDck3oOc=;
        b=LdWzxMmQOJJ3+B+bV446vf4gbId5HhingHxrBDDYCmrN6EE2VIKrfjUkzkSJ8P4hOh
         JQQtEjOMDDmKy+7BnMZQyX65HO1E1g3eTW+rw0z+s747Ep4ARglN7t3Jg+jvwCDJKDWu
         cs6d7SLi1IGns6H5m7EzXJXeowN38+ndExUHRJwgrnZUWvFrohFIo48ugJmicAfslloO
         5PCe2n5a5lWN/T35OTk4TROogcZ0PpsONxYxXmIE6NG39vjuXuZP0zf45uxBOc5z0u7Z
         HZ7vJ+f526+YDNWxhS4bk8YFfqLOQtvNOhznt7Q/npnXnRkImXbUYUUCVDuMgJ29Xxk5
         GQrQ==
X-Gm-Message-State: APjAAAUTBv37sXnfUz9bm8ulAQ6Y9vspkUUJVg4UplnrKOENIuJWZiEF
        mQZ3BhmhGRg26jAZCfIr8qk=
X-Google-Smtp-Source: APXvYqzUIRA/6pr6C1HZPn0ryqhh2qLm3J/HEId13QznHjQsMIPsZR5tkA+XSTfT1loN4SwUMkt3GQ==
X-Received: by 2002:a2e:810d:: with SMTP id d13mr9909467ljg.113.1576247383751;
        Fri, 13 Dec 2019 06:29:43 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id i13sm4874011ljg.89.2019.12.13.06.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2019 06:29:43 -0800 (PST)
Subject: Re: [PATCH v1 3/3] i2c: tegra: Fix suspending in active runtime PM
 state
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>
References: <20191212233428.14648-1-digetx@gmail.com>
 <20191212233428.14648-4-digetx@gmail.com>
Message-ID: <ae96db3a-0854-6e80-0469-e5fa6fd7bb8e@gmail.com>
Date:   Fri, 13 Dec 2019 17:29:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191212233428.14648-4-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

13.12.2019 02:34, Dmitry Osipenko пишет:
> I noticed that sometime I2C clock is kept enabled during suspend-resume.
> This happens because runtime PM defers dynamic suspension and thus it may
> happen that runtime PM is in active state when system enters into suspend.
> In particular I2C controller that is used for CPU's DVFS is often kept ON
> during suspend because CPU's voltage scaling happens quite often.
> 
> Note: we marked runtime PM as IRQ-safe during the driver's probe in the
> "Support atomic transfers" patch, thus it's okay to enforce runtime PM
> suspend/resume in the NOIRQ phase which is used for the system-level
> suspend/resume of the driver.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index b3ecdd87e91f..d309a314f4d6 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -1790,9 +1790,14 @@ static int tegra_i2c_remove(struct platform_device *pdev)
>  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>  {
>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
> +	int err;
>  
>  	i2c_mark_adapter_suspended(&i2c_dev->adapter);

I'm now in a doubt that it is correct to use NOIRQ level at all for the
suspend because i2c_mark_adapter_suspended() uses mutex, thus I'm
wondering what will happen if there is an asynchronous transfer
happening during suspend..

The i2c_mark_adapter_suspended() will try to block and will never return?

> +	err = pm_runtime_force_suspend(dev);
> +	if (err < 0)
> +		return err;
> +
>  	return 0;
>  }
>  
> @@ -1813,6 +1818,10 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
>  	if (err)
>  		return err;
>  
> +	err = pm_runtime_force_resume(dev);
> +	if (err < 0)
> +		return err;
> +
>  	i2c_mark_adapter_resumed(&i2c_dev->adapter);
>  
>  	return 0;
> 

