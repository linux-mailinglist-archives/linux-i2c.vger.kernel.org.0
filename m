Return-Path: <linux-i2c+bounces-12250-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4821EB21646
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 22:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59526169A99
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 20:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2524B2D97AB;
	Mon, 11 Aug 2025 20:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UvtzSTZh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D62246783;
	Mon, 11 Aug 2025 20:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754943185; cv=none; b=uJ4FvDh4FPzpaJpO7IiveosuL91nQRKP9h4MgM/HwBBkEZb95d7vYbmPe3P/tvEKIYmVx5fDl72Yzca9RvfnGubmNT/0YmPzawGw+0fJXtmIu99JVU+cA6cH/ctfGkpoLOwlP6TCH73HA+gWGYvAajocssBAkziQqPBMBIUgU5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754943185; c=relaxed/simple;
	bh=fOf7FmO1oXSoKGc5+duHNwTWVhVxWNaZTu8papDbZRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jl20YGHHvnq5iYmY0JGM2/Aju6poSrAk8UOQ1fo5sVbaZuG1pXhBxZyxJCwehdEMVJWR9qYYvEJe9tNivYC+eLAfPVK51fsYPxtHo0ULiRtnZ0O/n7jxkLEgDARp3bbMVvYJm+jh2pEMCasf0q5ueSy8cx6WcN9ovYciJIkgZQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UvtzSTZh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754943185; x=1786479185;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fOf7FmO1oXSoKGc5+duHNwTWVhVxWNaZTu8papDbZRQ=;
  b=UvtzSTZhQk89DJqfJANMdFrymOu4NWqGBXpLr35Dt7/5Vko3d612fkqm
   cGKphRyrn5id5vTdJDrV9HGl1s9wPadBicjQqQYHuXt8DbhS9/e7qUIYn
   XWh5EkkUyDOGNvOlOfaRl2doCWVBAYFMOUCMpFmttnobgTLlGC7Jdh662
   EpEnv35p4ZONyqs++LTnIQ5y3bEgq1WF7mdN7kOPyXeYq5tsis1tlm57l
   KUzTl9ed7eNMtSjz7ExtcJkF/hfO+j3bSNU6al5xtLq/Mocd2ASCI/k2Z
   Ud45b1DEQ6yVJYwc05fOCIyi14iZ4TuUhoR/+kaS2FUXpjhRc4V/22Ki3
   A==;
X-CSE-ConnectionGUID: 1NeYI2zvTfGp/NDnl0vbEA==
X-CSE-MsgGUID: YFeYwMXmQPmhP12gtO2PlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67475402"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="67475402"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:13:05 -0700
X-CSE-ConnectionGUID: idHNyJAVRD60Z7u9j0hq0Q==
X-CSE-MsgGUID: J7a8fYeiSeKRUkuD2eojug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170224124"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:13:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ulYt7-000000056Wa-282d;
	Mon, 11 Aug 2025 23:12:57 +0300
Date: Mon, 11 Aug 2025 23:12:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/3] i2c: pxa: fix I2C communication on Armada 3700
Message-ID: <aJpOyWKzBt-tDWUF@smile.fi.intel.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 11, 2025 at 09:49:54PM +0200, Gabor Juhos wrote:
> There is a long standing bug which causes I2C communication not to
> work on the Armada 3700 based boards. This small series restores
> that functionality.
> 
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

I didn't get this SoB chain. Who is Imre here and what is his role in all this?


-- 
With Best Regards,
Andy Shevchenko



