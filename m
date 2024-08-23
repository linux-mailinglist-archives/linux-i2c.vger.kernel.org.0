Return-Path: <linux-i2c+bounces-5745-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6986695CFBD
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 16:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D0D81F24C1B
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 14:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BF8188A1E;
	Fri, 23 Aug 2024 14:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Of0FALvd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E868A188A0C;
	Fri, 23 Aug 2024 14:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724422056; cv=none; b=MFY6Dpcd/3gt4tVvnQCqOCDW6qmeGtFl2HdSUTOemAurpN/qoJ2QZhl0W9tHhIeSdcYDphX+5EUxla+fySm018P2SXn52/BbU6OSkrYFwr9N1QKnfrVmj08X8F2z9GZE9rupe1+01zJx+NIrn8ifGZTHBbRKYXKxIKjPMu9kw04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724422056; c=relaxed/simple;
	bh=EKFfVkwn77LEDFmisaebUcU/6+IOgNRft2gXZEe0Z3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X33Zc3v918kCFe6HUyVfFN5RiQMS3RX7wSib5/V5p1dlBRgxJ4W1t1QJoLhz34ICSjnESy7xs80N166gqNhxCiBuBX+15kRgvUvOj5qGa1YuYTdSNac3EAlZbH/QvmkpkfxOY1Jk2dh+M4x0prIaNJoWTMRthROd7B02uIzLSXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Of0FALvd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724422055; x=1755958055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EKFfVkwn77LEDFmisaebUcU/6+IOgNRft2gXZEe0Z3Y=;
  b=Of0FALvdDUDjC36XIIt9TN8xRvz1Wec0OMu1Hl83QyIUeXkQqUAI10Lm
   ZuOiqNeFp+nP25MftlPZ6bVLK+6qn9k/O9H/lx9+L/+lyqhUiM/+7ZJnj
   svmRKY4KWyeLSQgtC4TPZF5PYKK2/FGj58iOpv8sk/kFW7bV/5SMseJbB
   EvM8/qLdK1t4trrur+1MJlgp2MNpldDOp22El+VzVg6RU5P8YdZIVvKN6
   gCs7BG4bJ+fC0cs1bSffZn/KgSMW+XcuXgKi+o7+xFzBryIGOZC1quYak
   eQFTtVQBYYQBbQdlPEq1QhdDznMLRA/sC0tObxNAQ0qW5pnjXecYgECLO
   w==;
X-CSE-ConnectionGUID: EHT8SooIRBuKQrcNp6DlcA==
X-CSE-MsgGUID: OH2jIAhbRBmovE3TwYhSOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22488907"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="22488907"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:07:34 -0700
X-CSE-ConnectionGUID: Etlo/9RQRVqD3PMmpI7iIw==
X-CSE-MsgGUID: dp2F2OqHR7mWtEylenYbfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="92531216"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:07:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shUwK-00000000oZw-2QCI;
	Fri, 23 Aug 2024 17:06:56 +0300
Date: Fri, 23 Aug 2024 17:06:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: andi.shyti@kernel.org, jarkko.nikula@linux.intel.com,
	mika.westerberg@linux.intel.com, jsd@semihalf.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
	piotr.raczynski@intel.com, andrew@lunn.ch,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	mengyuanlou@net-swift.com, duanqiangwen@net-swift.com,
	stable@vger.kernel.org
Subject: Re: [PATCH net 2/3] i2c: designware: add device private data passing
 to lock functions
Message-ID: <ZsiXgHDZi8DpgOWs@smile.fi.intel.com>
References: <20240823030242.3083528-1-jiawenwu@trustnetic.com>
 <20240823030242.3083528-3-jiawenwu@trustnetic.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823030242.3083528-3-jiawenwu@trustnetic.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 11:02:41AM +0800, Jiawen Wu wrote:
> In order to add the hardware lock for Wangxun devices with minimal
> modification, pass struct dw_i2c_dev to the acquire and release lock
> functions.

...

> +static int iosf_mbi_block_punit_i2c_access_dev(struct dw_i2c_dev *dev)

> +static void iosf_mbi_unblock_punit_i2c_access_dev(struct dw_i2c_dev *dev)

Rather name them in accordance with the namespace of this module.

-- 
With Best Regards,
Andy Shevchenko



