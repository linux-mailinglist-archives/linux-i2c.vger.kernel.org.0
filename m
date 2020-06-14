Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 004AB1F8838
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 11:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgFNJvg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 05:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbgFNJvg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Jun 2020 05:51:36 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563A7C03E969;
        Sun, 14 Jun 2020 02:51:36 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 10so6479303pfx.8;
        Sun, 14 Jun 2020 02:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=39oy9+x2r20smG87AO766KEV7vfjw/IimHPuSc4PmHc=;
        b=U7L3eVxfJmmL4cmL0uA5TtdfrbJc/ykur0oRwCdGbxUg7EHskhTaDzaTpGdbwQMgTy
         /OE3cLTj4isx73OnuXN7ydJT3sMkXxY4ns8CkHvGX/bnhc98yBHuSlJm3RwiQKmhsbpS
         rlpBJPLLnM8XZIV0b0qQOqh0QREZNysfA08/5jQMo27Jwf3h+zaMawp1A5UqrGt43vht
         I15EJtm+4VLRMjD6p2qn5z0e0a6YN1cyD5x2VQRTVCKSAYkfBAKYw6QzZevM1sktkd9d
         I3lUIFjfL+IL+J9tGNH/mng9uPb6zctXx47bahVrNT3m3HCxrKE6Hy6Wfhr0heqUJ2Cx
         LLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=39oy9+x2r20smG87AO766KEV7vfjw/IimHPuSc4PmHc=;
        b=LofLH1FF7z/H4sH+AMD1ZG8OYEOiylKwG7PMgUedkFbAkjzorqLLr6+ZlY3RgAy2bE
         oG/HzlsMtqqQNMm+bo7gxuZspTKT66C8/LniPcN4oJElp+pj/nUwZQRjwlwgDYggvkTY
         DbL4fCyMURavAhrS1gVOLv+Yk1bIgBF46+Q5vSuNP3RLH5EdpRA23p9MIHQrXKT9K/BB
         p90JV8VvxpLMiNLz+TSj97V6DysLYH6olJIcoq2YM17OVQ3/tq2AmlsX1bjqnEFHYMeB
         3fbEoIYtgVRHD6w2B0ZweBlgz9+qZPalGAUBeDW875TCO7GE+YAMxG7uO0lYtuKJgNwb
         KA7w==
X-Gm-Message-State: AOAM531VPbZ4A0hLNsZ1RBQ3M4vg5YX6ZwpwYCQzJ8KeK/6jblX0QttS
        mEsuonKNGQtPImZFioWH2apwOq6KG33spYQF99E=
X-Google-Smtp-Source: ABdhPJwWsmvX3bE/PItgtj0DLrffiPn7ynOsHWcAOAeWj0YHuza/XooBgo/X6g3Yfn5oZzcgCRQmCyAf7CRsFbq4PBE=
X-Received: by 2002:a62:3103:: with SMTP id x3mr18317946pfx.130.1592128295883;
 Sun, 14 Jun 2020 02:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200613221436.8048-1-wu000273@umn.edu>
In-Reply-To: <20200613221436.8048-1-wu000273@umn.edu>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 14 Jun 2020 12:51:18 +0300
Message-ID: <CAHp75VfsB7Z=Usz-t4BQUepqy4ZPFB6_cO-VtroQqFexAcrmWw@mail.gmail.com>
Subject: Re: [PATCH] i2c: busses: Fix reference count leaks.
To:     wu000273@umn.edu
Cc:     Kangjie Lu <kjlu@umn.edu>, Wolfram Sang <wsa@kernel.org>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        Robert Richter <rrichter@marvell.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thor Thayer <thor.thayer@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jun 14, 2020 at 1:17 AM <wu000273@umn.edu> wrote:
>
> From: Qiushi Wu <wu000273@umn.edu>
>
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus call pm_runtime_put_noidle()
> if pm_runtime_get_sync() fails.
>

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Qiushi Wu <wu000273@umn.edu>
> ---
>  drivers/i2c/busses/i2c-img-scb.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
> index 98a89301ed2a..e13ca862fa97 100644
> --- a/drivers/i2c/busses/i2c-img-scb.c
> +++ b/drivers/i2c/busses/i2c-img-scb.c
> @@ -1058,8 +1058,10 @@ static int img_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>         }
>
>         ret = pm_runtime_get_sync(adap->dev.parent);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               pm_runtime_put_noidle(adap->dev.parent);
>                 return ret;
> +       }
>
>         for (i = 0; i < num; i++) {
>                 struct i2c_msg *msg = &msgs[i];
> @@ -1159,8 +1161,10 @@ static int img_i2c_init(struct img_i2c *i2c)
>         int ret;
>
>         ret = pm_runtime_get_sync(i2c->adap.dev.parent);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               pm_runtime_put_noidle(i2c->adap.dev.parent);
>                 return ret;
> +       }
>
>         rev = img_i2c_readl(i2c, SCB_CORE_REV_REG);
>         if ((rev & 0x00ffffff) < 0x00020200) {
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
