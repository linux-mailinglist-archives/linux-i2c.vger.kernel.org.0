Return-Path: <linux-i2c+bounces-6699-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF7F977DA9
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A70661F22A17
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5301D86F8;
	Fri, 13 Sep 2024 10:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9RZWXc1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22761D7E46;
	Fri, 13 Sep 2024 10:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223588; cv=none; b=QOhKMF8ncfyKXyChqmHWhXHSLiN0TtGQdTF1pRq86LzsEC+JDn3ENXpSrh3pVPtcIluz9Z7ljvPhOP9CAkzzmyg3inKVFxn5q6x6xPlJfAkR0L0rYbuM6YNs2MDsabkmjg8eGzLqZYZ07LLdbRXmwOMfNBG0NVI8k3dgZASdu3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223588; c=relaxed/simple;
	bh=Z9EvHk8XwDoWDzB9UU9hm/ejOwPkx++wY5mYfVvTTn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cj2HidvYG35AMyyQm5cZhDOTDDNxbopcfErnR4AM5tRlyzpU/NcH0/4i/H+UwSaHcmF1NnFxwRjbSW021imJvr/TivmZRR/lw1Hq2Z1+4sN/q4OiX61+4pAEssrMC2UqlINuCcQ+/yyqldNdVjQlrBSFAegs2+akCcubqMCbsV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9RZWXc1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726223587; x=1757759587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z9EvHk8XwDoWDzB9UU9hm/ejOwPkx++wY5mYfVvTTn8=;
  b=T9RZWXc1ly/1igtrOD+fNrTMx/ovqC0/GSottvqWLt6o47OwwHSyy8ex
   RW8cOm1abdU/oN5booeZgor6UdJoaVoMFhXtXsvkrtGhiSMyJZogsTqsP
   pbrjvwkdwBh8iZv9MOmPR7jUkyZtFi/DtpLTIXdenstvNK8jH/KGhoW8J
   DvL9LPSuX+Ureg/R8DOqr368OfIYPZRI5hOlS5aoEUvP/7vCP7EbsBvQA
   D3X+h1V/DzeY1UoPouqWJpdD4IoqkO2P7yZx2UwueCZWHhYWtJpW3lyAf
   CX4K/UZd0Mzvbjr9nHWcDfcXuTiaZF9jEIt7edUnPVa3gir/X12K7rIIP
   w==;
X-CSE-ConnectionGUID: uLgGYQs2TMK1HIdTbmUCsA==
X-CSE-MsgGUID: b44meNukTVmDXaLtkk1wPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24996002"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="24996002"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:33:06 -0700
X-CSE-ConnectionGUID: dnB8CsN/Q2iy/b6EUnzxVQ==
X-CSE-MsgGUID: AO3zy03GSXOAhlueUtVMDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72778575"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:33:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3bm-00000008GKu-1uSW;
	Fri, 13 Sep 2024 13:32:58 +0300
Date: Fri, 13 Sep 2024 13:32:58 +0300
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
Subject: Re: [PATCH v3 4/6] i2c: npcm: Modify the client address assignment
Message-ID: <ZuQU2iIZwW4mAumo@smile.fi.intel.com>
References: <20240913101445.16513-1-kfting@nuvoton.com>
 <20240913101445.16513-5-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913101445.16513-5-kfting@nuvoton.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 13, 2024 at 06:14:44PM +0800, warp5tw@gmail.com wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Store the client address earlier since it might get called in
> the i2c_recover_bus logic flow at the early stage of the function
> npcm_i2c_master_xfer.

We refer to the functions as func().

...

> +	/*
> +	 * Previously, the address was stored w/o left-shift by one bit and
> +	 * with that shift in the following call to npcm_i2c_master_start_xmit.
> +	 *
> +	 * Since there are cases that the i2c_recover_bus gets called at the
> +	 * early stage of the function npcm_i2c_master_xfer, the address is

Ditto.

> +	 * stored with the shift and used in the i2c_recover_bus call.
> +	 *
> +	 * The address is stored from bit 1 to bit 7 in the register for
> +	 * sending the i2c address later so it's left-shifted by 1 bit.
> +	 */


-- 
With Best Regards,
Andy Shevchenko



