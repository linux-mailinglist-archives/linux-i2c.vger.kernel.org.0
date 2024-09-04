Return-Path: <linux-i2c+bounces-6188-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01396BEF6
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 15:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 654C41C2533B
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 13:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7C61DA630;
	Wed,  4 Sep 2024 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCrN3BJw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD121DA616;
	Wed,  4 Sep 2024 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725457407; cv=none; b=jDwd8xGnGdKCcYsmtUf2CFrBKeBXtSlOMFrwlTa+Psh4qv+pgFe1nrUdphlt7QLU88imWYkkxDG9gmu4PoM3jVr4qPEeMqcgF/4l8cdTabPkXKbmNZkt+B1g99s3W0Fcobg9EHcrX6QwstmgEjvcZHKn7mI7+4SP+rU4eh4Mwig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725457407; c=relaxed/simple;
	bh=kE0X7wspkpxVH1tIDaeGEqIrVA9YrtMyOtuxX4FrNRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fi4BtfRAIPy11FdYmTOaSLSkG9+2G9uR1SeBPU3lsG1m3oBFgOmFIACXoSg/8IP53jPoKI1ACJNTuUXVGtFnRulsBt+pPv5loOL940VUtuzn2YnYrEd+r1jGvjnO8nQfp1i48KeDIFO1k6axeoWE5qLSIcZIaMUo02VkEBmjV+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCrN3BJw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3CAC4CEC2;
	Wed,  4 Sep 2024 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725457406;
	bh=kE0X7wspkpxVH1tIDaeGEqIrVA9YrtMyOtuxX4FrNRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZCrN3BJwrnkJylI3AHIVOu+JPvpU3xjzr+2K2+H+Rk/DYpys1kb23fmHuCQ+zIHL+
	 GpfXxfeDc84NCy+BkvSf76BQawFIwYmQeSICEt3LcZj2Nc1rl9mYNyxKrh/953gZOf
	 oigq1scn6Qpex2HtUPIOuFzzyAaBwdTDTDu5u4i8ZkuGOA3NztWJE+qLe9ASJxeH5t
	 vWaM+TWrwBkGeRaON+zOKqSklStlgtQ3ugRR2tja03EisNhSp5sHMkCr4fJZSHRSbK
	 5YJcNHp6qvaHwpEpJsNOySRSQh2D4i/QXmTyzFh/LPudb1OOvH9F3haSSzirIqXBFx
	 w99KibqkqfLPQ==
Date: Wed, 4 Sep 2024 08:43:25 -0500
From: Rob Herring <robh@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: Saravana Kannan <saravanak@google.com>,
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
Subject: Re: [PATCH v6 02/12] of: base: Add
 for_each_child_of_node_with_prefix_scoped()
Message-ID: <20240904134325.GA2416154-robh@kernel.org>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-3-wenst@chromium.org>
 <Zthasx8VNCw_yj5q@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zthasx8VNCw_yj5q@smile.fi.intel.com>

On Wed, Sep 04, 2024 at 04:03:47PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 04, 2024 at 05:00:04PM +0800, Chen-Yu Tsai wrote:
> > There are cases where drivers would go through child device nodes and
> > operate on only the ones whose node name starts with a given prefix.
> > 
> > Provide a helper for these users. This will mainly be used in a
> > subsequent patch that implements a hardware component prober for I2C
> > busses.
> 
> ...
> 
> > +#define for_each_child_of_node_with_prefix_scoped(parent, child, prefix) \
> > +	for (struct device_node *child __free(device_node) =		\
> > +	     of_get_next_child_with_prefix(parent, NULL, prefix);	\
> > +	     child != NULL;						\
> > +	     child = of_get_next_child_with_prefix(parent, child, prefix))
> 
> I'm wondering if we may drop _scoped from day 1. Yeah, probably a bit confusing
> as the rest of APIs without that suffix do require reference count handling on
> the loop abrupt.

Yes, please drop. We have other new ones coming and they don't have 
"_scoped". I was on the fence, but if you use a scoped one like a 
non-scoped one (declaring child outside or using it outside the loop) 
you will get a compiler error.

Rob

