Return-Path: <linux-i2c+bounces-175-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7537EC408
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 14:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73665B209B0
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 13:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705E41A703;
	Wed, 15 Nov 2023 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSBZrxjY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1DD1A261
	for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 13:48:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29E2AC;
	Wed, 15 Nov 2023 05:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700056108; x=1731592108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1u10bwHQDzE5uIfqyJfipjClovLVgHJkX794aOUElLk=;
  b=kSBZrxjY+BjaysKGLAusng1H1iWFkiGMGd4birl4DXOUlFtz9rT79izs
   hpednhOAU67uzqk1ftoKKb126aM1wm1pAo45Fbld7lrKDcqLZY9zC3arZ
   l/1W5HpztcIsVLEwnpS4X2p4q3GCXEIkh2pFsnpXJ9L3zYKnAgVDD4ria
   OrGTFkfFf3quZC4v6g9q2/7UtUR0U6jmZUYbPzs/l/uJ6tNs0mrhpcb1X
   6OQ0qX7bB/FZXoiVq/GS1lFSjXrcB2XRETIe4VUysaf+9xfIbx1Nm6LfV
   yOVA8huXbI8oO9zuztL+5x8ggoGs7N00IW5xxi2gdowcrUZ7z/MJNs287
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="12426388"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="12426388"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 05:48:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="888597743"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="888597743"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 05:48:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r3GFg-0000000EKO7-3NGU;
	Wed, 15 Nov 2023 15:48:20 +0200
Date: Wed, 15 Nov 2023 15:48:20 +0200
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
Subject: Re: [PATCH v3 02/25] i2c: designware: Fix PM calls order in
 dw_i2c_plat_probe()
Message-ID: <ZVTMJA5JsQI13dhz@smile.fi.intel.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-3-andriy.shevchenko@linux.intel.com>
 <e299ee44-7de1-4542-828d-a0c86b217fb4@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e299ee44-7de1-4542-828d-a0c86b217fb4@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 15, 2023 at 01:14:36PM +0200, Jarkko Nikula wrote:
> On 11/10/23 20:11, Andy Shevchenko wrote:
> > We should not mix managed calls with non-managed. This will break
> > the calls order at the error path and ->remove() stages. Fix this
> > by wrapping PM ops to become managed one.
> > 
> > Fixes: 36d48fb5766a ("i2c: designware-platdrv: enable RuntimePM before registering to the core")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I fail to see what was broken in above commit and how this patch fixes it?

The order of the unwiding probed flow is broken now as devm_*() mixed with
non-devm_*() calls. This makes all non-devm_*() calls that interleave devm_*()
ones to be also devm_*()-wrapped.

...

> Is it intended change the reset isn't asserted after this patch in case
> i2c_dw_probe() fails?

Did you miss that this is become managed with this patch and hence the above
is false scenario?

-- 
With Best Regards,
Andy Shevchenko



