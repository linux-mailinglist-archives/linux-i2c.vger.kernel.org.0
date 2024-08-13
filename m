Return-Path: <linux-i2c+bounces-5344-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C955F950D07
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 21:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18D48B2556E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 19:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7D61A4F2E;
	Tue, 13 Aug 2024 19:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvTp4psB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB1A1A4F21;
	Tue, 13 Aug 2024 19:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723576717; cv=none; b=QdXlqVbczECcA02loG2Cfbz812nKRvbM+PWZ8vI6PwLbF8/4tNmhz+B2GoMvXP7EdXAMegKqdoJE71td4mC/UV3DfpOqKPEH7BFy7oN63I2WXaK3Bbj4gmIkd5EVS2BYAdf6aK3XX4sgeHKa5ULF5r1+/mJi4Z1N5CrAVazrycU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723576717; c=relaxed/simple;
	bh=LtGc6wajrhVOIl5CtVks89VZVqP++H1N10wAKeaRw6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C73uqOuLm2f+4DlLwO2R9ux21oZp4sxN1eMfXJy3mgZF3SkwoItoRLbR/7lWZk17ws2sSIbydPhbgCnjtOTqeAlpvJ/V2yLt3nS9j2pxD1zbp0QUs97OByGd1xUx0e9jLJk1QGPwqBncpFh5Yd5b8GzoBl66VWthEVLkq61keB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dvTp4psB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010B7C32782;
	Tue, 13 Aug 2024 19:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723576717;
	bh=LtGc6wajrhVOIl5CtVks89VZVqP++H1N10wAKeaRw6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dvTp4psBfGRcvAXdjnnn5oXghTeBEYPSpB4k2hcZvGs31b0skj9OQHPdtk/l1V9D5
	 jkz1kHZRmNquCYEgFpfuwQZfKCTPhj3lCfn9JIjb3K3AewMRlschTgITFSAkJMQAWm
	 TuMnXO+5aJo5puTSc48YiJHSYAr/2BDKjniCOTBbwUuo6oaxvU6H50AKpV7rXQG4k4
	 z9oHR4mUGOMOU7JtUBHyeL6RPd6ePCJVRQCkZw+bVhzXYXPfJyv9/bCNtvkVm/B7fA
	 VNbgLtUNF5Ox6JZluoo8kGFsYNerxBfSBgc5b9jI3N29MucDcNSo8oWK1wQN1JR3U3
	 Bnq5kywCNQKXA==
Date: Tue, 13 Aug 2024 13:18:35 -0600
From: Rob Herring <robh@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@google.com>,
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
Subject: Re: [PATCH v4 1/6] of: dynamic: Add of_changeset_update_prop_string
Message-ID: <20240813191835.GA1598838-robh@kernel.org>
References: <20240808095931.2649657-1-wenst@chromium.org>
 <20240808095931.2649657-2-wenst@chromium.org>
 <Zrs_YijPxKBFQF0_@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zrs_YijPxKBFQF0_@smile.fi.intel.com>

On Tue, Aug 13, 2024 at 02:11:30PM +0300, Andy Shevchenko wrote:
> On Thu, Aug 08, 2024 at 05:59:24PM +0800, Chen-Yu Tsai wrote:
> > Add a helper function to add string property updates to an OF changeset.
> > This is similar to of_changeset_add_prop_string(), but instead of adding
> > the property (and failing if it exists), it will update the property.
> > 
> > This shall be used later in the DT hardware prober.
> 
> ...
> 
> > +int of_changeset_update_prop_string(struct of_changeset *ocs,
> > +				    struct device_node *np,
> > +				    const char *prop_name, const char *str)
> > +{
> > +	struct property prop;
> > +
> > +	prop.name = (char *)prop_name;
> > +	prop.length = strlen(str) + 1;
> > +	prop.value = (void *)str;
> 
> Is it the existing style in the file? Otherwise I often see style like this
> 
> 	struct property prop = {
> 		.name = (char *)prop_name;
> 		.length = strlen(str) + 1;
> 		.value = (void *)str;
> 	};
> 
> in the kernel (IRQ domain, platform core, ...).

Okay with me to use this style regardless of existing style.

Rob

