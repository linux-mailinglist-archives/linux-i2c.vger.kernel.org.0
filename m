Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF1E1FBBF3
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jun 2020 18:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729321AbgFPQlF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 12:41:05 -0400
Received: from mga07.intel.com ([134.134.136.100]:41184 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729128AbgFPQlF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 16 Jun 2020 12:41:05 -0400
IronPort-SDR: qmZyRixgNGHyu/UWp921TM85C6Ta/qcy4FvXhNRQsSHMZUVjPC7/eAx2h0PtIOHBGzA026ox9D
 8ZraUZeuj3GQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 09:41:03 -0700
IronPort-SDR: vOTL9Z9BRo/G3pbkgYs1YGSfddmO6CUcxYjGuz7mKVEO6WPdtEplFfuA7hAAj5snw1hRJWTyYh
 KkAHxDxAyDCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; 
   d="scan'208";a="298972651"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2020 09:40:59 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jlEdx-00DsI7-UL; Tue, 16 Jun 2020 19:41:01 +0300
Date:   Tue, 16 Jun 2020 19:41:01 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sultan Alsawaf <sultan@kerneltoast.com>,
        Andi Shyti <andi.shyti@intel.com>
Cc:     jarkko.nikula@linux.intel.com, aaron.ma@canonical.com,
        admin@kryma.net, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com, jikos@kernel.org,
        kai.heng.feng@canonical.com, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com,
        wsa@kernel.org
Subject: Re: [PATCH v2] HID: i2c-hid: Use block reads when possible to save
 power
Message-ID: <20200616164101.GY2428291@smile.fi.intel.com>
References: <c4373272-e656-773c-dfd2-0efc4c53c92d@linux.intel.com>
 <20200616154951.3050-1-sultan@kerneltoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616154951.3050-1-sultan@kerneltoast.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 16, 2020 at 08:49:51AM -0700, Sultan Alsawaf wrote:
> From: Sultan Alsawaf <sultan@kerneltoast.com>
> 
> We have no way of knowing how large an incoming payload is going to be,
> so the only strategy available up until now has been to always retrieve
> the maximum possible report length over i2c, which can be quite
> inefficient. For devices that send reports in block read format, the i2c
> controller driver can read the payload length on the fly and terminate
> the i2c transaction early, resulting in considerable power savings.
> 
> On a Dell Precision 15 5540 with an i9-9880H, resting my finger on the
> touchpad causes psys power readings to go up by about 4W and hover there
> until I remove my finger. With this patch, my psys readings go from 4.7W
> down to 3.1W, yielding about 1.6W in savings. This is because my
> touchpad's max report length is 60 bytes, but all of the regular reports
> it sends for touch events are only 32 bytes, so the i2c transfer is
> roughly halved for the common case.

> +	/* Try to do a block read if the size fits in one byte */
> +	flags = size > 255 ? I2C_M_RD : I2C_M_RD | I2C_M_RECV_LEN;

AFAIR SMBus specification tells about 256. Why 255?

Andi, am I correct?

-- 
With Best Regards,
Andy Shevchenko


