Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097F02FC385
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 23:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbhASWc7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 17:32:59 -0500
Received: from mga18.intel.com ([134.134.136.126]:24755 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727669AbhASRoS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Jan 2021 12:44:18 -0500
IronPort-SDR: dJV84DJ/vSSJ+Hn8A+Wxhhtm3za3Zz/j8Sqwl21dBj00sBMoTG3/iIJ32hKObH1S0bMA52ZeqM
 W5dm7lHYx3mw==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="166632754"
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; 
   d="scan'208";a="166632754"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 09:42:19 -0800
IronPort-SDR: EL58UZk+sJ19P4ixy5WWw7RUj9/Yx+9c2hUyTbYVWS2dSrkQoe04HMeVAzYEqHzQNh6FuH/9zD
 F+SVCiy3PhJQ==
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; 
   d="scan'208";a="501005745"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 09:42:13 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1v2B-004oA2-Fm; Tue, 19 Jan 2021 19:43:15 +0200
Date:   Tue, 19 Jan 2021 19:43:15 +0200
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
Message-ID: <YAcaM9Tcif1rS3V/@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
 <20210118144606.GO4077@smile.fi.intel.com>
 <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
 <1053125f-7cb2-8aa0-3204-24df62986184@gmail.com>
 <20210119093358.GO4077@smile.fi.intel.com>
 <YAcKj9fyNZY8QETd@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAcKj9fyNZY8QETd@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 19, 2021 at 06:36:31PM +0200, Laurent Pinchart wrote:
> On Tue, Jan 19, 2021 at 11:33:58AM +0200, Andy Shevchenko wrote:
> > On Tue, Jan 19, 2021 at 12:11:40AM +0000, Daniel Scally wrote:
> > > On 18/01/2021 21:19, Daniel Scally wrote:

...

> > See my previous reply. TL;DR: you have to modify clk-gpio.c to export couple of
> > methods to be able to use it as a library.
> 
> That seems really overkill given the very simple implementation of the
> clock provided here.

Less code in the end is called an overkill? Hmm...
I think since we in Linux it's better to utilize what it provides. Do you want
me to prepare a patch to show that there is no overkill at all?

...

> > > (also, Laurent, if we did it this way we wouldn't be able to also handle
> > > the led-indicator GPIO here without some fairly major rework)
> > 
> > LED indicators are done as LED class devices (see plenty of examples in PDx86
> > drivers: drivers/platform/x86/)
> 
> How do you expose the link between the sensor and its indicator LED to
> userspace ? Isn't it better to handle it in the kernel to avoid rogue
> userspace turning the camera on without notifying the user ?

I didn't get this. It's completely a LED handling driver business. We may
expose it to user space or not, but it's orthogonal to the usage of LED class
IIUC. Am I mistaken here?

-- 
With Best Regards,
Andy Shevchenko


