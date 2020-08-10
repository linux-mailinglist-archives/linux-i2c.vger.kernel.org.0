Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CACED24035D
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Aug 2020 10:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgHJI0W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Aug 2020 04:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgHJI0V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Aug 2020 04:26:21 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23072C061756;
        Mon, 10 Aug 2020 01:26:21 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id EEE2F634C87;
        Mon, 10 Aug 2020 11:25:49 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1k537t-0001CF-PM; Mon, 10 Aug 2020 11:25:49 +0300
Date:   Mon, 10 Aug 2020 11:25:49 +0300
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
Message-ID: <20200810082549.GD840@valkosipuli.retiisi.org.uk>
References: <20200121134157.20396-1-sakari.ailus@linux.intel.com>
 <20200121134157.20396-6-sakari.ailus@linux.intel.com>
 <CAMpxmJU5dG49N2FA0oSQsOfKrCr3KQ1BisON4c+nUJJmZQG=bQ@mail.gmail.com>
 <20200311085555.GH5379@paasikivi.fi.intel.com>
 <CAMpxmJVPTKW+sYSJ3dnfF8nLAOKEa4Ob7bpxG0KD3Tkdm+rtYw@mail.gmail.com>
 <20200323213101.GB21174@kekkonen.localdomain>
 <CAMpxmJVdyTkZMVuhSy0Ux8VUYTmQN_YEfH-akQsAL3zrwiz8Dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJVdyTkZMVuhSy0Ux8VUYTmQN_YEfH-akQsAL3zrwiz8Dw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bartosz,

Apologies for the late reply --- I was expecting more discussion which
never happened...

On Wed, Mar 25, 2020 at 02:48:47PM +0100, Bartosz Golaszewski wrote:
> pon., 23 mar 2020 o 22:31 Sakari Ailus <sakari.ailus@linux.intel.com>
> napisał(a):
> >
> > Bartosz,
> >
> > On Thu, Mar 12, 2020 at 02:10:32PM +0100, Bartosz Golaszewski wrote:
> > > śr., 11 mar 2020 o 09:56 Sakari Ailus <sakari.ailus@linux.intel.com> napisał(a):
> > > >
> > > > Hi Bartosz,
> > > >
> > > > Thanks for the reply.
> > > >
> > > > On Wed, Jan 29, 2020 at 02:36:17PM +0100, Bartosz Golaszewski wrote:
> > > > > wt., 21 sty 2020 o 14:41 Sakari Ailus <sakari.ailus@linux.intel.com> napisał(a):
> > > > > >
> > > > > > In certain use cases (where the chip is part of a camera module, and the
> > > > > > camera module is wired together with a camera privacy LED), powering on
> > > > > > the device during probe is undesirable. Add support for the at24 to
> > > > > > execute probe while being powered off. For this to happen, a hint in form
> > > > > > of a device property is required from the firmware.
> > > > > >
> > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > ---
> > > > > >  drivers/misc/eeprom/at24.c | 31 +++++++++++++++++++++----------
> > >
> > > [snip!]
> > >
> > > > > >
> > > > > >  static int at24_remove(struct i2c_client *client)
> > > > > >  {
> > > > > > +       bool low_power;
> > > > > > +
> > > > > >         pm_runtime_disable(&client->dev);
> > > > > > -       pm_runtime_set_suspended(&client->dev);
> > > > > > +       low_power = acpi_dev_state_low_power(&client->dev);
> > > > >
> > > > > This is inconsistent. You define the low_power field in the context
> > > > > structure (BTW the name low_power is a bit vague here - without
> > > > > looking at its assignment it would make me think it's about something
> > > > > battery-related, how about 'off_at_probe'?) and instead of reusing
> > > >
> > > > The field was called probe_powered_off in v1, but I changed it to
> > > > probe_low_power (and renamed related functions etc.) based on review
> > > > comments --- for the device may not be powered off actually.
> > > >
> > >
> > > But is it actually ever low-power? What are the possible logical
> > > states of the device? If I understood correctly: it's either off or on
> > > at probe - not actually low-power. Am I missing something? In your
> > > cover letter you're writing: "These patches enable calling (and
> > > finishing) a driver's probe function without powering on the
> > > respective device on busses where the practice is to power on the
> > > device for probe." To me there's no mention of a low-power state,
> > > which makes the name 'probe_low_power' seem completely unrelated.
> >
> > See <URL:https://patchwork.kernel.org/patch/10938483/>
> >
> > I've updated the patches according to the comments but did not update the
> > cover page accordingly.
> >
> 
> I see.
> 
> Rafael: I think that there are two issues with patch 1/5:
> 1. It adds a very specific boolean flag to a structure that's meant to
> be very general. As I pointed out in the i2c patch: at the very least
> this could be made into an int storing flag values, instead of a
> boolean field. But rather than that - it looks to me more like a
> device (or bus) feature than a driver feature. Is there any ACPI flag
> we could use to pass this information to the driver model without
> changing the driver structure?

To my knowledge there isn't. The fact that I²C devices are powered on for
probe in ACPI based systems is specific to Linux kernel and not ACPI as
such.

The reason this needs to be in a generic struct is that the device's power
state will be changed before any interaction with the driver takes place as
it's the I²C framework that powers on the device.

The firmware hint is there in order to make sure as this is intended, as
this could have unwanted effects if it were just up to driver support.
Think of the at24 driver, for instance: we probably want probe to fail if
the device isn't accessible in most cases.

> 2. The name is still misleading: probe_low_power doesn't correspond
> with what it actually does at all (neither did power_off). I'd go with
> something like probe_allow_low_power.

I agree. I'll rename the property accrodingly as well, for that's what it
really suggests.

-- 
Sakari Ailus
