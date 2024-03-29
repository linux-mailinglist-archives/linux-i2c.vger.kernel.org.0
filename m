Return-Path: <linux-i2c+bounces-2675-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B30AE8922DD
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 18:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CBEB1F264BD
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 17:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB01134412;
	Fri, 29 Mar 2024 17:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0Vm1RuA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2C4482E9;
	Fri, 29 Mar 2024 17:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711733930; cv=none; b=h2ZHJdUuGdc39B6we9Zw8B7FNi/6cpDCVFeJqqYk52UyBMwG8E1JAzgqrkWB7dtieI97hBbJnEJGYHKrBKSBv2hSlknr//IcY/1kQdPdqkWsMhycWehyr80+IctOaIuu1jpEMGMghhFZ9S3rgLIYi9UNDvXm4Fwfg76gviV+OdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711733930; c=relaxed/simple;
	bh=2hBaQawS2DQq+hSZa4nEoohpdH7i4ouzg4+WFmp/jBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CkwuwiYsSixuJYyWP3vguB3gq4R1RqXbbpz4MFoz30U/QskRkG3AMowPniXou23jrfr2k0XOwvpRe8Rzm3xdam8Lyyj/oxH1F77DNBBI3U9SuQ34hM7jR4w88i5gDb7iMC7bIFss8sP5R8f/H84LnQpHyBz4QI31vdBf3hhiyFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0Vm1RuA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711733928; x=1743269928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2hBaQawS2DQq+hSZa4nEoohpdH7i4ouzg4+WFmp/jBs=;
  b=A0Vm1RuAXVl54LN1ZL8oFxlb/7vpKFUXh4MDWJbH7vfbckXCtqwCrQoO
   MGeoMPhMGXPhpeN9xYt9IrtkR6zzDRjzLPLMgv0ixtw0WNFvssH5ex0Eu
   cLMuKhQ/lpRpYuN6AqN2G/x0lvSp0bnXzrNuiGMWG0JXd3x6pJzhGi3QJ
   CzuC6pnm+/nscvaqJOYZi+5ZtAdOTp5EIbwXmmtwat5ohJQ+utIyTY3JB
   8c434NwiHhOYVcYthw9Q1qZIMA8DHUcFK1fu5ex5ffHgKsCEPto0cFx6v
   gDSO76vuVB8uYy83RBZDtg65f7RX+WySYydQ+Q+QXoouXpxvo0alqLseM
   g==;
X-CSE-ConnectionGUID: 387IWgCGQoKErZwxn70UxA==
X-CSE-MsgGUID: OEt/rMpWSTqXsnUrNUUn2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="29413577"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="29413577"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 10:38:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="17669687"
Received: from unknown (HELO intel.com) ([10.247.118.231])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 10:38:17 -0700
Date: Fri, 29 Mar 2024 18:38:10 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
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
Message-ID: <Zgb8gieDzZtZmg2q@ashyti-mobl2.lan>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-3-eahariha@linux.microsoft.com>
 <Zgb3VYsgLjhJ2HKs@ashyti-mobl2.lan>
 <ceeaafe1-49d5-4602-8251-eed63a1be2b6@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceeaafe1-49d5-4602-8251-eed63a1be2b6@linux.microsoft.com>

Hi,

On Fri, Mar 29, 2024 at 10:28:14AM -0700, Easwar Hariharan wrote:
> On 3/29/2024 10:16 AM, Andi Shyti wrote:
> > Hi Easwar,
> > 
> > On Fri, Mar 29, 2024 at 05:00:26PM +0000, Easwar Hariharan wrote:
> >> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
> > 
> > I don't understand why we forget that i3c is 1.1.1 :-)
> 
> That's because it's a copy-paste error from Wolfram's cover letter. :) I'll update
> next go-around.

not a binding comment, though. Just for completeness, because we
are giving the version to the i2c and smbus, but not i3c.

> >> with more appropriate terms. Inspired by and following on to Wolfram's
> >> series to fix drivers/i2c/[1], fix the terminology for users of
> >> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> >> in the specification.
> > 
> > The specification talks about:
> > 
> >  - master -> controller
> >  - slave -> target (and not client)
> > 
> > But both you and Wolfram have used client. I'd like to reach
> > some more consistency here.
> 
> I had the impression that remote targets (i.e external to the device) were to be called clients,
> e.g. the QSFP FRUs in drivers/infiniband, and internal ones targets.
> I chose the terminology according to that understanding, but now I can't find where I got that
> information.

The word "client" does not even appear in the documentation (only
one instance in the i3c document), so that the change is not
related to the document as stated in the commit log. Unless, of
course, I am missing something.

I'm OK with choosing a "customized" naming, but we need to reach
an agreement.

I raised the same question to Wolfram.

Thanks,
Andi

