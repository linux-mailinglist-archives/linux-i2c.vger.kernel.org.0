Return-Path: <linux-i2c+bounces-14261-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 059AAC84ABD
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 12:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B764C3AEFDB
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 11:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C7B314D30;
	Tue, 25 Nov 2025 11:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loMX3cpi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5592A314A75;
	Tue, 25 Nov 2025 11:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764069195; cv=none; b=nvCPGuLfmj3+a4lxLXlo2V2HRMnrxqnOhqGT3C6CGIOD7jJoI1d/20wJ2p0Ae6vC8orzFMwvBryYhMKylYdmcwTQUoj4iKqAOJuhhm2tf19EbcjOl+h1sbgosniEdootYdGVs0y++rU9wmOdGQSZdjOJaEMzUYs/abSmb5OFBSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764069195; c=relaxed/simple;
	bh=3uqm+MjePg84BAMPvn5vTFxWADyS8ea7euE9WSlVPK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZZZNRAj7RSxetHHJSzg+xeRGXJiGU+mAIkcmcsEss04pwO9JRDq2AtPBauZXXEuwW7w4S+lqKbaWWD3BXEwKuEeatt9FY32NtInvqLMBm8XQkgbA23VzB9R01Arw45fxzviQMJvY2m0BsPRMV5OWSR76rL/OBJcuRdSsXYI22A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=loMX3cpi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764069193; x=1795605193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3uqm+MjePg84BAMPvn5vTFxWADyS8ea7euE9WSlVPK4=;
  b=loMX3cpijiK0VmgfM0kd01p70JE8m6tTvF/woltxfaEzfaqbCK+VW89x
   SO8/zBu3qK41i4pydhqqE9I2dsoJzp6vFR43XJ+W/94zElsrTVxpsxpyJ
   Bz/LV/ZZVdEWJ/xYFMx4c8hM+rhbFAeXoeMKLRs//3GLs04KOegJaSNDW
   OkadLqaiQFpDKjPH5fVfga9FlsQhlvat802BGppb9oSF2azoKMHw9SUeK
   zaIdhXQli5Pb5tuJlacqOQV4zW4vCPTpGsog3t2M8lZ+aLJNwGb9O6s94
   aIl0TW+Hz8dWtlGJwV9rJqXfN8ZyVz42xEeZIjhPaj0XAOy3Fjg+4FCz8
   A==;
X-CSE-ConnectionGUID: t2qKaNypRt62zLlcJ9HolA==
X-CSE-MsgGUID: VrGbDHOfTHCqOxlnVPnChQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="83476056"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="83476056"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 03:13:03 -0800
X-CSE-ConnectionGUID: dQwKuBEbSvKV0ggVs+Zgjw==
X-CSE-MsgGUID: oTraJmbWToeEqdjJhppksA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="192606705"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.152])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 03:12:59 -0800
Date: Tue, 25 Nov 2025 13:12:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Dmitry Guzman <dmitry.guzman@mobileye.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 7/7] i2c: designware: Support of controller with
 IC_EMPTYFIFO_HOLD_MASTER disabled
Message-ID: <aSWPOJca9dOz2x6B@smile.fi.intel.com>
References: <20251119-i2c-dw-v3-0-bc4bc2a2cbac@bootlin.com>
 <20251119-i2c-dw-v3-7-bc4bc2a2cbac@bootlin.com>
 <aR4lVB8FRzHLcXJT@smile.fi.intel.com>
 <3583116.sQuhbGJ8Bu@benoit.monin>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3583116.sQuhbGJ8Bu@benoit.monin>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 25, 2025 at 11:45:35AM +0100, Benoît Monin wrote:
> On Wednesday, 19 November 2025 at 21:15:16 CET, Andy Shevchenko wrote:
> > On Wed, Nov 19, 2025 at 04:05:36PM +0100, Benoît Monin wrote:

[...]

> > > +	/*
> > > +	 * Make sure we don't need explicit RESTART between two messages
> > > +	 * in the same direction for controllers that cannot emit them.
> > > +	 */
> > > +	if (dev->flags & NO_EMPTYFIFO_HOLD_MASTER &&
> > > +	    (msgs[idx - 1].flags & I2C_M_RD) == (msgs[idx].flags & I2C_M_RD)) {
> > > +		dev_err(dev->dev, "cannot emit RESTART\n");
> > > +		return false;
> > > +	}
> > 
> > Ah, Now I see the point of checking the idx first, but can we rather call it
> > with idx >= 1 to begin with?
> > 
> We would still have to check it when calling i2c_dw_msg_is_valid(), as the
> first message after a STOP don't have any limitation. It is not just for
> protecting against an out-of-bound access to msgs. The validity of a
> message is in relation to the previous message in the same transaction.
> 
> I will change the comment to make this clearer.

OK!

> > >  	return true;

[...]

> > >  	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
> > > +	{ .compatible = "mobileye,eyeq6lplus-i2c", .data = (void *)NO_EMPTYFIFO_HOLD_MASTER },
> > 
> > Are you expecting more with this? I would rather use a compatible matching
> > instead of the flag,
> > 
> The IC_EMPTYFIFO_HOLD_MASTER_EN parameter is part of the DesignWare IP, it
> is not specific to Mobileye. Given that typical i2c accesses (single read,
> single write, write-then-read) work on non-PREMPT_RT without this patch, I
> suspect there are other controllers that lack the ability to hold the clock
> when the FIFO is empty that could benefit from this flag.

USB DWC3 driver uses properties for that. We really should go away from this
MODEL_*/FLAG_* legacy approach in the driver. Either compatible string or
a specific property would be better than inventing yet another no so scalable
flag.

> > >  	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
> > >  	{ .compatible = "snps,designware-i2c" },

-- 
With Best Regards,
Andy Shevchenko



