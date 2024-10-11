Return-Path: <linux-i2c+bounces-7340-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBC499A238
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 13:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E4792877D1
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 11:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C7D212F06;
	Fri, 11 Oct 2024 11:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiiAF+N3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF62D14293;
	Fri, 11 Oct 2024 11:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644554; cv=none; b=Mys2cIn+I8aQxPUicCJuBgAPxg4LnDaaAdp79tt/WjwzDnX/nxGsvhmQDLLDsit1nsdYrncY8T4Pc2KyxjCr75qRwO8C5g3lbh/SJGLvn5B6rFFqebsXPAknCGr83UwCJSw3pCIulPPd2uac6T0sPCEAahmFxXDngO4NQuKEZ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644554; c=relaxed/simple;
	bh=UncUJn9yZxkr9bOQkMsz4eQD82edd1qYiWUFWxGXe/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kaA4+/msDZ0DwV/aXLNIg2kP3pLeI857OjfoSFz3EgOEDehMi092aonS3ro3PCemiuncxzB/o86e2b6toVKSuwNEkyJtksBG3hL3eebKnZR5/J6aPxBeCRAOu4QtGQcGwl+zyxSUtVBFOfJUgcdqqOE3y9Fpltus4EnPesl48JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiiAF+N3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728644552; x=1760180552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UncUJn9yZxkr9bOQkMsz4eQD82edd1qYiWUFWxGXe/I=;
  b=DiiAF+N3GP5alZxPyhDu4rQSNklhCYnQS0YiRgZ2QyywHEikod7CEc7Z
   GgvnSscTtGXqAjFwsTlMzDLIp+May2aPfu5W2BdsWK1DbbPefpHy+vFaB
   Zxe5Ez640HQt290taRe2oT8zFDUYNruEL8dUozQrpYcCMo4DegEA94XM6
   38Rb/MkIpri304/X1Z/JeU7vIr+snANJoh+x8CN1HoI7p92C9e6pYX0Gv
   bxx/wzorSQXHdXrrVdNkOPM2gDmE+n0GAV0Q+XGtXSJ0YUUMhqbROl2i3
   tv6+chmzus7u4ZI10+2C9YBFHuJHGw61Hg6cT38gGbOtmly2f3Nl/CILq
   g==;
X-CSE-ConnectionGUID: +W4ls0w/RQySdFm5WrJ2rA==
X-CSE-MsgGUID: Os2VTOT7SDqpc407bWH/nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="31835430"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="31835430"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 04:02:32 -0700
X-CSE-ConnectionGUID: fCD2AnhvRDyKVn8emBfNHQ==
X-CSE-MsgGUID: ieOYz05aQXGx22OfgXaNkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="80889908"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 04:02:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1szDPc-00000001rrg-1ZFR;
	Fri, 11 Oct 2024 14:02:24 +0300
Date: Fri, 11 Oct 2024 14:02:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Boyer <Charles.Boyer@fii-usa.com>,
	Vivekanand Veeracholan <vveerach@google.com>
Subject: Re: [PATCH v6 4/4] i2c: npcm: Enable slave in eob interrupt
Message-ID: <ZwkFwABviY8ClyUo@smile.fi.intel.com>
References: <20241011055231.9826-1-kfting@nuvoton.com>
 <20241011055231.9826-5-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011055231.9826-5-kfting@nuvoton.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 11, 2024 at 01:52:31PM +0800, Tyrone Ting wrote:
> From: Charles Boyer <Charles.Boyer@fii-usa.com>
> 
> Nuvoton slave enable was in user space API call master_xfer, so it is
> subject to delays from the OS scheduler. If the BMC is not enabled for
> slave mode in time for master to send response, then it will NAK the
> address match. Then the PLDM request timeout occurs.
> 
> If the slave enable is moved to the EOB interrupt service routine, then
> the BMC can be ready in slave mode by the time it needs to receive a
> response.

...

> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +		/* reenable slave if it was enabled */
> +		if (bus->slave)
> +			iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,

GENMASK()?
But why do we need it? Do we expect this to be 10-bit address or...?

> +				 bus->reg + NPCM_I2CADDR1);
> +#endif

-- 
With Best Regards,
Andy Shevchenko



