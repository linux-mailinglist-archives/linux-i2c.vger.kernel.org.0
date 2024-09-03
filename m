Return-Path: <linux-i2c+bounces-6086-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D16C496ABBE
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 00:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B46CB24AB3
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 22:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6291D7E38;
	Tue,  3 Sep 2024 22:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="UJ6d9rvw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11911D5888;
	Tue,  3 Sep 2024 22:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725401158; cv=none; b=urL6IoSAzJiYduqE5DtQt9/x8Js600U1xRC2LrIPXZkp6dwykuxOXrarN14JMLWlG1C0Y3MfYtS4tKmo0wiaUzY0YL6e2iwDLLRA3n7RLoqVcOhcke/bs+EiMEBg3cuJrkSWWz2hQnQM3qZThd5HLGiGvtklY5B82S5JcRfkOKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725401158; c=relaxed/simple;
	bh=7mSKjwLzA34ByhrzhEwsUio5kUzedwA+6MdTS6rsv/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mboplwc/rn6WDR3ovF9QjmyFCf76q5ypypKNL+n+v7PE6Zx4U9f63/2v2Nc0Zgh26DjlyQNLgngK0ido+XOjn4zhzw/QvATSUta2KmcIoQ9sBVPmwonLVkNCuERuhtr7zOa00rwEM/9SQr4XlLJ2HFxg6sEUtf6ws9Rn/T1faiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=UJ6d9rvw; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zVCmXSBgGH45TGzVQauZeSkk4FJQrMdIydcec60+Ymw=; b=UJ6d9rvwDpo5jp52cvOAtIkq4N
	+FJQfDB6qS7b4JTEvM2fBGIY1pM4uM2QAoLg5UI/yal0a6ZnETiKddo1W4xUK6X76Ux5tktLtKNE2
	vSffdP/efPw0JiLy8w1ZTiGbAVtkhSajLfeTlf5u3/ZVwdbKScOMwussmW7naOCUQMd0FL4pC0yOh
	MNANJn9zZAjMBk6hsXBR1cPNRc5ZPdTvOijitypyDr8um3cucxYrsvnNLirpwJpWWhK2IpXmvQiCf
	qZfO3LB3k7zjiZBjRJwLQTTLopJpw8yudm8LrJMQY+ZTtFfEReXf9ZgzOuFvWxcYQHjvFAXgEfUyv
	a9OTI+LQ==;
Received: from i5e860d0f.versanet.de ([94.134.13.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1slbeF-00038J-SY; Wed, 04 Sep 2024 00:05:15 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Chris Morgan <macromorgan@hotmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>,
 Andy Yan <andyshrk@163.com>, Muhammed Efe Cetin <efectn@protonmail.com>,
 Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>,
 Ondrej Jirman <megi@xff.cz>, Michael Riesch <michael.riesch@wolfvision.net>,
 Jimmy Hon <honyuenkwun@gmail.com>, Elon Zhang <zhangzj@rock-chips.com>,
 Alexey Charkov <alchark@gmail.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 Jamie Iles <jamie@jamieiles.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 3/9] dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible
Date: Wed, 04 Sep 2024 00:06:59 +0200
Message-ID: <35214848.ATrlOLLGV9@diego>
In-Reply-To: <bnpwnuhikwkqyf3jos67qwywhfge3vm6tfmlfitypd5k62jzdn@fri4swkl2zbq>
References:
 <20240903152308.13565-1-detlev.casanova@collabora.com>
 <20240903152308.13565-4-detlev.casanova@collabora.com>
 <bnpwnuhikwkqyf3jos67qwywhfge3vm6tfmlfitypd5k62jzdn@fri4swkl2zbq>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andi,

Am Dienstag, 3. September 2024, 17:46:00 CEST schrieb Andi Shyti:
> On Tue, Sep 03, 2024 at 11:22:33AM GMT, Detlev Casanova wrote:
> > Just like RK356x and RK3588, RK3576 is compatible to the existing
> > rk3399 binding.
> > 
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Acked-by: Heiko Stuebner <heiko@sntech.de>
> 
> I will apply this after 1 and 2 have been merged.

I picked patch 2 now.

Patch 1 should go together with patch 9, but that will require the other
binding additions from this series.

So if you don't have reservations it would be cool if the i2c binding
could get merged. The i2c controller is part of the rk3576 soc and it
thankfully also is just the same as the rk356x + rk3588 soc variant
as Detlev wrote in the binding.


Thanks a lot
Heiko



