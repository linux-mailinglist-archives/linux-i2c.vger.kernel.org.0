Return-Path: <linux-i2c+bounces-5968-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56742966968
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 21:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 887331C22218
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 19:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598571BA292;
	Fri, 30 Aug 2024 19:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHH1/PkE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08EB14882D;
	Fri, 30 Aug 2024 19:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725045419; cv=none; b=EF7BoOnSE7Ufr/EVaClWknoXqXgkghCY2rtC+xO/lcLxIuzi5nIk1VUkcYvitUbRG7DubW3j5INDFuZidKnWEjETcR6BHKOosq0W43czWXKXDmBSD5edvu2Em4sxibvd2iv7h0YCnwZe6fB9XNalVrw6gt1b4j4hl6EuBsfhiO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725045419; c=relaxed/simple;
	bh=IBnwaKpoyVKtRe031HOYtZkxDfnhJqMCAFEihDYmr/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0RnPGv6x17SvqqD8bjpeCkP+xgZzKzFPdX7SdJ7/7gjklEoM2AOgcq4AyEnnVFCeFiDKJMxUD97M4sig7aOvJ1MXaOkR3qUAoeZMIl05aZ6T3BCc1ZLUv0Ov+Ghf3tc6EWV78ikf0bB5hZsHI6z5Ib0KIKPiVqnAeRsEBipfhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHH1/PkE; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725045418; x=1756581418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IBnwaKpoyVKtRe031HOYtZkxDfnhJqMCAFEihDYmr/8=;
  b=RHH1/PkEeSXOtIy7F07v4Oo5/O8ynOjSpHyS9FhX2iSrEWM42kkBK4Vp
   h2nMruiw9dANSidiIzXaa2bhSOJ6klEtNEGNbC66HZss0cn9Tb6sdRyG/
   KpIfZofgmUi1i1SMlAXt6fazrmULqlo0in3zjU95/0AoQnJwcWOe6R4a1
   SMPkCjlFKZaW20TLaf7j5JQKt4SRBxDfKjksOQdPl7UajyGA0VIvXh0NY
   fOjjK9YAR3Sg1uqtPRD/HSBQreA2rbQZuwstkwKAr3cT7VS6ecqg+3zde
   KdyCi86vIgyaRxl4qMG1Hv4vn+NUq83uKkdBcPWvn3GnCZp6OPtflpgw/
   Q==;
X-CSE-ConnectionGUID: SOhC8l63S42Q6+EaddE2dQ==
X-CSE-MsgGUID: l30zw0cyQleBo6EYT6J/Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23655907"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23655907"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 12:16:58 -0700
X-CSE-ConnectionGUID: vRufghYcSsuyGzF0Tslhxg==
X-CSE-MsgGUID: 9mfoLPQaRuaomDnZGr2uvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="64175228"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 12:16:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sk774-00000003SP7-0MIZ;
	Fri, 30 Aug 2024 22:16:50 +0300
Date: Fri, 30 Aug 2024 22:16:49 +0300
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
Subject: Re: [PATCH v2 5/7] i2c: npcm: Modify the client address assignment
Message-ID: <ZtIaofiTqyFwNXrO@smile.fi.intel.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-6-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034640.7049-6-kfting@nuvoton.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 30, 2024 at 11:46:38AM +0800, Tyrone Ting wrote:
> Store the client address earlier since it's used in the i2c_recover_bus
> logic flow.

Here no explanation why it's now left-shifted by one bit.

-- 
With Best Regards,
Andy Shevchenko



