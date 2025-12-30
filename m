Return-Path: <linux-i2c+bounces-14872-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FC3CE94B7
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 11:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF8713016340
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 10:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFC42D5416;
	Tue, 30 Dec 2025 10:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgZXuFrI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB17258EDB;
	Tue, 30 Dec 2025 10:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089043; cv=none; b=ZmkV1Zat/YGFoOKU2zyvj7L9MtIuRVuEAahiQBetAhW0FVrVvgSSnhob9uxCVQTuUtGcv3vRF5GGktTM8tkUIg0YCW27YRgNIVOBjFUxQGlkqsVy14+FahUSPg7LEZuM0inHFzIEAIbP+/ov1OPOkpwt9a8vyz6rIZyDg/cJXcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089043; c=relaxed/simple;
	bh=Dw98KYydtFcOnRTz+1GI6FVR+V86H5GWHD87McKl/ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=syAUkWhtR9QYOJeBe4KZqnR4YDy4jJGMf77ic0e2zWEFMJKQpeWL2D1oz0ghru8jHs7H5qaveHcWICc59Tt0rqSICCbBxYx8gPrStqLhY/XIj07C49tvl2Btc1rmM8C+LSDkdfEV0YuvQisWyaynhOBckA0ZAvqoI07ULFv5OxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgZXuFrI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767089041; x=1798625041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dw98KYydtFcOnRTz+1GI6FVR+V86H5GWHD87McKl/ZA=;
  b=cgZXuFrID0DRQmqAHA6eDNCy8fuilIC/3H9RM8iJNno/E+c6Hk+et2ir
   K5SSvAENR6jHmyToIxaDl9bRvqFDuIEwqVoOFh0VhOUu6Ie7IES5TY/NS
   0XvwHFEKgXZjMPctWqd1Vqls/MxjS2IoGUJpn4kPs1gMmE7fpz5EqlOhe
   2GoieVKt5wlLVoQJ7W8PR+aTniRGogVTx7MB06It2dq2h+chiwYKIiVj+
   gZrSqean0ygt4cJVuObtYdvlN19n2iB0HkHkF1M7io7KIZI5EZyvZiDNF
   ifhgFqbksJRdbxt/90tmDPut+KnUs1Lf9GgmMrT6zeN2S1j8ZPmaYhv3T
   Q==;
X-CSE-ConnectionGUID: GO01axw+S+mmr4RymcGa9A==
X-CSE-MsgGUID: RwBy01IBTTe9mRofCUMhsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="94146520"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="94146520"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:04:00 -0800
X-CSE-ConnectionGUID: eS+VTUhCRruLC0o+kAqlVA==
X-CSE-MsgGUID: gaFdeKloRNuD3rutc66C1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="200938042"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 02:03:58 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6FDE3121D81;
	Tue, 30 Dec 2025 12:04:05 +0200 (EET)
Date: Tue, 30 Dec 2025 12:04:05 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 7/7] i2c: usbio: use i2c_adapter_set_node()
Message-ID: <aVOjlQwF4-szWMiT@kekkonen.localdomain>
References: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
 <20251223-i2c-ada-dev-set-node-v1-7-2e36e0e785b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-i2c-ada-dev-set-node-v1-7-2e36e0e785b4@oss.qualcomm.com>

On Tue, Dec 23, 2025 at 11:06:54AM +0100, Bartosz Golaszewski wrote:
> Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
> This allows us to hide the dereferencing of the embedded struct device.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

