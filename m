Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 677B126C518
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 18:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgIPQYR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Sep 2020 12:24:17 -0400
Received: from mga05.intel.com ([192.55.52.43]:12090 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726565AbgIPQT5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 16 Sep 2020 12:19:57 -0400
IronPort-SDR: f+vCkeFwN8VU4L/Fp8u7htnbq5fIYPT1aNIHjryCZkRpAQC4p4UWDRfZnfQZj7VjrJCuC8NoOO
 mLe5mdc7nyOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="244341074"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; 
   d="scan'208";a="244341074"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 09:04:16 -0700
IronPort-SDR: WJwMTFCYi8C5JRn0Mzakz2t8JlumRf0nnL6CLz1u59KOrDF25xHJ6E/uWUM/tOriIi0FKtCB6D
 CS/fLwkpi7HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; 
   d="scan'208";a="409607937"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 16 Sep 2020 09:04:14 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 16 Sep 2020 19:04:13 +0300
Date:   Wed, 16 Sep 2020 19:04:13 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH] i2c: core: Call i2c_acpi_install_space_handler() before
 i2c_acpi_register_devices()
Message-ID: <20200916160413.GQ2495@lahna.fi.intel.com>
References: <20200909103233.58287-1-hdegoede@redhat.com>
 <b1c0b39f-8115-5c27-614f-a31a2731111f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1c0b39f-8115-5c27-614f-a31a2731111f@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 16, 2020 at 05:56:54PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 9/9/20 12:32 PM, Hans de Goede wrote:
> > Some ACPI i2c-devices _STA method (which is used to detect if the device
> > is present) use autodetection code which probes which device is present
> > over i2c. This requires the I2C ACPI OpRegion handler to be registered
> > before we enumerate i2c-clients under the i2c-adapter.
> > 
> > This fixes the i2c touchpad on the Lenovo ThinkBook 14-IIL and
> > ThinkBook 15 IIL not getting an i2c-client instantiated and thus not
> > working.
> > 
> > BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1842039
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Ping? This fixes a serious problem (non working touchpad on various
> laptop models) and is a pretty straight-forward fix.
> 
> Arguably it should even go to stable, but I'm not 100% sure about that
> because these sorta ACPI enumeration problems can sometimes by
> tricky. With that said in this case the fix does seem to be
> very straight forward and obviously correct.
> 
> Mika, since this deals with the ACPI bits of the i2c-core can
> you review this one please?

Sure, looks like the right thing to do:

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
