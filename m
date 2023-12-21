Return-Path: <linux-i2c+bounces-927-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 268CF81B220
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 10:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48AF01C235DA
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 09:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B5E4BAB3;
	Thu, 21 Dec 2023 09:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PzoE/Qrs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31654BA92
	for <linux-i2c@vger.kernel.org>; Thu, 21 Dec 2023 09:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-553a65b6ad4so707759a12.0
        for <linux-i2c@vger.kernel.org>; Thu, 21 Dec 2023 01:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703150028; x=1703754828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qskE60hERGmibIUEHX5TLuGnIvoAmwksGtaBHZkrRl0=;
        b=PzoE/QrsHmtNBGHigOKiwQ7smRYgHG+4U/4KOdoF/rkdsUVpRUmqZScpCEe6v+ury8
         /1l6FOiH4U1CEQlfX5BH18XJdCs2caZa9WhiAh08JlMN0BRZmRxXySdQzfOCKqdO0tDK
         W0Us2WYAav3cpeMMPUFgSG6J2rGH+LKI1uStW/5YmTZab0VV8RvLxYByqOQ7xxTovrTF
         gAxKcyK2eJxYReHKyCfq8WZH5026Zvsa0JNRzIVq794NzqZGNiludb66pHb71qZ8Ox3u
         ++oYIfMcV5pfL4n18yYh/pSTkVMJwlVeqmIwtGdkroNCR8MAuXAhysEkaThhHn4WcYxR
         c2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703150028; x=1703754828;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qskE60hERGmibIUEHX5TLuGnIvoAmwksGtaBHZkrRl0=;
        b=jcwHLzjkuwysX0CAZcI3Y360OkJzOMMMObG9O+kPyOtlxm8N1BNGuLZpgMvwphFTqB
         z2DXVOxLvzNaP/bJ+K492v6GnmuukCas/2evE0BCMYoEhuRoeIwAMR9yGul9y7TO7ZJU
         881NemT22UaqPXmqkcoO0sCxCLupDoPk+kI06kA4VpSqsJvHdq317zs6kb5r2eLzqkBv
         J1qbsIwvMw2N0rk8EQNwajFvAka+KJnio5Xf41nvRIwoJ1KGG2n0OtELEYriFIiIOiTa
         PXctVXsKcxMju7Lc7pBu+zM915P3+xxGGr9tVw6OL1ptL/Ip0MDAOKC+XNFndoYMxowv
         QEzA==
X-Gm-Message-State: AOJu0YzcwMvDIp8e/6aOHT5zG68nNva1Mis3SlwFpUkcjV7GXYaUUF+c
	AEd5EOYSu0g4DkEC58J4uUJxQw==
X-Google-Smtp-Source: AGHT+IHSA9gKzWIah2AwWkX03H61vJxbWtPPe0FuJWHwznKPbHIr/KQ2g7out+AdbMiT8lBaQuz2AQ==
X-Received: by 2002:a17:906:24a:b0:a23:6244:8370 with SMTP id 10-20020a170906024a00b00a2362448370mr2778742ejl.142.1703150028204;
        Thu, 21 Dec 2023 01:13:48 -0800 (PST)
Received: from [192.168.0.22] ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id lz2-20020a170906fb0200b00a26aa845084sm201964ejb.17.2023.12.21.01.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 01:13:47 -0800 (PST)
Message-ID: <497e6eda-a416-415a-b468-fe764c14a8aa@linaro.org>
Date: Thu, 21 Dec 2023 10:13:46 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 1/2] dt-bindings: i2c: pca954x: Add custom
 properties for MAX7357
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Rob Herring <robh+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231220082803.345153-1-naresh.solanki@9elements.com>
 <ZYNTfKLFGrLq8qGY@shikoro>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZYNTfKLFGrLq8qGY@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/12/2023 21:50, Wolfram Sang wrote:
> On Wed, Dec 20, 2023 at 01:58:01PM +0530, Naresh Solanki wrote:
>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>>
>> Maxim Max7357 has a configuration register to enable additional
>> features. These features aren't enabled by default & its up to
>> board designer to enable the same as it may have unexpected side effects.
>>
>> These should be validated for proper functioning & detection of devices
>> in secondary bus as sometimes it can cause secondary bus being disabled.
>>
>> Add booleans for:
>>  - maxim,isolate-stuck-channel
>>  - maxim,send-flush-out-sequence
>>  - maxim,preconnection-wiggle-test-enable
>>
>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Rob, are you really OK with these bindings? They look more like
> configuration instead of HW description to me.

Some explanation was provided here:
https://lore.kernel.org/all/CABqG17g8QOgU7cObe=4EMLbEC1PeZWxdPXt7zzFs35JGqpRbfg@mail.gmail.com/

AFAIU, these properties are board-design choice.

Best regards,
Krzysztof


