Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E813B0187
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Jun 2021 12:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhFVKj3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Jun 2021 06:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhFVKj1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Jun 2021 06:39:27 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC97C06175F;
        Tue, 22 Jun 2021 03:37:11 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id hz1so11197560ejc.1;
        Tue, 22 Jun 2021 03:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/gZ/LS6jWKdbaM5oP4IgUeK3B1HtaRtMGGO5GuusjNg=;
        b=I4G89gstIc6F4n1q1VgS4P7X41iPjadoInVjmd+FwIiYDUPqRFCC4ATKncvmRVj1jL
         rSmsAgBJ9TBmioXY/Hj4FmASTj2hAM50tL48IbROmprGXfhnsaLXjyDuLWAiiepGkpPD
         s+XY1CAHVTe9atHoou/HGoGmBDVQkuMd9hZi2lhNGfAObpkTbBiILPf8JzSFMdALiYSc
         59v7+PhQD6GNrcxMzd/xLQ0MpKWY47SpaVxyGZmyJOvRM0+39NYqSe/C9ULXGBPFDsd7
         KsCJKKAr92T7GvP5C4VDhLHM/qMk2bkH+iljttwxOni2OTnrQ1buxbEp3QO1jMEKxUnS
         q8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/gZ/LS6jWKdbaM5oP4IgUeK3B1HtaRtMGGO5GuusjNg=;
        b=U/7k9/sTqIYrE3TerPc0kHM0VHJWZIoh4sWlmSe8frrx2DJwfWXLrVBg/JevAdoY/i
         T+zvGvooe+xC7YfdNtlzjaXL/rNhk3DaEfByHtEUrckvaCtCq1eCnVtQOAkyQ2+k5n+A
         De0oNN8ki7iwO/DqyM2Pm9wL1K9vc0N+Yufd/lHLA4utCvMXsAoN6lW/mC7EiAxGS0gh
         UpJsPyDA/vlzzHH5lC55AbFd7Hz1As/pkYi9CgdN0ixEBtBz/FgnXPkE3oD9kjow0fDS
         bXJUKd3VRz3VKdnONz71jczJXqcXXoeytKMJIxn8DN/b0ewCuH4IXvK9oOEiumHbv4aX
         atlw==
X-Gm-Message-State: AOAM533Tr1UtbZg7eOX1F1tW1pIKILLLYV3H0jAHDvEU8OKzb2Mr/hKW
        MQQw2/pi7Kyi8KKC0AAzQuiQTy9sYXBQ2A==
X-Google-Smtp-Source: ABdhPJxlnR4rNgFyoUxyrHeDp6ZOw1eK2zdP3R7GGxTrcENQmMPjFHsqvd0zZwZy9tYkIJz0Ac9KSg==
X-Received: by 2002:a17:906:dbdc:: with SMTP id yc28mr3267131ejb.444.1624358229781;
        Tue, 22 Jun 2021 03:37:09 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id dd15sm4961621edb.45.2021.06.22.03.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 03:37:09 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v5 3/4] arm64: dts: rockchip: add core dtsi for RK3568 SoC
To:     cl@rock-chips.com, heiko@sntech.de
Cc:     robh+dt@kernel.org, jagan@amarulasolutions.com, wens@csie.org,
        uwe@kleine-koenig.org, mail@david-bauer.net,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        wim@linux-watchdog.org, linux@roeck-us.net, jamie@jamieiles.com,
        linux-watchdog@vger.kernel.org, maz@kernel.org
References: <20210622020517.13100-1-cl@rock-chips.com>
 <20210622020517.13100-4-cl@rock-chips.com>
Message-ID: <9515154d-f521-217c-af61-7cda089fbf15@gmail.com>
Date:   Tue, 22 Jun 2021 12:37:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622020517.13100-4-cl@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris, Heiko,

On 6/22/21 4:05 AM, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> RK3568 is a high-performance and low power quad-core application processor
> designed for personal mobile internet device and AIoT equipment. This patch
> add basic core dtsi file for it.
> 
> We use scmi_clk for cortex-a55 instead of standard ARMCLK, so that
> kernel/uboot/rtos can change cpu clk with the same code in ATF, and we will
> enalbe a special high-performance PLL when high frequency is required. The
> smci_clk code is in ATF, and clkid for cpu is 0, as below:
> 
>     cpu0: cpu@0 {
>         device_type = "cpu";
>         compatible = "arm,cortex-a55";
>         reg = <0x0 0x0>;
>         clocks = <&scmi_clk 0>;
>     };
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  .../boot/dts/rockchip/rk3568-pinctrl.dtsi     | 3111 +++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3568.dtsi      |  777 ++++
>  2 files changed, 3888 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568.dtsi
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> new file mode 100644
> index 000000000000..a588ca95ace2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> @@ -0,0 +1,3111 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 Rockchip Electronics Co., Ltd.
> + */
> +
> +#include <dt-bindings/pinctrl/rockchip.h>

> +#include "rockchip-pinconf.dtsi"

Question for Heiko:

This file is put in the arm64 directory.
Is it useful for ARM as well?
Should the ARM directory have it's own or use a long include?

ARM:
#include "../../../arm64/boot/dts/rockchip/rockchip-pinconf.dtsi"

arm64:
#include "rockchip-pinconf.dtsi"

Is it complete or does it need more items?
(Who's going to change that?)

arch/arm/boot/dts/rk3066a.dtsi:373.23-375.6: ERROR (phandle_references):
/pinctrl/emmc/emmc-clk: Reference to non-existent node or label
"pcfg_pull_default"

arch/arm/boot/dts/rv1108.dtsi:645.25-654.6: ERROR (phandle_references):
/pinctrl/emmc/emmc-bus8: Reference to non-existent node or label
"pcfg_pull_up_drv_8ma"

arch/arm64/boot/dts/rockchip/px30.dtsi:1470.23-1473.6: ERROR
(phandle_references): /pinctrl/spi0/spi0-clk: Reference to non-existent
node or label "pcfg_pull_up_4ma"

arch/arm64/boot/dts/rockchip/px30.dtsi:1490.29-1493.6: ERROR
(phandle_references): /pinctrl/spi0/spi0-clk-hs: Reference to
non-existent node or label "pcfg_pull_up_8ma"

arch/arm64/boot/dts/rockchip/px30.dtsi:1589.39-1592.6: ERROR
(phandle_references): /pinctrl/pdm/pdm-clk0m0-sleep: Reference to
non-existent node or label "pcfg_input_high"

arch/arm64/boot/dts/rockchip/px30.dtsi:1903.49-1906.6: ERROR
(phandle_references): /pinctrl/lcdc/lcdc-rgb-m0-hsync-pin: Reference to
non-existent node or label "pcfg_pull_none_12ma"

etc..

> +
> +/*
> + * This file is auto generated by pin2dts tool, please keep these code
> + * by adding changes at end of this file.
> + */
> +&pinctrl {

[..]
