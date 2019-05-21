Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E701256AE
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 19:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729055AbfEUR1a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 13:27:30 -0400
Received: from mga02.intel.com ([134.134.136.20]:63150 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728103AbfEUR1a (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 13:27:30 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 May 2019 10:27:29 -0700
X-ExtLoop1: 1
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga008.fm.intel.com with ESMTP; 21 May 2019 10:27:27 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hT8Xu-0001rC-JH; Tue, 21 May 2019 20:27:26 +0300
Date:   Tue, 21 May 2019 20:27:26 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     wsa@the-dreams.de, mika.westerberg@linux.intel.com,
        jarkko.nikula@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 4/5] i2c: core: Move ACPI gpio IRQ handling into
 i2c_acpi_get_irq
Message-ID: <20190521172726.GO9224@smile.fi.intel.com>
References: <20190521150502.27305-1-ckeepax@opensource.cirrus.com>
 <20190521150502.27305-5-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521150502.27305-5-ckeepax@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 21, 2019 at 04:05:01PM +0100, Charles Keepax wrote:
> It makes sense to contain all the ACPI IRQ handling in a single helper
> function.

> Note that this one is somewhat interesting, it seems the search
> through the resource list is done against the companion device
> of the adapter but the GPIO search is done against the companion
> device of the client. It feels to me like these really should
> be done on the same device, and certainly this is what SPI
> does (both against the equivalent of the adapter). Perhaps
> someone with more ACPI knowledge than myself could comment?

It would be interesting to see the path how you come to this conclusion.

>  	acpi_dev_free_resource_list(&resource_list);
>  
> +	if (*irq < 0)
> +		*irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(&client->dev), 0);

I think adev here is what we may use here.

You may put assert here and see if it happens when you test your series.

-- 
With Best Regards,
Andy Shevchenko


