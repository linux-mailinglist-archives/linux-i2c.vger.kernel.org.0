Return-Path: <linux-i2c+bounces-6311-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4728896F340
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 13:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07BB1289A81
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 11:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B8A1CB336;
	Fri,  6 Sep 2024 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxpKwfmT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A296415852B;
	Fri,  6 Sep 2024 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725622864; cv=none; b=RR8caA6S/kKOgCgwJ4XNLqLKk6xQPuJNC2WOBA+HOZI9tmlFduxKU85LVB03BBvpm/NKFV0JQGwJxvMbEFvPU/Ohw86udnFRJThe4n2G99KQD2wBR9JYaOPw8UNALNfrtS68jCNF0T5Hfwa2tdI1kK6+SOgYI9H+wedwvwWRQPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725622864; c=relaxed/simple;
	bh=YGHl4O8g0y5wAhBvvDSoCsRTbOvTVD97w2B1eAugi6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DzuL4ctg2jtEDbA6f+UdXqpEUeoqrb1f2sYd9fQlO5CnGphsXyEsq8w4RmT1Vbqh/KO8bGHkn2TdpdsXooWRrfSDCBaQNgL1HO31JvToHG01N9XCRiOPRv5d4/9ldrbEkIX9uN+EIxczxB3vxb14U8EvFBXrLabdeV4CnmoJ0K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxpKwfmT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725622863; x=1757158863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YGHl4O8g0y5wAhBvvDSoCsRTbOvTVD97w2B1eAugi6k=;
  b=KxpKwfmTn7rCQHOb2owvwfdtDhmYBWVpOhnm5Mg14rF5FSnzCMGSStqj
   IXazn74c2+N8lL2C5q9tJsvFnyByvT3LhW1unQ+p5QR104w1XqyHD372e
   7dW196bnu3nobt6kVelBkN3qm0TJM0VvO4d6gr/lweljb7xAve8X41bA1
   FRR5sczL0r4I7PIUPSPqzNFWUv+lqzEF95HjoElawQK2GoxCVp+Z3Rc+d
   cXTWfTlvyUzzvA/Atwz/1oUaAl065k3n+SoTFe4wKA1PnrJ0HWudUM8ni
   VYGbybsfmMKUtnPEf1i9VH66IypGByTEnnbu66XatJWqjdxc8GHfx8i+q
   Q==;
X-CSE-ConnectionGUID: 5KzKzNb9ScGyZPu8UtXNUw==
X-CSE-MsgGUID: pKnBySZpQk+a2YJ2anc0lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35730374"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="35730374"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:41:03 -0700
X-CSE-ConnectionGUID: WQK9yInwQwaYZ/2sETdENg==
X-CSE-MsgGUID: +kM31qQnQxSVCYmefBQkbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="103406212"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:40:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1smXKg-00000005lsd-1cyA;
	Fri, 06 Sep 2024 14:40:54 +0300
Date: Fri, 6 Sep 2024 14:40:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, wsa@kernel.org,
	rand.sec96@gmail.com, wsa+renesas@sang-engineering.com,
	tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
	kfting@nuvoton.com, openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
Message-ID: <ZtrqRc5XYmYBtonw@smile.fi.intel.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-2-kfting@nuvoton.com>
 <xdaufg4bju3iq5fqeo2gdej3yaxyufhuaiuyixnla234l2ej3r@fmvann767tib>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xdaufg4bju3iq5fqeo2gdej3yaxyufhuaiuyixnla234l2ej3r@fmvann767tib>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 05, 2024 at 11:36:45PM +0200, Andi Shyti wrote:
> On Fri, Aug 30, 2024 at 11:46:34AM GMT, Tyrone Ting wrote:
> > The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <= 9".
> > The original design supports 10 slave addresses although only 2
> > addresses are required for current implementation.
> > 
> > Restore the npcm_i2caddr array length to fix the smatch warning.
> > 
> > Fixes: 47d506d1a28f ("i2c: npcm: Remove own slave addresses 2:10")
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> 
> your email used in From: is different that your e-mail used the
> SoB. Is this done in purpose? If so I will keep it as it is, no
> problem for me, otherwise I can fix it while applying it.

IIRC Linux Next has the respective check and it will become your problem :-)

-- 
With Best Regards,
Andy Shevchenko



