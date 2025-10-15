Return-Path: <linux-i2c+bounces-13627-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AFDBED59E
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 19:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3DFF19A7AE5
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 17:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5D925DB1D;
	Sat, 18 Oct 2025 17:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8iKjyzA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9A2246335
	for <linux-i2c@vger.kernel.org>; Sat, 18 Oct 2025 17:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760808889; cv=none; b=f2aHPAJVQhk53Y3NdTL+pgi7SczAwQ0D826uEf0AhMoQgajF+24tYM2OuWkzocn07r9JCGFdulUkEFYHRmefl1iMJvm7PYJoqNlG9GuwD+8Pflrqpb79TS8jT+jY8H2a7byB8njvHUi3oMxH1zpZZO04mcVPCRoO0bWOgaQAV4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760808889; c=relaxed/simple;
	bh=VyHWCYgpw2XQ8+U2NPU+vM5uTD2JaXAYbZkKZnNDd5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCQds3d72qFbjp4gBpxrWOCCrY6BPlm+c0f9+4AQByUgb73hjAI5SVQRxIRD7E0IgnS2D84t9b0Gkdbj4u50EFpPP+61mX2neDie/Lbuym8N33r2lzdXJluuCdEvIDI6/lvD/pkzJ+prQEqw/ISNj4wYrhggoicDl0RQ816H/ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8iKjyzA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760808887; x=1792344887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VyHWCYgpw2XQ8+U2NPU+vM5uTD2JaXAYbZkKZnNDd5o=;
  b=A8iKjyzAiWCgx6WJex6yZt8euN1tmaivQHXsNd5koroE3W85ZE8MP/w+
   nnUnbwwwJhiAQIPrl5pabj3p+O8lqo07OGiAYeG8Gul8Xb6EUSbFmzbu1
   9YX6VbA6cl1SKHvfq5aslHfe6LYJTFtQqy9dJAFg5Hlib+UnrGi/OBMMQ
   MlGi6NRSu6+2gdwreK87AyJa6eywoVaQE9eARoCVOT7iPKsW+O5VL/TzI
   CWqwJTV9yGQAJCUk5l1hy3NzXCiHWTgM2Dya6jpkLuVJEpPhO+SF7CYu6
   +woDYfeWrsmmxZrAbxeQx7Ynv7XwFKtvWCKvCiwbhLzuTMzk5SYLKGY6+
   w==;
X-CSE-ConnectionGUID: AZooYPDWQ1CvqBCu7zX7ZA==
X-CSE-MsgGUID: WStn/aEiQ6G5j5VeoXeqSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65614260"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="65614260"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 10:34:46 -0700
X-CSE-ConnectionGUID: W+YG1XtgRLSXW1DGGAruDA==
X-CSE-MsgGUID: 5R/UGQ+ATkCr1HmJJF4cJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="182939804"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.194])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 10:34:44 -0700
Received: from andy by ashevche-desk with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1v91kL-00000000KTa-3LEg;
	Wed, 15 Oct 2025 16:40:53 +0300
Date: Wed, 15 Oct 2025 16:40:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-i2c@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: i2c-designware: not possible to write to different i2c addresses
 in one transfer?
Message-ID: <aO-kZUwqcoqnFfTh@smile.fi.intel.com>
References: <ee6afdd7-3117-43cd-831f-e0ec5ee46f46@kernel.org>
 <aO-KuJ_T9cXsNpIh@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO-KuJ_T9cXsNpIh@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 15, 2025 at 01:51:20PM +0200, Wolfram Sang wrote:
> Hi Hans,
> 
> lucky you, I happen to have a board with that controller on the table
> currently :)
> 
> > This worked fine for the Raspberry Pi 4B using the broadcom i2c driver, but for
> > the Raspberry Pi 5 using the designware driver it fails with -EINVAL and these
> > kernel messages:
> > 
> > [  272.284689] i2c_designware 1f00074000.i2c: i2c_dw_xfer_msg: invalid target address
> 
> Confirmed.
> 
> > Looking in i2c-designware-master.c it seems it cannot handle consecutive messages for
> > different addresses.
> 
> I agree. I leave the final judgement to the experts (Andy, Mika), but I
> already anticipate that I need to extend the existing
> I2C_AQ_COMB_SAME_ADDR quirk into a more generic one. And set the quirk
> in this driver.

May I ask a dumb question? Why do we need such an awkward transaction
to begin with?

-- 
With Best Regards,
Andy Shevchenko



