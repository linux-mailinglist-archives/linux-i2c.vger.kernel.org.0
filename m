Return-Path: <linux-i2c+bounces-7839-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCAB9BE65A
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 12:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C0AA1C22FA2
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 11:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D783F1DEFE1;
	Wed,  6 Nov 2024 11:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWn/qJPG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A431DE8B2;
	Wed,  6 Nov 2024 11:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730894002; cv=none; b=ez9yuYlXvDxWbM0uVWSLk2ABBjd1+DptiGTI0l3LtlcJCzvWFoto+bdz9fRrfMNX1Wn/KqFdxLv21P1fD9zxnjZytlD8Jjlv/rT+iSnMEXSwc3EemegdEaAutfo/Lxewt87JVeiysV64ob2Ay59U7nSueMIBV691zhNykY7DXqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730894002; c=relaxed/simple;
	bh=PhQvnKePAoEA2kX1y16keIzj/ld0vsePlMe+JYHLDL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aU5DBLK6MqMPIvswl3Q8S1ve6jZ2smx4baunjw7a+okWcR+GTmM61mFuZwNXkmD+BcEqDO7rv9fa4Y1pyWKplNDb6034g+sic/JdV+tWX4+Ze5zIq4gLlyPM7oiOQo671rPdxb/eOyA3Ri3bEudDPJ0Q3xG60kiOCpg5UnvQKyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWn/qJPG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730894002; x=1762430002;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PhQvnKePAoEA2kX1y16keIzj/ld0vsePlMe+JYHLDL4=;
  b=LWn/qJPGAX6K+iQOYM7dZS81dC8RfeBb+4kEm5zU2as6IXQimOvL7eKY
   BmfoxJlIj7xFxve84BvNIV8fEiLY5aETIPD17BLKEfUpCkRPNpKLFwjty
   R4t0odX5M2vY9IB99twgdd13LFie5G5mWI3PGXxbeF/2Vyg8rEFlCaKZf
   mte1j55tPvtVEZoSTwCf4yA+QrWkYEiP7VwOOb2WfK/FV2V4LNnfQAmhs
   eHqrJn+xRvj9y6bRZLKZDRw7r/lUGRC+XUDcT06hdSYGUB4VZmAVbIAAj
   F1OWExNzPzunm8PWW6hYYpqXGwd4A+hhSugbBPfJqas4THYIJySqYTis7
   Q==;
X-CSE-ConnectionGUID: WgdiFrxjTcuJCoH6H2Jlzw==
X-CSE-MsgGUID: tetSONq8QdWsT/d6KjE5fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30800932"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="30800932"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 03:53:21 -0800
X-CSE-ConnectionGUID: AMFhg14FTReoSDMQUH5hQA==
X-CSE-MsgGUID: DuKM7Sh9SM6mYO/bsImZDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="88464152"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by fmviesa003.fm.intel.com with ESMTP; 06 Nov 2024 03:53:18 -0800
Message-ID: <bac8d1ea-ed0f-42db-a0f8-c36d7c571534@linux.intel.com>
Date: Wed, 6 Nov 2024 13:53:17 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND TO CC MAILLIST] i2c: designware: fix master holding
 SCL low when I2C_DYNAMIC_TAR_UPDATE not set
To: Liu Peibao <loven.liu@jaguarmicro.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, "xiaowu . ding"
 <xiaowu.ding@jaguarmicro.com>, Angus Chen <angus.chen@jaguarmicro.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241101081243.1230797-1-loven.liu@jaguarmicro.com>
 <ZySU7bEvct4_FbBX@smile.fi.intel.com>
 <3580ce2a-963b-4a50-98b5-52ecac43871c@jaguarmicro.com>
 <anhqlov5vdsicmopulnvbaerhctjaauwsvl6nlc3llsh4hi5sn@d3jmeqxnlhpl>
 <d2abc63a-884d-4d48-b652-56989e55d0cd@jaguarmicro.com>
 <lv7hm72ngmjohh3hd3tsiawh47pjcyq76iw3weboytfcywttmt@jjrcuwan74rw>
 <bfc14b55-35e1-479c-bd9b-d40d1ea88377@jaguarmicro.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <bfc14b55-35e1-479c-bd9b-d40d1ea88377@jaguarmicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/24 12:09 PM, Liu Peibao wrote:
> On 2024/11/6 17:46, Andi Shyti wrote:
>>> Fixes: 2409205acd3c ("i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low")
>>> Co-developed-by: xiaowu.ding <xiaowu.ding@jaguarmicro.com>
>>> Signed-off-by: xiaowu.ding <xiaowu.ding@jaguarmicro.com>
>>> Co-developed-by: Angus Chen <angus.chen@jaguarmicro.com>
>>> Signed-off-by: Angus Chen <angus.chen@jaguarmicro.com>
>>> Signed-off-by: Liu Peibao <loven.liu@jaguarmicro.com>
>>
>> Thanks, this make much more sense now.
>>
>> Just one question, do we want to keep xiaowu.ding or Xiaowu Ding?
>> Can I change it to the second way? It looks better and that's how
>> it's normally signed.
>>
> 
> I have confirmed with Xiaowu, and that is surely okay.
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

