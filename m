Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42EC25C000
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 13:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgICLRU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 07:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728444AbgICLRS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Sep 2020 07:17:18 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD5BFC061251;
        Thu,  3 Sep 2020 04:03:05 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id v196so2053454pfc.1;
        Thu, 03 Sep 2020 04:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yc4wkCo7MeYrmmnwisSRarxaaBJAo1GNuY3VsM322Kg=;
        b=V+NLN2f/oumXmYED9CGhvzHg1A3k7uzbduXR5eZhQX9/LB452xGmGWatlhugioh3fn
         C2jDtT6Rc46kWS8I2VMaaQ0YJ2cUJ0sW+0WJexHovLKoPUHB35BiDayz+5LOPKPRh7jN
         LDbNcnYH6pS9mK4fFj6e+3Ohv0X/OBTORciTRAxc+4tQXi6M5vmL49DLqUTh1O7Zc1gZ
         TShC6BYGRuSfGHezFoj+FzbZQ7DRptRhuSXsAOWIOYn9IzCI1Vi1paFBp6LrQFxA8AKs
         j6lwADHrIN66e/OyJTVsiNNhAn6Y0D5eGSoKsL2bPAWMUbdWHdvzKfkOF+cewY9GN8/b
         pdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yc4wkCo7MeYrmmnwisSRarxaaBJAo1GNuY3VsM322Kg=;
        b=X9EbEKKDQ7SKr3hFldkD+96BSiInMEBHd4MdeRZ14RnTstUIJ4NfcM5Y6PNBmBKyIU
         O4EGi5hLLaCDFxjyR0FHsea/D2JeCkMwokcoBBjybz6Qm5FMpmuVOMO+Oe3RjuhwvIR9
         /YEKSriqSn/e270yD0GvE9tZMSH03QFL/tVV2QbqcbGgtj6I2jpZBdhSGgeCJQ/Gdfze
         PtaM3RkaYib82tbNM2Mewz+CW6jEC+MOfSLf5Wzfdp9EsCoHwdfPx3VgzyjNfSWrkrno
         7tdUYBtBeZP5XNyCDCfHwtlrROV1oqV/X4+LcVeSqWaEYS3+G+YTp6tkZPx91MNtoyPr
         UtxA==
X-Gm-Message-State: AOAM530mWtu7OGKgKaLUAcg6aJTuBA2jOjorX+29sIpQ9LOhCBB7ejXc
        1NDsQcxKzTcej4UyqihzrdoC9thx9I4DrMUO5II=
X-Google-Smtp-Source: ABdhPJwDzelAtXwzu1AP2Sck+DOJdO2HFfZJWEguZGryUdrzqFlNyIe50UOUdMIYN72Gvo8JpjKeqGFXAeY1JyeFBFc=
X-Received: by 2002:a63:d648:: with SMTP id d8mr2513798pgj.4.1599130985426;
 Thu, 03 Sep 2020 04:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200903005300.7894-1-digetx@gmail.com> <20200903005300.7894-2-digetx@gmail.com>
In-Reply-To: <20200903005300.7894-2-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 3 Sep 2020 14:02:48 +0300
Message-ID: <CAHp75VcLk9pVRefA7cTgVQcX3-9EgcW6c-VUSpSOut0Y1B7J5Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/22] i2c: tegra: Make tegra_i2c_flush_fifos() usable
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

On Thu, Sep 3, 2020 at 3:53 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> The tegra_i2c_flush_fifos() shouldn't sleep in atomic transfer and jiffies
> are not updating if interrupts are disabled. Hence let's use proper delay
> functions and use ktime API in order not to hang atomic transfer. Note
> that this patch doesn't fix any known problem because normally FIFO is
> flushed at the time of starting a new transfer.

> +       /*
> +        * ktime_get() may take up to couple milliseconds in a worst case
> +        * and normally FIFOs are flushed, hence let's check the state before
> +        * proceeding to polling.
> +        */

Everything, including above can be done by using macros from iopoll.h. Why not?

> +       if (!(i2c_readl(i2c_dev, offset) & mask))
> +               return 0;
> +
> +       ktime = ktime_get();
> +       ktimeout = ktime_add_ms(ktime, 1000);
> +
>         while (i2c_readl(i2c_dev, offset) & mask) {
> -               if (time_after(jiffies, timeout)) {
> -                       dev_warn(i2c_dev->dev, "timeout waiting for fifo flush\n");
> -                       return -ETIMEDOUT;
> -               }
> -               usleep_range(1000, 2000);
> +               if (ktime_after(ktime, ktimeout))
> +                       goto err_timeout;
> +
> +               if (i2c_dev->is_curr_atomic_xfer)
> +                       mdelay(1);
> +               else
> +                       fsleep(1000);
> +
> +               ktime = ktime_get();
>         }
>         return 0;
> +
> +err_timeout:
> +       dev_err(i2c_dev->dev, "FIFO flushing timed out\n");
> +
> +       return -ETIMEDOUT;
>  }


-- 
With Best Regards,
Andy Shevchenko
