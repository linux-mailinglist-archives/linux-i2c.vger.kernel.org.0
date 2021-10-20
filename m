Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38781435177
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Oct 2021 19:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbhJTRk3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Oct 2021 13:40:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:42242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230391AbhJTRk3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Oct 2021 13:40:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DBE64611C7;
        Wed, 20 Oct 2021 17:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634751494;
        bh=dlqZhTZMgkAacw0yTZYPf/PbPQrZV7HqKQMSqGYnVSI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nM8XnvUBCqd6vi/qIshaunTN6gwJvcSzmA4m5WmzUAS+TyVArbJXk3YR6pG5ba6p8
         ec+k3aedURjgoz9gEQooSdj2oOX09N7pxPJ69g2nUjrYgjFsL6wZtdgOgm+fBh+lSE
         1XaVv53jsE4EDAJMsREZAklfTDlOAZHewmQ2wcj8=
Date:   Wed, 20 Oct 2021 19:38:12 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
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
Subject: Re: [PATCH v4 1/3] driver core: Provide device_match_acpi_handle()
 helper
Message-ID: <YXBUBGcb+kLvj7mj@kroah.com>
References: <20211014134756.39092-1-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0jqXqhV1FSyuoVwbgwhte7Q4KUQMozggcxCHGPf+Mfw=A@mail.gmail.com>
 <YW6ziqiIgioxDjq3@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YW6ziqiIgioxDjq3@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 19, 2021 at 03:01:14PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 15, 2021 at 01:42:37PM +0200, Rafael J. Wysocki wrote:
> > On Thu, Oct 14, 2021 at 3:48 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > We have a couple of users of this helper, make it available for them.
> > >
> > > The prototype for the helper is specifically crafted in order to be
> > > easily used with bus_find_device() call. That's why its location is
> > > in the driver core rather than ACPI.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > OK, please feel free to add
> > 
> > Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > 
> > to all of the patches in this series.
> 
> Thank you, Rafael!
> 
> Greg, can it be applied now?

Yes, will go do so now, thanks.

greg k-h
