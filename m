Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD7EF259FF6
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 22:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgIAU3U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 16:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgIAU3U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 16:29:20 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E200C061244;
        Tue,  1 Sep 2020 13:29:19 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 28220634C8C;
        Tue,  1 Sep 2020 23:28:55 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kDCtj-0001BF-2L; Tue, 01 Sep 2020 23:28:55 +0300
Date:   Tue, 1 Sep 2020 23:28:55 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH v6 6/6] Documentation: ACPI: Document
 allow-low-power-probe _DSD property
Message-ID: <20200901202854.GA4392@valkosipuli.retiisi.org.uk>
References: <20200826115432.6103-1-sakari.ailus@linux.intel.com>
 <20200826115432.6103-7-sakari.ailus@linux.intel.com>
 <ac5a7cb9-7fd1-fb73-b872-d5a58846d99f@infradead.org>
 <20200827132822.GI24582@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200827132822.GI24582@paasikivi.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 27, 2020 at 04:28:22PM +0300, Sakari Ailus wrote:
> On Wed, Aug 26, 2020 at 11:06:22AM -0700, Randy Dunlap wrote:
> > On 8/26/20 4:54 AM, Sakari Ailus wrote:
> > > Document the probe-low-power _DSD property and how it is used with I²C
> > > drivers.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../acpi/dsd/allow-low-power-probe.rst        | 28 +++++++++++++++++++
> > >  Documentation/firmware-guide/acpi/index.rst   |  1 +
> > >  2 files changed, 29 insertions(+)
> > >  create mode 100644 Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst
> > > 
> > > diff --git a/Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst b/Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst
> > > new file mode 100644
> > > index 0000000000000..6fcc89162b898
> > > --- /dev/null
> > > +++ b/Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst
> > > @@ -0,0 +1,28 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +======================================
> > > +Probing I²C devices in low power state
> > > +======================================
> > > +
> > > +Introduction
> > > +============
> > > +
> > > +In some cases it may be preferred to leave certain devices powered off for the
> > > +entire system bootup if powering on these devices has adverse side effects,
> > > +beyond just powering on the said device. Linux recognizes the _DSD property
> > > +"allow-low-power-probe" that can be used for this purpose.
> > > +
> > > +How it works
> > > +============
> > > +
> > > +The property "allow-low-power-probe" boolean property may be used to tell Linux
> > 
> > Drop the first "property".
> > 
> 
> Thanks, will fix for v7.
> 
> > > +that the I²C framework should instruct the kernel ACPI framework to leave the
> > > +device in the low power state. If the driver indicates its support for this by
> > > +setting the I2C_DRV_FL_ALLOW_LOW_POWER_PROBE flag in struct i2c_driver.flags
> 
> This is leftover from v5 actually, I'll change the documentation to mention
> the allow_low_power_probe as well.

Hmm. It seems I ended up sending the set with the flags field.

I'll keep it as-is if that's okay...

-- 
Sakari Ailus
