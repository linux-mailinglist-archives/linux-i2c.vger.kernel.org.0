Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E564E354DFC
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 09:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235295AbhDFHiI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 03:38:08 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:36418 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235239AbhDFHiH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Apr 2021 03:38:07 -0400
Received: by mail-ua1-f50.google.com with SMTP id c2so4343717uaj.3;
        Tue, 06 Apr 2021 00:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RmRsbR6XoOklkvHZIGsoCASISOykeREojhdN/th0xeU=;
        b=d9fv5rp2KU9klt/8h1HPPLIrAPaTqikVAnV8K1E3unPlbqC4PonB8HxWJ1igPGeIMd
         VykxYSB56itZfQlS/mu7Ke7L2tJ4X2w97noYfOhgKtlMOZ7sYwQZIJHK+Kr+woIC3OOz
         yIWQSG8JPHGy5MBwgVHd5AJmoOyUtDb1ypi6e8rkKFBXxzxhC7HcxAlv7denzqLiMiL7
         mFlYNaxV1oj57bWVp6vILn9p+lGmu5JZjYZVSuEhSbXLCkDjamJ2tgNHWa3WxfMUIfUT
         +KS5LOWHT0nNox1P6JCBpVVyYytSMvBcQqqyK+svEH8cqu4fMPkCQCF1y49Mzme8TKBx
         ftdg==
X-Gm-Message-State: AOAM532mXFWHPWRZvKIHVTBJkOPgTfUgxEWvEEONujykEx5tFL/S5p8L
        4E5j5msu3lW26g9xbYfVUPy/yYGp8MT9ODGqgfaFJiwG
X-Google-Smtp-Source: ABdhPJwBAcEvgUy0SJsFz657tKqVXuHXYcg+qi5kZI+ZT3alsEhZPo1PwvrcuVBEGmDS00nt6FHywjqtWBzRHtOX4zM=
X-Received: by 2002:ab0:2c16:: with SMTP id l22mr16316731uar.100.1617694678850;
 Tue, 06 Apr 2021 00:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <8a05ea84-28e6-4d76-4f6d-55fb0a0cdf24@omprussia.ru>
In-Reply-To: <8a05ea84-28e6-4d76-4f6d-55fb0a0cdf24@omprussia.ru>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 6 Apr 2021 09:37:47 +0200
Message-ID: <CAMuHMdXYAcSQm5BDUK+WSjnMRNhmNtdD+h+UiH14321wBsdpBQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: rcar: add IRQ check
To:     Sergey Shtylyov <s.shtylyov@omprussia.ru>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Apr 4, 2021 at 7:53 PM Sergey Shtylyov <s.shtylyov@omprussia.ru> wrote:
> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to devm_request_irq() (which
> takes *unsigned* IRQ #), causing it to fail with -EINVAL, overriding
> an original error code.  Stop calling devm_request_irq() with the
> invalid IRQ #s.
>
> Fixes: 6ccbe607132b ("i2c: add Renesas R-Car I2C driver")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
