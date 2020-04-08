Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBB591A1A65
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 05:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgDHDzZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 23:55:25 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:36276 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgDHDzY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 23:55:24 -0400
Received: by mail-il1-f193.google.com with SMTP id p13so5447321ilp.3
        for <linux-i2c@vger.kernel.org>; Tue, 07 Apr 2020 20:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v1S8GWi1CZlxXUpn27IuRTjY7En+a3xk7vnQxT94OX0=;
        b=nThboyjGdRLt7I9fAp/FzItexduBxEw/BpEq3XLd4eM+aeKds9HB08F+ejcPrWuSP8
         TWUladmH4ZubXMiLui0hVBNEUVPcChvO69kyL6rpWeSCxAox8mqVqWvIVgGa926WVaYM
         2iBCI6CdYT50W5d7hNZP5oZMV1mtYcpmn7CW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v1S8GWi1CZlxXUpn27IuRTjY7En+a3xk7vnQxT94OX0=;
        b=KwJy60415xwTDTcVO4i6DOPoqLFpZ+Dr3qpLbAUlQZhaVZfNR/ZXzKOUJaMkH3jIlC
         tk6v94cc83LrVsoP396Kh0vJGfESEDjeHkC9mMDXwFQ5cxacUTGl/R4gDMKxmuUwJAxV
         DGGRgmQfg2/ga4Yf3abzhG2D9nh7nr8XL9oIrl9VjKFWR1Z3zRr246dV2o1XS7s2xOCi
         PyRB93SU9RDKXJ2TuVTzzmSjvp/DD1Bz+4UC/cgKqYDbBZyLuPFtZeXsbzYu+czA91vk
         6YDQ3HhVfRk+LvXTP09C1XLeSIp8/DBN7/1Jv4d8Un0S5MSzhBtrxqdEEiUtKVgLESbf
         cfoA==
X-Gm-Message-State: AGi0PubeZxXGIVyel/bC4Ef6UyzzPVLd2Xxz4SyUJsoPiZHKSl3Kw205
        l7ZwxqiJ5FzKA8MdCRIZOwF/5CJ2Bfp74YXUBGkStg==
X-Google-Smtp-Source: APiQypLxuIlVa72q8L2YzcEgcZkCjhfDxYawFkboKJvblM34qUaicxFbsMcsmoToY/EI/qEcjqDyPPH9ntDkFcfqAi0=
X-Received: by 2002:a92:afc1:: with SMTP id v62mr5818784ill.308.1586318123748;
 Tue, 07 Apr 2020 20:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200407163741.17615-1-zhengdejin5@gmail.com>
In-Reply-To: <20200407163741.17615-1-zhengdejin5@gmail.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Wed, 8 Apr 2020 11:54:57 +0800
Message-ID: <CAJMQK-g-Q20fDzy-0DQxoy+dS_USXkZ9DNSqeLmpUJS1OEzbCA@mail.gmail.com>
Subject: Re: [PATCH v1 00/28] convert to devm_platform_ioremap_resource
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     thor.thayer@linux.intel.com, krzysztof.adamski@nokia.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>, nsekhar@ti.com,
        bgolaszewski@baylibre.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        baruch@tkos.co.il, Wolfram Sang <wsa+renesas@sang-engineering.com>,
        kgene@kernel.org, krzk@kernel.org, paul@crapouillou.net,
        vz@mleia.com, khilman@baylibre.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        gregory.clement@bootlin.com, rrichter@marvell.com,
        afaerber@suse.de, manivannan.sadhasivam@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de,
        baohua@kernel.org, linus.walleij@linaro.org, mripard@kernel.org,
        wens@csie.org, ardb@kernel.org, michal.simek@xilinx.com,
        gcherian@marvell.com, jun.nie@linaro.org, shawnguo@kernel.org,
        rayagonda.kokatanur@broadcom.com, lori.hikichi@broadcom.com,
        nishkadg.linux@gmail.com,
        Kate Stewart <kstewart@linuxfoundation.org>,
        allison@lohutok.net,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>, bigeasy@linutronix.de,
        info@metux.net, hslester96@gmail.com,
        Neil Armstrong <narmstrong@baylibre.com>,
        martin.blumenstingl@googlemail.com,
        Qii Wang <qii.wang@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Fabien Parent <fparent@baylibre.com>, opensource@jilayne.com,
        swinslow@gmail.com, linux-i2c@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 8, 2020 at 12:37 AM Dejin Zheng <zhengdejin5@gmail.com> wrote:
>
> this patch sets use devm_platform_ioremap_resource() to simplify code,
> which contains platform_get_resource() and devm_ioremap_resource(). so
> use it to replace the platform_get_resource() and
> devm_ioremap_resource().
>
> Dejin Zheng (28):
>   i2c: img-scb: convert to devm_platform_ioremap_resource
>   i2c: mv64xxx: convert to devm_platform_ioremap_resource
>   i2c: owl: convert to devm_platform_ioremap_resource
>   i2c: exynos5: convert to devm_platform_ioremap_resource
>   i2c: mt65xx: convert to devm_platform_ioremap_resource

mt65xx seems not in the series.
