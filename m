Return-Path: <linux-i2c+bounces-14176-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0BCC70AF5
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 19:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id E92B928D8C
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Nov 2025 18:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD8A3538A7;
	Wed, 19 Nov 2025 18:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPiK1GYh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF4C3101AB;
	Wed, 19 Nov 2025 18:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763578016; cv=none; b=M8yQg84/NKXexu5RlNDpbXah2lG5/RBPWzpyocfYaxLONywSPfqZB77vLTeHM5Q/Ti5gVSRBH4uBRWZQ1YW2lJDoPLQowIbckYhR5+m0csqy0diyKNgMPsAx4BZ3A7mdyzkDvS9NTCRkdFR0udPTh+I8TUatSI8qqp4dKZhGgwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763578016; c=relaxed/simple;
	bh=+L5dqYe4lbCTZNCO1ARmj3AGtDovp1AJchwoTDUFXvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOjoXKjCcXChH4SA+3HGvd4UM2kyfZ5AYnuCBWGsHNGTK+4CPV1nUlYGOOXFol76PNn3r89vDK+hbr4/HFveNyycR+U1DhZOMOwRKDCV2cBsAn/kq7qVX+rDqpVjBmsZtkPFE+PR6wNFLucOsCAUWFUPcsw7vN3dtO75pMIA59s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPiK1GYh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763578012; x=1795114012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+L5dqYe4lbCTZNCO1ARmj3AGtDovp1AJchwoTDUFXvA=;
  b=IPiK1GYhwavmIYMQMDUE4hcDgOCm+/p5nzphaXzu0jINjlgjNPHszMF6
   8Np3Mk3RVx1qaoFjw+RcKGD84GOOOQkKrj2qfK+sr1hC+ZdnrjhqaOPK0
   UmoR1qUEk/jZblHov5R+oxZLzAoc+QvU7Q7Ycb1OheKmdjotuv8HGc2Jb
   ibS2Gdj/nbBrxiIN0EepGY2j+uYnZad+BRePgKkHNdRTId6n5d4gZeYq8
   JTRC886P0VDMeufB5GLCW2Rrk6xUMXWYec90Z5WFKoVSS+FQtWc9i3aCX
   r+BqfU1/AzeeeYpPJkifn3kCoz1WDj+3ksUfZllx60QZS+cXhji8j/ouW
   w==;
X-CSE-ConnectionGUID: txEdIygxTBC52FpD95fKsA==
X-CSE-MsgGUID: WYOfrj60SbOakLIZ8HWcKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65573189"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="65573189"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 10:46:45 -0800
X-CSE-ConnectionGUID: HcqK3a3nQWCfPjIVvrmbNg==
X-CSE-MsgGUID: fu3L7RF7SOmj4p82+bkv2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="222068970"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 10:46:40 -0800
Date: Wed, 19 Nov 2025 20:46:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Dmitry Guzman <dmitry.guzman@mobileye.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 4/7] i2c: designware: Use runtime PM macro for
 auto-cleanup
Message-ID: <aR4QjtJqfZGN2_jw@smile.fi.intel.com>
References: <20251119-i2c-dw-v3-0-bc4bc2a2cbac@bootlin.com>
 <20251119-i2c-dw-v3-4-bc4bc2a2cbac@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119-i2c-dw-v3-4-bc4bc2a2cbac@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 19, 2025 at 04:05:33PM +0100, Benoît Monin wrote:
> Simplify runtime PM handling in i2c_dw_xfer() by using the
> pm_runtime_active_auto_try guard. This adds the proper handling for
> runtime PM resume errors and allows us to get rid of the done_nolock
> label.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

LGTM and order kept the same, shouldn't regress.

-- 
With Best Regards,
Andy Shevchenko



