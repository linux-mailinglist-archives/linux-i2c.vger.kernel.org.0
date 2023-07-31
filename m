Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0A576A1C2
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jul 2023 22:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjGaUOh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jul 2023 16:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjGaUOg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Jul 2023 16:14:36 -0400
Received: from mgamail.intel.com (unknown [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D4610FB;
        Mon, 31 Jul 2023 13:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690834475; x=1722370475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FFX952CMmHVypnfUlKXfI3T6N0yQnCA83iAJd4eC0Xs=;
  b=atBC458a2LORK8PiWXfFNm5I1Eul2/2sU/ZzQiq50pUUSEV7GaPI+tiT
   DPVB7CeKwnYz8JjWV8o4At16oVidvwN35O8cpM7T3piyffd0PdEsG+sET
   kWm7zWGJYPLJgg8VNf3fLgdQmSUnxGZW96B21ZoEhIGeJ/G8HJMS5pm7V
   fUtPEtAHtpPOi1Ph/KJkiSXZZ8sT0SV8dVONUBvKzXv3BwOGBPlfKqAvr
   RYg5SVMaKepft7OjbUXDUKuWI0l2F4XkP37aSAe9YkiOGm0MTUagCUE47
   BxKEqZlMJEU5BGIIZJH0k8eAFV24tN4qr+SgzWz6ciXoy6l6+yjpk/4wa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="349414978"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="349414978"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 13:14:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="731693771"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="731693771"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 31 Jul 2023 13:14:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qQZHh-004Mx3-1R;
        Mon, 31 Jul 2023 23:14:29 +0300
Date:   Mon, 31 Jul 2023 23:14:29 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 1/9] i2c: designware: Move has_acpi_companion() to
 common code
Message-ID: <ZMgWJY3w/HhsZvVd@smile.fi.intel.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-2-andriy.shevchenko@linux.intel.com>
 <20230725214521.zxjqinryvva2zanx@intel.intel>
 <928d54c4-ec71-5f09-ed66-5f9c52aca6ba@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <928d54c4-ec71-5f09-ed66-5f9c52aca6ba@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 28, 2023 at 02:33:07PM +0300, Jarkko Nikula wrote:
> On 7/26/23 00:45, Andi Shyti wrote:
> > On Tue, Jul 25, 2023 at 05:30:15PM +0300, Andy Shevchenko wrote:

...

> > > -int i2c_dw_acpi_configure(struct device *device)
> > > +static void i2c_dw_acpi_do_configure(struct dw_i2c_dev *dev, struct device *device)
> 
> Because of this dual dev pointer obscurity which is cleaned in the next
> patch and Andi's comment below in my opinion it makes sense to combine
> patches 1 and 2.

Besides that these 2 are logically slightly different, the changes don't drop
the duality here. And there is also the other patch at the end of the series
that makes the below disappear.

Not sure that any of these would be the best approach (Git commit is cheap,
maintenance and backporting might be harder). So, ideas are welcome!

...

> > > +int i2c_dw_acpi_configure(struct device *device)
> > 
> > I was about to ask you why are we keeping this int, but then I
> > saw that you are making it void in the next patch :)

-- 
With Best Regards,
Andy Shevchenko


