Return-Path: <linux-i2c+bounces-7447-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 095469A1E67
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 11:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3C271F272E3
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 09:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C2A1D90AC;
	Thu, 17 Oct 2024 09:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfPj46Zc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58861D432D;
	Thu, 17 Oct 2024 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157398; cv=none; b=DxaMYo8UeOTJDDmyX8pbM1/nxJndd5PWRPcAw6b1eWj+iG2xnj+hgexRMiSJ4LLwrzlcbNQtEaaUjL5eqAzro2b/W7cpc1B8E8a44Qj4Zsq0O/ObuUEkWEbHOW/XuVdmQEy5T8h6E5HFNF5rIJ8cKl9XRAAN8iiTyhJOh2z1PJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157398; c=relaxed/simple;
	bh=g0rJpngEYKJ2UIwYT7URmdbzYNXEAze2/RC47InKg+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SX/GqIZ5vmXttmDUcZFmZFEBZncYLYJS4+4XgL66yOaOcchQ2c4hLbbXRoyvyJ9nHWJE64UCWOXR14L6y2FsV4Q1VaYA4UJib/HZueMUqmFHbYv2H0q9ef1CpuZ48FvYp8dfvIvCEdV/Wf44me5YkdaaUylnXRSQ4/b4150rEhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfPj46Zc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729157395; x=1760693395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=g0rJpngEYKJ2UIwYT7URmdbzYNXEAze2/RC47InKg+M=;
  b=HfPj46Zcpu3lBCE0XR3t5b7TFBOCDRFF/dMOulZ9RX2GPGvGBel8R24A
   LKGK6xtfKCYuHWbxld+vYlWw0RYoVSj53lbATuHdS2nPRjmxtiXqx+P92
   WgHvuqcEo8re67S6befYWWtq+8k60EewKVqDQCboCindCWXHjfuBTs9gs
   Q6MTM9Vy5mKgs1WKRmQgw2lyWz+s4TOXSkUfahgCK6R/2uHjIQocZVrPL
   JLO7bxIlrLmHlrB9G7AAqX+z5GVYyTsjs1h5qkC/AIEzUsU9qG2kd+rPE
   1K0g3XdwEr0IiKGZTXmZCRRaz3c18t1n+yZqV+3gXCfsWj5+hN2c0jIXh
   w==;
X-CSE-ConnectionGUID: BxDAeh3+Tf6bMsyZS8mYYA==
X-CSE-MsgGUID: J/U2t9QtTj6qtXtOj53JEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="28105626"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="28105626"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 02:29:00 -0700
X-CSE-ConnectionGUID: pfQF2fvwSVGYhNRubhXAzQ==
X-CSE-MsgGUID: W9sygzwiS/m+CA0FRFsmug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="115927375"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 02:28:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t1MoQ-0000000444y-1VbQ;
	Thu, 17 Oct 2024 12:28:54 +0300
Date: Thu, 17 Oct 2024 12:28:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	"hunter.yu" <hunter.yu@hj-micro.com>, jarkko.nikula@linux.intel.com,
	lenb@kernel.org, jsd@semihalf.com, linux-acpi@vger.kernel.org,
	linux-i2c@vger.kernel.org, andy.xu@hj-micro.com,
	peter.du@hj-micro.com
Subject: Re: [PATCH v2 1/2] ACPI: APD: Add clock frequency for HJMC01 I2C
 controller
Message-ID: <ZxDY1ljxXkO7pFnl@smile.fi.intel.com>
References: <20240926024026.2539-1-hunter.yu@hj-micro.com>
 <20240926024026.2539-2-hunter.yu@hj-micro.com>
 <pmbvhdaz4qt57gxemuxoyb6xjrcmvusm2jzl5ps3o5ga52edo5@qabu6rcbdipp>
 <CAJZ5v0gSyMYerPqH9LOA77EWdBEOL7kHrc1+P1R=8Epn77gfNw@mail.gmail.com>
 <ZxDYOrAJEddtPrWv@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZxDYOrAJEddtPrWv@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 17, 2024 at 12:26:18PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 16, 2024 at 10:45:26PM +0200, Rafael J. Wysocki wrote:
> > On Thu, Oct 3, 2024 at 12:13 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> > > On Thu, Sep 26, 2024 at 10:40:05AM GMT, hunter.yu wrote:
> > > > I2C clock frequency for HJMC01 is 200M, define a new ACPI
> > > > HID for it.
> > > >
> > > > Signed-off-by: hunter.yu <hunter.yu@hj-micro.com>
> > >
> > > Do you want your name to be hunter.yu or Hunter Yu? I prefer the
> > > second and if you browse the git log, you can see that everyone
> > > uses Name Surname.
> > 
> > It must be a real name as per submitting-patches.rst
> 
> Hasn't this been relaxed last year by the d4563201f33a ("Documentation:
> simplify and clarify DCO contribution example language")?

Note, I do not imply that the existing variant in this patch is ideal, I also,
as Andi, prefer the proper spellings on the "name" parts.

> > The S-o-b is meaningless otherwise.

-- 
With Best Regards,
Andy Shevchenko



