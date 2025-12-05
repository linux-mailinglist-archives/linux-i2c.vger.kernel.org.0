Return-Path: <linux-i2c+bounces-14459-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 064D5CA7DAB
	for <lists+linux-i2c@lfdr.de>; Fri, 05 Dec 2025 14:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5307130161AE
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Dec 2025 13:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE943321C1;
	Fri,  5 Dec 2025 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvxNrcAj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70D330E836;
	Fri,  5 Dec 2025 13:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764942970; cv=none; b=hmjHlbgvMq0njf4MgopJxtRr62TA4GTQ7+HInTOuzmw09n279/yZeWCyDiJs37iVYbivwXHG5Oj/0mjstegigVhewz+x5CLmkbHFkjnJ0aWBrXBeK4vsO2PLMiXHT+5l5z6c0mN2/T6eMiX2+TqOMvHsW9aRYKrKhhcNamfzibY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764942970; c=relaxed/simple;
	bh=n/BIBT2TQ6QLo2HPDq8SQzsjDi1TV37C1BbUNQ906YI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6R35cCHIR96Cgzm/6HYqB8+KGXnewfYF5EnUWCIOHPMCHOPHbVyZ6zhpdgJjka/cYUkjJuU3ljKMT1isHqbyjsKD2YjF9PwPoWdteiDqRTXWdjLFyA+m+XvNVzp3NjCE2S0tawDAZApLyZSja23FkWh5YVTnJGRqtfVLbaf8qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvxNrcAj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764942968; x=1796478968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n/BIBT2TQ6QLo2HPDq8SQzsjDi1TV37C1BbUNQ906YI=;
  b=EvxNrcAjSo0fOWGo/5VIOJrdTLgepeakTTRApX6grcCC7VAUL18aKmeN
   zyFVRIa3mWOMUhFNBWxcp0V58JIGH6uaqC5X3hujkRkZCwXsbtrvDdGDe
   w+xhzLb6ppjGkP5tvzFiODy6fx+zaypSujq5ZGlWW1Gj9OpujS3J3Nkgg
   9DRbqP6zBpIYqF9BysjE3BDZ7AaLH0HZAmkI9ETjxAAGSbcd8FeXu2wJO
   1iph7r5n+kudXuflZR6kM2Uf/uSY9pZ1iD18CRJz+EWy5kuGxXLhzdNCA
   KaaTqzbYlGdJQukUfz/e4fw4ho2zTAUXE75I27xQowWRRRolNRBnQ5VUv
   w==;
X-CSE-ConnectionGUID: z68rOVO8SYuGV0HTBhAHlw==
X-CSE-MsgGUID: X4n+kWfMRBOWpGBoV5/MXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78326739"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="78326739"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 05:56:03 -0800
X-CSE-ConnectionGUID: lQVfrKF8SEGtxxPxGSHIpw==
X-CSE-MsgGUID: bi/wNcI6RlWASQ7eoOqxCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="195326665"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 05:56:00 -0800
Date: Fri, 5 Dec 2025 15:55:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Askar Safin <safinaskar@gmail.com>
Cc: Dell.Client.Kernel@dell.com, bartosz.golaszewski@linaro.org,
	benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
	linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, regressions@lists.linux.dev,
	rrangel@chromium.org, superm1@kernel.org, wse@tuxedocomputers.com
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
Message-ID: <aTLkbgwNFOJT_X1H@smile.fi.intel.com>
References: <aRDml95nMPeknmUM@smile.fi.intel.com>
 <20251205021616.1570442-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205021616.1570442-1-safinaskar@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Dec 05, 2025 at 05:16:16AM +0300, Askar Safin wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> > > Sounds like it comes via GPIO, but it's not handled as touchpad IRQ. You may
> > > try to add a quirk to prevent touchpad IRQ from waking the system. That should
> > > help I believe.
> > > Something like "ignore_wake=INTC1085:00@355" in the kernel command line.
> > > If it helps, update drivers/gpio/gpiolib-acpi-quirks.c accordingly.
> > 
> > It might be actually the touchpad controller name (as I see in the quirk table):
> > 
> > 	ignore_wake=VEN_0488:00@355
> 
> It worked!

Glad to hear this!

> First, there is no option "ignore_wake". Correct option name is "gpiolib_acpi.ignore_wake".

Sure, sorry for mistake on my part, I never remember the whole names of the
kernel command line parameters.

> I tried "gpiolib_acpi.ignore_wake=INTC1085:00@355", and it didn't help.
> 
> I tried "gpiolib_acpi.ignore_wake=VEN_0488:00@355", and it did help!
> 
> Please, somebody (maybe Mario?) author a patch.

You can do it yourself, we may help and I dare to say for Mario and myself
that we even will be glad to help you to produce and submit patch on your own.
The expertise in contribution to Linux kernel is valuable thing, and I truly
believe it will help you in the future.

-- 
With Best Regards,
Andy Shevchenko



