Return-Path: <linux-i2c+bounces-1412-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7FF836418
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 14:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0381529160A
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 13:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612393CF51;
	Mon, 22 Jan 2024 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VCdI5w7f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DCA3C6AB
	for <linux-i2c@vger.kernel.org>; Mon, 22 Jan 2024 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705929105; cv=none; b=prEqIM/2vkEvDZY3d5QDOZsH0hi3f5FJXvCDEBUDeO+a06BJelHftSanAvb72IcPNbVQhuGJ1Ka7Cb87NCeGN8pVew4JLd3b0VGjBF7+jRR8exddSiM4nCKH529VkcH/2ufnXqga+jAbdZepKaYEMX4ZhB8W9XdJQ/vxPafiMPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705929105; c=relaxed/simple;
	bh=iFqukQALJCEAIiVjNq5raCIZC+Wze+COrL+a+qV52eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkcmlMlnn6wuzooeEQaVw5EueWt8PuqJGab9iDDNgzzcbDJDfFAojcQwBFcx0kPazqSwvBii1b8YNoA73o+FcE8JpRMr4QLYJpghcazUUwprSTgc+r0b2aZaWysxWboY0BtCUjk8Ld7TlBLu7in7N423097U4S0uHvZ971psJGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VCdI5w7f; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e80046246so18367555e9.1
        for <linux-i2c@vger.kernel.org>; Mon, 22 Jan 2024 05:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705929101; x=1706533901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BJTj6wcyWR9x7Ucgj0b0lcsFzl50SFu9dv/wKBaBgMA=;
        b=VCdI5w7fUY1u6Tj5b10GH4zay07JvivyjbNjXMoNGV5KLrwIC2uMgp2cWn0XEgc3cU
         ZoC6XpfJJC3Gy53b8FeUkShNvN9d1Ub3j6OIATzUxl1wwOdK6w0AU3cCa0E0koNjjWXK
         vODypDk34r0txnx90gvwe0RwaJA0EtxdLnnI9HU63HTQnkd1A6UTdusZue57WlS5pcLH
         OW1YFgNwHxwm/afiyERmu4Zpp/KI335IUeNMS4OKDNCKOqQobCz83OKImZV0CU1Darfc
         BztyUxivPRaDfVcDtXcbiIzwZMOYEMRCpCRORkH5yXjUY0aODD1NXxdBfKLhVbXaQSAa
         Oi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705929101; x=1706533901;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJTj6wcyWR9x7Ucgj0b0lcsFzl50SFu9dv/wKBaBgMA=;
        b=ZeIT/MJG+CEUGCVv6qvqTjwceBZolM0vNAFUMPcPEKa3APW2/XJ8vmTtWjOutyCxNV
         A6SKM0kETRRInD1Irv15SncrVgizYurIhyctTwAyuzTsIykON8qWMpCl1DQdoETQjX6j
         RfW917mK8zU2VJx+SmZEDMuHP/CX8rkbVHV8qa44qGnknXG29Sqycuc6h7IypFmYuEKq
         1vddZJBnYCKG6LJCcIFRzaxfzW/9jlrkkKoIFRiMdcBVsO9KcPiXu2qEuecoEmlQupEF
         0sNT8LiJCT/eNb+VdAgKFkUCiGZGYlmKBwNTZpyZ8HpKp/3/NJ6ZoOoHHoQtqSjfhkrt
         piig==
X-Gm-Message-State: AOJu0Yyy5LXgVtlWuVXXm+lJ4YneEHK6YnQGBioky8nlfc3DyqYJWDiZ
	Di29VCvjCRR+fO/gLYLM+qA1JvKEdhH1AB2E1Dv4nnYkG6uNXuivbOUPaoC9APw=
X-Google-Smtp-Source: AGHT+IHK2+u5+MnXNXD7DKeV3qS/mQwoZUY4TJrsybH5bmAYbgj9bb8ovK88rIKT2dPkIvOX2gIAYQ==
X-Received: by 2002:a05:600c:4f55:b0:40e:a366:e718 with SMTP id m21-20020a05600c4f5500b0040ea366e718mr1867040wmq.42.1705929100682;
        Mon, 22 Jan 2024 05:11:40 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id u13-20020a05600c19cd00b0040e451fd602sm42841958wmq.33.2024.01.22.05.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 05:11:40 -0800 (PST)
