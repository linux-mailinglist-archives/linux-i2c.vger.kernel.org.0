Return-Path: <linux-i2c+bounces-1603-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 967D5846223
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 21:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E54028A903
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 20:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1DCF3BB3D;
	Thu,  1 Feb 2024 20:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipoBVTLu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE973B18C
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 20:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706820513; cv=none; b=Wb3Q3Bxb7NV42v7OVLhBAkxTa1RmqAe7f35lmhUCaZQQDt3IvmUbnTqAkHgdybxrbjKWlaqLOs3B84cLZM4bBU/JLhdDUC/idojFApKoA0+YXxMmN8AOGer5Pu2kqVSvGF4yUjCa+Zln1cmc1tS+AjlGPIgj1ZlogeRiI/6KRJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706820513; c=relaxed/simple;
	bh=0/sHFMlO6aJyGNYFecyr6AlcfQR55jlPrSBzz3KNP3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdMt1ZtlLSmHh01IcyH5qP6GdBZkCgcCgs/tg1KHKuEaI/NiBA7zWmxr75S8zKn84orJtBhWCaR2yZNYLqjfDRh/v/HEYzASa8jGgKoge2r1fECtIO6XCgYJVqqFSgITa/Nnvu1ZgRzd0MyLK+tdZGTu9y7Tg+At3R7PVXp1Q7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ipoBVTLu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706820511; x=1738356511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0/sHFMlO6aJyGNYFecyr6AlcfQR55jlPrSBzz3KNP3k=;
  b=ipoBVTLuQhbzz+YX+33Vy9arFteu/eiJqq83wAAjAImJXmOBzq5LCti3
   fyliGfU1Ds/RJrZOt+a4HnJGWkYxgWunKtcNNGbHF3YdzQ3p+D/5Djezg
   C1QEspIYViXoNf5YNkizXnNu5mUKjBSbro71isfhBIKJ+TFanI8UKpKhy
   4lBDh5ekTRSpflyACJkLJuMLTlfRzECWrkRqGHTW88ye6T2kCnqNOEial
   Rp2GGDPQhGvpgC6tJCJgV+5GZEDe8K+lNrorIAIMdkJS2pUrmX+9ABmpm
   6D883s+aB4Xxbau7NJ1JQYaad4DjPdEJiUM7fUOXFKn3+1JKSu/4ayENO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="198776"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="198776"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 12:48:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823020478"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="823020478"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 12:48:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rVdz1-000000016PC-2Fxo;
	Thu, 01 Feb 2024 22:48:27 +0200
Date: Thu, 1 Feb 2024 22:48:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] i2c: i801: Add SMBUS_LEN_SENTINEL
Message-ID: <ZbwDm1hEbE3dYCun@smile.fi.intel.com>
References: <54845225-ffa5-4983-8bb5-3aa70ef72c72@gmail.com>
 <9d06c7d6-8c62-4e44-9e3e-334ac14e38a1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d06c7d6-8c62-4e44-9e3e-334ac14e38a1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 01, 2024 at 09:12:33PM +0100, Heiner Kallweit wrote:
> Add a sentinel length value that is used to check whether we should
> read and use the length value provided by the slave device.
> This simplifies the currently used checks.

...

> +		/* At transfer start i801_smbus_block_transaction() marks
> +		 * the block length as invalid. Check for this sentinel value
> +		 * and read the block length from SMBHSTDAT0.
> +		 */

/*
 * May we use the correct multi-line
 * comment style, please?
 */

...

> +		/* At transfer start i801_smbus_block_transaction() marks
> +		 * the block length as invalid. Check for this sentinel value
> +		 * and read the block length from SMBHSTDAT0.
> +		 */

Ditto.

...

>  	if (read_write == I2C_SMBUS_READ && command == I2C_SMBUS_BLOCK_DATA)
> -		data->block[0] = I2C_SMBUS_BLOCK_MAX;
> +		data->block[0] = SMBUS_LEN_SENTINEL; /* Mark block length as invalid */

I would add a separated comment line on top.

>  	else if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
>  		return -EPROTO;

-- 
With Best Regards,
Andy Shevchenko



