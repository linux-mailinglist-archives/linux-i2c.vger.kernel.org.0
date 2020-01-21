Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDF31442A3
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2020 17:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbgAUQ7F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jan 2020 11:59:05 -0500
Received: from mga03.intel.com ([134.134.136.65]:40890 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726555AbgAUQ7F (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jan 2020 11:59:05 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jan 2020 08:59:04 -0800
X-IronPort-AV: E=Sophos;i="5.70,346,1574150400"; 
   d="scan'208";a="220972505"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jan 2020 08:59:00 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A543C206AB; Tue, 21 Jan 2020 18:58:28 +0200 (EET)
Date:   Tue, 21 Jan 2020 18:58:28 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v4 6/6] Documentation: ACPI: Document probe-low-power
 _DSD property
Message-ID: <20200121165828.GA5440@paasikivi.fi.intel.com>
References: <20200121134157.20396-1-sakari.ailus@linux.intel.com>
 <20200121134157.20396-7-sakari.ailus@linux.intel.com>
 <CAJZ5v0iJXUjK0n7mkqxagX9FtOmMsLqVMmU2xpQOLSb0aBWSMA@mail.gmail.com>
 <20200121161856.GZ5440@paasikivi.fi.intel.com>
 <CAJZ5v0ho8ry7iTXBTxHMjwcqT+EGT2mRy2rmp+o7rmG0apYimQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0ho8ry7iTXBTxHMjwcqT+EGT2mRy2rmp+o7rmG0apYimQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 21, 2020 at 05:56:39PM +0100, Rafael J. Wysocki wrote:
> On Tue, Jan 21, 2020 at 5:19 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > On Tue, Jan 21, 2020 at 05:09:44PM +0100, Rafael J. Wysocki wrote:
> > > On Tue, Jan 21, 2020 at 2:41 PM Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > Document the probe-low-power _DSD property and how it is used with I²C
> > > > drivers.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../acpi/dsd/probe-low-power.rst              | 28 +++++++++++++++++++
> > > >  Documentation/firmware-guide/acpi/index.rst   |  1 +
> > > >  2 files changed, 29 insertions(+)
> > > >  create mode 100644 Documentation/firmware-guide/acpi/dsd/probe-low-power.rst
> > > >
> > > > diff --git a/Documentation/firmware-guide/acpi/dsd/probe-low-power.rst b/Documentation/firmware-guide/acpi/dsd/probe-low-power.rst
> > > > new file mode 100644
> > > > index 0000000000000..e0343ffefe071
> > > > --- /dev/null
> > > > +++ b/Documentation/firmware-guide/acpi/dsd/probe-low-power.rst
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
> > > > +In some cases it may be preferred to leave certain devices powered off for
> > > > +the entire system bootup if powering on these devices has adverse side
> > > > +effects, beyond just powering on the said device. The _DSD property
> > > > +"probe-low-power" has been defined for this purpose.
> > >
> > > Well, if you say "has been defined", you need to provide a pointer to
> > > the definition document (a specification of some sort or similar).
> >
> > How about:
> >
> > s/has been defined/is used/
> 
> I would say "Linux recognizes the ... that can be used for this purpose."

Ack; I'll use this in v5.

-- 
Sakari Ailus
