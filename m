Return-Path: <linux-i2c+bounces-6808-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4D697A53E
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 17:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D44311F22035
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 15:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757DA1591F0;
	Mon, 16 Sep 2024 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktywi59N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A885812E71;
	Mon, 16 Sep 2024 15:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726500227; cv=none; b=PjPHjLdnzm+WqSECmBr9tNSYwe4lpI08oSf5drJF1y/pIzBw+KHwKdrJwUbH+WwscOYASkbaVvBGnp5PXlFDrmGDG6MqKqWlwEO42H9WMK7uaJL7+fu/Z6hp10k8WkHwEZsJd3K6JWXvUH9dzuYDvZt5lrUzq7I0KKCEiT+ONek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726500227; c=relaxed/simple;
	bh=u1WK5mGbBpgkrsDPdh6PGHRYiqTBLU/04eRgolKlOW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZ4Pk9oxmCE/VDKnaAiAVQmkPlhQWU4xbTQ3fyc0tlUBmFQB2gikhJHL95/u8UCIFnKc/Um5GnQfPF2ah+ey493Ir9i2XvOPvxOzSR14kbUyJLTBoBJvaoBuorRc9AmLCcwwQ48e+dIvkMrJZ7C4g6+UDhrceKpJP/Qd4tqjyMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktywi59N; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726500226; x=1758036226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=u1WK5mGbBpgkrsDPdh6PGHRYiqTBLU/04eRgolKlOW4=;
  b=ktywi59Nc7s4xV7j0xiMbeTSL17JnBlw7Sr4wXzM7N7bQRu6beukUwRx
   RuauZ7de1t84+A0c7GQjxX5kxKnkJ9WBaOaAkUbRh8kTrcq/hXF/Hxfj1
   fFxBbUyF9LAfDiLSXjVo/aAqnJo5kv33W3djta34Zle8qSaId6E/hAR7/
   809/0N4DeuTeB7hhRV4zn6cduAAyyVLAl6jsJ5sNffbpPSy6BHPxX9Ao/
   Q4Ce7zNvm+Zp8QZ2R+hQKBp55IYUMVESmBZIz86UDAe4UOjZEcLn7zHlm
   MVQXRaGMrBl040SdxH+2A+kTLk4pXWejNrFA/uV1huSDiHz/34nDgiycG
   A==;
X-CSE-ConnectionGUID: DE7C65MuSR6TZ+MM/cMl9g==
X-CSE-MsgGUID: XZwAA8WYRYmzMO+o8Flzhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="24865269"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="24865269"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 08:22:29 -0700
X-CSE-ConnectionGUID: 86rnqQMjR0mmCKUhs4Ik+g==
X-CSE-MsgGUID: mBOuEq5nRZuNT1rp++px/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="69678112"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 08:22:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sqDYU-00000009VOi-2We2;
	Mon, 16 Sep 2024 18:22:22 +0300
Date: Mon, 16 Sep 2024 18:22:22 +0300
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
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
Message-ID: <ZuhNLuNvwXWjqRqT@smile.fi.intel.com>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-7-wenst@chromium.org>
 <ZuQTFTNTBLCziD05@smile.fi.intel.com>
 <CAGXv+5HgkCZ=vdHGgvCW1U-nid=cQrVaxC+V+H2Gknf2pnTbYA@mail.gmail.com>
 <ZugKHrzs5BWoDr1c@smile.fi.intel.com>
 <CAGXv+5E09LH5UKXh0wHrsqAp-ps8xaGfSZ37GWZ6sbyoaOczfQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5E09LH5UKXh0wHrsqAp-ps8xaGfSZ37GWZ6sbyoaOczfQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 16, 2024 at 04:59:59PM +0200, Chen-Yu Tsai wrote:
> On Mon, Sep 16, 2024 at 12:36 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, Sep 15, 2024 at 12:44:13PM +0200, Chen-Yu Tsai wrote:

...

> > Hmm... I have looked into the implementation and I haven't found the evidence
> > that this is anyhow scoped. Can you point out what I have missed?
> 
> From patch 2:
> 
> +#define for_each_child_of_node_with_prefix(parent, child, prefix)      \
> +       for (struct device_node *child __free(device_node) =            \
> 
>                                  ^^^^^^^^^^^^^^^^^^^^^^^^^ scoped here
> 
> +            of_get_next_child_with_prefix(parent, NULL, prefix);       \
> +            child != NULL;                                             \
> +            child = of_get_next_child_with_prefix(parent, child, prefix))
> +
> 
> "node", or "child" in this snippet is scoped within the for loop.

Ah, nice, that's what I missed, thanks!

-- 
With Best Regards,
Andy Shevchenko



