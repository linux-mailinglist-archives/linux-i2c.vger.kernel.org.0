Return-Path: <linux-i2c+bounces-6901-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 311CD97D6EF
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 16:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB0A31F25554
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 14:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4524117BB06;
	Fri, 20 Sep 2024 14:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GmMCohQH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D08178396;
	Fri, 20 Sep 2024 14:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726842788; cv=none; b=KG56bX3ELGzoarX9CNDX2grbBXbTJX5hY+5VWgg3mK8pE2G9YAPJSsffvYnlJMpdtaVlH/cesA7Bh8x0UT/aRb+MEzUZzH/xTbPH+Uv2LYzUCRyIoBmwltVtd9qMPbNzqdZXfvoV0d+L+QqKfTwmOkL+tvlceUDWtGeQGZrSVgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726842788; c=relaxed/simple;
	bh=FmZ1iPfYLpvXQ9iWVPvde2w99WvWCFNwTvXH1ZHG+/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzqEnCgBdEMcczaeWSkyE81jlUU/itrFR1XgDxgertZojPuZ/69cwW+YIoDaVo7tCbziKZ+KAXHeiquFZcZxFnFpy26NtHY3m4qb6p7XoFaeTIak5CJ5stVwi1qyKLc0hvMtJutRKSvKhfQdDpBRDIHpu7aTHx7i2juXIkUtiGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GmMCohQH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726842787; x=1758378787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FmZ1iPfYLpvXQ9iWVPvde2w99WvWCFNwTvXH1ZHG+/s=;
  b=GmMCohQH8no8BCjmhg/odyRi82iH7gau16LIWcz6qnkvwFjpia/ovSAW
   MNQStV2KEUbIXm/fFCRbLXX0xYlFpu++zq7XfrAkQTMom2rtSpYJl6RNl
   AuM/bpfT7HAqDYZw5RSnINzyrH4InLElKqdtMZNoldkCcuMBa+45Qdbgv
   BYZa4ma/d06vLhMWfR29OgVYWfs5NP4MM5vytrSC5hsvlZT4wv0pCd3yS
   PzHTdsENT1NB0agcgXOkDA0z6PAwl2q0JKCmAsNAUM6mVIO+Vz+ZknKYu
   Fr0mfTZyC5xV6dnOnH0mp/HRFGRFxWQQ625XmYbWy51fiR3BDY5EBqTp/
   Q==;
X-CSE-ConnectionGUID: Mc18WBIiSWWDAbJWnO/Cgw==
X-CSE-MsgGUID: hzfXoMrETRKwXEDEOsXPOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29638678"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="29638678"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 07:33:06 -0700
X-CSE-ConnectionGUID: VlqCpYX8QHyARjpiYlo3Pg==
X-CSE-MsgGUID: eQh73CTxSP6P2ajTxgRzEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="70198558"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 07:33:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sregs-0000000AwL1-2MqZ;
	Fri, 20 Sep 2024 17:32:58 +0300
Date: Fri, 20 Sep 2024 17:32:58 +0300
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
Subject: Re: [PATCH v4 4/6] i2c: npcm: Modify the client address assignment
Message-ID: <Zu2HmkagbpMf_CNE@smile.fi.intel.com>
References: <20240920101820.44850-1-kfting@nuvoton.com>
 <20240920101820.44850-5-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920101820.44850-5-kfting@nuvoton.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 20, 2024 at 06:18:18PM +0800, warp5tw@gmail.com wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> From: Tyrone Ting <kfting@nuvoton.com>

It seems all your mails have an issue.

> Store the client address earlier since it might get called in
> the i2c_recover_bus logic flow at the early stage of the func()
> npcm_i2c_master_xfer.

You got my comment really wrong.

func() in my example was to refer to _a_ function mentioned in the text.
And IIRC I even posted the example, like: i2c_recover_bus().

-- 
With Best Regards,
Andy Shevchenko



