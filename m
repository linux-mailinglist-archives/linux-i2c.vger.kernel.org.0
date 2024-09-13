Return-Path: <linux-i2c+bounces-6736-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42311978B38
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 00:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDFACB25BAB
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 22:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E9D16F288;
	Fri, 13 Sep 2024 22:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8vx+3LG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB2B1465BD;
	Fri, 13 Sep 2024 22:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726265208; cv=none; b=Vk6j6uUGJr6Cdl8rrT0kpnS3aoXeY47Xc+YEKWlUiMcCaGS7tjxALbsUDYfOmtG8rHGngrJNYiDVp2trcKdrmtMUTEgLpMz7UC2TUVBisFw3t8Znj2Cav8BaspiCKNxOMyOg/OZGCs0YUTr/8A2P+bjF1fKWmM9E6yzGkY3LYYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726265208; c=relaxed/simple;
	bh=SXNBW/VoAU5RqThsZySaFZaV3BaP0nEHQ65azegNSbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFZKjcl6paREEsYoHV4hhJf83SI+DgcqBTLOQxKKzAhb1m4/INgl3oJWoyUQ/r52XB4veiHf5SbLhC0ZT0me40yeKw2GlD+bvZ+dD1QJn9/s5L2UoqC5ICB4GJGC6Sd2hr+/KipTjOPq7zrH5edGQWyRDH2awdGYpvroZ/Xee5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8vx+3LG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BD5C4CEC0;
	Fri, 13 Sep 2024 22:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726265208;
	bh=SXNBW/VoAU5RqThsZySaFZaV3BaP0nEHQ65azegNSbU=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=K8vx+3LG5FTAG8jL1PXJZIyfgYaOYlZ/UOXk7cz3P8OPYIXxmgZtKpAIZ0HVRwxc2
	 EWh+zxKdq5SrMV9RwCj9lsI+IFwI28JjmIWopL0IwJLljIaZ3cUYLqherMUc4Fdg1D
	 gNjMFW6kGTTvklvRud0k2y9o58eX8HK86emoggXi79XE3NvXDZouz0+LsyLGDYbwvs
	 N05a3DZFKNfQLj3ylXU6lyazwka9KcPRd9q7twIp2mtdV2yt3aZOm0st2fvqRUQhA6
	 RANjlCfdhoF2JLNR++tkvJZQg7+t7We+kIK/cH7/1ld2Qxx9Ibq5lxumOmtGdZaeZD
	 VX2ggNfelO/eQ==
Date: Fri, 13 Sep 2024 17:06:47 -0500
From: Rob Herring <robh@kernel.org>
To: Arturs Artamonovs <arturs.artamonovs@analog.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Malysa <greg.malysa@timesys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Utsav Agarwal <Utsav.Agarwal@analog.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org, adsp-linux@analog.com,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Subject: Re: [PATCH 08/21] dt-bindings: clock: adi,sc5xx-clocks: add bindings
Message-ID: <20240913220647.GB878799-robh@kernel.org>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-8-458fa57c8ccf@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912-test-v1-8-458fa57c8ccf@analog.com>

On Thu, Sep 12, 2024 at 07:24:53PM +0100, Arturs Artamonovs wrote:
> Add ADSP-SC5xx clock bindings.
> 
> Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
> Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
> Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
> ---
>  .../bindings/clock/adi,sc5xx-clocks.yaml           | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/adi,sc5xx-clocks.yaml b/Documentation/devicetree/bindings/clock/adi,sc5xx-clocks.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a092ebdefdcf89a635cdcf1073921efd28a38386
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/adi,sc5xx-clocks.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/adi,sc5xx-clocks.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Clock Tree Drivers for Analog Devices ADSP-SC5XX Processors
> +
> +maintainers:
> +  - Arturs Artamonovs <arturs.artamonovs@analog.com>
> +  - Utsav Agarwal <Utsav.Agarwal@analog.com>
> +
> +description: |
> +  These drivers read in the processors CDU (clock distribution unit)
> +  and CGU (clock generation unit) values to determine various clock
> +  rates

That sounds like 2 h/w blocks, not 1. If so, the bindings should reflect 
that even if you want 1 driver to handle both.

Rob

