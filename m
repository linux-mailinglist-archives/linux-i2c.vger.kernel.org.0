Return-Path: <linux-i2c+bounces-15270-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B7ED3AA99
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 14:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB41E304D852
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 13:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F59B36BCE1;
	Mon, 19 Jan 2026 13:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nKD4uA/1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E7936B075;
	Mon, 19 Jan 2026 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768830270; cv=none; b=hp5HlqPGJhcP3WRT/Q9MaV2hqu341YyZrp1Fglr5suFHLBI50r/6iR1RSjCdr/m1oDR5kZdncvLQSCOiES5JKDqMYt2LIiN7o6hUdfmPyBa5kEeaYrVMPotPJwugJMNRwInRODp/fQH3zfO7pA3VOCgoNx0R0Cdiku7yq6rRTY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768830270; c=relaxed/simple;
	bh=NThznO9Q0485KzamIFneNUjQxYSCaN1BimXVaja0vUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PO3yTJpZZUiPkRKCjxx/d1V4tsJnLSQ3S6ugWK0YrWVglSQ5jjg3v6NSTALIBnSKO7uaDN0cxSSr33Vy9xn6bRQ6Ohym6Gmpiv/XEmY+hW8ozP3aUJ3nDvBRwVXv6lJRjuewWuX59FZ3gJyVCaoWgUFNcYwGncfG2M32K5OD/NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nKD4uA/1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768830268; x=1800366268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NThznO9Q0485KzamIFneNUjQxYSCaN1BimXVaja0vUs=;
  b=nKD4uA/1EblczIJwx4ivPInj+T/kvrHMW52DuoaJYVsQJOmQzh6MPFtV
   OF6JwVwiSgtARW/MjMkFOk8KR7fomawuDUNRTI1qumtthvD0ZUKFPpeus
   iyYxSuOJ9Toi2pi5i681L+94N+G5CCitD0TQ75f0fq9tyRlWEohCeIpCQ
   LppRq/PDSA+R3ldb5x2O4/OlVPZX6Ir/R+H86hQU544a6Rk/LQH031VT+
   rn+LdyvaPNwLt4i+iLIKAXonV3PoGGnXVilGO2FufxlCbGORFF1p+OsOV
   r7bET5g0ZQDXgSdEiR9F8KXg1GqCsbm1l6k/91qaZVYAWx9TkmoI57bDh
   w==;
X-CSE-ConnectionGUID: /EYWxIhvSc2+snkyxgwGyQ==
X-CSE-MsgGUID: 3dt/wObURdCXUhRNmXjUzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95513429"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="95513429"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 05:44:27 -0800
X-CSE-ConnectionGUID: pPZZO8YpSTe7TnODVveVxw==
X-CSE-MsgGUID: nGEy0bgxRAKB8yw5APV3MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="205894963"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.37])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 05:44:25 -0800
Date: Mon, 19 Jan 2026 15:44:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] i2c: designware: Combine some of the common
 functions
Message-ID: <aW41NnasQws6bNSY@smile.fi.intel.com>
References: <20251218151509.361617-1-heikki.krogerus@linux.intel.com>
 <20251218151509.361617-4-heikki.krogerus@linux.intel.com>
 <aVAAx-Rk4IuLqH6g@smile.fi.intel.com>
 <aVPeQmagzL-QEbIV@kuha>
 <aW4vKo0kROZaPsMp@kuha>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW4vKo0kROZaPsMp@kuha>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jan 19, 2026 at 03:18:34PM +0200, Heikki Krogerus wrote:
> Tue, Dec 30, 2025 at 04:14:32PM +0200, Heikki Krogerus kirjoitti:

...

> > > > -	snprintf(adap->name, sizeof(adap->name),
> > > > -		 "Synopsys DesignWare I2C Slave adapter");
> > > 
> > > This patch changes the user visible strings (via `i2cdetect`) or module names
> > > in case we want to find it by name (note, we already have such precedents for
> > > other adapters). Currently we have three variants if I not miss anything:
> > > Generic for master (as in this change), Generic for slave, and AMD platform
> > > driver case. If you think this is okay change, then just drop the AMD case
> > > as well, and hence remove the no more needed conditional. Otherwise I would
> > > somehow group this naming in one place, if possible.
> > 
> > The only thing that this will change is, it removes the common
> > slave/target only description, because after this that setup is no
> > longer possible - master mode is now always supported. So this is the
> > correct thing to do.
> > 
> > I don't think the user space should ever rely on a description like
> > this except possibly with some customised/non-common systems that the
> > user space really has to handle in some specific way, but if something
> > really did rely on this common "target only" description, it could
> > have only used it to determine that it basically can't use the device
> > for anything as it's slave/target only - so basically to use it to
> > check the functionality (same as i2cdetect -F). But as said, this is
> > no longer a problem.
> > 
> > As for the AMD case, if I understood what you are proposing, I
> > disagree with you. The glue drivers should always be allowed to assign
> > the name (these would be the "non-common" systems that the user space
> > may actually need to know about). I'm also against grouping the
> > naming. The glue drivers must handle the platform specifics including
> > the naming if needed, not the core.
> 
> Ping.

Do you need my input on this? If you think this is good change, make sure the
summary of the above goes to the commit message.

-- 
With Best Regards,
Andy Shevchenko



