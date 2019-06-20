Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3574B4D0FF
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 16:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731682AbfFTOyh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 10:54:37 -0400
Received: from mga07.intel.com ([134.134.136.100]:32281 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726686AbfFTOyh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jun 2019 10:54:37 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jun 2019 07:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,397,1557212400"; 
   d="scan'208";a="183091685"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga004.fm.intel.com with ESMTP; 20 Jun 2019 07:54:33 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hdySO-0001MZ-M0; Thu, 20 Jun 2019 17:54:32 +0300
Date:   Thu, 20 Jun 2019 17:54:32 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     wsa@the-dreams.de, mika.westerberg@linux.intel.com,
        jarkko.nikula@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v5 3/7] i2c: acpi: Factor out getting the IRQ from ACPI
Message-ID: <20190620145432.GD9224@smile.fi.intel.com>
References: <20190620133420.4632-1-ckeepax@opensource.cirrus.com>
 <20190620133420.4632-4-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620133420.4632-4-ckeepax@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 20, 2019 at 02:34:16PM +0100, Charles Keepax wrote:
> In preparation for future refactoring factor out the fetch of the IRQ
> into its own helper function.

> +static int i2c_acpi_get_irq(struct acpi_device *adev)
> +{
> +	struct list_head resource_list;
> +	int irq = -ENOENT;
> +	int ret;
> +
> +	INIT_LIST_HEAD(&resource_list);
> +
> +	ret = acpi_dev_get_resources(adev, &resource_list,
> +				     i2c_acpi_add_resource, &irq);
> +	if (ret < 0)

> +		return -EINVAL;

Can't we return ret value?

> +
> +	acpi_dev_free_resource_list(&resource_list);
> +
> +	return irq;
> +}

> +	ret = i2c_acpi_get_irq(adev);
> +	if (ret > 0)
> +		info->irq = ret;

And on error we do not bail out. This changes the behaviour.

-- 
With Best Regards,
Andy Shevchenko


