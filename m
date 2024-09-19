Return-Path: <linux-i2c+bounces-6883-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 252C597CE42
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 21:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE4C21F2370E
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 19:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F9C524B4;
	Thu, 19 Sep 2024 19:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJ+cdXK7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B827759147
	for <linux-i2c@vger.kernel.org>; Thu, 19 Sep 2024 19:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726775504; cv=none; b=HZvAV4/iierH5GRtwRLNchg6NZfr97K19tPKnydPxF++CKjfKxDDEm7PnWBSEygQ1aa8+ZyYiJnsrBhM6o03PTnDt4wpqVipKmQp/mKZNHH1BLyUDmyfQqmfadw8OGnBXTZZE/ip+ydvqSmNK3DOF/K1vLfTz11KJffUcUOzc9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726775504; c=relaxed/simple;
	bh=hH9c7qcCRYC9f7fQD5dO0VVgzupXlHwLjyHeh/A8UvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YT02jz0hr2EEXyBlZ8FyWh6oS9LmKmknJ1GdEH65ENkatR4GVUlJ67UJesFb89hOlc3cMnJwG49bsj3XwHGgdHZ+Lr6TeOXXl2gW58ldqLMNuxdTRHVcdty7lQYpYrmMrjkUr75LEFIiyBYfPIqqHmp6Wk4eBCHeVvStTiyogjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJ+cdXK7; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726775503; x=1758311503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hH9c7qcCRYC9f7fQD5dO0VVgzupXlHwLjyHeh/A8UvU=;
  b=aJ+cdXK7IBDAkxI5Xwt3KuUNPVajZXo4NTB7W85mVS2VUp0IcpUwNPXR
   JmgR+FUGiRgBV0r8GqLdAehBWzYZGsOZ3WRkGT/CPNysMV0FrzlK0sMaF
   +6Cxux1z/T5Bb0MrE0OAYd6vKC9wdyfer+wLl2ifPjo1bgWlg73mJNyUb
   EgvaUl9mK/AobdfnEISR80hgK492mlXPOk3VNfVZHRJKsuTWNYk2KyBbO
   0KPWJzeeQygxO5bKbG/OLM0rRxuMkmsomWtECaYCX0PGjYMZrtzlv0WIJ
   5nfNe3HnZBTNyP+qivTTyotZnXlKKBRFzK+0wlA8s5zMZvxyJscCA8kIs
   A==;
X-CSE-ConnectionGUID: 2Mx17unXRdCYbaC+fui1fw==
X-CSE-MsgGUID: DMmpOohmQmyLMfIT/aQyjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29662214"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="29662214"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:51:42 -0700
X-CSE-ConnectionGUID: aVH2sP6/TrG9hT+W7Xgmtg==
X-CSE-MsgGUID: QUCJ2sPoS7uBMNkd+aM7Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="74405570"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:51:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1srNBi-0000000Ag3o-1QEK;
	Thu, 19 Sep 2024 22:51:38 +0300
Date: Thu, 19 Sep 2024 22:51:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v6 2/8] i2c: piix4: Move i2c_piix4 macros and structures
 to common header
Message-ID: <ZuyAypgILGy7nep_@smile.fi.intel.com>
References: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
 <20240919175913.1895670-3-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919175913.1895670-3-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 19, 2024 at 11:29:07PM +0530, Shyam Sundar S K wrote:
> Add a separate header file to relocate the common code from the i2c_piix4
> driver, allowing the AMD ASF driver to utilize the same code.
> 
> Update the MAINTAINERS file to include information about the new common
> header file.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


-- 
With Best Regards,
Andy Shevchenko



