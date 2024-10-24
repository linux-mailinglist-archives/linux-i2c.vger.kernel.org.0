Return-Path: <linux-i2c+bounces-7517-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F2E9ADE6A
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 10:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DC422838F1
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 08:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0051AD3F6;
	Thu, 24 Oct 2024 08:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhQhS8cx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822F314C5B3;
	Thu, 24 Oct 2024 08:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729757039; cv=none; b=R4kfud8hle+kNVDcgMPJeTE1y3nGnmQ3YpZXEVncOhP5E43DAUy46/by+MDKsraovA/E5zDp9lwv5wxZqG6NZ2w9PCBiZ0CFSlvKhyG1eXxh16UcpYKlpkkV/DZxe0meD1U4IG7dykQHA1+ofwXmFebprYg85HHsniPBCMqf5RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729757039; c=relaxed/simple;
	bh=a89pVu+LmAqEfB02K4Ch0KvFnwWeqstJrOuKjRpTGsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REXvmQVyX8ntrLw2wi6alZoL3ts81hKAovnTTQnX7S/mvI6+SHXnWvjU3A5a/1Q3BhahziCiIdcNNdoZcGcNYhWKsSOJbmq5sm52kMdsfHgCMuXC3uOjMnle5gln3mqXlYIqMnWXJlcyEwMoxdxLq3SLU/qkVizazJzj+mEB7nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhQhS8cx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729757037; x=1761293037;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a89pVu+LmAqEfB02K4Ch0KvFnwWeqstJrOuKjRpTGsI=;
  b=KhQhS8cxVziuF1ku1gAxBCGda6g6eSOpUv3O7JVy5+kwTq/MAjkFaMhE
   8kXbga6ziUfvZVQc8G32RFjE26JzF4reQ6FqpN/HXaSEryU0/y8aBwoM6
   2kphe11gLOrMOdXupcwxOHZowm6VBuS3+LnuNBkJr4zZ1ZvYw2WyTFamR
   DDtR4HDpEDQ03nZ1TVXx9JymA1rANEzBh5y8vEyppe0VJZhIWZS1uiHHA
   GIdh+Z+wcozl4KLZDf0XWFw4wv9PCA3Sej+7T21GpjE/LLVjQV+d2uY0h
   mSg/iF0za7sW92+s/3Z9Pbudw1iK3X2vmkf9fnx3SDoDlhTUKb3R2DbG6
   Q==;
X-CSE-ConnectionGUID: +CAv5Y76S1a7OQ5k1jJv0Q==
X-CSE-MsgGUID: MLd1czSeQQ6VSZESJ/E4Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="40765124"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="40765124"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 01:03:50 -0700
X-CSE-ConnectionGUID: TlY8OsmORxewc9lbnPQAnA==
X-CSE-MsgGUID: D9J8jR5uSxmKIQvbVJVQrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85301438"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 01:03:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t3sor-00000006VD7-1mUQ;
	Thu, 24 Oct 2024 11:03:45 +0300
Date: Thu, 24 Oct 2024 11:03:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yoshihiro Furudera <fj5100bi@fujitsu.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Add ACPI HID for DWAPB I2C
 controller on FUJITSU-MONAKA
Message-ID: <Zxn_Ye-JmxSKuhkq@smile.fi.intel.com>
References: <20241024071553.3073864-1-fj5100bi@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024071553.3073864-1-fj5100bi@fujitsu.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 24, 2024 at 07:15:53AM +0000, Yoshihiro Furudera wrote:
> Enable DWAPB I2C controller support on FUJITSU-MONAKA.
> This will be used in the FUJITSU-MONAKA server scheduled
> for shipment in 2027.
> 
> The DSDT information obtained when verified using an
> in-house simulator is presented below.
> 
>      Device (SMB0)
>      {
>          Name (_HID, "FUJI200B")  // _HID: Hardware ID
>          Name (_UID, Zero)  // _UID: Unique ID
>          ...
>          Name (_CRS, ResourceTemplate ()
>          {
>              Memory32Fixed (ReadWrite,
>                  0x2A4B0000,         // Address Base
>                  0x00010000,         // Address Length
>                  )
>              Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
>              {
>                  0x00000159,
>              }
>          })
>          ...
>      }
> 
> The expression SMB0 is used to indicate SMBus HC#0,
> a string of up to four characters.
> 
> Created the SMB0 object according to the following
> specifications:
> 
> ACPI Specification
> 13.2. Accessing the SMBus from ASL Code
> https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/13_ACPI_System_Mgmt_Bus_Interface_Spec/accessing-the-smbus-from-asl-code.html
> 
> IPMI Specification
> Example 4: SSIF Interface(P574)
> https://www.intel.co.jp/content/www/jp/ja/products/docs/servers/ipmi/ipmi-second-gen-interface-spec-v2-rev1-1.html

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



