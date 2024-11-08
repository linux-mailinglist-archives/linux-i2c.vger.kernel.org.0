Return-Path: <linux-i2c+bounces-7887-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4A39C1C16
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 12:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 715B1284D4C
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 11:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62891E285C;
	Fri,  8 Nov 2024 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YD+Wjbgy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9D21DE8A8;
	Fri,  8 Nov 2024 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731065016; cv=none; b=YayNX1mzCLPfKk4K2ryoFTzP2XH8bMmKWQYUuooHa3lJQ8E6qwqhaDmnEKFNYZ1Uj/duepp/OVyGz/S3Xer+fQ7ReIwyy1eLWS96BXAe37EtywqSfKl9aDTR+HATXU0pkTxcowvDFNa3nE0rJqDoyh8tfm7lAgsAcjleR8/jYWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731065016; c=relaxed/simple;
	bh=l+jCLcwQRKHLWdKodj595NzQd3OeNECYhVuj+4yfojM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrLPW0sXlp7/AWa3fry5PCsLbL3bdCwvqaC3lR0blSEbjFaZ9XQnkMToaoIgsFDoD2cJzsYhhtCdGhBKlb10fU/CPeW27teXApBQAVumqLGaYNVUNfsnv7fp3leQsB9MJ3nfsaJSj9GmZSSLMa25q6eIuDyUhKKiN7ROL3GccFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YD+Wjbgy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731065015; x=1762601015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l+jCLcwQRKHLWdKodj595NzQd3OeNECYhVuj+4yfojM=;
  b=YD+WjbgyjNYxMLuqpcJx+WkPasMWv6SHW0dFEjQoMCGtax9FkB96F9Uv
   rSXcjoCbcrPMFKMzMyNRFIBjryvONCKjiSXd8KEoYuuwFWRC+W81rljSA
   yw5PmgJEHzMyzxDDjeGxxCk/kNeYJQ24DOlrzxZufGMI5EdOJifFvi0Dk
   lT/GN9HibQijOL8RFU3OpNQhD6AFbI7FczPwWW/on3VPqs9H92429I0Qb
   IQwNVIdvR9ForrmkOEA0v82ru1o6CZhQ89+6anUGWIMvF7MFwpoervBgu
   f404ehmtPRHg5ssHPoUNHGkkYYIqMfRDUQ1G+Vwvnobv17/KEP8Y4nr6B
   A==;
X-CSE-ConnectionGUID: /H/sY5s5R8SJE3oh5KqYEw==
X-CSE-MsgGUID: mKvt0dB+QNyknD31zKoIMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30905847"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30905847"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 03:23:33 -0800
X-CSE-ConnectionGUID: lgnMEosETXmErtGIx3/myg==
X-CSE-MsgGUID: YDR1eDRXT6uNYjH3O7045A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="90164629"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 03:23:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t9N5O-0000000Cae7-02lm;
	Fri, 08 Nov 2024 13:23:30 +0200
Date: Fri, 8 Nov 2024 13:23:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Florian Eckert <fe@dev.tdt.de>
Cc: Konstantin Aladyshev <aladyshev22@gmail.com>,
	linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: Adding I2C devices to the SMBus (PIIX4) via the ACPI SSDT
 overlay method
Message-ID: <Zy30sTgK9MER2bD1@smile.fi.intel.com>
References: <CACSj6VX77y6K9FNFZn-rMvEL9XSPS6rFDt-STGf1UxgkuS6msw@mail.gmail.com>
 <Zy3P7ld7UUL8XCrR@smile.fi.intel.com>
 <7fc0f59b8264e965efc96c0aa0ba4c31@dev.tdt.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fc0f59b8264e965efc96c0aa0ba4c31@dev.tdt.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 08, 2024 at 10:27:08AM +0100, Florian Eckert wrote:
> On 2024-11-08 09:46, Andy Shevchenko wrote:
> > +Cc: Florian (as this indeed rang a bell to me)
> > 
> > https://lore.kernel.org/all/d84fb798722762862a7fb08f1e343b6a@dev.tdt.de/
> 
> The message was forwarded by Andy because I had a similar problem with my
> APU3 [1]
> from PC-engine [2], which is also using the PIIX4 for I2C (SMBUS).
> 
> > > Maybe I need to modify ACPI code somehow to create these
> > > 'physical_nodesX' folders for the relevant i2c-7/8/9 buses?
> 
> I don't know if that helps, but with the following SSDT overlay I managed
> to get the driver to feel responsible for the mcp23017 via the I2C (SMBUS)
> of the APU3. The mcp23017 is used on my APU3 to add additional LEDs to
> '/sys/class/leds'.

Thanks for prompt response!
Can you, folks, elaborate and update the in-kernel documentation [1]
by adding a section to it for the above topic, so next time I have got
a Q like this I can point to there?

[1]: Documentation/i2c/busses/i2c-piix4.rst

-- 
With Best Regards,
Andy Shevchenko



