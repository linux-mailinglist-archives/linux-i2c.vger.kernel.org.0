Return-Path: <linux-i2c+bounces-449-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E59F27F779C
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 16:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D013B218B9
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 15:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C072E846;
	Fri, 24 Nov 2023 15:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bm/t7Roy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B38619AD;
	Fri, 24 Nov 2023 07:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700839383; x=1732375383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QbDAaIs9aFhUZesvgAgy1E7hiS18+pXlIMzL6NMs4CM=;
  b=Bm/t7RoyX19UyfCqtscabo3NNh2JHIuCeQiqYrcNRwEBx+wKZAVOm6Gq
   W6I+ubiMqj30jtMsAeyFhi+/aiZM5FA6uYIT1/5apjWOOppaRyYTQtFvQ
   XGQDfIQngWp98Mf/K2GG+Fdo5zOhksKP1ZdXQOVTwq2aOmVb0vHxtI8GY
   Uz7FbNOdhu5Exngkgpd5pE120VyUdG+cd6XcVcSupTskTAhaPtVdxd+pY
   hECC/ILsz21xMGVsBE5gKZbV/xl3Ycn4PfQuQEVp2LtUyrnYsk+gAGbTX
   ++iCIUiNCgFL0pN19xzpyY9WB/XdQu94o3wzMCRwXEeHisj5Qc8fD480o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="389590507"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="389590507"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:23:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="833711291"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="833711291"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:23:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r6Y1B-0000000GkhX-41RK;
	Fri, 24 Nov 2023 17:22:57 +0200
Date: Fri, 24 Nov 2023 17:22:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: Lukas Wunner <lukas@wunner.de>, Heiner Kallweit <hkallweit1@gmail.com>,
	Keith Busch <kbusch@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	Jean Delvare <jdelvare@suse.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [bug report] lockdep WARN at PCI device rescan
Message-ID: <ZWC_0eG2UBMKAD3C@smile.fi.intel.com>
References: <6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j>
 <ZVNJCxh5vgj22SfQ@shikoro>
 <ea31480f-2887-41fe-a560-f4bb1103479e@gmail.com>
 <ZVNiUuyHaez8rwL-@smile.fi.intel.com>
 <20231114155701.GA27547@wunner.de>
 <ZVOcPOlkkBk3Xfm5@smile.fi.intel.com>
 <ZVO1M2289uvElgOi@smile.fi.intel.com>
 <eaawoi5jqrwnzq3scgltqxj47faywztn4lbpkz4haugxvgu5df@koy3qciquklu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eaawoi5jqrwnzq3scgltqxj47faywztn4lbpkz4haugxvgu5df@koy3qciquklu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 24, 2023 at 10:49:45AM +0000, Shinichiro Kawasaki wrote:
> On Nov 14, 2023 / 19:58, Andy Shevchenko wrote:

...

> I created a patch below and confirmed it avoided the lockdep WARN. The
> i2c-i801 probe was ok at system boot.

Another possible solution I was thinking about is to have a local cache,
so, make p2sb.c to be called just after PCI enumeration at boot time
to cache the P2SB device's bar, and then cache the bar based on the device
in question at the first call. Yet it may not remove all theoretical /
possible scenarios with dead lock (taking into account hotpluggable
devices), but won't fail the i801 driver in the above use case IIUC.

-- 
With Best Regards,
Andy Shevchenko



