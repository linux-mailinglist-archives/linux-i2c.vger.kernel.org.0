Return-Path: <linux-i2c+bounces-6514-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C619745CD
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 00:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 718081C25964
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 22:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DFE1AC452;
	Tue, 10 Sep 2024 22:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXvC/AMd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1C41AC441;
	Tue, 10 Sep 2024 22:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726006809; cv=none; b=WGr+SDJ7nEAuDMb5/1rxGhU1HWwqszL/XcTfg2wVlTRJxfbcCjlfRQ64K8VASt2UofKhaoTeiDOwu+Q7IDmHMaJp7TD4dKvnfTIHkd2Lla5Ze5gyJI6FVqdH99d8MbrEtxOn44UlKJpaDg+LT5ki8FXN3EUrSo4VMYPC6ENJTJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726006809; c=relaxed/simple;
	bh=48YI4pbgmYlCiPT43kBVwkkPa58PT2DK2GN26WL06Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5J6Fxxy6VkoR4QujUyqUBtynYNfaL/N5k3jFm5J3aS8/07jaA3LJo16JyJoFHAJgjGONwzV5OGJEkT1MV+VHPW2jneUy1/fBaCvqplPhmbiK8dADnl8QPvhb9orcCvlW+gFKIUjH+BV92+iMJS0+wLhD9SbGNlFK0+sfTC+/VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXvC/AMd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA255C4CEC3;
	Tue, 10 Sep 2024 22:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726006808;
	bh=48YI4pbgmYlCiPT43kBVwkkPa58PT2DK2GN26WL06Zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXvC/AMdALgzeciEYcNb3c7MPlwl1Ldpk8m3EmiuiaLfyLLWLC4BnWS4SIe+MdZa6
	 6mZMlroCrRgIPDG8EyJyzVb39LE+5OAes1gED325p1M9hGm7e8hNTrWk1oAxCuxmy9
	 iEVZo/7+4ouPBj6jySGz6RzsogWcFaGmQrpjVQchYuIJoCEY5cSdDgGO/udItb1/3t
	 MqPWOsC7+j7ZUEm8A9BmF0Es+nKRaVpzowcRgRqJMhsA0rYSK6BUJoTclK4mXQN8iV
	 dPdtSGzTqhto6BkXQMoVkYE3eQs122rcEq6o1b5I1D5+KbbY3Ry5QIsFY3f/9nVqAJ
	 /zH+eyi3rKtdA==
Date: Tue, 10 Sep 2024 17:20:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Li Zetao <lizetao1@huawei.com>, linux-clk@vger.kernel.org,
	dmaengine@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, alsa-devel@alsa-project.org,
	Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Chancel Liu <chancel.liu@nxp.com>,
	Russell King <linux@armlinux.org.uk>, linux-sound@vger.kernel.org,
	Vladimir Zapolskiy <vz@mleia.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>, Arnd Bergmann <arnd@arndb.de>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [Patch v5 02/12] dt-bindings: dma: Add lpc32xx DMA mux binding
Message-ID: <172600677256.860315.3249804427139743181.robh@kernel.org>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
 <20240627150046.258795-3-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627150046.258795-3-piotr.wojtaszczyk@timesys.com>

On Thu, 27 Jun 2024 17:00:20 +0200, Piotr Wojtaszczyk wrote:
> LPC32XX SoCs use pl080 dma controller which have few request signals
> multiplexed between peripherals. This binding describes how devices can
> use the multiplexed request signals.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> ---
> Changes for v5:
> - Corrected property order
> - Added maxItems to properties
> - Fixed example
> - Removed "N:: from the MAINTAINERS entry
> - Added Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com> to LPC32XX maintainers
> 
> Changes for v4:
> - This patch is new in v4
> 
>  .../bindings/dma/nxp,lpc3220-dmamux.yaml      | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  9 ++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
> 

Applied, thanks!

