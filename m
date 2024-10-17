Return-Path: <linux-i2c+bounces-7458-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F539A1F41
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 12:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F5881C266DC
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 10:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC071D8E0D;
	Thu, 17 Oct 2024 10:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9z1zxcR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8161CCB44;
	Thu, 17 Oct 2024 10:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729159243; cv=none; b=Inpj+nyTEdoENEBFD4ZdhtgwegSjA9BtWpx39KQUeA9wSL6DryxIZH5x6BX552e25JQXwucQS2+FadeK79LT1rm0GamtoGWbLSjjiYSuP17YIzCa3/kl5LGZks0dcinWaQExOzPxGKepqmHAUGVrqQt9UHFnLu8cHwwbI73D3uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729159243; c=relaxed/simple;
	bh=j6dtf+1nsGntL6BOPrfU67/30TxswPd84Ugr4PzJXJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAtwjLZSAsRGnPhSSoeDWQx6VJQ8SggWS0AUzf6xi8xFI5jeAZwxKrzk5RBE+lVy1yxPCh3ONwAJGYd64NbdcqVfP+RSsGBY32HHhbE4xX+6DylQ+wZTQNdU2Gjv98pmSC2nzoFTRPHSlIH0MlYTywLKGQs1hX3B2R319cduAag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9z1zxcR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729159240; x=1760695240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j6dtf+1nsGntL6BOPrfU67/30TxswPd84Ugr4PzJXJU=;
  b=M9z1zxcRY7dhIoPI2MlZ2ffFJpmZ/GGXyAuoqpE3taxzWprC6PEEmZtD
   BzCtZUlmk55RxGOr0hkKb47gwLa7C8b4CaYatdbNUrF9IvCyfsL7MNs+j
   gL5n3THdElHld/V2Z2lkymvmjxgF5hXcR88fRjJOyLL3+BcqmF+mMgtgT
   JrU28Ay9dJQowEbdYUbmwhgUNqxRgExdsb6Cuj0E8Fz2R8UCN7uQPXXpn
   UpYSBKmheywqX72ExY3dHf4PAenIu8bYufSy87coMsZFnBKQOcgc6DypN
   EhebX6Z0hzH2Z0LcDx3W0uJh3bhPc4m2SP2/2xbQNCSR7FuwvU0lBMfUi
   Q==;
X-CSE-ConnectionGUID: X22PaXytRlefobwfjkC/HA==
X-CSE-MsgGUID: 9eJN3cUQQQaRl6WnEbBE7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="28845177"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="28845177"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 03:00:39 -0700
X-CSE-ConnectionGUID: Vd/xbfNLREKHhrzvo/Ki8A==
X-CSE-MsgGUID: pH7o0+e9SXWfNTmMB00Ypw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="109247908"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 03:00:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t1NJ2-000000044ml-3TYc;
	Thu, 17 Oct 2024 13:00:32 +0300
Date: Thu, 17 Oct 2024 13:00:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v9 0/7] platform/chrome: Introduce DT hardware prober
Message-ID: <ZxDgQISmr_gn_aDF@smile.fi.intel.com>
References: <20241017094222.1014936-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017094222.1014936-1-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 17, 2024 at 05:34:35PM +0800, Chen-Yu Tsai wrote:

> For the I2C component (touchscreens and trackpads) case from the
> original series, the hardware prober driver finds the particular
> class of device in the device tree, gets its parent I2C adapter,
> and tries to initiate a simple I2C read for each device under that
> I2C bus. When it finds one that responds, it considers that one
> present, marks it as "okay", and returns, letting the driver core
> actually probe the device.
> 
> This works fine in most cases since these components are connected
> via a ribbon cable and always have the same resources. The prober
> will also grab these resources and enable them.
> 
> The other case, selecting a display panel to use based on the SKU ID
> from the firmware, hit a bit of an issue with fixing the OF graph.
> It has been left out since v3.
> 
> Patch 1 adds of_changeset_update_prop_string(), as requested by Rob.
> 
> Patch 2 adds for_each_child_of_node_with_prefix(), as suggested by Andy.

> Patch 3 implements probing the I2C bus for presence of components as
> a hookable helper function in the I2C core.
> 
> Patch 4 implements regulator supply support as a set of simple helpers
> for the I2C component prober.
> 
> Patch 5 implements GPIO support for the I2C component prober simple
> helpers.

Not that I am really a fan of the idea, but I have nothing to counter propose.
Also my big concern about random msleep() calls seems to be addressed in a way
that it's now a caller's problem to supply the (correct) one.

Hence FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
for patches 3,4, and 5.

> Patch 6 adds a ChromeOS specific DT hardware prober. This initial
> version targets the Hana Chromebooks, probing its I2C trackpads and
> touchscreens.
> 
> Patch 7 modifies the Hana device tree and marks the touchscreens
> and trackpads as "fail-needs-probe", ready for the driver to probe.

-- 
With Best Regards,
Andy Shevchenko



