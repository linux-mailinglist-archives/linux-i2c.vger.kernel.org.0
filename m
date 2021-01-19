Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 419632FB99D
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 15:37:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387569AbhASOe5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 09:34:57 -0500
Received: from mga09.intel.com ([134.134.136.24]:38678 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387635AbhASJg7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Jan 2021 04:36:59 -0500
IronPort-SDR: +mcbgIGpvgow1F5e6VE5S1GtIOm3FVCYsAKR0tqE12pnJHBfUuRpeL7m0PWgawHfAWO0CPLqPL
 ZJxi9X79vffA==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179051386"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179051386"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 01:34:54 -0800
IronPort-SDR: ZyqcKiU5pqIaa4jK/y2/kFZdKURQvGqk5xzdXr4GsBSdbnY941/vMnTNW1eh005BqSKScnjNF6
 GS5fHddU9VVw==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="426408521"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 01:34:44 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1nQM-003Lep-8a; Tue, 19 Jan 2021 11:35:42 +0200
Date:   Tue, 19 Jan 2021 11:35:42 +0200
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
Message-ID: <20210119093542.GP4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
 <20210118144606.GO4077@smile.fi.intel.com>
 <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
 <1053125f-7cb2-8aa0-3204-24df62986184@gmail.com>
 <YAZ6Y1QDyWwPGE69@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAZ6Y1QDyWwPGE69@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 19, 2021 at 08:21:23AM +0200, Laurent Pinchart wrote:
> On Tue, Jan 19, 2021 at 12:11:40AM +0000, Daniel Scally wrote:
> > On 18/01/2021 21:19, Daniel Scally wrote:

...

> > (also, Laurent, if we did it this way we wouldn't be able to also handle
> > the led-indicator GPIO here without some fairly major rework)
> 
> Given the additional complexity I don't think it's worth it, your
> implementation is fine and code duplication with clk-gpio is minimal.

Making clk-gpio.c available as a library is a win in long term and reduces a
possible duplication by others in the future. I bet we even might find already
clk-gpio parts in some drivers.

-- 
With Best Regards,
Andy Shevchenko


