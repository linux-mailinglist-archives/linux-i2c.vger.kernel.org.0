Return-Path: <linux-i2c+bounces-2685-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9793C892C4B
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Mar 2024 19:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 094181F22E3C
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Mar 2024 18:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89CF4084B;
	Sat, 30 Mar 2024 18:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MiLzFbm6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A461DFC5
	for <linux-i2c@vger.kernel.org>; Sat, 30 Mar 2024 18:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711821634; cv=none; b=e6YyHfh18ZvrDwp8sMAQL9/4GaSiLE5veJAuVCJYP8aZVF1OjrEXKW692BxDWS+njJfgSx5lwP+eO8WAW1XIHK8pCsECPVv6bxA7XiKrJF+46Evce7gMbZmox/BqHaZS0XLMg9y8YdFe5JJ4rl53Cb4nOlQtyx0GbDQnsBNwljU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711821634; c=relaxed/simple;
	bh=G3Q3ZYjxB9PZFnNxkThRR/H8PzG0UVJOFPo8sxKc9aA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ejSjvMEMbRYXNQzvkHeFBRzmd55+hMSf8kNtriRUYNKzR5Ww6jZSkEfBfGBULoFwLEQcaIOW/aD3aWZ6pVH1hmixBzJeXaX5oU1eFj3TehKdxqV948D3QqZRdXVrXlyBZLTBGaBRWX2qNPIT7WrWIA3RN37NXZbYt42phqZDoho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MiLzFbm6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41551526477so8652315e9.0
        for <linux-i2c@vger.kernel.org>; Sat, 30 Mar 2024 11:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711821630; x=1712426430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r39j2D5BMTjv9agvH23NugKjyW42TUeZqGeGsZaMYf0=;
        b=MiLzFbm6jTg9OMg81tqtPcO3ZZxAXYfhE1a0FxjkkVfSTmQvCYvlEz85sFLgSMgDYG
         QYOsUjww1qV8s1/gpxRSotb0ZreFBgKuXg0aUKOZFat3OjJ7Fltx+K3xOz1SGIcQMsdc
         sP9xhjDu++1LtUNCNCLQMszIAM+sjzEYnDiw2rj4uwO/C6x7X1BDnfJM4ZBtk4LeshRO
         KJ2bJ5E+zjuOImLyGUJWwIeEjBD6MndqQi+z7BD8kyELzWGZwpX4z4/XBEUwAwJXoKYI
         qiX8jE/Y3Ligv7+dFOBlkEcGl9opekAOysIKJVnKS+gbVF5awLBTht1CgSWR36XF0GPD
         p2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711821630; x=1712426430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r39j2D5BMTjv9agvH23NugKjyW42TUeZqGeGsZaMYf0=;
        b=AWGrt70zBzn9OCcqBWiAQUR/H4KYgIr9bsxNPHvWdSTSr+Ix2mJBq/vr+z4Y44G6VW
         X9ZF+XfZmrXJze7ja540a/4kfBMzN86P+vWfzXj+j5oLO5EDP50c4iC/99vmqbcbHd7a
         xZFwzWXrOmkqUdkuma6kjgSW4hIAizdzshT5012Si7K6xlgmPw8qZNAfRNdOqZGZfh9n
         /Ppl+ofrp0BLJI9pfT+4xsVvg+eUSMjUxBFF98WYjW7z/1K51uYV1N6TSUr3MMt06MSd
         4rEp43JnhanTcSLCxvWlhw6fsA395QYLvHBrLXbm2TaztXpq9Rb6gYvaU9eK42NjH9iu
         x5IQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6LLnNkd+MjeT1k0HElL6E5xjhpOafIFpX1kIUi7LaIV3Ro+FruWO2ax757AI2/P1FxDdf6+msvd30DHQh7YgxWw/IItJVjbhj
X-Gm-Message-State: AOJu0Yyqc6p3jdEXg6KbbfIqL9x9Ntap7g7T/Dn2SH7TEbsao09dVg2S
	xTYOlR75u5boZY4JDAdbKjzaRd0bofcEA6O4cuOr5rtOpGvBmEdbEJFOiI+N7P8=
X-Google-Smtp-Source: AGHT+IF08e2/g7vun76NTerfx5th/Hnqzkh4SuYGxOXmBfdp04gFPw4kDsBu5Sb4XueCWxhfPG5L7g==
X-Received: by 2002:a05:600c:450a:b0:413:2852:2835 with SMTP id t10-20020a05600c450a00b0041328522835mr3636994wmo.17.1711821630033;
        Sat, 30 Mar 2024 11:00:30 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id n2-20020a056000170200b0034335e47102sm4988194wrc.113.2024.03.30.11.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Mar 2024 11:00:29 -0700 (PDT)
Message-ID: <cfa5aa01-44ef-4eb1-9ca6-541ed5908db4@linaro.org>
Date: Sat, 30 Mar 2024 19:00:27 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
To: Russell King <linux@armlinux.org.uk>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Shyti
 <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Michal Simek <michal.simek@amd.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-input@vger.kernel.org, kvm@vger.kernel.org
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <171182151736.34189.6433134738765363803.b4-ty@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <171182151736.34189.6433134738765363803.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/03/2024 18:58, Krzysztof Kozlowski wrote:
> 
> On Tue, 26 Mar 2024 21:23:30 +0100, Krzysztof Kozlowski wrote:
>> Merging
>> =======
>> All further patches depend on the first amba patch, therefore please ack
>> and this should go via one tree.
>>
>> Description
>> ===========
>> Modules registering driver with amba_driver_register() often forget to
>> set .owner field.
>>
>> [...]
> 
> Applied, thanks!
> 
> [01/19] amba: store owner from modules with amba_driver_register()
>         (no commit info)

Patchset applied here:
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git/log/?h=for-v6.10/module-owner-amba

Best regards,
Krzysztof


