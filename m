Return-Path: <linux-i2c+bounces-14514-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D44A8CB8045
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 07:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B2273009F22
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 06:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7224929E116;
	Fri, 12 Dec 2025 06:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGJGMqYS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76CF20B7ED;
	Fri, 12 Dec 2025 06:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765519873; cv=none; b=dNHcUbP95wTjj2oXfqEkw/dJgnCzX50jnl9egXB/eokzTYe7rWHJS2vmDcGjJlyq+1Btd3GAjpYPecWQ5ZgSi4HS6Q5uBEw2tIEDrDme+TWlJlazTm2f2l2+BW2rdQycEHPJVCjGmj9pQ7g5vVB/BB1DPKqZyl0Y8QdeQwunxLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765519873; c=relaxed/simple;
	bh=ryIUkm5tv7RJshvT64K5jrlrAdiPRMIBzSb01POHd90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIRTIyPHblkrKSoWME14jUQOiicW8b1npvwIZ416IpIx8HgsbAS8nXS3j7LH/QveIjTluHp3xj2geYshbmwg60TpEbuMOEd5PfNSy2icFkkpnUp2AR6F5hbWYA6qsc2+EFyszON1CKq/8CmqyPXSFadi3d5qIPST+jWgpG3x3qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGJGMqYS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765519871; x=1797055871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ryIUkm5tv7RJshvT64K5jrlrAdiPRMIBzSb01POHd90=;
  b=XGJGMqYSTiuTGx7cnQqtGcZStu71odUHwHhhQDVJzRTr+9MjNnW/n+eY
   3u11aVFSyJ3Vd+iKEgTEIJhPy+rK7qf8wfoXuvdnQyyUALamrLBjvwhSq
   e+xjQdEfI0LOqJ/bhS3FQoUrThmKZEtZZipsAsikg1ll6Kj6vkYYt4zJY
   zE6fKs3SZwqRISqr1a/PnDbDG3eCRH9o4G5nkLg5TjqJQSxkr66abLaut
   tDin/nu8WppIE0WBCgKb1b/lCcdihSO+yuf+ksSvy6Vn63kb1ejDrsj0e
   2JWA27Pb3Qu1am0EuRAubrxXcvKC2lzpuaD6Oex5SPLDjhP8NbLFtklkW
   g==;
X-CSE-ConnectionGUID: tSQcWOpeSsymS+eW3bp01A==
X-CSE-MsgGUID: BZgvxNG6QKqwGSvdUf0r9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67556750"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67556750"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 22:11:11 -0800
X-CSE-ConnectionGUID: 2RPpmpuGSQyEpnFvTHeRtg==
X-CSE-MsgGUID: TA5vBrlcT4etRuFCvwA1KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197266292"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 11 Dec 2025 22:11:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7371B93; Fri, 12 Dec 2025 07:11:07 +0100 (CET)
Date: Fri, 12 Dec 2025 07:11:07 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: designware: Replace magic numbers with named
 constants
Message-ID: <20251212061107.GJ2275908@black.igk.intel.com>
References: <20251211122947.1469666-1-a.shimko.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251211122947.1469666-1-a.shimko.dev@gmail.com>

On Thu, Dec 11, 2025 at 03:29:47PM +0300, Artem Shimko wrote:
> Replace various magic numbers with properly named constants to improve
> code readability and maintainability. This includes constants for
> register access, timing adjustments, timeouts, FIFO parameters,
> and default values.
> 
> This makes the code more self-documenting without altering any
> functionality.
> 
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

