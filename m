Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC08266604
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Sep 2020 19:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbgIKRUF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Sep 2020 13:20:05 -0400
Received: from mga18.intel.com ([134.134.136.126]:7727 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgIKNBW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 11 Sep 2020 09:01:22 -0400
IronPort-SDR: qU1Myo23D5f37oaj6ObzdJnXF+ufxjOHHHjduzNMFCudDWyc+GE9ysoHOTcTACv5IQuztpk+o1
 HbCZYbqk1yDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="146480194"
X-IronPort-AV: E=Sophos;i="5.76,415,1592895600"; 
   d="scan'208";a="146480194"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 06:01:10 -0700
IronPort-SDR: pSkF8o7IrwSY4WaejqoFue/Z30b2gALlCc0/uXEY+Z0WH4n4jNXl+LDvZjY4nFik46DcuhlSPR
 y0KMue55LBWQ==
X-IronPort-AV: E=Sophos;i="5.76,415,1592895600"; 
   d="scan'208";a="505494251"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 06:01:06 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 968752079D; Fri, 11 Sep 2020 16:01:04 +0300 (EEST)
Date:   Fri, 11 Sep 2020 16:01:04 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
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
Subject: Re: [PATCH v8 0/6] Support running driver's probe for a device
 powered off
Message-ID: <20200911130104.GF26842@paasikivi.fi.intel.com>
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
 <f4b82baa-66b7-464e-fd39-66d2243a05ef@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4b82baa-66b7-464e-fd39-66d2243a05ef@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Luca,

On Fri, Sep 11, 2020 at 02:49:26PM +0200, Luca Ceresoli wrote:
> Hi Sakari,
> 
> On 03/09/20 10:15, Sakari Ailus wrote:
> > 
> > Hi all,
> > 
> > These patches enable calling (and finishing) a driver's probe function
> > without powering on the respective device on busses where the practice is
> > to power on the device for probe. While it generally is a driver's job to
> > check the that the device is there, there are cases where it might be
> > undesirable. (In this case it stems from a combination of hardware design
> > and user expectations; see below.) The downside with this change is that
> > if there is something wrong with the device, it will only be found at the
> > time the device is used. In this case (the camera sensors + EEPROM in a
> > sensor) I don't see any tangible harm from that though.
> > 
> > An indication both from the driver and the firmware is required to allow
> > the device's power state to remain off during probe (see the first patch).
> > 
> > 
> > The use case is such that there is a privacy LED next to an integrated
> > user-facing laptop camera, and this LED is there to signal the user that
> > the camera is recording a video or capturing images. That LED also happens
> > to be wired to one of the power supplies of the camera, so whenever you
> > power on the camera, the LED will be lit, whether images are captured from
> > the camera --- or not. There's no way to implement this differently
> > without additional software control (allowing of which is itself a
> > hardware design decision) on most CSI-2-connected camera sensors as they
> > simply have no pin to signal the camera streaming state.
> > 
> > This is also what happens during driver probe: the camera will be powered
> > on by the I²C subsystem calling dev_pm_domain_attach() and the device is
> > already powered on when the driver's own probe function is called. To the
> > user this visible during the boot process as a blink of the privacy LED,
> > suggesting that the camera is recording without the user having used an
> > application to do that. From the end user's point of view the behaviour is
> > not expected and for someone unfamiliar with internal workings of a
> > computer surely seems quite suspicious --- even if images are not being
> > actually captured.
> > 
> > I've tested these on linux-next master. They also apply to Wolfram's
> > i2c/for-next branch, there's a patch that affects the I²C core changes
> > here (see below). The patches apart from that apply to Bartosz's
> > at24/for-next as well as Mauro's linux-media master branch.
> 
> Apologies for having joined this discussion this late.

No worries. But thanks for the comments.

> 
> This patchset seems a good base to cover a different use case, where I
> also cannot access the physical device at probe time.
> 
> I'm going to try these patches, but in my case there are a few
> differences that need a better understanding.
> 
> First, I'm using device tree, not ACPI. In addition to adding OF support
> similar to the work you've done for ACPI, I think instead of
> acpi_dev_state_low_power() we should have a function that works for both
> ACPI and DT.

acpi_dev_state_low_power() is really ACPI specific: it does tell the ACPI
power state of the device during probe or remove. It is not needed on DT
since the power state of the device is controlled directly by the driver.
On I²C ACPI devices, it's the framework that powers them on for probe.

You could have a helper function on DT to tell a driver what to do in
probe, but the functionality in that case is unrelated.

I'll answer to the second point later on.

-- 
Kind regards,

Sakari Ailus
