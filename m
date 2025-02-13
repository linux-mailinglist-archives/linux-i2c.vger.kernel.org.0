Return-Path: <linux-i2c+bounces-9444-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C10C5A34AD4
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 17:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B19453B7802
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 16:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF56114037F;
	Thu, 13 Feb 2025 16:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pc6MGpjb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BF6202C53;
	Thu, 13 Feb 2025 16:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739464632; cv=none; b=EdKADpwuizuzTjhBFbRMQjQJRFnUh3G1momE/fkOe+StTf6OwygoNMCA6SySPvJ4rRr6kxSOHXHKzz685h+lQ7jsBnO4OuK9x2iLpV5bwfA0O+/z1kEkXkiPH6EgiZhZUjJtHHbi2YhaHaR7KahX/YT9IgxVumykn5my7hixu84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739464632; c=relaxed/simple;
	bh=sbbmkWE/R2bCCyJ/6gUWFB9ZcoZuMGcfquTsn87Iqp0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rr12oJkikEuZZeLtGr+eM96ks5W7w7jdFqbJmEbqwqUk/OzaVdMUwgzIEx/DQE9+5V84LXxeYM/1qBv+b/dQwG+qqKtsLGntuV5bTgZgQi72Www8GqKAH0qrb7DVFoKxkRSO9RN3xTNsZw0OaXw1L1ty4dJ3XthM5cE5fLkaqpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pc6MGpjb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739464631; x=1771000631;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=sbbmkWE/R2bCCyJ/6gUWFB9ZcoZuMGcfquTsn87Iqp0=;
  b=Pc6MGpjbvZ3XIALdKgbV0wESenyzFtFNzpKdmmiQnYcOK9xSbYPxzv9o
   Zj4woGdCFG9WUCEFxWm05sluH07TN2x03ylnHF+/HztizO4KxcQNv/iHz
   0KWtZcMMa1ttLhFr282BivkDnrtmoA3l6LPe5quhqAOGYzfaB45BZto+P
   nYaejT+itC1I0VyyODGNDCQiPFI/n86Igp6Vy6cixx9KCV0+vLiRZRhtB
   F1Pmp9Y2JgXGBBMOOGqceKYOpC7fwB46WYfsxrIobR+EWTrNfot7m3b69
   F7Rfniov+nvtMlkp7mlgC5e8yw2XiGJnDeCaRXoxlYQ8wsYMLFn7Cs9Uq
   Q==;
X-CSE-ConnectionGUID: GlYLMqdATnmxGpKLyNe+xQ==
X-CSE-MsgGUID: f4zWaU/FTa6e/HFAQkTlfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="51577447"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="51577447"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 08:37:11 -0800
X-CSE-ConnectionGUID: W3VNhbcRSYeFkWd3XmfLAQ==
X-CSE-MsgGUID: sEuhhK7cQdiQB1cBIOxlyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113720797"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 08:37:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ticD0-0000000BDu9-3wkb;
	Thu, 13 Feb 2025 18:37:02 +0200
Date: Thu, 13 Feb 2025 18:37:02 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>, Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v2 06/10] i2c: kempld: Use i2c_10bit_addr_*_from_msg()
 helpers
Message-ID: <Z64frt9vbdLVYbrB@smile.fi.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
 <20250213141045.2716943-7-andriy.shevchenko@linux.intel.com>
 <Z64ajR7CSIDNmIKz@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z64ajR7CSIDNmIKz@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 13, 2025 at 05:15:09PM +0100, Wolfram Sang wrote:

...

> >  	/* Second part of 10 bit addressing */
> >  	if (i2c->state == STATE_ADDR10) {
> > -		kempld_write8(pld, KEMPLD_I2C_DATA, i2c->msg->addr & 0xff);
> > +		addr = i2c_10bit_addr_lo_from_msg(msg);
> > +		i2c->state = STATE_START;
> 
> Any reason you moved this?

Yes, I would like to be in sync in the above state machine case, just upper in
the code which is not visible in this patch.

> > +		kempld_write8(pld, KEMPLD_I2C_DATA, addr);
> 
> Maybe we could skip using 'addr' here?

Same reason as above.

> >  		kempld_write8(pld, KEMPLD_I2C_CMD, I2C_CMD_WRITE);
> >  
> > -		i2c->state = STATE_START;
> >  		return 0;
> >  	}

-- 
With Best Regards,
Andy Shevchenko



