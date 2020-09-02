Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B36B525B4F2
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Sep 2020 21:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgIBT7q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 15:59:46 -0400
Received: from mga11.intel.com ([192.55.52.93]:59337 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726285AbgIBT7p (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Sep 2020 15:59:45 -0400
IronPort-SDR: TNrL2OULHNquJpE5XtUKJwv069sSP6qfjhqmiHlDEtmnCg1MmvXd/XCQ68sQsTjZDidWlsk/Iq
 U22QHDu5hjFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="154979343"
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; 
   d="scan'208";a="154979343"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2020 12:59:44 -0700
IronPort-SDR: Qb+TmmiGe+/w1Cy++Hd5ueLANvX6LvRs9O5Xd2VRZ0PWeiY1F7Vzo41yM86iEqgd12BaxfuEJW
 /4BktnFHU+BA==
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; 
   d="scan'208";a="477772867"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2020 12:59:41 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 502932071B; Wed,  2 Sep 2020 22:59:39 +0300 (EEST)
Date:   Wed, 2 Sep 2020 22:59:39 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v7 6/6] Documentation: ACPI: Document
 allow-low-power-probe _DSD property
Message-ID: <20200902195939.GG32646@paasikivi.fi.intel.com>
References: <20200901210333.8462-1-sakari.ailus@linux.intel.com>
 <20200901210333.8462-7-sakari.ailus@linux.intel.com>
 <CAJZ5v0jFceTFRTD55cz3ZHRZpuNRK_z9=_DxWexc8ArsGU3cog@mail.gmail.com>
 <20200902163121.GE32646@paasikivi.fi.intel.com>
 <CAJZ5v0jmetD2N0-ZrNh8C8oOCFwdwwH9s6FqHOQApMdFa_AZ1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jmetD2N0-ZrNh8C8oOCFwdwwH9s6FqHOQApMdFa_AZ1A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 02, 2020 at 06:34:30PM +0200, Rafael J. Wysocki wrote:
> On Wed, Sep 2, 2020 at 6:31 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Rafael,
> >
> > Thank you for the review.
> >
> > On Wed, Sep 02, 2020 at 05:57:01PM +0200, Rafael J. Wysocki wrote:
> > > On Tue, Sep 1, 2020 at 11:03 PM Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > Document the probe-low-power _DSD property and how it is used with I²C
> > > > drivers.
> > >
> > > I would reorder the series to make this go right after the [1/6] or
> > > maybe even fold it into that patch.
> > >
> > > The point is that the changes in [1/6] clearly depend on the property
> > > defined here.
> >
> > Ack.
> >
> > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../acpi/dsd/allow-low-power-probe.rst        | 28 +++++++++++++++++++
> > > >  Documentation/firmware-guide/acpi/index.rst   |  1 +
> > > >  2 files changed, 29 insertions(+)
> > > >  create mode 100644 Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst
> > > >
> > > > diff --git a/Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst b/Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst
> > > > new file mode 100644
> > > > index 0000000000000..6fcc89162b898
> > > > --- /dev/null
> > > > +++ b/Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst
> > > > @@ -0,0 +1,28 @@
> > > > +.. SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +======================================
> > > > +Probing I²C devices in low power state
> > > > +======================================
> > > > +
> > > > +Introduction
> > > > +============
> > > > +
> > > > +In some cases it may be preferred to leave certain devices powered off for the
> > > > +entire system bootup if powering on these devices has adverse side effects,
> > > > +beyond just powering on the said device. Linux recognizes the _DSD property
> > > > +"allow-low-power-probe" that can be used for this purpose.
> > >
> > > It would be good to refer to the document defining the generic _DSD
> > > properties mechanism and the GUID used for that from here.
> >
> > I'll add a reference to the device properties UUID for _DSD spec.
> >
> > >
> > > The meaning of  "_DSD property" may not be entirely clear to the
> > > reader as it stands.
> > >
> > > And maybe call the property "i2c-allow-low-power-probe" or similar, to
> > > indicate that it is specific to i2c.
> >
> > The bus determines that already, and it's only defined for I²C here. Should
> > we need this in the future for e.g. I3C, there would be no need to think of
> > renaming it, just changing the documentation and implementation.
> >
> > I don't have a strong opinion on that though.
> 
> The point is that the property is not going to be recognized beyond i2c.

Not right now, that is true. Sure, I can change it for v8.

-- 
Sakari Ailus
