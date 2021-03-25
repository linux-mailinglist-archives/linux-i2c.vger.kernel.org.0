Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0AD3495DA
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Mar 2021 16:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbhCYPn1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Mar 2021 11:43:27 -0400
Received: from mga17.intel.com ([192.55.52.151]:47173 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230182AbhCYPnI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Mar 2021 11:43:08 -0400
IronPort-SDR: wUY04yVc9r5Dt2yVUdv06++WwL3Q0S1Fn5UdPmVjTX/uhAOzx4cx8Z26rxVT2ij4Yp8praryLA
 UbEG+29Ytolw==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="170934499"
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; 
   d="scan'208";a="170934499"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2021 08:43:07 -0700
IronPort-SDR: 6cDUMbaEnJZLqHRvdoT0d0GkSb4BITKpu6dJzjYP8JaaGSm6+Gov4Gszx9MP0CTYesGS9+29nL
 Tz2QVy6bbxvQ==
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; 
   d="scan'208";a="391781738"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2021 08:43:05 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lPS8V-00G5YP-7p; Thu, 25 Mar 2021 17:43:03 +0200
Date:   Thu, 25 Mar 2021 17:43:03 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Gomez <daniel@qtec.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Add base addr info
Message-ID: <YFyvh3sqyVcg8Iqj@smile.fi.intel.com>
References: <20210325151248.1066643-1-daniel@qtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325151248.1066643-1-daniel@qtec.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 25, 2021 at 04:12:48PM +0100, Daniel Gomez wrote:
> Add i2c hw base address in the adapter name and when the device is
> probed.

Why?
We have /proc/iomem for that.

Sorry, I don't see value of this change.
Some comments  below just to let you know about style:ish issues.

...

>  	snprintf(adap->name, sizeof(adap->name),
> -		 "Synopsys DesignWare I2C adapter");
> +		 "Synopsys DesignWare I2C adapter at 0x%llx", dev->base_addr);

It actually should be resource_size_t and corresponding specifier, i.e. %pa to
print it. Moreover, we have %pR (and %pr) specifiers for struct resource.

...

> +	dev_info(&pdev->dev, "%s\n", adap->name);

Unneeded noise.

-- 
With Best Regards,
Andy Shevchenko


