Return-Path: <linux-i2c+bounces-1022-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB9D81F094
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 17:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AFA3282513
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 16:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C16A4315C;
	Wed, 27 Dec 2023 16:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vex9RYbc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0762576B;
	Wed, 27 Dec 2023 16:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703695682; x=1735231682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1S//I1qTPuzHOA3iYZdTpiYZT9ONAqYRed/MKdU5pdA=;
  b=Vex9RYbc/wH8VhakEUcMLVOGxHHpja52U9+RfbDKnD05bpGIArbZVm5s
   Hgeil/rklvtJG4PAxWE3vhgDm7FkHHBuy4VM5fDXTmHcuDsv7hOEMfFG6
   oVpHXV66vFJPBpgjBPSaWZMaoXDVgp8lge/lxVeGZ3t7Y6w/im2Uh9ZJ8
   STO+S94O4B5Ttui+PC0hOGrzQiXXUcVHtvhqrEl8NFdt/vbPpYdy8ewEo
   MKI71lxzRMwp3rYyeVVA10FAwIJc5A+XHYqR+La/2PQW5kZ/ZypThtbpP
   sEPXpD/dJTX/ssOV51FYVenGhzRR2tiFxxM43rw698QHsGT5gwEpL6xTX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="381435210"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="381435210"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 08:48:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="868898039"
X-IronPort-AV: E=Sophos;i="6.04,309,1695711600"; 
   d="scan'208";a="868898039"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 08:47:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rIX4W-00000009T0H-1F27;
	Wed, 27 Dec 2023 18:47:56 +0200
Date: Wed, 27 Dec 2023 18:47:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4] platform/x86: p2sb: Allow p2sb_bar() calls during PCI
 device probe
Message-ID: <ZYxVPCA4mu3vVLqt@smile.fi.intel.com>
References: <20231227072049.2281764-1-shinichiro.kawasaki@wdc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231227072049.2281764-1-shinichiro.kawasaki@wdc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 27, 2023 at 04:20:49PM +0900, Shin'ichiro Kawasaki wrote:
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

As per v3 discussion:
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



