Return-Path: <linux-i2c+bounces-13426-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 191CDBC84FE
	for <lists+linux-i2c@lfdr.de>; Thu, 09 Oct 2025 11:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 07F844ECA17
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Oct 2025 09:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DD62D2397;
	Thu,  9 Oct 2025 09:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LqkqlLwN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E95D1862A;
	Thu,  9 Oct 2025 09:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002228; cv=none; b=CMN5XsY8Luyqj9gUFDWEuPvkT+zLIoX0Zsu9wPWmu1gJUp8lUvx/coinc9bnndVIqYB8PsOdXuu4XObI6qzBmubXDyxRb9iwUO6FzHpZek2Pn2ebun2edrUm3oVAmcxAdiw0mLWdaJws1JtRFxjelmvW5bBy+SylWXILRXHgrIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002228; c=relaxed/simple;
	bh=o+H6H9hUXpqnVfpXB6sT7GgCLv8fKIk6uQPEP6nvCwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndLmVKDtBvTLtcnHW/TZowhSIgCrWQwKkHApCpa+/qu5jylCfDiNcBK/Oxls6IPzLGbNjj952UGkjkpcg549U06JKd3HX24Tj8V3pbJiXw7K00jHwmSL3Mp2RdQkvxaIFIj24K/iahU1L5pCxC5O0TFKB7V0oEaBdhFeGFYREXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LqkqlLwN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760002226; x=1791538226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o+H6H9hUXpqnVfpXB6sT7GgCLv8fKIk6uQPEP6nvCwk=;
  b=LqkqlLwNf3MXW8MDtUN5UIuryx07UKCvSGRcQ5kLhEPyZrUCwAmV3P5b
   sPTN+9KDNBCj3ifrYieunzesz3Y07P0ETCKc9WyxJ6DAhzf+5MoJkd1Xi
   N9U2j8WnAXrs5IVVqXoDPaYBPccUsKmlaYnGbjhW1qtfqcmuRR/qtOg3/
   Zbh0MncvXHDw7nCFL2Ds3ZfCsGnPqya8hGMvbErMjqgFYKyKTHFQLVmNS
   K1G+ejLxQ/I/T+i+NqMuow1apeVqO0YvhqxGo/hEIbJ0zhmRtiBQXSRDo
   NbENLJgABHc3Y5nnAzyKPMBSp6PqRN/miSKzXG7ozkcMyOvbBy8DzRx4o
   Q==;
X-CSE-ConnectionGUID: nFb1+ns8S9qpq8GSJwLdEQ==
X-CSE-MsgGUID: ibNqeQykTT6F9FrQX+uPjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="66060620"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="66060620"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:30:25 -0700
X-CSE-ConnectionGUID: C6TONWeRQ7mppdyTUW+7gQ==
X-CSE-MsgGUID: n9aWpSf7QGeb9l5JUVziRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="185789028"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 09 Oct 2025 02:30:23 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 78DB195; Thu, 09 Oct 2025 11:30:22 +0200 (CEST)
Date: Thu, 9 Oct 2025 11:30:22 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: p.zabel@pengutronix.de, andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
	jsd@semihalf.com, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware-platdrv: handle reset control deassert
 error
Message-ID: <20251009093022.GH2912318@black.igk.intel.com>
References: <206e36398db6075bfb0bb0b98295ee7328c5f64f.camel@pengutronix.de>
 <20251009083703.2038187-1-a.shimko.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251009083703.2038187-1-a.shimko.dev@gmail.com>

Hi,

On Thu, Oct 09, 2025 at 11:37:03AM +0300, Artem Shimko wrote:
> Handle the error returned by reset_control_deassert() in the probe
> function to prevent continuing probe when reset deassertion fails.
> 
> Previously, reset_control_deassert() was called without checking its
> return value, which could lead to probe continuing even when the
> device reset wasn't properly deasserted.
> 
> The fix checks the return value and returns an error with dev_err_probe()
> if reset deassertion fails, providing better error handling and
> diagnostics.
> 
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Looks good to me,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

