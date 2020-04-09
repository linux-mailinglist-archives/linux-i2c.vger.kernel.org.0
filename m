Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4E41A2CB4
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Apr 2020 02:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgDIADN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 8 Apr 2020 20:03:13 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33355 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbgDIADM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 20:03:12 -0400
Received: by mail-ed1-f67.google.com with SMTP id z65so11087441ede.0;
        Wed, 08 Apr 2020 17:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OByFmC3gKfTNve9VG0Op7WiIWGOfL/8G8+x+MkLwBbI=;
        b=hIuniLMcvOkbw0P9AXFKH34GwSfgOmUI7defjUM3x4eS28udfC7IjJ5SSHGLzFnkCW
         aWrxFeZopfwDvYkNdQlFrfXt4a67HVpyb0XLaXhugbuPOD8ARf9TaHUvt/MJswp7KQ6b
         Tlnon81BwS0Wf2whXnnv5DCaJogLefJtIvPV0Dp7uXXkeZ1kIeL1cXkvl4SiHInA9oI8
         GLNa3sjDvfEBw+jmD6JelUGEpNlCSOtQhU+YC1HNXrp9+bCGHt/ZFHF4HRcjypg8b+Vo
         Bt6BKGPdv5rEu5HAHgOjTwfYpsbDIcWVCVpEyHBNAr9SnpG2QkSJ+Hxn/eq9h+5cn3Yg
         joRQ==
X-Gm-Message-State: AGi0PuaY2jZYDPmJ+bkmIqXdbACMLY8itEN1JQ4mf2IMc8Q58PPZnsay
        9JYh2iw0zhCu/1hDIn8aEZiKHtTcFqa+UERpwfg=
X-Google-Smtp-Source: APiQypL5+guUTQVDH7AvFWHpPLo9j6FcCNuyt0EenSNqXJtZIqpac5YGe6bPaeavJ7JObLfsjPR7mtL6LvDPHLyROeI=
X-Received: by 2002:aa7:df83:: with SMTP id b3mr8362603edy.61.1586390590894;
 Wed, 08 Apr 2020 17:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200407163741.17615-1-zhengdejin5@gmail.com> <20200407163741.17615-24-zhengdejin5@gmail.com>
In-Reply-To: <20200407163741.17615-24-zhengdejin5@gmail.com>
From:   Barry Song <baohua@kernel.org>
Date:   Thu, 9 Apr 2020 12:02:58 +1200
Message-ID: <CAGsJ_4yiQed=kPpKJvHiGYJc0y0-qCmvV5+zYRKvBWJYVKrDog@mail.gmail.com>
Subject: Re: [PATCH v1 23/28] i2c: sirf: convert to devm_platform_ioremap_resource
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     thor.thayer@linux.intel.com, krzysztof.adamski@nokia.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com,
        Sekhar Nori <nsekhar@ti.com>, bgolaszewski@baylibre.com,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, Baruch Siach <baruch@tkos.co.il>,
        wsa+renesas@sang-engineering.com, kgene@kernel.org,
        krzk@kernel.org, paul@crapouillou.net, vz@mleia.com,
        khilman@baylibre.com, matthias.bgg@gmail.com,
        gregory.clement@bootlin.com, rrichter@marvell.com,
        afaerber@suse.de, manivannan.sadhasivam@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de,
        Linus Walleij <linus.walleij@linaro.org>, mripard@kernel.org,
        wens@csie.org, ardb@kernel.org,
        Michal Simek <michal.simek@xilinx.com>, gcherian@marvell.com,
        jun.nie@linaro.org, shawnguo@kernel.org,
        rayagonda.kokatanur@broadcom.com, lori.hikichi@broadcom.com,
        nishkadg.linux@gmail.com, kstewart@linuxfoundation.org,
        allison@lohutok.net,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>, bigeasy@linutronix.de,
        info@metux.net, hslester96@gmail.com, narmstrong@baylibre.com,
        martin.blumenstingl@googlemail.com, qii.wang@mediatek.com,
        drinkcat@chromium.org, hsinyi@chromium.org, fparent@baylibre.com,
        opensource@jilayne.com, swinslow@gmail.com,
        linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dejin Zheng <zhengdejin5@gmail.com> 于2020年4月8日周三 上午4:39写道：
>
> use devm_platform_ioremap_resource() to simplify code, which
> contains platform_get_resource and devm_ioremap_resource.
>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
>  drivers/i2c/busses/i2c-sirf.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-sirf.c b/drivers/i2c/busses/i2c-sirf.c
> index fb7a046b3226..269a71b0ee7f 100644
> --- a/drivers/i2c/busses/i2c-sirf.c
> +++ b/drivers/i2c/busses/i2c-sirf.c
> @@ -272,7 +272,6 @@ static int i2c_sirfsoc_probe(struct platform_device *pdev)
>  {
>         struct sirfsoc_i2c *siic;
>         struct i2c_adapter *adap;
> -       struct resource *mem_res;
>         struct clk *clk;
>         int bitrate;
>         int ctrl_speed;
> @@ -310,8 +309,7 @@ static int i2c_sirfsoc_probe(struct platform_device *pdev)
>         adap = &siic->adapter;
>         adap->class = I2C_CLASS_DEPRECATED;
>
> -       mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       siic->base = devm_ioremap_resource(&pdev->dev, mem_res);
> +       siic->base = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(siic->base)) {
>                 err = PTR_ERR(siic->base);
>                 goto out;
> --
> 2.25.0
>
