Return-Path: <linux-i2c+bounces-5410-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A2495225E
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 20:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D4AF283D53
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 18:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076C71BDA89;
	Wed, 14 Aug 2024 18:57:15 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5153BBCB;
	Wed, 14 Aug 2024 18:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723661834; cv=none; b=I/EPT6YA4wKelZOStZj5Sn5Bvj0yg8Hbyd3oq19sC3iPLeFpR8RAiYApYmPu+AJYLztlMv1o9Kn2lxxpj9Uc1Y7cIA5XgLn26OousXJi56+nQiTCU09EFfcHiq99p5cj9US0RUQMBCVa+q6i5nv1Sl0kNcdkc5O8Fju+E2KjhQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723661834; c=relaxed/simple;
	bh=41ROQImH7W3DzfPl4jR8pJCPGVmQqZlJvKq8D4YNbao=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKQR4OVc+jyMpslke/sCR5QaK/fEmjyVLBn+SX3M45uDGWDQYL771NrJfdH7ZAwJuSVWxF6PKYLsJvBNl7+V0KvWObpgB/i763JL5ec5iTnRvqPyTNtr9eHTbPhtrFoG4hAX2DNKDEEm86rf4oDotQ1Pt5ajzNMD16J32UUyVXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: sXXZ0GkBRsG01UWmAf0Lsg==
X-CSE-MsgGUID: BofapF22TH+Fsmz+80yfJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="24803033"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="24803033"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 11:57:12 -0700
X-CSE-ConnectionGUID: GfdbACONQ4qcNb1L/q2yRA==
X-CSE-MsgGUID: DvZmN/55Q8WVO6d9cFWqZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="63985429"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 11:57:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1seJBB-0000000FItG-3gmB;
	Wed, 14 Aug 2024 21:57:05 +0300
Date: Wed, 14 Aug 2024 21:57:05 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 2/6] i2c: i801: Use a different adapter-name for IDF
 adapters
Message-ID: <Zrz-AXk5gHEw00SA@smile.fi.intel.com>
References: <20240812203952.42804-1-hdegoede@redhat.com>
 <20240812203952.42804-3-hdegoede@redhat.com>
 <c35b6mawhhbhjioan6hvrlthtcoc6dqivwihhwz5ftvv6jcohs@ovctm27nnd2n>
 <Zrz43Qb62EB6o39e@shikoro>
 <Zrz64Fo17mmekJIH@smile.fi.intel.com>
 <Zrz8yHYdACa2Hpuo@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zrz8yHYdACa2Hpuo@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 14, 2024 at 08:51:52PM +0200, Wolfram Sang wrote:
> 
> > Hmm... algo_data by the naming seems has to be related to the algorithm,
> > but AFAIU here we have simply more than one _identical_ adapters. How
> > is this semantically related?
> 
> You like the naming approach better?

There are zillions of naming matching code in the kernel on different levels.
TBH, I have no preferences here, but I definitely see nothing worse in this
approach than in the other.

-- 
With Best Regards,
Andy Shevchenko



