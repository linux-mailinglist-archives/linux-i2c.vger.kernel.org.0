Return-Path: <linux-i2c+bounces-5777-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0486395DF0E
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Aug 2024 18:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5AAB28356E
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Aug 2024 16:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DF217B514;
	Sat, 24 Aug 2024 16:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6YJn7IN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EB22BAE5;
	Sat, 24 Aug 2024 16:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724517874; cv=none; b=WSAhbJtGOKYhqrwecD+DrmLNG9oN+Hu33UYWJDJ1qKq42KMz8srlN4ZTOHayHNyrnvpVyGhIvYE2ePYQAbwv0v/KXdxkDEThMu1CF5HX0hOzEMe644/XcFWTO8n7eRWW8XUyw6UzWvG9uOQjyrQnNeszyXOnrGpymlFgrncronI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724517874; c=relaxed/simple;
	bh=/9gX2XCk9FTMVcv7iiH7Odb5+BLxHlWeobR8KB9NnJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTeB2Yk+g787Js6qsy4TTMFMHvZpija5gO3fjOThHMGrsOtVTQ0rGydt8cj1xVyxo0O8KnQXBcbr5iRwguSpeidcujne4OnmO062gS0riqCbmJnYnpUqIUB+QGibFINMjYbF+aE3PYe+gi/7EbjZFG9/zYubHXmYZp0RSFxmlTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6YJn7IN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-202146e93f6so30626765ad.3;
        Sat, 24 Aug 2024 09:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724517872; x=1725122672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rMJqxsXbKdshmWc6Vt4OVDWOFw/ne4JO6chf1aTJxRg=;
        b=B6YJn7IN4UviFCnyISi5iPjuoFMKZ+XnRFFMeH/D/Lf3eNkM3tU7T3d2G5K0UeIzcf
         CXf/2Dqdo2c9CHqImVcuasFdu0j6t4porda5YZEFn/zDZfmuvWaCKYu8SJzlUAmRnxpQ
         Bp3anFm1ACysSXyy+SbJgqQFwteX/O47NUhol7cEHvH3K+6MgEIMV7D5Nj62jjr1BgBh
         YcZ0lHWqIo6SWQyGy4uXUD4xFQyTwxp+HAukC1LFWSSth8hAry2eO9Tkj7Mj6UIqzURs
         zZ13KXoUTuZzjvseifOZZKdGjV1y30BIWiKcJ0wQHE+qBgDTwtEMFEGjMPF2rH1nO7HT
         4Afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724517872; x=1725122672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMJqxsXbKdshmWc6Vt4OVDWOFw/ne4JO6chf1aTJxRg=;
        b=G74BI+VIE+wIeEAE07hb3GRa+mRg6oMRSHcPZ1k8yFVt+KQK4R9lIkDva6Cx/cyxX0
         v3FwtwE1zzEAm44vsYIhnCOrj0JzCMPajG9Ae2FvXgZykfceGcq6MZ09KnZUCjIgiYgF
         1z60Hg0toYoipxHU/tRPQK2HGm5aw6eMxdM4osJM0O0Hdx1lX473PSmrGMuKi0x9VEIw
         WbqDxQifFtGL8XRrgTb1zkfikbpjP/TxExig/bsZBysBU2AwsE6c53Ozb10Rjmh+4Llr
         foOG0EXefG7HjK+8iWscXWg77KlE1yx5vaio9PNPFt9oqq2QetV8ETFUbsM/MPIGFJ12
         jZUw==
X-Forwarded-Encrypted: i=1; AJvYcCUiraKJSLhtWa0HT9HbY59HIhdEN4ZOtltkM9PQT6lm9Yt0rqa5FjxespA7nLxHlriAOvhbATlL3T/u@vger.kernel.org, AJvYcCUmhP1RsolNeiSLQzvHnKJrSolKX70nIPTB2I9RuzUbPlXYLHJ6P+5xvskpTYU0aRWl0ji59zIY5kSM@vger.kernel.org, AJvYcCVJQBnivTBV3ZD9grOo24bSxF+N9PAwpM76y4addetLp0cXs4Vm1zdZBFAzf/KCwInpT/ZT2T5ewwVLVfub@vger.kernel.org, AJvYcCViu72jdGZPuojBX6rFQqwBSV2FWHHosTQUeseFNpOleaSHQAj/w2tOoe80cmxgp409FYhKJ5Ej0Nc8@vger.kernel.org, AJvYcCWGcP9jJRfxydDzh8Aj8/zI78eil+sOAyKazNfpe4BT/sLjoBrb7WAIOiga5Eb2zyIBg1tZjq/6x8k9@vger.kernel.org, AJvYcCXBcbgME9M+HE2wup/xF7HVG53cOqE2bhw+XWKzLfP29mqJ5Eje27Arl+N45QLQO7fAxbccKKRQpK99@vger.kernel.org, AJvYcCXzwTjFb5sszF0td5EDIHKKM2l9LO+Me/HVEqMiRk/gV1v/cfoGZIjUBbUuAFK1ycvoRS4Txm7WXH4I9wy9dyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsJHuFCHP1TRRoPdBgMMmwDhM5ov95yYuD85eM+6meae8Dhjqq
	Q+79wKL8nuCgi67dJeROvYRQ7EzFiFU2tcdd35K3UqtAu8w2cRxE
X-Google-Smtp-Source: AGHT+IHcYVQoDXdmHH2kSyn3hjnKQGyb2SXXwv2a+G7g13SX+ywaROxz6n48bYMEHtMXrfqxmEat4A==
X-Received: by 2002:a17:902:e750:b0:202:401f:ec6c with SMTP id d9443c01a7336-2039e4f1d23mr66486985ad.48.1724517872012;
        Sat, 24 Aug 2024 09:44:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385bdc5e0sm44114565ad.271.2024.08.24.09.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 09:44:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 24 Aug 2024 09:44:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>,
	Chukun Pan <amadeus@jmu.edu.cn>, Andy Yan <andyshrk@163.com>,
	Muhammed Efe Cetin <efectn@protonmail.com>,
	Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>,
	Ondrej Jirman <megi@xff.cz>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Elon Zhang <zhangzj@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Liang Chen <cl@rock-chips.com>, Jisheng Zhang <jszhang@kernel.org>,
	Jamie Iles <jamie@jamieiles.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 09/12] dt-bindings: watchdog: Add rockchip,rk3576-wdt
 compatible
Message-ID: <612a447c-8a74-48c1-8470-280dddca8d19@roeck-us.net>
References: <20240823150057.56141-1-detlev.casanova@collabora.com>
 <20240823150057.56141-10-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823150057.56141-10-detlev.casanova@collabora.com>

On Fri, Aug 23, 2024 at 10:52:36AM -0400, Detlev Casanova wrote:
> It is compatible with the other rockchip SoCs.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index c7aab0418a320..b5a3dc3770706 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -29,6 +29,7 @@ properties:
>                - rockchip,rk3368-wdt
>                - rockchip,rk3399-wdt
>                - rockchip,rk3568-wdt
> +              - rockchip,rk3576-wdt
>                - rockchip,rk3588-wdt
>                - rockchip,rv1108-wdt
>            - const: snps,dw-wdt
> -- 
> 2.46.0
> 

