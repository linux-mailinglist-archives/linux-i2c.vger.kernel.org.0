Return-Path: <linux-i2c+bounces-10739-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D572EAA74C0
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 16:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A8D61886FB6
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 14:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7F42561AA;
	Fri,  2 May 2025 14:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d8lg3kup"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94809F9E6;
	Fri,  2 May 2025 14:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195414; cv=none; b=rIklYbN04weNhZDR3nUerp6cTeLzbe9OLBzbxOZKCGAwth4w+IhIIWW013WjfeskdiqXfTtfDnXk4k7gVLADpvdtEY/qOf2qyR2fZ2eUXOeKQ4fGaYaGd4G3LXKRT/SAwwGiBnkTUhCymCofTv8t6s1AQvEQ3NpvEsJigPk5Vp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195414; c=relaxed/simple;
	bh=t9FXKQ1UQjaYAc38Pie7//F7ZLRLqk9CIKyBaPO20rU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dr5LnalrlVzraQ/Hb5K50lccsx+D0E21p6S7aYWxVTRswJthWW//v5FQMp5/ziJyW3237H4uoZTUB/V/PybJoNte0iF26EZMiIQKioG8TbxtyE3nb8ptcztMYS7TWJlyzMvOSpsyINPymHy+SCchP8ZkTNUhglvYvi5gqOKPvro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d8lg3kup; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746195412; x=1777731412;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=t9FXKQ1UQjaYAc38Pie7//F7ZLRLqk9CIKyBaPO20rU=;
  b=d8lg3kupX9MCNFFh/bB96enBWATa2B0YuUBVzVMb1EyvUP9f0JllAb/n
   bHeBQwiI8pcbEgkNoLiNODF+F1tGMvXvif076nMwru3qffdRMGNlvxU2A
   dR1kziv0Ikoy7y51m7XHRtMBHv2xKV/DyphUtZ8AjdrFRw2iLWUcyx7nK
   jjqyiPcjQ2MAUiPgFdkCZKM/W02jHTCuBxSC6qqGuu/UWKnpiisjQSu6N
   u/2cXloyEAKFRSbQsreK2o2JF/xeMs6wzurfirBZTCnlZoHGw+z0dLB0V
   NQ5uyEg9nb9KHgOyts6moykUNisaTGY3Llyy7jZtNXs436ePBBOfOV8+v
   Q==;
X-CSE-ConnectionGUID: HuQw1u9XRKe81HiHnkTH3g==
X-CSE-MsgGUID: i6cn4aRYRK+3TPVs1ESBGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="70379872"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="70379872"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:16:52 -0700
X-CSE-ConnectionGUID: Dku17J5JTUK2BUvuWm/Xeg==
X-CSE-MsgGUID: o6rVGY5lT9ixb6Za1Ni2yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="134960659"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:16:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uArC4-00000002Do2-2wl6;
	Fri, 02 May 2025 17:16:48 +0300
Date: Fri, 2 May 2025 17:16:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: core: Propagate all possible errors when
 requesting recovery GPIOs
Message-ID: <aBTT0Fs5xIN0sjnx@smile.fi.intel.com>
References: <20250212163701.2407540-1-andriy.shevchenko@linux.intel.com>
 <Z9Gdx4QIMj25JRB2@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9Gdx4QIMj25JRB2@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 12, 2025 at 04:44:23PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 12, 2025 at 06:37:01PM +0200, Andy Shevchenko wrote:
> > If GPIO is available but we can't get it by some other, than deferred probe,
> > reason, propagate it to the caller.
> > 
> > No functional change since i2c_register_adapter() still cares only about
> > deferred probe.
> 
> Any comment on this? It's a month passed without any reaction...

Yet another ping...

-- 
With Best Regards,
Andy Shevchenko



