Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5682830FC
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Oct 2020 09:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbgJEHjq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Oct 2020 03:39:46 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44935 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgJEHjq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Oct 2020 03:39:46 -0400
Received: by mail-ot1-f68.google.com with SMTP id a2so7694076otr.11;
        Mon, 05 Oct 2020 00:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5SPh2he2Jjc9n0j4/J15sHh1TSSZGC0HhCFcAtt85i8=;
        b=j/5eSeZD2rlTNh72vX7Y4QtcjcmtKU6/hi5D6FvK34ljOhvg2fTNZuhRvlGg2ez0U1
         s6m1nrJPgep+bgIhbtn1bGKjdY1Jju73V8dfkLSoZhy6uBhtRbHlUqCIU2j/jhuy2NZ8
         8jaoV9NCKu+MHAU5sK9BMU1eKqz3JOj5VIDnl/hQwLE9Kwx7AxGKLxy9aftA3gnWEiX+
         WscMIewXUF4GojDuxo7m14m6fNb/ltTkVFTtX0yGJqJVSXPdQgOs7+UHBpWwPCXivssz
         /Y8CSneKp02VlqRXRCtcIcAwuUoL94YVYf+6exkNj8Asimp1Jl5A2IxPAaa3B5HiwQcV
         8Csw==
X-Gm-Message-State: AOAM530cVwR9yUPjrR313f93A+kIpUW+UhF9o/xpEZY/Hc6JepSPeRl1
        IV+PH3vDWXPpXqev7fek5qH3BT2kDP7vV6u264c=
X-Google-Smtp-Source: ABdhPJx/lz6ouKsE1Lni3Mo3wReiYtmE5P1UwKx9YaGGDDZCj7wGzoBWKoemqZH3rboAaIfS/XygvOh+0BhV/GhhuNo=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr11029086otb.250.1601883585728;
 Mon, 05 Oct 2020 00:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200928155950.1185-1-uli+renesas@fpond.eu>
In-Reply-To: <20200928155950.1185-1-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Oct 2020 09:39:34 +0200
Message-ID: <CAMuHMdVzkRwrwzju0tpsZ3DLvtUaebJDemKTEJZ0BmsdqSme-Q@mail.gmail.com>
Subject: Re: [PATCH v4] i2c: sh_mobile: implement atomic transfers
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uli,

On Mon, Sep 28, 2020 at 6:09 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Implements atomic transfers to fix reboot/shutdown on r8a7790 Lager and
> similar boards.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>
> Hi!
>
> Another minor change in the atomic code path in start_ch() as suggested by
> Geert. All power management-related issues have been decided to be solved
> outside this driver, so we should be done here.
>
> CU
> Uli
>
>
> Changes since v3:
> - cut atomic_xfer code path short in start_ch()

Thanks for the update!

> --- a/drivers/i2c/busses/i2c-sh_mobile.c
> +++ b/drivers/i2c/busses/i2c-sh_mobile.c

> +static int sh_mobile_i2c_xfer_atomic(struct i2c_adapter *adapter,
> +                                    struct i2c_msg *msgs,
> +                                    int num)
> +{
> +       struct sh_mobile_i2c_data *pd = i2c_get_adapdata(adapter);

To make sure external conditions are satisfied, and we never deadlock,
as discussed in v3?

    if (pd->dev->power.is_suspended)
            return -EPERM;  /* any other suitable error code? */

> +
> +       pd->atomic_xfer = true;
> +       return sh_mobile_xfer(pd, msgs, num);
> +}
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
