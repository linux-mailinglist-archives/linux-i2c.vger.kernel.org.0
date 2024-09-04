Return-Path: <linux-i2c+bounces-6135-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9AC96B7E4
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E11928338A
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 10:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96305147C79;
	Wed,  4 Sep 2024 10:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHfyKHB0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496271CF5C0;
	Wed,  4 Sep 2024 10:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725444508; cv=none; b=DqKT2GsB3Ci0EM9YvGw3kBY+LYvjZ4RiVObnWxTTXPNCGn16v7WltV+vAKU4SuECp4LMOJUc4pzUDneHhUpgvnYyYxpGIL5Y+2jF+MXvdyFsjUTsJnsO6jnPBd8L96IMb+LP1EJarB2I/2qw2KAKzic41u3BpARmU5JaTOLH0OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725444508; c=relaxed/simple;
	bh=h+ZEYfjn015chexkmjVF91yXTddj8EqTDzVXa7vLvQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Px3HO6Jm9AXuhbKOInCBtK6OvdwqQpiZr/KXNCPmNdN03YfCNktCI/3CLyig9gGO3Q3G0kae1Sp4ZCGoc7W0w1FoG9vmdOCd4k+T9sE9mBHRnn/wD5gQKoacCIXG4Xr6nmEUh+mR4jvd17SeD8cEU5u+/BFR8lDk03llXN/Ixh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHfyKHB0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F95C4CEC2;
	Wed,  4 Sep 2024 10:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725444508;
	bh=h+ZEYfjn015chexkmjVF91yXTddj8EqTDzVXa7vLvQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHfyKHB0HJBsFEZlL7NjNCB5ddfJxum5SE+uGVyWPlj7ImOuEjAJWhQ19kXHj86O/
	 JUSehN6SDX/w+BTnao+5DetDK0qdy6ycr2ZvoN9Hgw5dn9YwpS8aqGPdOZ6Q3NW4bO
	 4G47XVjyBuKsE32/ICXRP112G7vJLvzvXHF7B0QbGl0xqeprwT79ho3iBQa9gdteTK
	 MVHIMvatmubJWC2FpyeQnix0sFd4KzBWc6dl/DAmNPhg3Nxonxs2Mu6ZAlinKvW8Pz
	 WTYUz87+WIGyVhzpsYUxs2ilKDSFTELafqe+ckjorc+6gFxR6wGxgdqcfBDmVuh4cz
	 AF3GBajLF7CGQ==
Date: Wed, 4 Sep 2024 10:08:22 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 11/12] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <Ztgxlmhnkn7NVC81@google.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-12-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904090016.2841572-12-wenst@chromium.org>

On Wed, Sep 04, 2024 at 05:00:13PM +0800, Chen-Yu Tsai wrote:
> diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
[...]
> +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> +{
> +	for (size_t i = 0; i < ARRAY_SIZE(hw_prober_platforms); i++) {
> +		int ret;
> +
> +		if (!of_machine_is_compatible(hw_prober_platforms[i].compatible))
> +			continue;
> +
> +		ret = hw_prober_platforms[i].prober(&pdev->dev, hw_prober_platforms[i].data);
> +		/* Ignore unrecoverable errors and keep going through other probers */
> +		if (ret == -EPROBE_DEFER)
> +			return ret;

Is it harmless if some of the components get probed multiple times?  E.g.:
comp1 probed -> comp2 probed -> comp3 returned -EPROBE_DEFER -> some time
later, chromeos_of_hw_prober_probe() gets called again.

