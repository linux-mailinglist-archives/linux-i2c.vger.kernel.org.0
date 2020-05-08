Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D95161CB27D
	for <lists+linux-i2c@lfdr.de>; Fri,  8 May 2020 17:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbgEHPFr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 May 2020 11:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbgEHPFq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 May 2020 11:05:46 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60283C061A0C;
        Fri,  8 May 2020 08:05:46 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u6so2016398ljl.6;
        Fri, 08 May 2020 08:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EWYqx4RC2T1AU2xzG4+mt4v88KV8ydAUy/Ny41WiqtY=;
        b=RAHWnDFaU1VGGXWup+RQ6CccDu6vVM9eSgQax07UxQl5DUSx/Iqs5bQ+t+/7t8YKzu
         qeUgZQRA7hEk+6/6BMaWBc1MEuGUhbTgBhFWlN+apWtn5N51IQpf69AJIvyv5XLkawVm
         wX4UDJeT2k2p6D2l0msZ6pmtay//2J9xSNBvGQG2rKvDi7rtbkFwSLSEEgwtV/6tfS6M
         6tsXGQzz+dcmYRNaN2qUxOOQ7ve1F9FjvV1+kLfjWSN0pkSbgVMbGyFDzXWe7YnV3+KC
         bq2/IkUhIEXlXdq9hb6Z5/jhokD4eSLP2jiEYBCDBbWs4C+CV+GInvFiDvC3rliIp+A5
         3DYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EWYqx4RC2T1AU2xzG4+mt4v88KV8ydAUy/Ny41WiqtY=;
        b=Tg0pQiKiPdsHrYh0N9jTweVKJq2+252Y0ykf+ta7jeRH/Y/IWLI2FInLLwhomenNh+
         mNHWubMjTvBLmNd+3uopPwjBbEGLuxNwRT8yGAd5jGu2dnnBRxuvT033TSzuiQ3naAJd
         IxLS/yK+3Io/hFKNjWcvtudNGULrIJ+rX6CncgvSMjMO0EjdDLzBCJxjlV2/Qg5Cp6Ro
         CHlj87FcReW8xZDARQ5nDV5NnfqB/o0Vzg5FJ4VCDzSAbrrzGaiqJ4AOy0Tby2cB25Qx
         9MQ0MlmnEcBH75H35TjUmVOP/LohaLY1NmdvLw+odzp94fLxJ18bwILIW9W/mWzVPIHn
         5OMw==
X-Gm-Message-State: AOAM531SxGwXU1QrcoViJh7B6io1lw2PHK2MIoJE+dqqB8WaQc3X4Lpp
        yZyTGsFEK4xNTYjZI071ZOzvLeib
X-Google-Smtp-Source: ABdhPJypUIl3qL8pvJR5e9s9Lg+SRV6e2F4v/perCgCLtDI5zz2fNRVuNqoZad1L1mj982kw20n5qw==
X-Received: by 2002:a2e:b4c2:: with SMTP id r2mr2092843ljm.143.1588950344637;
        Fri, 08 May 2020 08:05:44 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id r20sm1371844ljj.44.2020.05.08.08.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2020 08:05:43 -0700 (PDT)
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
To:     Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2df64c60-cbb4-8d38-121f-99a3c3877142@gmail.com>
Date:   Fri, 8 May 2020 18:05:43 +0300
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
...
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

Could you please explain what determines whether I2C is RPM-suspended or
resumed during of the system's suspension?
