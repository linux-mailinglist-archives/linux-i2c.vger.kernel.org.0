Return-Path: <linux-i2c+bounces-7063-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C98798887A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 17:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0ED8282D5A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 15:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6021C172F;
	Fri, 27 Sep 2024 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXeJm1nF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0806C13A27E;
	Fri, 27 Sep 2024 15:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727451912; cv=none; b=Q+7nEaatssTGIcT+essQ7/hKS8jtYvfzfaeYmxMnrQD9ZZBDCMxV7HA0pyALTrSZKcyD45ws/K/cqZ0hGIPPOiHCSgC5vF9QL3NfQaLCsKKVfwAU4H+Qm4S4NW2TxMxZIbjkBr4qQyaKJw+Q4MBhyx2nhqs7UKdqCPkK9sxTbW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727451912; c=relaxed/simple;
	bh=SSsVxrLU3Pis+OTeEMtEhV8WM8q9d22wDjApC2JZH7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+bwZWVJs1ZUDjJeY8mQfTiGWODKZ3O8P4Z/ZIYnWDSn6ahwZYql2gw5woKxZ2Oq2g/gvcbCITGE75ok3lZLqqz2gNaP3x5SqTPEnHu0nOiVLK1IHh+CRTMVlvae07uF9fQwAjvIKUimU/4UnhI6va9LP/Rsvh9zpsGYhwNRZl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXeJm1nF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727451911; x=1758987911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SSsVxrLU3Pis+OTeEMtEhV8WM8q9d22wDjApC2JZH7A=;
  b=nXeJm1nFfOVPWrGhZr8aWN4dFc7W3IrcLCrDCKBDRebF4Abaagmmz5j3
   IgvSs0RXTZrMLK9iwNqLcLgL8sNotshTgkPOe4PbPAf0BGLt30URxm7px
   KvBFUFh4zRVUcEP+ABAAKClK+/YWtay5Gc/T5JHYu/a69YYW7v6OnfUrA
   0s3KmdMcEs9Z6v0eNuGAY0gvmao/vcjhsODClvhpmCT6Tr3C/2ZFAjnUG
   kGbC2ASIYgEohhhyvXT6PdnTVgVXi2K2oAbKSPg2QkSdfRApY+SP6DE/7
   6xxFbYNce/cUSBlHg05C4RM7jDBRFpdBKjCdrnO+HTppWOegx8Bh8VK4x
   Q==;
X-CSE-ConnectionGUID: RsSAabRYRNmdjarxKmBbbw==
X-CSE-MsgGUID: afu+NoIJTP2rSdKsjObx4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="49127540"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="49127540"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 08:45:09 -0700
X-CSE-ConnectionGUID: v6pwkCoWT26fhaC+l2LbaQ==
X-CSE-MsgGUID: RXhXG783Sk+Jd0tNY9ukUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72992038"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 27 Sep 2024 08:45:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EE52330D; Fri, 27 Sep 2024 18:45:06 +0300 (EEST)
Date: Fri, 27 Sep 2024 18:45:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.12-rc1
Message-ID: <ZvbTAl5uYbMcVI6m@black.fi.intel.com>
References: <auogjhzhbs2w45ptdkl5ceyxsm7apyfi5wmfv3iwuzfh47pl6f@4nnrnpqqlum2>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auogjhzhbs2w45ptdkl5ceyxsm7apyfi5wmfv3iwuzfh47pl6f@4nnrnpqqlum2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 27, 2024 at 12:09:36PM +0200, Andi Shyti wrote:

...

> ----------------------------------------------------------------
> The DesignWare driver now has the correct ENABLE-ABORT sequence,
> ensuring ABORT can always be sent when needed.
> 
> In the SynQuacer controller we now check for PCLK as an optional
> clock, allowing ACPI to directly provide the clock rate.
> 
> The recent KEBA driver required a dependency fix in Kconfig.
> 
> The XIIC driver now has a corrected power suspend sequence.

While tag message looks nice here, I think it still has to follow the
same (as in the commit message) pattern, i.e.

$SUMMARY
...blank line...
$DESCRIPTION

Why? Because the Web representation of the message looks weird on the
Web. Compare
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git/tag/?h=intel-pinctrl-v6.12-1
and yours
https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git/tag/?h=i2c-host-fixes-6.12-rc1

-- 
With Best Regards,
Andy Shevchenko



