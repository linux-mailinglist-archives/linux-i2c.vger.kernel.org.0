Return-Path: <linux-i2c+bounces-9038-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF77A0AF79
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 07:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F475166190
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 06:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41240230D23;
	Mon, 13 Jan 2025 06:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFzyewL4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530071BEF98;
	Mon, 13 Jan 2025 06:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736750993; cv=none; b=Cliubo70Jmor17spIfiW0XzzDGfNO7ONDtt9ExzTLW596yBULIcEoMazhX23imeBzloNuLK2z8nvODtLCErAEBwWWIMek0sXYv6tVvfJq7wMa4Q+YTCaS9v5KnqkqRuJgZnO3gQjQjt1t0Xj0/sghH2Y3yFeD8ghqconq90bNfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736750993; c=relaxed/simple;
	bh=F+SfMDM2VOZL+bJiOkc8NnMfKOu7aPT59ixU8wv7xW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KyE+sw1+T+fXKyqPxkgjQCQJGqEzbDUzU5bVAHZCVeOfqcuYT+qi8fUsMdQXThxGi353IgWWXebLIYDcJTKsrZ0v+nisAp/AfUMNynUJoexkDs/pZopdxGcE+4gB469Awhc2lrQSyP7BCGGqRBeEeRlZVN2q/M5oYoV/WF5Bs7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFzyewL4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736750991; x=1768286991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F+SfMDM2VOZL+bJiOkc8NnMfKOu7aPT59ixU8wv7xW4=;
  b=mFzyewL4AAo2ShH3l+ReF+WZhUV0KohMUciQP796F8or4j+qIcuP3Wm/
   v28jmrkSwcCPJ5QS+Wdi1RBrAKoh3FhV8SoZW78CXL0G9LZAbOtRzdVdz
   L6bzb59nS5lt3d1jcDUdGB9g8cLES9+isKHmz19GGSESM+WVcT1WdETeE
   YPfdCOiZw130ZD+RG8FvjdFQwu+kWUGoiZIs1nlsZcyBoDcGI5ombstJG
   PqiYhzxEeDRfTXYr4d4kwLVqI1Ca6Os9ZrXlgj21f42+9eI7qz1QmRv/v
   CShVYK4YBXyFMtO80wGCiwceSHPvCzc6lXEtXyDFOYM1CEperlIDYZpcP
   A==;
X-CSE-ConnectionGUID: AbBepTLvQB6I8JsnsGCHqA==
X-CSE-MsgGUID: T2UXXDK5Q+ehw8wLdheOQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="54540419"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="54540419"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 22:49:50 -0800
X-CSE-ConnectionGUID: j/LJdbITTnyaszCn04a3+Q==
X-CSE-MsgGUID: ITW66524RgOi9cuop3oU4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="109414535"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 12 Jan 2025 22:49:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 71D45329; Mon, 13 Jan 2025 08:49:47 +0200 (EET)
Date: Mon, 13 Jan 2025 08:49:47 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: R Ha <rha051117@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH 1/1] Force ELAN06FA touchpad I2C bus freq to 100KHz
Message-ID: <20250113064947.GK3713119@black.fi.intel.com>
References: <20250107072746.GW3713119@black.fi.intel.com>
 <CACHtJB-4UGaqKw5zZjE_vPeYX+bMUMiHPNfNYzD6Wmv6jdAuhg@mail.gmail.com>
 <20250108055150.GY3713119@black.fi.intel.com>
 <CACHtJB-33Pgoj0xORt75G0=cyoKem_K=Dfeg0iQNow18v2sV6Q@mail.gmail.com>
 <20250109111910.GD3713119@black.fi.intel.com>
 <CACHtJB9XeGBhg9de3Y0DkHKBUD-i=rKi2bEi93tv3jjz+LZ=_g@mail.gmail.com>
 <20250110112623.GF3713119@black.fi.intel.com>
 <0151b609-98d9-402a-b553-c9af5b0eb51f@linux.intel.com>
 <20250110120740.GH3713119@black.fi.intel.com>
 <CACHtJB-mXYAkmPLT1bV-wZR-3SGfS8R8Wo3i2qUio8a7AmcZtw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACHtJB-mXYAkmPLT1bV-wZR-3SGfS8R8Wo3i2qUio8a7AmcZtw@mail.gmail.com>

On Sat, Jan 11, 2025 at 10:05:23AM -0600, R Ha wrote:
> Hi,
> 
> I updated the description, please let me know if it's covered everything.

Thanks, I commented few things there.

> Just as a question, because the touchpad works well at both 100KHz and
> 1000KHz, is it better to force it to 100KHz or 1000KHz? I was
> considering that the Microsoft docs [1] specified that the frequency
> should be "no less than 400KHz", but didn't change it for now because
> the touchpad feels the same at 100KHz and 1000KHz, including for
> gestures.
> 
> Is it possible that there will be any sort of compatibility issues if
> the speed is set to 1000KHz? From what I can tell, the only other
> device on I2C1 is the "Intel Smart Sound" related device, but I'm not
> exactly sure what that does or whether it will work at 1000KHz. The
> sound output itself seems to be unaffected regardless of the
> frequency, though I don't think the other device is directly related
> to sound output.

I would say 100kHz is safer, all the devices should support it even the
older ones.

