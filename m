Return-Path: <linux-i2c+bounces-4914-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E14D092E6A4
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 13:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EF161C21BC0
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 11:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95431607AA;
	Thu, 11 Jul 2024 11:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhXgsXmc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A55215B10A;
	Thu, 11 Jul 2024 11:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720697061; cv=none; b=fl8DVLZUH8nx5ZOzyMRCEVP98N+jltAK7HkmZn51sZKwg2D/o1AYVB/3FdnOK12g7LaY++6mE2beZfuuZfCcu8pRUJ8KI3dXTgg87cUgY5yFUCo7Gn9XiQJ/ul+noBnkoGATMSyimUv7W50KyHtYdClgPLOl6J3cgJjutyP/da4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720697061; c=relaxed/simple;
	bh=o/2EvU8Ne6JzHNgJUsH762dUzuzFgrow+gSs4PLwHAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVCG390ZOtH78aqh67JdihcxlsWW8VgyXt8RUMv4bYP22X0RA591+VksCD/PKEFEmNTrAxZIi394DMtqWJQs+NkN1a5hkVtpoUyYTjWytssBR0EKiQ/rE8VQWkRZlqKeyb44JGJd/tlZBB5TsLW62N2VDXoQyRVcM04CRrrVDy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhXgsXmc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720697061; x=1752233061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o/2EvU8Ne6JzHNgJUsH762dUzuzFgrow+gSs4PLwHAA=;
  b=RhXgsXmcnjKzr6B4rYihs3tmDxiz6p9GyMYYOEhCW4+RZ2y/k+t2FmrO
   mde0V+TzEc6RdR8uD0UbUnwVcDhpzI1G70rSv+kk4wdw4mi+WkYNt6S+G
   j1XJVwC46t2C32+OyX4FITIKoiPAyPImD2HkLDNwG8IL5u8YXJN4wh/GH
   /z5eOs4n1VfxI3BAWj5hO98qfvyMeSgQgultvGfvIlGD1VlCbv5nsMv84
   xJVJahtl6gkt6dls86A6johukKB4Fw2N5AzS6y56lqz2RfJjIxRArqS0z
   2ITiQyA3gtJk9J7vfw8ojTkYdO7HKP7dOChBHvMQWpl9wrRRDigt4Hdx4
   w==;
X-CSE-ConnectionGUID: sEzytX45QsSQMMOCGfcjsQ==
X-CSE-MsgGUID: mq5Q3y7SS0aOhso5V7gbjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="40582706"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="40582706"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 04:24:20 -0700
X-CSE-ConnectionGUID: VsJm3oa9S3yZ6uUi3Zm8Fw==
X-CSE-MsgGUID: VrbT04LEQ3+kl1RHWDS/FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="49178595"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com) ([10.245.246.252])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 04:24:12 -0700
Date: Thu, 11 Jul 2024 13:24:09 +0200
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
Message-ID: <Zo_A2Ykh3-YI7Nff@ashyti-mobl2.lan>
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

good job! Thanks for taking care of this!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

