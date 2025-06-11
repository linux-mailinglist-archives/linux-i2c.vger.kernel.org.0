Return-Path: <linux-i2c+bounces-11356-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD4DAD4E9D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 10:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48FEB3A85E3
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 08:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6398E2459F7;
	Wed, 11 Jun 2025 08:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWBzvIIf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B7023ED69;
	Wed, 11 Jun 2025 08:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749631066; cv=none; b=NM2ApETvMm328mUFBrhf/5WJxDsvEnY+k1AMEtnCqmm15lCAu2xIDHbvBtMK7ks/3l4rYJYn9ni4VWRZKj2W1AOx0D4PZaVPjOOutPH5I/ttmRUzmriPUoUQHMzAYrslcqMP1JHGzHZfQkGethy+Zx5jpi2tCZecZH1YTKaQlrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749631066; c=relaxed/simple;
	bh=dchvZ9Q+pyoa/JIkFMWnMjwIICKheJaebEAlKae+ubg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YDeKcDci/+esCGi5WgR1WTXBr6po9KPN2aS0FF6O+vMl9Rb+x23z0DcjT3iy9NI1fin8q6Gr7PRTF35346tXs4XgcFZYsMqWwkVWURmtzZQw9fUdEs22Pc3z6PAcV5ji1P0i8EgnAnOjT0mzyhb0HGpeOAogvA5jjC7/SqXGszk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWBzvIIf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749631065; x=1781167065;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dchvZ9Q+pyoa/JIkFMWnMjwIICKheJaebEAlKae+ubg=;
  b=EWBzvIIf0Ul3aiN0WZXH6iMjHYp3KcL+vbFlg0Qhg2YZC4VTxrNoeii4
   l1dfRA0RPfnUA8W1g1Bm9gRIjlGKtHvp+XYS8xhqxArw48DPNe4QjXBhi
   Ot99/zYRhWo3p/NTZxXp9mIhQs76DHVnTsmTL40Z3waz2zR0BQ2rqGxFf
   YHrjpFO4sHaEfpO0yUQXCgg6fWBB6COPpNBdqwsH3SU4GGJnKa1cJygn7
   jzAC7ps4eZyKKe2u55acxTpEzD6iqz57WDg7uAgmXs5enlD2o7dPnmsGT
   DZ0JTuZC1TMOhQO5fLa7gWdHXE1qA3X5Qd+kGe8fS1j7QvrNqXwtvDDQ5
   w==;
X-CSE-ConnectionGUID: JWABiwyHRuak1BcuGKJDvw==
X-CSE-MsgGUID: ZzJ5sIzGTzaXWHH3+bep9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="50873310"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="50873310"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:37:44 -0700
X-CSE-ConnectionGUID: IAhwMbZHRjaJoaIUwEfOZw==
X-CSE-MsgGUID: jOCMjPSwR2qXKvf28beKbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="170296310"
Received: from mylly.fi.intel.com (HELO [10.237.72.50]) ([10.237.72.50])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jun 2025 01:37:40 -0700
Message-ID: <2b0575b8-ff9f-44e7-8ad3-71e02c724c41@linux.intel.com>
Date: Wed, 11 Jun 2025 11:37:39 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] i2c: designware: Add quirk for Intel Xe
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Raag Jadav <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250610100311.2245871-1-heikki.krogerus@linux.intel.com>
 <20250610100311.2245871-2-heikki.krogerus@linux.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250610100311.2245871-2-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/25 1:03 PM, Heikki Krogerus wrote:
> The regmap is coming from the parent also in case of Xe
> GPUs. Reusing the Wangxun quirk for that.
> 
> Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

