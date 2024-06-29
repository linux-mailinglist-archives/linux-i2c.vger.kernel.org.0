Return-Path: <linux-i2c+bounces-4502-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA0F91CD04
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 15:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0975E1F23621
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 13:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497787F487;
	Sat, 29 Jun 2024 13:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lUgoBi7P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E5447F4A
	for <linux-i2c@vger.kernel.org>; Sat, 29 Jun 2024 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719666649; cv=none; b=YIcX8r6qx8/TaYWWU0ZHR2osDK1ZeizA+jndQzsdU4eHnPM7NuxqMXBnVURLH0UO6D8YTZPa6/SY6kobjh8Ztc3DJv+uRJX6y35bcmeQCHrMGd/fO4P7GEGOtwRIqXu3luE7YRYXiLeu1eXSEZCH03Ongo7iu4RO6xB5GlIaJGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719666649; c=relaxed/simple;
	bh=Zc9sO0I5Bw+ymeOBrEoIlWnptOfQfEsWBo61k8+NyvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fmzep8eGoTi1MezDLvK5YJKA4nZbupDCTHzPRu446wD31LBIBEB9yWPeoFkPNocJrfeJKo6yWR5gsmQJwhcFHY3dWoyHfM0UhyQvQMCOwZQaIOrmCa1V9/ztvsSD1ii9tk8t6YKn1POiXXG7wuo36HjDhCfKhRRkdbzTJJJ4wlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lUgoBi7P; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a72af03ebdfso201733066b.3
        for <linux-i2c@vger.kernel.org>; Sat, 29 Jun 2024 06:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719666646; x=1720271446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NYxUnwUSohZuqH5Y3Oi4aiVD5zcwYSgn+PulSvwJzXQ=;
        b=lUgoBi7PZyZazKChLZOIhAWtoTXHWBvK73zEYmwhjyKyO/agvUBakL8OP2/pvnA4dd
         aa/xzcqwxt4nHtIkuYTBNBbJ7jhdOLJJy1c37EeyApPs9zEw1CJxgBgkDtBXWw9yNxAs
         G6oBbxhi/HqWMnSqs4t2id9i/0ZCa7lrCFz4I/HYd32APBMnUTS7uYywk1B2NyXuFKVu
         ONm6Fxbx6Wkx/8MitNmzYK2jD0CF1aXF6bmBs2RGBF6HV6IXWTgVSbToouFnJxWzAlHz
         5RJLVz2FALnnz/4gjOc3lOotpgiHqt8N9675edo998KAfsthvl7PcqEfDFwHlL+EieFr
         nzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719666646; x=1720271446;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYxUnwUSohZuqH5Y3Oi4aiVD5zcwYSgn+PulSvwJzXQ=;
        b=OZ7PK787gA7adRGNZ0U81X79mtnodbTZLkTDNJilXYCFu3baEcY+b29vl7vUQkY2R7
         fi+cSQKL4Y0EE79i8A1uR+AFSvXMby/qhae3fQ4Z0N4TrlM2S+tpwBL7GeeTYlZNgYu0
         Yw7O0JWsx5o7L4A/1gov/XHcxD1uSJR7ESGwNi+pChslKDCqlSyRM17LfWEN45eMbpvP
         G2qlWxDUDLXV1gOmkcz1oMcWj/03EGGOTMyHtigxDJTNmqMFj6xux14nbDzFTOzgS7YM
         Qn+zZWmXmoWUAoVw9ema0xtbKCn/9VtfvIMTKFbS0DU5tyeI0j2Q2wOh9sJSmr4hhpKT
         JxZA==
X-Forwarded-Encrypted: i=1; AJvYcCXcgXL6Vj3v0pvGBQtRyKBM/LxEHfDEop1iY7HXJdrNebUQhE9qrT+jf0KQ3k6GZ4DUM/QkPEBR3iq5JH/kAfrX7QNpXFFsrC2I
X-Gm-Message-State: AOJu0YxxkP2uTxitZnUrwSXnzVf6vCOqazUw4Fp50dFOwGv23rrEUR+j
	EbT6TYjF5rbGLgzb7EA3UwUAgU39oi/e4519PqzaTvv5Uup1TG/cHgYRMuzv6v8=
