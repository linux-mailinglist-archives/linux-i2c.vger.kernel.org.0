Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD5645F10A
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 16:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378263AbhKZPvN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Nov 2021 10:51:13 -0500
Received: from mga07.intel.com ([134.134.136.100]:56837 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237966AbhKZPtN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Nov 2021 10:49:13 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="299083269"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="299083269"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 07:43:32 -0800
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="458226709"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 07:43:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mqdNm-00ApEa-9w;
        Fri, 26 Nov 2021 17:43:26 +0200
Date:   Fri, 26 Nov 2021 17:43:26 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Peter Tyser <ptyser@xes-inc.com>,
        hdegoede@redhat.com, henning.schild@siemens.com
Subject: Re: [rfc, PATCH v1 0/7] PCI: introduce p2sb helper
Message-ID: <YaEAnri0yM3CgnbQ@smile.fi.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 08, 2021 at 02:20:13PM +0200, Andy Shevchenko wrote:
> There are a few users and even at least one more is coming
> that would like to utilize p2sb mechanisms like hide/unhide
> a device from PCI configuration space.
> 
> Here is the series to deduplicate existing users and provide
> a generic way for new comers.
> 
> It also includes a patch to enable GPIO controllers on Apollo Lake
> when it's used with ABL bootloader w/o ACPI support.
> 
> Please, comment on the approach and individual patches.
> 
> (Since it's cross subsystem, the PCI seems like a main one and
>  I think it makes sense to route it thru it with immutable tag
>  or branch provided for the others).

TWIMC, after refreshing (a bit) my memories on this thread, I think the roadmap
may look like the following:

1) exporting necessary APIs from PCI core to avoid code dup;
2) moving pci-p2sb.c out from PCI to PDx86 where it seems naturally fit;
3) addressing comments on patches that are not going to change their location /
functionality;
4) adding tags, etc.

Any objections?

Meanwhile I will try to setup a machine with ACPI tables to test the code if
they have not been provided.

-- 
With Best Regards,
Andy Shevchenko


