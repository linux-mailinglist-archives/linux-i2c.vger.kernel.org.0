Return-Path: <linux-i2c+bounces-12058-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CA0B13BB1
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 15:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09BC17A281D
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 13:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B77269B1C;
	Mon, 28 Jul 2025 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYC2HHAS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8FF43147;
	Mon, 28 Jul 2025 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753710248; cv=none; b=rBlWmXYPEuGSeKnOk32uuMw40Q1u8LGkGoicJ09IL1rpY4CCRMJgxQgX2ssvlmKlVTEt8doHfsW1sJOUChZD7hEexEVOz9C+6RHm5b0zPGhnO/ihhVFLxBOHiOQ49jD1jDog5nCACAjmtqulvy6rt+77yjudM8qpixUJ5N5aFDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753710248; c=relaxed/simple;
	bh=vhU6Iv0Rv7nRqtEWzVohQeE8avkJCIbvE1d3tlpGkMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZ1ymwOs2SdlkBTTHSpws/WgnF3L9PET0Abgk6GJtueq+b0hW2ZynGXsYWqJsJ0lZOUf8gzvIWdpaZsM5YPhe6PDZRgcC2r4chmoPJPmHGHZoIar30ernQVU6OO1cJAHpnI5JWiyqI4gIJOkbXhVzwU8YMxLQbfi+AuSIs/pPjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYC2HHAS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753710247; x=1785246247;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vhU6Iv0Rv7nRqtEWzVohQeE8avkJCIbvE1d3tlpGkMY=;
  b=QYC2HHAS93rjYrN+rXc9Of5FMoTt47f/WcjPhV6RAeZJYX6Aur9TFdaj
   JRC3jG+C+80zlBXConXZGddE4fE9DIz3PRgMwIDBr7/ZcHgd6zGeX2xs8
   bwsBt7Kp104qRPxGXFrrscfWM81OdO4a3eZc3KAb/7CsOIzJhAy8Kni5o
   RA8b4GMMlGDANlecGMQMD38fU5MtHTjIUiGCA4yGRzWvD7BWTtCJdoWpt
   1QRGeSMMwjNR90i1F/j9r8doL1x/vnM10uxzMoemEWL+qKTjnnnwKo6vc
   DEsvN0ZRo471799GLVPraA/k0+luNW9wNGk+YkQTrOEiKdrzTgShINgE3
   w==;
X-CSE-ConnectionGUID: hS/7FmtUTTKguQeLzXxPEw==
X-CSE-MsgGUID: 0oKUZK68QhqfZYunoDzRyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="73406954"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="73406954"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 06:44:07 -0700
X-CSE-ConnectionGUID: CqKRy9PFQ8SsKcar8eMuRQ==
X-CSE-MsgGUID: tECRCs99SoiCIvxaPB6J1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162287180"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jul 2025 06:44:02 -0700
Message-ID: <da0a2fac-20e7-494e-9ce7-5632e3bae532@linux.intel.com>
Date: Mon, 28 Jul 2025 16:44:02 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] i2c: designware: Add quirk for Intel Xe
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
 <20250710071612.2714990-3-raag.jadav@intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250710071612.2714990-3-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/25 10:16 AM, Raag Jadav wrote:
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> The regmap is coming from the parent also in case of Xe
> GPUs. Reusing the Wangxun quirk for that.
> 
> Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

