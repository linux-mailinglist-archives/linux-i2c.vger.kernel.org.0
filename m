Return-Path: <linux-i2c+bounces-722-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B70A180CA8F
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Dec 2023 14:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 618941F21568
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Dec 2023 13:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102263D96A;
	Mon, 11 Dec 2023 13:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZapfq/T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E7EC3;
	Mon, 11 Dec 2023 05:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702300208; x=1733836208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/7AH75cKbyzblVZ0o25ripAHfzcB/lqxf3+MfjM04+A=;
  b=fZapfq/T/99MJHilXq4o58be0deuRM5iroXQoZEl73OTeFq6aWnERrt6
   NtAurLI7tKCgwNgVmTFgj8mVnMsStnhkdDgNqOWUhUMbTL2UREiY3KA6a
   vxTh845ohOH8eiqAay8FlGYhn4nLiGGUXMOwOf2j9VV+X8Tynp2jBncoi
   gHBjbunE1sbDtOBXrDmR8RBRz4yWOrERKFBi08ApO05msyoWOPRe7DqGl
   xmXDbjoiYyeIjAzMOgoiSPuUOZaOzDHVxVqKD0MBwPCwtRJbNCsiXo8nH
   VJGqxQUgLEisNIoRPOcVGMB73OpmuukvGuRO2lvs+DD6Vz20bDfRntDQx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1762895"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="1762895"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 05:10:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="843508656"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="843508656"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 05:10:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rCg2q-00000004mo9-2Q7O;
	Mon, 11 Dec 2023 15:10:00 +0200
Date: Mon, 11 Dec 2023 15:10:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v5 24/24] i2c: designware: Fix spelling and other issues
 in the comments
Message-ID: <ZXcKKHcmK5ULzE3a@smile.fi.intel.com>
References: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
 <20231207141653.2785124-25-andriy.shevchenko@linux.intel.com>
 <20231209011436.rwvaivgewhbthtzl@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231209011436.rwvaivgewhbthtzl@zenone.zhora.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Dec 09, 2023 at 02:14:36AM +0100, Andi Shyti wrote:
> On Thu, Dec 07, 2023 at 04:14:04PM +0200, Andy Shevchenko wrote:
> > Fix spelling and other issues, such as kernel-doc reported about,
> > in the comments. While at it, fix some indentation issues as well.
> > 
> > Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> > Tested-by: Serge Semin <fancer.lancer@gmail.com>
> > Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > Link: https://lore.kernel.org/r/20231120144641.1660574-25-andriy.shevchenko@linux.intel.com
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> 
> Andi I think everything here has been reviewed.

How often do you speak to yourself? :-)

Thank you for the review!
And I think Wolfram can apply it now if he has no concerns.

-- 
With Best Regards,
Andy Shevchenko



