Return-Path: <linux-i2c+bounces-389-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 120D67F4FBC
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 19:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 446B71C20AD8
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 18:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581B95CD13;
	Wed, 22 Nov 2023 18:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLiNPTIN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5941D42;
	Wed, 22 Nov 2023 10:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700678362; x=1732214362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L82wvl6+ZajZ0SLS81iX3EOXwVKSlwZPColeDzRka9o=;
  b=mLiNPTINkEkkoMiehMo5ufSF9rI716iIhZTV72P4/NtAMDHfuXdbF4oB
   gMs01jU4cDcHJaOcSliyCvUo3JrtROLPOak13Zg/QJo8x3+fxricwdqew
   xfzPg3MyxgNAEkAtW4lqI945ZWWDbJx83uOCNPdXA+WMdsVp83prWMLzf
   7Xs6ZFLAINplZlvFbsfY+PUcglJt3PknHUZIWOB/GxhC75aZOXulrQmRo
   eqs2B4kKwWr/QQABb5QK6iI0Srrtxq+OGkiQxZWT0S7m0i33zeoTzys5y
   uOtJ+6O/8midXEVEsv35HmOIFb/3CiswjPUQC9gBv8W7JGLS+E9yTtFCV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="377150470"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="377150470"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP; 22 Nov 2023 10:38:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="801852030"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="801852030"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 03:26:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r5lCu-0000000G4Yq-2QaI;
	Wed, 22 Nov 2023 13:15:48 +0200
Date: Wed, 22 Nov 2023 13:15:48 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux I2C <linux-i2c@vger.kernel.org>,
	Linux Power Management <linux-pm@vger.kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Kieran Levin <ktl@frame.work>
Subject: Re: Fwd: [Framework Laptop] High power consumption when i2c hid
 touchpad is in use
Message-ID: <ZV3i5AoTHXop7hbf@smile.fi.intel.com>
References: <ac04e6da-2fc8-493a-9a51-69cc729da1fd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac04e6da-2fc8-493a-9a51-69cc729da1fd@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 21, 2023 at 09:03:52AM +0700, Bagas Sanjaya wrote:
> Hi,
> 
> I notice an interesting bug report on Bugzilla [1]. Quoting from it:

Thanks, let's continue there.

-- 
With Best Regards,
Andy Shevchenko



