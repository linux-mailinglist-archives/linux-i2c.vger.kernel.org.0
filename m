Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4B311DA2B
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 00:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731292AbfLLXnp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Dec 2019 18:43:45 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38120 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfLLXnp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Dec 2019 18:43:45 -0500
Received: by mail-lj1-f195.google.com with SMTP id k8so589632ljh.5;
        Thu, 12 Dec 2019 15:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=llnJRA9ns4b0CgqcafqmnEc5Pr659qyL9gQOjNeNfGU=;
        b=jOflsHDmIQBDdVSHvbaweA1EQ3DVIE7zAH2lnkXZ9PWYZ9HxEr1bwQ2B3LIz3cQkj8
         5ajqKCzpnGp0P5xaX7om9NCPUzXf1z19KlkLvhGGW/wrDlPbm0uybn0LsCyfxVKwqD0b
         pVHR1ZsLnmLNDGN7WzhRXK5IlLDtsD0c+E2GjZ8zf4G4YYGLVdS88FJBSWYNX7P1zn0N
         b0K2Gxazto6cvfK7Sbzq1WoZmI0h4s8JqgZ2b4QhA4fS3Xn1QpE6OpeSoULQIeKWhdLF
         oiGsVLNRQul4uLfWb6P7LnMh8sKkov0Tsr7crq1xo84INbsLdkl1noH+IGa2N3jsM1A1
         OVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=llnJRA9ns4b0CgqcafqmnEc5Pr659qyL9gQOjNeNfGU=;
        b=LDG14HzTjq5xubIVqWQ/cFVzZ8u608UBKjw2iVJEzbUWeGjtp2nBVkrBppBWU9r2yd
         NfdPYgqYdVwGTuIU+/9EjIVbhepQ4557cQEfIBkHsR7rOIxsezD5lu6yeuRv+duL8oHf
         jx0g0KsJ7hovpLzJxej4/TA204R1OgvvaRUGjiREhzR9w47/GZ/LMVVZdlav2mhMcQK6
         A1vgImOu6UT4aD92JnEHzgVE390pjgXlEhzs29buRYi4MhRcReN6l4s2mxdOXyj9YPmU
         ENomp++kQeX2Vw7gHotak8Uucn/Uly/KWDW0tHVjwTIh0QMnH2fP6tA40PWezX9AWAtM
         vOJw==
X-Gm-Message-State: APjAAAWwoO15D0XQhhb5xyJJBqv2iXD09u9cb7i4RVz/kpBTFtHWTi+f
        PA7G1lbzE4wVKUYUpcgwu21JPIjV
X-Google-Smtp-Source: APXvYqzMRksYFdMZ+d2JmQuiTEFeJD4QSonsGbSzTlsp0xzCIZMphd+r9yOJ7yLZFpxDmp8Vt3w1PQ==
X-Received: by 2002:a2e:9157:: with SMTP id q23mr7861331ljg.196.1576194223190;
        Thu, 12 Dec 2019 15:43:43 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id n30sm4043560lfi.54.2019.12.12.15.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 15:43:42 -0800 (PST)
Subject: Re: [PATCH v1 3/3] i2c: tegra: Fix suspending in active runtime PM
 state
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191212233428.14648-1-digetx@gmail.com>
 <20191212233428.14648-4-digetx@gmail.com>
Message-ID: <60d798b5-4cc6-d285-b244-cc5b77aa5a71@gmail.com>
Date:   Fri, 13 Dec 2019 02:43:41 +0300
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
>  
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

It just occurred to me that this patch needs to marked as fixes for the
"i2c: tegra: Move suspend handling to NOIRQ phase" patch because it
broke runtime PM enable-refcount by disabling clock/pinmux on resume
from suspend. For now I'll wait for the review comments. Please review,
thanks in advance.
