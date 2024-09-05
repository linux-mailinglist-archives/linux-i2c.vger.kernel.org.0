Return-Path: <linux-i2c+bounces-6272-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD4F96E2E5
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 21:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 722021F22960
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 19:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91FE158DC8;
	Thu,  5 Sep 2024 19:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIfNyT+m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC9D188595;
	Thu,  5 Sep 2024 19:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725563639; cv=none; b=shYxImuUMvLiUGMmeA9R6ZTEC2b4zWV7AaYrou6zDi8/c0boWNMeFPHflOzL22JHQpzObLH7d9TF4drGqV3y/ye6BJb8olWuKVGQDGYnnMk0O+ugOp8fqg/gu/LszfxFF19uhu3S3xPdGFnDMd+2fsnbp3gf8lYBJWobMdhfmlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725563639; c=relaxed/simple;
	bh=mTBuLETswXC09QLI+VcdbP8CzYzFsrnsp5jHuVvS1JE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqJMQ/1TLGBDcNtt2KbVaUKVbTIIFG0ByLnPbeyPiewJ8w1Dxm4pKxbxsvslysiWmEBZS6PlXRyBv98MWA9/K5BXHMu/BBO8Jrkl39m6YRJGIoi7yXB4/e5zMfGGczqA8tKlH7RdN7b07h5NLoR1oyKqMNHzGV4tTaH7dzNkHPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIfNyT+m; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725563638; x=1757099638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mTBuLETswXC09QLI+VcdbP8CzYzFsrnsp5jHuVvS1JE=;
  b=LIfNyT+mMgrLYWi3HFA/rneOBALNZkdTRr2cCGnQorDkYP6/QXbrsBBW
   LMIn4I3A3kA16h/XBJsYx+TLp3DznbCvXexlkd2VqpjE3H/nhhC+3JtML
   GxBQiqLI0KC5bDPl3yRRhsela1sFN8mcNDAnqOf1cGjMlqhnqzdLC12Uj
   /Ki9lty+U92DHnIEpdr++MPP+UdM11fW4GH+/JxsxHHw/1PPsB6WBpB2j
   zg6GlvOBNkM0sh5c8HgeNza0t4en+0a1QQGr2w3FpLOt353h41eNO5zCi
   TleQ9pp3wBzJ/MgX8mU88PL58CFGft5ZFgg1tXAu46Fe8oVNQdvzRHle7
   w==;
X-CSE-ConnectionGUID: aFaPACUERX6k/XD7A9CuNw==
X-CSE-MsgGUID: ZELKsJUDTO68elaACLTF/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24177444"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="24177444"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 12:13:57 -0700
X-CSE-ConnectionGUID: TgQG9v7LRi+FWBovYgCPBg==
X-CSE-MsgGUID: 9vHutHYnQ6arZPaW9K8xIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="65433332"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 12:13:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1smHvS-00000005WYn-1sN5;
	Thu, 05 Sep 2024 22:13:50 +0300
Date: Thu, 5 Sep 2024 22:13:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 09/12] i2c: of-prober: Add regulator support
Message-ID: <ZtoC7kz-5Cd4CZe5@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-10-wenst@chromium.org>
 <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
 <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com>
 <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 05, 2024 at 11:14:58AM -0700, Doug Anderson wrote:
> On Thu, Sep 5, 2024 at 8:10 AM Chen-Yu Tsai <wenst@chromium.org> wrote:

...

> I guess I'd have to see how the code looks to know for sure, but if I
> understand it sounds a little awkward. Specifically, the "options"
> sound like they might become complicated enough that you're inventing
> your own little programming language (with delays, abilities to drive
> pins low and high, abilities to turn on/off clocks, and abilities to
> turn off/on regulators) and then probers need to code up their
> programs in this language.

You beat me up to it. I have the same thought.
However, what is described is exactly what a regular PMIC has.
They already have their own language for exactly this purposes.
(At least I see that in a few Intel SoC-based platforms.)

So, after all it may be not a bad idea But would be good to have it
standardized (if it's even possible :-).

-- 
With Best Regards,
Andy Shevchenko



