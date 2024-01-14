Return-Path: <linux-i2c+bounces-1295-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B223982D18C
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jan 2024 18:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2450EB21297
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jan 2024 17:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025BB538D;
	Sun, 14 Jan 2024 17:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SK4Vk4zJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506855384
	for <linux-i2c@vger.kernel.org>; Sun, 14 Jan 2024 17:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705251986; x=1736787986;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=oT60TkY3hflXHcjdke3tWBjlwDpFXUGw427kZI9I9mY=;
  b=SK4Vk4zJaZFYmWOOSgNtyHd8qTLPE36BTU/mLEIuR9IkZq8L1snIBK9T
   oj3hmeyoilngukCSxbnbDJdHZGiIHs+9qEfWFsNSKa6l+GHc5HGzd2rYQ
   vVmZdxCmSH1nieCZpHFrUBr4pjjTlJr7qsrRkvWLQw9CUHooBGEKYpqoU
   q/DgB1slna3UP7vpBYgfj+EQCY/jfN2wK254JtaduBr1MKYZHcS+4YMQZ
   dTx0wcErcgnsYGgxU1T6PIhyYTl4s6WHLP68fOggDjAPW+tmCEJfOZEUg
   lGFtu4qgNbFn8Inv0/JFEfVZ6geZw7aI6rvwUjNC9OQQdKskFdrVl9Tvq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="396621058"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="396621058"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 09:06:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="759642650"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="759642650"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 09:06:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rP3wB-0000000Dy8Y-3IYy;
	Sun, 14 Jan 2024 19:06:19 +0200
Date: Sun, 14 Jan 2024 19:06:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Kim Phillips <kim.phillips@amd.com>, linux-i2c@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Borislav Petkov <bp@alien8.de>, V Narasimhan <Narasimhan.V@amd.com>
Subject: Re: [PATCH] i2c: designware: Revert recent changes to
 i2c_dw_probe_lock_support()
Message-ID: <ZaQUi17I_3s4GjUL@smile.fi.intel.com>
References: <20240111125658.921083-1-jarkko.nikula@linux.intel.com>
 <f5493701-4cc7-42c2-b9bb-958744bd8626@amd.com>
 <9bb96130-d662-4904-9e4b-6a823b51a990@linux.intel.com>
 <ZaLj5Gg-k2b-TWFK@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZaLj5Gg-k2b-TWFK@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Jan 13, 2024 at 08:26:28PM +0100, Wolfram Sang wrote:
> > > Hold on, I'm testing this on top of next-20240111 and still seeing the
> > > splat...
> > > 
> > Btw, does this reproduce always? Can we be mislead if it happens somewhat
> > randomly? Happens to boot once we revert some commits and then at another
> > Andy's nearby commit does not and we make the wrong conclusion?
> 
> Thanks for all the work trying to find the regression so far. As I want
> to send out my pull request soon, I think it is safest if I revert the
> whole series and we start with a clean new version.

Oh, but true. Let's start over later on. I will rearrange patches and Cc to AMD
in the next version, so we will have unquestionable ones first.

-- 
With Best Regards,
Andy Shevchenko



