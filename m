Return-Path: <linux-i2c+bounces-15173-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FF9D22718
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 06:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CFAA7300E076
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 05:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F70223C51D;
	Thu, 15 Jan 2026 05:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxefRN9C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3A913DBA0;
	Thu, 15 Jan 2026 05:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768455605; cv=none; b=TL/2Q0VnD2oB2Nr/v/9OvX3RElM3V7PI6Job2Mufnm+mpRm7Z0/0sUv4ca4XrF+iALrJh2as+Vm2BGDkzzT8JPF53zQMx2O3V/0VMAyzpW9lkMbchTC0m9i6ml35qy0HaWj5rBnQ5OqivO0LL3rE9yRCZZ8NEwAz3nuUtJGioIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768455605; c=relaxed/simple;
	bh=QH4SxGIoIt979xXM0+gvt+R3spx+7GJz8WYPRUTESLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bO5iLxz0N6B5fVD4j8NPUFjpJDiSnRTjVs65vSVH0JTNZNKzegygGCQZvJK/q51ow8/nvFgV8X+PtfuPmlbmAZ18TxK/Qn4Au64YM3k4McW7ctrTfXWdPEjmpuohj2TkFDcCBNIMYRlmwkyfBbqUSSJgWoMaj58FoljNBXRH2eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxefRN9C; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768455604; x=1799991604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QH4SxGIoIt979xXM0+gvt+R3spx+7GJz8WYPRUTESLU=;
  b=PxefRN9CewXdNPxnwUFyLXts5yprUhzojzUNQHcOjBR2RbIiDhKhias+
   x2kB7+RXRmJa9hvu6mDvBWvubPFFjivWqDYteaMK1mxuCj06jOO1H5Xzj
   9+Pj9LQSvtshzp7Q6yvcFqAIfoY3AxE0WfDLqBT5GhuPSxU0XikDgXhdz
   hdNyvoRU5P40Lw1BGVSEOw+xi6jOwoYPupamrc4E4lbOVjwQGaBSwpLJW
   RmmgqLz0wJUy0Fr5UFRMkCRQEGhPcsA8ejZ063EWVF2tUnixcdB/3OSi4
   boYthQh0X1TLRHyTpHXhvVEhc5ZD7VpX0GXOndmvO74FrSzWvmUDlLqMk
   A==;
X-CSE-ConnectionGUID: UxgIRj64RXmmuvUkShkYZg==
X-CSE-MsgGUID: r6YwMLGRTV6K6treUCP17Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="81126232"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="81126232"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 21:40:03 -0800
X-CSE-ConnectionGUID: vDCFA1qgRYmXtpD1fV0Www==
X-CSE-MsgGUID: ZMSMQTidQvSXuWXj/0gCMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204006656"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 14 Jan 2026 21:40:02 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6046D95; Thu, 15 Jan 2026 06:39:59 +0100 (CET)
Date: Thu, 15 Jan 2026 06:39:59 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 2/2] i2c: designware: Use device_is_compatible()
 instead of custom approach
Message-ID: <20260115053959.GD2275908@black.igk.intel.com>
References: <20260114081954.252160-1-andriy.shevchenko@linux.intel.com>
 <20260114081954.252160-3-andriy.shevchenko@linux.intel.com>
 <20260114115304.GC2275908@black.igk.intel.com>
 <aWe_pcSm3tJZhNxw@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aWe_pcSm3tJZhNxw@smile.fi.intel.com>

On Wed, Jan 14, 2026 at 06:09:09PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 14, 2026 at 12:53:04PM +0100, Mika Westerberg wrote:
> > On Wed, Jan 14, 2026 at 09:17:51AM +0100, Andy Shevchenko wrote:
> > > We use MODEL_MSCC_OCELOT effectively is a flag for comparing against
> > 
> > as a flag?
> 
> Yes, sorry for the typo.
> 
> > > "compatible" property. Use device_is_compatible() directly to make it
> > > clear.
> > 
> > Okay but if something else ever needs this same quirk then we would need to
> > add new entry here and also to the IDs list.
> 
> Yes, that's how DT works and there are, of course, examples all over
> the kernel, first that comes to my mind: drivers/mmc/host/sdhci-pltfm.c.
> 
> > With the flag you can have the IDs in a single place not all over the
> > driver.
> 
> Makes the reality harder to read. If I know that the same quirk is used by
> different platform (in terms of compatible string) I will see it immediately
> from the code. Flag is meaningless.

Well with the flag you get the help from the compiler if you typo it but
with the string comparison you are on your own. Therefore I prefer the flag
and as I said it also avoid duplicating the compatible string.

