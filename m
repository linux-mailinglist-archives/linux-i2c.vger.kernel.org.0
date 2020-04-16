Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 600F11AD1DD
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 23:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbgDPV3h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Apr 2020 17:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726049AbgDPV3e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Apr 2020 17:29:34 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40832C061A0C;
        Thu, 16 Apr 2020 14:29:33 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t4so93414plq.12;
        Thu, 16 Apr 2020 14:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xKJ12TLkzQ/kXKzUNh7uZY71wcHGHq0dr9HRnNeejTs=;
        b=GBH/CeFkVshycdrumE7Cxfzsr2k8oHphKunJ5cQkq/J+BEWy0B8mN7So8xFtkmT2Sy
         OJVsuR2YdLMqncaZ6zEycx4nFK+mVPVCNYOhjvj5TJ4RS3I/Bw/QlW04R3YfV2LvoegR
         VqTg6xwm5Nj0dgN2MN3j+53B+5FTa1R+FgI5eGsuwX5plLN3LtvSF+4f7XCVCnlpdS2E
         youpM0r8I65nbaeR/IJm+pYpAJo61yBeI+0D06Vq7lhAn2pENbE0q5kjHsJm1SjuuqSW
         nTRiaYpEwP4ycb7a8oWaa9JHyDjdhAEzkl6JO6tU1pfvjzI+2K8oMGvBshxGCKJxpHxF
         fFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xKJ12TLkzQ/kXKzUNh7uZY71wcHGHq0dr9HRnNeejTs=;
        b=gdzIt9debtoisiNVf+gRSU0nAmazzGYmQGOlAqjBURy0DbcJCmWDAWvLyaA+ULAi5J
         QnCsmCz6bNwdnlzwgi1c2ekABLpcheC9J7tlcLmodgNklx7QlxKmfrQqG7fYUICqImIv
         rJe5bjo6szT40Idhki/9/Mpks139qGjntxzTb5LwP4VK9PZrhfQfSL4p7dZl4fMUDml8
         pUYIAf1pdAHxce6TM7Zm5ulkMb/mIyPZ9y6M1Ua2O+rM/diNxJ44BgzZd28Od/3JIfH0
         pcfgiCfgrDXTriekYBWgVNXM9YbbD1xnzc+PU8rjLSGhuqzqtGyCuSVg/an1SKdyMyBG
         I+/Q==
X-Gm-Message-State: AGi0PuZTXfN3S2Uvq2u4I1RcVjkHA6/zkIf32QKmCiSiAi3C1BdnamzV
        miGa1zWKnULo375Kuz3unJkXJkJO4EboT5ejl6c=
X-Google-Smtp-Source: APiQypK7aMZjGbS/drYLPjs2OxK5ulil5CIhuwgD0W6W93ut0pOvMYA8S/xXs0MgwEgcE2/MgaPagQBZIHYcv42CEL4=
X-Received: by 2002:a17:902:aa09:: with SMTP id be9mr261775plb.18.1587072572729;
 Thu, 16 Apr 2020 14:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200416152345.23077-1-zhengdejin5@gmail.com> <6ca3cd57-de73-5327-5773-e08bf12c4a85@web.de>
 <7713a931e4475294de85b74aca298dde8be4242d.camel@perches.com>
In-Reply-To: <7713a931e4475294de85b74aca298dde8be4242d.camel@perches.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Apr 2020 00:29:20 +0300
Message-ID: <CAHp75Vdd8SzrzXuxTTtkqRBWZuebhumJfv_fBPqdKwe780_ZEQ@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: busses: remove duplicate dev_err()
To:     Joe Perches <joe@perches.com>
Cc:     Markus Elfring <Markus.Elfring@web.de>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Thor Thayer <thor.thayer@linux.intel.com>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Patrick Williams <alpawi@amazon.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Barry Song <baohua@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        George Cherian <gcherian@marvell.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Apr 17, 2020 at 12:28 AM Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2020-04-16 at 20:22 +0200, Markus Elfring wrote:
> > > it will print an error message by itself when platform_get_irq()
> > > goes wrong. so don't need dev_err() in here again.
> >
> > I suggest to improve the commit message considerably.
>
> I suggest you ignore Markus' suggestion.
>
> The commit message is OK.
>
> The subject _could_ have included "platform_get_irq" something like
>
> Subject: [PATCH v2] i2c: busses: Remove platform_get_irq()'s duplicated dev_err()
>
> but I believe it's not important enough to redo.

+1, I think it's good enough.

-- 
With Best Regards,
Andy Shevchenko
