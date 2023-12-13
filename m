Return-Path: <linux-i2c+bounces-759-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A457811424
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Dec 2023 15:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C33C0281317
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Dec 2023 14:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA432E651;
	Wed, 13 Dec 2023 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8vI+aer"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1F011B;
	Wed, 13 Dec 2023 06:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702476360; x=1734012360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lLDH5uYOeaQnhamK2tYMH/VlP6LJt6utjNNQt+hkSQU=;
  b=S8vI+aerwXaE8KcmxhaobIdvC45z+WfpYBgM7qu2ofRZ0GG349AF+j/m
   m2kCPmZowmogia1t/7AVD0JBnOtN7p1T+BiWxrJFBXAxW2BxCZZfstnaK
   PibbqCuEdxjxD7PtFWPlS+IBD8CnGvIroPbuyornGR2wJ9W7jlJLh7V85
   pxb9lXxepkF3r6CspmJzr6i2HuCEBJd6tsSG+j8c02/IoarEnxKMgWFpa
   2ZGpaYHA1fvePHTBbIMfvRFz8jiI04taZ5aJQQy7caob3ufktsa78pW7h
   tGypNUE7CzI5crV8u6gDkd+7p8MHI3l1nKV9J4zNzfHJtDpWqB35ym4zl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="426090697"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="426090697"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 06:06:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="767229612"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="767229612"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 06:05:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rDPs2-00000005Xgc-2rMy;
	Wed, 13 Dec 2023 16:05:54 +0200
Date: Wed, 13 Dec 2023 16:05:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH RFC v2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
Message-ID: <ZXm6QrRkyzGRg8SB@smile.fi.intel.com>
References: <20231212114746.183639-1-shinichiro.kawasaki@wdc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212114746.183639-1-shinichiro.kawasaki@wdc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 12, 2023 at 08:47:46PM +0900, Shin'ichiro Kawasaki wrote:
> p2sb_bar() unhides P2SB device to get resources from the device. It
> guards the operation by locking pci_rescan_remove_lock so that parallel
> rescans do not find the P2SB device. However, this lock causes deadlock
> when PCI bus rescan is triggered by /sys/bus/pci/rescan. The rescan
> locks pci_rescan_remove_lock and probes PCI devices. When PCI devices
> call p2sb_bar() during probe, it locks pci_rescan_remove_lock again.
> Hence the deadlock.
> 
> To avoid the deadlock, do not lock pci_rescan_remove_lock in p2sb_bar().
> Instead, do the lock at fs_initcall. Introduce p2sb_cache_resources()
> for fs_initcall which gets and caches the P2SB resources. At p2sb_bar(),
> refer the cache and return to the caller.

...

> +/* Cache BAR0 of P2SB device from function 0 ot 7 */
> +#define NR_P2SB_RES_CACHE 8

Here... (at least some better comment with TODO needs to be added,
and next patches can address that).

>  	struct resource *bar0 = &pdev->resource[0];

...and here... (okay, not exactly here, but with the same idea,
to use pci_resource_n() macro)

> +	if (!PCI_FUNC(devfn_p2sb)) {
> +		slot_p2sb = PCI_SLOT(devfn_p2sb);
> +		for (fn = 1; fn < 8; fn++)

...and here...

> +			p2sb_scan_and_cache(bus, PCI_DEVFN(slot_p2sb, fn));
> +	}

...and so on I gave comments. Any reason why they left unaddressed?

-- 
With Best Regards,
Andy Shevchenko