Message-ID: <403b997a-ec01-4d41-a764-aea376f86362@linaro.org>
Date: Mon, 22 Jan 2024 14:11:38 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] reset: Instantiate reset GPIO controller for
 shared reset-gpios
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Sean Anderson <sean.anderson@seco.com>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
 <20240112163608.528453-3-krzysztof.kozlowski@linaro.org>
 <568dc713f0c2fa29e5ba7b25c2d1d0e2be96fa95.camel@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <568dc713f0c2fa29e5ba7b25c2d1d0e2be96fa95.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/01/2024 17:55, Philipp Zabel wrote:
> On Fr, 2024-01-12 at 17:36 +0100, Krzysztof Kozlowski wrote:
>>  
>> +static bool __reset_gpios_args_match(const struct of_phandle_args *a1,
>> +				     const struct of_phandle_args *a2)
>> +{
>> +	unsigned int i;
>> +
>> +	if (!a2)
>> +		return false;
>> +
>> +	if (a1->args_count != a2->args_count)
>> +		return false;
>> +
>> +	for (i = 0; i < a1->args_count; i++)
>> +		if (a1->args[i] != a2->args[i])
>> +			return false;
>> +
>> +	return true;
>> +}
> 
> How about making this
> 
> 	return a2 &&
> 	       a1->np == a2->np &&
> 	       a1->args_count == a2->args_count &&
> 	       !memcmp(a1->args, a2->args, sizeof(a1->args[0]) * a1->args_count);
> 
> ?
> 
> There's similar code in include/linux/cpufreq.h, maybe this could later
> be lifted into a common of_phandle_args_equal().

I'll make a helper because such long return is also not the fastest to
parse by brain.

> 
>> +
>> +static int __reset_add_reset_gpio_lookup(int id, struct device_node *np,
>> +					 unsigned int gpio,
>> +					 unsigned int of_flags)
>> +{
>> +	struct gpiod_lookup_table *lookup __free(kfree) = NULL;
>> +	struct gpio_device *gdev __free(gpio_device_put) = NULL;
>> +	char *label __free(kfree) = NULL;
>> +	unsigned int lookup_flags;
>> +
>> +	/*
>> +	 * Later we map GPIO flags between OF and Linux, however not all
>> +	 * constants from include/dt-bindings/gpio/gpio.h and
>> +	 * include/linux/gpio/machine.h match each other.
>> +	 */
>> +	if (of_flags > GPIO_ACTIVE_LOW) {
>> +		pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
>> +			of_flags, gpio);
>> +		return -EINVAL;
>> +	}
>> +
>> +	gdev = gpio_device_find_by_fwnode(of_fwnode_handle(np));
>> +	if (!gdev)
>> +		return -EPROBE_DEFER;
>> +
>> +	label = kstrdup(gpio_device_get_label(gdev), GFP_KERNEL);
>> +	if (!label)
>> +		return -EINVAL;
> 
> The kstrdup() failure looks like it should be -ENOMEM to me.
> I'd check the gpio_device_get_label(gdev) return value separately.

OK, makes sense. One more local variable will be needed for that.

> 
> Is this going to be in v6.8-rc1, or does using gpio_device_get_label()
> introduce a dependency?

We were already in the merge window, so no problem here.
gpio_device_get_label() is in v6.8-rc1.


> 
>> +
>> +	/* Size: one lookup entry plus sentinel */
>> +	lookup = kzalloc(struct_size(lookup, table, 2), GFP_KERNEL);
>> +	if (!lookup)
>> +		return -ENOMEM;
>> +
>> +	lookup->dev_id = kasprintf(GFP_KERNEL, "reset-gpio.%d", id);
>> +	if (!lookup->dev_id)
>> +		return -ENOMEM;
>> +
>> +	lookup_flags = GPIO_PERSISTENT;
>> +	lookup_flags |= of_flags & GPIO_ACTIVE_LOW;
>> +	lookup->table[0] = GPIO_LOOKUP(no_free_ptr(label), gpio, "reset",
>> +				       lookup_flags);
>> +
>> +	gpiod_add_lookup_table(no_free_ptr(lookup));
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * @reset_args:	phandle to the GPIO provider with all the args like GPIO number
> 
> s/reset_//

ack

