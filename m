Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 190C3144294
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2020 17:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbgAUQ4v convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 21 Jan 2020 11:56:51 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44113 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbgAUQ4v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jan 2020 11:56:51 -0500
Received: by mail-oi1-f193.google.com with SMTP id d62so3179433oia.11;
        Tue, 21 Jan 2020 08:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=L48dqKCWqUM40uiIIvW7gNnbpv7oxB/Hh4H4mqqlPcE=;
        b=W8dAF/1C7IWuwNsJrxxbXrJ1eHsVyu5teK4sqN7LgP1WVbuX+i8P3ESJoBh8q6CYAa
         kW3qDjB+HszxVthFlfIqjs8gJeAYBet4Yb2PGSDJ5hV9EV0BRvnSE8jOuDPaJ9vlO+ef
         3fbZRsN+DTZhrIHO9+Be6jsZ1tMZJ9Zhm+snbEXfEFYbq68tpKIbN/I2QWEH+nGGX7RF
         OK9txUVV9fuu7wsGyZHxkoanEYx3RVbdgoarpbHm3XuvTlx8fuCD4TrnGdwmpHnIvNEX
         KaVVcLPraHvjeE/uo3CLgH4uDOBqvh9Pz0KrlMUW9KvcegHAFnbD/BkSOnkzBy7ZzGtj
         /Qyw==
X-Gm-Message-State: APjAAAVPgmZUiZZqc08+/iHKkhKpoSeVIF2mcrDYYgCkEbr8itStG8Cm
        7DbMP5/30S+sD8pUmrX9Gu+RfUsTiT7wumssEp0CpA==
X-Google-Smtp-Source: APXvYqyPmBDzNEz7+Zh6YxhQJWlleEoCehXnih04KMLq9z2SKftc/FZQrx4589Dqi/vJU/ZbqAYZSamTVF6BS4uWuAM=
X-Received: by 2002:a05:6808:1c5:: with SMTP id x5mr3750017oic.57.1579625810328;
 Tue, 21 Jan 2020 08:56:50 -0800 (PST)
MIME-Version: 1.0
References: <20200121134157.20396-1-sakari.ailus@linux.intel.com>
 <20200121134157.20396-7-sakari.ailus@linux.intel.com> <CAJZ5v0iJXUjK0n7mkqxagX9FtOmMsLqVMmU2xpQOLSb0aBWSMA@mail.gmail.com>
 <20200121161856.GZ5440@paasikivi.fi.intel.com>
In-Reply-To: <20200121161856.GZ5440@paasikivi.fi.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 21 Jan 2020 17:56:39 +0100
Message-ID: <CAJZ5v0ho8ry7iTXBTxHMjwcqT+EGT2mRy2rmp+o7rmG0apYimQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] Documentation: ACPI: Document probe-low-power _DSD property
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 21, 2020 at 5:19 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Tue, Jan 21, 2020 at 05:09:44PM +0100, Rafael J. Wysocki wrote:
> > On Tue, Jan 21, 2020 at 2:41 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Document the probe-low-power _DSD property and how it is used with I²C
> > > drivers.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../acpi/dsd/probe-low-power.rst              | 28 +++++++++++++++++++
> > >  Documentation/firmware-guide/acpi/index.rst   |  1 +
> > >  2 files changed, 29 insertions(+)
> > >  create mode 100644 Documentation/firmware-guide/acpi/dsd/probe-low-power.rst
> > >
> > > diff --git a/Documentation/firmware-guide/acpi/dsd/probe-low-power.rst b/Documentation/firmware-guide/acpi/dsd/probe-low-power.rst
> > > new file mode 100644
> > > index 0000000000000..e0343ffefe071
> > > --- /dev/null
> > > +++ b/Documentation/firmware-guide/acpi/dsd/probe-low-power.rst
> > > @@ -0,0 +1,28 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +======================================
> > > +Probing I²C devices in low power state
> > > +======================================
> > > +
> > > +Introduction
> > > +============
> > > +
> > > +In some cases it may be preferred to leave certain devices powered off for
> > > +the entire system bootup if powering on these devices has adverse side
> > > +effects, beyond just powering on the said device. The _DSD property
> > > +"probe-low-power" has been defined for this purpose.
> >
> > Well, if you say "has been defined", you need to provide a pointer to
> > the definition document (a specification of some sort or similar).
>
> How about:
>
> s/has been defined/is used/

I would say "Linux recognizes the ... that can be used for this purpose."
