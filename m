Return-Path: <linux-i2c+bounces-12544-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 521A2B3EB31
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 17:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03FFF7AA243
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 15:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582832DF144;
	Mon,  1 Sep 2025 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AulL2Ak9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7652DF12C;
	Mon,  1 Sep 2025 15:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756741446; cv=none; b=u4m5Hs1BhOTRNh/7vWYJ9lgIX3jXZYub7vgUy5HeXdJnbMTX5sQ9wOPgeEOCapI5fIE0HCFXzqI8Fw//YEFkrV22Un0wP+qkgoDMPnks2MNA3DMmNwdlMi1S0sP2F5Yw92yzszTfS+vmn8DkQ9pcunNX5hERkzVrEt8tJCZXY+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756741446; c=relaxed/simple;
	bh=pBIzLCGLfnpkMS5ifv2IuIlkVRJcyJWgB32zpPidkuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9mRwVoEY0whptdD5Mt3exg1BuhmlWnXqsVUZP870j4EkgXeYRcuDiN9xfZMoxJZrxxxRHuBhqd0PGeqTU0MLQvEsl4GPEhWQZ+Mw9IWPIChaJnF8RceRJXrE55AtIcMZWwZz7egR64sat1FuZ0aDM90seyC8LjxeOGKDm84GWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AulL2Ak9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756741445; x=1788277445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pBIzLCGLfnpkMS5ifv2IuIlkVRJcyJWgB32zpPidkuo=;
  b=AulL2Ak9J4j9wZytsZpPsdnnsM4dhs0lvsY1rdWiVautfPB2U9h5QgnC
   v/TD2ySlKyNJMIjEf8C6Y3dTMMXY6Ed26YLwkoaqO/RXVk6NfkTfXYovj
   6jnsW7p7lVxuVcwXb9AEOWMA7V5AO/IS+GD+r9wHlB0StYjNQzUDcA3yZ
   zqP4tMDAd3IPYAhNFFf/YhHRBWprz836YdL3Bb1q75TYaz/nImupt2/z5
   ILstwkRoehvzdoZ4trVAYA4/UgY8yvnN3dafxVsdJQAsyVI9iW7jNgtn5
   Uw6TxflTJsuzOMD2BobrbednvvFy8BZFnAGhiOZssIwthEoNeGEyP4hCD
   A==;
X-CSE-ConnectionGUID: ZkI4vBw7RNu7qmGa4sszRg==
X-CSE-MsgGUID: RdAMnYNXQmuJOKx+RqORQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="76601048"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="76601048"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 08:44:04 -0700
X-CSE-ConnectionGUID: lp/qH+0RSKSUDXdMvDjWIA==
X-CSE-MsgGUID: r5kQ9S/OTMaUiKdn8829mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170328349"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 08:44:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ut6hI-0000000ASbS-2NaZ;
	Mon, 01 Sep 2025 18:43:56 +0300
Date: Mon, 1 Sep 2025 18:43:56 +0300
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
	stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH v3 0/2] i2c: pxa: fix I2C communication on Armada 3700
Message-ID: <aLW_PGzTSFFhJOus@smile.fi.intel.com>
References: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
 <aLVle-fEMXlQlDR-@smile.fi.intel.com>
 <587f46d8-598e-4509-bc19-1e6d1b61a624@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <587f46d8-598e-4509-bc19-1e6d1b61a624@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Sep 01, 2025 at 04:49:20PM +0200, Gabor Juhos wrote:
> 2025. 09. 01. 11:20 keltezéssel, Andy Shevchenko írta:
> > On Wed, Aug 27, 2025 at 07:13:57PM +0200, Gabor Juhos wrote:
> >> There is a long standing bug which causes I2C communication not to
> >> work on the Armada 3700 based boards. The first patch in the series
> >> fixes that regression. The second patch improves recovery to make it
> >> more robust which helps to avoid communication problems with certain
> >> SFP modules.
> > 
> >> Changes in v3:
> >>   - rebase on tip of i2c/for-current
> > 
> > Hmm... Why not the i2c/i2c-host branch? (It's Andi's tree)
> 
> Simply, because the previous versions of the series were based on that since
> they contained a patch for the I2C core code. Additionally, I did not notice
> that there is a separate tree for host driver patches.
> 
> Although, I could send a new version, but that seems pointless since the i2c-pxa
> driver code is the same in both trees currently.

Yep, no need for a new version (I haven't implied that need). Just asking...

-- 
With Best Regards,
Andy Shevchenko



