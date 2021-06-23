Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1E63B1BE9
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jun 2021 16:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhFWOEy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Jun 2021 10:04:54 -0400
Received: from mail-ua1-f51.google.com ([209.85.222.51]:34560 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbhFWOEt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Jun 2021 10:04:49 -0400
Received: by mail-ua1-f51.google.com with SMTP id c47so192936uad.1;
        Wed, 23 Jun 2021 07:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4kB7+8R1X1Mp14SEda7xSh4fu9NS5YjQHGge6J0bi9w=;
        b=oo+BEZqR6dKsQ/GOoqsG47gtlUvQx2aTOcd4cJc2XK/qb6LMG5LtZ6Jv7E3VVfYagN
         Mo5oV+1SqL0MiMBpZxqDoDCTsV7BvA2V9uzwiH0xj5oKlmP2/v0X5a0rN5UiPsPLraKo
         KXrcIbKhPz8BMiMhXgOvID9XHc3n75kwozhvYID774bqwJsXUw3ID8H7c4hWSPcbqfpX
         cB7CVu7U6Xd6MrSwoTkzMBLSEjS6V4QbGtDqLGG7UkF+CQKarfS3vL3mQLXuhqAvg5LP
         uRPtuhrGLj5pAtJ867gcy0zSVAvVuFAPnRe6u9WjCk8917oZThUWwfQ9PMEC77TnNAgk
         aHJg==
X-Gm-Message-State: AOAM530pTGyZVJVnxazUbZEw/0ZvVU38LGvEW/t8JA64i0rvjpGRVDB+
        2PRy6IXMWtSHEdAO/Bez3q3aTBsA6D/jiC7ZYzk33n9D6C1uDg==
X-Google-Smtp-Source: ABdhPJy31i5AAunYMREiF+cdMgFimvVF04l3hoci7n34ee1J2y5AMmyPDDJo06xDEY8hquOoSeWkvrZOFG8J6pkbDPk=
X-Received: by 2002:ab0:1e4c:: with SMTP id n12mr4804036uak.58.1624456951381;
 Wed, 23 Jun 2021 07:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com> <20210623095942.3325-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210623095942.3325-6-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Jun 2021 16:02:19 +0200
Message-ID: <CAMuHMdVQ-XFy6fP_g70N8ukNPFj20ds-iEDF58Ocnpg7e5wLsQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] i2c: rcar: : use proper DMAENGINE API for termination
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Wed, Jun 23, 2021 at 12:01 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> it should be sync or async. Here, we want dmaengine_terminate_sync()
> because there is no other synchronization code in the driver to handle
> an async case.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

Is this safe? The driver is not using a threaded irq, and DMA termination
may be called from the interrupt handler.

Have you tried triggering DMA termination, with lockdep enabled?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
