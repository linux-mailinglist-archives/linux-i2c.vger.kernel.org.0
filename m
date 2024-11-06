Return-Path: <linux-i2c+bounces-7837-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBFE9BE446
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 11:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FE762835BB
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 10:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ECB91DE2CC;
	Wed,  6 Nov 2024 10:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PnU1QSKu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BB91DE2BF;
	Wed,  6 Nov 2024 10:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730889009; cv=none; b=ZqWggc4Cx0ihGJyZZIf22wyz7x7jwgtsRODGyvP/Y5fRZlHhpUYGFIuHcbW5B0Eo+L4vJiV01TAqeYD/g6j84E53NA7VQ1PY5YNr+fv7kcpRjhCn5j2wNqODL7AQrnTDY9Qdo1E1VO9SaZ0lJioVVemJdGUYN+sdj4mfwHmUwT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730889009; c=relaxed/simple;
	bh=lvRGKAkNsLF/a6fhSG8xQPz5yugTm15Rjv/WEvMptKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Od8c1JPfOdIDZjWR6aeJL71TmJz69joyt5lhi/Ewf/Qp0KYAsNMx7d307BzWa2urHzfhStQ14LaLskM+lWV9wuIDsrzLI9OcH1NSIUuFPGKZvqDBFQCZEUEnG8YnSp8agokqXJJlyZYcNb77dJ5sM7dPMpphNmtXjRPlXpFNEJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PnU1QSKu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730889008; x=1762425008;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lvRGKAkNsLF/a6fhSG8xQPz5yugTm15Rjv/WEvMptKg=;
  b=PnU1QSKuCouQ2YMbFf1aAZOBsIS6N+/WlC6d2Zxs4F8W71UZnil/8g6g
   0NoxSVSBD+i/wzJTqVodxZ1McxFyhhSpxl2M1zauulF6m0vS2vazmBKXq
   fMO5zrrbpAcBJuGwJaWwcv8U/5j4F6hI8pOMLXjrLOeguUMqqJnEDjvDB
   TiCh6Nuguiu1pNsOByvBoaeVxowYG0D6csnghTXFhDmfGHoJmmemSuN55
   LP5O3IWky8XaD5FyMgyVZs3+1c+sQLzKdouj+QGBVkENqTaKWbqC0CDwE
   N9RkcM4deU4d4EWK8vU47eVcJSe8tSooBXx3SmSb4QhMdpx+NQQd3sxRW
   A==;
X-CSE-ConnectionGUID: M6fE8kW7Qgq28Xz/TkljzA==
X-CSE-MsgGUID: KDoqtmh1Q26EfzVyGUom9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="41304181"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="41304181"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 02:30:07 -0800
X-CSE-ConnectionGUID: MakxcGezSxy/lAKqmWUm/w==
X-CSE-MsgGUID: Z4v8fUCLT/evuQ87cBTu9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84607016"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by fmviesa009.fm.intel.com with ESMTP; 06 Nov 2024 02:30:06 -0800
Message-ID: <46cbf76c-7de3-4b10-852e-81e2dedacd2c@linux.intel.com>
Date: Wed, 6 Nov 2024 12:30:05 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] Bug 219440: Touchscreen stops working after
 Suspendi: i2c_designware.1: controller timed out
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Michael <auslands-kv@gmx.de>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <d5acb485-7377-4139-826d-4df04d21b5ed@leemhuis.info>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <d5acb485-7377-4139-826d-4df04d21b5ed@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/24 6:06 PM, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi, Thorsten here, the Linux kernel's regression tracker.
> 
> Jarkko, I noticed a report about a regression in bugzilla.kernel.org
> that appears to be related to i2c_designware (at least it looks like
> that to my untrained eyes). As many (most?) kernel developers don't keep
> an eye on the bug tracker, I decided to write this mail. To quote from
> https://bugzilla.kernel.org/show_bug.cgi?id=219440 :

Thanks, I replied to the bug what could be tried before going into full 
bisecting changes between v6.9 and v6.10.

