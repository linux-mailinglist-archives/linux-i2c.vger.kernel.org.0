Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9884D22E378
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 02:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgG0AKa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Jul 2020 20:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbgG0AKa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Jul 2020 20:10:30 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03AACC0619D2;
        Sun, 26 Jul 2020 17:10:29 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id i19so8022247lfj.8;
        Sun, 26 Jul 2020 17:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lUbR+z3foYgSnboLjaU40uIsW+iN9a9SRKXXkCkRDhg=;
        b=ZEgH5JQM/DFH1/uv1AmFBjfAhooNBcJ3B8UMIgNAEl6N3kXC5TCmu4pPVCBugXbpMF
         0Hx0vgR/xyGyVvOAiWoQOoRiAfVmOZXBNxRUb1zROJajgSZzovLHebyQhq4zAj5UvJ9P
         PzYbjk0JgZdORIDGmX+AFZZl/ANlljgPLyraOJjOue4IrCq9qBPjAaBCOKPOlJwjIhkg
         sA6pPpmh0m5AN2WIa4Gpyo97zZ8adqrRZYLHKl6eVagY3BkWJE0nyzYKrNXdy0m5/GGv
         1O6PiSWyihY/Lq5+FZFbAv1aWNcWXDte3elgq4/eoaNR7GstmeC8gmWPBHtMwrev5R4/
         risA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lUbR+z3foYgSnboLjaU40uIsW+iN9a9SRKXXkCkRDhg=;
        b=nA/lxKL/vM8u2+XUaj7YQkwOVPrccUOes+k3sSDZAwDz71LTmIYcFP5RrbdXJvrvat
         K90xFpLYhOD58R3r7fnjdXkXC+2pmlrPclmM1tcy+rp5a+vm7rlgRew80xPuv3VvZpIo
         EWZ2NCGa9/Dls06bLhJOME6B8Pz4IU64WtvuoPKp2Vq+7H8MChjzRcPL7OffZLM+Q1ot
         lhm0jRX/WcGXVb3DPiNW/8UDSTIZRwYOZK/+BIbR+I4Ylx0DEPcGFp4raz2N+4bjC6Q/
         2CiSkeSlEF0E0ddWKyCC33nd4OAAy01dyvsMBzMrY20F3TzNp67w5njP1RWEw2Nar25e
         nJVg==
X-Gm-Message-State: AOAM5317jL1xjOTfc9AvCIx252XlmySNAYiIGTFU5v1nFPJ4LtO26zCt
        6W9xUz54y3UDJM5Vlo5hQqDxoffM
X-Google-Smtp-Source: ABdhPJwKkYZblJ7N7Rw94jOQEjb3CXOvqM/n9CfSjy4Az9T0YB17dWlETjUiFGGYlv+C7/F7yHiplQ==
X-Received: by 2002:a19:4345:: with SMTP id m5mr10428051lfj.60.1595808628152;
        Sun, 26 Jul 2020 17:10:28 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-12-16.pppoe.mtu-net.ru. [91.76.12.16])
        by smtp.googlemail.com with ESMTPSA id 203sm2634077lfk.49.2020.07.26.17.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2020 17:10:27 -0700 (PDT)
Subject: Re: [RFC PATCH v4 12/14] gpu: host1x: mipi: Keep MIPI clock enabled
 till calibration is done
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1595548272-9809-1-git-send-email-skomatineni@nvidia.com>
 <1595548272-9809-13-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4a7444e7-2e64-d96e-d764-b81ee0c82525@gmail.com>
Date:   Mon, 27 Jul 2020 03:10:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595548272-9809-13-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

24.07.2020 02:51, Sowjanya Komatineni пишет:
> With the split of MIPI calibration into tegra_mipi_calibrate() and
> tegra_mipi_wait(), MIPI clock is not kept enabled till the calibration
> is done.
> 
> So, this patch skips disabling MIPI clock after triggering start of
> calibration and disables it only after waiting for done status from
> the calibration logic.
> 
> This patch renames tegra_mipi_calibrate() as tegra_mipi_start_calibration()
> and tegra_mipi_wait() as tegra_mipi_finish_calibration() to be inline
> with their usage....
> -int tegra_mipi_calibrate(struct tegra_mipi_device *device);
> -int tegra_mipi_wait(struct tegra_mipi_device *device);
> +int tegra_mipi_start_calibrate(struct tegra_mipi_device *device);
> +int tegra_mipi_finish_calibrate(struct tegra_mipi_device *device);
> +void tegra_mipi_cancel_calibrate(struct tegra_mipi_device *device);

Could you please use function names as they are named in the commit's
description? The "start_calibrate" doesn't sound like a proper English,
otherwise patch looks good to me.
