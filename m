Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFD5190060
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Mar 2020 22:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgCWVbI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Mar 2020 17:31:08 -0400
Received: from mga17.intel.com ([192.55.52.151]:16683 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbgCWVbH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Mar 2020 17:31:07 -0400
IronPort-SDR: HO/Hh6XJvTBIT1a23McPVVzi0ni02XNpr24eTelDMwERX+srJYKj/2On1QyYjT6rJVr2aXFB6o
 2Yykugfobqmw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2020 14:31:07 -0700
IronPort-SDR: lAG7dNz3KM5h9x18gwyGFVd7TNjjxASEgoY84yygSdCCD4Gr62lG4hY4KmCkK1oFXhMCLdDWPc
 /6DH0HNA8exA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,297,1580803200"; 
   d="scan'208";a="445961116"
Received: from unknown (HELO kekkonen.fi.intel.com) ([10.249.35.222])
  by fmsmga005.fm.intel.com with ESMTP; 23 Mar 2020 14:31:03 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 98D1D21EF2; Mon, 23 Mar 2020 23:31:01 +0200 (EET)
Date:   Mon, 23 Mar 2020 23:31:01 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v4 5/6] at24: Support probing while off
Message-ID: <20200323213101.GB21174@kekkonen.localdomain>
References: <20200121134157.20396-1-sakari.ailus@linux.intel.com>
 <20200121134157.20396-6-sakari.ailus@linux.intel.com>
 <CAMpxmJU5dG49N2FA0oSQsOfKrCr3KQ1BisON4c+nUJJmZQG=bQ@mail.gmail.com>
 <20200311085555.GH5379@paasikivi.fi.intel.com>
 <CAMpxmJVPTKW+sYSJ3dnfF8nLAOKEa4Ob7bpxG0KD3Tkdm+rtYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJVPTKW+sYSJ3dnfF8nLAOKEa4Ob7bpxG0KD3Tkdm+rtYw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Bartosz,

On Thu, Mar 12, 2020 at 02:10:32PM +0100, Bartosz Golaszewski wrote:
> śr., 11 mar 2020 o 09:56 Sakari Ailus <sakari.ailus@linux.intel.com> napisał(a):
> >
> > Hi Bartosz,
> >
> > Thanks for the reply.
> >
> > On Wed, Jan 29, 2020 at 02:36:17PM +0100, Bartosz Golaszewski wrote:
> > > wt., 21 sty 2020 o 14:41 Sakari Ailus <sakari.ailus@linux.intel.com> napisał(a):
> > > >
> > > > In certain use cases (where the chip is part of a camera module, and the
> > > > camera module is wired together with a camera privacy LED), powering on
> > > > the device during probe is undesirable. Add support for the at24 to
> > > > execute probe while being powered off. For this to happen, a hint in form
> > > > of a device property is required from the firmware.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/misc/eeprom/at24.c | 31 +++++++++++++++++++++----------
> 
> [snip!]
> 
> > > >
> > > >  static int at24_remove(struct i2c_client *client)
> > > >  {
> > > > +       bool low_power;
> > > > +
> > > >         pm_runtime_disable(&client->dev);
> > > > -       pm_runtime_set_suspended(&client->dev);
> > > > +       low_power = acpi_dev_state_low_power(&client->dev);
> > >
> > > This is inconsistent. You define the low_power field in the context
> > > structure (BTW the name low_power is a bit vague here - without
> > > looking at its assignment it would make me think it's about something
> > > battery-related, how about 'off_at_probe'?) and instead of reusing
> >
> > The field was called probe_powered_off in v1, but I changed it to
> > probe_low_power (and renamed related functions etc.) based on review
> > comments --- for the device may not be powered off actually.
> >
> 
> But is it actually ever low-power? What are the possible logical
> states of the device? If I understood correctly: it's either off or on
> at probe - not actually low-power. Am I missing something? In your
> cover letter you're writing: "These patches enable calling (and
> finishing) a driver's probe function without powering on the
> respective device on busses where the practice is to power on the
> device for probe." To me there's no mention of a low-power state,
> which makes the name 'probe_low_power' seem completely unrelated.

See <URL:https://patchwork.kernel.org/patch/10938483/>

I've updated the patches according to the comments but did not update the
cover page accordingly.

Generally drivers are interested whether a device is powered on so it can
be accessed, but the actual power state of the device isn't known to the
driver when it is, well, not in an operational state. A device may be
powered from a regulator that is always enabled, for instance.

> 
> > > this field here, you call acpi_dev_state_low_power() again. Either
> > > don't store the context for the life-time of the device if not
> > > necessary or don't call acpi_dev_state_low_power() at remove, although
> > > the commit message doesn't describe whether the latter is done on
> > > purpose.
> >
> > Right. probe-low-power property has the same effect on remove for
> > consistency, i.e. the device can remain in low power state during remove.
> > This is documented in probe_low_power field documentation in the first
> > patch.
> >
> 
> Just please don't store any state if you're not using it outside of
> the probe() function.

What exactly are you referring to? The patch adds a local variable to the
driver's probe and remove functions.

-- 
Kind regards,

Sakari Ailus
