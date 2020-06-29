Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE80220E238
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jun 2020 00:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731764AbgF2VD1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Jun 2020 17:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731139AbgF2TMr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Jun 2020 15:12:47 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82283C014AF6;
        Mon, 29 Jun 2020 00:52:22 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id n5so14663135otj.1;
        Mon, 29 Jun 2020 00:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R8C4z0LbSPVGbsZE7eGY71Dl895FwzE8KMTiHFJ686g=;
        b=CsBBz3sw+x14/KDc2Mtr+yEO17isSUhQWOWr4ZOKK3ycosYbAmNhjLgUtyVqbEpw4M
         ywCfkLE3pTNEEnpho7+47zvR/xjP1lzaO/DLPz9/KGV42ie/XdiqKDRlo9Dd13l9b3+p
         ngSmrV77F9sKPaKRRJJz3e/qZW7px80GaOPrkSgmfmprhonlG/S7W09nyY2yX1dsArPk
         yZyO+R8LnF4fQ4BSUQnKbvuBASo2QuuQGBpmFQCKP/zLhZJAFQSXNCeg9VfZBRr3jZAf
         J8vMZ7mwrZ6znW6JYi+u43I9+O+DxY+gTgK9r0nCCsZQKk07M9c8bShOzXh4QmPzaGiu
         wbKQ==
X-Gm-Message-State: AOAM533FFSTUX80FniXR9m90X81ptWrpxlxjTZIiyKYaVnMSH8Vihecp
        ncmFscXJv6hhSCVt2AAEXWL873kS128fta+rY7fECA==
X-Google-Smtp-Source: ABdhPJxJc71RlIZxkeDk4vk/lTshWvVLMLmeFCUJ3eDN66OBqLNV8HFtnLGutc+cZtJMrPclYfomQUnMQVLI4ZieYkA=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr11515761otb.107.1593417141825;
 Mon, 29 Jun 2020 00:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200628185522.5902-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200628185522.5902-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jun 2020 09:51:59 +0200
Message-ID: <CAMuHMdXFgR__hnUO-o+2ukxOYc_6U63wjP1PJyip3KGg277gDA@mail.gmail.com>
Subject: Re: [PATCH] i2c: add Kconfig help text for slave mode
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Sun, Jun 28, 2020 at 8:55 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> I can't recall why there was none, but we surely want to have it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/i2c/Kconfig
> +++ b/drivers/i2c/Kconfig
> @@ -114,6 +114,11 @@ config I2C_STUB
>  config I2C_SLAVE
>         bool "I2C slave support"
>

Why the blank line here ^^^?

> +       help
> +         This enables Linux to act as an I2C slave device. Note that your I2C
> +         bus master driver also needs to support this functionality. Please
> +         read Documentation/i2c/slave-interface.rst for further details.
> +
>  if I2C_SLAVE
>
>  config I2C_SLAVE_EEPROM

The rest looks fine to me.
As you don't like conditional R-b's, I'll add mine on v2 ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
