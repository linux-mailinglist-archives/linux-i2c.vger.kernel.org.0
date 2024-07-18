Return-Path: <linux-i2c+bounces-5020-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8138934B4E
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 11:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37DF31F21BF1
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 09:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0154D84DF5;
	Thu, 18 Jul 2024 09:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djTNqt3x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160577D3EF;
	Thu, 18 Jul 2024 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721296485; cv=none; b=B1FYghFs5/yQINEbjh8hOhXArLgezDjgpk7y4xy4CSN7WD8e5pnwZpRIK5vtYfLBMDrsifBkQ+QImoXMWieHUg0vjr8Pv+Hq81MGMhg/tCW2VRJI6bcVYqG/BZSdlLemLsOjlX4DFkjyu47DEZn9/fE/MyBPqLYwZGAu4mVJQCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721296485; c=relaxed/simple;
	bh=LNvfFe6lpclQyzVtfWGQIEmYsoX37dvAyhtKRFDDsFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5OnOxPEWzh+j1BEC7BDYa198tPa4UdWLn3iaCZEoqeh9LJM15NYRZVISo+MPQUzJveubQNKhmZSKcJozyVsFDrKEKAvpFMXsydxNRJFNkUC2h3GR3137V3LwtQfnBxLZfMNe/XlclaZFel4cxlR+N1z+mQCzfBqjZ3A7etCtqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djTNqt3x; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721296484; x=1752832484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LNvfFe6lpclQyzVtfWGQIEmYsoX37dvAyhtKRFDDsFM=;
  b=djTNqt3x0NVN/TPsCHJHQUKmNhkIE2DW7FcWg333NVa9X9SX/OqGlMrz
   uBFZK3HjNMdiulFJhnPKNClBeGUrSJ7Es3doFdFtFkef4ul5hYNmLvOLz
   zUH8isZdJ2m3pnothz+TDORmgjT7NAzCAVCaUQ97qu0OZgGqPf0PqaDG+
   Y+TeeibqrjJcmZXF+efKfediQGcK5XI/drXLGKgNJKHXgKCAsJ4G+auJF
   OnFIIePgyQyF/Ffr8FuyxtNgrLJpGA8W6bjWbXdDBJyK+1k8+xWwfwaj7
   LUCAqtQWFRfIW9YqYgmYFB2hEUpkwhb9vR7ae0pwakT8OaBJNvDk5Syu8
   g==;
X-CSE-ConnectionGUID: b1tkrImdQ8qPoITdBycwYA==
X-CSE-MsgGUID: Ww5gAsH/Sk604LI8rp9e6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18805822"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="18805822"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 02:54:43 -0700
X-CSE-ConnectionGUID: 2zJkzbk3Qg25Fe946qM/UA==
X-CSE-MsgGUID: 9WjGZjySSfipH90FxDXWBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="73943022"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com) ([10.245.246.52])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 02:54:38 -0700
Date: Thu, 18 Jul 2024 11:54:34 +0200
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
Message-ID: <ZpjmWtmaiu294ca_@ashyti-mobl2.lan>
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

On Thu, Jul 11, 2024 at 05:27:31AM +0000, Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
> with more appropriate terms. Inspired by Wolfram's series to fix drivers/i2c/,
> fix the terminology for users of I2C_ALGOBIT bitbanging interface, now that
> the approved verbiage exists in the specification.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Zhi Wang <zhiwang@kernel.org>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  drivers/gpu/drm/i915/display/dvo_ch7017.c     | 14 ++++-----
>  drivers/gpu/drm/i915/display/dvo_ch7xxx.c     | 18 +++++------
>  drivers/gpu/drm/i915/display/dvo_ivch.c       | 16 +++++-----
>  drivers/gpu/drm/i915/display/dvo_ns2501.c     | 18 +++++------
>  drivers/gpu/drm/i915/display/dvo_sil164.c     | 18 +++++------
>  drivers/gpu/drm/i915/display/dvo_tfp410.c     | 18 +++++------
>  drivers/gpu/drm/i915/display/intel_bios.c     | 22 +++++++-------
>  .../gpu/drm/i915/display/intel_display_core.h |  2 +-
>  drivers/gpu/drm/i915/display/intel_dsi.h      |  2 +-
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c  | 20 ++++++-------
>  drivers/gpu/drm/i915/display/intel_dvo.c      | 14 ++++-----
>  drivers/gpu/drm/i915/display/intel_dvo_dev.h  |  2 +-
>  drivers/gpu/drm/i915/display/intel_gmbus.c    |  4 +--
>  drivers/gpu/drm/i915/display/intel_sdvo.c     | 30 +++++++++----------
>  drivers/gpu/drm/i915/display/intel_vbt_defs.h |  4 +--
>  drivers/gpu/drm/i915/gvt/edid.c               | 28 ++++++++---------
>  drivers/gpu/drm/i915/gvt/edid.h               |  4 +--
>  drivers/gpu/drm/i915/gvt/opregion.c           |  2 +-
>  18 files changed, 118 insertions(+), 118 deletions(-)

it's a complex/long patch and I want to make sure there are no
subtle errors. I will submit another round of tests and if it
convinces me, I will take it in.

The failures you see[*] are definitely not related to this patch,
but better safe safe safe than sorry sorry sorry :-)

Thanks,
Andi

[*] https://patchwork.freedesktop.org/series/131867/

