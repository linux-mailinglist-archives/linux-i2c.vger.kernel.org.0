Return-Path: <linux-i2c+bounces-13673-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7C6BF0F83
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 14:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E04A18A3C7B
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 12:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEAF3112C0;
	Mon, 20 Oct 2025 12:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BH4Tyx3R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CA030F7EB
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 12:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760961604; cv=none; b=VUVjlAblGEwTrBnJtAKUDeJ2BUyIGGeUrKM5Yx1XUyz+tLw90r3BRtBwqCc+e5B+v+FLnySVS7+Jv7rAR0yUYDcqRdzJfdyB/46h/F+VBw9NDTwptUx8lDO6IQ/eMylRdxJb71XG3etKEbh+3cCJN6KNgOAUMLaHTJdDY3furAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760961604; c=relaxed/simple;
	bh=N5MWoWWyi6QfeoH8IcScFmQPkOGGKUavChWRCI8NQZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIxHRymN/KgBiYDhz006pNS4fJy69sAud32NYeqmU0T/hFMhr0z91Ns2eAoxEre/NDgEbPFiDS6tbnVTJOuHyNYFp0kNf/5HqEiR2+kqTGNfi2QEm51wATw57U9Q1khsFGDr3hZZIWIXY1vuG8j42WWwZQQM83fTvO+/c/BkAVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BH4Tyx3R; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760961602; x=1792497602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N5MWoWWyi6QfeoH8IcScFmQPkOGGKUavChWRCI8NQZ4=;
  b=BH4Tyx3R39kiKFeErowztEONz97L1pTLpvtAfNEF6nYgD1pgzvfsMzh+
   UuW7gYp+W3r2O9Uoq2CcQbZLJsexXXmKHl2bGjaFTOMhjy8GYEKV3woLM
   SQBT8BBgqyxGrcOL6pRLeycxnPrR4DO74IRJH9bMnHFQfsj2df5n5QS9o
   fD+c/yUwzIx1cGLTWB/EINVkIjjNwah4yBVApydWXotWWUc4qRe8WbujD
   gtJergBhkLrplIFJMWFpPLdm6Tz1Rv9yj3tkxeqtcgA+kZOkueat7JMeW
   fOR+HPREYKbzoqDNfBoGlNUmzbnHIqI2LTEvd0dvF+jxjyoeJFRue0smV
   w==;
X-CSE-ConnectionGUID: 4WGDA2KHQ1ejdwEdeNcwgg==
X-CSE-MsgGUID: NyzbpShYS9ixLDRQtoxtYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74511824"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="74511824"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 05:00:01 -0700
X-CSE-ConnectionGUID: fQYF7PkOSi2bNcicusdqyg==
X-CSE-MsgGUID: 3jrBB2mGTz2+wnmWTNv3og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="184080392"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 20 Oct 2025 05:00:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 657A095; Mon, 20 Oct 2025 13:59:59 +0200 (CEST)
Date: Mon, 20 Oct 2025 13:59:59 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: i2c-designware: not possible to write to different i2c addresses
 in one transfer?
Message-ID: <20251020115959.GM2912318@black.igk.intel.com>
References: <ee6afdd7-3117-43cd-831f-e0ec5ee46f46@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ee6afdd7-3117-43cd-831f-e0ec5ee46f46@kernel.org>

Hi,

On Wed, Oct 15, 2025 at 01:25:02PM +0200, Hans Verkuil wrote:
> Hi,
> 
> I have this code in a driver (writing display EDID data into an EDID EEPROM):
> 
>         struct i2c_msg msg[] = {
>                 {
>                         .addr = state->seg_client->addr,        // 0x30
>                         .buf = &seg,
>                         .len = 1,
>                         .flags = 0,
>                 },
>                 {
>                         .addr = state->data_client->addr,       // 0x50
>                         .buf = data,
>                         .len = len,
>                         .flags = 0,
>                 },
>         };
> 
>         err = i2c_transfer(state->dev_client->adapter, msg, ARRAY_SIZE(msg));
> 
> This worked fine for the Raspberry Pi 4B using the broadcom i2c driver, but for
> the Raspberry Pi 5 using the designware driver it fails with -EINVAL and these
> kernel messages:
> 
> [  272.284689] i2c_designware 1f00074000.i2c: i2c_dw_xfer_msg: invalid target address
> [  272.305788] i2c_designware 1f00074000.i2c: controller active
> 
> Looking in i2c-designware-master.c it seems it cannot handle consecutive messages for
> different addresses.
> 
> The i2c device I'm using is this one:
> 
> https://www.onsemi.com/pdf/datasheet/cat24c208-d.pdf
> 
> Is this a hardware limitation? Or is this a corner case that was never implemented?
> Or just simply a bug?

I'm catching up what has happened to this driver since I last did something
for it so please excuse me if I'm stating obvious things ;-) Also was on
vacation last week, sorry for the delay.

The Intel I2C DW datasheets say that the I2C_TAR register must be
programmed only when the controller is disabled (I2C_ENABLE=0) or no
initiator mode operations are active.

I think this explains why the driver does what it does.

Since this is I2C EEPROM, pretty standard I guess. I wonder if you have
tried the at24.c driver instead? If I read it right it splits the chip into
multiple "clients" per segments thus avoiding limitations like this. IIRC
this works fine with Intel controllers at least.

