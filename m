Return-Path: <linux-i2c+bounces-5570-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BC3957FB0
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 09:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F4C61F23697
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 07:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4222F154C15;
	Tue, 20 Aug 2024 07:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mxqQwMDK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE63132124
	for <linux-i2c@vger.kernel.org>; Tue, 20 Aug 2024 07:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724139157; cv=none; b=abwLHkqiA0jv0GVUTJEO5vcueaBg11tJ2SKf4w3UD+Jf7w6bbzgc2Kwyeam0pQiKq3jz4fq1ngKWez1DkSCSur1LGoug9IR6VjS70WQWlrjSLcZB10N/12MHTvyWg0zj7utDmMqM17Jo4uvZgtF61cBC8duYzLY3+d4qxVS7M2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724139157; c=relaxed/simple;
	bh=T37XdcPAhagA4eDYDownsf2XsJs98bfRZyVq01bf9Dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4E0kkxBManYBzvl9JOxe1HXPsutYWVCkw7vaFex7OpxXoRLDo+h3j2xEpsLESAdYffN+VEx6W0EQoLS8jfWTGudqabTStF7IrkdtFW2Va06SMfsirL2BpMtQABEZ2Q+L0JFP5m7bZvB1caodYxohcdtTFvZv77Aodp7vu0q4Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mxqQwMDK; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7a8a4f21aeso627069266b.2
        for <linux-i2c@vger.kernel.org>; Tue, 20 Aug 2024 00:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724139153; x=1724743953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KgM+QzWQcZ2DUZR7KveS9LeXc/9kicV430vfS4VSRd8=;
        b=mxqQwMDKDGJtlLjiZ0RXn9FN4PTZxtv2pBIBAv63tyosqE3FmvqCNe2+tdzS7YjRxu
         UJWwYs3HX6K9cj3TzyMndluDAxfEqi6cMg1sYzsXdUz2tv8P9EyDWkyH/p1c3ZXVhwST
         1TSImBRFTu7/d4K1vwVIfqMaaTMASDbzK5zxq6bZ4OvBUFlPo1eObBTwPerp/LsUbrbW
         TI6XjM7iBXgz8b7Iz4hXAVcpKAwFXcb/kkgpz1Q4xu9rNn+Lo3O5W2o7KG36U6hFxVpf
         wR1ZFxpAlvOsKernWb1pBiaUGFqfCqH6JXS6awIMF41zr6nfuuulaKOL4iEh9V54tNen
         vs3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724139153; x=1724743953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KgM+QzWQcZ2DUZR7KveS9LeXc/9kicV430vfS4VSRd8=;
        b=vZvhK9gtq82qqBZXFs9gowUMnqcOOWuiJGvkbRXMcEBlN2vpYDbZRFUvbpQWKPWdKu
         +QWzntZxOjKWoS530Q/28acttrvnsrONsMSxZrloFOczJUZkeT8xg+qHgX9fdlpftkeT
         HVgkG8SazmJsLE1hKyNV+EKRXdWWP30G5jfsT75oZyx8RN6Nj7n+3U/a8vxZ2jsBOl1e
         XQFeQwSy4NfhI8VIEwob1CRyUm3Ls476DReZueb9xMTLid6wPMXc16p2QHeqtKbY5HLm
         ga5wZ/39OxgsLh6vNr78Tza3Ozcwz3OH9yI4yHtBjOsX2KmXJvDEYPeobSPx/K8yQOY1
         SK/A==
X-Forwarded-Encrypted: i=1; AJvYcCW/V+UT0ZsmGKNt4DJBnb8FZ2G4CUFsRQh4f1UE9J4ORxliLZmoTZ/OTAiV7T52aDXhk7D4RcZ10SU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4E12pTWDV4IAjT4ZZ4YPTy25D7OGtkzmGcD5TgUDY2uGKTttU
	k7dgx2AcNvyS25ocOqu96Pv7ob29qcgTJj6riyAaGvKaJ9KHgTxjzYzgWgzOK5w=
X-Google-Smtp-Source: AGHT+IHkyNt7DNdr1FwUFXM1w0JBcq+qGUSMD1P8jHKB+jsefPksVAXH7weJcswaTpOC3d6flO3v/w==
X-Received: by 2002:a17:907:c7c5:b0:a7d:26ff:aeb0 with SMTP id a640c23a62f3a-a8392952665mr895469166b.30.1724139152450;
        Tue, 20 Aug 2024 00:32:32 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83839471c0sm726532466b.182.2024.08.20.00.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 00:32:32 -0700 (PDT)
Message-ID: <96265c60-5b16-4a02-a991-ac0e06f7baf3@tuxon.dev>
Date: Tue, 20 Aug 2024 10:32:29 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] i2c: riic: Add support for fast mode plus
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
Cc: chris.brandt@renesas.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com,
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
 <20240819102348.1592171-9-claudiu.beznea.uj@bp.renesas.com>
 <hu4yt2a7ipxrqd7ciqqyg4izei2dr7yerpgf7j53quepxj4ed6@gzlv7l3etpqb>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <hu4yt2a7ipxrqd7ciqqyg4izei2dr7yerpgf7j53quepxj4ed6@gzlv7l3etpqb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Andi,

On 19.08.2024 23:12, Andi Shyti wrote:
> Hi Claudiu,
> 
> ...
> 
>>  struct riic_dev {
>> @@ -311,11 +315,14 @@ static int riic_init_hw(struct riic_dev *riic)
>>  	int total_ticks, cks, brl, brh;
>>  	struct i2c_timings *t = &riic->i2c_t;
>>  	struct device *dev = riic->adapter.dev.parent;
>> +	const struct riic_of_data *info = riic->info;
> 
> Because you are only using info->fast_mode_plus, perhaps you can
> directly take:
> 
> 	fast_mode_plus = riic->info->fast_mode_plus;
> 
> and you make it even more compact.
> 
>>  
>> -	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
>> +	if ((!info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) ||
>> +	    (info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)) {
>>  		dev_err(&riic->adapter.dev,
>> -			"unsupported bus speed (%dHz). %d max\n",
>> -			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);
>> +			"unsupported bus speed (%dHz). %d max\n", t->bus_freq_hz,
> 
> super nitpick: can you please put t->bus_freq_hz on a new line,
> it looks better to either have everything put in columns or not.
> 
>> +			info->fast_mode_plus ? I2C_MAX_FAST_MODE_PLUS_FREQ :
>> +			I2C_MAX_FAST_MODE_FREQ);
> 
> another super-nitpick: can you please align
> I2C_MAX_FAST_MODE_PLUS_FREQ with I2C_MAX_FAST_MODE_FREQ? It makes
> more clear that there is a "? ... :" statement.

I'll adjust everything as suggested.

Thank you,
Claudiu Beznea

> 
> Thanks,
> Andi
> 
>>  		return -EINVAL;
>>  	}

