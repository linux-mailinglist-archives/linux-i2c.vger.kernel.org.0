Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 938674A0158
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 21:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351020AbiA1UDU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 15:03:20 -0500
Received: from mga05.intel.com ([192.55.52.43]:28403 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234277AbiA1UDS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Jan 2022 15:03:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643400198; x=1674936198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3CBqo9wC6SYWLiBJXSytiwe5Oe58CLW3FLA0qDovUXU=;
  b=jkJceV0cge9mXLXtGwQxnjg/l9Kc2WYVUpTX/ceY/uwa/JWvQa9F0xKV
   QROttXf37r9CDCGtlzdRKbjRJSou4tCExiJmTshB7Hflfpx5fOcPbCSrE
   +S9GooJ5SggxLv4aV5qwjDfaEkoxXmfB8+AVI97uuZa/xisA7sUjZKazn
   lKTSxbh/vMwdM7Ow1OMKUKMg4naDfpun7IEyjqXBn7H2pPkTh8mEEGpIr
   hj15kUvBZMlZpc8Uh/JuLJjHI/5YCwIMJ29HsCue5lW6dst7GOOn4SBHu
   tNLkGgBrU9uKCchHlQ3PKGRLidgtFs+2muQ70sh/BYEzpADCYy03aD9jU
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="333541639"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="333541639"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 12:02:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; 
   d="scan'208";a="675188885"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 12:02:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nDXQj-00FYpG-UB;
        Fri, 28 Jan 2022 22:01:09 +0200
Date:   Fri, 28 Jan 2022 22:01:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v3 7/8] mfd: lpc_ich: Add support for pinctrl in non-ACPI
 system
Message-ID: <YfRLhWwcf9CfKwSN@smile.fi.intel.com>
References: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
 <20211221181526.53798-8-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221181526.53798-8-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 21, 2021 at 08:15:25PM +0200, Andy Shevchenko wrote:
> From: Tan Jui Nee <jui.nee.tan@intel.com>
> 
> Add support for non-ACPI systems, such as system that uses
> Advanced Boot Loader (ABL) whereby a platform device has to be created
> in order to bind with pin control and GPIO.
> 
> At the moment, Intel Apollo Lake In-Vehicle Infotainment (IVI) system
> requires a driver to hide and unhide P2SB to lookup P2SB BAR and pass
> the PCI BAR address to GPIO.

Lee, are you fine with this change? I hope I fixed all your comments.

-- 
With Best Regards,
Andy Shevchenko


