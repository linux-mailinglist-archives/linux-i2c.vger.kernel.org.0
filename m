Return-Path: <linux-i2c+bounces-177-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D667EC41A
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 14:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0EC01F27076
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 13:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6067A1EB3F;
	Wed, 15 Nov 2023 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0w5aFJn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B8418646
	for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 13:51:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F6FC8;
	Wed, 15 Nov 2023 05:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700056289; x=1731592289;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=of9AMIKCSH75RHDLANVQfD/mECbR5A8WG8K4l8+mfqY=;
  b=E0w5aFJnq4s4zjmrN7Dj269fr+fMtZTP80SpgSmE1uSURiL5iBLUonW0
   upBXgKYDYTE0Ux/KxEuP2EuRzYG7C/DoFYslChjT1fqmLy70i06lIjFwU
   X5CXY4reA7VWPt1brzEFw4sRvhx3GgkrF8/UDTPDvtXgu8lVVluZ3LwlF
   jXgyUCFpJ2gONXmJYQJB6h5dne0Pmz7th3xlcyCG8e+ECKJrDTc4tsobQ
   y9egKUGsNVMM5EQqvo17ICwQYSC0lyP6vZE4TRHb5Cqy4HeH2K6ZtJlWV
   MVf/jifc6oEpyzbMfE407JnDDi7RkQ8aYol6BHPOcJyRBk+gfbmqHYXzo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="375917076"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="375917076"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 05:51:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="882397802"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="882397802"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 05:51:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r3GIc-0000000EKQa-0jnW;
	Wed, 15 Nov 2023 15:51:22 +0200
Date: Wed, 15 Nov 2023 15:51:21 +0200
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
Message-ID: <ZVTM2UgTMgNIBWGA@smile.fi.intel.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
 <20231110182304.3894319-3-andriy.shevchenko@linux.intel.com>
 <e299ee44-7de1-4542-828d-a0c86b217fb4@linux.intel.com>
 <ZVTMJA5JsQI13dhz@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVTMJA5JsQI13dhz@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 15, 2023 at 03:48:20PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 15, 2023 at 01:14:36PM +0200, Jarkko Nikula wrote:
> > On 11/10/23 20:11, Andy Shevchenko wrote:

...

> > Is it intended change the reset isn't asserted after this patch in case
> > i2c_dw_probe() fails?
> 
> Did you miss that this is become managed with this patch and hence the above
> is false scenario?

Ah, I see now what you mean. Sorry, I though about next patch in mind.
Indeed, I need to amend this one.

-- 
With Best Regards,
Andy Shevchenko



