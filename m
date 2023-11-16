Return-Path: <linux-i2c+bounces-192-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF9D7EE082
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 13:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BAA0B20A7A
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 12:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4794B29430;
	Thu, 16 Nov 2023 12:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dm8hPqqp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A5EEB4
	for <linux-i2c@vger.kernel.org>; Thu, 16 Nov 2023 04:14:06 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-41b7fd8f458so4020881cf.0
        for <linux-i2c@vger.kernel.org>; Thu, 16 Nov 2023 04:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700136845; x=1700741645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cebbXdRvrbvVuyDTJ/a9z4SKNIngllr1lOkeCTh7hc0=;
        b=dm8hPqqpKFwTB6TSCTaDHvyrDcNg1HJ7Y467pN//iu7kcwfmr/7D8YqrJg9TOAeWWA
         b71ihHXxH5n/loF+mHJfXIV3PV5JqCm5sdWyXNntJpwzRZIorOF4+tcJ8e6rL3vQ0tKd
         8Flhqbf4d0Ww/Cgz9yx4GqWqN2L2pvSE+PRQJdjHGSKYWjDA22MnTUEhsbIaZrcFpWvk
         3AgGJ/EprElEpdO64KGXxj6c7XjzLSRr8rnBRC07TY878EqiZr+pWD/sX61Ivkyin4AW
         fTJcvwGjNGkzTwdw77iwG/XZr1OuluiaepStDovxG3lPYg4fT5KVPS+khbctbKXjZycn
         Sz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136845; x=1700741645;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cebbXdRvrbvVuyDTJ/a9z4SKNIngllr1lOkeCTh7hc0=;
        b=mzczaBXa+7nrBLWZdwyDLkqWi4SyVN6EJvSJ8Gcrv2Vq6KTBmWFNVmiGKcS7+1FpuZ
         bSGE4jyrzTzcabWPR1MJOuBX6QOjXQBMq8qSQS1zdWl4POzD/C4kcheFOOhai5/dr7Q2
         6hLZkDlfFEqyILkt44KL87YH9e+4jsLX9mySD7wQtJzNVb9WPfVmCEqQ3GArd5zneIzQ
         4GRVjw7cEtXunSMT8wDj0GXPuzzOKFuNl6T3x11tNxnNHFH3F+iNnEzdEHzvHekpJ7R7
         Td1E+NEnODcCmaLdRfRHKrPYoVtV+hSkZ46jYloZjlDbwdcZJojegWsZ63i/6BtvxFvL
         o2LQ==
X-Gm-Message-State: AOJu0Yy/3UWHChPwXo/nqCHH9XfI+PdY2/3cUqq150cylzDxlar27KCp
	3IsE5LWZpjrUo4M7oBQoRQgxLQ==
X-Google-Smtp-Source: AGHT+IF1NL0Mg7K+4XgL7Hf64m30dmyiWpT6marfYlO7PGxs9vLOAvtbewKPLKQP+X3DBA4eGyCReg==
X-Received: by 2002:a05:622a:11c9:b0:421:c58e:f9a2 with SMTP id n9-20020a05622a11c900b00421c58ef9a2mr10452230qtk.32.1700136845585;
        Thu, 16 Nov 2023 04:14:05 -0800 (PST)
Received: from [192.168.212.13] ([12.191.197.195])
        by smtp.gmail.com with ESMTPSA id g4-20020ac870c4000000b004181e5a724csm4289781qtp.88.2023.11.16.04.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 04:14:05 -0800 (PST)
Message-ID: <caff5743-265f-43ac-83fb-4e0fb23a9ff4@linaro.org>
Date: Thu, 16 Nov 2023 13:13:58 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, patrick@stwcx.xyz,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-i2c@vger.kernel.org,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20231116023027.24855-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231116023027.24855-2-Delphine_CC_Chiu@Wiwynn.com>
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
In-Reply-To: <20231116023027.24855-2-Delphine_CC_Chiu@Wiwynn.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/11/2023 03:30, Delphine CC Chiu wrote:
> Add a device tree bindings for ltc4286 device.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> 
> -------------------------------------------------------------
> Changelog:
>   v5 - Add hyphen under "Changelog" in commit message

Apply your patch from the list and check the result... You can easily
see it's broken. We asked about ---. Please read the message carefully.

Best regards,
Krzysztof


