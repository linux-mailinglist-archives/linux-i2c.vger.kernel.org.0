Return-Path: <linux-i2c+bounces-7493-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EEF9A5E93
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 10:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF84EB20E47
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 08:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3911E201F;
	Mon, 21 Oct 2024 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLTMJQ82"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DC71E2012;
	Mon, 21 Oct 2024 08:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729499156; cv=none; b=SeTAOq82BNhxOSfSpZQopZCXG1WjdUzF2Hm4tMzzVOQuer57M+CUOVefAdkOecT2uUtV7Ua06h/kSBcmkodSyLTQo1Ye3Wu7QQr6e+C2I2EeNLJrPFMvxfGbWRiD8+cpek53kThEvWO227Sjmabu70QElPvpdRZx637TF7VoscA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729499156; c=relaxed/simple;
	bh=LnYDrnqb0iwgJF+KytBRdKFGTVLWVUBmgFqTOODSI+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbYmgVEOTrfiTYf/9U8vwIJ64xmfbGMsqdhu2xNoPutEDg0WYbNjhnnbRpRUSifezEh0msSac5BvrK4OME5pmf/QJy0A7XAQ58Lpfl7SGmLJRvGYdc13ghWADpoVED+RA3HoTVFggrwRRRrbs9nOhjjdmq81ScPAhL1yoqTvMx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hLTMJQ82; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729499155; x=1761035155;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LnYDrnqb0iwgJF+KytBRdKFGTVLWVUBmgFqTOODSI+w=;
  b=hLTMJQ82J5KQUfngPlvrBx6keS4F+/6/HTkYGaDRUWvLU2DnrKG38wsQ
   rIIUKIL+sR9OfNgCslsowFlx9Aq/8WXgIllVGn5/vbndK1C60tsWb+Wte
   F0LR3LBtZDPbXw8JmKcUyR6kyi6hzvNknPnVXvIyAK4cPc2pV0EAeqPop
   VDM0TG++6PclvVNt5T2+Dhh7Jj92ldOdSWJTWNJCw4KzQ1Ly3bD7OKtt8
   NF8y/pRs9wscpFy8fNOmJOyP+vZGiWJ5oIXUaJCtuf0iAdaeMp16F27+9
   lz2/xaOdNks10HV0bphYN8fLmv9g/7zRRw5GyjiU8LIQmetL59nZquNCF
   g==;
X-CSE-ConnectionGUID: HIqqnta2QlSsJ+N1vrpEeg==
X-CSE-MsgGUID: HLxjIj8sRmSbeZ/Uzds+7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="32888042"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="32888042"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 01:25:54 -0700
X-CSE-ConnectionGUID: uymSybUeS6azwslnpwW9wg==
X-CSE-MsgGUID: QkrVzqu4RI6k7c2RuTq4AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="110220284"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 01:25:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t2nja-00000005QQr-0HrL;
	Mon, 21 Oct 2024 11:25:50 +0300
Date: Mon, 21 Oct 2024 11:25:49 +0300
From: 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>
To: "Yoshihiro Furudera (Fujitsu)" <fj5100bi@fujitsu.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: designware: Add ACPI HID for DWAPB I2C controller
 on Fujitsu MONAKA
Message-ID: <ZxYQDSCpo8n4g3jM@smile.fi.intel.com>
References: <20241018015826.2925075-1-fj5100bi@fujitsu.com>
 <ZxJXj3holsMIdnC2@smile.fi.intel.com>
 <OS3PR01MB6903FEFE0404D809D62D4628D4432@OS3PR01MB6903.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS3PR01MB6903FEFE0404D809D62D4628D4432@OS3PR01MB6903.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Oct 21, 2024 at 07:22:55AM +0000, Yoshihiro Furudera (Fujitsu) wrote:
> > On Fri, Oct 18, 2024 at 01:58:26AM +0000, Yoshihiro Furudera wrote:

...

> > Also please give more details:
> > 1) is this ID already present in the wild
> >    (in the products that one may just go and buy)?
> > if so, mention the example of the product.
> 
> Not available at this time.
> It is planned to be implemented in the MONAKA server
> scheduled for shipment in 2027.

So, summarize that in a short sentence, like "This will be used in the MONAKA
server scheduled for shipment in 2027."

> > 2) provide an excerpt from DSDT for the Device object that uses this _HID.
> 
> The DSDT information obtained when verified using
> an in-house simulator is presented below.

Just strip it to the only significant parts, see below

     Device (SMB0)
     {
         Name (_HID, "FUJI200B")  // _HID: Hardware ID
         Name (_UID, Zero)  // _UID: Unique ID
         ...
         Name (_CRS, ResourceTemplate ()
         {
             Memory32Fixed (ReadWrite,
                 0x2A4B0000,         // Address Base
                 0x00010000,         // Address Length
                 )
             Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
             {
                 0x00000159,
             }
         })
         ...
     }

...

Hmm... Why Device object is called SMB0, are you sure it's the correct one?

-- 
With Best Regards,
Andy Shevchenko