> 
>> + */
>> +static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
>> +{
>> +	struct reset_gpio_lookup *rgpio_dev;
>> +	struct platform_device *pdev;
>> +	int id, ret;
>> +
>> +	/*
>> +	 * Registering reset-gpio device might cause immediate
>> +	 * bind, resulting in its probe() registering new reset controller thus
>> +	 * taking reset_list_mutex lock via reset_controller_register().
>> +	 */
>> +	lockdep_assert_not_held(&reset_list_mutex);
>> +
>> +	mutex_lock(&reset_gpio_lookup_mutex);
>> +
>> +	list_for_each_entry(rgpio_dev, &reset_gpio_lookup_list, list) {
>> +		if (args->np == rgpio_dev->of_args.np) {
>> +			if (__reset_gpios_args_match(args, &rgpio_dev->of_args))
>> +				goto out; /* Already on the list, done */
>> +		}
>> +	}
>> +
>> +	id = ida_alloc(&reset_gpio_ida, GFP_KERNEL);
>> +	if (id < 0) {
>> +		ret = id;
>> +		goto err_unlock;
>> +	}
>> +
>> +	/*
>> +	 * Not freed in normal path, persisent subsystem data (which is assumed
>> +	 * also in the reset-gpio driver).
>> +	 */
>> +	rgpio_dev = kzalloc(sizeof(*rgpio_dev), GFP_KERNEL);
>> +	if (!rgpio_dev) {
>> +		ret = -ENOMEM;
>> +		goto err_ida_free;
>> +	}
>> +
>> +	ret = __reset_add_reset_gpio_lookup(id, args->np, args->args[0],
>> +					    args->args[1]);
>> +	if (ret < 0)
>> +		goto err_kfree;
>> +
>> +	rgpio_dev->of_args = *args;
>> +	/*
>> +	 * We keep the device_node reference, but of_args.np is put at the end
>> +	 * of __of_reset_control_get(), so get it one more time.
>> +	 * Hold reference as long as rgpio_dev memory is valid.
>> +	 */
>> +	of_node_get(rgpio_dev->of_args.np);
>> +	pdev = platform_device_register_data(NULL, "reset-gpio", id,
>> +					     &rgpio_dev->of_args,
>> +					     sizeof(rgpio_dev->of_args));
>> +	ret = PTR_ERR_OR_ZERO(pdev);
>> +	if (ret)
>> +		goto err_put;
>> +
>> +	list_add(&rgpio_dev->list, &reset_gpio_lookup_list);
>> +
>> +out:
>> +	mutex_unlock(&reset_gpio_lookup_mutex);
>> +
>> +	return 0;
>> +
>> +err_put:
>> +	of_node_put(rgpio_dev->of_args.np);
>> +err_kfree:
>> +	kfree(rgpio_dev);
>> +err_ida_free:
>> +	ida_free(&reset_gpio_ida, id);
>> +err_unlock:
>> +	mutex_unlock(&reset_gpio_lookup_mutex);
>> +
>> +	return ret;
>> +}
>> +
>> +static struct reset_controller_dev *__reset_find_rcdev(const struct of_phandle_args *args,
>> +						       bool gpio_fallback)
>> +{
>> +	struct reset_controller_dev *r, *rcdev;
> 
> Now that this is moved into a function, there's no need for the r,
> rcdev split anymore. Just return a match when found, and NULL at the
> end:
> 
> 	struct reset_controller_dev *rcdev;

Indeed, thanks.

> 
>> +
>> +	lockdep_assert_held(&reset_list_mutex);
>> +
>> +	rcdev = NULL;
>> +	list_for_each_entry(r, &reset_controller_list, list) {
> 
> 	list_for_each_entry(rcdev, &reset_controller_list, list) {
> 
>> +		if (args->np == r->of_node) {
>> +			if (gpio_fallback) {
>> +				if (__reset_gpios_args_match(args, r->of_args)) {
>> +					rcdev = r;
>> +					break;
> 
> 					return rcdev;
> 
>> +				}
>> +			} else {
>> +				rcdev = r;
>> +				break;
>> +			}
>> +		}
> 
> With the np check moved into __reset_gpios_args_match() above, the
> whole loop could be turned into:
> 
> 		if (gpio_fallback) {
> 			if (__reset_gpios_args_match(args, rcdev->of_args))
> 				return rcdev;
> 		} else {
> 			if (args->np == rcdev->of_node)
> 				return rcdev;
> 		}
> 
> Explicitly checking against rcdev->of_args->np instead of rcdev-
>> of_node in gpio_fallback mode could avoid false positives in case
> anybody ever creates a combined GPIO and reset controller device and
> then uses its GPIOs to drive a shared reset line..

ack

> 
>> +	}
>> +
>> +	return rcdev;
> 
> 	return NULL;

ack

> 
>> +}
>>
>>  struct reset_control *
>>  __of_reset_control_get(struct device_node *node, const char *id, int index,
>>  		       bool shared, bool optional, bool acquired)
>>  {
>> +	struct of_phandle_args args = {0};
> 
> Is this still needed?

I will double check.

> 
>> +	bool gpio_fallback = false;
>>  	struct reset_control *rstc;
>> -	struct reset_controller_dev *r, *rcdev;
>> -	struct of_phandle_args args;
>> +	struct reset_controller_dev *rcdev;
>>  	int rstc_id;
>>  	int ret;
>>  
>> @@ -839,39 +1028,49 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
>>  					 index, &args);
>>  	if (ret == -EINVAL)
>>  		return ERR_PTR(ret);
>> -	if (ret)
>> -		return optional ? NULL : ERR_PTR(ret);
>> +	if (ret) {
>> +		/*
>> +		 * There can be only one reset-gpio for regular devices, so
>> +		 * don't bother with GPIO index.
>> +		 */
>> +		ret = of_parse_phandle_with_args(node, "reset-gpios", "#gpio-cells",
>> +						 0, &args);
>> +		if (ret)
>> +			return optional ? NULL : ERR_PTR(ret);
>>  
>> -	mutex_lock(&reset_list_mutex);
>> -	rcdev = NULL;
>> -	list_for_each_entry(r, &reset_controller_list, list) {
>> -		if (args.np == r->of_node) {
>> -			rcdev = r;
>> -			break;
>> +		gpio_fallback = true;
>> +
>> +		ret = __reset_add_reset_gpio_device(&args);
>> +		if (ret) {
>> +			rstc = ERR_PTR(ret);
>> +			goto out_put;
>>  		}
>>  	}
>>  
>> +	mutex_lock(&reset_list_mutex);
>> +	rcdev = __reset_find_rcdev(&args, gpio_fallback);
>>  	if (!rcdev) {
>>  		rstc = ERR_PTR(-EPROBE_DEFER);
>> -		goto out;
>> +		goto out_unlock;
>>  	}
>>  
>>  	if (WARN_ON(args.args_count != rcdev->of_reset_n_cells)) {
> 
> Nice. I like that the __of_reset_control_get() changes are much less
> invasive now.
> 
>>  		rstc = ERR_PTR(-EINVAL);
>> -		goto out;
>> +		goto out_unlock;
>>  	}
>>  
>>  	rstc_id = rcdev->of_xlate(rcdev, &args);
>>  	if (rstc_id < 0) {
>>  		rstc = ERR_PTR(rstc_id);
>> -		goto out;
>> +		goto out_unlock;
>>  	}
>>  
>>  	/* reset_list_mutex also protects the rcdev's reset_control list */
>>  	rstc = __reset_control_get_internal(rcdev, rstc_id, shared, acquired);
>>  
>> -out:
>> +out_unlock:
>>  	mutex_unlock(&reset_list_mutex);
>> +out_put:
>>  	of_node_put(args.np);
>>  
>>  	return rstc;
>> diff --git a/include/linux/reset-controller.h b/include/linux/reset-controller.h
>> index 0fa4f60e1186..e064473215de 100644
>> --- a/include/linux/reset-controller.h
>> +++ b/include/linux/reset-controller.h
>> @@ -61,6 +61,9 @@ struct reset_control_lookup {
>>   * @dev: corresponding driver model device struct
>>   * @of_node: corresponding device tree node as phandle target
>>   * @of_reset_n_cells: number of cells in reset line specifiers
>> + * TODO: of_args have of_node, so we have here duplication
> 
> Any plans what to do about this? With the above changes we could
> mandate that either of_node or of_args should be set, never both.

Yes, makes sense. We could also drop of_node, but the code won't be more
readable.

Best regards,
Krzysztof


