Return-Path: <linux-i2c+bounces-14295-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE018C8B726
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 19:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 57269345AF9
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 18:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A0A313536;
	Wed, 26 Nov 2025 18:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsUSDprM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A763727B34F;
	Wed, 26 Nov 2025 18:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181767; cv=none; b=Y6sDx8jNRNLuY/dwPw4Id0o41m2Qu+hzx9oKd4+HAFmAt9uSFl7M78QLIiYzkuYBhr1K2w60Go6BXooAZqt0pKfF+7AkfN87R+1GFQLPGB0k+857KsbdbD3GoIzTVSUJZ9FGt/NPR9Kb35ehi+LiNb4Gam9XnYZtREAAhd1HBX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181767; c=relaxed/simple;
	bh=KDVRjuVOWCsoTHN5KvqPnItMtJWQNi/jShgByr/4idY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXdskDeSg56K+cVyZx8wQ2TNpqrGNz1NXWjJT3DDcUBiq+XHGZshwK1czAO3pD742o00eJGKEqweV8lBx6AUdkWRRp2D4PBfJem0G0eR9AGrldk3ojrl5wg9t0PgdGfZ6aQRgJNpKnqGu8BC4AA+0E7QWiFC4UOidKZVGRyaIN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsUSDprM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764181765; x=1795717765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KDVRjuVOWCsoTHN5KvqPnItMtJWQNi/jShgByr/4idY=;
  b=JsUSDprM1Cf5kLdiOe4a7R9ziI4JxQ9sW59tCuGvf4ZglE/Gxuy8u6nk
   0gXM4V3wIIUhsiyeKMIvy5TNGHK9CY1HiidFis2hpl0j6oyAq7aIkVomz
   JqVROgBzzQxmDQr6UwfhBCPxTQzrXVNlglEevwnf2bTWnmzoWR6g5xRpH
   IXNIXRKfrubFegvK7V4a3iJSJS3Gg+B9n4vFKOWcFnseHMTlpTkqoEtmq
   sck2yozLKQQSZtKdEFGKH5o86/bH6rl6BjZXBxIRBi00fSQGipSBDGLrI
   hIWGHsfZ1tG9/Ni2R1nb6UdxdkMTUXUZo6r02aK/eLMSWdsw+5sQ/wSgB
   Q==;
X-CSE-ConnectionGUID: Iajphja5SOCuUeWaPiDZ7g==
X-CSE-MsgGUID: ToXSv59AR7uDOwAvam5FuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77701249"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="77701249"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:29:24 -0800
X-CSE-ConnectionGUID: 8bWqXI8tR6CeO6QrSUXvuw==
X-CSE-MsgGUID: 2PycYv98SMSkzEtIknmAww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="216363911"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:29:21 -0800
Date: Wed, 26 Nov 2025 20:29:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Danny Kaehn <danny.kaehn@plexus.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Ethan Twardy <ethan.twardy@plexus.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Leo Huang <leohu@nvidia.com>,
	Arun D Patil <arundp@nvidia.com>, Willie Thai <wthai@nvidia.com>,
	Ting-Kai Chen <tingkaic@nvidia.com>
Subject: Re: [PATCH v12 0/3] Firmware Support for USB-HID Devices and CP2112
Message-ID: <aSdG_mXJXgsQ5VUG@smile.fi.intel.com>
References: <20251126-cp2112-dt-v12-0-2cdba6481db3@plexus.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-cp2112-dt-v12-0-2cdba6481db3@plexus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 11:05:23AM -0600, Danny Kaehn wrote:
> This patchset allows USB-HID devices to have Firmware bindings through sharing
> the USB fwnode with the HID driver, and adds such a binding and driver
> implementation for the CP2112 USB to SMBus Bridge (which necessitated the
> USB-HID change). This change allows a CP2112 permanently attached in hardware to
> be described in DT and ACPI and interoperate with other drivers.
> 
> Changes in v12:
> - dt-binding changes:
>   - Drop "on the host controller" from top-level description based on
>       comment from Rob H.
>   - Correct "Properties must precede subnodes" dt_binding_check error by
>       moving gpio_chip-related properties above the i2c subnode in the
>       binding and in the example.
>   - Include `interrupt-controller` property in the example
> - Modify hid-cp2112.c to support separate schemas for DT vs. ACPI - DT
>   combines gpio subnode with the CP2112's node, but will have an I2C
>   subnode; while ACPI will maintain separate child nodes for the GPIO
>   I2C devices

Thanks for pursuing this! I have a few comments, but in general I'm fine with
the design.

-- 
With Best Regards,
Andy Shevchenko



