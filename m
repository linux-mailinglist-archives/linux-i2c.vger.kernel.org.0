Return-Path: <linux-i2c+bounces-13731-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A24AFBFF549
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 08:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 628FD3A48EF
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 06:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E353261B98;
	Thu, 23 Oct 2025 06:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4B7h6Es"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0661B7F4;
	Thu, 23 Oct 2025 06:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761200639; cv=none; b=BtSUtHb+DPFZx3JED9LvNp757DU5v7HwJm4FV9aUrUCeE0M/uODb3VAFG8lGY+8wPmNi395BWM3nO1qrLFQH//aRy/wE7xZZVzUKAM6P5DphycQrWnVywD8kQ9/BVqmpHC5H8auGpgSt7bTj1SzgEue1jeJsYW5ZMiy7sk4kEqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761200639; c=relaxed/simple;
	bh=oV9RkZkygT9VUa3nhCa0IQVYUYgzkyXV6xlNfjokywg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gw5ghPfu4jP7EZh2Ab/dXiAXYdmAnAkRVWhHOzSKzMSStVhh6RD6VQUWkAuSe13vTl/naxa8apK1sBXbUe8qwOfftC07THBP2F7aZgbs5Bf1gF1D8LiSjWbrK1EFXLCLvumseSlwFS5QPh+zGoyVtHABt+Xw3v75dOjr3x6Efew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4B7h6Es; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761200637; x=1792736637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oV9RkZkygT9VUa3nhCa0IQVYUYgzkyXV6xlNfjokywg=;
  b=U4B7h6EsCTMWaCOGnpNE2gHFD04W4xkHLTN4aQaIS9pYc/UcUetq0FaC
   TKSbhOAwK0MRgojXc51B6wH5EHaX60uWKgsBKeH8NwNgwFSHqSVCGdhik
   FzsKzb3iKS/u6kHcEfo4Gev/4SmSq8B6w6hLz13NDPjlJtcycYoB5J1Ta
   sNMTdE0Do2VbEJ5yyn498C0bp1ZOcHITLwkTJM6K4/yRhjLd3WvccGKpj
   83kY4qbueWd89Ru/U5JDcORQeAXhrcMGBheqF3Bjzfbh5cN50y/nIRCY6
   y6SafXi6yD2U8gs7k2Z9bxYoVu/iuJEkRzCe+BWjRF3jKjMCtSaPlP8q/
   g==;
X-CSE-ConnectionGUID: jz+Lq5KpQAqhg7AYk241MA==
X-CSE-MsgGUID: 2tU2yEYYShmK8UzNDQb7HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80796496"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="80796496"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 23:23:57 -0700
X-CSE-ConnectionGUID: QoHd3iDeTRy2L5P4GVdOGA==
X-CSE-MsgGUID: 8EfisnNfTEGG//5yhkRdxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="183291968"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 22 Oct 2025 23:23:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E561D95; Thu, 23 Oct 2025 08:23:54 +0200 (CEST)
Date: Thu, 23 Oct 2025 08:23:54 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cezar Chiru <chiru.cezar.89@gmail.com>
Cc: andi.shyti@kernel.org, wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/1] i2c: pcf8584: Move 'ret' variable inside for
 loop, break if ret < 0.
Message-ID: <aPnJ-inBznSQQPo0@black.igk.intel.com>
References: <20251022015213.6988-1-chiru.cezar.89@gmail.com>
 <20251022015213.6988-2-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022015213.6988-2-chiru.cezar.89@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 22, 2025 at 04:52:13AM +0300, Cezar Chiru wrote:
> Require spaces around '=' and '<'. Add spaces around binary operators.
> Enforce error fixing based on checkpatch.pl output on file.
> Move 'ret' variable inside for loop. Then check if (ret < 0) break. This
> improves usage of ret variable.

No need to have a cover letter for a single patch.

> Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
> ---

You may use this comment block space for changelog and additional comments if
required.

...

>  		goto out;
>  	}
>  
> -	for (i = 0;ret >= 0 && i < num; i++) {
> -		pmsg = &msgs[i];
> +	for (i = 0; i < num; i++) {
> +		int ret;
>  
> +		pmsg = &msgs[i];
>  		ret = pcf_doAddress(adap, pmsg);
>  
>  		/* Send START */

>  			ret = pcf_sendbytes(i2c_adap, pmsg->buf, pmsg->len,
>  					    (i + 1 == num));
>  		}
> +
> +		if (ret < 0)
> +			break;

I think goto out; is better as it's kept consistent with other error path branches above.

>  	}
>  
>  out:

-- 
With Best Regards,
Andy Shevchenko



