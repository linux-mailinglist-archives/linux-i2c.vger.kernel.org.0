Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 591D83E3225
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Aug 2021 01:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238790AbhHFXqe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 19:46:34 -0400
Received: from mail-qk1-f169.google.com ([209.85.222.169]:35381 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbhHFXqe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 19:46:34 -0400
Received: by mail-qk1-f169.google.com with SMTP id a19so11754911qkg.2;
        Fri, 06 Aug 2021 16:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pR8zO3OKshG+hmDSufHjC/ABbj4zCWAkcdA3mbsdnwU=;
        b=W/kS7Q0/Gv/usd3Yu2x5Q+g7ep1HjjXWYJTtiOmSV8RTlAgqXa0vi4OHN+r4Q+pOYn
         5XWqcCmmYzKWnv1eJfpHJMYsv0cyTbUNfpicojxAfcmIwdoTACiav1VMLNF/9m2fyDOt
         oucE++X3QZmb0VmKJrtb5Jmt2J+HNefyykWvNC1NpDAdPwY76kfEGqQfVUHJbuiejNBu
         p+Jkmby1EyyjMm2rjdyALRxA9XhqQj5ni1qE68gjPyvGmAdT5fdRycK+yLBKN/y8rUhw
         eNai1IhNh4HYbqRV6HOFSQ7NV2bvCpVpg2K5/4iWO9Ih6vjx+PJYRxWfz8tgGP2aQaQq
         jKfw==
X-Gm-Message-State: AOAM531uBikKctM+0+RU7Mt24SrXs3i9LfyLdy6zB5/JOXU33xY1GRHj
        Bt4ijQ/rG4DL77gJMzjtl2do+JozyEM=
X-Google-Smtp-Source: ABdhPJw8bmZm9HZu9rezEO7iIqc/qOfpTxoPiP6s+3U+E1TjsxuCGI3yZtny7PH9uI69rAASDTnOvQ==
X-Received: by 2002:a05:620a:98c:: with SMTP id x12mr12769196qkx.303.1628293575996;
        Fri, 06 Aug 2021 16:46:15 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id l1sm4012572qtk.63.2021.08.06.16.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 16:46:15 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id 14so11763677qkc.4;
        Fri, 06 Aug 2021 16:46:15 -0700 (PDT)
X-Received: by 2002:a37:27ca:: with SMTP id n193mr10656080qkn.28.1628293575189;
 Fri, 06 Aug 2021 16:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <1628105086-8172-1-git-send-email-raagjadav@gmail.com> <1628105086-8172-2-git-send-email-raagjadav@gmail.com>
In-Reply-To: <1628105086-8172-2-git-send-email-raagjadav@gmail.com>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Fri, 6 Aug 2021 18:46:03 -0500
X-Gmail-Original-Message-ID: <CADRPPNTkdLEwSa2Bg1enzWBpcGco6twcQwvk_QqDXa=V1foBLg@mail.gmail.com>
Message-ID: <CADRPPNTkdLEwSa2Bg1enzWBpcGco6twcQwvk_QqDXa=V1foBLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: ls1046a: fix eeprom entries
To:     Raag Jadav <raagjadav@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, linux-i2c@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 4, 2021 at 4:32 PM Raag Jadav <raagjadav@gmail.com> wrote:
>
> ls1046afrwy and ls1046ardb boards have CAT24C04[1] and CAT24C05[2]
> eeproms respectively. Both are 4Kb (512 bytes) in size,
> and compatible with AT24C04[3].
> Remove multi-address entries, as both the boards have a single chip each.
>
> [1] https://www.onsemi.com/pdf/datasheet/cat24c01-d.pdf
> [2] https://www.onsemi.com/pdf/datasheet/cat24c03-d.pdf
> [3] https://ww1.microchip.com/downloads/en/DeviceDoc/doc0180.pdf
>
> Signed-off-by: Raag Jadav <raagjadav@gmail.com>

Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts | 8 +-------
>  arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts  | 7 +------
>  2 files changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts
> index db3d303..6d22efb 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts
> @@ -83,15 +83,9 @@
>                         };
>
>                         eeprom@52 {
> -                               compatible = "atmel,24c512";
> +                               compatible = "onnn,cat24c04", "atmel,24c04";
>                                 reg = <0x52>;
>                         };
> -
> -                       eeprom@53 {
> -                               compatible = "atmel,24c512";
> -                               reg = <0x53>;
> -                       };
> -
>                 };
>         };
>  };
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
> index 60acdf0..7025aad 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
> @@ -59,14 +59,9 @@
>         };
>
>         eeprom@52 {
> -               compatible = "atmel,24c512";
> +               compatible = "onnn,cat24c05", "atmel,24c04";
>                 reg = <0x52>;
>         };
> -
> -       eeprom@53 {
> -               compatible = "atmel,24c512";
> -               reg = <0x53>;
> -       };
>  };
>
>  &i2c3 {
> --
> 2.7.4
>
