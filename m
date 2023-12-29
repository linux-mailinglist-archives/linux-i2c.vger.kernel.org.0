Return-Path: <linux-i2c+bounces-1073-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EF581FFAE
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 14:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57247283790
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 13:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA5E1170A;
	Fri, 29 Dec 2023 13:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpeK4v0k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E373B11701;
	Fri, 29 Dec 2023 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703856928; x=1735392928;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ZaEOkhjRA4RnRkUMFHRun5wqQEWfxz018XWe9ycVN/M=;
  b=EpeK4v0kqej4yQP//N9YWoFhGQynZzkakXb8jkRmB/o39jvrDBPzupz1
   QcvzHVImk0YbgnHFfE/2keYFCMKBhr5C7aJwmRXLMftLJnFqsmA2ORxZl
   BFMqM9baQkYgIAy1r1EzsQI0RYuo6tlmpQycwMqqHxyOiG/lokrg4lmNr
   1urdqCvDdunumnhjtlfbPIg24JY/2dF3dOFIfdwpFCPI5vviZ29MzQnh3
   giat95ZIWrL84HG+dbyS+bayNc1VPUIrvN3wXAURgxrmDQC/UpuUg+vWN
   jkOh9L9qLXIvFHu0k6/NVY0YNeTccnW0T09SYMqp7KeP9TmVc1V5NC+uk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="15292476"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="15292476"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 05:35:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="844697174"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="844697174"
Received: from mlittrel-mobl1.ger.corp.intel.com ([10.252.35.138])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 05:35:24 -0800
Date: Fri, 29 Dec 2023 15:34:15 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org, 
    linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 1/2] platform/x86: p2sb: Allow p2sb_bar() calls during
 PCI device probe
In-Reply-To: <20231229063912.2517922-2-shinichiro.kawasaki@wdc.com>
Message-ID: <d66c303d-da76-639-56a3-8f2b58401b59@linux.intel.com>
References: <20231229063912.2517922-1-shinichiro.kawasaki@wdc.com> <20231229063912.2517922-2-shinichiro.kawasaki@wdc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Dec 2023, Shin'ichiro Kawasaki wrote:

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
> 
> Link: https://lore.kernel.org/linux-pci/6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j/
> Fixes: 9745fb07474f ("platform/x86/intel: Add Primary to Sideband (P2SB) bridge support")
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>

Thanks for the update. I've replaced the commit in review-ilpo branch with 
this v5 patch 1/2.

-- 
 i.


