Return-Path: <linux-i2c+bounces-13991-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF11C3A60E
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 11:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 67514350C1C
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 10:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4682B2EDD4D;
	Thu,  6 Nov 2025 10:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3wD9YEJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D24C2E8DFC;
	Thu,  6 Nov 2025 10:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762426383; cv=none; b=YHsi9Bs1zo0z5Ayx/0EKSWNhsJOCY3f6rX+Jlc+lgjvQkgRy2/oQIe0syMM7WNzKNxisWzC00npi+aMFsOeJ+kIeFVoyBUxeJFFSQTU1WRG+BiZgI7OsJFyDIjlcZp7pjsQ2QrXm0EOdJZxly1gwhP3qdq547lRqJ1cnZoNsk08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762426383; c=relaxed/simple;
	bh=r2hF2PvB5PI45qRZ/Meo3WjXC2+7MGN36CB4V/Zvb0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbWLTFAyzGlLHXZtMMb4eSvwaZmdCTgm1yOwbIamjaaW8onUn/jFaiIN9P8IlD2XDkU7sKXR+EnA0LoTWW52fckzs+K+xecEymHh2z+GGIrvgROZxLSRPsBkbgLViaW3dUJezOsnKgX7WxDJvYyxb2/fzs0ZTH7Dtw9dTm7wv8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3wD9YEJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762426381; x=1793962381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r2hF2PvB5PI45qRZ/Meo3WjXC2+7MGN36CB4V/Zvb0A=;
  b=N3wD9YEJo25ZGoHDMcvpEbCrPrtUzWeRJGLz7EpmgFR5zbfwulpLtO67
   /94UG3mXARkAfCTxp96Yc013QawC77Q0bPNRTmBhmxRYBaVd1V/cZoxUm
   vY1FrR7yn6VTgrdxvfawA7B5wT4rWoRWEU9g8XlMIFg+iPhkLsrMJMHje
   ZnajGm/wrLvRriRdG3zQBeehfGsCCygvIHZUVq7Gq1bkTKxt/bpYPgxRc
   BA88hPq3mALZPd9f8LmX1+bUstKp2+w+q0CXqw42neAHf4zC5QrNl9iPW
   eArchno/MnBcJs0QBs84V4xY2KVG2E/oMmxtr6qV3vCiWckeFZwZ2I3Sw
   Q==;
X-CSE-ConnectionGUID: rGsU/CHiSICbQjCawbW8iw==
X-CSE-MsgGUID: DtxR5NVrRYWOFsFvxD7SvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64594649"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="64594649"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 02:53:01 -0800
X-CSE-ConnectionGUID: pRUXSRkuT+GEm/fkNoRm2g==
X-CSE-MsgGUID: yZXmObeNSVGNKpkqM88ZtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="186979567"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO ashevche-desk.local) ([10.124.221.229])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 02:53:00 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vGxbr-0000000646H-0OZy;
	Thu, 06 Nov 2025 12:52:55 +0200
Date: Thu, 6 Nov 2025 12:52:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Replace magic numbers with named
 constants
Message-ID: <aQx-BlL9PjHeR7Dy@smile.fi.intel.com>
References: <20251105161845.2535367-1-a.shimko.dev@gmail.com>
 <20251106104228.GP2912318@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106104228.GP2912318@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 06, 2025 at 11:42:28AM +0100, Mika Westerberg wrote:
> On Wed, Nov 05, 2025 at 07:18:44PM +0300, Artem Shimko wrote:

...

> /* Timeouts in us */
> #define DW_IC_BUSY_POLL_TIMEOUT		1100
> #define DW_IC_BUSY_TOTAL_TIMEOUT	20000
> #define DW_IC_FOO_TIMEOUT		1234

It's in-kernel practice to add units to the definitions and avoid unneeded
comments. Also it will be clearer to the reader without looking back for any
comments like above.

...

> All the register offsets, shifts and masks should be in
> drivers/i2c/busses/i2c-designware-core.h and you don't need to "document"
> them because all this is available in the datasheet.

Also the benefit could be switch to use bitfield.h.

-- 
With Best Regards,
Andy Shevchenko



