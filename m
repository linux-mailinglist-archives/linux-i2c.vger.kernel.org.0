Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74BF2315477
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Feb 2021 17:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbhBIQ4N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Feb 2021 11:56:13 -0500
Received: from mga17.intel.com ([192.55.52.151]:38815 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232762AbhBIQ4K (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Feb 2021 11:56:10 -0500
IronPort-SDR: +/Ed0S3JqYWMvdhzwsMFahmb/NPuoQqIAEdC0ZKwl/EA4LwnhkMQRLyipw8ApBzoJUEL7qPIYr
 d/2uNitPu7sQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="161664803"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="161664803"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 08:54:23 -0800
IronPort-SDR: a1XALXBRo4pL2BpBztVFedROLQixuqmREpPrOj4BWOiUTNQAD3ZIooEZwOdtaF+h4hdY7wMBly
 V+JRIaFeOyww==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="412260388"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 08:54:20 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 41210206D0; Tue,  9 Feb 2021 18:54:18 +0200 (EET)
Date:   Tue, 9 Feb 2021 18:54:18 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media <linux-media@vger.kernel.org>
Subject: Re: [PATCH v10 7/7] at24: Support probing while off
Message-ID: <20210209165418.GG32460@paasikivi.fi.intel.com>
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
 <20210205132505.20173-8-sakari.ailus@linux.intel.com>
 <CAMpxmJU7J9JBSwCN+GLDpuOL=iZ1PH=oZZuGiAyovuf2TQ=o9A@mail.gmail.com>
 <CAJZ5v0jUqtYDpBn-ezsftCrY=9iD3sAKhyyFf_+CMkthLnsZow@mail.gmail.com>
 <CAMpxmJW61Bd1SR3-i6=OV6RgafiEdfp4sNN0M6EYa7NSeOTFKg@mail.gmail.com>
 <20210209162343.GF32460@paasikivi.fi.intel.com>
 <CAJZ5v0h2=zKNMictJtJE5LuEi9E3n=Uf-xNO3udHxL2hqXL7Fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0h2=zKNMictJtJE5LuEi9E3n=Uf-xNO3udHxL2hqXL7Fg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 09, 2021 at 05:42:45PM +0100, Rafael J. Wysocki wrote:
> On Tue, Feb 9, 2021 at 5:23 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Bartosz, Rafael,
> >
> > On Tue, Feb 09, 2021 at 04:49:37PM +0100, Bartosz Golaszewski wrote:
> > > On Mon, Feb 8, 2021 at 5:54 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > > >
> > > > On Mon, Feb 8, 2021 at 5:44 PM Bartosz Golaszewski
> > > > <bgolaszewski@baylibre.com> wrote:
> > > > >
> > > > > On Fri, Feb 5, 2021 at 2:25 PM Sakari Ailus
> > > > > <sakari.ailus@linux.intel.com> wrote:
> > > > > >
> > > > > > In certain use cases (where the chip is part of a camera module, and the
> > > > > > camera module is wired together with a camera privacy LED), powering on
> > > > > > the device during probe is undesirable. Add support for the at24 to
> > > > > > execute probe while being powered off. For this to happen, a hint in form
> > > > > > of a device property is required from the firmware.
> > > > > >
> > > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> > > > > > ---
> > > > >
> > > > > I'll ack this but I still claim that the name
> > > > > acpi_dev_state_low_power() is super misleading for this use-case and
> > > > > I've been saying that for 10 versions now with everyone just ignoring
> > > > > my remarks. :/
> > > >
> > > > Well, the function in question simply checks if the current ACPI power
> > > > state of the device is different from "full power", so its name
> > > > appears to be quite adequate to me.
> > > >
> > > > If the way in which it is used is confusing, though, I guess
> > > > explaining what's going on would be welcome.
> > > >
> > >
> > > Yes, I have explained it multiple time already - last time at v9 of this series:
> > >
> > >     https://www.spinics.net/lists/kernel/msg3816807.html
> >
> > How about adding this to the description of acpi_dev_state_low_power():
> >
> > -----------8<--------------
> >  * This function is intended to be used by drivers to tell whether the device
> >  * is in low power state (D1--D3cold) in driver's probe or remove function. See
> >  * Documentation/firmware-guide/acpi/low-power-probe.rst for more information.
> > -----------8<--------------
> 
> This information is already there in the kerneldoc description of that
> function AFAICS.

Ok, the D states are mentioned already. But how to use it is not, nor
there's a reference to the ReST file. I think that wouldn't hurt.

> 
> I was thinking about adding an explanation comment to the caller.

I think it'd be best if the function name would convey that without a
comment that should then be added to all callers. How about calling the
function e.g. acpi_dev_state_d0() and negating the return value? The D0
state is well defined and we could do this without adding new terms.

-- 
Sakari Ailus
