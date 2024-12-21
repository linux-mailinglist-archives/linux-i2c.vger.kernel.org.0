Return-Path: <linux-i2c+bounces-8679-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5819F9F95
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Dec 2024 10:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30CAF16736C
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Dec 2024 09:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757831F192A;
	Sat, 21 Dec 2024 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MW1WXWkE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B931DF979
	for <linux-i2c@vger.kernel.org>; Sat, 21 Dec 2024 09:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734772426; cv=none; b=lNbRnW1ItR8No0cDorDJe9cFwdQhzXILm1Jx6JrXgJj3Q+rJfzOBjYbSeLwMTqJ1UdOp1Yv7O14mHiTORP+44C6Roo5F1L/06CGsIqSChKgVP2GpLmjIvAI1o4VwQVQNOhu11s496b2/7ygZaaSKiz2PFuXHhWEdHnVFuuQoInM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734772426; c=relaxed/simple;
	bh=Lj8kx4Y9m7dctN6JoafVbfe5c1zY4WJZ+HfAcFW3mrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LkygNiA0qZ0bYUE5O6B5cuLSkXQPpf5ira7ve2Bf8TUZtviEqIC6FQtHsy+5LQDXU0hRCWE+jBc/pnMpSkTp2Kc4DMHpFd5EJdH6L93WWJvSnldQ0ZfBWqNuKKo1dl6/SOrR1f/FmV5OHxb0tFAMHRB/mX2hMsUTv7v/bWXIkY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MW1WXWkE; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso420690766b.3
        for <linux-i2c@vger.kernel.org>; Sat, 21 Dec 2024 01:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1734772421; x=1735377221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c7wkqfB5c/L++/PfkfJAIAEdiIVKbbltJZ6rUt2xDhc=;
        b=MW1WXWkEl3mNpF1ukgeHOLAJCjoHX4KUEDx4zDYV68sjTilI3nbzN+Lpj8OxIzQ4lY
         g5aoh5UpxtVnObFbNhk5l0kdfCzSpt1dGRJFRJ0Rk2VxQkDXJpDmd2+leM8jcpZW/qGP
         gjGzsFRC9ORLMqMeCKQ8p8Pigs1XJ0tu1TADy1WzyBgjfhG2Shqssy7pqtIseUnbhHwO
         2tCm4oghcapRWIEGfl2U9PWp2oYQBTwcFUzd8l7d61tE9JdtcpE4h39EO57/g2aSLpGa
         oHbzcHLKAPEdTwrRAQjb4PS3+1DsCrVZYugAYjEY407JOO/2ZdaSwh9wNxlkAkbrqXCd
         95bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734772421; x=1735377221;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c7wkqfB5c/L++/PfkfJAIAEdiIVKbbltJZ6rUt2xDhc=;
        b=dRaN92N7iATLSKSI+kq1UEjuwlJU/Sb4gb/fM0TrgrwSj9ca948Zhm4nGru8RWd1Ms
         dCfpqu9GVAVBx2CwWmd84kcW6K1T4HhXhMwXqWCwCQNf122WXsBg0QxYAJD/Lco0pICE
         Jme2sj2WJlTi7mdn+5CTDBYZrlwKTc48gNqaCMXDTmsk7QUXpwFjc+1LVMR3WCPce/hs
         U+uXEkKK+ZOtYgbEXl4pR5qtY/OdCtELWWqs8ThsoCUXm3yBbZo//1s1nDmWqT9AnyX/
         aUALAJD1u3nVL6ctwyfRdVZAfElDMnc82KFFqkUA8t7208FVmjZDmWFNl8PSfipkhEE3
         QSGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiqPrYh8dS+Y+UmuZyJgKn6wXJTCJSwJxTMyaXxPY6bvKT5oo9JRMN5J6m1y19c5VZYv0swFZGxEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxDaLRD6apfxfTC3/OCY2VF6/yNW7czNdT3RIFR32pzg/UHH9g
	YLM5LfNkyeivHbd7CR6e21OLzGK+cgolpnTo9FVxwg80K+GfKkRBJ4xAsqd6gK9JEAGGIgxjR3K
	O
X-Gm-Gg: ASbGncuazGbj0CUoG9DGSWvq6Nud8QwpcQxntjcqMrTth/0qjGKEXsqEU8yBbvdEuyU
	vcWUzFt8hrq2woCgo3eZHgdWB3HZ9jTjJdBVO7uLla216DKAXQxHP5ljmDsZC7eQTGGDnrGkeYj
	txuhMkElxG7wlbUgc4A9WNYt4+TWaPrF60idb8aCX4kvtuxqw5YZ0tSdD6hNhzcCKW3i9PsN1vF
	v88pkUNaYzf9Rwuo8xh8XgAOejzYrDxeBze0J4ptloJbPjjgoa37MiO3lcHRRp4Ow==
X-Google-Smtp-Source: AGHT+IG/UdUBKmFciOfZW9dMWRtaTXpcaIz9XIPHAn5lrbstD9Tb6jn1ZgFLja5AzW5NdsZcXutlTw==
X-Received: by 2002:a17:907:9490:b0:aac:4ed:b4ec with SMTP id a640c23a62f3a-aac2ad8ab93mr528883966b.14.1734772421023;
        Sat, 21 Dec 2024 01:13:41 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e98f6bcsm260759466b.77.2024.12.21.01.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 01:13:40 -0800 (PST)
Message-ID: <5242fffa-c028-49dd-a7cc-b6d9330f3c1c@tuxon.dev>
Date: Sat, 21 Dec 2024 11:13:38 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] i2c: riic: Implement bus recovery
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20241218001618.488946-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18.12.2024 02:16, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Implement bus recovery by reinitializing the hardware to reset the bus
> state and generating 9 clock cycles (and a stop condition) to release
> the SDA line.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Used single register read to check SDA/SCL lines
> ---
>  drivers/i2c/busses/i2c-riic.c | 100 ++++++++++++++++++++++++++++++----
>  1 file changed, 90 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
> index 586092454bb2..d93c371a22de 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -50,6 +50,7 @@
>  

[ ... ]

> +static int riic_recover_bus(struct i2c_adapter *adap)
> +{
> +	struct riic_dev *riic = i2c_get_adapdata(adap);
> +	struct device *dev = riic->adapter.dev.parent;
> +	int ret;
> +	u8 val;
> +
> +	ret = riic_init_hw(riic, true);
> +	if (ret)
> +		return -EINVAL;

Any reason for not returning directly the ret? It is true the
riic_init_hw() can, ATM, return only -EINVAL in case of failure.

Thank you,
Claudiu

