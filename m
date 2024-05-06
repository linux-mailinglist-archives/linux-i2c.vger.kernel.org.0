Return-Path: <linux-i2c+bounces-3424-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DBB8BCA58
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 11:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F178E1C21AFA
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 09:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7E31422C5;
	Mon,  6 May 2024 09:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jz9VJjCq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3944484FB3;
	Mon,  6 May 2024 09:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714987057; cv=none; b=LSNAdJ6znSldhACQ0j6+DINRyFZTjZPhabim7aWaFPxr63EvUqRAAAUOgpaLA5/Pz7/J2yO2EuUltww2MdhGtV2swnh62nUmsksg5ArO399lD6VeAaBDDMK/PZenoWBw7G+zOWILDJqWdP3+DD34cQ8HL18NQ0i4XCjRz6QFAcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714987057; c=relaxed/simple;
	bh=cl18l/TXvz4Zvo1045jScsKEtjhBFIXuANQZjuBD3wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFCFF1dlXUcNvCg35EU9QCebivV7/0AWVZNld52nuzvtpx4hAJbMP5HF+tlh3ioKEzbN5OslgVfvDhrFjU5PCT6ZGogvSCZwfVVeLeyFckb5d/bF3LvJTvVqjOfsNC+0sYTMYTzHdqF3udXXluz8kj4JyDB+yLdcCKgxX1ZSkNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jz9VJjCq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714987056; x=1746523056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cl18l/TXvz4Zvo1045jScsKEtjhBFIXuANQZjuBD3wQ=;
  b=Jz9VJjCq4pW1BSyFf7c1HH49Aah5cltvu3ypy+RX2KG6o+LuXLreovkn
   WXHQFqjPeGHoOOytQPfWK2ckWi7BL5feCDzHnazFrprCQVXz7rr3kO761
   c9EdpIvwiYmEJ4VRZpSnK9ou2RuekMQ9aQ4YbfrcFPcCGeJOF193aCh7U
   s6rpnuSCWyt5XxRxJ0ESEH9Wgngj3xoDkQkDX3UKSy7BdGk5BhP+BYXVL
   EFoAN7tfOEqxwTjUgU+iIHB3zolrGT/pd8aa+Ro8QWyYHhI1oICYjqInm
   wm9s+m3WdmIXNkJOr9kQeEq12+mbgFPXOFi47fx2VPSi0M4jwYgVsn2xy
   g==;
X-CSE-ConnectionGUID: V2zGwAt6SRyaujcJNFaEuw==
X-CSE-MsgGUID: 8AtP1QSDSFKldruO3DFu9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="11257829"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="11257829"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 02:17:35 -0700
X-CSE-ConnectionGUID: 4+Jvg8cMTyaYXdytTnxAvQ==
X-CSE-MsgGUID: JlvUVT2gRSG1ghf7Ms253g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28504342"
Received: from unknown (HELO intel.com) ([10.247.119.173])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 02:17:18 -0700
Date: Mon, 6 May 2024 11:17:09 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
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
	"open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
	Zhi Wang <zhiwang@kernel.org>
Subject: Re: [PATCH v2 03/12] drm/i915: Make I2C terminology more inclusive
Message-ID: <ZjigFRyMhgcS6Zju@ashyti-mobl2.lan>
References: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
 <20240503181333.2336999-4-eahariha@linux.microsoft.com>
 <ZjU8NB-71xWI2X73@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjU8NB-71xWI2X73@intel.com>

Hi,

On Fri, May 03, 2024 at 03:34:12PM -0400, Rodrigo Vivi wrote:
> On Fri, May 03, 2024 at 06:13:24PM +0000, Easwar Hariharan wrote:
> > I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
> > with more appropriate terms. Inspired by and following on to Wolfram's
> > series to fix drivers/i2c/[1], fix the terminology for users of
> > I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> > in the specification.
> > 
> > Compile tested, no functionality changes intended
> > 
> > [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> It looks like the ack is not needed since we are merging this through
> drm-intel-next. But I'm planing to merge this only after seeing the
> main drivers/i2c accepting the new terminology. So we don't have a
> risk of that getting push back and new names there and we having
> to rename it once again.

I basically agree with this patch (without the eDP part).

But the documentation is still not update and I think we need to
hold until Wolfram has done that.

In any case, it's good to anticipate the reviews.

Thanks Easwar,
Andi

