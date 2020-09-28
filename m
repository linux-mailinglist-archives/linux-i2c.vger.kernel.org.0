Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7A927AFDD
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Sep 2020 16:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgI1OSC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Sep 2020 10:18:02 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38329 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgI1OSB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Sep 2020 10:18:01 -0400
Received: by mail-ot1-f67.google.com with SMTP id y5so1053038otg.5;
        Mon, 28 Sep 2020 07:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n0SDEJiGHKBMiTQJpDhH++PpVZUE8wCtPQdFHZ2pW3Y=;
        b=Ka81PzCmBX2fVD7A+82y+0iF4vTzQeEq6t3TycROq/IlHxeD8GqaExZb623uDgA+jT
         hR9cVsF7rwuJ64i+FfEXMir+MPJKRPuAi/5CNBeAAlPkNJ7sDggQZVzIbOhPX8TNNGyo
         rAZ416tqqAk80v5ZlrYcEqiAPWs8/OHJMNOg/3mPiXv5xkXhssoHCfTXJC6gVoaVRWGb
         GnDkXsKwru3004DtcKQ7kWHDl87z1o68OOMXVW4TnXtaUYb77nxrg7KKUYkKrPDduY6V
         vRjmpkWEH8t0UewNlILHHkeMshqZsBO95L+7BL9JrK+AOdW73Hlr05E0nDiXoxZk+Dc2
         eBZw==
X-Gm-Message-State: AOAM532dP78vhbbdYRz1U/4mxx4wugI1Y/9ugc4RmtVcUn3QhdFC/EGj
        HJjdA1lC3NDfIntJtqlYI6yT9+TkZaRunl0kEPQ=
X-Google-Smtp-Source: ABdhPJz6eV4I4wC0CrXWH8jkFLr1VayvxIEzXRxTuz0YVtl3qOlZAg+2X0ohUMDuRUAmdp8Am59xUkdBoyfLCAAEtBM=
X-Received: by 2002:a05:6830:1f16:: with SMTP id u22mr1078670otg.118.1601302680861;
 Mon, 28 Sep 2020 07:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
 <f4b82baa-66b7-464e-fd39-66d2243a05ef@lucaceresoli.net> <20200911130104.GF26842@paasikivi.fi.intel.com>
 <6dea1206-cfaa-bfc5-d57e-4dcddadc03c7@lucaceresoli.net> <20200914094727.GM26842@paasikivi.fi.intel.com>
 <20200926123807.GA3781977@chromium.org> <20200927193900.GA30711@kunai> <CAAFQd5Be5sUQYtXapcSOu8CVffW2LuLog9qh71-+mxze9WYUVQ@mail.gmail.com>
In-Reply-To: <CAAFQd5Be5sUQYtXapcSOu8CVffW2LuLog9qh71-+mxze9WYUVQ@mail.gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 28 Sep 2020 16:17:44 +0200
Message-ID: <CAJZ5v0hKQNv+qj-7EQ2Dmtk=UamtVKHBXDCjqo-48Qj13yY+cw@mail.gmail.com>
Subject: Re: [PATCH v8 0/6] Support running driver's probe for a device
 powered off
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
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

On Sun, Sep 27, 2020 at 9:44 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Sun, Sep 27, 2020 at 9:39 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> >
> >
> > > I think we might be overly complicating things. IMHO the series as is
> > > with the "i2c_" prefix removed from the flags introduced would be
> > > reusable as is for any other subsystem that needs it. Of course, for
> > > now, the handling of the flag would remain implemented only in the I2C
> > > subsystem.
> >
> > Just to be clear: you are suggesting to remove "i2c" from the DSD
> > binding "i2c-allow-low-power-probe". And you are not talking about
> > moving I2C_DRV_FL_ALLOW_LOW_POWER_PROBE to struct device_driver? I
> > recall the latter has been NACKed by gkh so far.
> >
>
> I'd also drop "I2C_" from "I2C_DRV_FL_ALLOW_LOW_POWER_PROBE", but all
> the implementation would remain where it is in the code. IOW, I'm just
> suggesting a naming change to avoid proliferating duplicate flags of
> the same meaning across subsystems.

But that would indicate that the property was recognized by other
subsystems which wouldn't be the case, so it would be confusing.

That's why it cannot be documented as a general property ATM too.