X-Google-Smtp-Source: AGHT+IF+d1chV2WaX+/TeZL5Zwzjo9i5T/U6DacLXmVqnZmlmiiqw31CXiOO6ryly0BzFkD1Mv1m5Q==
X-Received: by 2002:a17:907:728e:b0:a6f:9b06:6b42 with SMTP id a640c23a62f3a-a75142d855bmr67725466b.5.1719666645529;
        Sat, 29 Jun 2024 06:10:45 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab0b56a0sm163117866b.199.2024.06.29.06.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 06:10:45 -0700 (PDT)
Message-ID: <a35aacc5-a9d6-4a8e-b016-c23236413871@linaro.org>
Date: Sat, 29 Jun 2024 15:10:41 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sc7280: Add IMX577 camera sensor
To: Vikram Sharma <quic_vikramsa@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Loic Poulain <loic.poulain@linaro.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Hariram Purushothaman
 <quic_hariramp@quicinc.com>, Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
References: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
 <20240629-camss_first_post_linux_next-v1-3-bc798edabc3a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 xsFNBF9ALYUBEADWAhxdTBWrwAgDQQzc1O/bJ5O7b6cXYxwbBd9xKP7MICh5YA0DcCjJSOum
 BB/OmIWU6X+LZW6P88ZmHe+KeyABLMP5s1tJNK1j4ntT7mECcWZDzafPWF4F6m4WJOG27kTJ
 HGWdmtO+RvadOVi6CoUDqALsmfS3MUG5Pj2Ne9+0jRg4hEnB92AyF9rW2G3qisFcwPgvatt7
 TXD5E38mLyOPOUyXNj9XpDbt1hNwKQfiidmPh5e7VNAWRnW1iCMMoKqzM1Anzq7e5Afyeifz
 zRcQPLaqrPjnKqZGL2BKQSZDh6NkI5ZLRhhHQf61fkWcUpTp1oDC6jWVfT7hwRVIQLrrNj9G
 MpPzrlN4YuAqKeIer1FMt8cq64ifgTzxHzXsMcUdclzq2LTk2RXaPl6Jg/IXWqUClJHbamSk
 t1bfif3SnmhA6TiNvEpDKPiT3IDs42THU6ygslrBxyROQPWLI9IL1y8S6RtEh8H+NZQWZNzm
 UQ3imZirlPjxZtvz1BtnnBWS06e7x/UEAguj7VHCuymVgpl2Za17d1jj81YN5Rp5L9GXxkV1
 aUEwONM3eCI3qcYm5JNc5X+JthZOWsbIPSC1Rhxz3JmWIwP1udr5E3oNRe9u2LIEq+wH/toH
 kpPDhTeMkvt4KfE5m5ercid9+ZXAqoaYLUL4HCEw+HW0DXcKDwARAQABzShLb25yYWQgRHli
 Y2lvIDxrb25yYWQuZHliY2lvQGxpbmFyby5vcmc+wsGOBBMBCAA4FiEEU24if9oCL2zdAAQV
 R4cBcg5dfFgFAmQ5bqwCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQR4cBcg5dfFjO
 BQ//YQV6fkbqQCceYebGg6TiisWCy8LG77zV7DB0VMIWJv7Km7Sz0QQrHQVzhEr3trNenZrf
 yy+o2tQOF2biICzbLM8oyQPY8B///KJTWI2khoB8IJSJq3kNG68NjPg2vkP6CMltC/X3ohAo
 xL2UgwN5vj74QnlNneOjc0vGbtA7zURNhTz5P/YuTudCqcAbxJkbqZM4WymjQhe0XgwHLkiH
 5LHSZ31MRKp/+4Kqs4DTXMctc7vFhtUdmatAExDKw8oEz5NbskKbW+qHjW1XUcUIrxRr667V
 GWH6MkVceT9ZBrtLoSzMLYaQXvi3sSAup0qiJiBYszc/VOu3RbIpNLRcXN3KYuxdQAptacTE
 mA+5+4Y4DfC3rUSun+hWLDeac9z9jjHm5rE998OqZnOU9aztbd6zQG5VL6EKgsVXAZD4D3RP
 x1NaAjdA3MD06eyvbOWiA5NSzIcC8UIQvgx09xm7dThCuQYJR4Yxjd+9JPJHI6apzNZpDGvQ
 BBZzvwxV6L1CojUEpnilmMG1ZOTstktWpNzw3G2Gis0XihDUef0MWVsQYJAl0wfiv/0By+XK
 mm2zRR+l/dnzxnlbgJ5pO0imC2w0TVxLkAp0eo0LHw619finad2u6UPQAkZ4oj++iIGrJkt5
 Lkn2XgB+IW8ESflz6nDY3b5KQRF8Z6XLP0+IEdLOOARkOW7yEgorBgEEAZdVAQUBAQdAwmUx
 xrbSCx2ksDxz7rFFGX1KmTkdRtcgC6F3NfuNYkYDAQgHwsF2BBgBCAAgFiEEU24if9oCL2zd
 AAQVR4cBcg5dfFgFAmQ5bvICGwwACgkQR4cBcg5dfFju1Q//Xta1ShwL0MLSC1KL1lXGXeRM
 8arzfyiB5wJ9tb9U/nZvhhdfilEDLe0jKJY0RJErbdRHsalwQCrtq/1ewQpMpsRxXzAjgfRN
 jc4tgxRWmI+aVTzSRpywNahzZBT695hMz81cVZJoZzaV0KaMTlSnBkrviPz1nIGHYCHJxF9r
 cIu0GSIyUjZ/7xslxdvjpLth16H27JCWDzDqIQMtg61063gNyEyWgt1qRSaK14JIH/DoYRfn
 jfFQSC8bffFjat7BQGFz4ZpRavkMUFuDirn5Tf28oc5ebe2cIHp4/kajTx/7JOxWZ80U70mA
 cBgEeYSrYYnX+UJsSxpzLc/0sT1eRJDEhI4XIQM4ClIzpsCIN5HnVF76UQXh3a9zpwh3dk8i
 bhN/URmCOTH+LHNJYN/MxY8wuukq877DWB7k86pBs5IDLAXmW8v3gIDWyIcgYqb2v8QO2Mqx
 YMqL7UZxVLul4/JbllsQB8F/fNI8AfttmAQL9cwo6C8yDTXKdho920W4WUR9k8NT/OBqWSyk
 bGqMHex48FVZhexNPYOd58EY9/7mL5u0sJmo+jTeb4JBgIbFPJCFyng4HwbniWgQJZ1WqaUC
 nas9J77uICis2WH7N8Bs9jy0wQYezNzqS+FxoNXmDQg2jetX8en4bO2Di7Pmx0jXA4TOb9TM
 izWDgYvmBE8=
In-Reply-To: <20240629-camss_first_post_linux_next-v1-3-bc798edabc3a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.06.2024 8:32 PM, Vikram Sharma wrote:
> Add support for IMX577 camera sensor for SC7280 SoC.
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 9ac251fec262..1c99ee09a11a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -5167,6 +5167,39 @@ cci3_sleep: cci3-sleep-state {
>  				bias-pull-down;
>  			};
>  
> +			cam2_default: cam2-default {
> +				rst {
> +					pins = "gpio78"; /*cam3*/

You can drop these comments.. the node name and label suggest this is
cam*2* anyway

> +					function = "gpio";
> +					drive-strength = <2>;
> +					bias-disable;
> +				};
> +
> +				mclk {
> +					pins = "gpio67"; /*cam3*/
> +					function = "cam_mclk";
> +					drive-strength = <2>; /*RB5 was 16 and i changed to 2 here*/

/* why? */

Konrad

