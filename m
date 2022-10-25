Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB42960CAB4
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 13:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbiJYLPu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 07:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231819AbiJYLPm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 07:15:42 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7050211E461;
        Tue, 25 Oct 2022 04:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666696541; x=1698232541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I/5u94u6MpEzVP8gikfALeB7J/YtsYkWMNaw/bQchGY=;
  b=fcrXhQPlhrvYU1vQRG+hXusiPCZKALwy93mnCFWVj6rHvkkBYfeifkb1
   +TXyyd8RJII7RMc0RoYxnVZPBcRxvTcchBo6JnV58iB6Fdf5eEIRKpVmM
   MvCfV16Zoqi0AvnEFB4VXDTVCCllgaLTVlNUR8k8gxpBLZyZqNBIzC9ta
   iikHIdb1QaQsmUAMC3tyAuQ9wzptkN6S8J134ENtukgYC85vz1FaSyezT
   1o7/BHel1GnJd0T4cVu7HoxOt4p7hB6YsGj3IlJgjkXkQuJ6SKzN1xLcF
   p5LA2f11yniOLeLj6escoB3/tZ6ous/hMFJQ2MUxXVg0KujvaRDe+Hi+y
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="306378060"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; 
   d="scan'208";a="306378060"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 04:15:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="960778489"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; 
   d="scan'208";a="960778489"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 25 Oct 2022 04:15:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1onHuC-001xlF-1b;
        Tue, 25 Oct 2022 14:15:36 +0300
Date:   Tue, 25 Oct 2022 14:15:36 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/2] drivers: fwnode: fix fwnode_irq_get_byname()
Message-ID: <Y1fFWPmsC3Y5KeM6@smile.fi.intel.com>
References: <cover.1666687086.git.mazziesaccount@gmail.com>
 <cc853a7e4b3533585e3641620bf4972663f22edc.1666687086.git.mazziesaccount@gmail.com>
 <Y1ep5zN+wifkP7v+@smile.fi.intel.com>
 <ec8cc1bd-3150-dc5d-8b8a-870f21b52433@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec8cc1bd-3150-dc5d-8b8a-870f21b52433@fi.rohmeurope.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 25, 2022 at 10:00:07AM +0000, Vaittinen, Matti wrote:
> On 10/25/22 12:18, Andy Shevchenko wrote:
> > On Tue, Oct 25, 2022 at 11:50:59AM +0300, Matti Vaittinen wrote:

...

> >> +	ret = fwnode_irq_get(fwnode, index);
> > 
> >> +
> > 
> > Redundant blank line and better to use traditional pattern: >
> >> +	if (!ret)
> >> +		return -EINVAL;
> >> +
> >> +	return ret;
> > 
> > 	if (ret)
> > 		return ret;
> > 
> > 	/* We treat mapping errors as invalid case */
> > 	return -EINVAL;
> > 
> >>   }
> 
> I like the added comment - but in this case I don't prefer the 
> "traditional pattern" you suggest. We do check for a very special error 
> case indicated by ret 0.
> 
> if (!ret)
> 	return -EINVAL;
> 
> makes it obvious the zero is special error.

I don't think so. It makes ! easily to went through the cracks. If you want an
explicit, use ' == 0' and add a comment.

> if (ret)
> 	return ret;
> 
> the traditional pattern makes this look like traditional error return - 
> which it is not. The comment you added is nice though. It could be just 
> before the check for
> 
> if (!ret).

-- 
With Best Regards,
Andy Shevchenko


