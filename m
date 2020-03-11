Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A545D1813C4
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Mar 2020 09:58:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728593AbgCKI4C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Mar 2020 04:56:02 -0400
Received: from mga12.intel.com ([192.55.52.136]:8691 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728150AbgCKI4C (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Mar 2020 04:56:02 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Mar 2020 01:56:00 -0700
X-IronPort-AV: E=Sophos;i="5.70,540,1574150400"; 
   d="scan'208";a="277295646"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Mar 2020 01:55:57 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 3E8972096B; Wed, 11 Mar 2020 10:55:55 +0200 (EET)
Date:   Wed, 11 Mar 2020 10:55:55 +0200
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
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v4 5/6] at24: Support probing while off
Message-ID: <20200311085555.GH5379@paasikivi.fi.intel.com>
References: <20200121134157.20396-1-sakari.ailus@linux.intel.com>
 <20200121134157.20396-6-sakari.ailus@linux.intel.com>
 <CAMpxmJU5dG49N2FA0oSQsOfKrCr3KQ1BisON4c+nUJJmZQG=bQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJU5dG49N2FA0oSQsOfKrCr3KQ1BisON4c+nUJJmZQG=bQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bartosz,

Thanks for the reply.

On Wed, Jan 29, 2020 at 02:36:17PM +0100, Bartosz Golaszewski wrote:
> wt., 21 sty 2020 o 14:41 Sakari Ailus <sakari.ailus@linux.intel.com> napisał(a):
> >
> > In certain use cases (where the chip is part of a camera module, and the
> > camera module is wired together with a camera privacy LED), powering on
> > the device during probe is undesirable. Add support for the at24 to
> > execute probe while being powered off. For this to happen, a hint in form
> > of a device property is required from the firmware.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/misc/eeprom/at24.c | 31 +++++++++++++++++++++----------
> >  1 file changed, 21 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > index 0681d5fdd538a..5fc1162b67618 100644
> > --- a/drivers/misc/eeprom/at24.c
> > +++ b/drivers/misc/eeprom/at24.c
> > @@ -564,6 +564,7 @@ static int at24_probe(struct i2c_client *client)
> >         bool i2c_fn_i2c, i2c_fn_block;
> >         unsigned int i, num_addresses;
> >         struct at24_data *at24;
> > +       bool low_power;
> >         struct regmap *regmap;
> >         bool writable;
> >         u8 test_byte;
> > @@ -701,19 +702,24 @@ static int at24_probe(struct i2c_client *client)
> >
> >         i2c_set_clientdata(client, at24);
> >
> > -       /* enable runtime pm */
> > -       pm_runtime_set_active(dev);
> > +       low_power = acpi_dev_state_low_power(&client->dev);
> > +       if (!low_power)
> > +               pm_runtime_set_active(dev);
> > +
> >         pm_runtime_enable(dev);
> >
> >         /*
> > -        * Perform a one-byte test read to verify that the
> > -        * chip is functional.
> > +        * Perform a one-byte test read to verify that the chip is functional,
> > +        * unless powering on the device is to be avoided during probe (i.e.
> > +        * it's powered off right now).
> >          */
> > -       err = at24_read(at24, 0, &test_byte, 1);
> > -       pm_runtime_idle(dev);
> > -       if (err) {
> > -               pm_runtime_disable(dev);
> > -               return -ENODEV;
> > +       if (!low_power) {
> > +               err = at24_read(at24, 0, &test_byte, 1);
> > +               pm_runtime_idle(dev);
> > +               if (err) {
> > +                       pm_runtime_disable(dev);
> > +                       return -ENODEV;
> > +               }
> >         }
> >
> >         if (writable)
> > @@ -728,8 +734,12 @@ static int at24_probe(struct i2c_client *client)
> >
> >  static int at24_remove(struct i2c_client *client)
> >  {
> > +       bool low_power;
> > +
> >         pm_runtime_disable(&client->dev);
> > -       pm_runtime_set_suspended(&client->dev);
> > +       low_power = acpi_dev_state_low_power(&client->dev);
> 
> This is inconsistent. You define the low_power field in the context
> structure (BTW the name low_power is a bit vague here - without
> looking at its assignment it would make me think it's about something
> battery-related, how about 'off_at_probe'?) and instead of reusing

The field was called probe_powered_off in v1, but I changed it to
probe_low_power (and renamed related functions etc.) based on review
comments --- for the device may not be powered off actually.

> this field here, you call acpi_dev_state_low_power() again. Either
> don't store the context for the life-time of the device if not
> necessary or don't call acpi_dev_state_low_power() at remove, although
> the commit message doesn't describe whether the latter is done on
> purpose.

Right. probe-low-power property has the same effect on remove for
consistency, i.e. the device can remain in low power state during remove.
This is documented in probe_low_power field documentation in the first
patch.

-- 
Regards,

Sakari Ailus
