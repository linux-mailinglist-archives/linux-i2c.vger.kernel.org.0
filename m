Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF6C47E60A
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Dec 2021 16:51:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244401AbhLWPva (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Dec 2021 10:51:30 -0500
Received: from mga06.intel.com ([134.134.136.31]:2305 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244370AbhLWPva (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Dec 2021 10:51:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640274690; x=1671810690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j4iZItxZ2BxTM71Q87vzlDzfOxMVH+tmwKqt3WZaTzQ=;
  b=Ji+0nbaxdiX6YXmAc0dfic27WqrdpgRnLm8ar1tTeRAWaSeKKJpZdF5Y
   IeJvX3WrNIM/tYZXIkYcPQ/thjfz5yGLypU4FKYKyQ5CTS2xpTQaFyOal
   JjYqQkuqdBHW2yD+SVAlGKqTcdl9Lps124I9BLVs/dB/36K7wBra8w3OO
   +FvHtBrEJdLbZYVO6lKlMg+AhE+UdGWmfw9MfmJCpUEI4+dqKql9V/39B
   TMr3xwCXPB+Mxx0MlZtnKIw6Ux/RXuLJ+B1jPJZ0D3CKlYGFk7VrL4BLc
   T2TSbT3gSR8kfx5l8HU3pIi4xjXc6Wxt/saBJDg6bE40XRRIp+Elk9uYt
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="301606655"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; 
   d="scan'208";a="301606655"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2021 07:51:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; 
   d="scan'208";a="614231222"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2021 07:51:26 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1n0QLy-001IlW-GD;
        Thu, 23 Dec 2021 17:50:02 +0200
Date:   Thu, 23 Dec 2021 17:50:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Dabros <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, upstream@semihalf.com
Subject: Re: [RFC 1/2] i2c: designware: Add missing locks
Message-ID: <YcSaqmlI7l4H1lsN@smile.fi.intel.com>
References: <20211222094558.2098791-1-jsd@semihalf.com>
 <20211222094558.2098791-2-jsd@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211222094558.2098791-2-jsd@semihalf.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 22, 2021 at 10:45:57AM +0100, Jan Dabros wrote:
> All accesses to controller's registers should be protected on
> probe, disable and xfer paths. This is needed for i2c bus controllers
> that are shared with but not controlled by kernel.

...

> +	ret = i2c_dw_acquire_lock(dev);
> +	if (ret)
> +		return ret;
> +
>  	ret = regmap_read(dev->map, DW_IC_COMP_PARAM_1, &param);
>  	if (ret)
>  		return ret;
> +	i2c_dw_release_lock(dev);

Not sure this part is fully correct. Please, fix the leakage.

...

> +	ret = i2c_dw_acquire_lock(dev);
> +	if (ret)
> +		return;
>  
>  	/* Disable controller */
>  	__i2c_dw_disable(dev);
> @@ -614,6 +624,8 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
>  	/* Disable all interrupts */
>  	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
>  	regmap_read(dev->map, DW_IC_CLR_INTR, &dummy);

> +	i2c_dw_release_lock(dev);

Not enough context here, bu I believe there is the same issue(s).

-- 
With Best Regards,
Andy Shevchenko


