Return-Path: <linux-i2c+bounces-10149-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 535D4A7E06E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 16:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 335911891D04
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 14:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCD62C6A3;
	Mon,  7 Apr 2025 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aygh3qc8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8B5250F8;
	Mon,  7 Apr 2025 14:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744034419; cv=none; b=WBI6tOIrXoq86GVuGiSYExgaOjCYyqCKXiqkkk0or9s8/oiBH87VBESMSMYfROQ8KwvhqNuDlkSXp9ERAOPqdiQX/zy0xvU/whl2gYFA95At9TZZDUQ+joTrFm/0Qx2tQfNc522u1RS5p0pgGX0gzRuG++8wx/tHVukrJemeb8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744034419; c=relaxed/simple;
	bh=5Cal73TGm2lWIHNlKA2mCZV0gIkjUPC5RFYDmMsmJfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXMPwzkB5MQfnB8foh221ocstOrzvOBwRsyGDO1Z31/itNLe6jhUIkEyYO+sQGz+yr058cS/T88lDEpDwdVdbJMDCxGoE4lxF5iTJFzUKMXK8nRRIc4D4rnRY0QQcsu1ydIfiGzPtodeT4Lt5TBfgCRV2RuKLU6LgOBfB+IZKN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aygh3qc8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DD2C4CEDD;
	Mon,  7 Apr 2025 14:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744034416;
	bh=5Cal73TGm2lWIHNlKA2mCZV0gIkjUPC5RFYDmMsmJfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aygh3qc8NZeS9Y6m3Ubad39D8XuI9IH4E+efd5uoNMIDRgvJXxXAu7w0vxY1xwovV
	 a1jg1BJ3h8hIYFl/rpsra04LUnbZTfkaOayuERL2stUyoZAv1Uszwu1wau4Zj4MePR
	 VhzCZAeF8Orc6Vov5nF2/SItSsh/b1MfQMHaFq2FK5Ol7/+XKz1RO2P97YkilplU4p
	 hBR6E4yrWrB+tPTtXcm+xKrhwcBSD9L/jhKo75033UGI7DIRF9U0QkuZf6PuHLYuau
	 uaiTtqmdpU3yokh3Jix8UgpjPbh+XYjUO0jMrGcNZJHkVUGaqWE82e5ywhPFMnoJ/q
	 cUaR//orv61lA==
Date: Mon, 7 Apr 2025 09:00:15 -0500
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
Subject: Re: [PATCH 6/9] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo
 SG2044 support
Message-ID: <20250407140015.GA2164748-robh@kernel.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-7-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-7-inochiama@gmail.com>

On Mon, Apr 07, 2025 at 09:06:11AM +0800, Inochi Amaoto wrote:
> The sdhci IP of SG2044 is similar to it of SG2042. They
> share the same clock and controller configuration.
> 
> Add compatible string for SG2044.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml        | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> index e6e604072d3c..47b5fc1b8e07 100644
> --- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
> @@ -19,6 +19,9 @@ properties:
>                - rockchip,rk3562-dwcmshc
>                - rockchip,rk3576-dwcmshc
>            - const: rockchip,rk3588-dwcmshc
> +      - items:
> +          - const: sophgo,sg2044-dwcmshc
> +          - const: sophgo,sg2042-dwcmshc
>        - enum:
>            - rockchip,rk3568-dwcmshc
>            - rockchip,rk3588-dwcmshc
> @@ -74,7 +77,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: sophgo,sg2042-dwcmshc
> +            enum:
> +              - sophgo,sg2042-dwcmshc
> +              - sophgo,sg2044-dwcmshc

No need for this hunk because the new one has sophgo,sg2042-dwcmshc 
already.

Rob

