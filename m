Return-Path: <linux-i2c+bounces-6698-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EBA977D9F
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B2091C24A79
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657EA1DA104;
	Fri, 13 Sep 2024 10:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hoBWCva5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32761DA110;
	Fri, 13 Sep 2024 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223494; cv=none; b=buS8ZfebxXWjjEZWaUuaABiChYbVNq4BRq5/Qq7+5v+4M33wLVLaJu1UBEKb6J6eG3CB9nWe4n2TGE9aWBQ9VNdYX10gbpnsENsmQFewN0shu1vlLxalB3Dgu2JteFk2oWIah9JGHx1Bp9dBf4P1tHGitj4Ido+HIfflMQ9uV3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223494; c=relaxed/simple;
	bh=umc/QQJkCARCnnFGxpEN/mJo5J57ciWJs1xO1nkn4xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zn5CUe+Y6gVd7p2UB71mYK9xUm25ge4fsHPNXIAHQTlsUWGdy/8Q8qxebKlmGrewmOPPsq6eaQSbsRy26JLjVgdvCWubLiI/KcwYf3/qNP6x1ZDJUAVkr7WwI9jCYDUqxCMhkIawxGnpyPjvJKpmP3kxGSz1blo/EwnnFfqC13o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hoBWCva5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726223493; x=1757759493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=umc/QQJkCARCnnFGxpEN/mJo5J57ciWJs1xO1nkn4xg=;
  b=hoBWCva54kTLbn0XGQtBOSRRve1Nf3hoa9liVRgdIGy8/1IaHjTDOAXU
   xffHb4g+x8fktZWGf2CasN44TpibK70QH3xIplHvavNkJvNfAq81cbd7W
   PplWp+szt4ynKifnweeZ1PW4Y22cePr9Q6p8/hTSSTb8bhNlRrkuGHHNu
   s11up4UMqdMK+edqA/rdpylZO/vqukrLnq6tK/HAr25VJ8iV9Lb7shRs+
   uHnJSOV725QX7DcNDBYagjb8Ww+JWrchWzqaRjcgY9llp5UhgpWsRyePa
   yWVaBreqQW5yfMkKyiqCmBQJlPAEOjz94do5SdbrB/s62F+mctS4hZbyb
   g==;
X-CSE-ConnectionGUID: ao1al9F9Sb6E2P9iXNA8jw==
X-CSE-MsgGUID: T/161SkSQVSLdz/+vXUkgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25244750"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25244750"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:31:32 -0700
X-CSE-ConnectionGUID: FxFQaakdRQu2qCFdV7ew6w==
X-CSE-MsgGUID: iGlRV2t4SIi8BHeTujM19g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72814351"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:31:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3aG-00000008GIo-3sK8;
	Fri, 13 Sep 2024 13:31:24 +0300
Date: Fri, 13 Sep 2024 13:31:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: warp5tw@gmail.com
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] i2c: npcm: Bug fixes read/write operation,
 checkpatch
Message-ID: <ZuQUfCK7d7DuR9eH@smile.fi.intel.com>
References: <20240913101445.16513-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913101445.16513-1-kfting@nuvoton.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 13, 2024 at 06:14:40PM +0800, warp5tw@gmail.com wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> This patchset includes the following fixes:
> 
> - Enable the target functionality in the interrupt handling routine 
>   when the i2c transfer is about to finish.
> - Correct the read/write operation procedure.
> - Introduce a software flag to handle the bus error (BER) condition
>   which is not caused by the i2c transfer.
> - Modify timeout calculation.
> - Assign the client address earlier logically.
> - Use an i2c frequency table for the frequency parameters assignment.
> - Coding style fix.
> 
> The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.

The series titled as "Bug fixes...", however I haven't noticed many
Fixes tags in it.

-- 
With Best Regards,
Andy Shevchenko



