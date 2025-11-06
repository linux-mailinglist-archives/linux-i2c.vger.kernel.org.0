Return-Path: <linux-i2c+bounces-13993-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 68388C3A7D1
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 12:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 79EC44FB944
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 11:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB95C30E0E3;
	Thu,  6 Nov 2025 11:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1tyjnuD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B53230E0E5;
	Thu,  6 Nov 2025 11:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762427328; cv=none; b=iT/WHeavq5/gEn+d+u28+/bpmJbm4AHSjAA9XJ9A8l0EsO18DC3oGDBKOMO3izC3FQHKHMsuDxy3zTb7JjG0WbmfaVHbMJZrtvWkydVOvIfnlqE5TS96u5UEAiKnoWb/9LE/ZZhkU9cnqqKt44w/slPAUNx/IqVFaVVOYAgTvQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762427328; c=relaxed/simple;
	bh=aOnuTqQUorRRLb6a2Hd6HIldUCCjogwgktc8mrMIcy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XH3Z1rzDAI9V06X0YBRJn2ljKNoo2rBTsA0hbNKwxdGxnytah/RYMnwxAEPGMYD4EAJijkBVU1p2vGozmE3iec5iCYoec974QFrwYbTCbkRCwvxrkRSHPWilj5BxpJ/KwwN1VzcFsxU3K/I7+HNwMcV2C1RKgNAKHQIRgBJ+ZuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1tyjnuD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762427327; x=1793963327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=aOnuTqQUorRRLb6a2Hd6HIldUCCjogwgktc8mrMIcy0=;
  b=b1tyjnuDM/wxPH++vASAPKW4zlUSaO2NVKWYoqrJVSEhsd6mvT49aAQb
   TXtHDtY7EdIQ+jCSV7CseCyKYDmsk7ORacdnzMoHNYQN1bUGGwPL0lX2p
   H2fn7I3mCOqK6/wKT9nyqpIj2T+OKyToWrF8X2C/gg2h0BAWBG6uO9Ipu
   SHKINPsq+gox0v3WHPp2bQKuAoNBpTUH+Ft2BiheziDBURjgzpjlZAQJ2
   hyLXsqKd2KCWvCgFVqurkchGEawTbrG6nRr8XEuzyTUA54tSkVX5NBCcV
   ZOIlpbxr5WtuZ/Ow8S2am2unOFhUBPp55OE7B0ccLD8xz5T3n29kcQXEH
   g==;
X-CSE-ConnectionGUID: TL6ZlB5XTf2FXhQ0PuBQtg==
X-CSE-MsgGUID: XN0JsQLjS1CcCZakVaszSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="82190523"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="82190523"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 03:08:46 -0800
X-CSE-ConnectionGUID: +FIoHc4qSVuskx8JZPGEaQ==
X-CSE-MsgGUID: 0ciulFsvTRGf9dvNiXJrRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="188011179"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.221.229])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 03:08:41 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vGxr1-000000064My-3nji;
	Thu, 06 Nov 2025 13:08:35 +0200
Date: Thu, 6 Nov 2025 13:08:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v2 2/5] i2c: designware: Optimize flag reading in
 i2c_dw_read()
Message-ID: <aQyBs6H1IHk7fSP2@smile.fi.intel.com>
References: <20251031-i2c-dw-v2-0-90416874fcc0@bootlin.com>
 <20251031-i2c-dw-v2-2-90416874fcc0@bootlin.com>
 <aQTMUrMbfgs59oBQ@smile.fi.intel.com>
 <dce21d03-d6e3-4511-9b1b-5da92efc45a0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dce21d03-d6e3-4511-9b1b-5da92efc45a0@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 06, 2025 at 11:50:36AM +0100, Krzysztof Kozlowski wrote:
> On 31/10/2025 15:48, Andy Shevchenko wrote:
> > On Fri, Oct 31, 2025 at 03:35:40PM +0100, Benoît Monin wrote:
> >> Optimize the i2c_dw_read() function by reading the message flags only
> >> once per message, rather than for every byte.
> >>
> >> The message index is only modified by the outer loop, so reading the
> >> flags in the inner loop was always getting the same value.
> > 
> > Does it affect the binary (compiled) file?
> 
> It does not really matter that much, because new code is more readable -
> 'flags' depend on the outer (first) loop and they are used there, so
> that's where variable should be defined.

Did I oppose that?

-- 
With Best Regards,
Andy Shevchenko



