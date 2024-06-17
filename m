Return-Path: <linux-i2c+bounces-4053-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F3990A510
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 08:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C05F728AAAE
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 06:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741BA186E46;
	Mon, 17 Jun 2024 06:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iropJvpB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC331186294
	for <linux-i2c@vger.kernel.org>; Mon, 17 Jun 2024 06:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718604702; cv=none; b=DcSM9HaHe9xajvvawTdv2svdSux9rKsqb+DBpiRwLKz38qsH6dJDklNz2efxAvsb8QEGBsypzyuOnUcmoZ5Sl7agLbL7HDER5yyDydTwIstlZj6xvRb14mg5+a6IdPe9ohmQsS/wzyMydo8DBdL9GFA2gIbZtYv3W/mCHLatd4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718604702; c=relaxed/simple;
	bh=vpGyn37HoKQU9ZCMZp6hhzA0NMH1CjBNZyXDjfo6eko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D44K6i9Hk76Pe27LPsasAOE79/tXsOEe5rWEUxtVVSUlVAz8N4EGF8WN09ChpmrHMZ2G5LCyrInEozsNOSLaq0Eic4oBBhKGZ8SdK7sT0Whpyxd3ydhbxeM9oVcyx0ttyh9GlE1qap3K1+Jg2uGjBavtelYURfD/geaN0haprOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iropJvpB; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a63359aaacaso606810266b.1
        for <linux-i2c@vger.kernel.org>; Sun, 16 Jun 2024 23:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718604698; x=1719209498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9kdEToaRtEtLTBxGmIJLoLouOnpDnXZ/+scsxAQ6PL4=;
        b=iropJvpB80NHSkPQ+AK1Vck1hKZY+2H1OvP6BngXOAGFHZjzKjKL5FHs9LyReeCnGx
         fAd5v++dzQkw6tqifub5aMpjA+TYKW3dhc8m4zFi4BCF+B8p288hzmXhlaYLjMv5D+tC
         Jhb3P3tkzMOwR2rzyODk2gPJkGXd+a3+GS4IuXSTdpamJD93G8n6Fd8C/+DuaXdrg8fV
         h3H88wbrl3b4CN/7/NO5TtH9fdDaS0FhbUHDM8/fVt1Xi/zn0g3lUXleiwvPcglyDiaE
         YedlA0x6Pt//N/9jE7hDK4JRcv2s4CR48lfLJl/VwSfR7CaDZJnJqic1CAb/6NK7BrnB
         A7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718604698; x=1719209498;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kdEToaRtEtLTBxGmIJLoLouOnpDnXZ/+scsxAQ6PL4=;
        b=UufzE3qCVRpkgyVKLa+108dzVwa2uLk0H8soK9WhrQH0KI/cI9jT+fdRtks/a1EEEl
         W3zI93wU4KTLwSQqV9hqcA43HkbzBQ7QFrd15VYSvx2wCxzd68hBXuHwPF5hB7kKNlC7
         vIOjyXDrxW2osCfj9eTHNsJ1ElSuT/J64UFcbk8hiEKsnMmXfVTIYP6EIKyWNQDBn5PM
         jbEEXt38tEJJSXSvCwbDqou/Mlim7OVYvE6pkRMW2zd0iy99GhhPpxMrctUcDaot+YOf
         oWK0JAL/xpQGLwuAFVHXfAeL90D7p3PF+Zn7JlmXrTPaTA6Z+omFBcfakUkSFmu9VZfn
         K/Ig==
X-Forwarded-Encrypted: i=1; AJvYcCX3w54qdsDp2966oLcs6bOq8MR/FmblZnu5TT+e20CQyC3BJ2OIDPJ6E67TF0m/5aw08vP4N90PYPZmFVx1Vf83NBNkbwI0aIfo
X-Gm-Message-State: AOJu0YzToDJs5EdU6IOyrG+FofFxtx1nznuGsIiaDB127fKeCxCTEabP
	5YDceOGxi+E1KaizfhhzhoG4bkbTutJOPeUm1hrzbw3Xm/7M1s77QqRC+mAq+jQ=
X-Google-Smtp-Source: AGHT+IFRvJX2rYvRV7Pzan0qIx7xvzoBrqprat8773thSOqIPo4ExMRRUq3jvVxaxcAt7mqtQO0Mkg==
X-Received: by 2002:a17:906:c29a:b0:a6f:5957:7b8f with SMTP id a640c23a62f3a-a6f60cefc2bmr570704666b.11.1718604698066;
        Sun, 16 Jun 2024 23:11:38 -0700 (PDT)
Received: from [192.168.0.18] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56db67e5sm480498766b.66.2024.06.16.23.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 23:11:37 -0700 (PDT)
Message-ID: <0fa211df-5786-4447-9c8e-1c57528e8582@linaro.org>
Date: Mon, 17 Jun 2024 08:11:35 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: drop stale Anson Huang from maintainers
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>
 <Zm9ZUWpievH+P8Yc@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Zm9ZUWpievH+P8Yc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2024 23:29, Abel Vesa wrote:
>>  
>>  maintainers:
>> -  - Anson Huang <Anson.Huang@nxp.com>
>> +  - Shawn Guo <shawnguo@kernel.org>
>> +  - Sascha Hauer <s.hauer@pengutronix.de>
>> +  - Fabio Estevam <festevam@gmail.com>
>>  
> 
> For the clocks, please add me as well. Don't mind having more help from
> the others :-) . But i.MX clock bindings usually go through my tree.

Sure, makes sense.

Best regards,
Krzysztof


