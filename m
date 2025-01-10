Return-Path: <linux-i2c+bounces-9022-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA10A08F32
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2025 12:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D7463A53BE
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jan 2025 11:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51F520C464;
	Fri, 10 Jan 2025 11:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjOBa0nF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C744220B21D;
	Fri, 10 Jan 2025 11:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736508390; cv=none; b=hUFdOSha9DYyLM7tfmumtX4aGB7YJMACqdOt/QoO+/y1UMK/qRHgipKAZ7kyRMQzFqUgQOtxT2h1V5BiB+hA8ogZ4e3o59WKqVulbsu2wQyrvUTTQTOKR10zLfQhOBAQQQSRrmW/cek8OFoa+5kYlzo2kvFiqVKZvzXEkRHaU5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736508390; c=relaxed/simple;
	bh=zDc3mG6+T3MimEZCscASes4oz5AK//74JP++D4lXaDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCj+TMTlhhJ24d+UrePTHmrJBFZLEt14/jTo7dLZQpwpFDRkLUNED5nSh7oJ6AB92QmUyg/mADwOtdPbtp0+yqTc1h5VqXQIrLKOBN6F44hnGZZvhfEBAxg8vq17sw3SG68jKFZgD+F/dF0LyIaO2kD+hLbD+/bVQsIGoHTc8l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjOBa0nF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736508389; x=1768044389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zDc3mG6+T3MimEZCscASes4oz5AK//74JP++D4lXaDs=;
  b=NjOBa0nF+UOhvc7Lk9dZla8FkMpTlO2YMZyOBdhzYhmEvuploa3MyFro
   4g8nHW7uK02A6qt6eekd0BIg371ymqHfQaph2mBI1JOgFi1yC2iC7cz2n
   nkB4mUeB/pQvKrHhCh9oFDYmDFIC1Gf2X+9Y2Gzx1jR0hkbMmSSbya0fE
   LO/y9tWa3ZqBL+vRo6j+rdUE0i6qpfWmOwwHmgG8Oq0q1j7r5/zjZtfQe
   qIQ/7qtUD6ecFagTNOtzo8rBLWIhsyuiWHjUjpcJTbKfL/C4eiJ8JOL6q
   NzAyUJulRpAyjXUqDAA6yWLxpz5M/a20UV5SAlvszdThxUOcGL/8OcDtA
   w==;
X-CSE-ConnectionGUID: YM22GWNRR/6bwPgC9iXAiA==
X-CSE-MsgGUID: vZ8oModFSTKfqHw3k7kutw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47295709"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="47295709"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 03:26:27 -0800
X-CSE-ConnectionGUID: tq9fGEejQ++jwcr0olnbWQ==
X-CSE-MsgGUID: iCW+7HzlTAy5iDlOzJTjfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="134549437"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 10 Jan 2025 03:26:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5F7A03EF; Fri, 10 Jan 2025 13:26:23 +0200 (EET)
Date: Fri, 10 Jan 2025 13:26:23 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: R Ha <rha051117@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH 1/1] Force ELAN06FA touchpad I2C bus freq to 100KHz
Message-ID: <20250110112623.GF3713119@black.fi.intel.com>
References: <20250103093353.GP3713119@black.fi.intel.com>
 <CACHtJB-rZ6SKF3d3xTsbJ=zQ+fPVcCcYxXLX_yMRdpE_4tyYYw@mail.gmail.com>
 <20250105083358.GU3713119@black.fi.intel.com>
 <CACHtJB94K5OLdHgs8dDj4jDBtZmsdymovboCcJJUt5OkD8o+Mg@mail.gmail.com>
 <20250107072746.GW3713119@black.fi.intel.com>
 <CACHtJB-4UGaqKw5zZjE_vPeYX+bMUMiHPNfNYzD6Wmv6jdAuhg@mail.gmail.com>
 <20250108055150.GY3713119@black.fi.intel.com>
 <CACHtJB-33Pgoj0xORt75G0=cyoKem_K=Dfeg0iQNow18v2sV6Q@mail.gmail.com>
 <20250109111910.GD3713119@black.fi.intel.com>
 <CACHtJB9XeGBhg9de3Y0DkHKBUD-i=rKi2bEi93tv3jjz+LZ=_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACHtJB9XeGBhg9de3Y0DkHKBUD-i=rKi2bEi93tv3jjz+LZ=_g@mail.gmail.com>

Hi,

On Fri, Jan 10, 2025 at 02:31:26AM -0600, R Ha wrote:
> Hi,
> 
> Sounds like a good idea. I'm a little worried I'm missing something,
> so I think being able to check my earlier answers will help as well.
> I'm sending the entire output as attachments, but let me know if it's
> better to upload them somewhere and paste the link instead. Some of
> the ssdt* files are missing, but they're empty files so Gmail won't
> let me attach them.

Thanks for sharing! Okay checked now dsdt.dsl (the other files are not
relevant here) and what I can tell the device is supposed to be run at 400
kHz. I suspect this is what Windows is doing as well, there is nothing that
indicates otherwise.

And since this is a standard I2C HID device it should just work (as it does
not require any vendor specific driver even in Windows).

Only thing I can think of that affects this is the LCNT/HCNT and SDA hold
values of the I2C designware controller (and maybe the input clock) but
there is nothing in the ACPI tables that set these so it could be that the
Windows driver uses different values for those and that explains why it
works better there.

@Jarkko, do you have any input here? If we cannot figure a better way then
I don't see other option than to add this quirk.

