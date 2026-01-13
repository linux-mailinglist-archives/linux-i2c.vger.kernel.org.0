Return-Path: <linux-i2c+bounces-15084-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D12D1704C
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 08:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D60A230119A7
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 07:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F1B19CD0A;
	Tue, 13 Jan 2026 07:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J8K5ueo5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C881E4AB;
	Tue, 13 Jan 2026 07:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768289435; cv=none; b=aFxOmFiRb+LoFTN3ebMch2LXLezopV1ZxZv48g7fvlZdXxLPiYvGod/ttLv42jbHebHvGL6w7zSLKhTg3OcPAq/Ki3spnxjyu6RI8AEo1Aheoqj7ixDGl6uYmxy4V+g1erXMXB/gS46Ge1YqohzGyQ8s02m5l3RuyjXeJAqm3yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768289435; c=relaxed/simple;
	bh=czkJHgYktCMPxNiUVyD13nCpnqhBJSxVqGanmLlLGXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChkMbgDe2eYH0776BVhsjk536ROzdoFvcNGuyvuwpjenpqnmvvQkDzUfgQeheZYqCTAHsj2o8OpC/FDrFrEzgF82VHguiO8YVmvmtCxO+4GisTwd2fsfqWviwB2QbKaxCyrIIGRYqhbz8psAmEryovb/LfYf1mALt7McjBuUnKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J8K5ueo5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289434; x=1799825434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=czkJHgYktCMPxNiUVyD13nCpnqhBJSxVqGanmLlLGXk=;
  b=J8K5ueo5/2exlO1CuGn1CH9Cgb5wRC08xngl8NFHqeea7HJudxk8ec8I
   jaxc/+Hlw6DHR16FqWod2M3w6pUYvHHf6efPeQAlbuRUQ2PfnQFIjYYzN
   f5ejgCf1nAYtcBXZly+AtBp5kECpVheSN+5/qtDOhxCHnc9uu7zXxYO3e
   BFhM9ehiSx3Yd+QZcoCTaYLatwsn4LlkdXseBvgZan6CSubI0/B55V1Yy
   bwO/6nuPA19bBRBTqt4Nz7S48dz0WqBDJ8t0YIVx7azOUi+NpcvcWBhmK
   1QWdkLUZBLTfmyhTfU7OZR4paNxmUKXtF4eV8M7l+Kz8mXNApkInuvLIO
   Q==;
X-CSE-ConnectionGUID: pXnUZ3TYQq+ua3rnseNLmQ==
X-CSE-MsgGUID: WCagTAqvTci60K0Be5SO0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73422248"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73422248"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:30:33 -0800
X-CSE-ConnectionGUID: mKG1wo8QST+cXxaI2gy/Lg==
X-CSE-MsgGUID: BimtrAh4RWOnZtDE1ZI6Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208824799"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:30:30 -0800
Date: Tue, 13 Jan 2026 09:30:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v1 2/2] i2c: mlxbf: Use HZ_PER_KHZ in the driver
Message-ID: <aWX0lB99XtdpHgqy@smile.fi.intel.com>
References: <20260112135603.4150952-3-andriy.shevchenko@linux.intel.com>
 <202601130414.VJyCNWzI-lkp@intel.com>
 <aWVbYYusNh_q_91o@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWVbYYusNh_q_91o@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jan 12, 2026 at 10:36:54PM +0200, Andy Shevchenko wrote:
> On Tue, Jan 13, 2026 at 04:33:04AM +0800, kernel test robot wrote:
> > Hi Andy,
> > 
> > kernel test robot noticed the following build errors:
> 
> Ah, okay, this needs to be based on the series that adds HZ_PER_GHZ as it
> provides the needed header inclusion.

The series I mentioned is this one:
https://lore.kernel.org/r/20260112134900.4142954-1-andriy.shevchenko@linux.intel.com

-- 
With Best Regards,
Andy Shevchenko



