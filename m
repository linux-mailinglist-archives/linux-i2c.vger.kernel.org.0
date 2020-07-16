Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C046222F5D
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 01:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgGPXr5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 19:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgGPXr4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 19:47:56 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F53C061755;
        Thu, 16 Jul 2020 16:47:56 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id i80so4948852lfi.13;
        Thu, 16 Jul 2020 16:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A1jn6c7kFJPkQon2SVOTVHBfqbqTtwTIfeuqRURf4Ug=;
        b=PKfOr/DZLkDBdJpo4cehHWUJ3UzAwunBUGjeH54n1BEgrMmkKvXW6t8Uaa75NEkVIi
         eXt5QJa5YKtqbb6dWts5NZNafBl7/DaaVAh+R+VSwXNmIRuWPjLylhxWYhIdOvvb4SEZ
         Vi0B9Fa9UlO82BDQzgrqib3v/iyn333Y0Ha7SlwiWSXQdkV2DwzreZ7quH+FmXx8ZqWV
         ViyT4luwEyp2XUiupKhNsEtKIWcg2TciioRQJGGdGUJZFl+VPCRVsO1i4Q4RIfwEbUmw
         DeO9ZATWn8TwGHaFwSINclBe5qEKPLOMZwBepEw8Y7nVZIbjRpDvItrMaq/kCWnYkhos
         /rwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A1jn6c7kFJPkQon2SVOTVHBfqbqTtwTIfeuqRURf4Ug=;
        b=o9tH3c86hHSIrK4H/dke0gcszXqWAEnHIiA5pVA7Upfev7aSGhAx90qAeDyvsGtOoV
         WNFuuYj/N3W5ue/ZLedNJWKnYy1bgBLwNi3RFQvWtZVADaBSEICu61eV5IzJmqZpyRXd
         0K2zZFl/e+BqGEVyQM0loQ3GSx3JTPfMIvaeNERDHQEi8moTTX3NOQoP48WlaIfqekRy
         SwxJCRjHAQTwFT9vR0Q3oAW9xgTGCZHibxmAPrTe59fbheF96boViIy+Ubs/6zkzvPWt
         7mJOiZ+VaK6J1sYTQy46FwCieZXQDvMEteyh/dwCmirAqtZgk46WgmPeGElWfvt12m28
         /2KQ==
X-Gm-Message-State: AOAM533XHaflqYVCR8tlS/9oS+bPrKSjnevWVu/eFzqcowlt2J1k1OIg
        AkJrZhOAJYo1xhgpNUfSJMU4rmra
X-Google-Smtp-Source: ABdhPJxPXRlZnIakzEq9kDotxPaAbFxj5XNB36qCPTk2TdYQ/jB+VGMj7ZWGuPNBjUj/HtViFD5hAg==
X-Received: by 2002:a19:c797:: with SMTP id x145mr3283492lff.143.1594943274284;
        Thu, 16 Jul 2020 16:47:54 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-4-184.pppoe.mtu-net.ru. [91.76.4.184])
        by smtp.googlemail.com with ESMTPSA id k6sm1482260lfm.89.2020.07.16.16.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 16:47:53 -0700 (PDT)
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
 <a2b8169c-c4a3-4862-cd27-8c1a51ddc558@gmail.com>
 <4690e682-8495-2327-87c7-c2f06a7a479d@nvidia.com>
 <66812127-38cf-2af3-51c0-50edbe446e73@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9b4fbf9d-d651-aa35-c0a6-b8f16aeb0900@gmail.com>
Date:   Fri, 17 Jul 2020 02:47:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <66812127-38cf-2af3-51c0-50edbe446e73@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.07.2020 02:09, Sowjanya Komatineni пишет:
> 
> On 7/16/20 4:06 PM, Sowjanya Komatineni wrote:
>>
>> On 7/16/20 4:01 PM, Dmitry Osipenko wrote:
>>> 17.07.2020 01:49, Sowjanya Komatineni пишет:
>>>>> What keeps MIPI clock enabled after completion of the
>>>>> tegra_mipi_calibrate() invocation?
>>>> MIPI clock is disabled at end of tegra_mipi_calibrate and is re-enabled
>>>> during tegra_mipi_wait.
>>>>
>>>> I think I should fix this to keep the clock enabled till calibration
>>>> results are latched.
>>>>
>>>> All consumers of tegra_mipi_calibrate() will call tegra_mipi_wait().
>>>>
>>>> So will remove clk_disable mipi clk at end of tegra_mipi_calibrate()
>>>> and
>>>> clk_enable mipi_clk at beginning of tegra_mipi_wait()
>>> Isn't it possible to perform the calibration after enabling CSI and
>>> before of starting the sensor streaming?
>> Currently this is what I am doing. Triggering calibration start during
>> CSI receiver being ready and then sensor streaming will happen where
>> internal MIPI CAL detects for LP -> HS transition and applies results
>> to pads. So checking for calibration results after sensor stream is
>> enabled
> 
> 1. Calling tegra_mipi_calibrate() during CSI streaming where CSI pads
> are enabled and receiver is kept ready
> 
> 2. Start Sensor stream
> 
> 3. Calling tegra_mipi_wait() to check for MIPI Cal status.
> 
> So as mipi cal clk need to be kept enabled till 3rd step, we can enable
> clock during tegra_mipi_calibrate() and leave it enabled and disable it
> in tegra_mipi_wait after status check.

From TRM:

The following sequence is recommended for capturing a single frame:

1. Set up CSI registers for use case such as number of lanes, virtual
channel, etc.
2. Initialize and power up CSI interface
3. Wait for initialization time or done signal from calibration logic
4. Power up camera through the I2C interface
5. All CSI data and clock lanes are in stop state, LP11
6. Initiate frame capture through the I2C
7. Frame done, CSI goes back to stop state, LP11

Hence, is it really necessary to perform the manual calibration?
