Return-Path: <linux-i2c+bounces-5480-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E4C956579
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 10:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A4F91C21842
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 08:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770A015B0FD;
	Mon, 19 Aug 2024 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ChrBTBVZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D62115ADA4
	for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724055820; cv=none; b=s32UxU3vLrslRcwBxtAUoTjFbj+Y47FRxTAUeJgjA92gm8Ybv2MW9XxFTvkf1bIcNzkSBk0Go0kMr3zXq9QjBVn+kKGZ2N3c0wGri3QWG2WcW+RJepXLID+X1NbMxOEq93fuvHicSjq9helWB4THbkvMbBn+UapJFhLdTsRq+uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724055820; c=relaxed/simple;
	bh=kbDNaYfeN638CZB1xcia9reCdJjFXpCYzXtt0dZYcsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxdHOL0A5sBSrOybUNYCUyQcr0Ltd5GZpRTKOZ92iMOPKwubewNGEwLuMSAVzsjDvCp+sHeSIRHyBh+zLXXl2490yzW5hRn7IDI8IO98t8Eek7K06g/dXarJc6wu4C2bF8NyETtNdY4sx4tcL4wiKLxBgOGtby0uuENDsDOH1Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ChrBTBVZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428243f928cso32030815e9.3
        for <linux-i2c@vger.kernel.org>; Mon, 19 Aug 2024 01:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724055817; x=1724660617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rFFRqaLMAKXLToOtJy9WdY/znvYXwwMfNOAODqDhSMo=;
        b=ChrBTBVZTdTZXyv1XmRRePFmIGEQYUFDPSsCJVQGLtpSMWndh2ROnqumtaMqt1MwDF
         oohzdEE9+DTxa/tT/L4pt3eNm3iHIjcdkPdO2G+5p1xaSF/VGij1gdPTCRW5lfFodteH
         0/4ZDTRPGF7rmITf1lun3t/NFUwhnb06z53iDDKj2GgHEuS3pQ8Vp9vFIuA4NIfc8E42
         cpaxmSVwSj0eqmyZRhLHkcJr8AiYPOybDh8ipdutEsu8Hi/DSaxo1Ba5mkmXWVovCSM+
         exG6zcybPD4Jnfo4Ji3dR6ngDfkMFYkFQdEIUqy457a866Nj07u5qFqnqmCGcvUNRgcU
         EzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724055817; x=1724660617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rFFRqaLMAKXLToOtJy9WdY/znvYXwwMfNOAODqDhSMo=;
        b=hP5SxOgn3KWUJdNoC064l7GrYyEPXaBwWr8gBu3gjPPuhZ5v+RPoaMTxdRhrrztqB4
         rtNfMgeEjhXjNwpNUnMZwlk72uqgusmW2s1qO+iQJLWj4g9qkv3CJPSDlyFMAUydRQRA
         JIHrm7hX4e1cMhAkCOrnRfXr0S0Wys65Xr2EmvVRJbpad1ArZ9yPtUikHTPgAhWR0Gka
         5DXNpzj8MlbM4v4ujCCss5OKqkQyN9vd/gjAEtsXB59oBb21YifWLXAb0e1c7K2gEWl+
         BDc406IUvFu8/9+8jwBQ+Z4wwtgUXbKTcs3p5pc1M3vhpNaFvi3jOjVwDU1Hc0RWqtnL
         6sUg==
X-Forwarded-Encrypted: i=1; AJvYcCVDU58B62DjO3MpouBOyJgaWXPIjmm+/w1dtnS7Lh4UsZZUpEKs2CcjCfYGcIEXFtDpp8vET3DBsJlGVhxNPVxFhwLYnb+FW4RM
X-Gm-Message-State: AOJu0Yx+wej0dsBVR/P2ExFWCDJ3sUXvvsWGkbw3h8J/0YSU1+r2nC9m
	TZkGSvp+ug+50HjZC5ueaHhQjU/YIW0ZYV9+Ve+3/XbEH/ochj79mgLpVPGGvdc=
X-Google-Smtp-Source: AGHT+IGoPJX5KFTVTFHk/jojp0D2SHIUTsj+jz5BCHm6YGSsPInqjdE4c5SgCunL7XSQeKL6rhKr8w==
X-Received: by 2002:a5d:5442:0:b0:371:8c79:73c1 with SMTP id ffacd0b85a97d-37194317aa2mr6963984f8f.2.1724055816248;
        Mon, 19 Aug 2024 01:23:36 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3719485e2b2sm7908066f8f.33.2024.08.19.01.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 01:23:35 -0700 (PDT)
Message-ID: <918bb9e4-02d9-4dca-bed2-28bb123bdc10@linaro.org>
Date: Mon, 19 Aug 2024 10:23:33 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] dt-bindings: timer: rockchip: Add rk3576 compatible
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Chris Morgan <macromorgan@hotmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Tim Lunn <tim@feathertop.org>, Muhammed Efe Cetin <efectn@protonmail.com>,
 Andy Yan <andyshrk@163.com>, Jagan Teki <jagan@edgeble.ai>,
 Dragan Simic <dsimic@manjaro.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 Weizhao Ouyang <weizhao.ouyang@arm.com>, Alexey Charkov <alchark@gmail.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Finley Xiao <finley.xiao@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Elaine Zhang <zhangqing@rock-chips.com>, Liang Chen <cl@rock-chips.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-serial@vger.kernel.org, kernel@collabora.com
References: <20240802214612.434179-1-detlev.casanova@collabora.com>
 <20240802214612.434179-9-detlev.casanova@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240802214612.434179-9-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/08/2024 23:45, Detlev Casanova wrote:
> Add compatible string for Rockchip RK3576 timer.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

