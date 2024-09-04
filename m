Return-Path: <linux-i2c+bounces-6177-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5448E96BDFB
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 15:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EFEB1C24D72
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 13:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9531D9D6A;
	Wed,  4 Sep 2024 13:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tbu933Aq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BF71D04A1;
	Wed,  4 Sep 2024 13:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725455614; cv=none; b=E3U7qhflVgIBtPbma6jwe+Xy10aaAxJtjT5ip2R7qgGkTAyJjmhhbIOqsNfsEBY9sMwPDtYxCkpNe24pvzU4iD+doTgJ7y0msd1BqkQ2JkUGJMHTyH1PYoeLxsTBqsvWAFDH2C3f7TBIQNKGPOmjWpYm27k6lXy6Ni8pzkQLvdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725455614; c=relaxed/simple;
	bh=zHIc1Xe49cAdQbrSE9iC8kis8SkfxhbbHfvV3kPeSfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeBcuwkejC3S58HVYffd1xVPeWckgZEkqYQjggK+oN3HRUeuDTa2LbrZwln6KRt4vPBbYXIgSz6RsBYeZZA82gO6HkZSbJCwhYjtIkwKTwkmpv121FzQqg7Yjlx40uMLMIHmxBMV9DuXp7QV4cSBs/f5wG58oHA54TR3Q/FqW2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tbu933Aq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725455612; x=1756991612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zHIc1Xe49cAdQbrSE9iC8kis8SkfxhbbHfvV3kPeSfA=;
  b=Tbu933AqvgAgh+hSF1nNy9V8+bHfaf4Am+wgwyaFCbVM6qTlsI1pIyoO
   o2pTOy4I4t3UjEIu9JfwjSjiiyhYRNZZ/h9OyutFX38+Gr54xeR+XoQHz
   kSw4Zq+dRm99FRbg/e7Gj7Kne/elBnNuDkG6H1UZvYJ5ZZ3ZLF4pWfbit
   s723QLQRBHdNAo1aGzER/NjGRzbN2hI+Yna5DhU8Bk/730pZK9pXJG3Z7
   RzwuDbFTEKqTU8xx8gTe24uHlvYcQExJw0iKQeD5M3rJW52QrpURgOZCR
   dEVUCDTD7Mw38DWVrk1cTicx0a+C6XFjq0A0+NghOg2l4R5ZvPzQsHAvb
   w==;
X-CSE-ConnectionGUID: cYVBtOtJQr+1QJdo4I7zuA==
X-CSE-MsgGUID: uFYa/eZ8RTq8n3w8zD7S0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="27904056"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="27904056"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:13:31 -0700
X-CSE-ConnectionGUID: nqlk14NrR3qCkWhyjarSeQ==
X-CSE-MsgGUID: EbYFOQjIR46uSDvJ0f9PEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="69894307"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:13:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slpp5-000000054Ne-0cgl;
	Wed, 04 Sep 2024 16:13:23 +0300
Date: Wed, 4 Sep 2024 16:13:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 05/12] regulator: Do pure DT regulator lookup in
 of_regulator_bulk_get_all()
Message-ID: <Zthc8r62z2eaR8k0@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-6-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-6-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 04, 2024 at 05:00:07PM +0800, Chen-Yu Tsai wrote:
> The to-be-introduced I2C component prober needs to enable regulator
> supplies (and toggle GPIO pins) for the various components it intends
> to probe. To support this, a new "pure DT lookup" method for getting
> regulator supplies is needed, since the device normally requesting
> the supply won't get created until after the component is probed to
> be available.
> 
> Convert the existing of_regulator_bulk_get_all() for this purpose.
> This function has no in-tree users, as the original patch [1] that
> used it was never landed. This patch changes the function ABI, but
> it is straightforward to convert users.
> 
> The underlying code that supports the existing regulator_get*()
> functions has been reworked in previous patches to support this
> specific case. An internal OF-specific version of regulator_get(),
> of_regulator_get_optional(), is added for this.
> 
> Also convert an existing usage of "dev && dev->of_node" to
> "dev_of_node(dev)".

> [1] https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@gmail.com/
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Make it Link tag.

  Link: https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@gmail.com/ [1]
  Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

-- 
With Best Regards,
Andy Shevchenko



