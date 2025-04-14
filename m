Return-Path: <linux-i2c+bounces-10322-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B0CA87BB5
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 11:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F4431890B90
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 09:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE8125DD0A;
	Mon, 14 Apr 2025 09:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPZkbeot"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994C925A32D;
	Mon, 14 Apr 2025 09:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744622300; cv=none; b=q2iSVmiQCuYie7dWNrhyGnH/axGDRBYq4txsWUb4WBGmyDUcKm8H0fWoSbo2j/DVk0dKUIjOqh1HQOnNEEkwPrlHAq/uk1vRq+z07o+XutiHnl9UkCAeGv2e7MdMSAYCJAAuigZoXJQa/0Fvs8L59cB2Y6aWlyQ8ewd1XUk46iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744622300; c=relaxed/simple;
	bh=fAfxQ7neerrkR8wtvm27+Sa/MDTWyx2YedQV1KZdIus=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eO5a++I8Jp1V73+x5YsMnn6jwSDTc53LCfMTaQddvAKDOefncMQh8ENmv65Pixq6clE52mohAaBQC0EudO/F3+y9ByFVsprwlECwI8mk9+/NwfPfM7YKidI0+fsplw1x+MB5PNQLn+N6B4SOtEPEL6OrMwfc5gSgoL/8bwccP5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RPZkbeot; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744622299; x=1776158299;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=fAfxQ7neerrkR8wtvm27+Sa/MDTWyx2YedQV1KZdIus=;
  b=RPZkbeot6KKJDLYG2agNl5ZCXc51wBIMerUjcxTTgUW3A/LGOSieDgjj
   6PK56qI3jhtj4/4mo6KWKw49A7WW6JVI4dJUYKbdQStDeqcu2insZGtVE
   d9snQyXm2l0ecBvIqBNhmuBfeZ4Hc+s6a+W1hy01vLxdynBzL+DnEMD6w
   4Rz1o0T3CNxfRRwtQA3jOTV6jmaBRNoerVbHKaMkIi/+eX3ecb4j53frA
   lVdBWRrD8ots+Tltim0eTAsbhmK/lSrqOhUL6Rrv5TKvyhN7DNxQcV89f
   w3f1g/ncxJrfpvS31W8uJxZauSzAXV6K5KrrXS/3AUnyk00wexe9TRPrl
   w==;
X-CSE-ConnectionGUID: +xEdLG6SRxG7S953jCADvg==
X-CSE-MsgGUID: GPyztwjwSqu/OZsvwEpYLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="57467553"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="57467553"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 02:18:16 -0700
X-CSE-ConnectionGUID: 95He4C30SJ2Bb5h1tKHQWw==
X-CSE-MsgGUID: PEHi9di4TiemMhPqoRzs/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="160720109"
Received: from mylly.fi.intel.com (HELO [10.237.72.50]) ([10.237.72.50])
  by orviesa002.jf.intel.com with ESMTP; 14 Apr 2025 02:18:13 -0700
Message-ID: <22275459-94ec-4336-af2f-5d3700935725@linux.intel.com>
Date: Mon, 14 Apr 2025 12:18:11 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,1/1] i2c: designware: Add SMBus Quick Command support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 ende.tan@starfivetech.com, linux-i2c@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
 jsd@semihalf.com, andi.shyti@kernel.org, linux-kernel@vger.kernel.org,
 leyfoon.tan@starfivetech.com, endeneer@gmail.com
References: <20250412093414.39351-1-ende.tan@starfivetech.com>
 <Z_zPIoqbC3cdITBh@shikoro>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Z_zPIoqbC3cdITBh@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/25 12:02 PM, Wolfram Sang wrote:
> 
>> +#define DW_IC_TAR_SMBUS_QUICK_CMD		BIT(16)
> 
> This bit does not exist on the instance in the Renesas RZ/N1D SoC. So,
> this patch needs some versioning which HW can do this and which can't.
> 
Yes, SMBUS features are only available starting from IP version 2.00a.

