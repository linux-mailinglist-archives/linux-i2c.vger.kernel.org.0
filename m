Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1336030A585
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Feb 2021 11:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233272AbhBAKjD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Feb 2021 05:39:03 -0500
Received: from mga18.intel.com ([134.134.136.126]:43133 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233242AbhBAKiz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Feb 2021 05:38:55 -0500
IronPort-SDR: VVLDmcItlylhs0g86KWxxbqTk7OEhbFYVtIMTU/pUjNMhlV5SOHw0ZaHnpQ0FSmbD647ed3Teb
 d+27pFInF+ZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="168347518"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="168347518"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 02:37:06 -0800
IronPort-SDR: /876IjFDJlCOzFypiDcR0u3iF/YEGarL35O7Qbs88t/+KrLDk2yTTpDwITx9iyL7HZ/0qW5pwi
 QOO440FYWdmw==
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="432284886"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 02:37:04 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l6WZp-0016NI-Sy; Mon, 01 Feb 2021 12:37:01 +0200
Date:   Mon, 1 Feb 2021 12:37:01 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     mail@richard-neumann.de
Cc:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: i2c-amd-mp2: Remove NIH logging functions
Message-ID: <YBfZzUHx4UpRwhM9@smile.fi.intel.com>
References: <20210129192553.55906-1-mail@richard-neumann.de>
 <20210129192553.55906-2-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210129192553.55906-2-mail@richard-neumann.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 29, 2021 at 08:25:52PM +0100, mail@richard-neumann.de wrote:
> From: Richard Neumann <mail@richard-neumann.de>

Thanks for an update, my comments below.

> Use pci_{info,warn,err,dbg} functions of the kernel's PCI API.
> Remove unnecessary ndev_pdev, ndev_name and ndev_dev macros.

"ndev_pdev(), ndev_name() and ndev_dev()"

> Remove useless __func__ from logging.


"While at it, remove..."

...

> -		dev_err(ndev_dev(privdata),
> +		pci_err(pdev,
>  			"length %d in event doesn't match buffer length %d!\n",

Can be one line, but it's up to you (checkpatch won't scream on this).
Same comment for other similar cases.

>  			len, i2c_common->msg->len);

...

>  	struct pci_dev *pci_dev = to_pci_dev(dev);
>  	struct amd_mp2_dev *privdata = pci_get_drvdata(pci_dev);
> +	struct pci_dev *pdev = privdata->pci_dev;

I guess it's a bit overkill. You already have pci_dev above. Isn't it enough?

...

> +		pci_err(pdev, "pci_save_state failed = %d\n", ret);

And here pci_dev will be still okay and fit 80 limit.

-- 
With Best Regards,
Andy Shevchenko


