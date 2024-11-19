Return-Path: <linux-i2c+bounces-8053-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 416299D2988
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 16:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C50E0B32676
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 15:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32A21D04A9;
	Tue, 19 Nov 2024 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PaF7dWVh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7761D043A
	for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732029177; cv=none; b=aoQ41xwCLlpXaIXOiJDoo1irOqjCZNaaSdGB6jXO+vwMz3GrkgG9jfhrDzY+fySZBDOJUFbHGf+KZhXeUDCX/glV470DEEmozyIo6nKTP5ulTkhIvRhN3A2vdyUhOeVA6nekc6pCIjfP4x+WPE3+BpivJURbF5wud2ghrLHDuUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732029177; c=relaxed/simple;
	bh=mrd+ef5omKk4kmj9QBZVm/PCvmTVB8GvlJMDSSFnMTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OclVpqtR/Cv0lfoa96c9F6h05J88hVjjIyUcbWDSjE7U/F4Gn0jDNPy+aEnSneUrqdyTcY0bhJySMZaQ9GiA71/v6huK+IVN/BVTvPdSAyOgHQSnhTV/EpyS8dI+3s7fgcMB2TbJYOvO/INf8xg8HKwaYtzXmrhOyINUh+FrWN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PaF7dWVh; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa1f73966a5so659586466b.2
        for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 07:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732029174; x=1732633974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1njkv7AEQYLprfmPF/SUU/CkkayzBBsZYgpz9cUBCwU=;
        b=PaF7dWVhRUDFt0DBKnN8OIYMtbFvQsDtEp1Kh0WGPRITJKksB6PsoYctE9OxF5IqEw
         6olRM22/oXj+GCo7ANZNieMX2jvLKs2COEo91TbI0GTx82RjgUd39etotXPZi6KnD3Wa
         I4rA9tili4UprJnKZsC9L/CKPFuGhMVVZJAZ3MB+Q6D5Uc/s63uqncYM4nt2WzRMyjDU
         CF9wqiG95KMrKe1z215sVh+DC/WXg6rB5G2KyaPy8klkv3QFGCTATmu/FsVAY7pqnHV6
         +OHEiKKWOeZIPJ/ERY/H04rEfTBESRmGROEX0AmjY1DHq67XjCz4DxO5XoSNwWfCqJHD
         gPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732029174; x=1732633974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1njkv7AEQYLprfmPF/SUU/CkkayzBBsZYgpz9cUBCwU=;
        b=sqKWLf+j5x+7oFrGD+jxc68quPmG4oPX/Ke3Nz6KwGXAkxPrD0fCJG3B3eTT/d6rDx
         JPWwtiE8ix+nYm9YEbqRQjyR1ZuwZs8/jph9DCqzZgmxOFiOID34yvsYvah618fNE8EI
         TawIE/pcSSMWNvxk6l54pLSSE5lnFGCv/jMxTmOqF2uQZ1+6vl3O/uE2NknZr3234+PL
         knrkWiPrIEKleBZYgykJ0y85vl8VSr3dp5VR7S4Hc28rP9zfmHZm2WI/GPDHXw0E5mv2
         mFu4w/a955ddOKwySBe/i2GPW5Nm/qXYCPAD1639OtI8Oa7NkQ5A3nLV4PoBIxiQFu0T
         WtGQ==
X-Gm-Message-State: AOJu0YzbClld6oAvOWCiF86QBPqBiItIUlu7r/iCzs6lc/0kzHuyuAWb
	HrfSc5g3wHzmxbP84ZCtaabw1zvdAZokuvv0V5wWikABIXdcOug8tTraY6/pcO0=
X-Google-Smtp-Source: AGHT+IHpPhEpx8FCZtw2jo+T5uqwAc8vudJk7VsZfwZwUsidD+p95qcWn6QPKWI6Rv/z0jxfWiKNDg==
X-Received: by 2002:a17:907:a0e:b0:a9a:3da9:6a02 with SMTP id a640c23a62f3a-aa483553f62mr1583241066b.60.1732029174122;
        Tue, 19 Nov 2024 07:12:54 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df779afsm658092866b.85.2024.11.19.07.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 07:12:53 -0800 (PST)
Message-ID: <6b7bcf86-9bc4-4608-9f2e-b14c17e558d8@linaro.org>
Date: Tue, 19 Nov 2024 15:12:52 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: clock: qcom: Add second power-domain to
 CAMCC
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-3-54075d75f654@linaro.org>
 <91592bff-4042-49c4-b884-8113d0759a3c@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <91592bff-4042-49c4-b884-8113d0759a3c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/11/2024 14:47, Vladimir Zapolskiy wrote:
>> +    maxItems: 2
>>       description:
>> -      A phandle and PM domain specifier for the MMCX power domain.
>> +      A phandle and PM domain specifier for the MMCX or MCX power 
>> domains.
> 
> It's a list of two phandles, not a one or another one. Can you please

Its two for x1e80100 or one for sm8450.

I'll find a way to express this more clearly.

---
bod

