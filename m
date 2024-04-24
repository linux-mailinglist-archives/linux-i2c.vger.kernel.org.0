Return-Path: <linux-i2c+bounces-3108-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E518B0C73
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 16:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46290B21A9C
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 14:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4082615E7E9;
	Wed, 24 Apr 2024 14:27:08 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF18C158867;
	Wed, 24 Apr 2024 14:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713968828; cv=none; b=CKwA1RrnVuqTsZlESELDm0MvdGaYE8GHGNHfjO6RmDsgmBq5+As2b4FP7hhzIpCIsAwzI7WXqna3Eg4eTzpqesbn8XdrohHmjlKCCZymfFInbMww0xt48Y25wk7B6Oc7H4qTnZ1MadfSOtrfkPOWPQXEOLXNhI3ikduawqcJzcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713968828; c=relaxed/simple;
	bh=3MRo09CAl1dLk8i/k1FkOLA4olAcV60dDi76ojCmJQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nj5ryYW1/rCcIrjaj630gI+G78LJX9TBsyUUFxPTC3grgyCbduysz22J7nJx6zT/MRke8hgiMfODJpg29ieZ81R0ONkzw3b0G0xImU3mxQwdrpGvbEEcMwZc1/O3Eylp/LqT74/B5w49qpePwEEuqwKIlgoNjBuapBps1OHdLbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: iBK17G9IRNKOryzqC5l5Wg==
X-CSE-MsgGUID: MvoGg2vjTkqjvrnHp5J1MA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9453980"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9453980"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 07:26:54 -0700
X-CSE-ConnectionGUID: skyNPZ5NT525XUblwMmtLQ==
X-CSE-MsgGUID: dtI6JwCJQhSpTBVzz2mZ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="25343374"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 07:26:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1rzdaA-00000000fsk-2vqd;
	Wed, 24 Apr 2024 17:26:46 +0300
Date: Wed, 24 Apr 2024 17:26:46 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	"open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
Subject: Re: [PATCH 0/4] Define i2c_designware in a header file
Message-ID: <ZikWps1DIVPNJeOp@smile.fi.intel.com>
References: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
 <ZihKtSble151A5mT@surfacebook.localdomain>
 <e55c35c2-1bff-4b12-aa3b-713c6085d303@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e55c35c2-1bff-4b12-aa3b-713c6085d303@broadcom.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 23, 2024 at 06:21:21PM -0700, Florian Fainelli wrote:
> On 4/23/2024 4:56 PM, Andy Shevchenko wrote:
> > Tue, Apr 23, 2024 at 04:36:18PM -0700, Florian Fainelli kirjoitti:
> > > This patch series depends upon the following two patches being applied:
> > > 
> > > https://lore.kernel.org/all/20240422084109.3201-1-duanqiangwen@net-swift.com/
> > > https://lore.kernel.org/all/20240422084109.3201-2-duanqiangwen@net-swift.com/
> > > 
> > > There is no reason why each driver should have to repeat the
> > > "i2c_designware" string all over the place, because when that happens we
> > > see the reverts like the above being necessary.
> > 
> > Isn't that a part of ABI between drivers, i.e. whenever ones want to
> > request_module() or so they need to know what they are doing, no?
> 
> Yes, the drivers should know, but as evidenced by the two patches above,
> there was still room for error. If we have to abide by a certain contract,
> which is platform_driver::driver::name, then we might as well have a header
> defining it no?

Maybe, I simply don't like the manipulations with parts of the device instance
names / driver IDs / driver name, which all become mixed after this series.

-- 
With Best Regards,
Andy Shevchenko



