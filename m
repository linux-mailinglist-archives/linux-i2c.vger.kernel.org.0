Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 700BA2417C3
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Aug 2020 10:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728145AbgHKIAo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Aug 2020 04:00:44 -0400
Received: from retiisi.org.uk ([95.216.213.190]:45760 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726397AbgHKIAn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Aug 2020 04:00:43 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 256DC634C87;
        Tue, 11 Aug 2020 11:00:10 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1k5PCb-0001ID-Uo; Tue, 11 Aug 2020 11:00:09 +0300
Date:   Tue, 11 Aug 2020 11:00:09 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, linux-acpi@vger.kernel.org,
        Bingbu Cao <bingbu.cao@intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v4 5/6] at24: Support probing while off
Message-ID: <20200811080009.GE840@valkosipuli.retiisi.org.uk>
References: <20200121134157.20396-1-sakari.ailus@linux.intel.com>
 <20200121134157.20396-6-sakari.ailus@linux.intel.com>
 <CAMpxmJU5dG49N2FA0oSQsOfKrCr3KQ1BisON4c+nUJJmZQG=bQ@mail.gmail.com>
 <20200311085555.GH5379@paasikivi.fi.intel.com>
 <CAMpxmJVPTKW+sYSJ3dnfF8nLAOKEa4Ob7bpxG0KD3Tkdm+rtYw@mail.gmail.com>
 <20200323213101.GB21174@kekkonen.localdomain>
 <CAMpxmJVdyTkZMVuhSy0Ux8VUYTmQN_YEfH-akQsAL3zrwiz8Dw@mail.gmail.com>
 <20200810082549.GD840@valkosipuli.retiisi.org.uk>
 <CAMpxmJUKSR-oCGnV1E5XiAMA2nYBy5f_f8=VSoMn0zf+qF39vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJUKSR-oCGnV1E5XiAMA2nYBy5f_f8=VSoMn0zf+qF39vg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bartosz,

On Mon, Aug 10, 2020 at 08:12:00PM +0200, Bartosz Golaszewski wrote:
> On Mon, Aug 10, 2020 at 10:26 AM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >
> 
> [snip]
> 
> > >
> > > Rafael: I think that there are two issues with patch 1/5:
> > > 1. It adds a very specific boolean flag to a structure that's meant to
> > > be very general. As I pointed out in the i2c patch: at the very least
> > > this could be made into an int storing flag values, instead of a
> > > boolean field. But rather than that - it looks to me more like a
> > > device (or bus) feature than a driver feature. Is there any ACPI flag
> > > we could use to pass this information to the driver model without
> > > changing the driver structure?
> >
> > To my knowledge there isn't. The fact that I²C devices are powered on for
> > probe in ACPI based systems is specific to Linux kernel and not ACPI as
> > such.
> >
> > The reason this needs to be in a generic struct is that the device's power
> > state will be changed before any interaction with the driver takes place as
> > it's the I²C framework that powers on the device.
> >
> 
> I'm not sure I'm following. Looking at patch 1/6 struct device already
> exists so why can't this information be conveyed "per device" as
> opposed to "per driver"?

It's both driver and device.

Suppose there's no indication of driver support. If you add the property
telling the device shouldn't be powered on for probe, it won't be. And if
the driver doesn't support that, probe will fail. That could happen e.g.
when running an older kernel on a system that happens to specify this
property for a given device.

You could view this as a driver bug of course. I still think it's better to
make driver support for this explicit, and avoid making this a practical
problem anywhere.

-- 
Kind regards,

Sakari Ailus
