Return-Path: <linux-i2c+bounces-5047-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 105C2938F61
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2024 14:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77234B212A7
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2024 12:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D8416D4D1;
	Mon, 22 Jul 2024 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+YGW+Kp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6801316CD35;
	Mon, 22 Jul 2024 12:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721652663; cv=none; b=sXydc8ugbGt5BDrss5bt2noToTqZ9ymvgGEYCuxCLvAhuFWzQxc7xic33nlIfGW1gzlc5QGVgDzKMwFLBCrwCCcMuFFfgEDy36XgqSefIgekFN1DhlmAkzU5qR8TRllveECHmF8FL/nNvb1gJN8H2vR1AeN/HbCs9pWvAnS9Msw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721652663; c=relaxed/simple;
	bh=qrd1dTlK6YWzInxUMiE9Br8NUoMuylWX1TV8a6/aSko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8X2sIYw2B1fK9zLuhiQDfMBWtRt/LkDXoBCFDN7b35vR3LjIK9+UQYYBzlnlp+J3/T2DMfM7/0EDSNU76cb+j26SXygOhAVFDa7/2dHz72hpfUIg6xpj6QbuudlgwX5QfzfL8h59RI9N909GZEXifKSDoLpdCIceHC3R/r0TU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+YGW+Kp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721652661; x=1753188661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qrd1dTlK6YWzInxUMiE9Br8NUoMuylWX1TV8a6/aSko=;
  b=V+YGW+KpeEntNyB9i4sod+UVERmulJfX3rEm/u05FblsEkm0PKniVXhf
   0nDjVhzIZ1OwRDgnIPBie+7XEpUcQo5/OB9Yvo3adLNMyJoMvmLFbn89F
   vDc//H8QH45lCyzUOMne+AukW5EYgsY2aLFA4o0Y/DHZaXsd/57qBewZr
   GUZJez9ZZWF9p+9MaeMp2mw6IHEhFXq0f4nuXGF3OdZYGk3IwvO0JGIk4
   vt+4+zjpDDgx8YQviIhiwqk1TiDseMSisdFAkKlEZ3zbz4ziwVuSDFQSH
   m1TGRSpBZ9X9LAH/cMGKjjuR41tIIRS8e92Xg1BMqZNptbaPXcCEH9Hab
   Q==;
X-CSE-ConnectionGUID: Hhvmr43YSsanHUL94s9dMQ==
X-CSE-MsgGUID: LXope0PNToeLdTQMuPJ2SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="29803592"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="29803592"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 05:51:00 -0700
X-CSE-ConnectionGUID: +FA+TTCUTFKjLe6Hqnq4zQ==
X-CSE-MsgGUID: Ww7Q5HfVRQa2jUd3zgIxWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="56438782"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com) ([10.245.246.206])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 05:50:54 -0700
Date: Mon, 22 Jul 2024 14:50:51 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Zhenyu Wang <zhenyuw@linux.intel.com>,
	Zhi Wang <zhi.wang.linux@gmail.com>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-gfx@lists.freedesktop.org>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-xe@lists.freedesktop.org>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:INTEL GVT-g DRIVERS (Intel GPU Virtualization)" <intel-gvt-dev@lists.freedesktop.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
	Zhi Wang <zhiwang@kernel.org>
Subject: Re: [PATCH v4 3/6] drm/i915: Make I2C terminology more inclusive
Message-ID: <Zp5Vq9JoYC_OrA2C@ashyti-mobl2.lan>
References: <20240711052734.1273652-1-eahariha@linux.microsoft.com>
 <20240711052734.1273652-4-eahariha@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711052734.1273652-4-eahariha@linux.microsoft.com>

Hi Easwar,

merged to drm-intel-next. Thanks!

On Thu, Jul 11, 2024 at 05:27:31AM +0000, Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
> with more appropriate terms. Inspired by Wolfram's series to fix drivers/i2c/,
> fix the terminology for users of I2C_ALGOBIT bitbanging interface, now that
> the approved verbiage exists in the specification.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

I realized after pushing that this had the tag:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Not a big deal, but it's still a minor mistake.

Andi

