Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A720C5465BA
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jun 2022 13:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345336AbiFJLhX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jun 2022 07:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349403AbiFJLgV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Jun 2022 07:36:21 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3969B7379F;
        Fri, 10 Jun 2022 04:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654860980; x=1686396980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BaJK94QL2EJ4pVw/Z5IuDzny/xtsePE9Jfqj65UM6Eo=;
  b=TNnIxDKAY2fRPk7FUz7pvykn8wPdkkZCU8/KhrQgf1jmTOD20DsWXYDJ
   QPbT6xGpwPlbfxXoquXeyZhTsaZuEGqtcJ/t84XfcZRwxMI6CMRqQzJ6h
   bmGbNTeu+Tllbg8Pwlc2WnqPbcNOdS9KwwrZdx3IseswwimUKKaryFRyQ
   wkpSj6IvUo9xzrC69cilxoq5447EpTxNJYvoXgg0J0cOB9PSf/OwoyWLZ
   6sS4BsIIk6IV7u5AB7nQW4YjQBkyKr5MQUZ4KlK2cB1tfrGxWGEFKsLnl
   Vrnhiv/BPZ0gN0isW3dZERjukDHJxB2frZGr5enV88XloyvYjDR3mHSQV
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="341664632"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="341664632"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 04:36:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="724928331"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 04:36:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nzcw0-000YjT-06;
        Fri, 10 Jun 2022 14:36:12 +0300
Date:   Fri, 10 Jun 2022 14:36:11 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv2 1/2] i2c: designware: introduce a custom scl recovery
 for SoCFPGA platforms
Message-ID: <YqMsqwLgbI4AuzrE@smile.fi.intel.com>
References: <20220524135441.420600-1-dinguyen@kernel.org>
 <Yo0LKQchQwitJVHm@smile.fi.intel.com>
 <29521c9c-90d3-03b9-cf6f-8519efcd007e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29521c9c-90d3-03b9-cf6f-8519efcd007e@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 01, 2022 at 08:48:07AM -0500, Dinh Nguyen wrote:
> On 5/24/22 11:43, Andy Shevchenko wrote:
> > On Tue, May 24, 2022 at 08:54:40AM -0500, Dinh Nguyen wrote:

...

> > > +	switch (dev->flags & MODEL_MASK) {
> > > +	case MODEL_SOCFPGA:
> > > +		rinfo->recover_bus = i2c_socfpga_scl_recovery;
> > > +		break;
> > > +	default:
> > > +		rinfo->recover_bus = i2c_generic_scl_recovery;
> > > +		break;
> > > +	}
> > 
> > > +	adap->bus_recovery_info = rinfo;
> > 
> > Usually we do not assign the pointer while data structure is incomplete.
> > That's said, please leave this line as it was.
> > 
> > On top of that, why you can't move the above switch to the place where old
> > function was assigned?
> 
> The reason is the assignment of the recover_bus needs to get done before the
> call to devm_gpiod_get_optional(), otherwise, the assignment is not taking
> place because of an error after returning from devm_gpiod_get_optional().

Update commit message accordingly then.

Also consider moving GPIO request part in the code, maybe it will bring better
looking / grouped code. Try and see, then choose the best one.

-- 
With Best Regards,
Andy Shevchenko


