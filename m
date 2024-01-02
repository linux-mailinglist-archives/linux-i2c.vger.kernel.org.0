Return-Path: <linux-i2c+bounces-1075-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE28821CF4
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jan 2024 14:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FD7BB21E03
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jan 2024 13:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0115110958;
	Tue,  2 Jan 2024 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nwco2/gy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C5910940;
	Tue,  2 Jan 2024 13:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704202954; x=1735738954;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Jr7YmTDiLZWk/2Zs/oXAKicCT/PTbL1zJJ4Y1ag3Ud8=;
  b=Nwco2/gy5ACrKxy00HSjQrf2a8M4CW0a23dJ5aRmnNddeqro2INk71LO
   Hu5o6lv2UpxSkI/vaKKiBjcWDwmAeRVAJ0hU+xfnGJqRUOXJcqF2mWfn8
   s2NextVbX5krSF9r+qMHClNHp2XQRo30CJqlYijO9qnG2pKiBLJT29pFk
   BXjU/uYHHar2A3wubVGM+kAfcrRfiFgqBeCliTsvxlHV0/P7odXPvCWMM
   Y6sLq4yabDoyj4l7x+Cj8jXYm8lSvtDBW+HaIm12T5vDz3vxCHTJwWwS8
   m//hPcr1eYD8jDCuyyPBQbfG7SyYj5lDtZajx9BIoVv5Gj1kVYwtxfTjc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="4217818"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="4217818"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 05:42:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="870265559"
X-IronPort-AV: E=Sophos;i="6.04,325,1695711600"; 
   d="scan'208";a="870265559"
Received: from unknown (HELO [10.237.72.75]) ([10.237.72.75])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Jan 2024 05:42:30 -0800
Message-ID: <8169d773-f9ec-4092-b036-9e4fd59966c3@linux.intel.com>
Date: Tue, 2 Jan 2024 15:42:30 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c-designware: NULL ptr at RIP: 0010:regmap_read+0x12/0x70
To: Borislav Petkov <bp@alien8.de>, linux-i2c@vger.kernel.org
Cc: lkml <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, narasimhan.v@amd.com
References: <20231229120820.GCZY62tM7z4v2XmOAZ@fat_crate.local>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20231229120820.GCZY62tM7z4v2XmOAZ@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 12/29/23 14:08, Borislav Petkov wrote:
> Looking at the call stack, I see
> 
>    2409205acd3c ("i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low")
> 
> which does that dev->map deref in __i2c_dw_disable() but maybe ->map is
> invalid by then...?
> 
> Just a stab in the dark anyway...
> 
Do you run same tests on vanilla? I.e. do you see this on v6.7-rc8?

I'm curious to know is this already existing issue or regression because 
of recent cleanup patches in linux-next between v6.7-rc8.. 
drivers/i2c/busses/i2c-designware-*.

