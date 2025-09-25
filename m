Return-Path: <linux-i2c+bounces-13148-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BECEDB9E5CD
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 11:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 050651BC7286
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 09:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435392EB5B2;
	Thu, 25 Sep 2025 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Akik4r2Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8242EAD15;
	Thu, 25 Sep 2025 09:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758792486; cv=none; b=EpfXDJbB6cjdhSjfw8VinIkfgRVJ8HPgy7BZtu/T86kFTbBLkJB6OGvNtlvpflIzLApMgVeWRM3bnuxcna2dbWJ3HAN2wIB3clukJ1SDuIRzV7Uzek0pcJZx22uDXGL/TN+LVIB6jIdmPhaD8ni9y1vdeEXIxzErFCgB//iOSTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758792486; c=relaxed/simple;
	bh=ev0es3beHcVlKmdsdNa37x3SgOXU7XTeeO6owaYfr+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbaB8AH3rn4Jg60mYkMfVEtVDEAjmbdsgu3kprTNATHkUEJowD28MVs6kqczKwqOBBlj0rrcNYD3jLXtBgxG0hNvtfmzXJdhPKvEFKMSqhuSt7tHdJqvtrgONo7gkxqS2HH2tuLg1+Wnj43ixUCXoLCdFgrnmm23kjAh/68T2UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Akik4r2Z; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758792484; x=1790328484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ev0es3beHcVlKmdsdNa37x3SgOXU7XTeeO6owaYfr+Q=;
  b=Akik4r2ZBWpgE8vxyIl/+YGyIqZJzdolBhSsJCB5RJ2k/esO1aRy5vaQ
   hcgK+r2oMnXH4843Jj6oCYb1ZnrhKD+CebnnsSIU3jIFG6cVkMtLWw1Ch
   V3xAAKMX04bTyrfTmiawTDnJ5SBZiG6rqKl9mUbTOvC1lAgtbYW/QdIJ/
   /y5QN4J/1RYcy+AbkPvZld8tXourK1R4WORPMi4wmOo9GLm8G7uW85vSo
   fRcV9u4cypifIFOyCwJGkYwfGb6vkpsWVyw4t1PhYWKRNBQEHDDcVAceN
   TuiMb4w4baKQADVka1y1qRXxCfbThUbSga9EEox0xKy1wyooR9i17lwUP
   g==;
X-CSE-ConnectionGUID: K6nQCaJMQPSKVn2FfkYejg==
X-CSE-MsgGUID: 7FKJ+2HASpayLk6wPOHCAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="64943946"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="64943946"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 02:28:03 -0700
X-CSE-ConnectionGUID: jWqr4pf+SzeMjDNzPLd2lQ==
X-CSE-MsgGUID: 87yAvQBfS6eKSuiAvOqSqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="182441535"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 25 Sep 2025 02:28:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8F16295; Thu, 25 Sep 2025 11:28:00 +0200 (CEST)
Date: Thu, 25 Sep 2025 11:28:00 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Remove myself as Synopsys DesignWare I2C
 maintainer
Message-ID: <20250925092800.GF2912318@black.igk.intel.com>
References: <20250923132603.50202-1-jarkko.nikula@linux.intel.com>
 <aNLw2qMlHYJXQhk0@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aNLw2qMlHYJXQhk0@shikoro>

On Tue, Sep 23, 2025 at 09:11:22PM +0200, Wolfram Sang wrote:
> On Tue, Sep 23, 2025 at 04:26:03PM +0300, Jarkko Nikula wrote:
> > My address is going to bounce soon and I won't have access to the
> > Synopsys datasheets so I'm going step down being a maintainer for this
> > driver.
> 
> Oh, noes! Hope to see you still around hacking the kernel. Thank you for
> all the work on this driver and I2C in general!

Thanks for all the good work Jarkko!

> >  SYNOPSYS DESIGNWARE I2C DRIVER
> > -M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
> >  R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >  R:	Mika Westerberg <mika.westerberg@linux.intel.com>
> >  R:	Jan Dabros <jsd@semihalf.com>
> 
> Maybe one of the reviewers wants to step up?

I can volunteer if that's okay with others?

