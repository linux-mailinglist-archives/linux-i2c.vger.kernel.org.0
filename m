Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9756473AC
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 16:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbiLHP60 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 10:58:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiLHP6Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 10:58:25 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4BD4A581;
        Thu,  8 Dec 2022 07:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670515104; x=1702051104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HFHvTj2UxyZTR/3t9cajOIIUSSoBJRn2X/zqMgVxw4E=;
  b=T2yxe8iA3iP6ksojfo5i3dDAD5pFJ1AV73nuRcirw0oajr5XtfphoNo7
   1kISGWJOm/3TI4Nw6WkaYIyJOqJMWTkGBvZDfFvufxBjQ2l0RGOUzHnO4
   kwhi7s7gUuu/oDhBsXIhf36a2IIQflr89hoG1YtzP9hQtA4WPs1LGJGBO
   UGeZ4PwzyeTNLXvFpSFN49lqQqcs20NOIdxEjSKRLG0Dgdtco56fF7EA5
   1MW+o6cRQQjmm6gbnI6yxhOsh5DDBlWbpZYgGqJMApYrK0LZDVIbEf5jr
   FXorunn38gUpVUI+kHpFSWiXueTYxwKF+f7WP4eQFl8EzzA7pwi7vDGLO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="344250837"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="344250837"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 07:58:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="715655563"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="715655563"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 08 Dec 2022 07:58:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1p3JHr-006QgJ-0K;
        Thu, 08 Dec 2022 17:58:15 +0200
Date:   Thu, 8 Dec 2022 17:58:14 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v5 0/8] i2c-atr and FPDLink
Message-ID: <Y5IJlpWlngrvZemy@smile.fi.intel.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <c5eac6a6-f44b-ddd0-d27b-ccbe01498ae9@ideasonboard.com>
 <Y5HYBzZlkTrsdjfX@smile.fi.intel.com>
 <0340d15c-be0a-cd28-4149-7976896f8eb1@ideasonboard.com>
 <Y5IJY2nUkt/6BoKm@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5IJY2nUkt/6BoKm@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 08, 2022 at 05:57:23PM +0200, Andy Shevchenko wrote:
> On Thu, Dec 08, 2022 at 04:40:58PM +0200, Tomi Valkeinen wrote:
> > On 08/12/2022 14:26, Andy Shevchenko wrote:
> > > On Thu, Dec 08, 2022 at 12:42:13PM +0200, Tomi Valkeinen wrote:
> > > > On 08/12/2022 12:39, Tomi Valkeinen wrote:

...

> > > >   /**
> > > > - * Helper to add I2C ATR features to a device driver.
> > > > + * struct i2c_atr - Represents the I2C ATR instance
> > > >    */
> > > 
> > > This is incomplete. Have you run kernel doc validator against this file?
> > 
> > What's kernel doc validator? Do you mean that it's incomplete and kernel doc
> > doesn't work correctly, or that there should be more information here?
> > 
> > I don't get any errors/warnings from any tool I have used. But I agree it
> > looks a bit odd with only the name of the struct in the doc.
> 
> ...
> 
> $ scripts/kernel-doc -none -v include/linux/i2c.h
> include/linux/i2c.h:79: warning: No description found for return value of 'i2c_master_recv'
> include/linux/i2c.h:94: warning: No description found for return value of 'i2c_master_recv_dmasafe'
> include/linux/i2c.h:109: warning: No description found for return value of 'i2c_master_send'
> include/linux/i2c.h:124: warning: No description found for return value of 'i2c_master_send_dmasafe'
> 4 warnings

Note, this is just example against existing file, not your case.

-- 
With Best Regards,
Andy Shevchenko


