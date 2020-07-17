Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B73C223F06
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 17:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgGQPCD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 11:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbgGQPCD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jul 2020 11:02:03 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE457C0619D2;
        Fri, 17 Jul 2020 08:02:02 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id j11so13037913ljo.7;
        Fri, 17 Jul 2020 08:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Vj0THxkooDRCDITDoMqnCXMjOzpdY/9P9Eqdw05OK34=;
        b=hdnZHm8bQ27NGLjoAEe+1uO25eN/PNI7VSElQYNWPhPlc8jPq4tKeRf4fNyFn8ZDvx
         9/dx2ZJ96awCrq88v0nhlSjzj493SBM8KPyQgrP2/XfmDO9okpVXwx2YH3qZSS0CmzRe
         tl963gqGdzJkYkrLYHInABOyoHwyJb4atjwysl6/N0lcud2YhH75l3pNrGsI/EnT/E4j
         qKGf0aPyM4H0/wg27JAL2Od2WUbyof85heAsQkJvR0/NTqvLZYcS0+9JEtqPaTm0HOqx
         mzdyLQt/vg07TTg/5V1r9AjpqbxbLzEso6X7s1019Gy+uO23Xr4NBtsmrqB0AxGFh02y
         mFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vj0THxkooDRCDITDoMqnCXMjOzpdY/9P9Eqdw05OK34=;
        b=CTFINH1aaDXoInauwWRcbomWWXGJYp1/nodLxQWn+dmDHMwpXeAoojeX6xfHlSq21N
         HRivBtGblY6wsLquw+kO8cvXB1oz/s1220Ik+sJnUUbmTNF2P9xnPU9lmN/YNavVPcJy
         XM8F/xSRVoQU/YTx7zTHsUqLq0VcX/akCyB+sugfjPnqVUI6E6nPnjmThuzL2Vb4E7qY
         Hr3QllMAwUdwp8VoAGSBOUCUZlW5m++U+7yzERukMcYViFXBeEwCNQ3ohICgxRVMe8ut
         r+pfz4AczHZFRKlQ89hpxUqky9tmCtIAOggHlcmsp/z96TLxmMgQygUvSdU/ADFDdI3k
         Fl/g==
X-Gm-Message-State: AOAM533lHpP7kd0gUwkjnM8+47TNjmiWRAFxL5zBQ9kR/2IiSAMAZVNn
        8IxDeYnV/cTq3jWmJ3/PdsCyAe7X
X-Google-Smtp-Source: ABdhPJyQ+WCihOlXt8PupgeNCC7ANZ6gdFcfhNDBl4mxjPolZLOSXDJiSWkHQhdjI0Pmd2yZHYxryg==
X-Received: by 2002:a2e:8758:: with SMTP id q24mr4389912ljj.109.1594998120753;
        Fri, 17 Jul 2020 08:02:00 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-4-184.pppoe.mtu-net.ru. [91.76.4.184])
        by smtp.googlemail.com with ESMTPSA id u7sm2281772lfi.45.2020.07.17.08.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 08:01:59 -0700 (PDT)
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
 <9b4fbf9d-d651-aa35-c0a6-b8f16aeb0900@gmail.com>
 <550f1796-67ca-5856-223d-c68360243954@nvidia.com>
 <ca8f2184-de30-03ec-9caf-e20a22d96a77@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <080b30c7-1dce-dd2f-dd96-40f6e25da4d6@gmail.com>
Date:   Fri, 17 Jul 2020 18:01:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ca8f2184-de30-03ec-9caf-e20a22d96a77@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.07.2020 07:46, Sowjanya Komatineni пишет:
...
> Looks like sequence posted in TRM need to be updated clearly for proper
> MIPI CAL start and wait.
> 
> Correct steps should be like below
> 
> 1. Set up CSI registers for use case such as number of lanes, virtual 
> channel, etc.
> 2. Initialize and power up CSI CIL interface
> 3. Program MIPI CAL bias pads, cal configs, cal control registers and
> enable calibration start
> 4. Power up camera through the I2C interface and start sensor streaming
> through the I2C
> 
> Note: All sensors might not leave pads in LP-11 state as sensor may be
> power down when not in use.
> 
> So start streaming prior to checking for calibration done status as
> LP-11 -> HS transition happens during sensor stream and calibration
> logic can apply results to pads and update done status,
> 
> 5. Wait for done signal from calibration logic
> 
> 6. perform frame capture thru VI
> 7. Frame done, CSI goes back to stop state, LP11
> 
> Will work internally to correct sequence in TRM ...

Will be nice to have an updated TRM, thank you!

Also, what about the auto-calibration? Isn't it needed to be enabled for
CSI?

> In mipi driver will update as below to have mipi clk enabled till
> calibration status check is done.
> 
> Always tegra_mipi_wait() followes tegra_mipi_calibrate() in both DSI and
> CSI. So below sequence should work good.
> 
> tegra_mipi_calibrate()
> 
> - clk_enable mipi cal
> - program mipi cal registers (bias pads cfgs, mipi cal ctrl and trigger
> calibration start)
> 
> tegra_mipi_wait()
> - read mipi cal status and wait for active and done bits
> - clk_disable mipi cal


Maybe then it should be better to rename the functions like this:

tegra_mipi_calibrate() -> tegra_mipi_start_calibration()
tegra_mipi_wait()      -> tegra_mipi_finish_calibration().

and there also should be tegra_mipi_cancel_calibration().


Example:

	tegra_mipi_start_calibration();

	ret = v4l2_subdev_call(subdev, video, s_stream, on);
	if (ret < 0) {
		tegra_mipi_cancel_calibration();
		goto err;
	}

	tegra_mipi_finish_calibration();


