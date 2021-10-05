Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9C54227E2
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Oct 2021 15:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235056AbhJENdl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Oct 2021 09:33:41 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:44891 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234209AbhJENdi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Oct 2021 09:33:38 -0400
Received: by mail-vs1-f49.google.com with SMTP id 66so7395844vsd.11;
        Tue, 05 Oct 2021 06:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jtIuyFUc/GQgo2brS5lWjKc5AQy0lekPqeQGIz7oxwI=;
        b=qGcA0SUuG9YMYS/jsz7sN+FpjB7mvda0zJe+bpIBTZlpzadlmT6jVW2gZVuGVhLGWd
         bU4pD3f5IfKidWUwsasJvh2nW69vL96rJJ7KpbWwt9W6r6AZYchianfQyq3r9FzClSHo
         hiCqYBN3xt3NTmwzKS78O204F8NO8yjb7r7vTvttOgh22TXVjGCj7+aSrfjQn/l2rlSv
         WKzPR3qAnbIc00OkQFyObO170EDscpPw5wfnzx7eTdUIiee/1jpKOzQP5G0fnarE1cxd
         B+UNnZSG7OYtt9g1W3xn7MQMIGNAdqcTMIFuJXOQY53tDLDXYFoR2BPn7kdDI50+GGv2
         Y92g==
X-Gm-Message-State: AOAM533iXFz9uUbQ1iqPd2K06FZUXo+sSGysxYNeNAhn5UXvbOmbdlCC
        JXN7IgOTM81pZ7UgkbFZ+cqQcqDdD1PVVFgb07dyW/mITq8=
X-Google-Smtp-Source: ABdhPJwTl6/GZjIbngxcjUnWHz5UYozZUYroW85rNOzUtPh/QU0Fo27+EpkPx2MAnOyjQXAxXvV9KdjTzVi3yyrqXh4=
X-Received: by 2002:a67:c295:: with SMTP id k21mr15890974vsj.37.1633440707232;
 Tue, 05 Oct 2021 06:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210922160649.28449-1-andrew_gabbasov@mentor.com>
In-Reply-To: <20210922160649.28449-1-andrew_gabbasov@mentor.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Oct 2021 15:31:35 +0200
Message-ID: <CAMuHMdVVDpBAQR+H1TAnpf65aVbAL0Mm0km7Z9L7+1JuF6n1gQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: rcar: add SMBus block read support
To:     Andrew Gabbasov <andrew_gabbasov@mentor.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andrew,

On Wed, Sep 22, 2021 at 6:14 PM Andrew Gabbasov
<andrew_gabbasov@mentor.com> wrote:
> The smbus block read is not currently supported for rcar i2c devices.
> This patchset adds the support to rcar i2c bus so that blocks of data
> can be read using SMbus block reads.(using i2c_smbus_read_block_data()
> function from the i2c-core-smbus.c).
>
> Inspired by commit 8e8782c71595 ("i2c: imx: add SMBus block read support")
>
> This patch (adapted) was tested with v4.14, but due to lack of real
> hardware with SMBus block read operations support, using "simulation",
> that is manual analysis of data, read from plain I2C devices with
> SMBus block read request.
>
> Signed-off-by: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
> Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -429,9 +431,16 @@ static bool rcar_i2c_dma(struct rcar_i2c_priv *priv)
>                 /*
>                  * The last two bytes needs to be fetched using PIO in
>                  * order for the STOP phase to work.
> +                *
> +                * For SMBus block read the first byte was received using PIO.

So it might be easier to read, and more maintainable, to keep the
old assignments:

    buf = priv->msg->buf;
    len = priv->msg->len - 2;

and adjust them for SMBus afterwards:

    if (block_data) {
            /* For SMBus block read the first byte was received using PIO */
            buf++;
            len--;
    }

?

>                  */
> -               buf = priv->msg->buf;
> -               len = priv->msg->len - 2;
> +               if (block_data) {
> +                       buf = priv->msg->buf + 1;
> +                       len = priv->msg->len - 3;
> +               } else {
> +                       buf = priv->msg->buf;
> +                       len = priv->msg->len - 2;
> +               }
>         } else {
>                 /*
>                  * First byte in message was sent using PIO.

And below we have another case handling buf and len :-(

So perhaps:

    buf = priv->msg->buf;
    len = priv->msg->len;

    if (read) {
            /*
             * The last two bytes needs to be fetched using PIO in
             * order for the STOP phase to work.
             */
            len -= 2;
    }
    if (!read || block_data) {
            /* First byte in message was sent using PIO *
            buf++;
            len--;
    }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
