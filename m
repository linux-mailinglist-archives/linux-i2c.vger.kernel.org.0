Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF241586C36
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Aug 2022 15:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbiHANrU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Aug 2022 09:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231920AbiHANrS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Aug 2022 09:47:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 609843C15E;
        Mon,  1 Aug 2022 06:47:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 165362F3;
        Mon,  1 Aug 2022 15:47:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659361634;
        bh=hakE9baT3VAUiu6XnLdOhuh12fgbguPKu1+hf+3jyJs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PfoX4lqLDhqf808avF1b13xtJErabYIuBiyOuEFr5V8OYPeSYXWAdKfzbMl3TXxek
         phZ1y+1hbwAuYRiTJWrWNU7AmLsUbnVypY+4l8fwur0SjuhpQevj5ZEAV6ncjY/ZuE
         Et2F6ZDqr5FqKUQm3gUBa6Oc1yHIEdITU7vUL934=
Date:   Mon, 1 Aug 2022 16:47:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Shawn Tu <shawnx.tu@intel.com>, Arec Kao <arec.kao@intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jimmy Su <jimmy.su@intel.com>,
        Martin Kepplinger <martink@posteo.de>,
        Daniel Scally <djrscally@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, rafael@kernel.org,
        linux-acpi@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        bingbu.cao@intel.com, andriy.shevchenko@intel.com,
        "hidenorik@chromium.org" <hidenorik@chromium.org>,
        jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH v2] media: ov5640: Use runtime PM
Message-ID: <YufZXoUSWzOqoVfZ@pendragon.ideasonboard.com>
References: <Yi3rQGmeXQD70Tkh@pendragon.ideasonboard.com>
 <Yi3z2nR8j+ee4E4m@paasikivi.fi.intel.com>
 <Yi38zOHsh68FrrKK@pendragon.ideasonboard.com>
 <Yi+e/IK+eVpKit/F@paasikivi.fi.intel.com>
 <Yi+gEVB0FuOcY5qn@pendragon.ideasonboard.com>
 <Yi+vdvMeXqb/BvKo@paasikivi.fi.intel.com>
 <YkMDfvuhAvsrjbON@pendragon.ideasonboard.com>
 <YlfplRQYDYhFvc5U@paasikivi.fi.intel.com>
 <CAAFQd5C7-OuNpnduwKpZXFUPQKDeqkz2xkvP+JBBs+aNjB87FQ@mail.gmail.com>
 <CAAFQd5Bgx2u6quaCobrKEFjMPqP1S-HihCo-XP0k_OhAEUDm-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5Bgx2u6quaCobrKEFjMPqP1S-HihCo-XP0k_OhAEUDm-g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 01, 2022 at 04:23:54PM +0900, Tomasz Figa wrote:
> [Fixed Jacopo's email address.]
> 
> On Mon, Aug 1, 2022 at 4:17 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > On Thu, Apr 14, 2022 at 6:30 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Laurent,
> > >
> > > On Tue, Mar 29, 2022 at 04:02:54PM +0300, Laurent Pinchart wrote:
> > > > Hi Sakari,
> > > >
> > > > On Mon, Mar 14, 2022 at 11:11:18PM +0200, Sakari Ailus wrote:
> > > > > On Mon, Mar 14, 2022 at 10:05:37PM +0200, Laurent Pinchart wrote:
> > > > > ...
> > > > > > > > Yes, after reading the version register (or doing any other harware
> > > > > > > > access). Actually the full code would be
> > > > > > > >
> > > > > > > >
> > > > > > > >       pm_runtime_enable(dev);
> > > > > > > >       pm_runtime_resume_and_get(dev);
> > > > > > > >
> > > > > > > >       /* Hardware access */
> > > > > > > >
> > > > > > > >       pm_runtime_set_autosuspend_delay(dev, 1000);
> > > > > > > >       pm_runtime_use_autosuspend(dev);
> > > > > > > >       pm_runtime_put_autosuspend(dev);
> > > > > > > >
> > > > > > > > (plus error handling).
> > > > > > > >
> > > > > > > > If the probe function doesn't need to access the hardware, then
> > > > > > > > the above becomes
> > > > > > > >
> > > > > > > >       pm_runtime_enable(dev);
> > > > > > > >       pm_runtime_set_autosuspend_delay(dev, 1000);
> > > > > > > >       pm_runtime_use_autosuspend(dev);
> > > > > > > >
> > > > > > > > instead of having to power up the device just in case !PM.
> > > > > > > >
> > > > > > > > > Also the latter only works on DT-based systems so it's not an option for
> > > > > > > > > most of the drivers.
> > > >
> > > > Does the former work on ACPI systems ?
> > >
> > > Yes (i.e. the one that was above the quoted text).
> > >
> > > >
> > > > > > > > How so, what's wrong with the above for ACPI-based system ?
> > > > > > >
> > > > > > > I涎 devices are already powered on for probe on ACPI based systems.
> > > > > >
> > > > > > Not through RPM I suppose ?
> > > > >
> > > > > Runtime PM isn't involved, this takes place in the ACPI framework (via
> > > > > dev_pm_domain_attach() called in i2c_device_probe()).
> > > >
> > > > How can we fix this ? It may have made sense a long time ago, but it's
> > > > making RPM handling way too difficult in I2C drivers now. We need
> > > > something better instead of continuing to rely on cargo-cult for probe
> > > > functions. Most drivers are broken.
> > >
> > > Some could be broken, there's no question of that. A lot of drivers support
> > > either ACPI or DT, too, so not _that_ many need to work with both. Albeit
> > > that number is probably increasing constantly for the same devices are used
> > > on both.
> > >
> > > Then there are drivers that prefer not powering on the device in probe (see
> > > <URL:https://lore.kernel.org/linux-acpi/20210210230800.30291-2-sakari.ailus@linux.intel.com/T/>),
> > > it gets complicated to support all the combinatios of DT/ACPI (with or
> > > without the flag / property for waiving powering device on for probe) and
> > > CONFIG_PM enabled/disabled.
> > >
> > > What I think could be done to add a flag for drivers that handle power on
> > > their own, or perhaps rather change how I2C_DRV_ACPI_WAIVE_D0_PROBE flag
> > > works. Right now it expects a property on the device but that check could
> > > be moved to existing drivers using the flag. Not many drivers are currently
> > > using the flag. I think this would simplify driver implementation as both
> > > firmware interfaces would work the same way in this respect.
> > >
> > > You'd have to change one driver at a time, and people should be encouraged
> > > to write new drivers with that flag. Or add the flag to all existing
> > > drivers and not accept new ones with it.
> > >
> > > These devices I think are all I涎 but my understanding is that such
> > > differences exist elsewhere in the kernel, too. If they are to be
> > > addressed, it would probably be best to have a unified approach towards it.
> > >
> > > Added a few more people and lists to cc.
> >
> > + Hidenori from my team for visibility.
> >
> > I think we may want to take a step back and first define the problem
> > itself. To do that, let's take a look separately at DT and ACPI cases
> > (is platform data still relevant? are there any other firmware
> > interfaces that deal with I2C devices?).
> > For simplicity, let's forget about the ACPI waived power on in probe.
> >
> > DT:
> >  1) hardware state unknown when probe is called
> >  2) claim any independently managed resources (e.g. GPIOs)
> >  3) enable runtime PM
> >  4) if driver wants to access the hardware:
> >     a) runtime PM get
> >     b) enable any independently controlled resources (e.g. reset GPIO)

A small precision here, the resource handling is usually done in the
runtime PM resume/suspend handlers.

> >     c) [do access]
> >     d) disable any independently controlled resources
> >     e) runtime PM put
> >  5) after probe returns, regulators, clocks (and other similarly
> >     managed resources) would be force disabled if their enable count is 0
> >  6) hardware state is off (after the runtime PM state settles)
> >
> > ACPI:
> >  1) hardware state is active when probe is called
> >  2) [n/a]
> >  3) tell runtime PM framework that the state is active and then enable
> >     runtime PM
> >  4) if driver wants to access the hardware:
> >     a) runtime PM get
> >     b) [n/a]
> >     c) [do access]
> >     d) [n/a]
> >     e) runtime PM put
> >  5) [n/a]
> >  6) hardware state is off (after the runtime PM state settles)
> >
> > It seems like the relevant difference here is that for ACPI, the
> > driver needs to know that the initial state is active and also relay
> > this knowledge to the runtime PM subsystem. If we could make the ACPI
> > PM domain work the same way as regulators and clocks and eventually
> > power off some time later when the enable count is 0, then perhaps we
> > could avoid the problem in the first place?

Two additional questions if we're brainstorming this:

- Why is the I2C device hardware state active when probe is called, and
  would there be a way to change that (that is, beside the obvious issue
  that the transition could be painful, are there any other reasons to
  keep the status quo) ?

- If we have to keep this difference between the ACPI and DT models, how
  can we handle them in core code instead of drivers ? In particular,
  how could code core inform the RPM framework about the initial device
  state instead of leaving it to the driver ?

There's large set of RPM-related calls that have to be performed at
probe time in a very specific order, interleaved with manual power
handling. That is way over the threshold of what can be reasonably
expected from driver developers. I don't care much how it's done, but
this has to be dumbed down to make it dead simple in drivers.

-- 
Regards,

Laurent Pinchart
