Return-Path: <linux-i2c+bounces-1878-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A3F85B834
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Feb 2024 10:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FA26B28DD9
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Feb 2024 09:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9D460DF0;
	Tue, 20 Feb 2024 09:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S0k2SM1Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4835FDA2
	for <linux-i2c@vger.kernel.org>; Tue, 20 Feb 2024 09:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708422605; cv=none; b=UWdp3Jrl4ToKDy77y7YtGDv6Ul4xwnjqV5lWLhoyNZmUGkEBseTpub7huQEdnGXXbyeF6AaszBqypjhAKUcenaOeHsS5xg6xAjW079PKyrXNNYYUMDzRoQeoXc00Oy/XAjvGL6J8qYl/jXhS6aotH/7I+7WYg6la11UQ3jPgIhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708422605; c=relaxed/simple;
	bh=lsQhrl07NU9DvhxC+y0Qv1a0Ty3WWDaIUaM1Cq0PIfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvlbFRpyJoLhPPTC9AdLpfAHInux8dY66isUUT+p+whPXAdPdCxrDbbmMU2CldyPsC3ty5RJgKPZPzQhYVKMRaeZ+6lLNX1CbfvMKgk1TFpMdcn4RQ1bNKP+9PYyboRf4BtS1lNFoRNpGSLyjzv7+p5EpVAtNWBOzHR277HuzHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S0k2SM1Z; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33d32f74833so1473683f8f.3
        for <linux-i2c@vger.kernel.org>; Tue, 20 Feb 2024 01:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708422602; x=1709027402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UiakybdHbx8rY7NnuZZDYCRnrnocjLmFHQX/4uXHnW0=;
        b=S0k2SM1Z5lY6rRgU0kB5ZH7QNEJ+xwl/+Rr6nHN28swL47UZJbGec87WJFEcCLNM/d
         /JC7WomDg3d5yxlsmvuUQ282t+iYYLFa7saUDX0VGus6FNKdQdF9J+scPdBBzKRFKnKM
         EDgWyDkaA/hfhcgfrQ3TbiRf6KNZp1R05fxRp3JydZe1wMZAnRZAEjpYODxkGmtxrEeS
         3lT4MfWRQG/vh7kPrKE7nKmtfyGljuL3uXk7HSwx7l6aqZXK6UKYsyVBM2HUS291wxtk
         Jz9UDuherpHHl6AEPzCN8ZUI+rMg7ranLRlg31XTLoSw5sDcX5NTicUwwfhpbavgwO+t
         DNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708422602; x=1709027402;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UiakybdHbx8rY7NnuZZDYCRnrnocjLmFHQX/4uXHnW0=;
        b=Gsf6dpiyc3aauitcE8RUCYtTJCRegpk6UO0uvWiNXc574fJlBsXTZ/ZebgJKlUDwF+
         x9A4A5/74NSu469MZ9t723NPQROeZk9aTd1Y8PBKA3354ZGxGUyJ5jkIfWOGJIRRGzNJ
         B9SIiepsMb23+pUOpXwKXZ/6+ALmnmQpn4nPXxAZOEO2EDk6OjhOfehGtCNHWALjJsY8
         hyXVuLhGo5iCGOzimvY61QSQq0ODKG3uAoWQw+tKrZhPQac3yksFSGnisjB2+E5gh6+1
         n1za4zUhYomA6zwa8SOEcUwk/IC0GvpqqTrPdBMZ7wvbflJ5QSyYWKVbFPBnKAL9cLy+
         QiLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD9Mce9DYb2tTcrnZbXClGZK1OHqyNFaxF9pETl1Bk9hfFOo9qDIgXiU42PFU3A3H+fDNoPASnQ4zL+kFzz+8JdYtuCw2xB/vT
X-Gm-Message-State: AOJu0Yw+1qhpGfRmnKkObvcbRUUgqP+TiGvcmU9ys2gTkDvTziDYuxB1
	cI1K9nL2eCCFUjXgIiyTPdb4yELpXLoddMbQdckn/JYmebWGCn6fNl1+ZTm+QlI=
