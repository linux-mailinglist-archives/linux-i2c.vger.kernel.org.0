Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6C882FD0B0
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Jan 2021 13:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729154AbhATMtF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Jan 2021 07:49:05 -0500
Received: from mga14.intel.com ([192.55.52.115]:58467 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388623AbhATLpO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Jan 2021 06:45:14 -0500
IronPort-SDR: aL2ktEegC5LV5U1VNOp58U5GcU3KJ4pX04CfZ/3vwwDlJtCBfXrm6VeVBg8MY1TS+hRkn/4uxN
 ei6VpNhRfV1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="178312335"
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; 
   d="scan'208";a="178312335"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 03:43:25 -0800
IronPort-SDR: 6d9Rl0rqHJqHoSH83fmczd67tFi0FPoX0meYdc4bz4p8ozkNLjsRJu/Sag1Y1gN4GNf12X7g9N
 RIBIzwexvgpg==
X-IronPort-AV: E=Sophos;i="5.79,361,1602572400"; 
   d="scan'208";a="501578998"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 03:43:20 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l2BuQ-0065s8-4t; Wed, 20 Jan 2021 13:44:22 +0200
Date:   Wed, 20 Jan 2021 13:44:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        andy@kernel.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, lee.jones@linaro.org, hdegoede@redhat.com,
        mgross@linux.intel.com, robert.moore@intel.com,
        erik.kaneda@intel.com, sakari.ailus@linux.intel.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
Message-ID: <YAgXlgLauIGEe05w@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
 <20210118144606.GO4077@smile.fi.intel.com>
 <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
 <1053125f-7cb2-8aa0-3204-24df62986184@gmail.com>
 <20210119093358.GO4077@smile.fi.intel.com>
 <YAcKj9fyNZY8QETd@pendragon.ideasonboard.com>
 <YAcaM9Tcif1rS3V/@smile.fi.intel.com>
 <YAevLTVlUSXMylWL@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAevLTVlUSXMylWL@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 20, 2021 at 06:18:53AM +0200, Laurent Pinchart wrote:
> On Tue, Jan 19, 2021 at 07:43:15PM +0200, Andy Shevchenko wrote:
> > On Tue, Jan 19, 2021 at 06:36:31PM +0200, Laurent Pinchart wrote:
> > > On Tue, Jan 19, 2021 at 11:33:58AM +0200, Andy Shevchenko wrote:
> > > > On Tue, Jan 19, 2021 at 12:11:40AM +0000, Daniel Scally wrote:
> > > > > On 18/01/2021 21:19, Daniel Scally wrote:

...

> > > > See my previous reply. TL;DR: you have to modify clk-gpio.c to export couple of
> > > > methods to be able to use it as a library.
> > > 
> > > That seems really overkill given the very simple implementation of the
> > > clock provided here.
> > 
> > Less code in the end is called an overkill? Hmm...
> > I think since we in Linux it's better to utilize what it provides. Do you want
> > me to prepare a patch to show that there is no overkill at all?
> 
> The amount of code we would save it very small. It's not necessarily a
> bad idea, but I think such an improvement could be made on top, it
> shouldn't block this series.

Okay, let's wait what Dan will say on this.
I can probably help to achieve this improvement sooner than later.

...

> > > > > (also, Laurent, if we did it this way we wouldn't be able to also handle
> > > > > the led-indicator GPIO here without some fairly major rework)
> > > > 
> > > > LED indicators are done as LED class devices (see plenty of examples in PDx86
> > > > drivers: drivers/platform/x86/)
> > > 
> > > How do you expose the link between the sensor and its indicator LED to
> > > userspace ? Isn't it better to handle it in the kernel to avoid rogue
> > > userspace turning the camera on without notifying the user ?
> > 
> > I didn't get this. It's completely a LED handling driver business. We may
> > expose it to user space or not, but it's orthogonal to the usage of LED class
> > IIUC. Am I mistaken here?
> 
> If it stays internal to the kernel and is solely controlled from the
> int3472 driver, there's no need to involve the LED class. If we want to
> expose the privacy LED to userspace then the LED framework is the way to
> go, but we will also need to find a way to expose the link between the
> camera sensor and the LED to userspace. If there are two privacy LEDs,
> one for the front sensor and one for the back sensor, userspace will
> need to know which is which.

I see. For now we probably can keep GPIO LED implementation internally.

-- 
With Best Regards,
Andy Shevchenko


