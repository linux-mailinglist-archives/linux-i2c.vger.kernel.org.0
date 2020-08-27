Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01D82545EE
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Aug 2020 15:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbgH0N3p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Aug 2020 09:29:45 -0400
Received: from mga09.intel.com ([134.134.136.24]:25597 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728035AbgH0N22 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 Aug 2020 09:28:28 -0400
IronPort-SDR: zA+9aKbt4jHDA2Gj7+B6a7P9oPa3Y3I5+2nlIuGa/BIjYnX4khduS2wUBX8Q4KWpsOKR0V9McP
 xadUjzfQNhMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="157503047"
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; 
   d="scan'208";a="157503047"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2020 06:28:28 -0700
IronPort-SDR: ROXbn60uGAEfxQlLWOlgDCyR5qTaP+nvWHDUAHFNKYScuFTf6y15VebIoX9/cDXydcihspvv+D
 5o1jDewAc/sg==
X-IronPort-AV: E=Sophos;i="5.76,359,1592895600"; 
   d="scan'208";a="295723842"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2020 06:28:24 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 3DD3B20722; Thu, 27 Aug 2020 16:28:22 +0300 (EEST)
Date:   Thu, 27 Aug 2020 16:28:22 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
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
Message-ID: <20200827132822.GI24582@paasikivi.fi.intel.com>
References: <20200826115432.6103-1-sakari.ailus@linux.intel.com>
 <20200826115432.6103-7-sakari.ailus@linux.intel.com>
 <ac5a7cb9-7fd1-fb73-b872-d5a58846d99f@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac5a7cb9-7fd1-fb73-b872-d5a58846d99f@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 26, 2020 at 11:06:22AM -0700, Randy Dunlap wrote:
> On 8/26/20 4:54 AM, Sakari Ailus wrote:
> > Document the probe-low-power _DSD property and how it is used with I²C
> > drivers.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../acpi/dsd/allow-low-power-probe.rst        | 28 +++++++++++++++++++
> >  Documentation/firmware-guide/acpi/index.rst   |  1 +
> >  2 files changed, 29 insertions(+)
> >  create mode 100644 Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst
> > 
> > diff --git a/Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst b/Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst
> > new file mode 100644
> > index 0000000000000..6fcc89162b898
> > --- /dev/null
> > +++ b/Documentation/firmware-guide/acpi/dsd/allow-low-power-probe.rst
> > @@ -0,0 +1,28 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +======================================
> > +Probing I²C devices in low power state
> > +======================================
> > +
> > +Introduction
> > +============
> > +
> > +In some cases it may be preferred to leave certain devices powered off for the
> > +entire system bootup if powering on these devices has adverse side effects,
> > +beyond just powering on the said device. Linux recognizes the _DSD property
> > +"allow-low-power-probe" that can be used for this purpose.
> > +
> > +How it works
> > +============
> > +
> > +The property "allow-low-power-probe" boolean property may be used to tell Linux
> 
> Drop the first "property".
> 

Thanks, will fix for v7.

> > +that the I²C framework should instruct the kernel ACPI framework to leave the
> > +device in the low power state. If the driver indicates its support for this by
> > +setting the I2C_DRV_FL_ALLOW_LOW_POWER_PROBE flag in struct i2c_driver.flags

This is leftover from v5 actually, I'll change the documentation to mention
the allow_low_power_probe as well.

> > +field and the "allow-low-power-probe" property is present, the device will not
> > +be powered on for probe.
> 

-- 
Kind regards,

Sakari Ailus
