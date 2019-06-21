Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87EF84E7EF
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2019 14:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfFUMYM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jun 2019 08:24:12 -0400
Received: from mga12.intel.com ([192.55.52.136]:50710 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726229AbfFUMYM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Jun 2019 08:24:12 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jun 2019 05:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,400,1557212400"; 
   d="scan'208";a="165637488"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga006.jf.intel.com with ESMTP; 21 Jun 2019 05:24:08 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1heIaM-0004Pm-Ra; Fri, 21 Jun 2019 15:24:06 +0300
Date:   Fri, 21 Jun 2019 15:24:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     wsa@the-dreams.de, mika.westerberg@linux.intel.com,
        jarkko.nikula@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v6 4/7] i2c: core: Make i2c_acpi_get_irq available to the
 rest of the I2C core
Message-ID: <20190621122406.GL9224@smile.fi.intel.com>
References: <20190621100815.12417-1-ckeepax@opensource.cirrus.com>
 <20190621100815.12417-5-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621100815.12417-5-ckeepax@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 21, 2019 at 11:08:12AM +0100, Charles Keepax wrote:
> In preparation for more refactoring make i2c_acpi_get_irq available
> outside i2c-core-acpi.c.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Changes since v5:
>  - Pass a struct device rather than acpi_device to i2c_acpi_get_irq,
>    note this is more awkward than I would have liked as I am very
>    unconvinced that adev->dev can actually be passed to
>    ACPI_COMPANION. If anyone can answer that for sure that would be
>    very helpful.

Sounds you are right. I stand corrected.
We can not use ACPI_COMPANION() against &adev->dev.

-- 
With Best Regards,
Andy Shevchenko


