Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA8C31BA3D
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Feb 2021 14:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhBONWr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Feb 2021 08:22:47 -0500
Received: from mga09.intel.com ([134.134.136.24]:54806 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229738AbhBONWl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Feb 2021 08:22:41 -0500
IronPort-SDR: 5jBAlANxipkf5eOocuv2V7NkcF7OZIE/Vv3P+XveSSSUDn7wTLp2Nq/FBlFNXR7axhMEGuCrOa
 uwd4xrhq/xMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9895"; a="182809238"
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="182809238"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 05:20:46 -0800
IronPort-SDR: ni4OXckW4L+aJIPdFOZ9pQkZww/w+Syf7XCWV9NFEfkw6YP2EviRHCjcNvYDlLHEuUnsMW7ERK
 jSGAVmIJd+WA==
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="492734902"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 05:20:43 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lBdns-005CPw-In; Mon, 15 Feb 2021 15:20:40 +0200
Date:   Mon, 15 Feb 2021 15:20:40 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH i2c-next] i2c: designware: Consolidate
 pci_free_irq_vectors to a single place
Message-ID: <YCp1KL/+YYxmr7vO@smile.fi.intel.com>
References: <20210214064529.481341-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210214064529.481341-1-zhengdejin5@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Feb 14, 2021 at 02:45:29PM +0800, Dejin Zheng wrote:
> Consolidate pci_free_irq_vectors to a single place using "goto free_irq"
> for simplify the code.

One nit below, after addressing:
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +free_irq:

It's quite confusing name. I would expect to see here (with current proposal)
*free_irq() call, but no, I don't see a such.

Please, change to something like
	err_pci_free_irq_vectors:
or alternatively
	err_free_irq_vectors:
however I think first one is disambiguous.

> +	pci_free_irq_vectors(pdev);
> +	return r;

-- 
With Best Regards,
Andy Shevchenko


