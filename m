Return-Path: <linux-i2c+bounces-10114-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 197DCA7D1E7
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 04:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF99E16BEA2
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 02:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCD8212D95;
	Mon,  7 Apr 2025 02:05:30 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0389620FAAC;
	Mon,  7 Apr 2025 02:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743991530; cv=none; b=AJ3IFkngbc6CVz9qQZzM3zIcXpcnlng22tZUOFns4+vl7DFLbDoixcewyUK9bPEy6CFw7ENzA8GxroKku7rV6Y5QfI9dvQLo3KC6EzqKauMy0FuhBQflkMcq1DINljMw5Wsp0uRUAxQdcuKhzmL2mpU1f27aneZzAm2bR9cngaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743991530; c=relaxed/simple;
	bh=rkZTODZb6aPwXGNik7ZuYSkufnOcke86tG/qQVi0z1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ln8O7TfnURubhPWWOMPuXm3ei5x7mzasjE5rbrxZtValkaSHZIihUcEqSrjJ7yfM90vAxerGg489ZbQOpnF3g0boxlQvrXQR8hJdHTEEO6+t9ezUN4tqPBpevPtNGCa6Ds2DPvZypGK0QRwzt6GDSi97WIxp3GN7Qkma9bFF9I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 87F92340CBB;
	Mon, 07 Apr 2025 02:05:27 +0000 (UTC)
Date: Mon, 7 Apr 2025 02:05:17 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
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
	linux-mmc@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 5/9] dt-bindings: hwmon: Add Sophgo SG2044 external
 hardware monitor support
Message-ID: <20250407020517-GYA13159@gentoo>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-6-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-6-inochiama@gmail.com>

Hi Inochi:

On 09:06 Mon 07 Apr     , Inochi Amaoto wrote:
> The MCU device on SG2044 exposes the same interface as SG2042, which is
> already supported by the kernel.
> 
> Add compatible string for monitor device of SG2044.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml  | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> index f0667ac41d75..b76805d39427 100644
> --- a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> @@ -11,7 +11,11 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: sophgo,sg2042-hwmon-mcu
> +    oneOf:
> +      - items:
> +          - const: sophgo,sg2044-hwmon-mcu
> +          - const: sophgo,sg2042-hwmon-mcu
> +      - const: sophgo,sg2042-hwmon-mcu

the compatible added here but not used in dts (or driver), e.g 9/9 patch
I'd personally prefer to add it when actually being used
(so it can be validated in the real use cases..)

another concern is whether better to just use 'enum'? (maybe not)
but I got your idea to fallback to compatible of sophgo,sg2042-hwmon-mcu..

same with mmc, i2c..

>  
>    reg:
>      maxItems: 1
> -- 
> 2.49.0
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

