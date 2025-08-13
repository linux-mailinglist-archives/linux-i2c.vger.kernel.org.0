Return-Path: <linux-i2c+bounces-12268-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E75B24A5B
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 15:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E47F9586BB5
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 13:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BB82E7183;
	Wed, 13 Aug 2025 13:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RxEgLO6q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9C026FA6E;
	Wed, 13 Aug 2025 13:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755090694; cv=none; b=KhrJl9IWmqpkxZkgfZSJtlJjSg1AuQ/rPdUgDw75YqfupG+xysJJZIB71uqBpzkt8n2Gnw+mFpBVP+bIVe/00e8axkX1+upM2QcojFFykkXTFmmC8CpfQKj/kckYB5ddtKVQPZSipAVm10onjKte9g6ytyvp5zbvzhEuN49Lt6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755090694; c=relaxed/simple;
	bh=q8TIZHVsbpGiRDf0kANTJMdQ12mBUINz3XeIl5TqG6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BV/FSychXZt07U0NCWba+DmQr7dM86tIqxO0GPbpDzHjLxoZtm8+vFcZdx9DSXpUIouX31dORXApGWN0mB7Rm+7H4GWqECudx/PPT3pCOYrAvu/mfZZ4oztoZY9sGOs8/kCNeUDH9JcVKrzileSqDQvXIL5Vjgv2gMyEMkglByw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RxEgLO6q; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755090693; x=1786626693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=q8TIZHVsbpGiRDf0kANTJMdQ12mBUINz3XeIl5TqG6M=;
  b=RxEgLO6qTdht6eSrG3r7qsqxy5aQJOzs9J9NdyTL2tmlaYH9JvQkE/vc
   DlCk5j5UGlnBwGX10u2Dsz3niY1yVhrsTbWSdGFpccAHizOJCpc0iAGbh
   Jm8ukuYNjT4cH9TMKkkOo+/tkkp8onJT50nh5bz4obOoI5IOp8yx/WMpL
   1cUcTCLXLGZZND2D0vBAf4P0Aviit2Z3wECT85ttweHVTXghMgW6qtTbB
   NSK79JnEOhH8jyMT24O+CVjIgq2CnsIgm2PJJgCzmNpSieGdFZRfQ9/D0
   qbOPeIhHCh32r9hrxfqwHhCvy2TQgyzhLPzn4DFwKLO5T9+/tXm6DnJr5
   Q==;
X-CSE-ConnectionGUID: fxk8/J24TiGCLmfyvtDT8Q==
X-CSE-MsgGUID: 9640fpgeSyO+x8N0HeMhRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57304120"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57304120"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:11:31 -0700
X-CSE-ConnectionGUID: cMXgOAqRTC2XlX23mmY/7A==
X-CSE-MsgGUID: sRK+mKWDQBuKDzCZdZkvgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="170680302"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:11:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1umBGF-00000005RPp-1iZD;
	Wed, 13 Aug 2025 16:11:23 +0300
Date: Wed, 13 Aug 2025 16:11:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 3/3] i2c: pxa: handle 'Early Bus Busy' condition on
 Armada 3700
Message-ID: <aJyO-5k29AAAnHdz@smile.fi.intel.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-3-ca42ea818dc9@gmail.com>
 <aJpTHKbLbTz-Z3bo@smile.fi.intel.com>
 <27906f7b-b137-4af2-aa87-49519495a34d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27906f7b-b137-4af2-aa87-49519495a34d@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 13, 2025 at 12:50:35PM +0200, Gabor Juhos wrote:
> 2025. 08. 11. 22:31 keltezéssel, Andy Shevchenko írta:
> > On Mon, Aug 11, 2025 at 09:49:57PM +0200, Gabor Juhos wrote:

...

> >> Note: the patch is included in this series for completeness however
> >> it can be applied independently from the preceding patches. On kernels
> >> 6.3+, it restores I2C functionality even in itself because it recovers
> >> the controller from the bad state described in the previous patch.
> > 
> > Sounds to me like this one should be applied first independently on the
> > discussion / conclusion on the patch 1.
> 
> Yes. At least the users would have a working although not optimal solution in
> the meantime.

Then please reorder in the next version.

-- 
With Best Regards,
Andy Shevchenko



