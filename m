Return-Path: <linux-i2c+bounces-5969-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 149D9966970
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 21:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3618B2150D
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 19:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0041BB6B6;
	Fri, 30 Aug 2024 19:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfWO3fFA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF0113B297;
	Fri, 30 Aug 2024 19:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725045594; cv=none; b=YJZkKWVj9s4MaZOCPe6j7wA3F/qQYaW3JTpE/UAXSsuWHsFZTfuPtVZ/SypjHFIVAh2qknZ384xdC5fV5FKtyVaKP+LKNYyHF76GdueI1xpa/xnGClQyxMelBUH2G0bfp9djJQG2yqAFg0NNCO2IeObDLpBtgBI6qYkA2WFCDCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725045594; c=relaxed/simple;
	bh=RPj8glNq/XNfJ0RgM0JMhvIq250MlyxYDrEKUuZhelw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djTJzJe5Vf3/PqAzycGSKb1V5OdG4uqairJ2HGV5cTgyKaFJKXI/OhtxT23djQTN1d3ZkllF2U7V4ABKPudGGkqXpze3Odj8b+VQ2T3OxlzvhYBigPl237WOnt66i8j9yMEA0c057hfuAtmUfvga+lBIiBbROthvupZSW0ixyWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfWO3fFA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725045592; x=1756581592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RPj8glNq/XNfJ0RgM0JMhvIq250MlyxYDrEKUuZhelw=;
  b=XfWO3fFAhzmKAp7s1p/5ieU7Dl48RHWKoWjvdg6OzJB0Hzbs3JkTrL7G
   J4CTKjOOfxChIbpvJ2Bae7uvByfaGA3gD58TWxz0or0RFQiY7N3F8KuGx
   Arty69Nfnm75fw89t0QgPb+cyGtXe624vLmMIHNJqn7ervfbdezM1EqgI
   sHqTbm1ZbtYWzpf5SID+67+SuA/0Ce9dTleNUX0tklDrcmvTEJgt4FIKj
   f+hHd/xe2wEcH6D701f9HTnphHsaXaup1WUePpucOJVUQilr2vWxrQEYE
   6Ev1mhpsF7zMx3fsWW44pzv+Oe2tivu0E2AGfT5PAKUb45mRYHPyS9zxL
   Q==;
X-CSE-ConnectionGUID: Q9SI06DqQJqPypXkhR9dJg==
X-CSE-MsgGUID: AwbBI+NmTeGvkC7ADa4T7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23218434"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23218434"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 12:19:52 -0700
X-CSE-ConnectionGUID: CsMyUCFFRPKtSiSFs3jdCA==
X-CSE-MsgGUID: C54OLbo3QACXAIrJKi+hzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="63794787"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 12:19:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sk79d-00000003SRU-3XVq;
	Fri, 30 Aug 2024 22:19:29 +0300
Date: Fri, 30 Aug 2024 22:19:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] i2c: npcm: use i2c frequency table
Message-ID: <ZtIbM4NTbldBIDXf@smile.fi.intel.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-7-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034640.7049-7-kfting@nuvoton.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 30, 2024 at 11:46:39AM +0800, Tyrone Ting wrote:
> Modify i2c frequency from table parameters
> for NPCM i2c modules.
> 
> Supported frequencies are:
> 
> 1. 100KHz
> 2. 400KHz
> 3. 1MHz

There is no explanations "why". What's wrong with the calculations done in the
current code?

-- 
With Best Regards,
Andy Shevchenko



