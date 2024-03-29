Return-Path: <linux-i2c+bounces-2672-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2898892283
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 18:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBF731C25A3D
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 17:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3973A33CC4;
	Fri, 29 Mar 2024 17:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S61OubVM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD614A0A;
	Fri, 29 Mar 2024 17:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711732604; cv=none; b=a5bNJkHqBpyQ32blupCniK7naeCq/Tjuu1cPTzPu6d7Kd58nLOKqdwvhjZaXjIXMJCD25zSvxBe0yc2nExXkwZA8AEKX+9ShTlF3usuB/tPNvYnRdqIJ2RSNTOgDnNY/5hB9oq5bRIEhznQcJbG+whmk+oSt/86VtpSdqyiJaRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711732604; c=relaxed/simple;
	bh=3cDebFPhfpcNOYa1nrqJnGUfaFo9yHWPr4HlWxb0MNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgkG8b0AYcZW32s3HHmBYyMDH+4k+F1e7VLb6B21jToLFKesnY64L1GwpNwPjVL+cQTj80vYxjzE7OHettOU2L/1+Iz1eIrobOoqCbNMJfOIdf8bXPWdvz6v6Gp+p/u9wkIqu7HeOcTCGt89yYM4Fy411kako0ChjiV59jcTOh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S61OubVM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711732603; x=1743268603;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3cDebFPhfpcNOYa1nrqJnGUfaFo9yHWPr4HlWxb0MNU=;
  b=S61OubVMHPxQIR3y69y7OuL0uvoXp5hGAaX+xADOWzyMiHZczimUowxb
   6caKfjoD8giubHBtAxto2mtq4864jSqNBWSX/0PFVqxLtdzrXGFoiahcm
   roBQDVyEv+7nUaEccdVFQ/WnyScpUKUqOceIGuvjgm2wy62raeYSgxrFv
   wO2DB+2gy/xYtngfkyUSDkZBjz87OHgRWhc9bCKiM1ZifzfWag/ofUXfz
   VTFqR0WDXXpyKA2QNTPQR9QhXyB2v/tnTNAMT9566re6V6yUlSsFL5VC1
   hda/ihwK11b25XGzGPFShcCxjZYtOWGgZ5gM1gMgxLk5qnkA3uUXulGQG
   g==;
X-CSE-ConnectionGUID: GDHlFLjIRMSfpsQbdSuslg==
X-CSE-MsgGUID: yyywARLFRqmbd8hVHt9ytA==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="6865269"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="6865269"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 10:16:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="21740222"
Received: from unknown (HELO intel.com) ([10.247.118.231])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 10:16:11 -0700
Date: Fri, 29 Mar 2024 18:16:05 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-15?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Evan Quan <evan.quan@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Candice Li <candice.li@amd.com>, Ran Sun <sunran001@208suo.com>,
	Alexander Richards <electrodeyt@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Hamza Mahfooz <hamza.mahfooz@amd.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>, Alan Liu <haoping.liu@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Wayne Lin <wayne.lin@amd.com>, Samson Tam <samson.tam@amd.com>,
	Alvin Lee <alvin.lee2@amd.com>, Charlene Liu <charlene.liu@amd.com>,
	Sohaib Nadeem <sohaib.nadeem@amd.com>,
	Lewis Huang <lewis.huang@amd.com>,
	Tom Chung <chiahsuan.chung@amd.com>,
	Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
	Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
	George Shen <george.shen@amd.com>, Aric Cyr <aric.cyr@amd.com>,
	Jun Lei <jun.lei@amd.com>,
	Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
	Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
	Dillon Varone <dillon.varone@amd.com>, Le Ma <Le.Ma@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>, Asad kamal <asad.kamal@amd.com>,
	Kenneth Feng <kenneth.feng@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Yang Wang <kevinyang.wang@amd.com>,
	Darren Powell <darren.powell@amd.com>,
	Yifan Zhang <yifan1.zhang@amd.com>,
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
	open list <linux-kernel@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-gfx@lists.freedesktop.org>,
	"open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS" <intel-xe@lists.freedesktop.org>,
	"open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v0 02/14] drm/amdgpu,drm/radeon: Make I2C terminology
 more inclusive
Message-ID: <Zgb3VYsgLjhJ2HKs@ashyti-mobl2.lan>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-3-eahariha@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329170038.3863998-3-eahariha@linux.microsoft.com>

Hi Easwar,

On Fri, Mar 29, 2024 at 05:00:26PM +0000, Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"

I don't understand why we forget that i3c is 1.1.1 :-)

> with more appropriate terms. Inspired by and following on to Wolfram's
> series to fix drivers/i2c/[1], fix the terminology for users of
> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> in the specification.

The specification talks about:

 - master -> controller
 - slave -> target (and not client)

But both you and Wolfram have used client. I'd like to reach
some more consistency here.

Thanks,
Andi

