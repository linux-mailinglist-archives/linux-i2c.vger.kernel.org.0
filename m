Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B1333049F
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Mar 2021 21:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbhCGUkN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Mar 2021 15:40:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbhCGUjg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Mar 2021 15:39:36 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76BCC06174A;
        Sun,  7 Mar 2021 12:39:35 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id kr3-20020a17090b4903b02900c096fc01deso1928791pjb.4;
        Sun, 07 Mar 2021 12:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ksneqLZ9zvuj+Q9Pi6/GCANghUOfFQNIq6D+RQ8519s=;
        b=gsBwdgKy0qJ/sWj2BknIzEzST332yyHdoW5xYOtq9fWcfHflnhmaGhq2v6q3a4IYmj
         4m0L+gBQsxS6lqDfeq7qXVpJa/1xFLnOtrpduuYufDMwijEVDsiVCTrifmiuqRHxy4D7
         hLPkAgOp1xjPHPBPLFjlvyGFa7ikTYDXjMVWzPUK/5feTbTPDv+eJWQhQcsrNEjHQIp6
         xh2gqgD09F6/3L4HXirWiqukMjWmlgiMFw0TDgmAeTr9NHY8yVNQyppk+HAKOREQHwFZ
         79dWlj2kWlC85Y2y3L72bZ8CmWcgy+y7cDQG3rf24DBn73gv54r1lQ9diZdY+lzLWWdG
         BNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ksneqLZ9zvuj+Q9Pi6/GCANghUOfFQNIq6D+RQ8519s=;
        b=sAzzl0ww9gGcTOGzkzgfrv8fsGsVOCkwWkZrsKcPyhU0rrthrEe2vBR2UTi/9MrNEt
         LuVFOKYGkJ9fbRZIxblBd+l4Veyaq1FFARG9qwX8pl5DzJLLv5pRvBoql++5f0eprRVf
         kl60x419A8GBrul7HnUvk2RqWoUvDPX2s5GK7z5RU8YbSSp4vZsq49jOj2dDKkNmNxin
         cW8Lgr7jAxqSdVgSW6yNN9rZMkrdjmqGdHw7Hzb1jv5AXyXyiHHqnkYaJp4rUvj21S/O
         yjQm6ajHlTF0MUR3CVSrXTA6TKUVKSz2cUdDcSnWHCSa2J4TNC5+sP5Z+pTaEQ/NXIUF
         uMfg==
X-Gm-Message-State: AOAM531vpV+zKi/10qhzhHJdy0XPeUo6h/Qq3O0wGIYtDzkDoxOE5K7n
        AV0MWNrsVgoPEpZHI3vvEy3TQk77hVSeepgGMCw=
X-Google-Smtp-Source: ABdhPJxlj04alWLqhDKdUE58NU9W7umO8MwZXqbfilTz4/eiKjejZ6M4QMIuwTi82BfFMcr9ywapb7y/aJ9mm6zMO+c=
X-Received: by 2002:a17:902:d2c1:b029:e5:ccfe:1e93 with SMTP id
 n1-20020a170902d2c1b02900e5ccfe1e93mr17949404plc.0.1615149575234; Sun, 07 Mar
 2021 12:39:35 -0800 (PST)
MIME-Version: 1.0
References: <20210222130735.1313443-1-djrscally@gmail.com> <20210222130735.1313443-2-djrscally@gmail.com>
 <CAHp75VfPuDjt=ZfHkwErF7_6Ks6wpqXO8mtq-2KjV+mU_PXFtg@mail.gmail.com> <615bad5e-6e68-43c9-dd0b-f26d2832d52f@gmail.com>
In-Reply-To: <615bad5e-6e68-43c9-dd0b-f26d2832d52f@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 7 Mar 2021 22:39:18 +0200
Message-ID: <CAHp75Vc2iwvh1RiYmQDPSvgNvGT_gBcGTK67F+MhWgXyoxqn0A@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] ACPI: scan: Extend acpi_walk_dep_device_list()
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        kieran.bingham+renesas@ideasonboard.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>, me@fabwu.ch,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        devel@acpica.org, "Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Mar 7, 2021 at 3:36 PM Daniel Scally <djrscally@gmail.com> wrote:
> On 22/02/2021 13:34, Andy Shevchenko wrote:
> > On Mon, Feb 22, 2021 at 3:12 PM Daniel Scally <djrscally@gmail.com> wrote:
> >> The acpi_walk_dep_device_list() is not as generalisable as its name
> >> implies, serving only to decrement the dependency count for each
> >> dependent device of the input. Extend the function to instead accept
> >> a callback which can be applied to all the dependencies in acpi_dep_list.
> >> Replace all existing calls to the function with calls to a wrapper, passing
> >> a callback that applies the same dependency reduction.
> > The code looks okay to me, if it was the initial idea, feel free to add
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
>
> Thank you!
>
>
> >> + */
> >> +void acpi_dev_flag_dependency_met(acpi_handle handle)
> >> +{
> > Since it's acpi_dev_* namespace, perhaps it should take struct acpi_device here?
>
>
> I can do this, but I avoided it because in most of the uses in the
> kernel currently there's no struct acpi_device, they're just passing
> ACPI_HANDLE(dev) instead, so I'd need to get the adev with
> ACPI_COMPANION() in each place. It didn't seem worth it...but happy to
> do it if you'd prefer it that way?

I see, let Rafael decide then. I'm not pushing here.

-- 
With Best Regards,
Andy Shevchenko
