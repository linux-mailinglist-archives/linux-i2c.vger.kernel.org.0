Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 293F5587281
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Aug 2022 22:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234525AbiHAUwx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Aug 2022 16:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234079AbiHAUwx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Aug 2022 16:52:53 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B700032EF5;
        Mon,  1 Aug 2022 13:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659387170; x=1690923170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Q080o7ke6jEv77NTqadDBXECQjH5oskETOi0vYy1iSs=;
  b=dZadDSboDlW5DKttx+jp3amN4H+pf02JdSpOMMyFMn6WNTa7LoA1hCsn
   jMUs8xXIlmFfUcmqUZFJKxj+RenwfQY/l8DB0Mc2ZJs7UhPOBGchLvHzY
   isj3PSASUh75J92oVaKFszBfXoVwrzLtsmvvxzr5GNhdoj/OITXb89MmE
   nIEs0TlTKSI7yN4UskjSfVWHD3ykPknBkXOFLIuBx9c79YXDooktxp2KP
   N0mAKiYcl6QnsMB4Ym1RbjZPZBwB1vPnjK4PZuBh9ZCtZVsAUh7tBTG2X
   4j4rqn0prbaJIfAcxIhOXCCmE5HNkPr3O4cR/0viGI+UoY4wco4G9iSpD
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="286807599"
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; 
   d="scan'208";a="286807599"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 13:39:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; 
   d="scan'208";a="577925699"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 13:39:33 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id EDF28203B7;
        Mon,  1 Aug 2022 23:39:30 +0300 (EEST)
Date:   Mon, 1 Aug 2022 20:39:30 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <Yug6Apa23KghjCVW@paasikivi.fi.intel.com>
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
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomasz,

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
> >     c) [do access]
> >     d) disable any independently controlled resources
> >     e) runtime PM put
> >  5) after probe returns, regulators, clocks (and other similarly
> > managed resources) would be force disabled if their enable count is 0
> >  6) hardware state is off (after the runtime PM state settles)
> >
> > ACPI:
> >  1) hardware state is active when probe is called

This isn't a property of ACPI as such, but rather what I²C core does
to ACPI devices before calling probe (or after remove).

> >  2) [n/a]
> >  3) tell runtime PM framework that the state is active and then enable
> > runtime PM
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

-- 
Regards,

Sakari Ailus
