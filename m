Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6311312B6B
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 09:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbhBHIDC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 03:03:02 -0500
Received: from mga11.intel.com ([192.55.52.93]:18280 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230035AbhBHIDB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Feb 2021 03:03:01 -0500
IronPort-SDR: ZcNOVZe4/w3Z7NYH82bFU6LUYH4nRsA3ohPgEY4xik48UUJLbLlDbYiipSeLP4ft0LRlZY9K+H
 XjAVYb7jlOYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="178165608"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; 
   d="scan'208";a="178165608"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 00:01:14 -0800
IronPort-SDR: TAeApzPzcsHD2nkD1WnSRdfB3aHdH4EvqMFWDF9iS82Szz7Zcm8ei8sWTroW7XKGJkXXa2l5iG
 3XsPj8VbOElQ==
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; 
   d="scan'208";a="577574042"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 00:01:10 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A08E22082C; Mon,  8 Feb 2021 10:01:08 +0200 (EET)
Date:   Mon, 8 Feb 2021 10:01:08 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v10 3/7] Documentation: ACPI: Document _DSE object usage
 for enum power state
Message-ID: <20210208080108.GL32460@paasikivi.fi.intel.com>
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
 <20210205132505.20173-4-sakari.ailus@linux.intel.com>
 <4894ef52-71f5-c651-c45b-4788f0e24162@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4894ef52-71f5-c651-c45b-4788f0e24162@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Randy,

On Fri, Feb 05, 2021 at 04:56:47PM -0800, Randy Dunlap wrote:
> On 2/5/21 5:25 AM, Sakari Ailus wrote:
> > Document the use of the _DSE object for setting desirable power state
> > during probe.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> > ---
> >  Documentation/firmware-guide/acpi/index.rst   |  1 +
> >  .../firmware-guide/acpi/low-power-probe.rst   | 69 +++++++++++++++++++
> >  2 files changed, 70 insertions(+)
> >  create mode 100644 Documentation/firmware-guide/acpi/low-power-probe.rst
> > 
> 
> > diff --git a/Documentation/firmware-guide/acpi/low-power-probe.rst b/Documentation/firmware-guide/acpi/low-power-probe.rst
> > new file mode 100644
> > index 0000000000000..b96804d959a6c
> > --- /dev/null
> > +++ b/Documentation/firmware-guide/acpi/low-power-probe.rst
> > @@ -0,0 +1,69 @@
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
> > +beyond just powering on the said device.
> > +
> > +How it works
> > +============
> >
> 
> Hi,
> 
> Please don't use ============ underlines for all section levels.

The sections under the title are intended to be on the same level.

-- 
Regards,

Sakari Ailus
