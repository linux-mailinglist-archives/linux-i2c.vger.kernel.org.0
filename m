Return-Path: <linux-i2c+bounces-4150-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 528FB91127D
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 21:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 076831F22498
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 19:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A251B4C35;
	Thu, 20 Jun 2024 19:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="snFugIF/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B183944393;
	Thu, 20 Jun 2024 19:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718912838; cv=none; b=iVvTVUBZE8XzjtsfL36ULLFd6QQ08v2TZwDVMeWxyeTceI/RfrUh51wGCyqk30v8mxjjHA5IaLbTKZ4NeH3ln3OOzag/NbjQElDAdQyRKJIvtOuBCAReY233Ifvw9nmAe7cYFQ+jWTTx0FI7JV2wupVpK5VdQgEkLP9f+4udjBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718912838; c=relaxed/simple;
	bh=D+e2m26VHYUG/Lo1gKaeNxI1GFfU9WexaAsiXpn5YYI=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=SMVtjwTdeDVBwAgGEzn1/anIMAd43GUoHKd8YnkdrydWw4yl+FgeaCkeuNmHUApbuKZWJLmX/K/r/9V7Jcze5mHEsvw7RQmbYWRNckcuNA0OLo8eR6Ytimg6LvjJpn58oVHKuki9xPWZk6bqklx55hqzHm4CTpBkweGRTV6WJ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=snFugIF/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD0CC2BD10;
	Thu, 20 Jun 2024 19:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718912838;
	bh=D+e2m26VHYUG/Lo1gKaeNxI1GFfU9WexaAsiXpn5YYI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=snFugIF/AqgJy+pEn7auwBHqcgy7Pe3AUcf+drxFEmAqZGIg4UnWBdqoK6m6CwAsz
	 EkiwhgZjP3d7GOm7e8ou0XhSc1T7L3lMeaa/T1AEIXbfpSX2iywkxq4avE0e0+m91t
	 dLOvf7FI8ULn1u+pmBL4hCtE4SXPle6UjAxOchsCgdgfWHkHmUV9bzREB8NNPkOJPP
	 5LWC2Wixht1KdskG7sSDxZfktWP8GWsK507Mj2+LEuf+K4sBHxeRyzFxXz2SDbZ0t9
	 K6+mi92KIySVFO89b+DEvfdkNsCh+2E7uNs9B8beQA9nGHp8USIGgcbWKanPLsl5s8
	 j+fvNo+PZMXHQ==
Date: Thu, 20 Jun 2024 13:47:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-sound@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
 Arnd Bergmann <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>, 
 dmaengine@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Richard Weinberger <richard@nod.at>, 
 Michael Turquette <mturquette@baylibre.com>, Takashi Iwai <tiwai@suse.com>, 
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-kernel@vger.kernel.org, Markus Elfring <Markus.Elfring@web.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, 
 Yangtao Li <frank.li@vivo.com>, 
 "J.M.B. Downing" <jonathan.downing@nautel.com>, 
 linux-mtd@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, 
 devicetree@vger.kernel.org, Li Zetao <lizetao1@huawei.com>, 
 linux-i2c@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
 alsa-devel@alsa-project.org, Vinod Koul <vkoul@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240620175657.358273-3-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-3-piotr.wojtaszczyk@timesys.com>
Message-Id: <171891283706.3289677.3213379285370562671.robh@kernel.org>
Subject: Re: [Patch v4 02/10] dt-bindings: dma: Add lpc32xx DMA mux binding


On Thu, 20 Jun 2024 19:56:33 +0200, Piotr Wojtaszczyk wrote:
> LPC32XX SoCs use pl080 dma controller which have few request signals
> multiplexed between peripherals. This binding describes how devices can
> use the multiplexed request signals.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> ---
> Changes for v4:
> - This patch is new in v4
> 
>  .../bindings/dma/nxp,lpc3220-dmamux.yaml      | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  9 +++
>  2 files changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.example.dtb: /example-0/syscon@40004000: failed to match any schema with compatible: ['nxp,lpc3220-creg', 'syscon', 'simple-mfd']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240620175657.358273-3-piotr.wojtaszczyk@timesys.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


