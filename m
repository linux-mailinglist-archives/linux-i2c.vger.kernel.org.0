Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 539822D5782
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 10:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgLJJrs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Dec 2020 04:47:48 -0500
Received: from mga14.intel.com ([192.55.52.115]:27571 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726175AbgLJJrs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Dec 2020 04:47:48 -0500
IronPort-SDR: FjNGE5mpDuOoxAfH3gAdlj/Q9ZekIn5b1YBvrkEzjDRWS2Ouf4RxkaYClkk9t0clTpo5E4kZO8
 m12gdaabGbeQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="173463891"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; 
   d="scan'208";a="173463891"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 01:45:50 -0800
IronPort-SDR: PQMS8dl52hunY4+QxrQl6rXLeZK/aj0ekWma2di9KBXTU6A370h7QbF3lyLFB3Ke5Z8cYo+KHR
 4n9rp/V1JqFw==
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; 
   d="scan'208";a="348720985"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 01:45:44 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1knIX8-00DNgG-Nh; Thu, 10 Dec 2020 11:46:46 +0200
Date:   Thu, 10 Dec 2020 11:46:46 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 3/3] i2c: designware: Fix indentation in the header
Message-ID: <20201210094646.GB4077@smile.fi.intel.com>
References: <20201208140337.33236-1-andriy.shevchenko@linux.intel.com>
 <20201208140337.33236-3-andriy.shevchenko@linux.intel.com>
 <20201209205242.GG3499@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209205242.GG3499@kunai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 09, 2020 at 09:52:42PM +0100, Wolfram Sang wrote:
> 
> > @@ -243,7 +243,7 @@ struct dw_i2c_dev {
> >  	struct clk		*clk;
> >  	struct clk		*pclk;
> >  	struct reset_control	*rst;
> > -	struct i2c_client		*slave;
> > +	struct i2c_client	*slave;
> >  	u32			(*get_clk_rate_khz) (struct dw_i2c_dev *dev);
> >  	int			cmd_err;
> >  	struct i2c_msg		*msgs;
> 
> What about using just a single space after the type? Won't need an
> update ever again.

Maybe, but this is really so minor patch, so if you are okay with other two
(that have more importance) drop this one.

-- 
With Best Regards,
Andy Shevchenko


