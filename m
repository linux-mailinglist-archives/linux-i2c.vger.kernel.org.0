Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66619308CCC
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jan 2021 19:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232561AbhA2Swt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Jan 2021 13:52:49 -0500
Received: from mga06.intel.com ([134.134.136.31]:5577 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232208AbhA2Sws (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 Jan 2021 13:52:48 -0500
IronPort-SDR: 0hOXklQmb3zYtTBIAvTmNYQXROyy2whAKcAvjWXa+IxvuIC3mowFnAdJWTuULNPivDrLRbUTuv
 6LCzgmHVjIQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9879"; a="241987896"
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; 
   d="scan'208";a="241987896"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2021 10:50:57 -0800
IronPort-SDR: 1MknLL+aUY6DrFLl+47vBo+oyivvyjNpwQVYau+01mQ+INVKlm0ClsbDNshtXIZ8esmF1fw06j
 xGcoQyj5fM0w==
X-IronPort-AV: E=Sophos;i="5.79,386,1602572400"; 
   d="scan'208";a="431125277"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2021 10:50:55 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l5Yr6-000S8i-Os; Fri, 29 Jan 2021 20:50:52 +0200
Date:   Fri, 29 Jan 2021 20:50:52 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     mail@richard-neumann.de
Cc:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] Removed NIH log functions
Message-ID: <YBRZDDmVll2iCudM@smile.fi.intel.com>
References: <20210129182606.41518-1-mail@richard-neumann.de>
 <20210129182606.41518-2-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210129182606.41518-2-mail@richard-neumann.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 29, 2021 at 07:26:05PM +0100, mail@richard-neumann.de wrote:
> From: Richard Neumann <mail@richard-neumann.de>

Thanks for the patch, my comments below.

> Removed unnecessary ndev_pdev, ndev_name and ndev_dev macros.
> Using pci_{info,warn,err,dbg} functions of the kernel's PCI API.

First of all Subject should be in imperative mode with corresponding prefix,
something like: "i2c: amd-mp2: Remove NIH logging functions". Same to the rest
of the series.

While at it, drop useless __func__ parameters.

...

> -	dev_dbg(ndev_dev(privdata), "%s id: %d\n", __func__,
> +	pci_dbg(privdata->pci_dev, "%s id: %d\n", __func__,
>  		i2c_common->bus_id);

E.g. this will become one line after dropping __func__.

...

Also in some cases, like here, you may consider simple trick to reduce amount
of LOCs.

	struct pci_dev *pdev = privdata->pci_dev;

>  		if (res != command_failed)
> -			dev_err(ndev_dev(privdata), "invalid response to i2c command!\n");

> +			pci_err(privdata->pci_dev,
> +				"invalid response to i2c command!\n");

			pci_err(pdev, "invalid response to i2c command!\n");

>  		return;

-- 
With Best Regards,
Andy Shevchenko


