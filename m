Return-Path: <linux-i2c+bounces-1331-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D3282EAB9
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 09:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1DB4B22565
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 08:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7849511713;
	Tue, 16 Jan 2024 08:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4AbxJ6k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D55111BE
	for <linux-i2c@vger.kernel.org>; Tue, 16 Jan 2024 08:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705392930; x=1736928930;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=e9YbhuA296OITph7d/3ff0u8oHV/mANIphFHzWxR3q0=;
  b=E4AbxJ6kkc/1M5qjLJb3vvyqmnysWuJeVpQzCPgwRzmu8fUgN2nUkWb1
   JBwevea9HMI+PUFXt31fXCNtwfp20ewd7XR8EC59cBDitLjWGpq47pdmX
   KJbOVIGkB45tZUa/O46d4Xvy5MNZ74hm2gxIdHTRsy5UXYyXOae08qmgX
   wiZXW1Qy/dmpuz2FwcgNVo4l8HTIsRugJyID/mlj2o84yUN/VT9pg9jjl
   S2+/oa5yxY9TyonoMok4lWtFYgMS8nLo2HfFtcRn4Jt1OuWUnDvxBZEDh
   dx5BT8CoOQT+6jR4+lp4MuVFPstqb40lIZGLkNGXx5gLyxcc0t8d7IgGs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="18387498"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="18387498"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 00:15:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="733529450"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="733529450"
Received: from unknown (HELO [10.237.72.158]) ([10.237.72.158])
  by orsmga003.jf.intel.com with ESMTP; 16 Jan 2024 00:15:26 -0800
Message-ID: <f4b3cc62-8620-4810-97f7-bcc39220b12e@linux.intel.com>
Date: Tue, 16 Jan 2024 10:15:25 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: designware: Revert recent changes to
 i2c_dw_probe_lock_support()
To: Kim Phillips <kim.phillips@amd.com>, linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Borislav Petkov <bp@alien8.de>, V Narasimhan <Narasimhan.V@amd.com>
References: <20240111125658.921083-1-jarkko.nikula@linux.intel.com>
 <f5493701-4cc7-42c2-b9bb-958744bd8626@amd.com>
 <9bb96130-d662-4904-9e4b-6a823b51a990@linux.intel.com>
 <614a9b32-d6e9-4506-a7a0-164954badffe@amd.com>
 <00f98ff9-ce2f-4edd-b4e4-a17e1a0170cd@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <00f98ff9-ce2f-4edd-b4e4-a17e1a0170cd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/16/24 00:44, Kim Phillips wrote:
> On 1/15/24 3:16 PM, Kim Phillips wrote:
>> On 1/12/24 2:13 AM, Jarkko Nikula wrote:
>>> On 1/11/24 19:56, Kim Phillips wrote:
>>>>> [    6.245173] i2c_designware AMDI0010:00: Unknown Synopsys 
>>>>> component type: 0xffffffff
>>>
>>> This has puzzled me all the time since I'm unable to see which one of 
>>> Andy's patches could cause it. However controller is clearly powered 
>>> down since DW_IC_COMP_TYPE register reads 0xffffffff.
> 
> Just FYI, that message is apparently 'normal' as, e.g., a stable v6.4
> based tree emits it, but it doesn't crash because of it:
> 
Ah, makes sense. I understood from Narasimhan's earlier mail vanilla 
doesn't show it and that made me confused.

> So I just tested checking out bd466a892612, and indeed it produces
> the stacktrace.  Prior to that commit is v6.7-rc3, which boots fine.
> So right now I'm suspecting bd466a892612 is to blame for the stacktrace.
> 
This also makes most sense to me and was my first guess. I let Andy to 
look at more deeply does my speculation about runtime PM being active in 
parallel with post probe code since before his commit driver disabled 
the runtime PM before returning from probe.

Now if after that commit oops doesn't occur always it will easily 
misguide in bisecting and can lead to random results. Those are very 
hard to track sometimes. Good that you found this issue very immediately 
when code went to linux-next!

