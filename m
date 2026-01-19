Return-Path: <linux-i2c+bounces-15271-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77612D3AAB0
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 14:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C8CE306216B
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 13:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D111136CE01;
	Mon, 19 Jan 2026 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/UzMCSD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE7035E555;
	Mon, 19 Jan 2026 13:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768830587; cv=none; b=J5RS7AytbdYDzQ6dNhnUL22PNjmuBBlyUt8qzF+JpgOfiurxPKONyymhrAphyhtuFxov3DubE6SNk1xFZCWSG06f9l1XBbaN2aBILTLVnY/Rgz9GinQkvCOI0W40u6dEaiB9Gn4W82QA6dG/lUX7IhHfOqNd5deiLcUCZ8KHsSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768830587; c=relaxed/simple;
	bh=+U9FHKfllc2v4ZBnHt8LSLxuzWDyq3DEJKbKc/Ry5mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qity7cMGhyO++/hpulmfKw7DP5ejNY2iE4ARTzvsm/6u+r30cu28DUGUNMOwUZLs2Uy4TijP+rW9nkMaI/kCj6AiNMBMPHWbgakWDc9GNjnAmLdZ+fNX5638mrDZhzeODAlbOLshFuvFK1s4CR60Vuk5XKy/tSY4DOHchWriESI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/UzMCSD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768830586; x=1800366586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+U9FHKfllc2v4ZBnHt8LSLxuzWDyq3DEJKbKc/Ry5mA=;
  b=A/UzMCSD2j8IXm4Nyifu+mjT8KCN9aJVgZVnxZhioVC7CEZ6Op8sDRjs
   PxARdiAJ7cRvTZ1QjTgdH7tFm6gZ4MyHbLR4rPhFFcNAWQQniMv0/2mme
   RrPs9tWYnDYp8uuSWCn5bHqYLoSSyqqltA2RC/k1kHKpUbiMbUbv/3D16
   p0ea2lffaabs9k/Vt2kvUU8xzl5i15KznHKJQv9fac8kITfZmscc2BypT
   xFWP98KhY2OCxDFeJmu6PlWSqK0JDa8lYrv88sUD+pCDzpPfKLJ6gKPIU
   yrcCoxXoKX6GimT0SCZAaz573T4MnznRUnHnoalMy+iaUkR3KTG5ILH7G
   w==;
X-CSE-ConnectionGUID: fbHcp5abS6S8fuC2m5xGtQ==
X-CSE-MsgGUID: XtMSU7J5QqifFpLJwfh3Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70091726"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70091726"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 05:49:46 -0800
X-CSE-ConnectionGUID: GWXPfzhvToaWM6L0SRpTlg==
X-CSE-MsgGUID: VrPUGFHdRCmcen4UY4UC/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210725315"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.221.168])
  by fmviesa004.fm.intel.com with SMTP; 19 Jan 2026 05:49:43 -0800
Received: by kuha (sSMTP sendmail emulation); Mon, 19 Jan 2026 15:49:18 +0200
Date: Mon, 19 Jan 2026 15:49:18 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] i2c: designware: Combine some of the common
 functions
Message-ID: <aW42TsZT1hOThU0g@kuha>
References: <20251218151509.361617-1-heikki.krogerus@linux.intel.com>
 <20251218151509.361617-4-heikki.krogerus@linux.intel.com>
 <aVAAx-Rk4IuLqH6g@smile.fi.intel.com>
 <aVPeQmagzL-QEbIV@kuha>
 <aW4vKo0kROZaPsMp@kuha>
 <aW41NnasQws6bNSY@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW41NnasQws6bNSY@smile.fi.intel.com>

Mon, Jan 19, 2026 at 03:44:22PM +0200, Andy Shevchenko kirjoitti:
> On Mon, Jan 19, 2026 at 03:18:34PM +0200, Heikki Krogerus wrote:
> > Tue, Dec 30, 2025 at 04:14:32PM +0200, Heikki Krogerus kirjoitti:
> 
> ...
> 
> > > > > -	snprintf(adap->name, sizeof(adap->name),
> > > > > -		 "Synopsys DesignWare I2C Slave adapter");
> > > > 
> > > > This patch changes the user visible strings (via `i2cdetect`) or module names
> > > > in case we want to find it by name (note, we already have such precedents for
> > > > other adapters). Currently we have three variants if I not miss anything:
> > > > Generic for master (as in this change), Generic for slave, and AMD platform
> > > > driver case. If you think this is okay change, then just drop the AMD case
> > > > as well, and hence remove the no more needed conditional. Otherwise I would
> > > > somehow group this naming in one place, if possible.
> > > 
> > > The only thing that this will change is, it removes the common
> > > slave/target only description, because after this that setup is no
> > > longer possible - master mode is now always supported. So this is the
> > > correct thing to do.
> > > 
> > > I don't think the user space should ever rely on a description like
> > > this except possibly with some customised/non-common systems that the
> > > user space really has to handle in some specific way, but if something
> > > really did rely on this common "target only" description, it could
> > > have only used it to determine that it basically can't use the device
> > > for anything as it's slave/target only - so basically to use it to
> > > check the functionality (same as i2cdetect -F). But as said, this is
> > > no longer a problem.
> > > 
> > > As for the AMD case, if I understood what you are proposing, I
> > > disagree with you. The glue drivers should always be allowed to assign
> > > the name (these would be the "non-common" systems that the user space
> > > may actually need to know about). I'm also against grouping the
> > > naming. The glue drivers must handle the platform specifics including
> > > the naming if needed, not the core.
> > 
> > Ping.
> 
> Do you need my input on this? If you think this is good change, make sure the
> summary of the above goes to the commit message.

Got it.

Thanks Andy,

-- 
heikki

