Return-Path: <linux-i2c+bounces-2354-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC62387BDB9
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Mar 2024 14:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D8E2B22618
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Mar 2024 13:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D8D5B5D6;
	Thu, 14 Mar 2024 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbmw6TDx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613775BAFC;
	Thu, 14 Mar 2024 13:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710423044; cv=none; b=vAdTrYm5TqqUfFEdUVZUnVi16vg/CL4Z0L0oGL6Pf7JaYbSYcGx5nfzFR3mW8ngjtqfYIbHQCFcgVB8j1Tctk3yGRJfNWMYOZzh34z/8zqZqFeN2dalM/Nbz/o4ipltx1TJCc4yGVOi00RAJNMBlBWxPE8ng25G1FqhKfOhIkaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710423044; c=relaxed/simple;
	bh=9oG1mXXWnpAIYRCoZESr0mUiFQQQyz22CCg2ShGWqJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqrlLkinxvx3OSz1689vv6Za0oNXqwaWQG3krhuE8bzXtHiMMaQvS7RgOdRnGOfQmq1bud11WzRxzoKeeFl1FNJKA6nTsT1OB+FAy/Lu4smNpZYgafM/ZpzIJfkvM9Enc6VbEn/iVtcPBtd9UsQcPixsGTnuwOMaLYTwR9kDlHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbmw6TDx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710423042; x=1741959042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9oG1mXXWnpAIYRCoZESr0mUiFQQQyz22CCg2ShGWqJQ=;
  b=kbmw6TDxPpoU3YXKrmXWnMvCt2oBsiBzI0DQeU6MqQ7DX/g50B79WKZV
   bH2dDn5tWBiFdHhbh/NzpYxIBAp5Adt7tF3r3Dw9AKU5aAEUXpynLPKaz
   oOjMUTG2TArv3j24lL+Z+Tbmuh0DdD4dLBXOPGzU4Yzdqu01waE+4nTmU
   3XhoRbVRm2ax2Tfq+6X3b5HdeMXNEyXa62nVr9HPk5TGrhsJSWN+VsxkZ
   w1O+JAOPe5hm6loO610kEwhOXn4vJie9X3bBxV8r1WBKRAF2iLubQmuX7
   yKHVjjyYliUyy+b/i91dOigvhCOhQ9g56tepS9Qmd7zpcDKmR4chZ5yR8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5093539"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5093539"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 06:30:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="914460500"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="914460500"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 06:30:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rklAL-0000000CWbf-35s4;
	Thu, 14 Mar 2024 15:30:37 +0200
Date: Thu, 14 Mar 2024 15:30:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Lee Jones <lee@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: `intel_lpss_pci_driver_init` takes 23.8 ms
Message-ID: <ZfL7_Uuh0EQrptNG@smile.fi.intel.com>
References: <ebd4dd9d-3710-4cbb-92d1-c3f73b66bc97@molgen.mpg.de>
 <20240208085928.GB689448@google.com>
 <ZcUQen0nYAAtZVw8@smile.fi.intel.com>
 <49d0a968-7570-43ac-963c-47b9c6dcc353@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49d0a968-7570-43ac-963c-47b9c6dcc353@molgen.mpg.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Feb 11, 2024 at 08:38:15PM +0100, Paul Menzel wrote:
> Am 08.02.24 um 18:33 schrieb Andy Shevchenko:
> > On Thu, Feb 08, 2024 at 08:59:28AM +0000, Lee Jones wrote:
> > > On Tue, 06 Feb 2024, Paul Menzel wrote:

...

> > > > On the Dell XPS 13 9360 and Linux 6.8-rc3+, `intel_lpss_pci_driver_init()`
> > > > takes 23.8 ms, making it one of Linux’ longer init functions on this device:
> > 
> > Does it mean on the previous releases it was different?
> > I mean is it a regression or always was like this?

Okay.

...

> but this seems to have a big affect on ACPI/ASL operations, and execution
> time increases to 125 ms. This breaks down to
> 
> 1.  `i2c_acpi_find_bus_speed()` (96.985 ms @ 3.008753), where
> `acpi_walk_namespace()` takes this time.
> 2.  `i2c_dw_probe_master()` (27.161 ms @ 3.105964) →
> i2c_add_numbered_adapter()` → `i2c_add_adapter()` → `i2c_register_adapter()`
> → `i2c_acpi_register_devices()` → `acpi_ns_walk_namespace()` (24.178 ms @
> 3.108927)
> 
> No idea if this is a red herring, and the long time is actually do to
> something else.

Might be related https://github.com/acpica/acpica/pull/897
Wonder if it helps you anyhow.

-- 
With Best Regards,
Andy Shevchenko



