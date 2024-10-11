Return-Path: <linux-i2c+bounces-7339-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B1F99A231
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 13:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E24A28723B
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 11:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C381210185;
	Fri, 11 Oct 2024 11:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUR78K4E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BDC215011;
	Fri, 11 Oct 2024 11:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644451; cv=none; b=cVIP4ICcLwP/4xW4is1NUT+6fGKx8lXGLmk2Of6zyd9Lo3IJDaEmj+I4Wf1XzYnYyGlMRlz3UBagzxdjr7+VxRR44YHJo9arwkCReDIL0k/x0UV4yn1qh6ejGeW0euWc76jhEaEycPH3WKzVoqYOa3KEKBobatjwOgTPF1iWZVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644451; c=relaxed/simple;
	bh=SxASXN/DKncrAiabitEc0oaTlVRcphYtNi5cDXvkuQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=neKIGD0QzeFp3b97KOvBa3F/7TY/wXHvAaogkeNrmFBQtrRaZSXdbY0gxD5lF/N43WN8cjXYp8clKDpwMmlUxu5fK/GO9z0jo4QJ+LKUEmflx2lApqWMJbCij/fYrCr+itLuTjWem7KCiTrtXu4YU/BbaLdQTFA40RcEj08HWLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUR78K4E; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728644451; x=1760180451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SxASXN/DKncrAiabitEc0oaTlVRcphYtNi5cDXvkuQc=;
  b=eUR78K4Envud31Eo5ZBIHaxorkI8/X4wNhccc2XSA8DxV8LD+gRyENTK
   JXyq0VkvBZ+TDv+w7so3RlFReQ66QvSnd+3v5TrNg0ob1eCjinFLCz2qo
   mtN50oejn7+AxP+6nokrJwF/UNxdWByaHnhNpuYTxcD8nmP1s/rabzbAz
   QGfdAV7rcfjclAtp/QseIACa6LvHQ5kw/qLcLJDGIz8qRvsGcXS9OIoOE
   HBRHyCRExLpUunVkMHaDaoE4AQqZhQnCGSpwMfnhUDqZ6gXukZs9SyTWO
   Fbi8ZwAjSM9uRNz4W2UAtOMB+YE3waz9YijLdBegV98lZgeAMfdcBACqW
   A==;
X-CSE-ConnectionGUID: BQXH2AoGR0WjDGgXbew+6A==
X-CSE-MsgGUID: 5+f8YqyDTQGMoHZL38SO0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="50582143"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="50582143"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 04:00:50 -0700
X-CSE-ConnectionGUID: njuZsZEOTqW+vRcqCaoGKQ==
X-CSE-MsgGUID: cvcsFYMdQl+7ss1gQmeiOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="81878617"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 04:00:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1szDNy-00000001rqO-0yOT;
	Fri, 11 Oct 2024 14:00:42 +0300
Date: Fri, 11 Oct 2024 14:00:41 +0300
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
Subject: Re: [PATCH v6 2/4] i2c: npcm: Modify the client address assignment
Message-ID: <ZwkFWVC3_5xr6OQW@smile.fi.intel.com>
References: <20241011055231.9826-1-kfting@nuvoton.com>
 <20241011055231.9826-3-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011055231.9826-3-kfting@nuvoton.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 11, 2024 at 01:52:29PM +0800, Tyrone Ting wrote:
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

I would rephrase it a bit like

	/*
	 * Previously, the 7-bit address was stored and being converted to
	 * the address of event in the following call to npcm_i2c_master_start_xmit().
	 *
	 * Since there are cases that the i2c_recover_bus() gets called at the
	 * early stage of npcm_i2c_master_xfer(), the address of event is stored
	 * and then used in the i2c_recover_bus().
	 */

(E.g., the last paragraph just describes 101 about I2C 7-bit addresses usage
 and may be dropped completely.)

> +	bus->dest_addr = i2c_8bit_addr_from_msg(msg0);

...

> +		/*
> +		 * Since the transfer might be a read operation, remove the I2C_M_RD flag
> +		 * from the bus->dest_addr for the i2c_recover_bus() call later.
> +		 *
> +		 * The i2c_recover_bus() uses the address in a write direction to recover
> +		 * the i2c bus if some error condition occurs.
> +		 */

> +		if (bus->dest_addr & I2C_M_RD)

Redundant.

> +			bus->dest_addr &= ~I2C_M_RD;

-- 
With Best Regards,
Andy Shevchenko



