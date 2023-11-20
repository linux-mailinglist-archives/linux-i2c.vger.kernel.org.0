Return-Path: <linux-i2c+bounces-307-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E037F1589
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 15:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E410B21910
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 14:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22341C2BB;
	Mon, 20 Nov 2023 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IysuBBeN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89ADC122;
	Mon, 20 Nov 2023 06:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700489879; x=1732025879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B7RCqjrWDo5drKFOH8dltxPhvMHnYEipg2nYYnxlRsk=;
  b=IysuBBeN5pv1rb6KJ/op2BcNfsOIX555DM8QYQR0+ANw3Z3SIAYwNFwC
   b4Fyq9ViXEJGztGCaaOGBZIHhJYDI3Z7kkxv4xavX3DwqZXJ+exsSQk4L
   lJobaA+yesFasdUMtoRz4Ul7/Ab+ya6HjhHKQMhqHbqt7SKbgqQJp2TnJ
   z8/Mmk92D0j9Y27+UsbAnBoXv8pyNcqTkNZih712743ou9G0D/PUD9p+j
   XG+9TSGvcIKBMMni7xZNUcBI+YFaV8eLsmQ/uTjZxUu2ZyiHfDk6ce9JZ
   T9UjNoGUkGe8vp/kHTqfxxWDkcGFoj74mihevFsiiTJ4WNnsRKY/rMXuc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="10299910"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="10299910"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 06:17:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="795480716"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="795480716"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 06:17:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r555q-0000000FZL2-1T36;
	Mon, 20 Nov 2023 16:17:42 +0200
Date: Mon, 20 Nov 2023 16:17:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 10/25] i2c: designware: Unify terminator in device ID
 tables
Message-ID: <ZVtqhWZLkKFa2QUt@smile.fi.intel.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-11-andriy.shevchenko@linux.intel.com>
 <382a9f86-f907-4432-9580-3a1b1b449121@amd.com>
 <a6df86e7-e7e9-4acb-b6f2-0dde55884433@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6df86e7-e7e9-4acb-b6f2-0dde55884433@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 17, 2023 at 04:18:13PM +0200, Jarkko Nikula wrote:
> On 11/10/23 21:38, Mario Limonciello wrote:
> > On 11/10/2023 12:11, Andy Shevchenko wrote:
> > > Make the terminator entry look the same in all device ID tables.
> > > 
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> Sorry replying twice, wanted to make sure Mario's tag is noted.

I am using `b4`, it collects tags from the entire thread (each email from it),
so no need to send twice or care about other's tags).

> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Thank you for the review!

-- 
With Best Regards,
Andy Shevchenko



