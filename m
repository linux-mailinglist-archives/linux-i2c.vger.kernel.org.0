Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E32DE60C7ED
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 11:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbiJYJXa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 05:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbiJYJWu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 05:22:50 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C9D11143;
        Tue, 25 Oct 2022 02:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666689516; x=1698225516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WSlcowHN6Wq7+NjnXUQwOTVXdTNBu8zi0Wfnmzb3i0E=;
  b=hAEzo6xQholThH5HW9nt0XWzZxqnQpbh60U392Gr7XnkR68DXVsFV5Nj
   1yFSLUQ/53+QlOhOYGPXf+RZxGQWPlJ5nWzkj2HjnmUE10lYtpsHjmvLc
   52Xi0N8jGEtc+fY5Wmu/hYlZga7S+DyqYsgZ+RyUgUiKeKOxBLJ74T6vU
   M3Y5YI9XUkX7CcBSkWfVSMiRqpOl4SxkfqyXXsLb8iOGwysevQSv/4eW4
   bg+qgezcEr3c8rUVMpWajgrLJKNkmMi2gnQWMWyr77HgmpIMJrCVV9yCw
   e6eW6Pg5SmsXDvG0FEyuI67fWdnaCkirBg/69YAB6EQbuvrNV/xo18kWp
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="371844818"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; 
   d="scan'208";a="371844818"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 02:18:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="720786423"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; 
   d="scan'208";a="720786423"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Oct 2022 02:18:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1onG4t-001v5D-1l;
        Tue, 25 Oct 2022 12:18:31 +0300
Date:   Tue, 25 Oct 2022 12:18:31 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] drivers: fwnode: fix fwnode_irq_get_byname()
Message-ID: <Y1ep5zN+wifkP7v+@smile.fi.intel.com>
References: <cover.1666687086.git.mazziesaccount@gmail.com>
 <cc853a7e4b3533585e3641620bf4972663f22edc.1666687086.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc853a7e4b3533585e3641620bf4972663f22edc.1666687086.git.mazziesaccount@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 25, 2022 at 11:50:59AM +0300, Matti Vaittinen wrote:
> The fwnode_irq_get_byname() does return 0 upon device-tree IRQ mapping
> failure. This is contradicting the function documentation and can
> potentially be a source of errors like:
> 
> int probe(...) {
> 	...
> 
> 	irq = fwnode_irq_get_byname();
> 	if (irq <= 0)
> 		return irq;
> 
> 	...
> }
> 
> Here we do correctly check the return value from fwnode_irq_get_byname()
> but the driver probe will now return success. (There was already one
> such user in-tree).
> 
> Change the fwnode_irq_get_byname() to work as documented and according to
> the common convention and abd always return a negative errno upon failure.

...

> +	ret = fwnode_irq_get(fwnode, index);

> +

Redundant blank line and better to use traditional pattern:

> +	if (!ret)
> +		return -EINVAL;
> +
> +	return ret;

	if (ret)
		return ret;

	/* We treat mapping errors as invalid case */
	return -EINVAL;

>  }

-- 
With Best Regards,
Andy Shevchenko


