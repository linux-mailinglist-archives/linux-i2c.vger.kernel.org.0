Return-Path: <linux-i2c+bounces-5137-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D967D9470A6
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Aug 2024 23:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93DC2280F2F
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Aug 2024 21:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F377136320;
	Sun,  4 Aug 2024 21:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qAhuHv13"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458FE768EC
	for <linux-i2c@vger.kernel.org>; Sun,  4 Aug 2024 21:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722806524; cv=none; b=GeOciIgR4yzepSDb8fUwXnJNCGqzrmWY6t2coGiSgMmM//EUNSyGBMLyBzK6fDodj9Zn5wIEA+6mEOGTg2YXw0fmuNTPyNtVZo1Pw6oIoJVjFxapJAX9r5V5wCMCoXQpRbJz45b6XSU06cgmgNiVAmiw0xBwx0ar01RjIHznrbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722806524; c=relaxed/simple;
	bh=8T0BYdA9Kxi+oVjS9OAReH15eAFcU+2zMrtmp+uLA5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lRkTBOPm6jOp+Sgh2IgoIuZD+7sigvIVss9ad1jYjVHZ0YFpk1zBL7SDMDiaSt71ABkhcnaNHd3ZFjKR++lD/CwbIQ8hqJNhJFiN4AniX15f1dkE4FjuTtU8zPNv4pkGD1vpbPVtxB83KHZMJia4INtHQmAZpw+5A97x85BD/JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qAhuHv13; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ef243cc250so18705741fa.0
        for <linux-i2c@vger.kernel.org>; Sun, 04 Aug 2024 14:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722806520; x=1723411320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mqnu+yNGhehLSrkuhy5GkzzL6TnfVoi9+bUerYPLnpU=;
        b=qAhuHv13A1xGhNkRwoNZ2VVcAQtz8ckrjrzy5xSIqCLDUN34jHEYfNeejWZ5me84jq
         y+intyNFIUbXX5hNJ1dlcnz4QlHAijoIflerWtwyZEJS3bMWPqUXssV3ynWuox6Jl4J+
         2yZ6BOg2ZZHyplAJgZV0TgsVJAKMeLYBb8nqg49K6yq3/8P/ia6iktCHcd9OAGtJhXdb
         1W1zEJ0QQtGMUflc+EhyH3+wE4K5CWIcNq4CHmiQbh83ADSVhz/nETxfaSTUSyA7BJ/l
         8VyRdgXsQ+yo/bj8sH2h2Fn3A/dYXlPYNEVrrdinyULPnTscu2WQ0eRl0iuGoVJlnmu6
         q0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722806520; x=1723411320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mqnu+yNGhehLSrkuhy5GkzzL6TnfVoi9+bUerYPLnpU=;
        b=df5oE8BJYAf6c6eTZvZlBvFnsfoXpSL5avqTrEc7en/9mMSFwY7VdFMSm8Vh4xatWR
         MTJHfMoIvEkD/0PeNo0uueBNwbWO+/1A4F+b0dfmXV7pd/3TFMRWzDSsp94vEBdvp+Bi
         AhJ/STkIBsID10/mxodNEZAXSCFtp69LVPGoaN14b17een+vUvq67RLzt2obYZYz5UaG
         b+gQnnqauXxCpR39NXvXb0WRf4fXwm/uWqBazvKvJFiAMeDIVUCeU1UjUTUQyEUO7PR1
         7ODw+hsrMtq3FTioGhgYuHvL9rALs626P3zrlwdL++sPMoECTyrcMrUeDKpFsNYPQNgv
         IgyA==
X-Forwarded-Encrypted: i=1; AJvYcCUxr5b0gA6kaPbZtqcPvcCX8qDslR8j98/3Exn5K88Hrls8hSkTQ7kYBytlzLTOSY0mafozYVD0K5pyu2E68nCauEHHwLsn5VX8
X-Gm-Message-State: AOJu0YxJfkScQ0+ap5+IuCOoZPlZBoW3i6CJJGcxQvc0dc7cP1juxZAT
	WVya9GHwQeL4GohaF9Rp0/lBs4keJj/adtH2EYeM7Q+n586dUmEzRNbrPm7MJhU=
X-Google-Smtp-Source: AGHT+IFmcMxMi0C7iCoG5ilO8+VdI9K5JR+E9gBGMc1h7WBJ6E8D38KzACtDsWOqM/stVtF8l3U3Fw==
X-Received: by 2002:a05:6512:3ca4:b0:52f:c22f:32a4 with SMTP id 2adb3069b0e04-530bb3b52f4mr3588082e87.6.1722806520253;
        Sun, 04 Aug 2024 14:22:00 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba2a027sm896204e87.131.2024.08.04.14.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Aug 2024 14:21:59 -0700 (PDT)
Message-ID: <a12d2ec6-07b1-4577-8bed-981024c5cc9c@linaro.org>
Date: Mon, 5 Aug 2024 00:21:53 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] i2c: qcom-geni: Add missing clk_disable_unprepare
 in geni_i2c_runti
To: Gaosheng Cui <cuigaosheng1@huawei.com>, andi.shyti@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240803061041.283940-1-cuigaosheng1@huawei.com>
Content-Language: en-US
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240803061041.283940-1-cuigaosheng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/3/24 09:10, Gaosheng Cui wrote:
> Add the missing clk_disable_unprepare() before return in
> geni_i2c_runti().

The function name above is scrambled, it should be geni_i2c_runtime_resume().

> 
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 0a8b95ce35f7..78f43648e9f3 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -990,8 +990,10 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>   		return ret;
>   
>   	ret = geni_se_resources_on(&gi2c->se);
> -	if (ret)
> +	if (ret) {
> +		clk_disable_unprepare(gi2c->core_clk);
>   		return ret;
> +	}
>   
>   	enable_irq(gi2c->irq);
>   	gi2c->suspended = 0;

The fix is correct, thank you.

FWIW there is another missed call of geni_icc_disable(&gi2c->se) on the error paths.

Fixes: 14d02fbadb5d ("i2c: qcom-geni: add desc struct to prepare support for I2C Master Hub variant")
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

