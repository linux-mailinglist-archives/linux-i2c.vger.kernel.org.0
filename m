Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89B9639E278
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 18:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbhFGQRM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 12:17:12 -0400
Received: from mga09.intel.com ([134.134.136.24]:29221 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232256AbhFGQQD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Jun 2021 12:16:03 -0400
IronPort-SDR: pHwmMxBdgPCN6jy6rFjauZs/75xXGamXdDFLiRUrClgQ9XH57dQNWIQFo+fWJWdsrQWR7+u+sC
 YByao0CMe6jw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204621543"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="204621543"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 09:13:11 -0700
IronPort-SDR: LPkEaiTaEwTQYTVhOFTdUrrVJgyekxvCeyiHmd4JiWfwL+vo0huD8rTYtR/qyeyrkviPQfz3SM
 hH0k+yS4d3jQ==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="484830331"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 09:13:05 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lqHs6-000Ibv-V4; Mon, 07 Jun 2021 19:13:02 +0300
Date:   Mon, 7 Jun 2021 19:13:02 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     helgaas@kernel.org, corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        bhelgaas@google.com, wsa@kernel.org, Sanket.Goswami@amd.com,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/4] Documentation: devres: Add
 pcim_alloc_irq_vectors()
Message-ID: <YL5FjkbgKj8XpDzD@smile.fi.intel.com>
References: <20210607153916.1021016-1-zhengdejin5@gmail.com>
 <20210607153916.1021016-3-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607153916.1021016-3-zhengdejin5@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 07, 2021 at 11:39:14PM +0800, Dejin Zheng wrote:
> Add pcim_alloc_irq_vectors(), a device-managed version of
> pci_alloc_irq_vectors(). introducing this function can simplify
> the error handling path in many drivers.

This is good one, thanks.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Reviewed-by: Robert Richter <rric@kernel.org>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
> v6 -> v7:
> 	- rebase to PCI next branch
> v5 -> v6:
> 	- rebase to 5.13-rc4
> v4 -> v5:
> 	- No change
> v3 -> v4:
> 	- No change
> v2 -> v3:
> 	- No change
> v1 -> v2:
> 	- Modify some commit messages.
> 
>  Documentation/driver-api/driver-model/devres.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
> index e0814d214048..fad7d26ccf35 100644
> --- a/Documentation/driver-api/driver-model/devres.rst
> +++ b/Documentation/driver-api/driver-model/devres.rst
> @@ -382,6 +382,7 @@ PCI
>    devm_pci_alloc_host_bridge()  : managed PCI host bridge allocation
>    devm_pci_remap_cfgspace()	: ioremap PCI configuration space
>    devm_pci_remap_cfg_resource()	: ioremap PCI configuration space resource
> +  pcim_alloc_irq_vectors()      : managed IRQ vectors allocation
>    pcim_enable_device()		: after success, all PCI ops become managed
>    pcim_pin_device()		: keep PCI device enabled after release
>  
> -- 
> 2.30.1
> 

-- 
With Best Regards,
Andy Shevchenko


