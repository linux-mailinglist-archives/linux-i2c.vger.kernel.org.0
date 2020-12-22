Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6166E2E0572
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Dec 2020 05:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgLVEjb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Dec 2020 23:39:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgLVEjb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Dec 2020 23:39:31 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799E5C061282
        for <linux-i2c@vger.kernel.org>; Mon, 21 Dec 2020 20:38:10 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id 4so6787527plk.5
        for <linux-i2c@vger.kernel.org>; Mon, 21 Dec 2020 20:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=KMIz8Txzy6wjyHZ1wwNssQ3NrdVzopyLXnUTumDPEu4=;
        b=f37eFkln4a/htDAWss+ZS1U+E4a3XjADVDLugAkDTqYfhz6h+hiYbGevReGFf4n1TK
         3LcyVU0v8oEj/ldV2LwRorapAZA9fM+aEsLElWnlYinloCFhkUxXIG6IPajD8tgiJJea
         DpV7MWDOXHzOuzTO/m9jSt14tPoJrM5KP18DX8I2/m7k1RJGMbdgBM9opD9aW4R0APi2
         qwsxK5iRF4PUxhEWWnJeQbqIQ1L1pe/0UYpfefLQ75Em26FoNTFGgZaoz7DKALCRXLEX
         ZOBQkG9jMif+c5JtWfTVjvIK0ay59QORO0oyT5r2YmuHYQtzadQyZ5I+40srrzB7gnDd
         Pygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=KMIz8Txzy6wjyHZ1wwNssQ3NrdVzopyLXnUTumDPEu4=;
        b=sCjjebbwdC8SH3Q8AqXows+ypVHYp0JEr6QoxeAm9xoaZfuq6LRZ0RMvqff/W2Kkhb
         Bg3zpgEF1L7DgKZepx9/pe55rbE5rPPEe1tfHT93pLGVg8TAOjTykR+EuoPLTu2NXmum
         W1je8ZNgBGdKrVnqNE2s2nuQ1AjT/f5lqyOmkGWx/MOnsLnGRkrWD03fBgilXQweafdp
         yF79OKdlEIvpTnb7fjDNKCYua7NQq3yy4nC/Fx0OlShM85TswdTVuCHUe48EjjlSPPt7
         7XZNHguibhCOX2pWaFXbAHphSAwkchnJIgzsZTxgexVo0qYDXJce6uO/+QyIkrMmODZT
         TqXw==
X-Gm-Message-State: AOAM530j5wdjnqexE9lp+CS2x6ob3I6Crw1VlGfeGcBXxfmKbNd79njJ
        v8JSMBSV32GYNx3ARRTv/J+36A==
X-Google-Smtp-Source: ABdhPJxtuQf6v3NOjOt18j+2XE9PyJZOYNWFlG1D0U0wBxlkHbcyvIu7qM9Ho0qf5ZhZV4ECTna2pA==
X-Received: by 2002:a17:902:694c:b029:da:afba:beab with SMTP id k12-20020a170902694cb02900daafbabeabmr19519669plt.32.1608611889761;
        Mon, 21 Dec 2020 20:38:09 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id a136sm19619380pfd.149.2020.12.21.20.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 20:38:09 -0800 (PST)
Date:   Mon, 21 Dec 2020 20:38:09 -0800 (PST)
X-Google-Original-Date: Mon, 21 Dec 2020 20:38:02 PST (-0800)
Subject:     Re: [PATCH v2 0/9] arch: riscv: add board and SoC DT file support
In-Reply-To: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
CC:     linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        broonie@kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        aou@eecs.berkeley.edu, lee.jones@linaro.org,
        u.kleine-koenig@pengutronix.de, thierry.reding@gmail.com,
        andrew@lunn.ch, peter@korsgaard.com,
        Paul Walmsley <paul.walmsley@sifive.com>,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        yash.shah@sifive.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     yash.shah@sifive.com, robh+dt@kernel.org
Message-ID: <mhng-711b1a2e-46bd-4169-841d-f18fe4bba6bb@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 07 Dec 2020 20:55:32 PST (-0800), yash.shah@sifive.com wrote:
> Start board support by adding initial support for the SiFive FU740 SoC
> and the first development board that uses it, the SiFive HiFive
> Unmatched A00.
>
> Boot-tested on Linux 5.10-rc4 on a HiFive Unmatched A00 board using the
> U-boot and OpenSBI.
>
> This patch series is dependent on Zong's Patchset[0]. The patchset also
> adds two new nodes in dtsi file. The binding documentation patch
> for these nodes are already posted on the mailing list[1][2].
>
> [0]: https://lore.kernel.org/linux-riscv/20201130082330.77268-4-zong.li@sifive.com/T/#u
> [1]: https://lore.kernel.org/linux-riscv/1606714984-16593-1-git-send-email-yash.shah@sifive.com/T/#t
> [2]: https://lore.kernel.org/linux-riscv/20201126030043.67390-1-zong.li@sifive.com/T/#u
>
> Changes in v2:
> - The dt bindings patch is split into several individual patches.
> - Expand the full list for compatible strings in i2c-ocores.txt
>
> Yash Shah (9):
>   dt-bindings: riscv: Update DT binding docs to support SiFive FU740 SoC
>   dt-bindings: spi: Update DT binding docs to support SiFive FU740 SoC
>   dt-bindings: pwm: Update DT binding docs to support SiFive FU740 SoC
>   dt-bindings: serial: Update DT binding docs to support SiFive FU740
>     SoC
>   dt-bindings: gpio: Update DT binding docs to support SiFive FU740 SoC
>   dt-bindings: i2c: Update DT binding docs to support SiFive FU740 SoC
>   riscv: dts: add initial support for the SiFive FU740-C000 SoC
>   dt-bindings: riscv: Update YAML doc to support SiFive HiFive Unmatched
>     board
>   riscv: dts: add initial board data for the SiFive HiFive Unmatched
>
>  .../devicetree/bindings/gpio/sifive,gpio.yaml      |   4 +-
>  .../devicetree/bindings/i2c/i2c-ocores.txt         |   8 +-
>  .../devicetree/bindings/pwm/pwm-sifive.yaml        |   9 +-
>  Documentation/devicetree/bindings/riscv/cpus.yaml  |   6 +
>  .../devicetree/bindings/riscv/sifive.yaml          |  17 +-
>  .../devicetree/bindings/serial/sifive-serial.yaml  |   4 +-
>  .../devicetree/bindings/spi/spi-sifive.yaml        |  10 +-
>  arch/riscv/boot/dts/sifive/Makefile                |   3 +-
>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi         | 293 +++++++++++++++++++++
>  .../riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 253 ++++++++++++++++++
>  10 files changed, 590 insertions(+), 17 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/sifive/fu740-c000.dtsi
>  create mode 100644 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts

Aside from that question about the i2c bug these look good to me.  I don't see
any Ack/Review on the DT side of things, though.  If you want to take them
through a DT tree that's fine for me, I'll leave them in my inbox for now and
if nobody says anything I'll look a bit more and take them for 5.12.

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
