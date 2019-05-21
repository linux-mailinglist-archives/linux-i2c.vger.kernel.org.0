Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81C6525675
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 19:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbfEURTA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 13:19:00 -0400
Received: from mga04.intel.com ([192.55.52.120]:31767 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727969AbfEURTA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 13:19:00 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 May 2019 10:18:58 -0700
X-ExtLoop1: 1
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga008.jf.intel.com with ESMTP; 21 May 2019 10:18:55 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hT8Pf-0001nL-47; Tue, 21 May 2019 20:18:55 +0300
Date:   Tue, 21 May 2019 20:18:55 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     wsa@the-dreams.de, mika.westerberg@linux.intel.com,
        jarkko.nikula@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com, jbroadus@gmail.com,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 3/5] i2c: core: Move ACPI IRQ handling to probe time
Message-ID: <20190521171855.GN9224@smile.fi.intel.com>
References: <20190521150502.27305-1-ckeepax@opensource.cirrus.com>
 <20190521150502.27305-4-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521150502.27305-4-ckeepax@opensource.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 21, 2019 at 04:05:00PM +0100, Charles Keepax wrote:
> Bring the ACPI path in sync with the device tree path and handle all the
> IRQ fetching at probe time. This leaves the only IRQ handling at device
> registration time being that which is passed directly through the board
> info as either a resource or an actual IRQ number.

> -static int i2c_acpi_get_irq(struct acpi_device *adev, int *irq)
> +int i2c_acpi_get_irq(struct i2c_client *client, int *irq)

Instead of ping-pong style of the programming, I would rather do this in the
same patch, where you introduce a helper (patch 2 I suppose, after my comments
against current patch 2 in the series).

Also possible to split exporting itself to a separate patch.

-- 
With Best Regards,
Andy Shevchenko


