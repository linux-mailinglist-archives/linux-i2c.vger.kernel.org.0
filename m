Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7B542C8B8
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 20:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbhJMSfn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 14:35:43 -0400
Received: from mail-oo1-f49.google.com ([209.85.161.49]:35754 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhJMSfa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 14:35:30 -0400
Received: by mail-oo1-f49.google.com with SMTP id s2-20020a4ac102000000b002b722c09046so1095850oop.2;
        Wed, 13 Oct 2021 11:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yO2lRzHz1XznOaQgSh56Qip33pmg0mdBpDv3MKgiWAw=;
        b=kTv4rI7KLwNElDct+Vm/0Y8pLnF39hru+m7UrkFgIqv8yCCpw0wpVsRqafGDlbq/SP
         9YrU4yX/FtfACqFZNyqr+ouPAwBMGZTYtxItrsQbtKcDJHbypIYpGFJzCNJ3DtYrxviG
         xruoiv+QgD6CPhZyqNiNAbofx6DjtGcbEzZoJ3TKVSx0GtauTFDJbuCcYDdoLTuhngO4
         mGZOXRYGM/b6cTUanIo9oeUOBqQvl43GIIXqzrBQYnlCboGKydnKUQOKxHHomWIQv5IO
         YTWZH+b13K8PuMCNjZ0NOQ2NAfuC5pyCJwMeSgPn8K7iq1FjCbh/ic3WkS0JHfhhcz/F
         eXwQ==
X-Gm-Message-State: AOAM530Sydtm62VLKRuJg/cEr51jSAHZxLtRiznK5JQ9QvJr6wImzlIK
        103b2y2lBdC1SBggRQKFJcT9rrldw+qLgKx50cY=
X-Google-Smtp-Source: ABdhPJxgIxFfg7dyINeTZVT41AYYgJtQWUmQamXrzTMvodXp6glxHyKBXcN4RB7zFn58WDKDC40G9VwcpfHxmscuqio=
X-Received: by 2002:a4a:a9ce:: with SMTP id h14mr533891oon.89.1634150005612;
 Wed, 13 Oct 2021 11:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211007171815.28336-1-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0h2=LZ8YX9MP6_dcyyybRQC6rii-r1Lc_Ss1XFFBUiSGQ@mail.gmail.com> <YWdOilxGqREXPBAm@smile.fi.intel.com>
In-Reply-To: <YWdOilxGqREXPBAm@smile.fi.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 13 Oct 2021 20:33:14 +0200
Message-ID: <CAJZ5v0gcmsMwB45k-+ca1G14zhtpChcdtB=dWMC1Wyj8j3WfFg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] driver core: Provide device_match_acpi_handle() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 13, 2021 at 8:24 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Oct 13, 2021 at 07:47:37PM +0200, Rafael J. Wysocki wrote:
> > On Thu, Oct 7, 2021 at 7:18 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > We have couple of users of this helper, make it available for them.
> >
> > "a couple"?
>
> Yep.
>
> > >  EXPORT_SYMBOL(device_match_acpi_dev);
> > >
> > > +int device_match_acpi_handle(struct device *dev, const void *handle)
> >
> > Hmmm.  Should the second arg be of type acpi_handle?
>
> acpi_handle is not defined as struct and it means the header, where the
> prototype is declared, will require acpi.h to be included. Besides that the
> whole set of device_match_*() is done by the same prototype, so it can be used
> in bus_find_device() calls.

Ah, OK, it's for bus_find_device().

> > And doesn't this function belong to the ACPI core?  It is related to
> > acpi_bus_get_device() and such which are located there.
>
> Same as above. I don't think so.

I see, but any chance to improve the changelog?
