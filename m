Return-Path: <linux-i2c+bounces-9024-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE3EA09001
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2025 13:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 073D57A5EFC
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2025 12:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5802D205AD2;
	Fri, 10 Jan 2025 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBLKEFdo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3ED20C46E;
	Fri, 10 Jan 2025 12:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736510865; cv=none; b=oXYdN9fCvM+TufSpSMOLczlRPO5wJD8CkWa3cXJWtQqpERguLEnQDVwK8y6tiED5bD1+TcHHN9zm4tOnekWBzghltd1wTNStpUldliHbnDRHrjollNcQzVe/AN4aNSj1R/3aEDO/lYcL/bU+Fn2PYFHgCUnsMyayKR4Rx5/oPlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736510865; c=relaxed/simple;
	bh=j/xA8pkULYGetYBKStxL5KvuRf/eIjJMBPCuAVT76Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ce/OAbDxxgpUBbgw58Rhpa/vbRIJ3VqEXa6YHuIILh/vofBvaRug+pjhYSiP7uIRRZY8/JHtVirYjKt9UNNOkGWJLNJiaXP3XvzyXr0zOxq3QrkhajrrhFNAIKMtrzOWAMZ+XtkthjHXwgf+qy0Zmb1NLZ28uOxbemzu1lEKmxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBLKEFdo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736510864; x=1768046864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j/xA8pkULYGetYBKStxL5KvuRf/eIjJMBPCuAVT76Zo=;
  b=jBLKEFdovhRDV0cqq/lXELmRu0JQsR3PcPW1qaidw64olVff86xVcqwo
   NO4sDWVxDbyM7+471J19GYVdtKYOi1IPrc7traTvyun5naTQ0VF+UBbHD
   oxEjXZAzTf+mrcPDnlLrKnkd1Uu76zw/Mtgpwok8peAKMSVGZmdALvde+
   IHzCaoun3ZFrBZopeIenFbx4FpFv7vlQlbwAdXIk4fFXpFmc74qRv2FwS
   AsI2BcB7sK1BvZxOQe2M5UupNhX2ky50KauGEEYF8fjVu0UgKkGo66s5L
   dfS2j5V5faad2v24oZ4O4KFN63IQkzDPmkIvUMaz46C8C0STytQ8OG2tr
   A==;
X-CSE-ConnectionGUID: gU6rGM0FSwq0BBggDl1mcA==
X-CSE-MsgGUID: lo3KibvIT+6tOV6q7bsNrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="39618701"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="39618701"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 04:07:43 -0800
X-CSE-ConnectionGUID: iODD/zLPQDCOyYhInY258g==
X-CSE-MsgGUID: wXmRuiAHRo2AhI4TBA+0ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103505179"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 10 Jan 2025 04:07:41 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 284B73EF; Fri, 10 Jan 2025 14:07:40 +0200 (EET)
Date: Fri, 10 Jan 2025 14:07:40 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: R Ha <rha051117@gmail.com>, wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
	trivial@kernel.org
Subject: Re: [PATCH 1/1] Force ELAN06FA touchpad I2C bus freq to 100KHz
Message-ID: <20250110120740.GH3713119@black.fi.intel.com>
References: <20250105083358.GU3713119@black.fi.intel.com>
 <CACHtJB94K5OLdHgs8dDj4jDBtZmsdymovboCcJJUt5OkD8o+Mg@mail.gmail.com>
 <20250107072746.GW3713119@black.fi.intel.com>
 <CACHtJB-4UGaqKw5zZjE_vPeYX+bMUMiHPNfNYzD6Wmv6jdAuhg@mail.gmail.com>
 <20250108055150.GY3713119@black.fi.intel.com>
 <CACHtJB-33Pgoj0xORt75G0=cyoKem_K=Dfeg0iQNow18v2sV6Q@mail.gmail.com>
 <20250109111910.GD3713119@black.fi.intel.com>
 <CACHtJB9XeGBhg9de3Y0DkHKBUD-i=rKi2bEi93tv3jjz+LZ=_g@mail.gmail.com>
 <20250110112623.GF3713119@black.fi.intel.com>
 <0151b609-98d9-402a-b553-c9af5b0eb51f@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0151b609-98d9-402a-b553-c9af5b0eb51f@linux.intel.com>

On Fri, Jan 10, 2025 at 01:45:03PM +0200, Jarkko Nikula wrote:
> On 1/10/25 1:26 PM, Mika Westerberg wrote:
> > Hi,
> > 
> > On Fri, Jan 10, 2025 at 02:31:26AM -0600, R Ha wrote:
> > > Hi,
> > > 
> > > Sounds like a good idea. I'm a little worried I'm missing something,
> > > so I think being able to check my earlier answers will help as well.
> > > I'm sending the entire output as attachments, but let me know if it's
> > > better to upload them somewhere and paste the link instead. Some of
> > > the ssdt* files are missing, but they're empty files so Gmail won't
> > > let me attach them.
> > 
> > Thanks for sharing! Okay checked now dsdt.dsl (the other files are not
> > relevant here) and what I can tell the device is supposed to be run at 400
> > kHz. I suspect this is what Windows is doing as well, there is nothing that
> > indicates otherwise.
> > 
> > And since this is a standard I2C HID device it should just work (as it does
> > not require any vendor specific driver even in Windows).
> > 
> > Only thing I can think of that affects this is the LCNT/HCNT and SDA hold
> > values of the I2C designware controller (and maybe the input clock) but
> > there is nothing in the ACPI tables that set these so it could be that the
> > Windows driver uses different values for those and that explains why it
> > works better there.
> > 
> > @Jarkko, do you have any input here? If we cannot figure a better way then
> > I don't see other option than to add this quirk.
> 
> Unfortunately I don't have idea.

Okay thanks anyway! Then I don't see any other option than adding that
quirk.

@R Ha, can you then submit a new version of the patch with the latest
details in the changelog?

