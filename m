Return-Path: <linux-i2c+bounces-869-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78459818987
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 15:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A5221C2437E
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 14:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486E11CA9E;
	Tue, 19 Dec 2023 14:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H17fNdqC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC5A1CA80;
	Tue, 19 Dec 2023 14:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702995233; x=1734531233;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=pVmG1M/f3vvE7SKtQpLdyTLljqNz0CKt12Ayopk87d0=;
  b=H17fNdqC5sAai30jJbTIGXJkgws3V40CUuxBHB26Kr7yH51GISnEW+SB
   zBiR0mwqhkAqF4G+2yN1v9p1ahpwL+uyMolr9R8gQ8oQ90Xn1IHD7GfSm
   iw+loxTuWv/TZLsi9yetV89EwOfabPVusTENhDlLPMwbyDE6OB20ZIhPZ
   1L0ir2g1Mq/2yGHQIT9KoDfeh6HxGMKFILcry6hh9gGKin7sU/KFsKUtz
   le3ak9H88w3GNfTV1Ebmg2yzlllFegDvnzFfnqveLv0OaBqRJRinOBT7i
   +ov4zKjQIpdT1x19PJutFYFlcsVJTvYxALmDVOAG3GVToqCDX5ld6rWp3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="399496510"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="399496510"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 06:13:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769251734"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="769251734"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 06:13:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rFaqx-00000007HK8-1tI6;
	Tue, 19 Dec 2023 16:13:47 +0200
Date: Tue, 19 Dec 2023 16:13:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 00/24] i2c: designware: code consolidation & cleanups
Message-ID: <ZYGlG3SKd-waZau6@smile.fi.intel.com>
References: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
 <ZYBgB3J51hfGQSVX@smile.fi.intel.com>
 <ZYFvEn0/xxIhGnlT@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZYFvEn0/xxIhGnlT@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 19, 2023 at 11:23:14AM +0100, Wolfram Sang wrote:
> 
> > Wolfram, is there any chance to get this into this (v6.8) cycle?
> 
> Sure, due to lots of travels and other issues I am in general very late
> with preparing the merge window.
> 
> Applied to for-next, thanks!

Awesome!
Thank you and happy holidays!

-- 
With Best Regards,
Andy Shevchenko



