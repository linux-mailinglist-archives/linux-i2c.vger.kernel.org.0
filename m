Return-Path: <linux-i2c+bounces-15290-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA46D3C4E1
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 11:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7989A701476
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jan 2026 09:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696C42F9985;
	Tue, 20 Jan 2026 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XP60UBWF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518C92E972B;
	Tue, 20 Jan 2026 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901996; cv=none; b=aVajvA/avla0WTJ5hEgMAaBejYhBQGrFu8kvLc46mQ5RJWRGCsOzgQwGpC5Z4oi82d1k0So1ta0lJJrB4ZzQ9vps6rM/ZbjJzWBPB48nzlxg1AIZUGtqxYKPqx1hDjOUVXQz9qbTnZBdiu1am24MD4TyQJlEkD3UNqBQVkXtkMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901996; c=relaxed/simple;
	bh=Q2NDBA8DWAw6H9uJLr1PAYQxtVM80rdP/ovdl3g6t+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWqgUwvWO34b1agZr1801SCvouUAWkjJZxqV0LLgUgu5gkaeCNE8WGgeks9cLuDc22+1i2/aYdaAP2J8TDtuzJUnSAma50tu1Q6uQ80Ays6S/qftSqJE74tf4nHFL0/k5jCbDi3g2RUDpKKWs1+/II2j7RpZ1DzOXm+iPMDCEWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XP60UBWF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768901995; x=1800437995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Q2NDBA8DWAw6H9uJLr1PAYQxtVM80rdP/ovdl3g6t+4=;
  b=XP60UBWFUSK+ReglHsHkY9DrIdG4ROtQfb3+Fhyw25hGQuejp+lvWP3i
   KB5sC5LX3KazIP8uWziMygo8GzdMML+P9E4T5HmSl7A9hUfcsSRy0iK+7
   LmuRAcjkj+UXwOZLO6bWi71ZtgV4u86Vgo3Dpu+u4sGlMK/cHnbdhB4qv
   dNmF8ckJY6oP41K6dI7HndOaPE71iVylU2EvRcu3fZJxuT8n7h4An4llH
   bfYKCG60H7uZTlzWPEqcz3KLXIL4Y4DFUF91qbxwpRNkecpnMBB4WZt2V
   +6ijEvfBaMhnhriW25xpP1QNQtkmHZA+Bg+fqDgXGSDzpGDM0yAv5cKSJ
   g==;
X-CSE-ConnectionGUID: T+DIEbp4QCmoFAk4rTTfig==
X-CSE-MsgGUID: W6ovPkfVS6qksijOV7XtAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81215233"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="81215233"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 01:39:54 -0800
X-CSE-ConnectionGUID: fjxOl55tThOxp64cAJ9PDQ==
X-CSE-MsgGUID: bSiIKYrbSSWJeXhjfwcJsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="206123219"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 01:39:49 -0800
Date: Tue, 20 Jan 2026 11:39:46 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
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
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v5 3/6] i2c: designware: Add dedicated algorithm for AMD
 NAVI
Message-ID: <aW9NYkADDRju1cgJ@smile.fi.intel.com>
References: <20260120-i2c-dw-v5-0-0e34d6d9455c@bootlin.com>
 <20260120-i2c-dw-v5-3-0e34d6d9455c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120-i2c-dw-v5-3-0e34d6d9455c@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 20, 2026 at 10:28:03AM +0100, Benoît Monin wrote:
> Apart from runtime PM, there is nothing in common between i2c_dw_xfer()
> and amd_i2c_dw_xfer_quirk(), so give AMD NAVI controller its own algorithm
> instead of calling the quirk from i2c_dw_xfer().
> 
> Add runtime PM handling to amd_i2c_dw_xfer_quirk() and a dedicated
> i2c_algorithm for AMD NAVI controllers. The adapter algorithm is set
> during probe based on the device model.
> 
> This way we avoid checking for the device model at the start of every
> transfer.

...

> +	ACQUIRE(pm_runtime_active_auto_try, pm)(dev->dev);
> +	if (ACQUIRE_ERR(pm_runtime_active_auto_try, &pm))
> +		return -ENXIO;

There are PM_ACQUIRE_*() macros available now.

-- 
With Best Regards,
Andy Shevchenko



