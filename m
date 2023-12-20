Return-Path: <linux-i2c+bounces-896-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B998481995A
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 08:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35CC1B23114
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 07:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6F415496;
	Wed, 20 Dec 2023 07:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O0DBkvtC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65A114F98
	for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 07:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40d05ebe642so2203445e9.0
        for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 23:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703056961; x=1703661761; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VFm0fZZtlaUEgaN3vbfr+0Hf9St55gb5e4733yicIA=;
        b=O0DBkvtCGy5SlOvPURqWj5hdMVeuo2LlG+Yd7GIrfMDBCgqp/ZM9/9wsQ6LX8ZffVk
         vWu45V/D8tvVEYiM6eg18wjVA6b0BmUb/MS2Pj5R6k9LaaxohPscG3l0YNRnHanhKdHr
         bldNI4Bj6KRdd83xyhMilDKbAB3c537QiyHWmcgn0zWbj1uUaXkIokVopkQKClggwkXn
         PXVQget+jrrDbFVcXWjErWMkqTW+XIpaxBQxgkz7TlnpGyDuYAqoE0KJICxy882dUr/4
         QsDBSISk5PfQeWlc9eiyxjezP6fdiBkbBVIZNNZqtyIpbv/iX04CNK769dxAjK9l/Ofg
         8R3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703056961; x=1703661761;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VFm0fZZtlaUEgaN3vbfr+0Hf9St55gb5e4733yicIA=;
        b=boeSbivTRcj2Awh7JsKQ3oqH9cDUTs0GtiSeR72Q4gtidi3UA16YoIz9PaoDBx8aaA
         1BZNFdhkwt8O2f0Kaj9fBsUkex4bs78UaK7LA1WRTdHXa0LWt5YIw39aVvu+lhWrQodS
         Yy1qUJBFb/b8vwBs0RX+ljP5dFsbfjZP/ZN4VqqTht5WmCq6ufrEbGuojyaWsZ+Ta2do
         wTP8BbGWuFK+v7LBuFt5Vsx+xK5ie3Om0DgnNMyNodsmpPFg+hXZIOVCAZXHSYqbAsR+
         wvBF/YAeDTr1QgRvYnKvLq/9MSxsbEJXiIu8FWemsDcUOC6erHcOyex/Qxiazr4eqKz+
         hpMg==
X-Gm-Message-State: AOJu0Yz6K37ZVykQ98E8lbTGSG/pCWqzNzFFjZhRUv3PNXXnsYoTdXTW
	26/SZqEu0NVS1wUeAwEt69kdYg==
X-Google-Smtp-Source: AGHT+IHngcrBycRrNJoouS+Rqr6HrUWnTZlMEc5wfBOB9T2Md2tXATAf/epBKwIhCFVQGTljSdxRlQ==
X-Received: by 2002:a05:600c:3ba3:b0:40b:5e26:2372 with SMTP id n35-20020a05600c3ba300b0040b5e262372mr1159760wms.35.1703056961018;
        Tue, 19 Dec 2023 23:22:41 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id iv13-20020a05600c548d00b0040d30af488asm2916819wmb.40.2023.12.19.23.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 23:22:40 -0800 (PST)
Message-ID: <e80a06aa-bb44-4993-8e67-dbc910a409ab@linaro.org>
Date: Wed, 20 Dec 2023 08:22:38 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: add bus-reset-gpios property
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>, "wsa@kernel.org" <wsa@kernel.org>,
 Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20231115035753.925534-1-chris.packham@alliedtelesis.co.nz>
 <20231115035753.925534-2-chris.packham@alliedtelesis.co.nz>
 <f24b9b2d-aeb1-47f7-bf21-4383fdcf94aa@linaro.org>
 <5a52b0c9-8858-4f55-8dd7-9269c29c10a7@alliedtelesis.co.nz>
 <ZYHMvZ3plIQ0zXWa@shikoro>
 <601d07b5-264d-4322-b92e-63d58b3d69fa@alliedtelesis.co.nz>
 <ZYICEczlao+pg8kd@shikoro> <20231219232545.ksrxgvl7epeewga2@zenone.zhora.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231219232545.ksrxgvl7epeewga2@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/12/2023 00:25, Andi Shyti wrote:
> Hi,
> 
>>> I personally would like to see it accepted but it seems there are 
>>> objections to this approach. I've yet to come up with anything better to 
>>> offer as an alternative.
>>
>> I see. Thanks for the heads up!
> 
> I'm also inclined to have this merged. A real fix might take
> time.

NAK

If you intend to merge it, then please carry:

Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

The patchset is wrong and made of wrong reasons. It claimed GPIO cannot
be shared, which is simply not true.

> 
> Myself I have developed a prototype for what has been discussed
> with Krzysztof, but I don't know how much time it will take to
> get things done.


Best regards,
Krzysztof


