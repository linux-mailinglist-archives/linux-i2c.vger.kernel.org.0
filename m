Return-Path: <linux-i2c+bounces-10317-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8548DA878C4
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 09:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC57C7A4E3C
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 07:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70F11DC1A7;
	Mon, 14 Apr 2025 07:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fo/JuIFI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82500539A;
	Mon, 14 Apr 2025 07:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744615937; cv=none; b=qvrKaaSx0iGV5/V6/E05t4KK/qMf9yjOAiEsFMuS7BcU7epLC7WiApNDKpKIT59HqJuRlMphmn+3jLP+V5VxK+HHCkvw7XTOEiyHB13SvdH+ytsoXWb56iTf2m/xCUz7GvczsLto2yBf0f8YUuLoSIWQ5SZIFiqlzJ399672LzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744615937; c=relaxed/simple;
	bh=RLi0xcDFC0POZyCjRcWUAUkI6UXBaxE2GsFQ2nAPD6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qwURcxRkg0f8OQTc0rUBTQQef5+bcaNj3fvPlqKgn5bN5ip32jsHZwX1s3xM/9ShCmeyO4XUvY4I+S7EPsbbtoXknXcw0TBkzBrbNKhdFTj6XQp14ho1LC/ONLXZ6ld6EyjudMdUSy1NZe0Z7uNVpttiHIYXLUqw04bEAmxqtjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fo/JuIFI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F94C4CEEC;
	Mon, 14 Apr 2025 07:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744615937;
	bh=RLi0xcDFC0POZyCjRcWUAUkI6UXBaxE2GsFQ2nAPD6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fo/JuIFISjKZlyesPpSbbr776bFBfLjQmABhSc/bKJ3RrVh7ZNGshiWObc3MB4ZM5
	 HHXjT8l9/JG+19xNMyEYUeHgXcbe5bFYY4Ol2EK0NqXOa+2uX9EN0POyPWWd3XtnzG
	 6ldG+qsok2HpxaKQDhxcT8IAmRq6VPvPRelLWnC+c4CqKE6gnVUyocqXi6jlSFEC6j
	 MWW74QXYnfMBcv0nK+A3iQvkFVy9DG8l1q+/Ma+LBAvcEAdvL0uyz1JLomWD4J1qSE
	 WKE8jFDuWdxZuuvAoOq1V6maND/EB2Aq3d9XWJGKPlYBJR9OmvcmUM34DTAf3OiM5o
	 BY5EGH0tjDNag==
Date: Mon, 14 Apr 2025 09:32:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 07/10] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo
 SG2044 support
Message-ID: <20250414-slick-vulture-of-awe-fa658f@shite>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-8-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250413223507.46480-8-inochiama@gmail.com>

On Mon, Apr 14, 2025 at 06:35:01AM GMT, Inochi Amaoto wrote:
> The sdhci IP of SG2044 is similar to it of SG2042. They
> share the same clock and controller configuration.
> 
> Add compatible string for SG2044.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


