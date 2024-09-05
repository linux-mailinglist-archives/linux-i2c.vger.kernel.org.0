Return-Path: <linux-i2c+bounces-6280-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7734A96E47B
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 22:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04883B223DF
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 20:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D9C1A76B0;
	Thu,  5 Sep 2024 20:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BjNVh2mr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17831A7279
	for <linux-i2c@vger.kernel.org>; Thu,  5 Sep 2024 20:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725569628; cv=none; b=Csfpcns76RMdEyqE/QTxWjiQCS0ms+FW07qAaohsnaYrRhejaH+Znvhh/wZPf+z5VIEty8z6Gd6i9FamQbgVMRL03OT9/eBFif/a+oKvsBXbfEumMfs/Wa85bcv1zpz1pZQh++9vjPMmtBesXolL1tnuj9VPMBoB9MROaEeJHTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725569628; c=relaxed/simple;
	bh=okpSZJ457TOGrWQFhXOsHpza1OncvzJlnkagzXGr9sc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bK8qJ1nWxZm1BPtdM9Fs1JQA1w16zthg9sa7xVXhqJZRCzUTZcCTlj8cuu289XP8/YR/+v8cCwkv8NE4d0BQJYIhkNWGXdDfJNH54Q65nfEAB+4aMAflkoZLTNsyL7J9z2V/yac+kzHi9nEiguUUOyRB1jbnvpEJ4BapS4bC5EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BjNVh2mr; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-535be0a9b9bso198818e87.0
        for <linux-i2c@vger.kernel.org>; Thu, 05 Sep 2024 13:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725569625; x=1726174425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nsgr1R8IvjXIPpmmwD+8IYKOWPeLr0RTzjyAwlJwjxI=;
        b=BjNVh2mrTM4kWiFl9gRX6+hdIguxhEvLYiuJjo+e7nw+BtYtpF2dHdHAVHA8GoVqee
         MbJQz1brO6A/hzZ7+evFBKX7zReY6dcO0TzxKQRtOlezMe8xe+6dt+r2xZ3PgVO9ohwR
         Fi9wZvl2WksybE4E05cxoaa4zNNLqsb2CSHP2nD1sCBUH6zkqGVe0iUSONMmk45FxC0r
         PeeSQsjzNdozzU138fpckLWnXxYLDvP59wYWbwMzzf3Xw5WefwjlsWiwxKy0lbPOFqAY
         203YG/xkODmJuuqYxNV1V2Xg2/6l2oMis6oOB99rO9kU/3Gabe3q6bVVv6mIf19g6iTF
         voIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725569625; x=1726174425;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nsgr1R8IvjXIPpmmwD+8IYKOWPeLr0RTzjyAwlJwjxI=;
        b=Z4cxHe5AKb1z+9hF6DOEjnTCj1y9Z1iA/nvhp4mgV8Pa7hJbdiGW4IxOn/1Df0cXOj
         zpq/0btd2sJL6gk6cPQvcMNPZg86+0kWbL/PSF9oJBI5UXqM+OcVhyThqeJkVYkJMxXe
         Er9qJRcbh/tkHZDdbruKU0YnNu89kt2eXiyD/wSn1U6Vn67DnLRnpfbfcyKynXsHO2aR
         SMI019Q98GONMdXX992Yg+3vHzZ7ERJYOd1iSLu0hQvvH5gh4LjTxxIO/x8HO+DypPvs
         7hLTPGNVFIysBHyjYZnuj/4wT4595us/ftf3bvGJgzNO3gsJTm+w0F9qIkbrrOi65w7V
         8ZDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIVFKVJh9RF54KwAmD691OhNhUh2PTzJCUvE7Qsm/J6UAqbYPi8UuzLGsEGkZr8Dwqp8D+2diNEIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YySBe6Mze7wWy6KWWTokSJfD3TQ4hAM8yDIXTfA29hcyZEscJaB
	GEPheTWuLYwx3/XUm24h9sRNisLoTtpEw/UwawqoOlpDX4se5tqLxB8ECBi4wRJNthewnxcipPC
	n
X-Google-Smtp-Source: AGHT+IEO4KLXvOMoYHGx7cz+dmpyOoozAeB+4C+XIlp9W2jhjsnqyJ3FcfgbBB1A5mVd/UC9qlSOvw==
X-Received: by 2002:a2e:b8c7:0:b0:2f0:198e:cf8b with SMTP id 38308e7fff4ca-2f751f3ca74mr1464501fa.4.1725569624887;
        Thu, 05 Sep 2024 13:53:44 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f7504801fcsm660731fa.121.2024.09.05.13.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 13:53:44 -0700 (PDT)
Message-ID: <1d04e38d-23fd-4646-acee-0d306efaa756@linaro.org>
Date: Thu, 5 Sep 2024 23:53:43 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Add SDM670 camera subsystem
Content-Language: en-US
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org
References: <20240904020448.52035-9-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240904020448.52035-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/24 05:04, Richard Acayan wrote:
> This adds support for the camera subsystem on the Snapdragon 670.
> 
> As of next-20240902, camss seems to be a bit broken, but the same series
> works on stable (although it is much less reliable now that the CCI clock
> frequency is not being assigned).
> 

Second that, please elaborate on "a bit broken" camss.

Regarding the CCI clock frequency, it's a supply clock and it is kind of
unconnected to the CAMSS driver, here I would expect that some particular
clock frequency setting either works always or does not work at all without
anything in the middle.

--
Best wishes,
Vladimir

