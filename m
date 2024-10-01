Return-Path: <linux-i2c+bounces-7149-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BE498BD45
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 15:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBF9F283779
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 13:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EF919DF53;
	Tue,  1 Oct 2024 13:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iErwiz0e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956AFC121;
	Tue,  1 Oct 2024 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727788654; cv=none; b=idfgwabdnYw2+Mk4Wy3WSYXgXg6snhROH7tEh7zMeHLkaPew897UWmept2sk5lbRORlNS8Nidd28DGNi2joRr/bX/ANb9NoVgKzOoxOaPI64z8KiRrTj7shSTbUdtNMokon+Fs+Kiz5ZnYRdtVKdxQjCycGtaHcQQ6EbR57w5i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727788654; c=relaxed/simple;
	bh=x+BV+/OtENujiFENVoIMCzWcgjltFgWnxAGqn4HcKus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fsm3ewQHyC0L2JDYxdEHngZn4E+xg6iQKhjWrCjXmNEVCjIlgJqBfshfm93p18txGQjQYvKw3yXz2610o4rCc1BJBh+zRWqfTyCuc3bRD9md9h8Y3c62Z6nJsCMrjNoaSOnfwaF2FqheLNMufjJ5bWdYZS9FK3ck/YkmIkIrHSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iErwiz0e; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727788653; x=1759324653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x+BV+/OtENujiFENVoIMCzWcgjltFgWnxAGqn4HcKus=;
  b=iErwiz0eTLX+tMREZdyKxFdeob31/mxCPJNhFjE+rMswjcQ8icnEgl4N
   q5vL+Vh+sXsJcuDCE8TDCfBoGvZ/2mWDeWpy4qu7WR27aPbe7vJCtmvmT
   TQfVW+bxlR/a1h+AiR9tpLh+geU2/UC0pk4biTHBPk/XO7pQaawWxux4U
   kASu1eBksKqFEKb187fGt0Qb/oP/uPCjCSuv7B9+5FPb35rcdDi2I/0//
   FN9HsbCeMnmOVEjRLBm+4AHqakVy7Zi10oWNVzU2BgMWpA8+HqEU8h4yv
   C6J6WP9HXt9WD1Ir5rdwKe6PTYR4vt+FDh9ZTU1f0tVb+Z4VaZjCmz/U/
   A==;
X-CSE-ConnectionGUID: u162hCACQqGw3OEN04qCnA==
X-CSE-MsgGUID: uGeO0cXGQ6ScquOjuGSAYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26381199"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="26381199"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:17:31 -0700
X-CSE-ConnectionGUID: MDvbuMW5SnyhzmydfW3hDQ==
X-CSE-MsgGUID: aGYAp03ERaKdgfKmJ5E+1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73985678"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:17:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1svckm-0000000FCd8-0lao;
	Tue, 01 Oct 2024 16:17:24 +0300
Date: Tue, 1 Oct 2024 16:17:23 +0300
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
Subject: Re: [PATCH v5 4/6] i2c: npcm: Modify the client address assignment
Message-ID: <Zvv2Y10hJqGnUDvW@smile.fi.intel.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
 <20241001062855.6928-5-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001062855.6928-5-kfting@nuvoton.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 01, 2024 at 02:28:53PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Store the client address earlier since it might get called in
> the i2c_recover_bus() logic flow at the early stage of
> npcm_i2c_master_xfer().

...

> +	/*
> +	 * Previously, the address was stored w/o left-shift by one bit and
> +	 * with that shift in the following call to npcm_i2c_master_start_xmit().
> +	 *
> +	 * Since there are cases that the i2c_recover_bus() gets called at the
> +	 * early stage of npcm_i2c_master_xfer(), the address is stored with
> +	 * the shift and used in the i2c_recover_bus().
> +	 *
> +	 * The address is stored from bit 1 to bit 7 in the register for
> +	 * sending the i2c address later so it's left-shifted by 1 bit.
> +	 */
> +	bus->dest_addr = slave_addr << 1;

I'm wondering if it's better to use i2c_8bit_addr_from_msg() here?

-- 
With Best Regards,
Andy Shevchenko



