Return-Path: <linux-i2c+bounces-5050-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B65D0939281
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2024 18:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4191FB214BB
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2024 16:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970D816EB65;
	Mon, 22 Jul 2024 16:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2gvWKrW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1852907;
	Mon, 22 Jul 2024 16:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721665729; cv=none; b=Opj8hNkSsZvjpyvl1MET2kIUL8TfZxjMRrxo0GYvq6BTQsO2CI3456r9MjhyKrOCp+CMlXCkOl1deXSMj3jpccKRtqwACDHxKzZO6jiQZDwyEdV6rzNZc2V29P8xPUpD3C5TGqv8VM397kjhAICMCzoGoNbKjIwxtlAk6lGYfiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721665729; c=relaxed/simple;
	bh=O6PV0z1EQeDCS7838sXriVwFRCvZQyidYdmAWxD6its=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGUGq4Ei1yhasp1y+rc4fLZJNRGFB1aN9cVE7UROEXcxJxMBkxr+1Nd9uzkZd7BDSpxc/G/KjLtBftrmFJwjYpP2NZP5pgXR/TUplG3SRd+eUauVRDwZyUQKhHYcfNPYStwUjZ2bcGvZFOmm2TfbnA1GRsIW2DjBd+Sf732I2Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2gvWKrW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721665728; x=1753201728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O6PV0z1EQeDCS7838sXriVwFRCvZQyidYdmAWxD6its=;
  b=P2gvWKrWXYyOx4E3VUCEdFCAuHeVwyw085mFBfKVOnlMA6uzKYKGEzOE
   7bCFXyX/OK4RCAhPAOMCuJXqqQy3AnhPsrMsMwQZCdltLTkDo+Qe8Wi/6
   IzlY50Ey+qwlpgX4pIvpmdhKyMK8V2yu8gOOpxu07gwO1smJlnl+lUO4c
   TIBqDRiSwZKALJBLogZYCTK7GDkgYQYEd4RRIJdbmxd3iezVlIzx1oqSb
   rulPJljkq5aB0gDaZIVvik/6tbuDSHG+ph2h/1vdMsIrmNyXfYd0Gdfnj
   Euv/dJocKL16X2m9WfuVbBth4zFWhWAfm4jmMWfQSezI20DbqoDAhuMrC
   A==;
X-CSE-ConnectionGUID: H3yXGf97TUu0XcT5HPQ61A==
X-CSE-MsgGUID: NwUHk/IyRVCQ3S1XZ52cVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="18864854"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="18864854"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 09:27:48 -0700
X-CSE-ConnectionGUID: Tr6MVFI8SpWBPVLz0HFYVg==
X-CSE-MsgGUID: VKKt6ttPR/STmKV9N+0CoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; 
   d="scan'208";a="56765396"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com) ([10.245.246.28])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 09:27:42 -0700
Date: Mon, 22 Jul 2024 18:27:37 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
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
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
	Zhi Wang <zhiwang@kernel.org>
Subject: Re: [PATCH v4 3/6] drm/i915: Make I2C terminology more inclusive
Message-ID: <Zp6IeYDbdCSeFmo9@ashyti-mobl2.lan>
References: <20240711052734.1273652-1-eahariha@linux.microsoft.com>
 <20240711052734.1273652-4-eahariha@linux.microsoft.com>
 <Zp5Vq9JoYC_OrA2C@ashyti-mobl2.lan>
 <24fa9e9b-81a8-4bbe-8d13-4d559ee76a96@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24fa9e9b-81a8-4bbe-8d13-4d559ee76a96@linux.microsoft.com>

Hi Easwar,

On Mon, Jul 22, 2024 at 09:15:08AM -0700, Easwar Hariharan wrote:
> On 7/22/2024 5:50 AM, Andi Shyti wrote:
> > Hi Easwar,
> > 
> > merged to drm-intel-next. Thanks!
> > 
> > On Thu, Jul 11, 2024 at 05:27:31AM +0000, Easwar Hariharan wrote:
> >> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
> >> with more appropriate terms. Inspired by Wolfram's series to fix drivers/i2c/,
> >> fix the terminology for users of I2C_ALGOBIT bitbanging interface, now that
> >> the approved verbiage exists in the specification.
> >>
> >> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > I realized after pushing that this had the tag:
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > Not a big deal, but it's still a minor mistake.
> > 
> > Andi
> 
> Thank you for the merge, Andi! I'm missing what the mistake is, I added
> the tags as I got them. Was I supposed to drop the R-B when Rodrigo gave
> an A-B?

Sorry, it's not yours, it's mine. I should have checked more
carefully the tag section before pushing. You did everything
right.

The dim tool (drm maintianers tool) picked up all the tags added
and I missed the double tag.

This was more a message for Rodrigo, in case he wanted to fix it,
but I guess no one will complain about.

Thanks a lot for your work and effort!
Andi

