Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 416DB27B289
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Sep 2020 18:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgI1Qto (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Sep 2020 12:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgI1Qto (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Sep 2020 12:49:44 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C15C061755
        for <linux-i2c@vger.kernel.org>; Mon, 28 Sep 2020 09:49:43 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id w1so2131119edr.3
        for <linux-i2c@vger.kernel.org>; Mon, 28 Sep 2020 09:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OjaO7kUDshEkXyX/sIanQwh9RsbMzawXkJFVu2Elacw=;
        b=BOQKe+ZZ13ve03VzZj6TWYxlDnAhDhd6J4X/++n58Bn9kjGDh4BkGap7yChnaVQsFA
         slKF5YRlSNSPx6F3iB4RICABtFrb/de4KEsnT4e1yDwXMOCtD/Tq4UN8tBXACn0pziet
         ovkON6pPO40sy1O5XKRrymtshV1Lm12f3u4m0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OjaO7kUDshEkXyX/sIanQwh9RsbMzawXkJFVu2Elacw=;
        b=CmNcSbmOXbJ+Lu5+BLq0rmhQf1cMJZ+z24GI+UM1tKCKRHGc1iGgXfbaPJc/b1rk9d
         8Nw2/usvTECpuC7Ebskt4VXCvxKDxPJJhHrwS7GYGGUTbBv08ZwFJzVp96z1/IMenTWa
         +tRyc4qmn2LKYbskuReA+2Vi1Tsm4xWjKaw/ix4VwUrkYVbuirC8mxge+nMpWRdOmXV9
         6+qYhhjs54lZ7d20eFwkiKQ8v266kUAOQ33qq5GkHKiUTCE+idaPk9k4V8XSzwAt5leX
         PWWcbJvvYppb2PR6BnOnXVffQ6RqLEWbIuq0zRASNQjtCofU6v9f5Hb801FzOwwApB1S
         HKYQ==
X-Gm-Message-State: AOAM533aUIYZn3kHDaQi6A13IstqQfrP2OWQs74KSuYzWThSSBBtz5eJ
        08lsDDAlOYEJEcP8aBClVKqGphAVx2SADA==
X-Google-Smtp-Source: ABdhPJx85OnVZESnIRrKmznIaPK8URUQ2XDaNmxbxo0ayy6hrR18zOHPvuj26slUT8TljOHvN1bm+Q==
X-Received: by 2002:a50:a693:: with SMTP id e19mr2715010edc.205.1601311782078;
        Mon, 28 Sep 2020 09:49:42 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id p5sm1722102ejd.56.2020.09.28.09.49.40
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2020 09:49:41 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id t10so2148516wrv.1
        for <linux-i2c@vger.kernel.org>; Mon, 28 Sep 2020 09:49:40 -0700 (PDT)
X-Received: by 2002:a5d:660f:: with SMTP id n15mr2859213wru.103.1601311780342;
 Mon, 28 Sep 2020 09:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
 <f4b82baa-66b7-464e-fd39-66d2243a05ef@lucaceresoli.net> <20200911130104.GF26842@paasikivi.fi.intel.com>
 <6dea1206-cfaa-bfc5-d57e-4dcddadc03c7@lucaceresoli.net> <20200914094727.GM26842@paasikivi.fi.intel.com>
 <20200926123807.GA3781977@chromium.org> <20200927193900.GA30711@kunai>
 <CAAFQd5Be5sUQYtXapcSOu8CVffW2LuLog9qh71-+mxze9WYUVQ@mail.gmail.com> <CAJZ5v0hKQNv+qj-7EQ2Dmtk=UamtVKHBXDCjqo-48Qj13yY+cw@mail.gmail.com>
In-Reply-To: <CAJZ5v0hKQNv+qj-7EQ2Dmtk=UamtVKHBXDCjqo-48Qj13yY+cw@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 28 Sep 2020 18:49:22 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CP7bg+UQEp5uzuQY5a_xHLAB4ct81pkO0naAou=-QyKw@mail.gmail.com>
Message-ID: <CAAFQd5CP7bg+UQEp5uzuQY5a_xHLAB4ct81pkO0naAou=-QyKw@mail.gmail.com>
Subject: Re: [PATCH v8 0/6] Support running driver's probe for a device
 powered off
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 28, 2020 at 4:18 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Sun, Sep 27, 2020 at 9:44 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > On Sun, Sep 27, 2020 at 9:39 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > >
> > >
> > > > I think we might be overly complicating things. IMHO the series as is
> > > > with the "i2c_" prefix removed from the flags introduced would be
> > > > reusable as is for any other subsystem that needs it. Of course, for
> > > > now, the handling of the flag would remain implemented only in the I2C
> > > > subsystem.
> > >
> > > Just to be clear: you are suggesting to remove "i2c" from the DSD
> > > binding "i2c-allow-low-power-probe". And you are not talking about
> > > moving I2C_DRV_FL_ALLOW_LOW_POWER_PROBE to struct device_driver? I
> > > recall the latter has been NACKed by gkh so far.
> > >
> >
> > I'd also drop "I2C_" from "I2C_DRV_FL_ALLOW_LOW_POWER_PROBE", but all
> > the implementation would remain where it is in the code. IOW, I'm just
> > suggesting a naming change to avoid proliferating duplicate flags of
> > the same meaning across subsystems.
>
> But that would indicate that the property was recognized by other
> subsystems which wouldn't be the case, so it would be confusing.
>
> That's why it cannot be documented as a general property ATM too.

I guess that's true. Well, this is kAPI in the end, so if we have more
subsystems, it could be always renamed. So feel free to ignore my
previous comment.

Best regards,
Tomasz
