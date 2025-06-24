Return-Path: <linux-i2c+bounces-11568-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DBEAE6369
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 13:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C4371671E3
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 11:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D7F28A1E7;
	Tue, 24 Jun 2025 11:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/WFMsBV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D56628937C;
	Tue, 24 Jun 2025 11:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750763650; cv=none; b=WYySPhK2elMWVynLRe0zYOA81GmlGk7/CxBku74c0x6LTJzk1qqbSksu+oTOjEY16bcvq4iftqAVSha68/NHa0oCM0ay/5OjnOoBAxTlLLuWuRhQ0tF+VbgzGene4wuh1Ue/DYvmJoArcmoes+BQ/v8hMztm5IZu1K7ylz/m+5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750763650; c=relaxed/simple;
	bh=l5BcFpZwIEoeM8dTDL/OU7GngyqkrHjo/E83C4nCthE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmCNx27rWRQUjW42XP0E1C/Q+lLlC5vZMlLzRPIsFQYC/OG4oJIaMTlVA7rERZzxXylVAfsbhl3Zlq+Fy5IKJjO6dNe+7w4Boh1Pbr1Iei4xX3raDw+0GudDnNpeHSbzF1LxBi9Gx3tTMm15sJPH6tkS+xKxxyuNzftsWt8uMng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/WFMsBV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750763648; x=1782299648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=l5BcFpZwIEoeM8dTDL/OU7GngyqkrHjo/E83C4nCthE=;
  b=M/WFMsBVl8r8l5QQnYrurgJEXd0xIfsffA4VQ4kUzk1Vm4rf8xAFSsZa
   TF8ET4GSOFaZu82p9bW2ofLTIqjQwi8tHg2A84BEOVfn5VxdvwFe5sid6
   v8DUmjr/wFK8u5rwHgSQ8st8CbF/WsgpCTkY5w2fCwcKLuotRcH2ShsNy
   kzr066Cn8DMV4PAdctiH+wvDB5rVt7rvtsgxuhVFl5Boj2AM3gLw3Ld7T
   tICLHzu9uQJYbmqqsKT1MX1bnUjNcWqem6CtXOZVVKPbka+6Seja/lA7x
   uHN4OA/T0Dy10DHkbfJWVkani8ig23MqGoupWplmanZV//uN+gygLHXXr
   Q==;
X-CSE-ConnectionGUID: 56nTQGj3QwqOTmWrDgsFlQ==
X-CSE-MsgGUID: rzcTNdlyRNWzRv6gMG6r5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52934218"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="52934218"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 04:14:07 -0700
X-CSE-ConnectionGUID: BnDR0aXkTZmpYYrt8px6KQ==
X-CSE-MsgGUID: iVCO88kyT/GvaYNK/u7raQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="189074918"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 04:14:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uU1bE-00000009S3y-0xYI;
	Tue, 24 Jun 2025 14:14:00 +0300
Date: Tue, 24 Jun 2025 14:13:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Randolph Ha <rha051117@gmail.com>, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <westeri@kernel.org>
Subject: Re: [PATCH v1 1/1] i2c: acpi: Replace custom code with
 device_match_acpi_handle()
Message-ID: <aFqId5DaRTWxUXrn@smile.fi.intel.com>
References: <20250623134521.158447-1-andriy.shevchenko@linux.intel.com>
 <20250624054508.GA2824380@black.fi.intel.com>
 <aFpRZoIkQod6g2Dm@smile.fi.intel.com>
 <20250624072559.GB2824380@black.fi.intel.com>
 <aFpVX05xv4j4uRiP@smile.fi.intel.com>
 <CAJZ5v0hB1dJ-wb1_Wn0yrf0JVfpqR9cZ7xBmjKM2kB1Q=FF=yQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0hB1dJ-wb1_Wn0yrf0JVfpqR9cZ7xBmjKM2kB1Q=FF=yQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 24, 2025 at 12:18:22PM +0200, Rafael J. Wysocki wrote:
> On Tue, Jun 24, 2025 at 9:38 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Jun 24, 2025 at 10:25:59AM +0300, Mika Westerberg wrote:
> > > On Tue, Jun 24, 2025 at 10:19:02AM +0300, Andy Shevchenko wrote:

...

> > > But like I said, no objections. I just don't think this improves anything.
> >
> > I think there is an improvement.
> 
> For example, this helps (I think) when someone uses something like LXR
> to look for places where a device is matched against a given ACPI
> handle, but only as long as device_match_acpi_handle() is used in all
> of those places consistently.

Yeah, this is a problem in the kernel that we may have a lot of legacy code
here and there. Unfortunately I have no plan to go all over, this is just
an ad-hoc change while debugging a regression (I hope not related to this
piece of code).

-- 
With Best Regards,
Andy Shevchenko



