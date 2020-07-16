Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1201222E98
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 01:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbgGPXI7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 19:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727815AbgGPXI6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 19:08:58 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4EAC08C5FB;
        Thu, 16 Jul 2020 16:01:32 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id b30so2602072lfj.12;
        Thu, 16 Jul 2020 16:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vRmrcXdGKYCulhx5JF7bmSsDjAzR+R6023P6GBnsjfQ=;
        b=E56txzafzppMuffM1Gu5Z9yBTjbmyAv5+/F6FiMiUIVnnW2zq6c88cHxzrhnkrr6ow
         gFVX2XlNz6/TNOI0paMw6OLATpLw48J/F2WQDK1u+lH+xK43cuSZeOiSLTc066vdBHUz
         OR6NLSsip/EVOU+KKyVbfJlO1ObKA/e0PFM+hDzTYp7ibJ2r+L2dxpCeXcF+Fb0oGhV0
         PQGskd1r2k/w9LTpmAy7RhVwrgx7IRoosJQuDzaQWfHwj+Ggw0OxvtXC8Q6DNuBPTTWU
         37z0yMiIoUrbD4OM5k9f//XXEbpc3NFfsWMaxH6ejpdxx3WSoyEX0YvoM8Pw5agBQx2B
         tLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vRmrcXdGKYCulhx5JF7bmSsDjAzR+R6023P6GBnsjfQ=;
        b=WTbuXDY4BY/Yf5GsU2tbCHAc2o0EzB5ohTgGHKqBKlhgaIo36Ohu2rVuoYpOclNuH1
         UEewVMXll+EASduvUfCTsMjq4KH9jfAhW3epq/z7+bD5nYCWzAs5I6LMEGSX6WoTsEV1
         j8E4B8KMeYBhI19tFAsxc/LO/ua7VxQyGLuX/gF3bW95w/6cVDq7F/p4ggCgX7qFv6Ro
         0zkzCDUiyS4tShe68eDvtzk1gJMA9p4gdYTKLzjbOXYDqQJNMi4xBFWIdTYIUI5wvyBG
         +UheD2MKu2CH3mn/5qo9g27zYiT9ZKwUdhYPd3SrFDxGAor6FHR0bqUBRHVJBtNe4dWT
         xdFA==
X-Gm-Message-State: AOAM531l+NewWf9wFg1zmseHU6KTZrdx3CKDtSEtj1NM2jGzTMAWyy71
        7/7CxuI25a1tHTAJEd6jPzTgQMNr
X-Google-Smtp-Source: ABdhPJxdHQgI4Iks82B0kVrmWJ74aaaj+x50J9DUOutD6acHfl6haGzwy4wP4QYnc1V6e6cfZgIn3w==
X-Received: by 2002:a05:6512:250:: with SMTP id b16mr3118639lfo.67.1594940490262;
        Thu, 16 Jul 2020 16:01:30 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-4-184.pppoe.mtu-net.ru. [91.76.4.184])
        by smtp.googlemail.com with ESMTPSA id w4sm1315624ljw.16.2020.07.16.16.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 16:01:29 -0700 (PDT)
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
 <a06dec8f-7042-767b-545b-048685a7683d@gmail.com>
 <20d63eca-4b2b-584e-a391-a4fb64a16b40@nvidia.com>
 <c4945c77-5de1-e9b1-9f4f-cdd78bca18c7@gmail.com>
 <ce0c5ffb-f859-0eab-1ea5-044623dff221@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a2b8169c-c4a3-4862-cd27-8c1a51ddc558@gmail.com>
Date:   Fri, 17 Jul 2020 02:01:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ce0c5ffb-f859-0eab-1ea5-044623dff221@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.07.2020 01:49, Sowjanya Komatineni пишет:
>> What keeps MIPI clock enabled after completion of the
>> tegra_mipi_calibrate() invocation?
> 
> MIPI clock is disabled at end of tegra_mipi_calibrate and is re-enabled
> during tegra_mipi_wait.
> 
> I think I should fix this to keep the clock enabled till calibration
> results are latched.
> 
> All consumers of tegra_mipi_calibrate() will call tegra_mipi_wait().
> 
> So will remove clk_disable mipi clk at end of tegra_mipi_calibrate() and
> clk_enable mipi_clk at beginning of tegra_mipi_wait()

Isn't it possible to perform the calibration after enabling CSI and
before of starting the sensor streaming?
