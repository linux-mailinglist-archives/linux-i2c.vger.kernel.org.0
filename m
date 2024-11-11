Return-Path: <linux-i2c+bounces-7920-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0D59C3EBD
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 13:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A795D1F20F43
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 12:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048A915746E;
	Mon, 11 Nov 2024 12:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hzMP4hCF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429508F77;
	Mon, 11 Nov 2024 12:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731329583; cv=none; b=lyHVQX/IrBJlTNtMEL9kFXnXeP7kwnq8sfcL9hEZUQI68VQyJz/4+AjLINtBHIIVkstP2rnGS2TrgF2QMNaNLqsEWD6oRKz2g2AgD/M7oQTsKZeYnZNMhRcXVtKU0BXQdhrqKAfI3ChfT8d+d8HNm5yqbWXCr8CDcrOgppOdh+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731329583; c=relaxed/simple;
	bh=EmDy8i8hq5it3Fzv+p2d4R9idtdlFivFg170LFd5xFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpmz4rw7CJvZB6znJmkpcoY7pH7f+QXyRWdQE4C03bwV2zRWurBEVHLXrKrF0TXtwMJV8tj8s6uIQyLeG7B/xAP79YvmH7xwtV9TyTmWgrS9exdZKrD8QGqO0WwVjE390UiafQYmNehjksoie2Njnft5T7nsz7J/WN95rVf9+6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hzMP4hCF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731329582; x=1762865582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EmDy8i8hq5it3Fzv+p2d4R9idtdlFivFg170LFd5xFc=;
  b=hzMP4hCF33Z1QPLehjncsL+5W0ACLUYa8+gGt2X26Y0QRiBYlV8CmqkB
   uc99wo0KHDD2UB8RFWyT9VNCihqT2HbyE/SCFtQ6iyKj0uo87Txz4NEvX
   iOAy0PflWlBJwnPHXCbo2zcssEqIerVmfIFrXWafEvT7iLP5zQRqscG2L
   jbQ91WSLv9zQFr6zBvIjiqi9bVfpR1C2pFB1KAo8EWKRBtcgTfocwlb3H
   //y9rxgvn2Xnd/Wu/qGh5Uinh5nVCmM8JCEYiJWhXDBbs01ZlsEXJ5vpB
   wTJtVeFtE0M7sX5cgRYkiNPbO5c1h2vp/A5lnq2p64b73CMGUsjDKabp6
   w==;
X-CSE-ConnectionGUID: m3Z434tcQ1Koaeo7xiL/kQ==
X-CSE-MsgGUID: DS8nbV04R0u1lbD6cyItsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30986451"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30986451"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 04:53:02 -0800
X-CSE-ConnectionGUID: nkympEP/SWyGr5a94tnk+Q==
X-CSE-MsgGUID: We31eq1/Qyi6nsO4uvUtWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; 
   d="scan'208";a="110174084"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 04:53:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tATub-0000000DcLB-3Y0I;
	Mon, 11 Nov 2024 14:52:57 +0200
Date: Mon, 11 Nov 2024 14:52:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: i2c: piix4: Add ACPI section
Message-ID: <ZzH-KeSavsPkldLU@smile.fi.intel.com>
References: <20241111115652.10831-1-aladyshev22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111115652.10831-1-aladyshev22@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 11, 2024 at 02:56:52PM +0300, Konstantin Aladyshev wrote:
> Provide information how to reference I2C busses created by the PIIX4
> chip driver from the ACPI code.

...

> +Therefore if you want to access one of these busses in the ACPI code, you need to
> +declare port subdevices inside the PIIX device::
> +
> +    Scope (\_SB_.PCI0.SMBS)
> +    {
> +        Name (_ADR, 0x00140000)
> +
> +        Device (SMB0) {
> +            Name (_ADR, 0)
> +        }
> +        Device (SMB1) {
> +            Name (_ADR, 1)
> +        }
> +        Device (SMB2) {
> +            Name (_ADR, 2)
> +        }
> +    }

You need to elaborate that some of this data may be already present in the BIOS
DSDT (you give your example as it seems most common so far) and hence requires
an additional per-port addresses. With that you should add a note that this
will require to load SSDT quite in advance to make sure that the driver will
see these changes before its ->probe().

...

The rest is LGTM.

-- 
With Best Regards,
Andy Shevchenko



