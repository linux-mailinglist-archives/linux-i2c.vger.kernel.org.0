Return-Path: <linux-i2c+bounces-7187-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8709498DAA4
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 16:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39DD01F216B4
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 14:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF471D150E;
	Wed,  2 Oct 2024 14:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzYqECuE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D317E1D04B4;
	Wed,  2 Oct 2024 14:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727878672; cv=none; b=RA4Y2iq2lT2yqWMSRpawkY//xbwmteynHeHD95ykYXTA6yTegoAXgkc/SL6Ku39gr4B7Nb7c31w6eQNM+uQ22T1npV+lkwWsEj//EnzKNpXt5hZWPBeVDoNiri66opV1OrZcJHkhlFVq5+6MDrH8zEQ58r+JuoMPxF88Mir318g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727878672; c=relaxed/simple;
	bh=JDy/5M+MSSdrYgjg7Gt56ua5yDBOvLFx7IfmLEJRtIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTnsmDE//i7kMbAqQtXr8FXKGdWcPCvJ3lf2NFR+umKuWKcbK5/FNjKhyPdVO68qWk23QumfRkHCMP0JCDh54e8jmt2AJdeF84y9z6JnGuWPIo0zYhggG79u9v+4tVfQeDYBHPnWbi2t5G8m5PlP6vxbYD4sjKFK0hXP2DrGKgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzYqECuE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727878671; x=1759414671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JDy/5M+MSSdrYgjg7Gt56ua5yDBOvLFx7IfmLEJRtIM=;
  b=RzYqECuEdU4MQSPtkUlknBWNvXDsPeHz3OUpOV3VmEmbhBYZ8rvSr77h
   i5FPOoi1arzSmDCTIUpnGbBIDSOLy3HJfgZMjssJNb1Q6nB7JhutkCRi9
   WiGKOsML0DmbOV1hUMg6R+Z2ViDyx6pjdWrcLvTErv25vqFu8txOx7hZW
   rqW9+vx66KpzG6iNqi/it4KYKT5VbFXgk0+u+6BEp5scH88lTpcRrG9v6
   DcpZO2ebroMRK0MCHiUkPBETbI3npAlYJwl9DSDRxnLT1LuQRh5zue6+H
   F9CNg4UygK7ocLTIHZk2FjDpGJsdkFdfQ51YiVO1Sesji3022F3N/Hp0V
   g==;
X-CSE-ConnectionGUID: AllwtCjvSoSpUVspcLZyEQ==
X-CSE-MsgGUID: VJ3EvfKnTTafRhZNvRvbcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26548728"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="26548728"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 07:17:50 -0700
X-CSE-ConnectionGUID: 1LGnQ33RTYSGfa0OFmdK+w==
X-CSE-MsgGUID: JLDFBi7JS/iMFCHC6ldDcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="74037019"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 07:17:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sw0Ai-0000000FhJW-2D5s;
	Wed, 02 Oct 2024 17:17:44 +0300
Date: Wed, 2 Oct 2024 17:17:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Wu <Michael.Wu@kneron.us>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	morgan chang <morgan.chang@kneron.us>,
	"mvp.kutali@gmail.com" <mvp.kutali@gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: dwsignware: determine HS tHIGH and tLOW
 based on HW parameters
Message-ID: <Zv1WCAROWamTfI4z@smile.fi.intel.com>
References: <20241001082937.680372-1-michael.wu@kneron.us>
 <20241001082937.680372-3-michael.wu@kneron.us>
 <Zvvyii7aViGCklcT@smile.fi.intel.com>
 <IA1PR14MB62241CADFE580EC861C591F58A702@IA1PR14MB6224.namprd14.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR14MB62241CADFE580EC861C591F58A702@IA1PR14MB6224.namprd14.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 02, 2024 at 09:31:00AM +0000, Michael Wu wrote:
> > On Tue, Oct 01, 2024 at 04:29:34PM +0800, Michael Wu wrote:

...

> > > + * @bus_capacitance_pf: bus capacitance in picofarads
> > 
> > Since it seems a new version of the series is warranted, and looking into
> > the current kernel source (no other users of this unit were observed),
> > I think we may do correct capitalisation here for the sake of physics
> > and unit system, i.e.
> > 
> >  * @bus_capacitance_pF: bus capacitance in picofarads
> 
> Are you serious?

Are we in the circus?

> I have never seen capital letters used to declare a
> variable name. Although checkpatch.pl does not consider this as an issue,
> is this against everyone's custom or unspoken rules?

I do not really care about checkpatch or any rules as any good rule will have
a few exceptions anyway. The rationale here is to follow the science with much
longer history than anything related to the computer programming.

Now, since you haven't looked for the existing examples, try this

	git grep -n _u[AV]\;

-- 
With Best Regards,
Andy Shevchenko



