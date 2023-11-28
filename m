Return-Path: <linux-i2c+bounces-495-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2781C7FB349
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 08:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D68D7281E83
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 07:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC6B14292;
	Tue, 28 Nov 2023 07:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lQmX1+yA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D4A19B1
	for <linux-i2c@vger.kernel.org>; Mon, 27 Nov 2023 23:53:26 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50aaaf6e58fso7769349e87.2
        for <linux-i2c@vger.kernel.org>; Mon, 27 Nov 2023 23:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701158005; x=1701762805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yzl9ebikqAka4LvdE7bnKeHPsmkRzmz1194Tc0othuM=;
        b=lQmX1+yAyQmgYiT3OrddcKxxhSLfm35xjxbmU+LZL6B8S8Xro3ZKvQ6aST7BJowSVC
         wmohgsA8aLxNv70QfWTiLzQgS8JadVb52cndiXQgMR7Wh84jR+QOMGs0Q9/qkvvBw+v1
         lq0zbJPrGycY6s++RUHH+wR8mVjY68JlBQbYydMwj2HYz4URuUu3V+7x8NSrsAUzKrOo
         peB2VQptoHqFKfKUJ03wmt4xpTSTcdcwfbrbXW/jI9uVl38ItROnNYKj0IHdD9F8g3hn
         O9AJQSNWhy9TpMm2cIINv0zQ9oLlXTX7AsL5jBydnuFNGu7TdbFi5io4y8MjKny67gxb
         vWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701158005; x=1701762805;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yzl9ebikqAka4LvdE7bnKeHPsmkRzmz1194Tc0othuM=;
        b=e4JPkhs7pYZb+As23BNw1abR70FEZVu+E3jL2uC8BtMf22ZfXzyBwdVDWZl3nPaDm8
         OPclLD9MInAVRvyCjTxZlDoAVrhuU9ZFTOkmJWisbKdHQcTInc2traqqY37gNs2epnLz
         Y0utK7yChRc4JGTeIPqUy3p8h9YgJQzSgrTDAEKBXw/c5Yra3DRlbx6N5xQ/jcBfL3Fy
         6uSbx/ZF3ILnsJA4DQ8aGNgbquya+5ehdTa/lxoa0N3UZYarOIZ40a//HfoFRj69L39r
         5sY75NALlVHlSsUpILRvBa0W8RDLMOMp48rpX8ySDGtg6l7hOL0CZYmN1AaxTl9yyPKv
         1ckQ==
X-Gm-Message-State: AOJu0Ywr1rullL/pw4Xb8TZGqG2959eodffo+5zMK1Lvbc6AMBq3qjby
	wMMJ6Z+K+rlYOa0koUx9624h6qSbApUqISyYdDc=
X-Google-Smtp-Source: AGHT+IFaTbrYw9FA5q4t60WjzgXwDSJOfoZTzQ0o5RG1LQlKr+WtAS96LhfwiPQXzXVTExUhH1odtg==
X-Received: by 2002:a05:6512:12c2:b0:50b:b13f:f46a with SMTP id p2-20020a05651212c200b0050bb13ff46amr5112260lfg.3.1701158005002;
        Mon, 27 Nov 2023 23:53:25 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id xa20-20020a170907b9d400b00a0be4fec1b4sm3787635ejc.138.2023.11.27.23.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 23:53:24 -0800 (PST)
Message-ID: <ec48d23e-e224-4ba6-8f49-9110472635f6@linaro.org>
Date: Tue, 28 Nov 2023 08:53:22 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ARM: dts: add Variscite VAR-SOM-MX7 System on Module
Content-Language: en-US
To: Roland Hieber <rhi@pengutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Li Yang <leoyang.li@nxp.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Marco Felsch
 <m.felsch@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20231127-b4-imx7-var-som-gome-v1-0-f26f88f2d0bc@pengutronix.de>
 <20231127-b4-imx7-var-som-gome-v1-4-f26f88f2d0bc@pengutronix.de>
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
In-Reply-To: <20231127-b4-imx7-var-som-gome-v1-4-f26f88f2d0bc@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2023 22:11, Roland Hieber wrote:
> From: Marco Felsch <m.felsch@pengutronix.de>
> 
> Add DTSI file of Variscite VAR-SOM-MX7 System on Module in a basic
> version. While we don't have a VAR-MX7 development board at hand, we
> will use this DTSI as base for a custom board in a later commit.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Co-developed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> ---
>  arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7.dtsi | 607 +++++++++++++++++++++++
>  1 file changed, 607 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7.dtsi
> new file mode 100644
> index 000000000000..29b9b9305b81
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7.dtsi
> @@ -0,0 +1,607 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2015 Freescale Semiconductor, Inc.
> + * Copyright (C) 2016-2017 Variscite Ltd.
> + * Copyright (C) 2022 Philipp Zabel, Pengutronix
> + * Copyright (C) 2022 Roland Hieber, Pengutronix
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <dt-bindings/input/input.h>
> +#include "imx7d.dtsi"
> +
> +/ {
> +	model = "Variscite i.MX7 Dual VAR-SOM-MX7";
> +	compatible = "variscite,var-som-mx7", "fsl,imx7d";

You claim this was validated, but I don't see anywhere the binding.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).



Best regards,
Krzysztof


