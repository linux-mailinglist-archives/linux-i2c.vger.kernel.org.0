Return-Path: <linux-i2c+bounces-2129-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F9786FB36
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 08:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33335B2157A
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 07:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E818F168CC;
	Mon,  4 Mar 2024 07:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bo1m2D6j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9708512B6F;
	Mon,  4 Mar 2024 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709539120; cv=none; b=KzOlnGQpJx3vflzHu2pfRPBlCE3MTzKDrGdC3BAAjLio2NMK3rWURSVfDpSCEEzw8o56Q13WT7lJUOc1E+mEl8yRLYnDiNCvEqDXNGvKpDycVeEtSJ0xJlsar82DvK2Y9PWd/1IRuf9R0laJ0KEuIq+nZFp9CX3rfEV318JTu0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709539120; c=relaxed/simple;
	bh=kXL1G3MGkn84vTLCWth5uLNnu0KzeMkzapRKplDqIvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AM2zItFDZEaut9RxLpGdAzmFe2sl0j0UKb5fc3SdAg/dBWE8ogG7XBxRf9OWa2YXRTK7NeJVg/l3XpyvycglN/HkBQLNHtUC4ExHxdFtAvVcctqlz+FT+RBV9PnDd7aG3f575tWJT0PwFTgZ+7DamTSdfmVDN20FVsgk7noygEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bo1m2D6j; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709539119; x=1741075119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kXL1G3MGkn84vTLCWth5uLNnu0KzeMkzapRKplDqIvc=;
  b=bo1m2D6jsYlETg9bPDTYhTmC8bXPm7OaYhETtIM7JnQEIzHoDo0alfTQ
   4D3AHX+DiMqTLvDD+6GOhCrkZnOKI7vxAYBcUqIg8A3r6o3i20xBmKV1t
   vUPq4ZDxWpxQMsXflfCCWFJ1vJpqsfttJURcLjD5rYpquAooosdVWhVnX
   BLBL74l1Rsup8mw5fijL9P6oPGSlgRoNIEGhRiym3hC+y5D9pau9cW++u
   HBfjK7C+AYz8uYRNoPbxvq8Api3vF/y4uT2Wto4p+dg9ImsfzmBDfF+4S
   phAq/55DbbHoo34OSpRjcLYJ3qR84k70qVOPFweaZ867fWpa5RmVLd5VP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="21553989"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="21553989"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 23:58:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="937039792"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="937039792"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 23:58:35 -0800
Date: Mon, 4 Mar 2024 09:58:32 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, andi.shyti@kernel.org
Cc: mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] i2c: designware: constify regmap_config
Message-ID: <ZeV_KDgPdwo9cXsR@black.fi.intel.com>
References: <20240122033108.31053-1-raag.jadav@intel.com>
 <20240122033108.31053-2-raag.jadav@intel.com>
 <2caa903b-e5a6-499c-84ea-b8f85e4d1c71@linux.intel.com>
 <ZcSw6gV2GzIG9OOg@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZcSw6gV2GzIG9OOg@black.fi.intel.com>

On Thu, Feb 08, 2024 at 12:46:07PM +0200, Raag Jadav wrote:
> On Mon, Jan 22, 2024 at 11:44:22AM +0200, Jarkko Nikula wrote:
> > On 1/22/24 05:31, Raag Jadav wrote:
> > > We never modify regmap_config, mark it as const.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > >   drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > Both:
> > 
> > Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> 
> Bump.
> 
> Anything I can do to move these forward?

Hi Andi,

Are these worth moving forward?

Raag

