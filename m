Return-Path: <linux-i2c+bounces-1271-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EE482BC41
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jan 2024 09:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCB1C1C21E46
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jan 2024 08:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820D45D74B;
	Fri, 12 Jan 2024 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WcDIPfQt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A548C5B5C1
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jan 2024 08:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705047208; x=1736583208;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3q7iAJWz8c1xvGzEpfQaQfH3fgSvOqIYaD9mOIjx4J4=;
  b=WcDIPfQtM2QAjDgvsBMdx+lTpnKDNyHCJO3ksrioJVPlZMPIh/E4IL8q
   qAQ5Szg2wPRg7Ew5Z5uJYT9reoOhfkAwt/JB0uUNuVZNGVNTM2vNB4+Wl
   0W+kuwxkUJq6+V4W7ESZ1aGdxy8diqTnCuD6gUoA1ZE7vg00t4QOWACaH
   ZzexDm8TfS5ukDC/DJwA9O8tLBQKYnDtysJQlufyP+xgmRzsXeMYLDqHS
   ejunbvkrEEx7iWZNk6nMZVXmkoOInQYCR+UjIkxfqLaUG6XVSs3bqE4f9
   5IKMKNoMyMFORfL7Zv1/o1lbzyNf8Xp8PRGaqHyfKA7gNqyC+wYA1EOgT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="5842905"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; 
   d="scan'208";a="5842905"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 00:13:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="732511322"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; 
   d="scan'208";a="732511322"
Received: from unknown (HELO [10.237.72.158]) ([10.237.72.158])
  by orsmga003.jf.intel.com with ESMTP; 12 Jan 2024 00:13:24 -0800
Message-ID: <9bb96130-d662-4904-9e4b-6a823b51a990@linux.intel.com>
Date: Fri, 12 Jan 2024 10:13:23 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: designware: Revert recent changes to
 i2c_dw_probe_lock_support()
Content-Language: en-US
To: Kim Phillips <kim.phillips@amd.com>, linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Borislav Petkov <bp@alien8.de>, V Narasimhan <Narasimhan.V@amd.com>
References: <20240111125658.921083-1-jarkko.nikula@linux.intel.com>
 <f5493701-4cc7-42c2-b9bb-958744bd8626@amd.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <f5493701-4cc7-42c2-b9bb-958744bd8626@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

On 1/11/24 19:56, Kim Phillips wrote:
>> [    6.245173] i2c_designware AMDI0010:00: Unknown Synopsys component 
>> type: 0xffffffff

This has puzzled me all the time since I'm unable to see which one of 
Andy's patches could cause it. However controller is clearly powered 
down since DW_IC_COMP_TYPE register reads 0xffffffff.

That I'd call as a regression one. Second regression is the Oops and I 
was speculating if commit bd466a892612 ("i2c: designware: Fix PM calls 
order in dw_i2c_plat_probe()") can cause it.

> 
> Hold on, I'm testing this on top of next-20240111 and still seeing the 
> splat...
> 
Btw, does this reproduce always? Can we be mislead if it happens 
somewhat randomly? Happens to boot once we revert some commits and then 
at another Andy's nearby commit does not and we make the wrong conclusion?

Does bisecting between v6.7-rc1 and next-20240111 lead anywhere?


