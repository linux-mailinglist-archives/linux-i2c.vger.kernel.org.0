Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30ED3323A5B
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Feb 2021 11:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234379AbhBXKTl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Feb 2021 05:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbhBXKTk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Feb 2021 05:19:40 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F96C061574;
        Wed, 24 Feb 2021 02:19:00 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id z7so915721plk.7;
        Wed, 24 Feb 2021 02:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CyAgtAxbZSz5TjO0QrS9a/JZ7lSqpNFqKx9CvuOfolU=;
        b=SFyeNZOjWwj5VNwoK2BpNeiF1wvIOVGKHoHFTqBEdqJtQLQjQ9cFI60KEU1Vup1uss
         H0CEQFBZM5llOd5BqAiaC6gFPsTAqlryXZr7iEg64o6g3fLkujAwr+84ebWT7a/ji3zK
         nXwiAvPAyabuqt3Lgn3NxW2gEYjt029mJ9iDBcRjg0hUANkv7hX7O/eocB/r2QdbAv34
         PjfLude/s3EsmrhipPVpkTy6VNHKrFInp/Xyxj6QjoQW3wTo/YeTm4RVMsToNyXjvafQ
         bn4LzRpBinDvH6EUJFfAn/BUUvU4c2tBly49mhmwuO3tMojMWi8TKWZSfv4Xe0velXiT
         zJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CyAgtAxbZSz5TjO0QrS9a/JZ7lSqpNFqKx9CvuOfolU=;
        b=Reg8GJ5hpLjTT/XhEg0kjfFKp3X8BYRLp7R9Kl8XZNhNu1xys/eOCkguM+2Ypnptwo
         DpwOz0MBDVvzGOClD+9/7JWRWNGK4N1P8ULfy07mWctDqP0pcm1+b72kfF6tVU0Gb2x0
         6WXWnv2mhcmz6pnU5LFGz6dZpADjxNdaWQj3RdlHrzJcb6IZi9EqNPQoOuDMR6fcq59u
         nMcGBnwVe+jKe0eNSK7szzKecpCs0e7+d+D5uDUbaDYvSto9EKHNNVQ0NBVRLjAPAK7W
         gH2Fv4sie025bu27PqxZMv6Nh1i+WuilU4UyqXb7kQ55HgznoRRfrZrDOmabKkQzBBPQ
         bKKA==
X-Gm-Message-State: AOAM531ZStRvn86H02oYgSDfDQnOzxIRnLZwr9WTNmdcTRRyfFR2zXTE
        XcpKzF0ElcjG7KyegDXUc1FxxP6PIIJzbK4IOso=
X-Google-Smtp-Source: ABdhPJxHizC3BBBdDOL7UeQDEUrN0E/2BsdHrlRZd2QwjG+jELlRm5NW5VFWG+FR8i3DVcYUauiJeyQPDcSTp4saJi8=
X-Received: by 2002:a17:90a:4fc1:: with SMTP id q59mr3929876pjh.129.1614161939621;
 Wed, 24 Feb 2021 02:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20210222130735.1313443-1-djrscally@gmail.com> <20210222130735.1313443-6-djrscally@gmail.com>
 <YDVfyt2d2Nhsa7l3@pendragon.ideasonboard.com> <1360fc85-3f39-1dce-eee9-c4e76c2087ae@gmail.com>
 <YDYmv0PpSndAlnDC@pendragon.ideasonboard.com>
In-Reply-To: <YDYmv0PpSndAlnDC@pendragon.ideasonboard.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 24 Feb 2021 12:18:43 +0200
Message-ID: <CAHp75VcKUjnwh4fi-mofooBuBYiqXjXOspU4twKg6-Lfvzf=QA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] platform/x86: Add intel_skl_int3472 driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
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
        andy.shevchenko@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com,
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
        devel@acpica.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 24, 2021 at 12:16 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Feb 23, 2021 at 10:36:18PM +0000, Daniel Scally wrote:
> > On 23/02/2021 20:04, Laurent Pinchart wrote:

...

> > >> +  get_device(&int3472->sensor->dev);
> > >
> > > I see no corresponding put_device(), am I missing something ? I'm also
> > > not sure why this is needed.
> >
> > The put is acpi_dev_put() in skl_int3472_discrete_remove(); there seems
> > to be no acpi_dev_get() for some reason. We use the sensor acpi_device
> > to get the clock frequency, and to fetch the sensor module string, so I
> > thought it ought to hold a reference on those grounds.
>
> Shouldn't acpi_dev_get_dependent_dev() increase the reference count
> then, instead of doing it manually here ?

That's what I expected as well.
We have plenty of acpi_dev_get_*() and they do increase the reference
counter one way or the other.

-- 
With Best Regards,
Andy Shevchenko
