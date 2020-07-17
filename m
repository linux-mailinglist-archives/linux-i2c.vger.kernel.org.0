Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1A6C223256
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 06:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgGQE2G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 00:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbgGQE2F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jul 2020 00:28:05 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD596C08C5DC
        for <linux-i2c@vger.kernel.org>; Thu, 16 Jul 2020 21:28:04 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f18so9643297wrs.0
        for <linux-i2c@vger.kernel.org>; Thu, 16 Jul 2020 21:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xKiHKtXUo7NkO+4s96RBO3/zYsHU2Z/ckyeyMOpjSSk=;
        b=cqQG+5HHP8FdB3WQLW9wGhsG7SeC7f21rTf6GbiqGayG4UG+Eb/ZxDPESsqFDBOneb
         lEHteZt/4j7lwXdMwlfN7AdtgbvYmDW+2kPVuSVJSBxwsTSsgv41w+4VCt/Ceg/Qf3gL
         goYjFGpMHwtDxONpZtwPovrBtog3pC5e3idIBg5Jp2GzhGV4UpPUHG0HFJ5YNbBobQc0
         GLdY8dcZdbBInXqVuhNQPCBXdS3js1eFHfC/jjTDmX0aCvGeIxVSGpbiF9R4LQkkHkpM
         sU/J9G4w5VTmV1l9GuHqO1IwyQNmDi9jCG/Llh8/+vJjwhcTSbA5fECuc1o+BYKL0d5A
         44bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xKiHKtXUo7NkO+4s96RBO3/zYsHU2Z/ckyeyMOpjSSk=;
        b=dN9amJFJ2lTYvoDUQd2Y9Fsvxb52DeKI+CTocvlGUFW0dTvNSTwleGhS+JqtAx4cAD
         LQhp6f+XMTQyulhKJatRAeHn/451Y7NzQbtuhiNaTMIoNPzqtnh9wyiu9S34WBtnAQfJ
         32o9XE6sN/G1HPSRVOZUNE+7SgmGO4v7R35lOFtkU0W09B/XXCDLWUgv23vJeDMaihFk
         GADXT5yqy4hdKE48b68OvmKGgW/5GKTTiPoQJWxMh/TUyoG0vNqliEnqsCqUoueeaKqU
         9gz4kORDUs73omMktcr2G9UmHX45dpt1D9ETy+wlYYPUThxy1o578zBehf6yE2pAhaFQ
         px8Q==
X-Gm-Message-State: AOAM531V1UsZ7ovdM0R8wq0WYjEskrdHUUN9voKUADfJ+L0aaxbW+awj
        TU25rhj6W1S9q2CHrHw7jCugaA==
X-Google-Smtp-Source: ABdhPJz608hYHsiwyB/EN+L+jwqQLZomE0K0feZYaj9wTWfFYhecxH/LFSN0LliZKeegIqo1mKBqpQ==
X-Received: by 2002:adf:9283:: with SMTP id 3mr8013554wrn.231.1594960083192;
        Thu, 16 Jul 2020 21:28:03 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9880:a643:3e69:6393? ([2a01:e34:ed2f:f020:9880:a643:3e69:6393])
        by smtp.googlemail.com with ESMTPSA id u186sm11862848wmu.10.2020.07.16.21.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 21:28:02 -0700 (PDT)
Subject: Re: [PATCH v4 00/16] Allwinner A100 Initial support
To:     Frank Lee <frank@allwinnertech.com>, robh+dt@kernel.org,
        mripard@kernel.org, wens@csie.org, mturquette@baylibre.com,
        sboyd@kernel.org, gregory.clement@bootlin.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org,
        srinivas.kandagatla@linaro.org, linus.walleij@linaro.org,
        anarsoul@gmail.com, tiny.windzz@gmail.com, rui.zhang@intel.com,
        amit.kucheria@verdurent.com, lee.jones@linaro.org,
        p.zabel@pengutronix.de, clabbe@baylibre.com, icenowy@aosc.io,
        megous@megous.com, stefan@olimex.com, bage@linutronix.de,
        devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org
References: <cover.1594708863.git.frank@allwinnertech.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <ffd5eead-571c-6548-0527-1e685ec869ef@linaro.org>
Date:   Fri, 17 Jul 2020 06:28:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1594708863.git.frank@allwinnertech.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 14/07/2020 08:55, Frank Lee wrote:
> From: Yangtao Li <frank@allwinnertech.com>

