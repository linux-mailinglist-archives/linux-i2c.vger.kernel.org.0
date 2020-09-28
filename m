Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8DA927B6A7
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Sep 2020 22:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgI1UtL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Sep 2020 16:49:11 -0400
Received: from mga01.intel.com ([192.55.52.88]:19464 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbgI1UtL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 28 Sep 2020 16:49:11 -0400
IronPort-SDR: Sw7CfVi91gr3jZn9GVrhCWIwdZy+Z6tCFYUMiFGwXVhOnG7oxTb+itII1ihRdhjERtlcacO/B/
 4NRGc8yCGBuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="180218005"
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; 
   d="scan'208";a="180218005"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 13:49:11 -0700
IronPort-SDR: kSZaeuYcjm57NTEN1DK59pnm4N8DvKBaGJNX4AcpKh7aT601y/AAeGd5EfGWKVUtv9WcGJlii0
 PkXG+J8hHzGw==
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; 
   d="scan'208";a="349971865"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 13:49:08 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 15C5120562; Mon, 28 Sep 2020 23:49:06 +0300 (EEST)
Date:   Mon, 28 Sep 2020 23:49:06 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH v8 0/6] Support running driver's probe for a device
 powered off
Message-ID: <20200928204905.GD26842@paasikivi.fi.intel.com>
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
 <f4b82baa-66b7-464e-fd39-66d2243a05ef@lucaceresoli.net>
 <20200911130104.GF26842@paasikivi.fi.intel.com>
 <6dea1206-cfaa-bfc5-d57e-4dcddadc03c7@lucaceresoli.net>
 <20200914094727.GM26842@paasikivi.fi.intel.com>
 <20200926123807.GA3781977@chromium.org>
 <20200927193900.GA30711@kunai>
 <CAAFQd5Be5sUQYtXapcSOu8CVffW2LuLog9qh71-+mxze9WYUVQ@mail.gmail.com>
 <CAJZ5v0hKQNv+qj-7EQ2Dmtk=UamtVKHBXDCjqo-48Qj13yY+cw@mail.gmail.com>
 <CAAFQd5CP7bg+UQEp5uzuQY5a_xHLAB4ct81pkO0naAou=-QyKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5CP7bg+UQEp5uzuQY5a_xHLAB4ct81pkO0naAou=-QyKw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomasz,

On Mon, Sep 28, 2020 at 06:49:22PM +0200, Tomasz Figa wrote:
> On Mon, Sep 28, 2020 at 4:18 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Sun, Sep 27, 2020 at 9:44 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > >
> > > On Sun, Sep 27, 2020 at 9:39 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > > >
> > > >
> > > > > I think we might be overly complicating things. IMHO the series as is
> > > > > with the "i2c_" prefix removed from the flags introduced would be
> > > > > reusable as is for any other subsystem that needs it. Of course, for
> > > > > now, the handling of the flag would remain implemented only in the I2C
> > > > > subsystem.
> > > >
> > > > Just to be clear: you are suggesting to remove "i2c" from the DSD
> > > > binding "i2c-allow-low-power-probe". And you are not talking about
> > > > moving I2C_DRV_FL_ALLOW_LOW_POWER_PROBE to struct device_driver? I
> > > > recall the latter has been NACKed by gkh so far.
> > > >
> > >
> > > I'd also drop "I2C_" from "I2C_DRV_FL_ALLOW_LOW_POWER_PROBE", but all
> > > the implementation would remain where it is in the code. IOW, I'm just
> > > suggesting a naming change to avoid proliferating duplicate flags of
> > > the same meaning across subsystems.
> >
> > But that would indicate that the property was recognized by other
> > subsystems which wouldn't be the case, so it would be confusing.
> >
> > That's why it cannot be documented as a general property ATM too.
> 
> I guess that's true. Well, this is kAPI in the end, so if we have more
> subsystems, it could be always renamed. So feel free to ignore my
> previous comment.

I wouldn't expect this flag to be needed outside I²C since the other
potential use case (I3C) appears to be entirely free of power management,
so it's up to the drivers on ACPI, too.

The property itself, though, might be.

-- 
Regards,

Sakari Ailus
