Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0035D222D15
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 22:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgGPUic (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 16:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgGPUib (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 16:38:31 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A34C08C5C0;
        Thu, 16 Jul 2020 13:38:31 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id h19so9760646ljg.13;
        Thu, 16 Jul 2020 13:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dUwf2SMXCQ1iQciXg69AWLDyg5prbuTXReBC1ioTJ8Y=;
        b=SGLwwXq2CI4EVB0UiHTAEqbvsFXDidx0M1N7tS8Rj8WrqXdoYV/rESjLDlwzoJPene
         ZjDSaSYSeVyrU3d7rd3Znj6OqmnKntQ/oAQP1/rxYECMUZB1ZEp2PGyJsKHkmXoDa9gq
         iG1qOU759DQRydOGVrN8b2/qqp95bXNWhbbyic9nGPaNSSdJtMuGXAtsgtmdnLyimoPC
         SnPZQrriIhJ5zUqpyabZ2typEWtiAuDGV6KYWm/XAiDdvqS7UBhPmPFLzmNG3Q9KA5bR
         upsfPKPBZkyqg1gLyOI42Br04BISstAm9B1cIv3lkoZEr+F5z3BjEtdxQlyTo1pDv8Yg
         tyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dUwf2SMXCQ1iQciXg69AWLDyg5prbuTXReBC1ioTJ8Y=;
        b=M4diU6KpU6iJ+wYXAZrE412e9OPUzoSr32MgiKK6ALWlB9ooPniD5vLXy8C8rrUB4o
         XAPKuj5azOX/wseLJ682jRfURpDuWyNIpPCRjf0Ro/jj79+N1wc963/hptgADs33d/66
         yBGe/+0S/h5ARU0nvyUYubQa+O62YN7v11C//yclrJoCdnmKj+h81GFRLrQoS3jPhlTT
         3CySBf39HfveajZrIzqqjqrUPMUjttqNUpaPcCuBmT7mik0NkJb9ho2T825lgGIPwV2w
         WkdKQgvbPbQN/4qTj9sqD3KePrYkDVmFNWTPDYixzx9n1kiLmEwOYC+QItfHkzUsl12X
         Cm7A==
X-Gm-Message-State: AOAM5317Hws4r6BT/AG52rkkxu4aNHIYh5UsZNvJyFok883+BsmFPSGk
        oL9MOHILxS+EjXQJHdMxBYjGUxmN
X-Google-Smtp-Source: ABdhPJxPctuvp6UlqlM2B1w7IXQRvdqWx/rbi+MNpxhCTWEqFRkKZuRkplVaMknN0ntDCYtcCBplpw==
X-Received: by 2002:a2e:9a59:: with SMTP id k25mr2863517ljj.133.1594931909299;
        Thu, 16 Jul 2020 13:38:29 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-4-184.pppoe.mtu-net.ru. [91.76.4.184])
        by smtp.googlemail.com with ESMTPSA id i22sm1249818ljb.19.2020.07.16.13.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 13:38:28 -0700 (PDT)
Subject: Re: [RFC PATCH v3 16/18] gpu: host1x: mipi: Split
 tegra_mipi_calibrate and tegra_mipi_wait
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
 <1594786855-26506-17-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a06dec8f-7042-767b-545b-048685a7683d@gmail.com>
Date:   Thu, 16 Jul 2020 23:38:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594786855-26506-17-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

15.07.2020 07:20, Sowjanya Komatineni пишет:
> SW can trigger MIPI pads calibration any time after power on
> but calibration results will be latched and applied to the pads
> by MIPI CAL unit only when the link is in LP-11 state and then
> status register will be updated.
> 
> For CSI, trigger of pads calibration happen during CSI stream
> enable where CSI receiver is kept ready prior to sensor or CSI
> transmitter stream start.
> 
> So, pads may not be in LP-11 at this time and waiting for the
> calibration to be done immediate after calibration start will
> result in timeout.
> 
> This patch splits tegra_mipi_calibrate() and tegra_mipi_wait()
> so triggering for calibration and waiting for it to complete can
> happen at different stages.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
...
>  int tegra_mipi_calibrate(struct tegra_mipi_device *device)
>  {
> @@ -370,12 +381,10 @@ int tegra_mipi_calibrate(struct tegra_mipi_device *device)
>  	value |= MIPI_CAL_CTRL_START;
>  	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
>  
> -	err = tegra_mipi_wait(device->mipi);

Doesn't MIPI clock need to be enabled during of the calibration process?

>  	mutex_unlock(&device->mipi->lock);
>  	clk_disable(device->mipi->clk);
>  
> -	return err;
> +	return 0;
>  }
>  EXPORT_SYMBOL(tegra_mipi_calibrate);
