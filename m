Return-Path: <linux-i2c+bounces-2691-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B44893359
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Mar 2024 18:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C71FF1C21924
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Mar 2024 16:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 659E3148836;
	Sun, 31 Mar 2024 16:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bTDp6mzS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4A1148824;
	Sun, 31 Mar 2024 16:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=62.96.220.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711902557; cv=fail; b=MQNKZUuE0VH2S56t8veN0gXB9ulKi2i87OIJEh4dtpGR/RQoFWP7A6qyYI4re1yQs4cvuT0D/3GhWGQg1DNGsOrKn4tP/zoZsq9m/SRsfmvR9y2ulWYq9BpDpGdLUySIMKwxC5nKqDDLkuH2TYry4vdQVqFaP3AFSSH6FotiH9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711902557; c=relaxed/simple;
	bh=1bohOtjF8NUtcoi0DryKEONLBdlFywKcUNG6FtBKFHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLZ7RgL5tTonJVl+HWrRliJ36+9S0BOezhhMjsv4JpAJ9Wr7NFtdfgItYOtMldvcVDPha1JNSWbW76TX0ePBiLXfUM2RTxYLiM7fzdxaYqMKWrYPHUI7GCPINpvivRebi+SmFxL4BYIIlnAMK559KSgkhHICimf2jiVWYb2o/VM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org; spf=fail smtp.mailfrom=linaro.org; dkim=fail (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bTDp6mzS reason="signature verification failed"; arc=none smtp.client-ip=209.85.221.54; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; arc=fail smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id CF13D2087C;
	Sun, 31 Mar 2024 18:29:12 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ahpdsw6EGnZg; Sun, 31 Mar 2024 18:29:11 +0200 (CEST)
Received: from mailout2.secunet.com (mailout2.secunet.com [62.96.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id 9644B208DB;
	Sun, 31 Mar 2024 18:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 9644B208DB
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
	by mailout2.secunet.com (Postfix) with ESMTP id 87D5F800059;
	Sun, 31 Mar 2024 18:29:10 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:29:10 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 16:23:49 +0000
X-sender: <linux-crypto+bounces-3121-steffen.klassert=secunet.com@vger.kernel.org>
X-Receiver: <steffen.klassert@secunet.com>
 ORCPT=rfc822;steffen.klassert@secunet.com NOTIFY=NEVER;
 X-ExtendedProps=BQAVABYAAgAAAAUAFAARAPDFCS25BAlDktII2g02frgPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSXNSZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAAAUAEgAPAGIAAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249U3RlZmZlbiBLbGFzc2VydDY4YwUACwAXAL4AAACheZxkHSGBRqAcAp3ukbifQ049REI2LENOPURhdGFiYXNlcyxDTj1FeGNoYW5nZSBBZG1pbmlzdHJhdGl2ZSBHcm91cCAoRllESUJPSEYyM1NQRExUKSxDTj1BZG1pbmlzdHJhdGl2ZSBHcm91cHMsQ049c2VjdW5ldCxDTj1NaWNyb3NvZnQgRXhjaGFuZ2UsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1zZWN1bmV0LERDPWRlBQAOABEABiAS9uuMOkqzwmEZDvWNNQUAHQAPAAwAAABtYngtZXNzZW4tMDIFADwAAgAADwA2AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5zcG9ydC5NYWlsUmVjaXBpZW50LkRpc3BsYXlOYW1lDwARAAAAS2xhc3NlcnQsIFN0ZWZmZW4FAAwAAgAABQBsAAIAAAUAWAAXAEoAAADwxQktuQQJQ5LSCNoNNn64Q049S2xhc3NlcnQgU3RlZmZlbixPVT1Vc2VycyxPVT1NaWdyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9ye
	TogRmFsc2UNCg8ALwAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQAjAAIAAQ==
X-CreatedBy: MSExchange15
X-HeloDomain: a.mx.secunet.com
X-ExtendedProps: BQBjAAoAJtXp8x1Q3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAAAAAAAAAAAAAAAAAAAAAAAUASQACAAEFAGIACgA8AAAAmooAAAUABAAUIAEAAAAcAAAAc3RlZmZlbi5rbGFzc2VydEBzZWN1bmV0LmNvbQUABgACAAEFACkAAgABDwAJAAAAQ0lBdWRpdGVkAgABBQACAAcAAQAAAAUAAwAHAAAAAAAFAAUAAgABBQBkAA8AAwAAAEh1Yg==
X-Source: SMTP:Default MBX-DRESDEN-01
X-SourceIPAddress: 62.96.220.36
X-EndOfInjectedXHeaders: 19221
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom; client-ip=147.75.199.223; helo=ny.mirrors.kernel.org; envelope-from=linux-crypto+bounces-3121-steffen.klassert=secunet.com@vger.kernel.org; receiver=steffen.klassert@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 244EC20870
X-Original-To: linux-crypto@vger.kernel.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711801151; cv=none; b=odfaO9t/puEe8FIfiqduhuZk0aqO56tQapWIa/EFHGaCRVm6r16xR50fm8Kqef8b9trIQ95VXqyoaPwemmYYrjFsw4R8CTwJ2iyOEuohqbofSspar0Bfa4fXQzUyNJV66ECnwkZFa/HkdAVXg+MjQ7+tfXBdtkvskdPXWjQ/nhI=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711801151; c=relaxed/simple;
	bh=gnEUiTCGAKgaizTXQISk0bLTxTnE9U1qA4LHHyfKv8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kHVv3D3H5HIwGFTnVbXfF40naFVBZJQDZSYEDmA16BRv+z5Wr4eaM0kfcQw2lPi96USyLJ8eO1hOcJgGs71zEqUUv0iViM3O5enW6crZGDfvgHUZNMrTYcwlrQaRJeaLjcaOWe5EnTC4c0kracol+FUJ9RGnTHYKqhbhPUKkXzs=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bTDp6mzS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711801148; x=1712405948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pwRsl4tW7J5i09nNsaEN0WbRHBKT2ZFbRiuCSTzWq2c=;
        b=bTDp6mzSAuWx4lL5cooxcDpZ9W1mea8O0kdKPspePGuynZIKtNZ/QodKPUZUYN6Sxn
         bqgHPtu7au3ng4zlAbkXPtudj/aOo+e/SYgeh3gbkQs3UFieCRn6QafMakiJalsq+lK3
         hRdc3OS2wTijyLDh8yYEofGgKTNGupdxOeqdDR9HQGdzBeiJpnXWjIZ/5X/bPmICFzv6
         Q7CGGrTCphDqmfQ7M/Vv0ypdsFDyCkarg5/LBvAAefhoqAV1HezQHE9XBLoiN1+Ekq9f
         QadJbIRoslyjrl6gukO+WRurbyLtrkeopHU0OJvO2+HQbPl8W+KV2yiYvjnied+VaIHN
         I0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711801148; x=1712405948;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwRsl4tW7J5i09nNsaEN0WbRHBKT2ZFbRiuCSTzWq2c=;
        b=q02TwHnOMd/VFFiYP2mgSnORjzOklXunJwK73ZRdmxCu7pjqpPAmbIYLgzqfCLsjkP
         SAK/kBsFH9l+jRyoOZuDHp7ao1kVz0+vMxq0i55UULjFp33znf3WXd61skXSfz1kQg7O
         YFV9AB3XSRM7UaPMrsoPjrJzyA9Vns2RtnwS7oYTmQ6tEFjMKco+7CQhxjzmGdY4z86u
         B/5/sBxMGiAUeJD9uO6g82whhthjQ2Gai4jYiMjpJ1n/yiybcXQLHQ1tbU1BfDjS88mi
         4vrjHCIthiEVWOM/coBM6v54KjoG9gWIhBuGo88kyrSyulsu+gcjVjHh7+14EZycXBLu
         oyew==
X-Forwarded-Encrypted: i=1; AJvYcCVaS+d5RxRARLQtmSy0AwB0YmOIRa1CXkp/JiqKkmDlJemAjhUyvkNH0nnsUz/Za7pfOFrUlL/hkrPw9xIO7/vbBo7Zv25XP2j7a4FP
X-Gm-Message-State: AOJu0YwKDjWMaYOuI7IWUqaN7hTUJZDLbXkotFRHat1Sve+0d90vzoxY
	c+peRgR7mcxFNPPf6uPa1y7pqY4py5dRx1BFJ3ZslCK44gtgN/3hZy0U8UC44D4=
X-Google-Smtp-Source: AGHT+IGxitXr7L7h8CUcKtleeDnrSZmBoUk9QkYBw9ltjVABur0LBmd4a6MEByPy5E4LS7vzmYpyOA==
X-Received: by 2002:adf:f403:0:b0:343:39a6:93bc with SMTP id g3-20020adff403000000b0034339a693bcmr3335018wro.11.1711801147697;
        Sat, 30 Mar 2024 05:19:07 -0700 (PDT)
Message-ID: <edd167fb-df0c-4434-8f9f-7c4016b87d83@linaro.org>
Date: Sat, 30 Mar 2024 13:19:05 +0100
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Russell King <linux@armlinux.org.uk>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@arm.com>,
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
 <3f61d6d3-a0d6-4c49-b094-6ba62d09ab14@arm.com>
 <f23f2e60-e5c0-4c3c-9722-dba63a6e7ef6@linaro.org>
 <d8fa8e1a-b2ce-4d91-9ab5-ad1b160111c6@arm.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <d8fa8e1a-b2ce-4d91-9ab5-ad1b160111c6@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10

On 27/03/2024 10:22, Suzuki K Poulose wrote:
> On 27/03/2024 05:57, Krzysztof Kozlowski wrote:
>> On 27/03/2024 00:24, Suzuki K Poulose wrote:
>>> Hi Krzysztof
>>>
>>> On 26/03/2024 20:23, Krzysztof Kozlowski wrote:
>>>> Merging
>>>> =3D=3D=3D=3D=3D=3D=3D
>>>> All further patches depend on the first amba patch, therefore please a=
ck
>>>> and this should go via one tree.
>>>
>>> Are you able to provide a stable branch with these patches once you pul=
l
>>
>> I doubt I will be merging this. I think amba code goes through Russell.
>>
>>> them in to "one tree" here ? We have changes coming up in the coresight
>>> tree, which would conflict with the changes here (horribly).
>>>
>>
>> You mean conflict with  coresight conversion to platform driver? Worst
>=20
> Yes.
>=20
>> case it is solveable: just drop .owner.
>=20
> Or, we could merge the CoreSight changes (as they are really not
> affected by the problem this series is trying to address) after the
> base changes land in AMBA, via the CoreSight tree.

I'll provide you a stable branch to fetch. I was defeated by Russell's
patch tracking system.

Best regards,
Krzysztof


X-sender: <kvm+bounces-13146-martin.weber=3Dsecunet.com@vger.kernel.org>
X-Receiver: <martin.weber@secunet.com> ORCPT=3Drfc822;martin.weber@secunet.=
com NOTIFY=3DNEVER; X-ExtendedProps=3DBQAVABYAAgAAAAUAFAARAJuYHy0vkvxLoOu7f=
W2WcxcPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSXNS=
ZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAAAU=
AEgAPAF4AAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWU=
RJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249V2ViZXIgTWFydGluOTU1BQALABcAvgAAA=
LMpUnVJ4+pPsL47FHo+lvtDTj1EQjIsQ049RGF0YWJhc2VzLENOPUV4Y2hhbmdlIEFkbWluaXN0=
cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpLENOPUFkbWluaXN0cmF0aXZlIEdyb3Vwcyx=
DTj1zZWN1bmV0LENOPU1pY3Jvc29mdCBFeGNoYW5nZSxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cm=
F0aW9uLERDPXNlY3VuZXQsREM9ZGUFAA4AEQBACf3SYEkDT461FZzDv+B7BQAdAA8ADAAAAG1ie=
C1lc3Nlbi0wMQUAPAACAAAPADYAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0Lk1haWxS=
ZWNpcGllbnQuRGlzcGxheU5hbWUPAA0AAABXZWJlciwgTWFydGluBQAMAAIAAAUAbAACAAAFAFg=
AFwBGAAAAm5gfLS+S/Eug67t9bZZzF0NOPVdlYmVyIE1hcnRpbixPVT1Vc2VycyxPVT1NaWdyYX=
Rpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc=
3M6IDANClRyYW5zbWl0SGlzdG9yeTogRmFsc2UNCg8ALwAAAE1pY3Jvc29mdC5FeGNoYW5nZS5U=
cmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQA=
jAAIAAQ=3D=3D
X-CreatedBy: MSExchange15
X-HeloDomain: b.mx.secunet.com
X-ExtendedProps: BQBjAAoAJtXp8x1Q3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc2=
9mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAA=
AAAAAAAAAAAAAAAAAAAAAUASQACAAEFAGIACgA9AAAAmooAAAUABAAUIAEAAAAYAAAAbWFydGlu=
LndlYmVyQHNlY3VuZXQuY29tBQAGAAIAAQUAKQACAAEPAAkAAABDSUF1ZGl0ZWQCAAEFAAIABwA=
BAAAABQADAAcAAAAAAAUABQACAAEFAGQADwADAAAASHVi
X-Source: SMTP:Default MBX-DRESDEN-01
X-SourceIPAddress: 62.96.220.37
X-EndOfInjectedXHeaders: 19175
Received: from cas-essen-02.secunet.de (10.53.40.202) by
 mbx-dresden-01.secunet.de (10.53.40.199) with Microsoft SMTP Server
 (version=3DTLS1_2, cipher=3DTLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Sat, 30 Mar 2024 13:19:27 +0100
Received: from b.mx.secunet.com (62.96.220.37) by cas-essen-02.secunet.de
 (10.53.40.202) with Microsoft SMTP Server (version=3DTLS1_2,
 cipher=3DTLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Fronte=
nd
 Transport; Sat, 30 Mar 2024 13:19:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by b.mx.secunet.com (Postfix) with ESMTP id 8E14520322
	for <martin.weber@secunet.com>; Sat, 30 Mar 2024 13:19:27 +0100 (CET)
X-Virus-Scanned: by secunet
X-Spam-Flag: NO
X-Spam-Score: -2.751
X-Spam-Level:
X-Spam-Status: No, score=3D-2.751 tagged_above=3D-999 required=3D2.1
	tests=3D[BAYES_00=3D-1.9, DKIM_SIGNED=3D0.1, DKIM_VALID=3D-0.1,
	DKIM_VALID_AU=3D-0.1, HEADER_FROM_DIFFERENT_DOMAINS=3D0.249,
	MAILING_LIST_MULTI=3D-1, RCVD_IN_DNSWL_NONE=3D-0.0001,
	SPF_HELO_NONE=3D0.001, SPF_PASS=3D-0.001] autolearn=3Dham autolearn_force=
=3Dno
Authentication-Results: a.mx.secunet.com (amavisd-new);
	dkim=3Dpass (2048-bit key) header.d=3Dlinaro.org
Received: from b.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5WslB2upGwc9 for <martin.weber@secunet.com>;
	Sat, 30 Mar 2024 13:19:27 +0100 (CET)
Received-SPF: Pass (sender SPF authorized) identity=3Dmailfrom; client-ip=
=3D147.75.199.223; helo=3Dny.mirrors.kernel.org; envelope-from=3Dkvm+bounce=
s-13146-martin.weber=3Dsecunet.com@vger.kernel.org; receiver=3Dmartin.weber=
@secunet.com=20
DKIM-Filter: OpenDKIM Filter v2.11.0 b.mx.secunet.com D48FF2025D
Authentication-Results: b.mx.secunet.com;
	dkim=3Dpass (2048-bit key) header.d=3Dlinaro.org header.i=3D@linaro.org he=
ader.b=3D"bTDp6mzS"
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223=
])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by b.mx.secunet.com (Postfix) with ESMTPS id D48FF2025D
	for <martin.weber@secunet.com>; Sat, 30 Mar 2024 13:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.2=
5.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E49EB1C20DE9
	for <martin.weber@secunet.com>; Sat, 30 Mar 2024 12:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9FF38DDC;
	Sat, 30 Mar 2024 12:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=3Dpass (2048-bit key) header.d=3Dlinaro.org header.i=3D@linaro.org he=
ader.b=3D"bTDp6mzS"
X-Original-To: kvm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221=
.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C3B2C68A
	for <kvm@vger.kernel.org>; Sat, 30 Mar 2024 12:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=3Dnone smtp.client-ip=
=3D209.85.221.41
ARC-Seal: i=3D1; a=3Drsa-sha256; d=3Dsubspace.kernel.org; s=3Darc-20240116;
	t=3D1711801151; cv=3Dnone; b=3Dd6PD/glIB0e+aV4qe4FjDLsN6JJt4dnVYomxLVEDXRi=
6fJ6zZNDUZ/KV6bTMXyqD9HZIud2rK4IBVnYSGVICsgrmxJswGg4y7+jDJwNyNzo1EotyDaVuk3=
hz6nln38Tm//4wgHYyBv4odbXJA/sAZLX7tMZtqcU4U/JEFvGEhGQ=3D
ARC-Message-Signature: i=3D1; a=3Drsa-sha256; d=3Dsubspace.kernel.org;
	s=3Darc-20240116; t=3D1711801151; c=3Drelaxed/simple;
	bh=3DgnEUiTCGAKgaizTXQISk0bLTxTnE9U1qA4LHHyfKv8g=3D;
	h=3DMessage-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=3DkHVv3D3H5HIwGFTnVbXfF40naFVBZJQDZSYEDmA16BR=
v+z5Wr4eaM0kfcQw2lPi96USyLJ8eO1hOcJgGs71zEqUUv0iViM3O5enW6crZGDfvgHUZNMrTYc=
wlrQaRJeaLjcaOWe5EnTC4c0kracol+FUJ9RGnTHYKqhbhPUKkXzs=3D
ARC-Authentication-Results: i=3D1; smtp.subspace.kernel.org; dmarc=3Dpass (=
p=3Dnone dis=3Dnone) header.from=3Dlinaro.org; spf=3Dpass smtp.mailfrom=3Dl=
inaro.org; dkim=3Dpass (2048-bit key) header.d=3Dlinaro.org header.i=3D@lin=
aro.org header.b=3DbTDp6mzS; arc=3Dnone smtp.client-ip=3D209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=3Dpass (p=3Dnone di=
s=3Dnone) header.from=3Dlinaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=3Dpass smtp.mailfrom=
=3Dlinaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33ed4dd8659=
so2362095f8f.0
        for <kvm@vger.kernel.org>; Sat, 30 Mar 2024 05:19:09 -0700 (PDT)
DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed;
        d=3Dlinaro.org; s=3Dgoogle; t=3D1711801148; x=3D1712405948; darn=3D=
vger.kernel.org;
        h=3Dcontent-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3DpwRsl4tW7J5i09nNsaEN0WbRHBKT2ZFbRiuCSTzWq2c=3D;
        b=3DbTDp6mzSAuWx4lL5cooxcDpZ9W1mea8O0kdKPspePGuynZIKtNZ/QodKPUZUYN6=
Sxn
         bqgHPtu7au3ng4zlAbkXPtudj/aOo+e/SYgeh3gbkQs3UFieCRn6QafMakiJalsq+l=
K3
         hRdc3OS2wTijyLDh8yYEofGgKTNGupdxOeqdDR9HQGdzBeiJpnXWjIZ/5X/bPmICFz=
v6
         Q7CGGrTCphDqmfQ7M/Vv0ypdsFDyCkarg5/LBvAAefhoqAV1HezQHE9XBLoiN1+Ekq=
9f
         QadJbIRoslyjrl6gukO+WRurbyLtrkeopHU0OJvO2+HQbPl8W+KV2yiYvjnied+VaI=
HN
         I0vA=3D=3D
X-Google-DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed;
        d=3D1e100.net; s=3D20230601; t=3D1711801148; x=3D1712405948;
        h=3Dcontent-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DpwRsl4tW7J5i09nNsaEN0WbRHBKT2ZFbRiuCSTzWq2c=3D;
        b=3DnrEPfS8m/1Q8AAv+F6rrqA1pQVMNjiEpRL85VAehzxQcVpnkjpsleMxHXm8kOMR=
hVV
         iSLZ351P7D13Aivz5ssnue7RQ48O14GQjSFZGI7EXq7HCSMaP2kRO4cWXfEhCzD7za=
CI
         GFwvDeB1q0t1XXuvwelGbRPC3OkkEkPw5WtfiuXP8dyyIExRMi5ik4mCewjvn15sKr=
8k
         Fy8eMWEGOfx2lAIW0lhw8n5ddOnu+QO37mAGtcMgFrbuqOSlBdRowi+QaO9mFlDE5g=
wY
         Ka/3gffnS/5JYEYvy6uCh5Xz8O3h2Q0UhssghW406N5rrsxWd3OmtJxWWUbm4kpXXg=
Sd
         yAFw=3D=3D
X-Forwarded-Encrypted: i=3D1; AJvYcCXH3yO8LUdZmKjRiLMtHQef13pO4YQJjFuFtue8+=
UJDLWQKRLIgPJ0xNw7FW2Vp2BuWAKUaiz0NkS0/hpSsfxQWyAxU
X-Gm-Message-State: AOJu0Yyu73rgiEIPrgi3GyTka1OR/FGILwL/NmhxKjX4mvZLR6p67Ar=
h
	PYsX00nagjZCFP6nZtT8SPugth6Ot7ziZCiVulQ9IiypG3IFezpdXeDgLTZAP6A=3D
X-Google-Smtp-Source: AGHT+IGxitXr7L7h8CUcKtleeDnrSZmBoUk9QkYBw9ltjVABur0LB=
md4a6MEByPy5E4LS7vzmYpyOA=3D=3D
X-Received: by 2002:adf:f403:0:b0:343:39a6:93bc with SMTP id g3-20020adff40=
3000000b0034339a693bcmr3335018wro.11.1711801147697;
        Sat, 30 Mar 2024 05:19:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id v17-20020adfe291000000b0034174566=
ec4sm6339522wri.16.2024.03.30.05.19.05
        (version=3DTLS1_3 cipher=3DTLS_AES_128_GCM_SHA256 bits=3D128/128);
        Sat, 30 Mar 2024 05:19:07 -0700 (PDT)
Message-ID: <edd167fb-df0c-4434-8f9f-7c4016b87d83@linaro.org>
Date: Sat, 30 Mar 2024 13:19:05 +0100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Russell King <linux@armlinux.org.uk>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@arm.com>,
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
 <3f61d6d3-a0d6-4c49-b094-6ba62d09ab14@arm.com>
 <f23f2e60-e5c0-4c3c-9722-dba63a6e7ef6@linaro.org>
 <d8fa8e1a-b2ce-4d91-9ab5-ad1b160111c6@arm.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=3Dkrzysztof.kozlowski@linaro.org; keydata=3D
 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
 D2GYIS41Kv4Isx2dEFh+/Q=3D=3D
In-Reply-To: <d8fa8e1a-b2ce-4d91-9ab5-ad1b160111c6@arm.com>
Content-Type: text/plain; charset=3D"UTF-8"
Content-Transfer-Encoding: 7bit
Return-Path: kvm+bounces-13146-martin.weber=3Dsecunet.com@vger.kernel.org
X-MS-Exchange-Organization-OriginalArrivalTime: 30 Mar 2024 12:19:27.6209
 (UTC)
X-MS-Exchange-Organization-Network-Message-Id: cb55eba9-97a5-4e15-7fd3-08dc=
50b3a4ee
X-MS-Exchange-Organization-OriginalClientIPAddress: 62.96.220.37
X-MS-Exchange-Organization-OriginalServerIPAddress: 10.53.40.202
X-MS-Exchange-Organization-Cross-Premises-Headers-Processed: cas-essen-02.s=
ecunet.de
X-MS-Exchange-Organization-OrderedPrecisionLatencyInProgress: LSRV=3Dmbx-dr=
esden-01.secunet.de:TOTAL-HUB=3D0.422|SMR=3D0.342(SMRDE=3D0.035|SMRC=3D0.30=
7(SMRCL=3D0.101|X-SMRCR=3D0.306))|CAT=3D0.078(CATOS=3D0.012
 (CATSM=3D0.012(CATSM-Malware
 Agent=3D0.011))|CATRESL=3D0.039(CATRESLP2R=3D0.036)|CATORES=3D0.024
 (CATRS=3D0.024(CATRS-Index Routing Agent=3D0.023)));2024-03-30T12:19:28.06=
7Z
X-MS-Exchange-Forest-ArrivalHubServer: mbx-dresden-01.secunet.de
X-MS-Exchange-Organization-AuthSource: cas-essen-02.secunet.de
X-MS-Exchange-Organization-AuthAs: Anonymous
X-MS-Exchange-Organization-FromEntityHeader: Internet
X-MS-Exchange-Organization-OriginalSize: 13859
X-MS-Exchange-Organization-HygienePolicy: Standard
X-MS-Exchange-Organization-MessageLatency: SRV=3Dcas-essen-02.secunet.de:TO=
TAL-FE=3D0.024|SMR=3D0.007(SMRPI=3D0.004(SMRPI-FrontendProxyAgent=3D0.004))=
|SMS=3D0.018
X-MS-Exchange-Organization-AVStamp-Enterprise: 1.0
X-MS-Exchange-Organization-Recipient-Limit-Verified: True
X-MS-Exchange-Organization-TotalRecipientCount: 1
X-MS-Exchange-Organization-Rules-Execution-History: 0b0cf904-14ac-4724-8bdf=
-482ee6223cf2%%%fd34672d-751c-45ae-a963-ed177fcabe23%%%d8080257-b0c3-47b4-b=
0db-23bc0c8ddb3c%%%95e591a2-5d7d-4afa-b1d0-7573d6c0a5d9%%%f7d0f6bc-4dcc-487=
6-8c5d-b3d6ddbb3d55%%%16355082-c50b-4214-9c7d-d39575f9f79b
X-MS-Exchange-Forest-RulesExecuted: mbx-dresden-01
X-MS-Exchange-Organization-RulesExecuted: mbx-dresden-01
X-MS-Exchange-Forest-IndexAgent-0: AQ0CZW4AAVsDAAAPAAADH4sIAAAAAAAEAIVTzY8T=
NxT3bjL5GIhaVT
 30wOGJCyBFYRugSCuxaOmlaIVAcKg4OjOejLvOOLI9ibJ/Oqf+/DyT
 hW1LEysZP7/3+3h+82XyvqHly6dnz54uz5bP6dez8+VyTp/am/Za0x
 V9sK2xXtHe2aDOZ/kFfZt/9uL8xcs5Xbmbg78JtqIre2Ps3qP4WPKP
 GnA8/x4HKv7Qt5gcSeEI9NsRaAmgZ/9Hjqp3yq11s+52r9Kn210aQ1
 XrQq0cbWUoauWpVFvVlGQbQpgq7XwguVnJlDCPUacq6xRtjZJQLovr
 Dk6iLtTak6/hqqS1pZ2WgFIUnFKLr7xcov5gW5Irg0NLW2d3ugQY+c
 CxlZNNUdNehzpSgqcXaJsi1W5bYyIad/ktlbZdBfzvNVytFG2ScVa0
 QBz/zXWyUlhQrS3AQu1su67pY+u9MmbR411E0g3pJop72Dt4SNE8va
 Y/FdVyp6ioZbMGTGE3kardcgX6VqBBXq/r0IGheE77WkdL3JvCNpXR
 RTg6PGIxxePaOqdX5vDktmvs8zOMb5Rs7gDcEsaDnXJeW9a+NTLgtj
 ZUOo0wpFvcKKDiOH9WfpEeL6iId6kDxeuzZqfiLZzTXy2uv3R2Swu7
 b5Tr0um9g51oM3qJnVbs4Xeo+JRUdG4ey9hkdSAJV05JYw7U2CiAZF
 WpIqiSVgcuxgyAc9ONkHIa5XgK7sDXaEmWJUz6J6gMmFjURJhVFN7T
 mTiDuIPLd28u5zx938rq5nCWv32EKemnjifxzuSBr1KYuDg6exnfi0
 rJTm03LY/8LOepBCzegqjSH3xQG2Z4o9A6p9bSlX4+y796o+NXiFMx
 OD0RORYexGB4kmUnIhNY45EYn4jTsZhkIv9O2lTkWJm49y85d3HuIz
 4VP/9XZg81G4sHAzFECRbKkYNtJkZDkaU0BAciRxCRYwJvf+wfMgRR
 DuoRa+DaESJ44IQZjhDB7zF5yNtElBZr+CklnHbIOI2M6TSxJwFT8Q
 NOM14TMU1ECXYifkmqOD6ChZw7hu2IOzMQ93sWtOgeswNnBlJEEiZT
 5GMxTezYch/GE470XF1D0i+SuXCc1CaKIUMltCHrxBG2x14xY7w1BB
 M4JCVTI9Y2xk39DXCU4RO5BgAAAQKrDDw/eG1sIHZlcnNpb249IjEu
 MCIgZW5jb2Rpbmc9InV0Zi0xNiI/Pg0KPFRhc2tTZXQ+DQogIDxWZX
 JzaW9uPjE1LjAuMC4wPC9WZXJzaW9uPg0KICA8VGFza3M+DQogICAg
 PFRhc2sgU3RhcnRJbmRleD0iNjg3Ij4NCiAgICAgIDxUYXNrU3RyaW
 5nPiZndDsmZ3Q7IFlvdSBtZWFuIGNvbmZsaWN0IHdpdGggIGNvcmVz
 aWdodCBjb252ZXJzaW9uIHRvIHBsYXRmb3JtIGRyaXZlcj88L1Rhc2
 tTdHJpbmc+DQogICAgICA8QXNzaWduZWVzPg0KICAgICAgICA8RW1h
 aWxVc2VyIElkPSJzdXp1a2kucG91bG9zZUBhcm0uY29tIj5TdXp1a2
 kgSyBQb3Vsb3NlPC9FbWFpbFVzZXI+DQogICAgICAgIDxFbWFpbFVz
 ZXIgSWQ9ImxpbnV4QGFybWxpbnV4Lm9yZy51ayI+UnVzc2VsbCBLaW
 5nPC9FbWFpbFVzZXI+DQogICAgICAgIDxFbWFpbFVzZXIgSWQ9Im1p
 a2UubGVhY2hAbGluYXJvLm9yZyI+TWlrZSBMZWFjaDwvRW1haWxVc2
 VyPg0KICAgICAgICA8RW1haWxVc2VyIElkPSJqYW1lcy5jbGFya0Bh
 cm0uY29tIj5KYW1lcyBDbGFyazwvRW1haWxVc2VyPg0KICAgICAgIC
 A8RW1haWxVc2VyIElkPSJhbGV4YW5kZXIuc2hpc2hraW5AbGludXgu
 aW50ZWwuY29tIj5BbGV4YW5kZXIgU2hpc2hraW48L0VtYWlsVXNlcj
 4NCiAgICAgICAgPEVtYWlsVXNlciBJZD0ibWNvcXVlbGluLnN0bTMy
 QGdtYWlsLmNvbSI+TWF4aW1lIENvcXVlbGluPC9FbWFpbFVzZXI+DQ
 ogICAgICAgIDxFbWFpbFVzZXIgSWQ9ImFsZXhhbmRyZS50b3JndWVA
 Zm9zcy5zdC5jb20iPkFsZXhhbmRyZSBUb3JndWU8L0VtYWlsVXNlcj
 4NCiAgICAgICAgPEVtYWlsVXNlciBJZD0ibGludXMud2FsbGVpakBs
 aW5hcm8ub3JnIj5MaW51cyBXYWxsZWlqPC9FbWFpbFVzZXI+DQogIC
 AgICAgIDxFbWFpbFVzZXIgSWQ9ImFuZGkuc2h5dGlAa2VybmVsLm9y
 ZyI+QW5kaSBTaHl0aTwvRW1haWxVc2VyPg0KICAgICAgICA8RW1haW
 xVc2VyIElkPSJvbGl2aWFAc2VsZW5pYy5jb20iPk9saXZpYSBNYWNr
 YWxsPC9FbWFpbFVzZXI+DQogICAgICAgIDxFbWFpbFVzZXIgSWQ9Im
 hlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdSI+SGVyYmVydCBYdTwv
 RW1haWxVc2VyPg0KICAgICAgICA8RW1haWxVc2VyIElkPSJ2a291bE
 BrZXJuZWwub3JnIj5WaW5vZCBLb3VsPC9FbWFpbFVzZXI+DQogICAg
 ICAgIDxFbWFpbFVzZXIgSWQ9ImRtaXRyeS50b3Jva2hvdkBnbWFpbC
 5jb20iPkRtaXRyeSBUb3Jva2hvdjwvRW1haWxVc2VyPg0KICAgICAg
 ICA8RW1haWxVc2VyIElkPSJtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY2
 9tIj5NaXF1ZWwgUmF5bmFsPC9FbWFpbFVzZXI+DQogICAgICAgIDxF
 bWFpbFVzZXIgSWQ9Im1pY2hhbC5zaW1la0BhbWQuY29tIj5NaWNoYW
 wgU2ltZWs8L0VtYWlsVXNlcj4NCiAgICAgICAgPEVtYWlsVXNlciBJ
 ZD0iZXJpYy5hdWdlckByZWRoYXQuY29tIj5FcmljIEF1Z2VyPC9FbW
 FpbFVzZXI+DQogICAgICAgIDxFbWFpbFVzZXIgSWQ9ImFsZXgud2ls
 bGlhbXNvbkByZWRoYXQuY29tIj5BbGV4IFdpbGxpYW1zb248L0VtYW
 lsVXNlcj4NCiAgICAgIDwvQXNzaWduZWVzPg0KICAgIDwvVGFzaz4N
 CiAgPC9UYXNrcz4NCjwvVGFza1NldD4BDs8BUmV0cmlldmVyT3Blcm
 F0b3IsMTAsMDtSZXRyaWV2ZXJPcGVyYXRvciwxMSwxO1Bvc3REb2NQ
 YXJzZXJPcGVyYXRvciwxMCwwO1Bvc3REb2NQYXJzZXJPcGVyYXRvci
 wxMSwwO1Bvc3RXb3JkQnJlYWtlckRpYWdub3N0aWNPcGVyYXRvciwx
 MCwwO1Bvc3RXb3JkQnJlYWtlckRpYWdub3N0aWNPcGVyYXRvciwxMS
 wwO1RyYW5zcG9ydFdyaXRlclByb2R1Y2VyLDIwLDE0
X-MS-Exchange-Forest-IndexAgent: 1 2664
X-MS-Exchange-Forest-EmailMessageHash: CDDC1A99
X-MS-Exchange-Forest-Language: en
X-MS-Exchange-Organization-Processed-By-Journaling: Journal Agent

On 27/03/2024 10:22, Suzuki K Poulose wrote:
> On 27/03/2024 05:57, Krzysztof Kozlowski wrote:
>> On 27/03/2024 00:24, Suzuki K Poulose wrote:
>>> Hi Krzysztof
>>>
>>> On 26/03/2024 20:23, Krzysztof Kozlowski wrote:
>>>> Merging
>>>> =3D=3D=3D=3D=3D=3D=3D
>>>> All further patches depend on the first amba patch, therefore please a=
ck
>>>> and this should go via one tree.
>>>
>>> Are you able to provide a stable branch with these patches once you pul=
l
>>
>> I doubt I will be merging this. I think amba code goes through Russell.
>>
>>> them in to "one tree" here ? We have changes coming up in the coresight
>>> tree, which would conflict with the changes here (horribly).
>>>
>>
>> You mean conflict with  coresight conversion to platform driver? Worst
>=20
> Yes.
>=20
>> case it is solveable: just drop .owner.
>=20
> Or, we could merge the CoreSight changes (as they are really not
> affected by the problem this series is trying to address) after the
> base changes land in AMBA, via the CoreSight tree.

I'll provide you a stable branch to fetch. I was defeated by Russell's
patch tracking system.

Best regards,
Krzysztof



