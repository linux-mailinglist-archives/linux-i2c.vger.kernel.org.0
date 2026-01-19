Return-Path: <linux-i2c+bounces-15269-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF99D3AA38
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 14:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A61F315C711
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 13:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84B6368279;
	Mon, 19 Jan 2026 13:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHA4pcP3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7729368275;
	Mon, 19 Jan 2026 13:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828756; cv=none; b=YZy+bfH2+gI7wE+HTNKzn2VsbPNC6lNk5zJ1gJVkHeVUFA/IptyEBcjjuLTTU+/9ucmct4UHUesPWGOhGRBi6u5c+2ZAbAf/KRPOmVIi1maCCrCxPvemCol8bMmar6l+1iicDUds2GbVm5/qVrLTnVsQawwIqhT0pYueD+Wi/jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828756; c=relaxed/simple;
	bh=scqU0/PXgM7GUpTOmTYEoqsEBH4fRDjAsKaiKMsfO8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYnT9THEf6+OgTIdRbLvtpst6OVBYbrPycXEElLFQK/VvAiEsbqeFzzaaRXAxStp00jMZYF2rIS+jN0tRbQYpxQ/PCsb0GYtIKtmZN7lQ3QTVy1aRrIZZ3LKGGQkrYj90Axz9h3UlL1ka29GI0vArkVN8ijrIc7GrGFjbXhNjUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHA4pcP3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768828746; x=1800364746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=scqU0/PXgM7GUpTOmTYEoqsEBH4fRDjAsKaiKMsfO8I=;
  b=eHA4pcP3KY3RU+sBgRuoSyh3Ui05nlEcNfSx3ir3AgZVhmCpPf/H2go6
   U3mp/xHbjLAeQ8wiW4QroErXQfV36Onr0ChttYSY52GP3YM1uqwqz6piM
   D0dBWWdqf0k1b48xMeL1dkYxgpuE9IvsSCY1l2ScMDOPqRoF3Dz/CHiOn
   h9AX66N8s5TLW/EUpia+qIbNOc5mG9QPd1ziD7hUUvrsO7RRN3ELmo7M8
   LRe2hvrRvAVymbnm70n4EdHVy34+BacE33H9q0+sgMQCEl2YS4AbJ2h71
   VL3f/IX0IMQME7YnO4YTI1UXzo+FIzNmTz2CdQJWOgf3F/PRWmDTGkdoT
   w==;
X-CSE-ConnectionGUID: URv67GaaRSW8w21ukAYDHQ==
X-CSE-MsgGUID: DZCOBMNdRkix18lKljm26w==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69049006"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="69049006"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 05:19:01 -0800
X-CSE-ConnectionGUID: fTj6qZCCSyGKtAuJ45eiww==
X-CSE-MsgGUID: 0q2egjodT5+anoD1ZnpLBg==
X-ExtLoop1: 1
Received: from bkammerd-mobl.amr.corp.intel.com (HELO kuha) ([10.124.221.165])
  by fmviesa003.fm.intel.com with SMTP; 19 Jan 2026 05:18:58 -0800
Received: by kuha (sSMTP sendmail emulation); Mon, 19 Jan 2026 15:18:34 +0200
Date: Mon, 19 Jan 2026 15:18:34 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] i2c: designware: Combine some of the common
 functions
Message-ID: <aW4vKo0kROZaPsMp@kuha>
References: <20251218151509.361617-1-heikki.krogerus@linux.intel.com>
 <20251218151509.361617-4-heikki.krogerus@linux.intel.com>
 <aVAAx-Rk4IuLqH6g@smile.fi.intel.com>
 <aVPeQmagzL-QEbIV@kuha>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVPeQmagzL-QEbIV@kuha>

Tue, Dec 30, 2025 at 04:14:32PM +0200, Heikki Krogerus kirjoitti:
> Hi Andy,
> 
> > > -	snprintf(adap->name, sizeof(adap->name),
> > > -		 "Synopsys DesignWare I2C Slave adapter");
> > 
> > This patch changes the user visible strings (via `i2cdetect`) or module names
> > in case we want to find it by name (note, we already have such precedents for
> > other adapters). Currently we have three variants if I not miss anything:
> > Generic for master (as in this change), Generic for slave, and AMD platform
> > driver case. If you think this is okay change, then just drop the AMD case
> > as well, and hence remove the no more needed conditional. Otherwise I would
> > somehow group this naming in one place, if possible.
> 
> The only thing that this will change is, it removes the common
> slave/target only description, because after this that setup is no
> longer possible - master mode is now always supported. So this is the
> correct thing to do.
> 
> I don't think the user space should ever rely on a description like
> this except possibly with some customised/non-common systems that the
> user space really has to handle in some specific way, but if something
> really did rely on this common "target only" description, it could
> have only used it to determine that it basically can't use the device
> for anything as it's slave/target only - so basically to use it to
> check the functionality (same as i2cdetect -F). But as said, this is
> no longer a problem.
> 
> As for the AMD case, if I understood what you are proposing, I
> disagree with you. The glue drivers should always be allowed to assign
> the name (these would be the "non-common" systems that the user space
> may actually need to know about). I'm also against grouping the
> naming. The glue drivers must handle the platform specifics including
> the naming if needed, not the core.

Ping.

-- 
heikki

