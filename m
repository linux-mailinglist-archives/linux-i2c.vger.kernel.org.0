Return-Path: <linux-i2c+bounces-14303-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8855C8D259
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 08:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8735D3AF309
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 07:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55F131DDA4;
	Thu, 27 Nov 2025 07:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7R/K4sc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332DD31C58A;
	Thu, 27 Nov 2025 07:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764229400; cv=none; b=EjQ7u3is/VAi48BwVUl4SRV3cW+zXtEOWI9b5owgbdGPUvVHhiv6uXNXMS4q/DzvIDua5XJQ/Nr9AOL9IOl0Z+Yv/RZNmDhPF6kXDQuaD57uLYmdDhcaTDXtAx/pmu94vkoZfPa0gdkzMC5wbis+P8bNmO0gjvSKUTPcoQe/HJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764229400; c=relaxed/simple;
	bh=IgSnVci3DoQXYjVvI5E+txl5IZvhgQkySPJ6PPebZwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7U9NHsiYktAby2HHRnLLq6UYacP0JoxkoRE50FbChz0koQ1JujilTVWqTJcQiYmukHFFYqpau4plJjJmtkUTEAOne9G6rD7YaOiLewNVy3BO4S31ewU6SbGKR9mCvs7434twUaH3q7sM2DlgWNoLCtmb91OreT1GH5OtBfOyLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P7R/K4sc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764229398; x=1795765398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IgSnVci3DoQXYjVvI5E+txl5IZvhgQkySPJ6PPebZwM=;
  b=P7R/K4scGQRkY0jJHEyJQPrCgQkRcDTBpzNnbnjx4WPJFfN36mF7F8tz
   qgRwcODy5hWttr6/Mcretia/1iWafevHMx72mGiCRiIWKJ8QN1I4quQ1j
   IxXAhpW97uc7gREvbwV6gJ4ltCekKzTpeUHI15UEq3d8697K5e/NDuqRW
   0aGI7IlryJ/nu5k2E6KT2DNZ6to6EJAItOzRs3FI+mvQOjIrY1EWXr6Xt
   zJnYLqJx1jof8ioL5QbLBO6GA6BAgqQ6OCKy+ne9gOvhtb4zE3SCnp0Re
   nR3oRkh0RxqQpR2ADPcHk9vMqlAgttx58ZOJ/lf7QCCWoIeCmSZI+k2TW
   Q==;
X-CSE-ConnectionGUID: dzqTVSPiS9SMbByL6dc4Lw==
X-CSE-MsgGUID: JdxrF2ZYSpuiur3f/LJk2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="68864879"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="68864879"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 23:43:17 -0800
X-CSE-ConnectionGUID: cI3DtGSsR3O+b0/Z0bHTvA==
X-CSE-MsgGUID: POdg8W7zQ8yPeWjbmMRjug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="197320014"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.225])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 23:43:13 -0800
Date: Thu, 27 Nov 2025 09:43:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Dmitry Guzman <dmitry.guzman@mobileye.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v4 6/7] i2c: designware: Use runtime PM macro for
 auto-cleanup
Message-ID: <aSgBDvQ9hqaJDKTM@smile.fi.intel.com>
References: <20251126-i2c-dw-v4-0-b0654598e7c5@bootlin.com>
 <20251126-i2c-dw-v4-6-b0654598e7c5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251126-i2c-dw-v4-6-b0654598e7c5@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 11:46:29AM +0100, Benoît Monin wrote:
> Simplify runtime PM handling in i2c_dw_xfer() by using the
> pm_runtime_active_auto_try guard. This adds the proper handling for
> runtime PM resume errors and allows us to get rid of the done and
> done_nolock labels.

LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