Do you expect me to pick patches 7,8,9 or ack them ?

> v4:
> -drop "dt-bindings: pinctrl: sunxi: make gpio banks supplies required"
> -fix dcdc1 regulator name
> -get rid of underscore in dts node name
> -Some trivial things in yaml files
> 
> v3:
> -Add pmu and nmi support
> -Add read data mask for calibration
> -Code style
> -Some trivial things in yaml files
> 
> v2:
> -Some naming consistency
> -Repair email address
> -Fix mmc clock
> -Don't export system clock
> -Fix checkpatch warning
> -Drop unneeded pin function, convert to jtag_gpu and i2s_x
> 
> Yangtao Li (16):
>   dt-bindings: clk: sunxi-ccu: add compatible string for A100 CCU and
>     R-CCU
>   clk: sunxi-ng: add support for the Allwinner A100 CCU
>   dt-bindings: pinctrl: sunxi: Get rid of continual nesting
>   dt-bindings: pinctrl: sunxi: Add A100 pinctrl bindings
>   pinctrl: sunxi: add support for the Allwinner A100 pin controller
>   dt-bindings: nvmem: SID: add binding for A100's SID controller
>   dt-bindings: thermal: sun8i: Add binding for A100's THS controller
>   thermal: sun8i: add TEMP_CALIB_MASK for calibration data in
>     sun50i_h6_ths_calibrate
>   thermal: sun8i: Add A100's THS controller support
>   mfd: axp20x: Allow the AXP803 to be probed by I2C
>   dt-bindings: irq: sun7i-nmi: fix dt-binding for a80 nmi
>   dt-bindings: irq: sun7i-nmi: Add binding for A100's NMI controller
>   dt-bindings: i2c: mv64xxx: Add compatible for the A100 i2c node.
>   arm64: allwinner: A100: add the basical Allwinner A100 DTSI file
>   dt-bindings: arm: sunxi: Add Allwinner A100 Perf1 Board bindings
>   arm64: allwinner: A100: add support for Allwinner Perf1 board
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |    5 +
>  .../clock/allwinner,sun4i-a10-ccu.yaml        |    7 +-
>  .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |    3 +
>  .../allwinner,sun7i-a20-sc-nmi.yaml           |    5 +-
>  .../nvmem/allwinner,sun4i-a10-sid.yaml        |   19 +-
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  139 +-
>  .../thermal/allwinner,sun8i-a83t-ths.yaml     |    6 +-
>  arch/arm64/boot/dts/allwinner/Makefile        |    1 +
>  .../allwinner/sun50i-a100-allwinner-perf1.dts |  180 +++
>  .../arm64/boot/dts/allwinner/sun50i-a100.dtsi |  364 +++++
>  drivers/clk/sunxi-ng/Kconfig                  |   10 +
>  drivers/clk/sunxi-ng/Makefile                 |    2 +
>  drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c      |  214 +++
>  drivers/clk/sunxi-ng/ccu-sun50i-a100-r.h      |   21 +
>  drivers/clk/sunxi-ng/ccu-sun50i-a100.c        | 1276 +++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun50i-a100.h        |   56 +
>  drivers/mfd/axp20x-i2c.c                      |    2 +
>  drivers/pinctrl/sunxi/Kconfig                 |   10 +
>  drivers/pinctrl/sunxi/Makefile                |    2 +
>  drivers/pinctrl/sunxi/pinctrl-sun50i-a100-r.c |  105 ++
>  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c   |  708 +++++++++
>  drivers/thermal/sun8i_thermal.c               |   16 +-
>  include/dt-bindings/clock/sun50i-a100-ccu.h   |  116 ++
>  include/dt-bindings/clock/sun50i-a100-r-ccu.h |   23 +
>  include/dt-bindings/reset/sun50i-a100-ccu.h   |   68 +
>  include/dt-bindings/reset/sun50i-a100-r-ccu.h |   18 +
>  26 files changed, 3308 insertions(+), 68 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.h
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a100.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a100.h
>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-a100-r.c
>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
>  create mode 100644 include/dt-bindings/clock/sun50i-a100-ccu.h
>  create mode 100644 include/dt-bindings/clock/sun50i-a100-r-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun50i-a100-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun50i-a100-r-ccu.h
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
