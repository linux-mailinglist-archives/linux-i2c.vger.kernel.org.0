Return-Path: <linux-i2c+bounces-5152-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 178B094828A
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 21:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 422531F220BC
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 19:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C496C15F3FE;
	Mon,  5 Aug 2024 19:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJ6NX7jW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A34214A85;
	Mon,  5 Aug 2024 19:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722887262; cv=none; b=cCqUIpQf4/pvQrS58hDORliOa7AROLdm4JAq+FymajqGOaD+AJs24cUSjNOpITA4QiQmcC1niEkRZQ1XefxEU3JxGnExswi/YxsqhB2VNgwYcq+om5wDnaRqrazhE0OD1yLm04yJ7KpNfe0NsI5KoFj6WM+RFu2xMqyzp1Va7Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722887262; c=relaxed/simple;
	bh=cuyjByXL2D1AJd9a3vQq1EBfMAign6H9/NzGZnl2f8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XendaSTSbBA2ZzjBuSVv7lQqEFkwWhjzr9eBVtmQqejsoU8yNmaAeHvrwG1IFaY3zYmSj+Fppa6aVP4Jri3/7DQGjRQyrfGvlAoZR8hXB1dJ04ZCQePM7sq8bBY4jrCgyCPGI3+4PHf8pa+fCQomoPfX7aY9zcHJjxJj1+zi8Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJ6NX7jW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F779C32782;
	Mon,  5 Aug 2024 19:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722887261;
	bh=cuyjByXL2D1AJd9a3vQq1EBfMAign6H9/NzGZnl2f8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nJ6NX7jWM1JONW67LYY42jJxw3wA9172UTFQsJ2D7BI3J9AwJfNUU9ZTapIHEDTTH
	 fP5cId5pTdCdTTNfI8GZjRIGthHi4si8FzoPbqsOs8UvTYwC0EuuGYdVJSoaPgrZ8f
	 rhbMPyMA+VgQy8RA0L+JA5BNCo6RmEyNIR1NviZqNtC7EjoY7jJe+QsjulMbvVATnN
	 vUMmF86CyN9kA//qJldrArAvvoh15wMemsH/4bzT3HQ1zlN3bdtHZcs+wsDDp498Jm
	 BSKIcgux8O95t9+lG+4WkJOZ/BsGBxEvdrl0WLqcFxFy8Fdfgad4GeVMlen0ad4COF
	 fFwka+Tfmelig==
Date: Mon, 5 Aug 2024 13:47:40 -0600
From: Rob Herring <robh@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>,
	Muhammed Efe Cetin <efectn@protonmail.com>,
	Andy Yan <andyshrk@163.com>, Jagan Teki <jagan@edgeble.ai>,
	Dragan Simic <dsimic@manjaro.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Ondrej Jirman <megi@xff.cz>,
	Weizhao Ouyang <weizhao.ouyang@arm.com>,
	Alexey Charkov <alchark@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Liang Chen <cl@rock-chips.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-serial@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 02/10] dt-bindings: arm: rockchip: Add rk576 compatible
 string to pmu.yaml
Message-ID: <20240805194740.GA3188010-robh@kernel.org>
References: <20240802214612.434179-1-detlev.casanova@collabora.com>
 <20240802214612.434179-3-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802214612.434179-3-detlev.casanova@collabora.com>

On Fri, Aug 02, 2024 at 05:45:29PM -0400, Detlev Casanova wrote:
> Add the compatible for the pmu mfd on rk3576.

Typo in the subject. rk576?

> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
> index b79c81cd9f0e6..932f981265ccb 100644
> --- a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
> +++ b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
> @@ -26,6 +26,7 @@ select:
>            - rockchip,rk3368-pmu
>            - rockchip,rk3399-pmu
>            - rockchip,rk3568-pmu
> +          - rockchip,rk3576-pmu
>            - rockchip,rk3588-pmu
>            - rockchip,rv1126-pmu
>  
> @@ -43,6 +44,7 @@ properties:
>            - rockchip,rk3368-pmu
>            - rockchip,rk3399-pmu
>            - rockchip,rk3568-pmu
> +          - rockchip,rk3576-pmu
>            - rockchip,rk3588-pmu
>            - rockchip,rv1126-pmu
>        - const: syscon
> -- 
> 2.46.0
> 

