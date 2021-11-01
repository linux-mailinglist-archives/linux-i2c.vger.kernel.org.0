Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCE87441A17
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 11:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbhKAKqC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 06:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbhKAKqB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 06:46:01 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8ACC061714;
        Mon,  1 Nov 2021 03:43:28 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id z20so63199100edc.13;
        Mon, 01 Nov 2021 03:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hkAfHmlmX9XWaQXSquKe/6RtfK/xB73zNGE3haQKgYE=;
        b=pmmpF5wfmYLmqYTcxMJhjqntWGMjj77X7b/s1PkF8/xALJuU8zrr6MKC3v0s4PKZid
         r6fhca2xFz6gZY8YuGfR1ocMFAIiQu0vVIBkd9kN/eH7aakvBE7Q8WZ12QQGEZUSqqfT
         NRW/Asfixo/GWNq32s6XjwPVzm+xBv4FpylSMRpgxNtGIW2kB6gG/aKZ86rQ2FHGOO8X
         EyQ8Z5eKWuNvrNH149SlRDtha7vCNQ8svs5Y8Mo4Mgqwpssp639EiqtFlBRth/lNPUvI
         tB4QuReGjL7LWvyKRxD215jykgIHzDlffKrFPvjt7KFQmbsUYAF8MQpeLP2CpAanbUrE
         wAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hkAfHmlmX9XWaQXSquKe/6RtfK/xB73zNGE3haQKgYE=;
        b=2ECDPryh50S3fgZuw1HFcnJJTBDShSN+kPL4QE+v+pD1C97LmKVanIKf2OgVhXyULf
         J+8CqKg1m6ra/p9GDl+yX27px1laBQ7mXM+NwwTs9GJMWUpCVLinsUxwsdBnSZT73Ie9
         GTThOT7axYB8zKUtpTCwslUMK8UiReJPpNGd4Rwy0nVoU06/1Wsnn93sEVy+gHGygAyq
         QcuSq8usM4BP0cXhJPAQAXVYKflPd7JsamUai6yKWno05GOCtQLnpnDeyOFw5YyXHdLL
         Q0FULcch/ptoAkulXRdVjxTiwSWG/YboDHytw96buIz/uiWMzQu7GNV7El7FXSKX55Mb
         Ss5Q==
X-Gm-Message-State: AOAM5319YS0OlFRn6Ob5DljAibSWsElb+L/TGcM7mfyuASoexHnVCapD
        1ge76a+1BrPB7bH2iHDVFIq3CI9WdyHv3Ajf53o=
X-Google-Smtp-Source: ABdhPJyXVNhlnl/0TfajrJTGbiXqFhdoeCCdMhQrbeibxaSPX2lFJNn3AJttuCqMvlSaoRJEwRY4HfJ0S+fEGopoa1Q=
X-Received: by 2002:a05:6402:207c:: with SMTP id bd28mr29606819edb.240.1635763407145;
 Mon, 01 Nov 2021 03:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211025094119.82967-1-hdegoede@redhat.com> <20211025094119.82967-6-hdegoede@redhat.com>
 <CAHp75VdfwA_3QK2Fo1S34rRZWHCMNzzHug4AKsRfOrKu4CU_YA@mail.gmail.com> <ff8c8418-8e73-f949-3734-c0e2e109f554@redhat.com>
In-Reply-To: <ff8c8418-8e73-f949-3734-c0e2e109f554@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 1 Nov 2021 12:42:37 +0200
Message-ID: <CAHp75VfUq+DZk_u5Wsyr5nnibbe+WrYDyhvCU22=4Pog06DgHg@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] clk: Introduce clk-tps68470 driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Nov 1, 2021 at 12:27 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 10/25/21 13:24, Andy Shevchenko wrote:
> > On Mon, Oct 25, 2021 at 12:42 PM Hans de Goede <hdegoede@redhat.com> wrote:

...

> >> +       for (i = 0; i < ARRAY_SIZE(clk_freqs); i++) {
> >> +               diff = clk_freqs[i].freq - rate;
> >> +               if (diff == 0)
> >> +                       return i;
> >
> >> +               diff = abs(diff);
> >
> > This needs a comment why higher (lower) frequency is okay.
>
> This function is called in 2 places:
>
> 1. From tps68470_clk_round_rate(), where higher/lower clearly is ok,
> (see the function name) so no comment needed.
>
> 2. From tps68470_clk_set_rate() where it is NOT ok and this is
> enforced in the caller:
>
>         unsigned int idx = tps68470_clk_cfg_lookup(rate);
>
>         if (rate != clk_freqs[idx].freq)
>                 return -EINVAL;
>
> This is not easy to describe in a comment, while being obvious
> if someone looking at this actually looks at the callers.

Hmm... but try your best. :-)

While at it, recently I have learned about util_macros.h. Any use of it here?
Or amending it there and re-using it here?

> >> +               if (diff < best_diff) {
> >> +                       best_diff = diff;
> >> +                       best_idx = i;
> >> +               }
> >> +       }

-- 
With Best Regards,
Andy Shevchenko
