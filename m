Return-Path: <linux-i2c+bounces-10151-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F36A7E088
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 16:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CCC017E350
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 14:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353571C4A10;
	Mon,  7 Apr 2025 14:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oh6ZWDP9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53572C6A3;
	Mon,  7 Apr 2025 14:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034555; cv=none; b=bgJNmLQmsuq74JC2B0vkjHteTqRsEZvDJ4XkAzQZX0nYYtGb3Q/aA3sBjtkdF6bH9UbT71Syocjvk8BES82dXQ0kSHvrREdCic2kxlB72J+8ukbV9sBqHTr6weTAzCUvEMGB9Swk1JDORZ1sPJRuj/5ZpaqDVvGtCjMfR7GqCRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034555; c=relaxed/simple;
	bh=W3SHYCW2Ors5dixyvIPe8YB5LgdUl989Vud2NXgXX8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AV3azzfdZvqw2tHl/XwU900SOlCC7YvMXqs7r/KpzvTZJErAOQmtwnFCOiQ7byj0E8r+6qgCxeO239vQEojvrNfXaWm+0YwuyqKt0H9628Y1xQ6wBLD5Gze27qysiEkjBXBqTgQw1rOGJHeaX1hAojfdd/bLoX2+l0BbjD/rATw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oh6ZWDP9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108F3C4CEDD;
	Mon,  7 Apr 2025 14:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744034553;
	bh=W3SHYCW2Ors5dixyvIPe8YB5LgdUl989Vud2NXgXX8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oh6ZWDP9gO1f5r6MxG/QQ4EWDh52V6RzQQ4W7G/Wc2DM7wj67nRy0OXFJbv5EybBe
	 3E8lu4uRJh1oVrYXIzz8yV2GKMlDPbPy54XIRlSDZE4covfbvrht5pFYl27TMhAKgs
	 KfQtzOwxVM+MCBPE6AjTY3U3+OKA7H20Mc9YLqJUADIOHD6Ais16TqBgY4N/Bt0An5
	 W1NnfOgXPvjITsah7honbXqtG+6fz5TDUHnkJy5E0kcn1cpJ8TJCgHQWAqD3PdXEfk
	 Jp8I1XN7InWFptl0b/MMeQ7KFCkdDDNhSgjMqxOGL9Z1cV5qU8QmVj68Cx69PAOViN
	 o5zvSOgAi1mKw==
Date: Mon, 7 Apr 2025 09:02:32 -0500
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C
 controller
Message-ID: <20250407140232.GA2165777-robh@kernel.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-8-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-8-inochiama@gmail.com>

On Mon, Apr 07, 2025 at 09:06:12AM +0800, Inochi Amaoto wrote:
> Add compatible string for Sophgo SG2044 SoC I2C controller which can be
> used specifically for the SG2044 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/i2c/snps,designware-i2c.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> index bc5d0fb5abfe..677b39865af0 100644
> --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> @@ -38,6 +38,10 @@ properties:
>            - const: snps,designware-i2c
>        - description: Baikal-T1 SoC System I2C controller
>          const: baikal,bt1-sys-i2c
> +      - description: Sophgo SoCs I2C controller
> +        items:
> +          - const: sophgo,sg2044-i2c
> +          - const: snps,designware-i2c

This is not a great pattern we've started. T-HEAD, Ocelot, and this 
should all be combined into 1 enum. The description here is not that 
useful.

>        - description: T-HEAD TH1520 SoCs I2C controller
>          items:
>            - const: thead,th1520-i2c
> -- 
> 2.49.0
> 

