Return-Path: <linux-i2c+bounces-2957-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A04D08A5EB3
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 01:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4088D1F21D05
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 23:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BBC159567;
	Mon, 15 Apr 2024 23:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e1KR7WZg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DAC15885D
	for <linux-i2c@vger.kernel.org>; Mon, 15 Apr 2024 23:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713224700; cv=none; b=hjAkOBQOaAhylN7i6OByMKtplTfyu5Bsuwe2MGZ3jikofo3qN3YMC2rHl2pe0J6nfYNft6mmYgneBTkBqcq33g7DuXqKs6/V77qoXUIDCr7RrmBtMvqawE7MTpvjfl+24ROn+Q8KMdh/iB9XJXIJkxzb52PXAsEDilMElO9UwOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713224700; c=relaxed/simple;
	bh=1yg3OygJVyqd8LdAwF5YHyIoztUiURYJApP0WPH4qMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XkFvi9yBiktDFdX8ZFakRJYycQS12LwJtNjwQavWee6guV8ffbPWy9Lwmy9CNmVbn/emXLvvZHKCgyg+Jzapjt1QzR3crHemvAso+j6Sp9FuPBYHipCfyfvlHz5u3h0sc0xR5ChIRIictbjg8Tk3J2yZbs05T7SqIIFQYt7b/7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e1KR7WZg; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516d0162fa1so4778044e87.3
        for <linux-i2c@vger.kernel.org>; Mon, 15 Apr 2024 16:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713224697; x=1713829497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1yg3OygJVyqd8LdAwF5YHyIoztUiURYJApP0WPH4qMc=;
        b=e1KR7WZgxSWTzDtMhhuAeYu4wD0YCTK0GcGBVqNOfCRrvJPNbuE5WC50k/cpEqrK1C
         vLVwgNmMgEvAyEZA0xN8kFcFAdCPkZ975rRLqHT0Dq2nya9FnotJNrxHe496fdtNVBYA
         8i3QnK23PYzJamlwayJlTX0ukh6fxK7dEjqoBk/43mzLuQ5sdiwQJwwwVvhMA7bcJrWz
         Sz0Ik8DtEN6bBj875VQ0Z2Oj5Vl+52nCKoQYjTCxBAAu/N28rmc2TuFeqgPaJlqezi8N
         vMPiSZnYZg1ogMH44YawnaeDElcvyTKmlMzsrCeBkm7rxSKtuGgiA/4jwZU55txiHe1D
         UGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713224697; x=1713829497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1yg3OygJVyqd8LdAwF5YHyIoztUiURYJApP0WPH4qMc=;
        b=M8NKjwVsgpwc7opwPj/d6d/xgbsYb8TUFg2nExFVdWBI6STigtLdo+3++8Q7DWWMtS
         T+y6ekQ4o3hWtFuNPKgcJpW1fHKimK3/JazD0UWtPmka6S1cFJeSYxJwNpdkrWW/nxAB
         S2/hCVtCn8wZk5O2kJX1mz+iMJFqXGxNo089K6WPFhNO9ETQ9UHfVofxUjVTGawAdTsu
         W1ktqODpU3+aPgCNXBGpEmmXfRHpA7YZslDQU+5KOMUfQwno3MN8R5PloYAt6nsA0dZ1
         usevHBTIqpc/UmTm+UIyL7dQ4rjh9IOLaK2OuZhaWirqCDY3xT4M2KkUBlmwKiWNTv/G
         i4+g==
X-Forwarded-Encrypted: i=1; AJvYcCVas1F0pBwsyijLD3P7abxyoLBncEcGs8QG1lr7tbE9ofrjZGCST3rchexg7ErvazWrYWDnK6bk09z69BS63Jd7nNfXIguXMR0k
X-Gm-Message-State: AOJu0YznrBMmmH/2k3bYhMfAbQ7aPfdiWTdARPk81HSoWxxmy+MKNAyP
	fq39OsV7h2hfThXBgP+cxLd4x+fyRozuzSY3R4IVpIes2ibn339OIiFLveXi7bw=
X-Google-Smtp-Source: AGHT+IHBvH4Nm4RXQK0TC/6z2MuiS3bWVyCqwBvp8+QBi3zVVu7rpiLllbv39OJbDZlfvC4nAFlbTw==
X-Received: by 2002:ac2:5dca:0:b0:515:b164:4112 with SMTP id x10-20020ac25dca000000b00515b1644112mr7286371lfq.68.1713224696673;
        Mon, 15 Apr 2024 16:44:56 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c52:73b0:74d6:fe8a:b9f:ef94? ([2a00:f41:c52:73b0:74d6:fe8a:b9f:ef94])
        by smtp.gmail.com with ESMTPSA id 27-20020a170906319b00b00a4739efd7cesm6068859ejy.60.2024.04.15.16.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 16:44:56 -0700 (PDT)
Message-ID: <f4cbacca-c2e7-42e7-8ed9-dbc6bb59f1ce@linaro.org>
Date: Tue, 16 Apr 2024 01:44:53 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: i2c-qcom-geni: Add support to share an I2C SE
 from two subsystem
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, andersson@kernel.org,
 vkoul@kernel.org, andi.shyti@kernel.org, wsa@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240327101825.1142012-1-quic_msavaliy@quicinc.com>
 <ccb312aa-3c4c-41bb-a3f4-b94971edb346@linaro.org>
 <b7125064-4b20-438e-ac1d-7107d28b1bf9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <b7125064-4b20-438e-ac1d-7107d28b1bf9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/2/24 08:21, Mukesh Kumar Savaliya wrote:
> Thanks Konrad for detailed review. For dt-bindings sending a separate patch soon, rest comments tried to address and updated patch V2.

[...]

>>> +    if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
>>> +        gi2c->is_shared = true;
>>> +        dev_info(&pdev->dev, "Multi-EE usecase with shared SE\n");
>>
>> How would this line be useful in my kernel log?
>>
> It informs that particular SE is shared between SEs from two subsystems, hence respective debug can happen accordingly in case of the issue.

This amounts to "not very useful". As an end user, I couldn't care less
about the nitty-gritty of firmware-hardware interactions, so long as the
thing works. You must not spam the kernel log with debug messages, as it
slows things down and makes actually useful messages harder to spot. If
you want to keep it, use dev_dbg.

Konrad

