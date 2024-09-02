Return-Path: <linux-i2c+bounces-5994-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC9D9686C6
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 13:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B9211C22015
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 11:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776E31D6C73;
	Mon,  2 Sep 2024 11:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPeA2BJm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BD61DAC42;
	Mon,  2 Sep 2024 11:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725278082; cv=none; b=V1dr2uy+6jFdHl3PTL1t8XD0P3r7nkJA7GhGWQKJ2JyeGF4KapZ91XJxF4Bhm/+KC7BuZLJexmQ5/737JNPeyw6p3A+bcsf8I4g+UU+qYSlMtE/WJwZPFTYR5RbQA9Vv4X7tPomFcWULEP5SddRy50cM0XC9U3IYH6M5TlXDt/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725278082; c=relaxed/simple;
	bh=sCdVNs/IlL95N+ZKq2piCTHeDB0GFDDYsaZYUbXVBnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwba5jaD+ywGWMpIbeFHntDQzkiG0D9ajjXVPfDAIFzxTwc6y+FGswiTkkgVQFMqMy9KM1RrNb2yozgR/HA64HJAP+mdKnX6RSZI/1u1Dtehn4054W0tNbpiz3iJIITP87SEKxL9s01xS4NJru4joHIAVTx+VSAWGfPrY4/8wy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mPeA2BJm; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725278081; x=1756814081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sCdVNs/IlL95N+ZKq2piCTHeDB0GFDDYsaZYUbXVBnM=;
  b=mPeA2BJmD1fqmTbDzLB2rib5BPENknmrTZ87cvd7TnrIe5EArYbZ+yYh
   Sg/OK4tnCbMB5Nv0PbP+FnFqrJCjT53Ns+zZRAf/HrwNSedGlb9ZiCu7u
   XaNej3+Fqu42ELF9bApLUzRtghKZMQn35zSPrIaeEQUrTK4MoQs5q1Uti
   kfbtahBGSw37elKa4y9+qlci1eJ/CLqKzmYoT3Wnk8wH6tZuTfb7vRovd
   5LYxQUToAra0l0fN7FwRCbVH9gtrNwFrGyMiImfAnCdXvdgOPOnZxgebo
   XHdTPJaYJCV4ZVFYZIXXjtC8PhrFiF+JhrGMPU16unszfiniosXsLHGI2
   Q==;
X-CSE-ConnectionGUID: ccYtE2sfRCmUSGnL9dmjwQ==
X-CSE-MsgGUID: ozVUue1HSziIzs7/yl62zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="24014060"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="24014060"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 04:54:40 -0700
X-CSE-ConnectionGUID: OvdcPaPcTuqTjN4oqZCmQw==
X-CSE-MsgGUID: yJ7JoR8XSVylSgT57ULXtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64945939"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 04:54:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sl5df-00000004LgL-2a60;
	Mon, 02 Sep 2024 14:54:31 +0300
Date: Mon, 2 Sep 2024 14:54:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com,
	avi.fishman@nuvoton.com, tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com, jjliu0@nuvoton.com, kfting@nuvoton.com,
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] i2c: npcm: Modify the client address assignment
Message-ID: <ZtWnd8bmiu-M4fQg@smile.fi.intel.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-6-kfting@nuvoton.com>
 <ZtIaofiTqyFwNXrO@smile.fi.intel.com>
 <CACD3sJbZ-Yy3PfPWisMSiPYCbztbi1+Q+=udMG8EjNvE+xA1mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACD3sJbZ-Yy3PfPWisMSiPYCbztbi1+Q+=udMG8EjNvE+xA1mg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 02, 2024 at 09:40:09AM +0800, Tyrone Ting wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> 於 2024年8月31日 週六 上午3:16寫道：
> > On Fri, Aug 30, 2024 at 11:46:38AM +0800, Tyrone Ting wrote:
> > > Store the client address earlier since it's used in the i2c_recover_bus
> > > logic flow.
> >
> > Here no explanation why it's now left-shifted by one bit.
> 
> The address is stored from bit 1 to bit 7 in the register for sending
> the i2c address later.

Yes, but previously it was stored w/o that shift.

> I'll write some comments about the left-shifted by one bit behavior
> above this modification in next patch set.

-- 
With Best Regards,
Andy Shevchenko



