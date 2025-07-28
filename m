Return-Path: <linux-i2c+bounces-12057-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAE0B13BAD
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 15:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA2A43AB54E
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 13:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BD92673A9;
	Mon, 28 Jul 2025 13:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0ls/Ewe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16A443147;
	Mon, 28 Jul 2025 13:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753710243; cv=none; b=sD29+By9u+cUJIZU0eAMVjqjcdUVP6/O1pXFIm8B/PD9NQoSt9T1SxF20bbm4Ds7R6VzpX2J1tX60UW2Xw24XyRShjyyhbtlwKiIpXJnNLLWOQpNH3DEWvg5Qe/HYC3i2rhUC31adNGnDPp80KtzT57MQ4M0t5fMoDMAWW8/31Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753710243; c=relaxed/simple;
	bh=ko433oKiOG3orI4RJzsW6QFrWitC6rlwiuhR3Y+yuQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r/8aAnWFKHv8ta4i3bZ1t9sBXot7v3incqKm5aY6XeOmxZe/G0b5hqfkKRVtGhgZigGaTT1o0WDqzum3qNnqF/ygyUadUMxFQmKy/THWIKuyEM+frwbMl8ZkVjlSNwvlQSYdY8GX/fKppjLtpAnHAvLinzprbSjFPRDb+UzWwXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0ls/Ewe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753710242; x=1785246242;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ko433oKiOG3orI4RJzsW6QFrWitC6rlwiuhR3Y+yuQA=;
  b=J0ls/EweGr7qkYSzxqW0OUXQHsanVCG0+TPvjIx8pQmgfbuAnXXzvJHQ
   Vs7qLmUbzglchpmuwc05bbE3hSir3TxEcJ8iBqjFgnU/Gs9hDpICtC8aW
   X/gDVGNahIOgiWtaX9GNW5xH1m0spWU70s4hJThyR53NAE9w8KkrHj6fM
   33J2jgtv8zyJfCd015f2fVBrxiI00XWx4FtV2NXTEDM1gyBKLlOsu2Zmt
   xVpTYB4BJHlWyQVeJqc4p9KzsPe5s8FTsqcrVHQuFxPXdiD4QCGWdcb+8
   23DjEFFyivBL2qC2F8qCt8vWHEZdtsrRteONoHCg4KkkSk8FGlp9OisWz
   g==;
X-CSE-ConnectionGUID: MXjU5n8GQGinCVHf60CYLA==
X-CSE-MsgGUID: xoog7OqQSYqonGpVJ67n0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="73406946"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="73406946"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 06:44:01 -0700
X-CSE-ConnectionGUID: TxeFoJi3THKVV/e07Qqw+w==
X-CSE-MsgGUID: 6bFqkgsSQVKw2o2h9g/jVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162287170"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jul 2025 06:43:56 -0700
Message-ID: <f6437802-ab77-45f3-beb3-c5db54d6d8f1@linux.intel.com>
Date: Mon, 28 Jul 2025 16:43:55 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] i2c: designware: Use polling by default when there
 is no irq resource
To: Raag Jadav <raag.jadav@intel.com>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, andriy.shevchenko@linux.intel.com,
 mika.westerberg@linux.intel.com, jsd@semihalf.com, andi.shyti@kernel.org,
 riana.tauro@intel.com, srinivasa.adatrao@intel.com,
 michael.j.ruhl@intel.com, intel-xe@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20250710071612.2714990-1-raag.jadav@intel.com>
 <20250710071612.2714990-2-raag.jadav@intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250710071612.2714990-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/25 10:16 AM, Raag Jadav wrote:
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> The irq resource itself can be used as a generic way to
> determine when polling is needed.
> 
> This not only removes the need for special additional device
> properties that would soon be needed when the platform may
> or may not have the irq, but it also removes the need to
> check the platform in the first place in order to determine
> is polling needed or not.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

