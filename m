Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 491DC25F470
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 09:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727871AbgIGH5K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 03:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbgIGH5E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 03:57:04 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B36D6C061573;
        Mon,  7 Sep 2020 00:57:02 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id e33so7680131pgm.0;
        Mon, 07 Sep 2020 00:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AxtstXZMEtmP2FoIFNEu7REwh8FJCestW6F65kCxEwY=;
        b=EPfJlGfwc4OpuebsbyoSQSC41WdaVtIlijTdxgZwe0fjsfcd0bop8h8i1L6Wp/fjQb
         vTt7LNgQ/bNm1/UbRjaGF6jkq+Dc2TtMNj86pH/cvWVZOjo3TBINaBQWBw0yq8rqwAee
         VMmLH7v6Vi33Nu7HdK2nx7QeS8P9T69gh0LhWVe2bLYBW5ZWC4MfDWAkwgEEJC1GIxhI
         8kzjlG/wzzqp2dBXBchJiuw4IE9G5KfGyitEKdigeyYUCao9K4Jf+5hvMkRzn4m7X4nf
         5+r/GYVsO/uhXQnWt9Hmws5kKOro3ZDDwOiK9sbsAAXRRBTgnh9b1NRK940W0yDX5vLm
         gNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AxtstXZMEtmP2FoIFNEu7REwh8FJCestW6F65kCxEwY=;
        b=rOrJRYLZHUzL/NmpIcsgHlfKtgjJa8UajqEIOVSXaiPn0P7U9ub7rgas6x1ury/98z
         SPOHqQUMv7AaxL2+nkfFEZ67NEgkmTR/ddEPntNWt+HO16wZCa3F/Jp42y5lpdv6rVmN
         fAZU7+R39HpCkpfCNfFsTuf/uZgqTl0B1N+cWASiyNLdTcl5lor/lrYLRKFahmGyZCkS
         teFaLRhs+0McM2mzEvm4zQ/rrSIwntKEHA3kZG8Dv7kNcLWntTXnB4dSEp2hzZvwxLC2
         u0MA2VfiJkbeekWMHfn46E9/BEqiCyPIQyleMbB7JAOXPGe+E0ZrIFogSSCtSWb/uj0b
         DdQw==
X-Gm-Message-State: AOAM533Vn8ZstV8bR3a+zJIYfTSl7zzNqf+/itJIkSE66MqDSOPi7Fb1
        /02evYJRGFVnx05jwrh8F/CLxa5W4xclUpQ759E=
X-Google-Smtp-Source: ABdhPJz2glZzyxpeK5cIRZp6SyRCtWiBVbwVgfAKhX9ioxkqcbck0nQVqKxFUubd4LeEIf9MVK2EmYJVW2mtN9XahhU=
X-Received: by 2002:a63:d648:: with SMTP id d8mr15909898pgj.4.1599465422220;
 Mon, 07 Sep 2020 00:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200906185039.22700-1-digetx@gmail.com> <20200906185039.22700-2-digetx@gmail.com>
In-Reply-To: <20200906185039.22700-2-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Sep 2020 10:56:45 +0300
Message-ID: <CAHp75VfGjk-91P5ENQ4=j0F99o7uVK10NxEqCS3tPEsM1o3NAQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/36] i2c: tegra: Make tegra_i2c_flush_fifos() usable
 in atomic transfer
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 6, 2020 at 9:51 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> The tegra_i2c_flush_fifos() shouldn't sleep in atomic transfer and jiffies
> are not updating if interrupts are disabled. Let's switch to use iopoll
> API helpers for register-polling. The iopoll API provides helpers for both
> atomic and non-atomic cases.
>
> Note that this patch doesn't fix any known problem because normally FIFO
> is flushed at the time of starting a new transfer.

...

> +       if (i2c_dev->is_curr_atomic_xfer)
> +               err = readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
> +                                                       1000, 1000000);
> +       else
> +               err = readl_relaxed_poll_timeout(addr, val, !(val & mask),
> +                                                1000, 1000000);
> +
> +       if (err) {
> +               dev_err(i2c_dev->dev, "failed to flush FIFO\n");

> +               return err;
>         }
>         return 0;

return err; ?

-- 
With Best Regards,
Andy Shevchenko
