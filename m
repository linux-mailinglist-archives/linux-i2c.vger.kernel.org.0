Return-Path: <linux-i2c+bounces-7148-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7585B98BD26
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 15:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B0FE2826D4
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 13:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA7F1C330B;
	Tue,  1 Oct 2024 13:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFxVTCDi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBECF1C2330;
	Tue,  1 Oct 2024 13:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727788469; cv=none; b=HeUKfK6QKGtpEAlXGboVL/Q2AMO8UTDAx25QaguGxM3B/+mZgwaicxNreCU0SjloMeSRH+qsnjHCODWJx5nQ0Iis65zvpDPAqW4Sh9L6z2O9RYIhr2CqvvtRh88yUm/2JfSUbYKBWW82Mzt6PrbtY9Is9nKpHxJO8/64nDFFPkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727788469; c=relaxed/simple;
	bh=PJNiEgbOR/XVTDdp1Jdns/xshRQMPHYvX91kndFUefY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAkkycPcIKR9sRhO3olGzZP80s6jecfZbc/GzvinaYW2ltQBcMCTSBno+cEQbyexuTRiclFVf6lmgwl86hAncz29i5eVICnpHsi+0xmWcZ76OUq4OtD77RSGgrGkAhirbHdibkjG/ik7OVwMx+4TKwdVHo7WnZhoKqbost87suA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFxVTCDi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727788468; x=1759324468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PJNiEgbOR/XVTDdp1Jdns/xshRQMPHYvX91kndFUefY=;
  b=EFxVTCDiclb5xlqPtCy7+oXALxVULCrnf2fc/x7wDHzijenwGoshGaEy
   gMvNKGdAME8Jphft6mARigq/gXLguwoF/+v86pjNXmEqhcCz1HZT2FrLw
   MbJekTMuLCeU2gtn0nvxIiA/8NOMPfTYIvDeTj3/4VQN1+uNjhuBXKt6V
   O2yxtrX/hUnz77JqLWdoe82P4ZlYDhm7Ka7Tl07XEyPUPyjhcR5oJaJpL
   rwgsk7wMcMruUGiR98YxxOMxfJzKvctoOtFth00QM/32CBy0z4K6rhco/
   M2NN6cQ7qqHD9p09rlmzmpvHLQ58gTbWL9+Zswv79c7bLGxjca4Sc5MtM
   Q==;
X-CSE-ConnectionGUID: FhSBmmZNRSWxfF7S4VmguQ==
X-CSE-MsgGUID: +wLA1H8+TPaQgFUQPZeOag==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="14541863"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="14541863"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:14:12 -0700
X-CSE-ConnectionGUID: Ma3gRYy8Rg67o/OpEJBLmw==
X-CSE-MsgGUID: Xj2342VOQI2bwAH8+7KC7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="74459795"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:14:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1svchY-0000000FCZ5-03jr;
	Tue, 01 Oct 2024 16:14:04 +0300
Date: Tue, 1 Oct 2024 16:14:03 +0300
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
Subject: Re: [PATCH v5 3/6] i2c: npcm: Modify timeout evaluation mechanism
Message-ID: <Zvv1m3RT916dyYRC@smile.fi.intel.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
 <20241001062855.6928-4-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001062855.6928-4-kfting@nuvoton.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 01, 2024 at 02:28:52PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> The users want to connect a lot of masters on the same bus.
> This timeout is used to determine the time it takes to take bus ownership.
> The transactions are very long, so waiting 35ms is not enough.
> 
> Increase the timeout and treat it as the total timeout, including retries.
> The total timeout is 2 seconds now.
> 
> The i2c core layer will have chances to retry to call the i2c driver
> transfer function if the i2c driver reports that the bus is busy and
> returns EAGAIN.

-EAGAIN

...

> +		/*
> +		 * Adaptive TimeOut: estimated time in usec + 100% margin:
> +		 * 2: double the timeout for clock stretching case
> +		 * 9: bits per transaction (including the ack/nack)
> +		 */
> +		timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);

Side note (as I see it was in the original code), from physics
point of view the USEC_PER_SEC here should be simply MICRO
(as 1/Hz == s, and here it will be read as s^2 in the result),
but if one finds the current more understandable, okay then.

-- 
With Best Regards,
Andy Shevchenko



