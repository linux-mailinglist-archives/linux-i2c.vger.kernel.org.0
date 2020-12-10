Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1E972D5C17
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 14:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389434AbgLJNfh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Dec 2020 08:35:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389404AbgLJNfa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Dec 2020 08:35:30 -0500
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC10C0613D6;
        Thu, 10 Dec 2020 05:34:50 -0800 (PST)
Received: by mail-yb1-xb41.google.com with SMTP id u203so4733283ybb.2;
        Thu, 10 Dec 2020 05:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U/roqOTkuyKuA5LDRyyEuc0O+uuXLFYRIA0JUlY59Bk=;
        b=I+i0gWaLA7UKfNFgJQDCwWrfCS9iCPpQ0A4zUjzU8Y4ZvassZGOITAyYroE6aiVQxp
         3C7S5fsGAcLvMA+eO0LiCzFAgyULX0jvv67m3oN432kQWKEeC312EQnW9kOU3Nm7vWce
         Ut5c1HlGF8+9XribssMqLCLY7I9i1aMW2lk0fCNwQphjzMxMT+gK001vflbpbYgzShJi
         uDcK/EXnVddWy4lPExw0YitK4tkoB/hkd8bGOcAoimf6NKx1l9QZOa3CtXBOS8qL5eF1
         IUJ/umFa6xMIOtZjhIlBnnFs/ayjL55MRiHZSmGPBddw+TYPs486F3uyhWOww9DiUad4
         afHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U/roqOTkuyKuA5LDRyyEuc0O+uuXLFYRIA0JUlY59Bk=;
        b=DQJCS0U535FpLdj0RiFfKZjpCA19ivlugstB7UBFtILVd3yI1enU3dsQgRmWVzDIne
         RWXXACNBVJHeBDfO4giB1JexDQ2ftCKQnlVs7Gk3VshTR6U68N1TEtmXPgok/48ft1Vx
         MkQ0i8GVeo17tydR0+jMBm8Zd+ejL+jg3QwyA4M93jpAqhnirNRDKSDzvgIMGqVqWbND
         f8WUt+45Ml6hcT93Bphym6UkW9vMWQdlBJ4Tz8LrFfTC1PNNxbNnXWQ9uEHI3/rgBS8v
         YfwRsxC/Vo0SHFlPXj8FSi7NvpEASSmtN1owKkr4RRe7YEC456KQPtzUZcX0uWS2uIMg
         1rdQ==
X-Gm-Message-State: AOAM533ISmZ8qDSjoS8jYaXJoCcko/P0mhd+dIuo9XIHKGizAQsNyciT
        OArkVSp8Y4Qqnh1FTPqnEkdJW5xBtHq1MHjW7XA=
X-Google-Smtp-Source: ABdhPJwOblTPqsGeuSVQCngMDfoO16GBD7DpLAVnesO53oahEPxk3iPPRkVlWRjT5EhD+gYUQuxuFgXEhYqvKK6vfrs=
X-Received: by 2002:a25:690b:: with SMTP id e11mr10757041ybc.314.1607607289459;
 Thu, 10 Dec 2020 05:34:49 -0800 (PST)
MIME-Version: 1.0
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com> <1607403341-57214-2-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1607403341-57214-2-git-send-email-yash.shah@sifive.com>
From:   Bin Meng <bmeng.cn@gmail.com>
Date:   Thu, 10 Dec 2020 21:34:37 +0800
Message-ID: <CAEUhbmWVn=W7y+xFGrmpNhQUEqLP-SjKoqeWZ=xgeVaMo5qO=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: riscv: Update DT binding docs to
 support SiFive FU740 SoC
To:     Yash Shah <yash.shah@sifive.com>
Cc:     linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        broonie@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Albert Ou <aou@eecs.berkeley.edu>, lee.jones@linaro.org,
        u.kleine-koenig@pengutronix.de,
        Thierry Reding <thierry.reding@gmail.com>, andrew@lunn.ch,
        Peter Korsgaard <peter@korsgaard.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 8, 2020 at 3:06 PM Yash Shah <yash.shah@sifive.com> wrote:
>
> Add new compatible strings in cpus.yaml to support the E71 and U74 CPU
> cores ("harts") that are present on FU740-C000 SoC.
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>
