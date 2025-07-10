Return-Path: <linux-i2c+bounces-11899-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6914B0045B
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 15:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6ACD166F72
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 13:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F336B274FCF;
	Thu, 10 Jul 2025 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpbWVXuv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AE9273818;
	Thu, 10 Jul 2025 13:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752155438; cv=none; b=Am1Tlzb2nUzUdcjtIY/YCMVUqIni8eO5JDeqCAFS+KTxIXi+4UJ536RpT5AiQhzMnOAiyil23gHh2F7D26mz+lx/NoD7xbu31w7rQocFFZ73qy53fq0ytt5ct/gTLA6RdxHM95nOFV70EeF9uK8I7NMG3bvBEACVJ6/5fWhqnmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752155438; c=relaxed/simple;
	bh=ANlr4f7MhcvwUGq2qX5qBV4V8WNCS+25Kvi2HKxpi+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmW6DNek9SvWhhA9Yk27D12ig8Kbo4ugMr30N3b1Sm+NzI8IV2xnG9JNsU/JsQv695iud+rhgzuE297p0OjJeGb2ToL7JLljUk4SUIA4LY52efN69GAXVbzv39tuJSEPG48ddNETmcBRcE0MbLYObC7eDgsTOfLtlKj5K2yB7OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EpbWVXuv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752155437; x=1783691437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ANlr4f7MhcvwUGq2qX5qBV4V8WNCS+25Kvi2HKxpi+E=;
  b=EpbWVXuvv5kmOuR7bTYJcab7QR5k0CHlmn9K2PpYwpTOS0IceWxMQoLa
   wThz3miqlInrIpjjjkh4SMkhoml28FEx5reZ3PX4afoT+s+kTNruSR73i
   h8r3SCOy1iZalfjt8X9yOhF4iGguvXDC5YF3ZdI/zQ/caCp8FaeTumt3P
   Pr6iG+AjhvCvAoBxBFZV9ZsGFkBBI4Bf0al353K7+E5YLhtk4GLbISrd+
   W/n6XehsdzNbtRk9GNMf7F7LUxo/QSQNUjiKy/irIKTKO89WiUXAUewkQ
   pe70MV33GpN4UGQKIxwKENUi8nBE3jxjbK0qDfwcK36sFJu4oL/9onk02
   g==;
X-CSE-ConnectionGUID: /sLK26ODSJmhg2ao+P4VhA==
X-CSE-MsgGUID: qOUn3mreSbCbMzrI7hiHsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="57047729"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="57047729"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 06:50:35 -0700
X-CSE-ConnectionGUID: poiHcfsNR+Cg5OoYyeuqTA==
X-CSE-MsgGUID: NzbfU1NWQb+SMu7QPKRPOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="156195719"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 06:50:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uZrfR-0000000EDVQ-2JI9;
	Thu, 10 Jul 2025 16:50:29 +0300
Date: Thu, 10 Jul 2025 16:50:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
	ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	p.zabel@pengutronix.de, thierry.reding@gmail.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v6 1/3] i2c: tegra: Fix reset error handling with ACPI
Message-ID: <aG_FJZQjNbV-OnGc@smile.fi.intel.com>
References: <20250710131206.2316-1-akhilrajeev@nvidia.com>
 <20250710131206.2316-2-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710131206.2316-2-akhilrajeev@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 10, 2025 at 06:42:04PM +0530, Akhil R wrote:
> The acpi_evaluate_object() returns an ACPI error code and not
> Linux one. For the some platforms the err will have positive code
> which may be interpreted incorrectly. Use device_reset for reset

device_reset()

> control which handles it correctly.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



