Return-Path: <linux-i2c+bounces-1585-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B050384567D
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 12:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E955B260B3
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 11:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230D615DBB9;
	Thu,  1 Feb 2024 11:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7zao+PB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E32215DBB2;
	Thu,  1 Feb 2024 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706788185; cv=none; b=czieD1Zkl8DQ9jaENQMJ27DSfmZo1/dxI1anA1FRNtM9R5IRT0SCMgtLy+w4SB/EgNND/y++ryLk7GAiwAtZ4+TIJlXvuRmA7fUMbz5xC1KTDcWxudfCFCkSwUJtNacvkOMj7Zylc7K/XDE0/A4As37CGohci/z5bg2rBYgEwzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706788185; c=relaxed/simple;
	bh=1aBxnkA5NThADaPpxwMfZo76NBdICITNJ4pJtD/qDRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDfJH+QvdqsZ7lwWB6eKto1lkP4lrw0CePYPK90XzCbXOjnwTTGwaj3ka9SimRpCdX449egIHDV2Ut292MuHOY0BtPWl8S8wOe/j5wwp8jMG55pX2hDaEkrrBmGlV13Ccc85B6svsj/FFEXnejFQtWcXv/AylM0sJCLGDld3BVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7zao+PB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706788184; x=1738324184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1aBxnkA5NThADaPpxwMfZo76NBdICITNJ4pJtD/qDRU=;
  b=h7zao+PB543L+d/8PgkrkrsLnpeCX/3BovBEfW0x6xDVN9ogRg1Cf3Yt
   gKwE8NvPmGU95FAgxkWl+c6JcAo/fY2KLbDYpz+xCPRVHAMnFC0JEXSH5
   9+Y2W26IQgqv7ft5ipNEwhc/5vWousBqbT5OpoDHgQv0qvzjh92A+uqF6
   9pNdoxsVQaXuCzORynQn4srENtZFFRX0IM3V771Umx4yxjnp+QoA9Wyst
   TqA6wEyYkhzS6rBe0KCGREbSZ7djYBTvbfH1aBHbyM3qNaUM/JenV7K58
   hwPheJmHJ043jp/yRWQ99bqZfvf/Xu73wOs+/87kbugIr8CQ4vEGVC788
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3709691"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="3709691"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 03:49:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119923617"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="1119923617"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 03:49:41 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rVVX0-00000000p0W-3Ain;
	Thu, 01 Feb 2024 13:46:58 +0200
Date: Thu, 1 Feb 2024 13:46:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aahil Awatramani <aahila@google.com>
Cc: David Dillow <dillow@google.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: designware: allow fine tuning
 tuning waveform from device tree
Message-ID: <ZbuEsltcMLNn4SyF@smile.fi.intel.com>
References: <20240201044623.374389-1-aahila@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201044623.374389-1-aahila@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 01, 2024 at 04:46:22AM +0000, Aahil Awatramani wrote:
> The Synopsys i2c driver allows a user to override the parameters
> controlling the waveform using ACPI; this is useful for fine tuning when
> needed to make spec compliance. Extend this support to the device tree to
> allow non-ACPI platforms the same capabilities.

DT has different counters from which one should derive these ones.
Can you explain why existing bindings may _not_ be utilised?

Without this very justification, NAK.

-- 
With Best Regards,
Andy Shevchenko



