Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5986646035A
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Nov 2021 04:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232943AbhK1DYf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 Nov 2021 22:24:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239581AbhK1DWf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 27 Nov 2021 22:22:35 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA1EC061574;
        Sat, 27 Nov 2021 19:15:39 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id d9so7352203wrw.4;
        Sat, 27 Nov 2021 19:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=i8O7Dpns9fHSY/WW7qsVWPhyTZikkhDp94r/4zepqx8=;
        b=DmECkuZUV5YSSj/DfOoH3n7JthwWmt4sMFUBjCiqYnGRG1bYb7E16TqCoiFaKTFUUS
         mnqRcEoRp9PHq2T5bZEFn9TQGcZgg4Y2dza46zascx0UKHK9g9wxhARGCaMdzAZTPl9f
         S2bx/g4gZV3UHdz9hOjmPbUdj8XRSt3BK5/rLDjtyDpgAR/GEloZzmdGnthEKLgr9hgA
         PnQE5ALJtcLj8jXESdrTlROp5WWvw5ghr0uvSv7GR7dCxfbwnFG5Z95yJkZGuXKluAQx
         8bthCoCDPamXJ6Tlo/hu7qBniJK0Xj3ubTQzZ/PWH2XEwFHKFdeTdnFalJlCTUPpS6Nk
         mptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=i8O7Dpns9fHSY/WW7qsVWPhyTZikkhDp94r/4zepqx8=;
        b=agyk9ai+fQeYNuj9QuraY/GhJqCGTBkJ5Fo0KVxXc41/0gOZ7Umcp3d6CyE+RCgfON
         ymolww+G1crrhK3gJdP6WrAB3pFHiUaTymQQoeINlHl9KEOcKC7U0sl4YNmFwH+sY2WX
         wzguTOseWWgElTopvBKRYkfqjDNym53iMI9B4zI5tsjDYE2AxyIBs7NczDgkxa1ND5yl
         rvSeD2uegyN2c9SHnk84rRqUcrPHLfrW8hrEAoJzZT3x2vhyvl5NJBsvaZSDKcxMW0Wr
         LZQq9Xdz86fRqGeCh9MIhhtStqhdGUMAA9qteBRyl5JAxl8Z+LejtbEjkW+l6VpAD/B5
         /McQ==
X-Gm-Message-State: AOAM531RkYSj4KHR3AGWHQYvbKurmsAbFJ3w5OW/t+mujV0AnpVJu3L2
        8JiYy5TNBkUVrSGh3XmZi8k=
X-Google-Smtp-Source: ABdhPJy4vCRUS6Fqq39kobf0Cj0I1na6Rp6CeLZVHNUSf48vfxwQUASuvgNZ1YWJm4TWEyfch5U6bw==
X-Received: by 2002:adf:d22a:: with SMTP id k10mr25078422wrh.80.1638069338221;
        Sat, 27 Nov 2021 19:15:38 -0800 (PST)
Received: from ?IPv6:2a02:ab88:368f:2080:eab:126a:947d:3008? ([2a02:ab88:368f:2080:eab:126a:947d:3008])
        by smtp.gmail.com with ESMTPSA id b6sm16388764wmq.45.2021.11.27.19.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 19:15:37 -0800 (PST)
Message-ID: <b9807fcc69713fb016838958a3df1c4e54309fc4.camel@gmail.com>
Subject: Re: [PATCH 0/8] soc: samsung: Add USIv2 driver
From:   David Virag <virag.david003@gmail.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Date:   Sun, 28 Nov 2021 04:15:13 +0100
In-Reply-To: <20211127223253.19098-1-semen.protsenko@linaro.org>
References: <20211127223253.19098-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 2021-11-28 at 00:32 +0200, Sam Protsenko wrote:
> USIv2 IP-core provides selectable serial protocol (UART, SPI or
> High-Speed I2C); only one can be chosen at a time. This series
> implements USIv2 driver, which allows one to select particular USI
> function in device tree, and also performs USI block initialization.
> 
> With that driver implemented, it's not needed to do USI
> initialization
> in protocol drivers anymore, so that code is removed from the serial
> driver.
> 

I think the downstream way of doing this (USI node reg being on the
SW_CONF register itself rather than an offset from uart/i2c/spi, the
USI driver only controlling the SW_CONF, and the uart/i2c/spi drivers
controlling their USI_CON and USI_OPTION regs) is cleaner, better, and
easier to adapt to USIv1 too.

For example: I'm sure this is the case on USIv2 devices too, but on
Exynos7885, different devices have USI modes configured differently.
For example a Samsung Galaxy A8 (2018) has all the USI blocks
configured as SPI while a Samsung Galaxy M20 has the first USI
configured as dual HSI2C, the second as HSI2C on the first 2 pins and
the third as HSI2C on the last 2 pins. With this way of doing
everything on USIv2 we'd need 3 disabled USIv2 nodes in the SoC DTSI
for one USI block, each for every protocol the USI block can do, all
having a single child for their protocol and each referencing the same
sysreg (not even sure if that's even supported). Then the board DTS
could enable the USI node it needs.

With the downstream way we could have just one USI node and we could
add the 3 protocols it can do disabled as seperate or child nodes. This
way the board DTS only needs to set the appropriate mode setting and
enable the protocol it needs. I'd say much better than having 3 USI
nodes for the same USI block.

Also this way is pretty USIv2 centric. Adding USIv1 support to this
driver is difficult this way because of the the lack of USI_CON and
USI_OPTION registers as a whole (so having nowhere to actually set the
reg of the USI node to, as the only thing USIv1 has is the SW_CONF
register). In my opinion being able to use the same driver and same
device tree layout for USIv1 and USIv2 is a definite plus

The only real drawback of that way is having to add code for USIv2
inside the UART, HSI2C, and SPI drivers but in my opinion the benefits
overweigh the drawbacks greatly. We could even make the uart/spi/hsi2c
drivers call a helper function in the USI driver to set their USI_CON
and USI_OPTION registers up so that code would be shared and not
duplicated. Wether this patch gets applied like this is not my choice
though, I'll let the people responsible decide
:-)

Anyways, soon enough I can write an USIv1 driver after I submit all the
7885 stuff I'm working on currently. If you want to, you can add USIv2
support to that driver, or if an USIv2 driver is already in upstream at
that point, if it is written in the downstream way I can add v1 support
to that, or if it's like this I'll have to make a whole seperate driver
with a whole seperate DT structure.

Best regards,
David
