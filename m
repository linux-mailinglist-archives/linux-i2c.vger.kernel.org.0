Return-Path: <linux-i2c+bounces-13676-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 931D4BF14C5
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 14:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 113D818A3067
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 12:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667FC13777E;
	Mon, 20 Oct 2025 12:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HEXlcUTH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B08354AF2
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760964356; cv=none; b=OKQ9ljJcXOOnn6hSiQHXhMwaokKKLJ4Q71hUDl6E91gmHtdPZXyV+/v+Lb8J1aMvp2uAY/rmBPC5hgcpEYJUqUB0mF6c98zrSJXmAQC4JyinBGC8gOB307qGLgGJfyeMU7W4pGltl5MceeBq/v6ECoy43/iQto/sMV/thdhluzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760964356; c=relaxed/simple;
	bh=EkxMdJ9Dcx7aF4lon7bvSl4i4Ri08Kj5nHV2GCWt3ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWG+iTsJOkoDwifiFe2oTBTp82VCwNvjasONmz+FbWw95UdOSGeBFQYHGdDp3Oi0Ghzz0hLElxFlfY0IkQAlkfG6NBcH91UtBguXslLcklV3AN4TdsM6AqGJJcEaYz+ajxtUvHMW1aLzInc0oW9flwld6hF0zN3xMJp4NrqrPnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HEXlcUTH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760964354; x=1792500354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EkxMdJ9Dcx7aF4lon7bvSl4i4Ri08Kj5nHV2GCWt3ic=;
  b=HEXlcUTHpt3VPutF+D/PVeF9mAyHejY3/6t0LEEkEm84KFMmLqv+rpeQ
   8B0kFc2EGVejg2IVQ4wYQ2E4ZcQqUtCJRWc5ONxfgD0Ov1IRATPikyRKm
   bnrUW00Z31dz97zq8u4zrsxsvyk09sDvUPIt5ye+B/+9pi4b9r/N4Hs4a
   i8kRB+5WKY4lY6OmHKMUP3TqAZXmZK+k+oeDxI25hWzjL0AHvS8MtSA8I
   CWvX+mojJYEEoX6dhLm5Pa9g5uktXgctieQfu0cLFTHMic/1XAUSzNDsJ
   SpJTgTL0Q/NyywnqqVUg5k+rn7/ROiKwzWgER18cMlSKDL91wXheH9VSZ
   g==;
X-CSE-ConnectionGUID: vG5CSUZBT+uN9U+NnpxnGQ==
X-CSE-MsgGUID: p3kOdSYqRVOvOCxbB0eHeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63173812"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="63173812"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 05:45:53 -0700
X-CSE-ConnectionGUID: 8uAeVhj3R4Oj/I/DbiLsWA==
X-CSE-MsgGUID: /GpUANh9RIaEYpuaZOpaKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="183165638"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 20 Oct 2025 05:45:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id D746E95; Mon, 20 Oct 2025 14:45:50 +0200 (CEST)
Date: Mon, 20 Oct 2025 14:45:50 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	review list <kernel-list@raspberrypi.com>
Subject: Re: i2c-designware: not possible to write to different i2c addresses
 in one transfer?
Message-ID: <20251020124550.GN2912318@black.igk.intel.com>
References: <ee6afdd7-3117-43cd-831f-e0ec5ee46f46@kernel.org>
 <20251020115959.GM2912318@black.igk.intel.com>
 <90d52cf9-e3e3-437e-ae00-fc2a2bfbb0a9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <90d52cf9-e3e3-437e-ae00-fc2a2bfbb0a9@kernel.org>

Hi,

On Mon, Oct 20, 2025 at 02:29:31PM +0200, Hans Verkuil wrote:
> > Since this is I2C EEPROM, pretty standard I guess. I wonder if you have
> > tried the at24.c driver instead? If I read it right it splits the chip into
> > multiple "clients" per segments thus avoiding limitations like this. IIRC
> > this works fine with Intel controllers at least.
> 
> It's not a standard EEPROM, it's an EEPROM specifically meant for storing
> display EDIDs. The host (in my case a Raspberry Pi 5) can write an EDID to it
> over i2c, and it is also connected to the HDMI DDC lines so a video source can
> read the EDID using the E-DDC standard. So the cat24c208 has two i2c ports,
> one towards the host, one towards the HDMI connector. We use the cat24c208 to
> emulate a display so we can easily debug various EDID issues.
> 
> It all worked fine with the RPi 4 and the Broadcom i2c driver, but not with
> the RPi 5 designware i2c driver. It took a while before I noticed this since
> most EDIDs are <= 256 bytes, and you don't need the segment address for that.
> 
> So is this a hardware limitation? I.e., there is no workaround and this simply
> can't be supported?

This is hardware limitation. That said, there is a way to update IC_TAR
(target address register) dynamically too but it first requires that the
feature is enabled when the controller was integrated (I2C_DYNAMIC_TAR_UPDATE == 1),
and then certain conditions match. Figuring out some of these parameters is
not possible through the register interface unfortunately, so there needs
to be some sort of indication (e.g device ID or firmware property) that it is
supported. I think this is what the other patch series is trying to do but
I have not yet looked at it.

You cannot work this around by doing the same as at24.c and split the
EEPROM part into multiple I2C clients per segment?

