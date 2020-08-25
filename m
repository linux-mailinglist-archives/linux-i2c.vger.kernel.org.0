Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0D9251653
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 12:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729680AbgHYKNF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 06:13:05 -0400
Received: from mga05.intel.com ([192.55.52.43]:55684 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728117AbgHYKNF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 06:13:05 -0400
IronPort-SDR: mRfI0WzEaPJf3dX8NqxB9y2/MfDXNdnp1Cr3dw64YIILF8OEv/1iYfytHDsLpUYdp5NUdAqSsY
 sSn9NmdOSWNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="240900001"
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; 
   d="scan'208";a="240900001"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2020 03:13:02 -0700
IronPort-SDR: pAgMYKba8fAQ2jnHsx3oty0pmFiBGyZ58Ze90jUe141Whyc2oS1JJt7Hdi6F52BcIgOS3CPv/X
 TVoE6ZsiIp1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; 
   d="scan'208";a="328818795"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 25 Aug 2020 03:12:55 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kAVwi-00BIcD-RN; Tue, 25 Aug 2020 13:12:52 +0300
Date:   Tue, 25 Aug 2020 13:12:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 1/2] i2c: core: Don't fail PRP0001 enumeration when no
 ID table exist
Message-ID: <20200825101252.GT1891694@smile.fi.intel.com>
References: <20200821170334.43555-1-andriy.shevchenko@linux.intel.com>
 <20200825072314.GD1861@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200825072314.GD1861@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 25, 2020 at 09:23:14AM +0200, Wolfram Sang wrote:
> On Fri, Aug 21, 2020 at 08:03:33PM +0300, Andy Shevchenko wrote:
> > When commit c64ffff7a9d1 ("i2c: core: Allow empty id_table in ACPI case
> > as well") fixed the enumeration of I²C devices on ACPI enabled platforms
> > when driver has no ID table, it missed the PRP0001 support.
> > 
> > i2c_device_match() and i2c_acpi_match_device() differently match
> > driver against given device. Use acpi_driver_match_device(), that is used
> > in the former, in i2c_device_probe() and don't fail PRP0001 enumeration
> > when no ID table exist.
> > 
> > Fixes: c64ffff7a9d1 ("i2c: core: Allow empty id_table in ACPI case as well")
> > BugLink: https://stackoverflow.com/q/63519678/2511795
> 
> You are monitoring SO? Nice.

Monitoring is probably too strong word here, rather sometimes looking for
interesting topics (mostly related to ACPI + Linux (kernel) and near to them).

This makes me wonder how many commits are actually referring to SO.
The 1st one I found is 8c88f87cb27a ("netfilter: nfnetlink_queue: add NAT TCP
sequence adjustment if packet mangled"). Some of them referring stackexchange
site, but not many (brief estimation like a couple of dozens at most).

> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Applied to for-current, thanks!

Thanks!

-- 
With Best Regards,
Andy Shevchenko


