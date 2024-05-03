Return-Path: <linux-i2c+bounces-3383-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F8D8BA714
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 08:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F88A1F2238A
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 06:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D0513C83D;
	Fri,  3 May 2024 06:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1RheQyS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416A413C80E;
	Fri,  3 May 2024 06:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714717846; cv=none; b=T9RLIR0foADTLFKbcxsi+bBwxn5iKdsCFJbH2CNJVmqd1+xdoTWxY5B74h4DC1CpyvSLdtsWzX+ZwmSvdaBOftFPpAXBoibuBRnIT+Fv45zQp92ZxC+KGJJZvw448D85o4RBc63VgFkIX56dBtPoNsB1aGlU7FS4TC/1Igvp/1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714717846; c=relaxed/simple;
	bh=OGytbaGZ3Wgv/PEeqHKETkObg95MQZWxeyNdTqdfkb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qJ+X24gZjdPcfjofFz3DaIIA6oGT4VKgWf5N9CapHbATtG0+lU+tktFpxagWjpAJkCGiqVfCrqY+RzOSvP1X/XpqWzfhztx48JA2aAK4V94dWcElxVwfUhSKxvrgBq0iyIEe+HLh0uPqxwcfkuqWXpt2AWXNxvJBzZm8/ZLwzbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1RheQyS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714717845; x=1746253845;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OGytbaGZ3Wgv/PEeqHKETkObg95MQZWxeyNdTqdfkb4=;
  b=R1RheQySZ3KQg8Q3C+9ZS1dJ54AaSnRU5wu3a7mN1MVVm5YruTDmuUtj
   PQ5dKOa0aA4F9L6Jt6AYDXS942FkCaCByztx49UiWzTsj/+l7ZvvIlnKi
   uJi4O4nEz8GyOKaSxLWIiwL/knEZoCGrux1ypWe7bmyWAitoU9JGhY7J+
   DYdgMktIyc5YemRQSt4k1NKoxsTp0LOXLOzUJpeT56G5Udo9habafg9WD
   CP/kluPcIdiz600TaZh1Uf/phy7a91kJWTOekGbcyg5G91czhvVkuTKex
   sHXO7sYbzImsoYyQTqfswTsdZkXCNjWdbo5BP7T6GPz326FPA3Ex3HjM/
   Q==;
X-CSE-ConnectionGUID: HZqbkALYSSqIRpU//7yJ4A==
X-CSE-MsgGUID: 3gYepjL0SB6EF2ArWsKeRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="14335492"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="14335492"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 23:30:45 -0700
X-CSE-ConnectionGUID: y+pMYLqdR3uOOz17AYYqRQ==
X-CSE-MsgGUID: CdOzF9ZYT7eUkV465PA83Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="27340287"
Received: from ehlflashnuc2.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by fmviesa009.fm.intel.com with ESMTP; 02 May 2024 23:30:40 -0700
Message-ID: <ae872161-d725-4604-9d03-a36a426d0d1b@linux.intel.com>
Date: Fri, 3 May 2024 09:30:39 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v3 0/5] Define i2c_designware in a header file
To: Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Lee Jones <lee@kernel.org>,
 Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou
 <mengyuanlou@net-swift.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Andrew Lunn <andrew@lunn.ch>, Duanqiang Wen <duanqiangwen@net-swift.com>,
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org
References: <20240425214438.2100534-1-florian.fainelli@broadcom.com>
 <171469134545.1016503.10207141192762647093.b4-ty@kernel.org>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <171469134545.1016503.10207141192762647093.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andi

On 5/3/24 2:09 AM, Andi Shyti wrote:
> Applied to i2c/i2c-host on
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
> 
> Thank you,
> Andi
> 
> Patches applied
> ===============
> [1/5] i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
>        commit: 91647e64f0f5677ace84165dc25dc99579147b8f
> [2/5] i2c: designware: Create shared header hosting driver name
>        commit: 856cd5f13de7cebca44db5ff4bc2ca73490dd8d7
> 
Was the second patch applied accidentally?

