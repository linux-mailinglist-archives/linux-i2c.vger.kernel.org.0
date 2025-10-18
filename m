Return-Path: <linux-i2c+bounces-13631-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8D1BEDA0E
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 21:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A41B24ED4E7
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Oct 2025 19:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F3E285058;
	Sat, 18 Oct 2025 19:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDYyPlY7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A568259CAF
	for <linux-i2c@vger.kernel.org>; Sat, 18 Oct 2025 19:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760815305; cv=none; b=RzikMb8i6Y0ckAg5eMYnwE5EcKl8UnwUMu6xMWO2YPBCiy7SXp8OYvM/KNnG99XRGwPci77YdPFTODcP/OSBiQrS+KAe0aL0wtyBY0jMw5LZAYtRC1WigYlKbcWVFOgqDcaeBjSRgE6zpMm53YNGw30RK8d8lm0K9/xa2QkKqLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760815305; c=relaxed/simple;
	bh=P4qIw9IiP2xiG0vax87yU8WKTxRJO7KdxTNnLRBxWxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfiAeeQqUEYVFi0ZoHyGD/6MeqmIMgRPmnAEvRY/wUWzN4lP2e8228jRhvXCZHmhBU3L03eKidBAScOkBwB+K9R/tS3erXidGvAnmdIAiLTKMcp9tre9BF3Pgo+OKBn5XWME6x/Po/Un8nsKzUsDy9k9nv06HIY/jZuCO23J94k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDYyPlY7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760815303; x=1792351303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P4qIw9IiP2xiG0vax87yU8WKTxRJO7KdxTNnLRBxWxw=;
  b=KDYyPlY7hiZeKR+d4lZuDidm8ni2/i7qhNFPBKY2uGKF9Cx+gWhm9ai5
   njVOO83LQ7Pc1Qwg9pd1+twbttTqX8pYYWqpwNFODi8PbvZ8zGfn2iwKy
   xejizTom1N1pDe3vURwleK1MoQWBKFI9FykzTZqfnXcn0CHBDyQSJCDQS
   PoCUqMLbPr2SlzEb8kJyIA8TenMqIQPukpsGqvpNW5ixxDcBdkkktEIke
   o09LZVKn1l94XHw4SiHEq7VmBFEECIVTZaWAG3qAvVMyHv7fFbpfC9EgS
   vqGn227TXwUKF8QGj67EmMD3PY4X9JpZrmlFJILPmOv5EFNWOnUFC8rRQ
   Q==;
X-CSE-ConnectionGUID: yZf2uTfIRomyzSc0dMVCtg==
X-CSE-MsgGUID: +ShJGFEvRKeoeV91rExSQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66831524"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66831524"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 12:21:43 -0700
X-CSE-ConnectionGUID: Hb4nF28xTTWxqPVpjtkCwg==
X-CSE-MsgGUID: 9J38YpnkSgWzc7DzU9OkMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="183411843"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.194])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 12:21:41 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vACUk-00000000xR5-1gSm;
	Sat, 18 Oct 2025 22:21:38 +0300
Date: Sat, 18 Oct 2025 22:21:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: i2c-designware: not possible to write to different i2c addresses
 in one transfer?
Message-ID: <aPPowuQ6GdHRyxgx@ashevche-desk.local>
References: <ee6afdd7-3117-43cd-831f-e0ec5ee46f46@kernel.org>
 <aO-KuJ_T9cXsNpIh@ninjato>
 <aO-kZUwqcoqnFfTh@smile.fi.intel.com>
 <a776e232-d26b-405c-b468-0e449296becd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a776e232-d26b-405c-b468-0e449296becd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Oct 18, 2025 at 08:17:36PM +0200, Hans Verkuil wrote:
> On 15/10/2025 15:40, Andy Shevchenko wrote:
> > On Wed, Oct 15, 2025 at 01:51:20PM +0200, Wolfram Sang wrote:
> >>
> >> lucky you, I happen to have a board with that controller on the table
> >> currently :)
> >>
> >>> This worked fine for the Raspberry Pi 4B using the broadcom i2c driver, but for
> >>> the Raspberry Pi 5 using the designware driver it fails with -EINVAL and these
> >>> kernel messages:
> >>>
> >>> [  272.284689] i2c_designware 1f00074000.i2c: i2c_dw_xfer_msg: invalid target address
> >>
> >> Confirmed.
> >>
> >>> Looking in i2c-designware-master.c it seems it cannot handle consecutive messages for
> >>> different addresses.
> >>
> >> I agree. I leave the final judgement to the experts (Andy, Mika), but I
> >> already anticipate that I need to extend the existing
> >> I2C_AQ_COMB_SAME_ADDR quirk into a more generic one. And set the quirk
> >> in this driver.
> > 
> > May I ask a dumb question? Why do we need such an awkward transaction
> > to begin with?
> 
> That's how the datasheet defines the transfer. And in turn it is based on the VESA
> E-DDC standard for reading display EDIDs. By doing it in a single transaction you
> ensure that the bytes are written to (or read from) the correct EEPROM segment. If
> it was split in two commands, then someone could change the segment inadvertently.
> I.e., you set the segment to 1, then someone writes to it as well and sets it to 2,
> then you write the EDID data to the EEPROM, which has now selected the wrong segment.
> 
> For now I have split up the transaction into two independent transfers in my driver,
> one to the segment address, one writing to the EEPROM. This works, but it is not really
> how it is supposed to be done. And I was actually surprised that it worked, since a
> write to the EEPROM without writing to the segment pointer first in the same transaction
> should write to segment 0, according to the cat24c208 datasheet.
> 
> I couldn't tell from the designware driver code whether this was 1) impossible (HW limitation),
> 2) possible, but not implemented, or 3) a bug. The comment in the code before the
> "invalid target address" error was rather vague.

Thanks for a comprehensive reply. I see now where it comes from and I have no
objections on the proposed direction to fix the issue.

-- 
With Best Regards,
Andy Shevchenko



