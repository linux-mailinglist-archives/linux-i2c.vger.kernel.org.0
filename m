Return-Path: <linux-i2c+bounces-14878-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5124DCE9E5C
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 15:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 013DF301F255
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 14:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97552459D4;
	Tue, 30 Dec 2025 14:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4shnNMv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1F222FE0E;
	Tue, 30 Dec 2025 14:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767104091; cv=none; b=Ts0JyRKS80yZke8eY3cle3r+wgiXYF73Ul8csGSWlGdOIIyr5A2YAgJxT23Fb1Ugf3ZjklOC/kmv15XQaidG+R5iJ2aIzlxCEun94aMNoYIT8m2xVVa45Zvb4/uv41U6k5SIy7K2MTdA/hLZChSLFxXtoEBRmPvTfhOVMZ4e5fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767104091; c=relaxed/simple;
	bh=jl2WtW+ePEpJhreXMupgIMIbQVP+BOimx0yaqHP4+K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opu50AqAhCLC3Yn+j3v7AblSnGWKgDx5qki9gZADNB305Qnse6GeLR5vGTnEKPQEgMExnn4Bt/0rjbu/BfsQoegcpsrwq2f3xNlVy+whMrk7LxYf9569Ph3mzYX+EMNm1ZZIV5Hhcp1duUIiziFvSIuJmRvLbC1nuGHQ869GMDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4shnNMv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767104089; x=1798640089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jl2WtW+ePEpJhreXMupgIMIbQVP+BOimx0yaqHP4+K0=;
  b=W4shnNMv41wrfQG8c57GVTR5KxzZIi45bjRkx1y11mCnTvhP/ZHieRDr
   QLAwjjHL8Ps+DrUjdQsnAwcO/hll8kN11IISjBdZ/yH2pWQaKw8My6TwH
   4z34kOonvAiO+DwqWfBFn6y164TgsLNq+/4GYkiebAYmdvITUbs9y3RJG
   yMY/Td4OaLTSmv6+pQmDjwpYZ587rsq9MZm1C7jruyV1Tw9VioFbnpc9b
   aseAuKISbmLGUyewf+2q1Iz6neXOtNY/HqOj7c3oJ1SZYh/GZX0o+PGEZ
   RfDVFh6DMdtzRjqsARXfznD8m21N6Tob4rSki2dFgsnnZyPgdKOAiG0F1
   A==;
X-CSE-ConnectionGUID: osD07mFCQ8GVUe0/CyLwBg==
X-CSE-MsgGUID: b7iGiOQ/RUm/roJIIVEkog==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="80142004"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="80142004"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 06:14:48 -0800
X-CSE-ConnectionGUID: MllZcWkwQrKj3jriiM94ng==
X-CSE-MsgGUID: OSza2lsDQl2nQmrGgXzxtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="200973833"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.221.63])
  by orviesa009.jf.intel.com with SMTP; 30 Dec 2025 06:14:45 -0800
Received: by kuha (sSMTP sendmail emulation); Tue, 30 Dec 2025 16:14:26 +0200
Date: Tue, 30 Dec 2025 16:14:26 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] i2c: designware: Combine some of the common
 functions
Message-ID: <aVPeQmagzL-QEbIV@kuha>
References: <20251218151509.361617-1-heikki.krogerus@linux.intel.com>
 <20251218151509.361617-4-heikki.krogerus@linux.intel.com>
 <aVAAx-Rk4IuLqH6g@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVAAx-Rk4IuLqH6g@smile.fi.intel.com>

Hi Andy,

> > -	snprintf(adap->name, sizeof(adap->name),
> > -		 "Synopsys DesignWare I2C Slave adapter");
> 
> This patch changes the user visible strings (via `i2cdetect`) or module names
> in case we want to find it by name (note, we already have such precedents for
> other adapters). Currently we have three variants if I not miss anything:
> Generic for master (as in this change), Generic for slave, and AMD platform
> driver case. If you think this is okay change, then just drop the AMD case
> as well, and hence remove the no more needed conditional. Otherwise I would
> somehow group this naming in one place, if possible.

The only thing that this will change is, it removes the common
slave/target only description, because after this that setup is no
longer possible - master mode is now always supported. So this is the
correct thing to do.

I don't think the user space should ever rely on a description like
this except possibly with some customised/non-common systems that the
user space really has to handle in some specific way, but if something
really did rely on this common "target only" description, it could
have only used it to determine that it basically can't use the device
for anything as it's slave/target only - so basically to use it to
check the functionality (same as i2cdetect -F). But as said, this is
no longer a problem.

As for the AMD case, if I understood what you are proposing, I
disagree with you. The glue drivers should always be allowed to assign
the name (these would be the "non-common" systems that the user space
may actually need to know about). I'm also against grouping the
naming. The glue drivers must handle the platform specifics including
the naming if needed, not the core.

thanks,

-- 
heikki

