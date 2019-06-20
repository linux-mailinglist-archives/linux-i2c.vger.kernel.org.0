Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA0254D113
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 16:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfFTO7y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 10:59:54 -0400
Received: from mga11.intel.com ([192.55.52.93]:54140 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726530AbfFTO7y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jun 2019 10:59:54 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jun 2019 07:59:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,397,1557212400"; 
   d="scan'208";a="168538290"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Jun 2019 07:59:51 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hdyXW-0001Om-Me; Thu, 20 Jun 2019 17:59:50 +0300
Date:   Thu, 20 Jun 2019 17:59:50 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     wsa@the-dreams.de, mika.westerberg@linux.intel.com,
        jarkko.nikula@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v5 4/7] i2c: core: Make i2c_acpi_get_irq available to the
 rest of the I2C core
Message-ID: <20190620145950.GE9224@smile.fi.intel.com>
References: <20190620133420.4632-1-ckeepax@opensource.cirrus.com>
 <20190620133420.4632-5-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620133420.4632-5-ckeepax@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 20, 2019 at 02:34:17PM +0100, Charles Keepax wrote:
> In preparation for more refactoring make i2c_acpi_get_irq available
> outside i2c-core-acpi.c.

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

I'm not sure Rb tags are suitable for patches 4 and 5 since the changes made.

> +struct acpi_device;

Hmm... Doesn't acpi.h define that for !ACPI case?

>  #ifdef CONFIG_ACPI
>  const struct acpi_device_id *
>  i2c_acpi_match_device(const struct acpi_device_id *matches,
>  		      struct i2c_client *client);
>  void i2c_acpi_register_devices(struct i2c_adapter *adap);
> +
> +int i2c_acpi_get_irq(struct acpi_device *adev);

Since you call this afterwards with struct device from which companion is
derived, can't we directly use struct device as a parameter?

Yes, in case of adev call, it might be &adev->dev I suppose?

-- 
With Best Regards,
Andy Shevchenko


