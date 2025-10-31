Return-Path: <linux-i2c+bounces-13933-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 58283C25BBB
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 16:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 533434F7DEE
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 14:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FACC27BF7C;
	Fri, 31 Oct 2025 14:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABnFIXZE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D9C278E44;
	Fri, 31 Oct 2025 14:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761922143; cv=none; b=eFo15gAEiGOY30xshl3/GomdB/LPn6pG4wNNeT2J91Bkl6QFq6gSm4Xk6u+MxTWxlwAMlADUCdt774rNYQozgguMB0cQ0rzp939I+oRhUWCGL8MxUNtFAb93FSACoQSQsm9MeJFA/uKVlEkdAJ5fVH/9DBcFDp7s+d5nMOW9HBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761922143; c=relaxed/simple;
	bh=4/b7FZ+TKpOI5vWj+Cp7E9hBNkbAZuI1fJ/uXfz3C6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UczDH4a+mXdFF60QIwrUJQrKkdbDeNVgXxlUFyIkEXEv28keq06aBLK+nX9WUIyY2dwO3z22aQZFAmZlf7TKkOgzu10jAtB0J3X9uG/4/uJwN5RvqQbKfuhxUa055+Fd+92Jnlr5kYFcfvUGAATnkKuwv2ZXpVMosNkYpz7hjUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABnFIXZE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761922142; x=1793458142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4/b7FZ+TKpOI5vWj+Cp7E9hBNkbAZuI1fJ/uXfz3C6M=;
  b=ABnFIXZEiDdbKzLzSiFnlGzdFhqq5HxUYSd+esJeHGr0u3nUt7FNtFeG
   qnBMFKknOnzNfDqdOMUn40NhT0uVC2lJ13QjIIbzauSg6H0iCKwwepQKH
   SryizzRKoBLsM4WFpR1R+FSeWgpWf61ytdf21Si0/4ZtxbFQ0QLeLdurD
   D02Ay63FcpAWMjmR7ryXqUdA68/XJcH4Ll89dwgv6pu2mcwNmTyhxw1a6
   YRtGR7usrIZ3FDQIP+aD37aqSTtk1e0/v3xQV1xKE0pPNQJDATBhtDW5v
   fhEuCQZxfHFdBrapSZLCtnfokMgueu3OocYPBzIqNXwFIRk89PD8qq6Zx
   Q==;
X-CSE-ConnectionGUID: 3s7oZ3TsSUGCl8tIfPZJFA==
X-CSE-MsgGUID: ECmuuPTlSXGHkj/7TCW2mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64001514"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="64001514"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 07:49:01 -0700
X-CSE-ConnectionGUID: 7qosfd/ETsCowL6MpyUuDA==
X-CSE-MsgGUID: wHl6uhR0T0iDPn7r6vJ3dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186189303"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.220.66])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 07:48:57 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vEqQt-00000004Ie3-0pCb;
	Fri, 31 Oct 2025 16:48:51 +0200
Date: Fri, 31 Oct 2025 16:48:50 +0200
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
Subject: Re: [PATCH v2 2/5] i2c: designware: Optimize flag reading in
 i2c_dw_read()
Message-ID: <aQTMUrMbfgs59oBQ@smile.fi.intel.com>
References: <20251031-i2c-dw-v2-0-90416874fcc0@bootlin.com>
 <20251031-i2c-dw-v2-2-90416874fcc0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031-i2c-dw-v2-2-90416874fcc0@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 31, 2025 at 03:35:40PM +0100, Benoît Monin wrote:
> Optimize the i2c_dw_read() function by reading the message flags only
> once per message, rather than for every byte.
> 
> The message index is only modified by the outer loop, so reading the
> flags in the inner loop was always getting the same value.

Does it affect the binary (compiled) file?

-- 
With Best Regards,
Andy Shevchenko



