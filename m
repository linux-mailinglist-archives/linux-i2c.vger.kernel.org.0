Return-Path: <linux-i2c+bounces-14654-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB004CCED3F
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Dec 2025 08:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 117CA308DAC0
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Dec 2025 07:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34492EAD16;
	Fri, 19 Dec 2025 07:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6y+A+Ev"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DF12E7F3E;
	Fri, 19 Dec 2025 07:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130199; cv=none; b=Oh23jEX3JhYcoDaGiVye+9aIBCG3YJqcbjpQSYE1ZmO2bLQx89wQahAPxqd3OmAU6uw2QSzBgl07Zyj6d1QXkXalqgNO4RrLRoa2oYueFhIO8Fef3iMfno4RDfSi/ntLC8ozEUZDR2SEtFN7+vN37y6WwBLITYFLdb/BC+Z5P+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130199; c=relaxed/simple;
	bh=h0SU7KB4sCNmstJjY0eJDkpaYp9VWIdTGmdtR1vZS18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zf1n8s+PKCzmtxHWkoc8nLy7UqUCZKaYA3MxN6B8C/1HHcea7oSXb7DWnKccJxtw04kfAczScxG0CuOXfWW9Jsy8DeJmE3Rm8wpHMPnsAcaNl1ssCC5wnheDDW7zC49j92C7DsQ2RAPkBk0L2KhB/b/6H/HyKlx1JCCifGp3EVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6y+A+Ev; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766130197; x=1797666197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h0SU7KB4sCNmstJjY0eJDkpaYp9VWIdTGmdtR1vZS18=;
  b=Z6y+A+Ev0rHCQlfLgnAXn2lWF8GYtB5ANkR5ASCWoKwY6wKfTeVaSbsK
   rMay5xrPtM5Huygnq4GdnuABv3QnD9KYx7v7nPeK1Lhu6HAmNmRR76Oik
   1p1uHXB0hYGyQX3V9nu3zr95iFnL0ae+v+LH1fXuBD6EIP90n5NuJE5YJ
   TKUJ9dy+lkLt0c/X+uLip9szuPMtM6hVrGP6/y+jp5J6oMmBaV26fue9k
   z4TygPRmrKG20mKoo4z8iYAQmdJuIIiNtFtxqhPcKQtWnu8DKtaa1asIA
   McEkri+/uW8fbkRxYT8EMI1Zz4k4eSKf/YHrLwjGyxZF+GTmw+Vk2PkGx
   w==;
X-CSE-ConnectionGUID: mDLjv/a1QmWDE8V0gBXN4w==
X-CSE-MsgGUID: egtrPPSgTi2Yitisns5+ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67842493"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="67842493"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 23:43:16 -0800
X-CSE-ConnectionGUID: b2z2eSkmRjS9ONTrzTZBRg==
X-CSE-MsgGUID: edDUlNNNRlK+uv2WzFsVLA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 18 Dec 2025 23:43:14 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id DC3CA8E; Fri, 19 Dec 2025 08:43:12 +0100 (CET)
Date: Fri, 19 Dec 2025 08:43:12 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] i2c: designware: Enable mode swapping
Message-ID: <20251219074312.GX2275908@black.igk.intel.com>
References: <20251218151509.361617-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251218151509.361617-1-heikki.krogerus@linux.intel.com>

On Thu, Dec 18, 2025 at 04:14:59PM +0100, Heikki Krogerus wrote:
> Hi,
> 
> Changed since v1:
> - The init cb is replaced with i2c_dw_init() also in i2c-designware-amdisp.c
> - Checking I2C_FUNC_SLAVE in i2c_dw_reg_slave()
> 
> The original cover letter:
> 
> It's currently not possible to support MCTP or any other protocol that
> requires support for both modes with the DesignWare I2C because the
> driver can only be used in one mode. I'm assuming that the driver was
> designed this way because the DesignWare I2C can not be operated as
> I2C master and I2C slave simultaneously, however, that does not
> actually mean both modes could not be supported at the same time. See
> the patch 5/6 for more detailed explanation.
> 
> This series will enable support for both modes in the driver by
> utilising a simple mode swap method, and that way make it possible to
> support MCTP, IPMI, SMBus Host Notification Protocol, and any other
> protocol requires the support for both modes with the DesignWare I2C.
> 
> thanks,
> 
> Heikki Krogerus (6):
>   i2c: designware: Remove useless driver specific option for I2C target
>   i2c: designware: Remove unnecessary function exports
>   i2c: designware: Combine some of the common functions
>   i2c: designware: Combine the init functions
>   i2c: designware: Enable mode swapping
>   i2c: designware: Remove an unnecessary condition

For the whole series,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

