Return-Path: <linux-i2c+bounces-4377-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F439181EE
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 15:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA8141F221ED
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 13:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD84185E46;
	Wed, 26 Jun 2024 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eYTrcepq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F3A1822D6
	for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719407244; cv=none; b=LvYnoTLeHYTR7AfhGH1HKvS4izPVC1RnsZZIgTpSMa5uyTV0E6jo8A6kz9fLyFCFOXkHcOuS5ddSwpnoRaVpvQJjo3R3ZPMH9qVrYH107QvOD0mIFBnnkv+iY5WmrcDH/aVEy5tOHIy2u1ugpvLdRC7Fa6l4F5AqYS0mMGVsT1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719407244; c=relaxed/simple;
	bh=zw0a9Xf9AqcDb8lK8o8wWOJU+75sjmGWL4bnJOJTfRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDkkXqcm5s2/jzC14A+IiJQTJLPHEZTxQQtabC4IGtvIJ27rzg/deqKI55XE64oEokiMIMI8Elxaa0dHt3uU5wHJnYc4mDilwydZq/q1tgzUi+ifjsL5jSlu5wl313aojSDir2ErLQ6BmCNlbuOuHSxctCDH2tZiW/lwjx6GXro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eYTrcepq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4255fc43f1cso2886315e9.0
        for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 06:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719407241; x=1720012041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tDQy8BECqR3d9KG8alrRMJUS6CkD3eJI9ZwYScYLHPw=;
        b=eYTrcepqLwfBb736vqvsvXdu8ipvoXtYefMnd+uBpwwJUOea4k7PxzeseP0XsZH/wM
         CjoazB5JNxHPcbkofkJhQ1h8cFO9t1F+OMTBwMvCs5KYfxJWwTVKbTq/RjK0qrQLUucO
         hESpcBbOovWLpZOhTd7N6SQDA6EkkZZT0CguRHfH4m7M099QYFUjD6zMtKcNPkXz3fWp
         hErNcPtPlFus5vX4c88H08kHwT+msx0V2N+6392mtfG8SNUNZJwavv4mzOOP1E7CQCUO
         G8kQXu53iHkuKwahD81CpomGlkrJTXjvYvSVZlqZzU9/yJTsJ2Rt0BpzsptH1vpqrQbH
         F7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719407241; x=1720012041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tDQy8BECqR3d9KG8alrRMJUS6CkD3eJI9ZwYScYLHPw=;
        b=GBGGIy8j6uinfQA9CmVUurs37FLTMegELLF46pbxhiUs6iSJ19UdCmtz3m0luoW+7h
         njgEwqEkXc2xoSDIXU/IZ322JtuPPI3wJjh4pbzzHttnzEbhuvl8Bz2lFkbCu1nUmSvy
         YXOKiCB+Uf//wO9llwgMQ82onGymEIDn6P8QX4hbK11DMGo0zwqYU0QlLO90hlprYwgs
         B8KMIpBvPkO4iQZqS8XLIWUm6JJe5FWYgY00Uhi24sqaE+kCNSJxaoIg6kXtM3A4vUjj
         e64Y2Qn/QvosD8rkTM89da6cQmCx6k1tBg04rxMKiYNIylmyuVPCAaHgdL7EhXyLJr8y
         6wiw==
X-Forwarded-Encrypted: i=1; AJvYcCUlGQW/c5qW7GDrIouWWnPUEh79nILsV0eDHfrUe9mzaaylV68HEwN1wN1Lqb59hKP/BrLHY1WliU+HfNhpzR91p64Vgi6gyXMB
X-Gm-Message-State: AOJu0Yx953p1cBoY7R3A9by/N4rSoKgMDr3ENJnRNGHZXDz49cBxE7PP
	1W4qybuXQDorCTWKejqcKjaVeJAVUENKorLVF9EYe1fwKrE5Q0xPqHfxw3aPdFBLNvURHcV24Ms
	/qv8=
X-Google-Smtp-Source: AGHT+IFnI3BCzOm9FuKlL8pAB6vzhy4jH7oPlvuTldtaYqx2e+JcKbfH6B4nnzMZrXctUa2kqlJpZg==
X-Received: by 2002:a5d:4c86:0:b0:360:727b:8b47 with SMTP id ffacd0b85a97d-366e9629df0mr7240449f8f.63.1719407241160;
        Wed, 26 Jun 2024 06:07:21 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-367188300acsm2106768f8f.54.2024.06.26.06.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 06:07:20 -0700 (PDT)
Message-ID: <3e2f38a3-e151-42f1-97ca-b8327ade4acc@linaro.org>
Date: Wed, 26 Jun 2024 14:07:19 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] nvmem: core: Implement force_ro sysfs attribute
To: Marek Vasut <marex@denx.de>, linux-i2c@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240626041214.513242-1-marex@denx.de>
 <20240626041214.513242-4-marex@denx.de>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240626041214.513242-4-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/06/2024 05:11, Marek Vasut wrote:
>   
>   static const struct attribute_group *nvmem_dev_groups[] = {
> @@ -945,6 +988,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   
>   	nvmem->read_only = device_property_present(config->dev, "read-only") ||
>   			   config->read_only || !nvmem->reg_write;
> +	nvmem->default_read_only = nvmem->read_only;
>   
>   #ifdef CONFIG_NVMEM_SYSFS
>   	nvmem->dev.groups = nvmem_dev_groups;
> diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
> index 18fed57270e5e..0667937ebb86b 100644
> --- a/drivers/nvmem/internals.h
> +++ b/drivers/nvmem/internals.h
> @@ -16,6 +16,7 @@ struct nvmem_device {
>   	int			id;
>   	struct kref		refcnt;
>   	size_t			size;
> +	bool			default_read_only;


Its not very clear what is the need for this?


--srini
>   	bool			read_only;
>   	bool			root_only;
>   	int			flags;

