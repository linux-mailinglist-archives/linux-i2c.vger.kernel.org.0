Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF0FF1A3295
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Apr 2020 12:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgDIKhe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Apr 2020 06:37:34 -0400
Received: from mga02.intel.com ([134.134.136.20]:9083 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725972AbgDIKhe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Apr 2020 06:37:34 -0400
IronPort-SDR: iqOsvdaQJl7VAk9gxu0dg0luUqSQ7uWKnNNvYCx8dWTR1ytljOIwwTrrLAy7lcQpfEriAFFHxj
 qfvlSOOl6FpQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 03:37:34 -0700
IronPort-SDR: H2v7SCPRjshIjFhVJeWWAL+reHV9XQhwhwx4Hi1abW6oN+ZcNO+THyLwOh254FuXmaHUlZbRxt
 oH2EeH318vHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,362,1580803200"; 
   d="scan'208";a="251854220"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 09 Apr 2020 03:37:32 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jMUYx-00GvqW-Ip; Thu, 09 Apr 2020 13:37:35 +0300
Date:   Thu, 9 Apr 2020 13:37:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Max Staudt <max@enpas.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1] i2c: icy: Don't use software node when it's an
 overkill
Message-ID: <20200409103735.GV3676135@smile.fi.intel.com>
References: <20200408165247.13116-1-andriy.shevchenko@linux.intel.com>
 <5867ca8b-215e-5ccf-bee9-feefc2e507c8@enpas.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5867ca8b-215e-5ccf-bee9-feefc2e507c8@enpas.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 08, 2020 at 11:24:20PM +0200, Max Staudt wrote:
> Thank you, that looks much nicer indeed. I have also tested it on my Amiga just to be sure - it works.

Thank you.

> However, no signature yet because the call stack is giving me a headache:
> 
> icy_probe()
>  -> i2c_new_scanned_device()
>  -> i2c_new_client_device()
>  -> device_add_properties()
> 
> And here we are in drivers/base/property.c looking at device_add_properties():
> 
>  * WARNING: The callers should not use this function if it is known that there
>  * is no real firmware node associated with @dev! In that case the callers
>  * should create a software node and assign it to @dev directly.
> 
> 
> Why is this warning there? It flies right in the face of what we're trying to achieve here.
> 
> It was introduced in 2018 with commit caf35cd52242 .
> 
> 
> So either the warning is superfluous, or i2c_new_client_device() should be creating a software fwnode, I guess?

No and no.

First one because the mechanism is added to have quirks, it must not replace
the actual possibility to provide this via firmware (DT / ACPI).

Second one, because software node API should have (has?) the same warning.

+Cc Heikki.

Heikki, am I correct?

-- 
With Best Regards,
Andy Shevchenko