X-Google-Smtp-Source: AGHT+IE0aDSPjWECdAQ7HrYvb5CxiRvQrtXOKiRy5SNiUVy0PGuLwKURzvzfKJiYt9bm15vacoJflA==
X-Received: by 2002:a5d:6912:0:b0:33d:2629:c518 with SMTP id t18-20020a5d6912000000b0033d2629c518mr5819994wru.64.1708422601761;
        Tue, 20 Feb 2024 01:50:01 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d4010000000b0033b888a0a63sm13016570wrp.0.2024.02.20.01.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 01:50:01 -0800 (PST)
Message-ID: <37116892-bb59-4c40-85e2-8e1b4bc96b5f@linaro.org>
Date: Tue, 20 Feb 2024 10:49:59 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] dt-bindings: i2c: nomadik: add mobileye,eyeq5-i2c
 bindings and example
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-2-19a336e91dca@bootlin.com>
 <20240216022227.GA850600-robh@kernel.org>
 <CZ6FD7EHIJDT.32IEDVT9FG2GP@bootlin.com>
 <6effca50-29a4-43b9-86eb-310bd4e08e5c@linaro.org>
 <CZ6FUECKEX2B.36QWZZA5EYPI@bootlin.com>
 <cf360cbf-7414-4024-8bdd-d2aba7f048b3@linaro.org>
 <CZ93KAA53F8G.38AUM6RZGUYY7@bootlin.com>
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
In-Reply-To: <CZ93KAA53F8G.38AUM6RZGUYY7@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/02/2024 14:41, Théo Lebrun wrote:
> Hello,
> 
> On Sat Feb 17, 2024 at 9:25 AM CET, Krzysztof Kozlowski wrote:
>> On 16/02/2024 11:40, Théo Lebrun wrote:
>>> On Fri Feb 16, 2024 at 11:33 AM CET, Krzysztof Kozlowski wrote:
>>>> On 16/02/2024 11:18, Théo Lebrun wrote:
>>>>>
>>>>>>> +        mobileye,id:
>>>>>>> +          $ref: /schemas/types.yaml#/definitions/uint32
>>>>>>> +          description: Platform-wide controller ID (integer starting from zero).
>>>>>>
>>>>>> instance indexes are a NAK. You can use i2cN aliases if you must.
>>>>>>
>>>>>> Why do you need it? To access OLB? If so, add cell args to the OLB 
>>>>>> phandle instead.
>>>>>
>>>>> Why we do what we do: I2C controller must write a 2 bit value depending
>>>>> on the bus speed. All I2C controllers write into the same register.
>>>>
>>>> Which register?  Your devices do not share IO address space.
>>>
>>> mobileye,olb is a prop with a phandle to a syscon. That syscon contains
>>> the register we are interested in.
>>
>> So exactly what Rob said... I don't understand why you have chosen to go
>> with alias.
> 
> I had misunderstood Rob's original message. Now that I've done some
> tests to use cells I get what was meant. I'd have a follow-up question.
> What should the cells contain? I see two options:
> 
>  - phandle + I2C controller global index (from 0 thru 4). Then Linux
>    (or other) driver know how to map that index to register + mask
>    combo. ie:
> 
>       i2c2: i2c@500000 {
>          compatible = "mobileye,eyeq5-i2c", "arm,primecell";
>          reg = <0 0x500000 0x0 0x1000>;
>          /* ... */
>          mobileye,olb = <&olb 2>;
>       };
> 
>  - phandle + register offset + mask. ie:
> 
>       i2c2: i2c@500000 {
>          compatible = "mobileye,eyeq5-i2c", "arm,primecell";
>          reg = <0 0x500000 0x0 0x1000>;
>          /* ... */
>          mobileye,olb = <&olb 0xB8 0x300>; /* phandle + offset + mask */
>       };

Whichever works for your current and possibly future needs and hardware,
because property should have one meaning. It's anyway specific to the
property. Second option is quite popular. Please design it for entire
hardware, not for this one particular case.

Best regards,
Krzysztof


