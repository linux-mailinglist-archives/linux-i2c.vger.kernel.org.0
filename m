Return-Path: <linux-i2c+bounces-3135-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F318B1E15
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 11:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 838751C215D0
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 09:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A5084FD0;
	Thu, 25 Apr 2024 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLxTctwn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0550C84D1C;
	Thu, 25 Apr 2024 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714037680; cv=none; b=mtDZdLLeH/ykSNop2yz8I9O3T3TTidZVID5LV+vTVI3K5kDXohoEZrAwh9WoP6WlfZZd5FK25eFF+QBt1Fo6guXt//Fqu2v3Gn5cjVH/D+CpFIFgGdux6Klpeh3fl6YwqNXcDMVYlU57sZsq1bR2aeA8sPOmnZ3eKnnT66FPNks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714037680; c=relaxed/simple;
	bh=xf+cGSpTyS5HTjPAzG6cQ2kpu/5/9RutGA1f+6j5JMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDNV37P14aa0oQ6Ce3/YF6mtKC6A1Tk8aJ13SjbZeLvh/V8F85SzYrGYwKhaEalEw67Rwg/nBIl0Li0Wv0q75gljsbEiM58Ew9BG+PyXEFeWjsrbpNb+qbcf6z79ilwG7i3OwFnJq4SkH3ktcyEc0L4dTcrFXwVUpRmDo1Q912g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLxTctwn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714037679; x=1745573679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xf+cGSpTyS5HTjPAzG6cQ2kpu/5/9RutGA1f+6j5JMg=;
  b=YLxTctwnKaN6VUetWsm7Lltw+mgjliLYhVgUnfMupLb4iSd+T/4p1cC6
   m28YPul29bCkFDqsRpvr87U1ASsDX9b57w9bErdj6FS5Qr58l+NtbY2iG
   FP4QsBSdaoHaso7ju73qLhEHNZiZDUf8mpW5yXkyZxpxyBWNPIrVx2/vZ
   B6Cw868dFF/4u1uHg3maKpPSesL4ExS5NJ4FVf/g8UUyDxL/cuPWIKzfC
   5ISXSp1HERpU9P8d6teDUM8bob2Li8D4yJOXBEqUz+HI4GnQm7HaWDoGj
   k68SEjATP8VfS0p8YI8VASuo0FO8eZgdghUOZc2k7J2bvxNJQzUkIWJkX
   w==;
X-CSE-ConnectionGUID: GeuCZC5dTd6SfTe49aVdeg==
X-CSE-MsgGUID: fmcjr6yQQb+23NsLzvAwig==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9577330"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9577330"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 02:34:37 -0700
X-CSE-ConnectionGUID: XEdt0L7yRv+zKzqu0H8pjQ==
X-CSE-MsgGUID: JW2q2ci6SzKlPgRqJfpwRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="48277830"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 02:34:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rzvUr-00000000wqq-3lRX;
	Thu, 25 Apr 2024 12:34:29 +0300
Date: Thu, 25 Apr 2024 12:34:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Subject: Re: [PATCH v2 2/4] mfd: intel-lpss: Utilize i2c-designware.h
Message-ID: <ZiojpSXgKD2oCDtW@smile.fi.intel.com>
References: <20240425002642.2053657-1-florian.fainelli@broadcom.com>
 <20240425002642.2053657-3-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425002642.2053657-3-florian.fainelli@broadcom.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 24, 2024 at 05:26:40PM -0700, Florian Fainelli wrote:
> Rather than open code the i2c_designware string, utilize the newly
> defined constant in i2c-designware.h.

...

> +#include <linux/platform_data/i2c-designware.h>

Please, group this with linux/dma/idma64.h below.

...

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
in case this go anywhere.

-- 
With Best Regards,
Andy Shevchenko



