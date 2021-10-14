Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEE042D563
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Oct 2021 10:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhJNIuV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Oct 2021 04:50:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:44954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229551AbhJNIuU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Oct 2021 04:50:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F12636101E;
        Thu, 14 Oct 2021 08:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634201296;
        bh=GqPIsa1r+FpZHXvu2y7bSJcct4I9M3uZm3XKR3JDIAw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WAF7eTmHH4gCeJg5DvJpyP0F2QjL/MDwjnMDRGxLE92+Rn6cBeZe10dBMKVB0xmn1
         nUDOCpjAuNyJzEtAPOc8FERqaNQ+vbrCHkCOOg92iuwbHTk7F5X+P0gw5AkcdI6nRp
         57+QDe23QoN+DXz2YdBW4ErHlhVUVN3TcpVM89F4=
Date:   Thu, 14 Oct 2021 10:48:14 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Saravana Kannan <saravanak@google.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v3 1/3] driver core: Provide device_match_acpi_handle()
 helper
Message-ID: <YWfuzq0aVAI9r9hW@kroah.com>
References: <20211007171815.28336-1-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0h2=LZ8YX9MP6_dcyyybRQC6rii-r1Lc_Ss1XFFBUiSGQ@mail.gmail.com>
 <YWdOilxGqREXPBAm@smile.fi.intel.com>
 <CAJZ5v0gcmsMwB45k-+ca1G14zhtpChcdtB=dWMC1Wyj8j3WfFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0gcmsMwB45k-+ca1G14zhtpChcdtB=dWMC1Wyj8j3WfFg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 13, 2021 at 08:33:14PM +0200, Rafael J. Wysocki wrote:
> On Wed, Oct 13, 2021 at 8:24 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Wed, Oct 13, 2021 at 07:47:37PM +0200, Rafael J. Wysocki wrote:
> > > On Thu, Oct 7, 2021 at 7:18 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > We have couple of users of this helper, make it available for them.
> > >
> > > "a couple"?
> >
> > Yep.
> >
> > > >  EXPORT_SYMBOL(device_match_acpi_dev);
> > > >
> > > > +int device_match_acpi_handle(struct device *dev, const void *handle)
> > >
> > > Hmmm.  Should the second arg be of type acpi_handle?
> >
> > acpi_handle is not defined as struct and it means the header, where the
> > prototype is declared, will require acpi.h to be included. Besides that the
> > whole set of device_match_*() is done by the same prototype, so it can be used
> > in bus_find_device() calls.
> 
> Ah, OK, it's for bus_find_device().
> 
> > > And doesn't this function belong to the ACPI core?  It is related to
> > > acpi_bus_get_device() and such which are located there.
> >
> > Same as above. I don't think so.
> 
> I see, but any chance to improve the changelog?

I will drop this from my testing tree and wait for a new version with a
better changelog.

thanks,

greg k-h
