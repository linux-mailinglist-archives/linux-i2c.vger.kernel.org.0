Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 026AD3ED10F
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Aug 2021 11:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbhHPJaL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Aug 2021 05:30:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:55266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230506AbhHPJaC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 16 Aug 2021 05:30:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7284661B60
        for <linux-i2c@vger.kernel.org>; Mon, 16 Aug 2021 09:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629106165;
        bh=dmyYj0ezNx0MvGWDFSZyUPfyGCHldHnAQuKGjkZsuGM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=L9668WoUlwiJfoUwXEVocBn+Qmd5tND+CL1f5E4W62043CNhyA84gVMHJMemZJCn+
         WERCQXA8oJ8rPGtouDS6cTB0O6k7YQT+5i01SXzjJxtZQyUsDkrEHc/5Je3FSDRDnb
         BBHxfe25eEg+2+5/zyuw6vm6wtBi7YCK1efyYId/iJz2C196mx8zFh6NSCgMu6JawL
         oFFL1VyD53Gw5WONKpoYErzrpcqsUSAt/I5Er4jwr2kgtxF5OLjn4N+DM4/VBUmwRy
         aeIdkhIUBQ5mnHLb+nx97ioVDNunO3a+aPm0tHhKvtO5pym9jYQbRC4VsPfVbDY0WJ
         s7JRe5dtGqe/Q==
Received: by mail-oi1-f179.google.com with SMTP id bi32so25899499oib.2
        for <linux-i2c@vger.kernel.org>; Mon, 16 Aug 2021 02:29:25 -0700 (PDT)
X-Gm-Message-State: AOAM533kD3llGGEaxkMXLhnxXuTYQKggZ4IcYqFoN1A93HRpFytl0SDV
        vbTun3zdgkIwSVGuYLk+21wDqtI4koyQysssoDw=
X-Google-Smtp-Source: ABdhPJxkXrfohQAQsdS6i8MPse471/fxBmUrX5dicsOJsBQVRevarF0Fn5GuSVeyXmWHNkDagcukOlhRHL4E1zGTLeA=
X-Received: by 2002:aca:dd89:: with SMTP id u131mr11069804oig.47.1629106164858;
 Mon, 16 Aug 2021 02:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <07588701-4f82-2390-8781-5e6965e87eb4@omp.ru> <1ab424b2-95b8-76ab-9d18-9362d1595887@omp.ru>
In-Reply-To: <1ab424b2-95b8-76ab-9d18-9362d1595887@omp.ru>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Mon, 16 Aug 2021 11:29:08 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEMb9rCrJR8MSmUZPf16JXUepq3wcyk0t-w2YYZ6Ko=WA@mail.gmail.com>
Message-ID: <CAMj1kXEMb9rCrJR8MSmUZPf16JXUepq3wcyk0t-w2YYZ6Ko=WA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: synquacer: fix deferred probing
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 12 Aug 2021 at 22:39, Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
>
> The driver overrides the error codes returned by platform_get_irq() to
> -ENODEV, so if it returns -EPROBE_DEFER, the driver will fail the probe
> permanently instead of the deferred probing. Switch to propagating the
> error codes upstream...
>
> Fixes: 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C controller")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

>
> ---
>  drivers/i2c/busses/i2c-synquacer.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Index: linux/drivers/i2c/busses/i2c-synquacer.c
> ===================================================================
> --- linux.orig/drivers/i2c/busses/i2c-synquacer.c
> +++ linux/drivers/i2c/busses/i2c-synquacer.c
> @@ -578,7 +578,7 @@ static int synquacer_i2c_probe(struct pl
>
>         i2c->irq = platform_get_irq(pdev, 0);
>         if (i2c->irq < 0)
> -               return -ENODEV;
> +               return i2c->irq;
>
>         ret = devm_request_irq(&pdev->dev, i2c->irq, synquacer_i2c_isr,
>                                0, dev_name(&pdev->dev), i2c);
