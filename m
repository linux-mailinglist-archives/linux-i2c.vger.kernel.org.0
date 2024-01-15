Return-Path: <linux-i2c+bounces-1301-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FEF82DD1F
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 17:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FA901F241EA
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 16:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7F217BAF;
	Mon, 15 Jan 2024 16:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OHS6mVyz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A9217BA1
	for <linux-i2c@vger.kernel.org>; Mon, 15 Jan 2024 16:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a2dda9d67ceso110075366b.3
        for <linux-i2c@vger.kernel.org>; Mon, 15 Jan 2024 08:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705335204; x=1705940004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nVYrgvSB/hdaXbdnvDLjcsaxrQx0tnZ31np8n8fE/8Q=;
        b=OHS6mVyz0+8/YcMybmKM41RZR0pXyRq5RkLOCkJgnvl971F6q2zF5+hLS8gKdO5gfV
         Fv+iVdKYe7jnsRb6jjs9/0OkuCM8aStVUvEE1BkXnq8btG/hq84CjZqOtIPYtkZOm5VY
         MN16wONBjrBy6uieqPTovkYpgOWFB4+/LtKvPECg1ErImnKKCCvGLX1uldj6x8hsmvOF
         kDoFIXZGgRANe6DhYImwU7a3fTsfeucqr65apE913Xv7z2heTl1S1fc1myJwO+IdJmpo
         t6M0NLACaFBZVi6HpH0rgH6vnzlbGZICO8ds3UykWtCXqnoOztGoZF4RyfjVStf5/X4H
         s8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705335204; x=1705940004;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nVYrgvSB/hdaXbdnvDLjcsaxrQx0tnZ31np8n8fE/8Q=;
        b=ZloCjZUDdfEucjeD8raUBvGRp7ZTlHig+9TKahceH86Ii1qSFe/Q1hKIaOYvrzlUmu
         wXeixo+1d8wpZB+bvoXYynzgDbaoifVKmtjoMJUYTjyX1KjwTlrmiB6Valuh6McNtc+f
         PJzlbogFwX8XXhfWDb4V9E+30MFSeronDRu5odD+9HSg+6+lM1W99FVmMWAr11/fEwxB
         fgSbsXLZJppXMVInJKxqqYIiL95e864tDm9KwAZqETRCs1q4LghB6uN38NsqBePpg0QY
         RMoZxDZu6Cri4SLt3m2J2ZRsyBL2UC7ZgENt8Swh/UOC60h7AADMFoFmkYsoetyPzFnC
         Uw5A==
X-Gm-Message-State: AOJu0Yypwbjpina5MY7+eHN7rG7GfeJLrICwFa+01yKXQllqsDYrUGH/
	qyzZ9VmWL8kpqQNIGqHgwCY9KELeypc5Jg==
X-Google-Smtp-Source: AGHT+IGX2PUGrgNUH1lPba6d05WM5SWA6bVi6QLf8xtUoGPgvtwjOCgeZxIrKQOdoDMgJW+7zFTtWQ==
X-Received: by 2002:a17:906:37cc:b0:a2b:2615:25d3 with SMTP id o12-20020a17090637cc00b00a2b261525d3mr2642917ejc.136.1705335204374;
        Mon, 15 Jan 2024 08:13:24 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id bm19-20020a170906c05300b00a2362c5e3dbsm5417864ejb.151.2024.01.15.08.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 08:13:23 -0800 (PST)
Message-ID: <7f311659-9f49-44dc-ad40-977d34066d98@linaro.org>
Date: Mon, 15 Jan 2024 17:13:21 +0100
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
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Sean Anderson <sean.anderson@seco.com>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
 <20240112163608.528453-3-krzysztof.kozlowski@linaro.org>
 <CAMRc=MdcCZP5kgv7JBdy2m_naNbTSeq4MDE_3mk+1-5UD4ntwQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMRc=MdcCZP5kgv7JBdy2m_naNbTSeq4MDE_3mk+1-5UD4ntwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/01/2024 17:06, Bartosz Golaszewski wrote:
>> +
>> +static int __reset_add_reset_gpio_lookup(int id, struct device_node *np,
>> +                                        unsigned int gpio,
>> +                                        unsigned int of_flags)
>> +{
>> +       struct gpiod_lookup_table *lookup __free(kfree) = NULL;
>> +       struct gpio_device *gdev __free(gpio_device_put) = NULL;
>> +       char *label __free(kfree) = NULL;
> 
> I got yelled at by Linus Torvalds personally for doing it like this. I
> know this is a common pattern in code using GLib but Linus wants auto
> variables to be initialized where they're declared...

Declaration is here. Initialization is here. Therefore this is
initialized where it is declared. What's more it is initialized to a
valid value, because __free() accepts NULLs.

> 
>> +       unsigned int lookup_flags;
>> +
>> +       /*
>> +        * Later we map GPIO flags between OF and Linux, however not all
>> +        * constants from include/dt-bindings/gpio/gpio.h and
>> +        * include/linux/gpio/machine.h match each other.
>> +        */
>> +       if (of_flags > GPIO_ACTIVE_LOW) {
>> +               pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
>> +                       of_flags, gpio);
>> +               return -EINVAL;
>> +       }
>> +
>> +       gdev = gpio_device_find_by_fwnode(of_fwnode_handle(np));
> 
> ... so this should become:
> 
>   struct gpio_device *gdev __free(gpio_device_put) = gpio_device_find(...)
> 
> and same for the rest.
> 
> Don't get me wrong, I love cleanup.h but there's a (unofficial for
> now) coding style.

So you just want to declare it not in top-part of the function but just
before first use?

> 
>> +       if (!gdev)
>> +               return -EPROBE_DEFER;
>> +
>> +       label = kstrdup(gpio_device_get_label(gdev), GFP_KERNEL);
>> +       if (!label)
>> +               return -EINVAL;
>> +
>> +       /* Size: one lookup entry plus sentinel */
>> +       lookup = kzalloc(struct_size(lookup, table, 2), GFP_KERNEL);
>> +       if (!lookup)
>> +               return -ENOMEM;
>> +
>> +       lookup->dev_id = kasprintf(GFP_KERNEL, "reset-gpio.%d", id);
>> +       if (!lookup->dev_id)
>> +               return -ENOMEM;
>> +
>> +       lookup_flags = GPIO_PERSISTENT;
>> +       lookup_flags |= of_flags & GPIO_ACTIVE_LOW;
>> +       lookup->table[0] = GPIO_LOOKUP(no_free_ptr(label), gpio, "reset",
>> +                                      lookup_flags);
>> +
>> +       gpiod_add_lookup_table(no_free_ptr(lookup));
> 
> You told me that this doesn't need to be removed or ever freed but a
> comment on that would be in order.

Sure, code further comments on this but I can make it explicit here as well.

> 
>> +
>> +       return 0;
>> +}
>> +
>> +/*
>> + * @reset_args:        phandle to the GPIO provider with all the args like GPIO number
>> + */
>> +static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
>> +{
>> +       struct reset_gpio_lookup *rgpio_dev;
>> +       struct platform_device *pdev;
>> +       int id, ret;
>> +
>> +       /*
>> +        * Registering reset-gpio device might cause immediate
>> +        * bind, resulting in its probe() registering new reset controller thus
>> +        * taking reset_list_mutex lock via reset_controller_register().
>> +        */
>> +       lockdep_assert_not_held(&reset_list_mutex);
> 
> So how does dumping the stack help here exactly?

This is self-documenting code. dumping stack does not matter, the point
is that future developers should see this lockdep before they start
playing with new locks.

> 
>> +
>> +       mutex_lock(&reset_gpio_lookup_mutex);
>> +
>> +       list_for_each_entry(rgpio_dev, &reset_gpio_lookup_list, list) {
>> +               if (args->np == rgpio_dev->of_args.np) {
>> +                       if (__reset_gpios_args_match(args, &rgpio_dev->of_args))
>> +                               goto out; /* Already on the list, done */
>> +               }
>> +       }
>> +
>> +       id = ida_alloc(&reset_gpio_ida, GFP_KERNEL);
>> +       if (id < 0) {
>> +               ret = id;
>> +               goto err_unlock;
>> +       }
>> +
>> +       /*
>> +        * Not freed in normal path, persisent subsystem data (which is assumed
>> +        * also in the reset-gpio driver).
>> +        */
>> +       rgpio_dev = kzalloc(sizeof(*rgpio_dev), GFP_KERNEL);
>> +       if (!rgpio_dev) {
>> +               ret = -ENOMEM;
>> +               goto err_ida_free;
>> +       }
>> +
>> +       ret = __reset_add_reset_gpio_lookup(id, args->np, args->args[0],
>> +                                           args->args[1]);
>> +       if (ret < 0)
>> +               goto err_kfree;
>> +
>> +       rgpio_dev->of_args = *args;
>> +       /*
>> +        * We keep the device_node reference, but of_args.np is put at the end
>> +        * of __of_reset_control_get(), so get it one more time.
>> +        * Hold reference as long as rgpio_dev memory is valid.
>> +        */
>> +       of_node_get(rgpio_dev->of_args.np);
>> +       pdev = platform_device_register_data(NULL, "reset-gpio", id,
>> +                                            &rgpio_dev->of_args,
>> +                                            sizeof(rgpio_dev->of_args));
>> +       ret = PTR_ERR_OR_ZERO(pdev);
>> +       if (ret)
>> +               goto err_put;
>> +
>> +       list_add(&rgpio_dev->list, &reset_gpio_lookup_list);
>> +
>> +out:
>> +       mutex_unlock(&reset_gpio_lookup_mutex);
>> +
>> +       return 0;
>> +
>> +err_put:
>> +       of_node_put(rgpio_dev->of_args.np);
>> +err_kfree:
>> +       kfree(rgpio_dev);
>> +err_ida_free:
>> +       ida_free(&reset_gpio_ida, id);
>> +err_unlock:
>> +       mutex_unlock(&reset_gpio_lookup_mutex);
>> +
> 
> You're already using cleanup helpers above, why not here too? Would
> make this function much more readable and allow you to drop all but

Not sure how much it would be cleaner considering that these are not
free on success.

> the ida_free() here. Possibly you'd need to define the __free()
> callback for of_node_put() though.
> 
>> +       return ret;
>> +}
>> +
>> +static struct reset_controller_dev *__reset_find_rcdev(const struct of_phandle_args *args,
>> +                                                      bool gpio_fallback)
>> +{
>> +       struct reset_controller_dev *r, *rcdev;
>> +
>> +       lockdep_assert_held(&reset_list_mutex);
>> +
>> +       rcdev = NULL;
>> +       list_for_each_entry(r, &reset_controller_list, list) {
>> +               if (args->np == r->of_node) {
>> +                       if (gpio_fallback) {
>> +                               if (__reset_gpios_args_match(args, r->of_args)) {
>> +                                       rcdev = r;
>> +                                       break;
>> +                               }
>> +                       } else {
>> +                               rcdev = r;
>> +                               break;
>> +                       }
>> +               }
>> +       }
>> +
>> +       return rcdev;
>> +}
>> +
>>  struct reset_control *
>>  __of_reset_control_get(struct device_node *node, const char *id, int index,
>>                        bool shared, bool optional, bool acquired)
>>  {
>> +       struct of_phandle_args args = {0};
>> +       bool gpio_fallback = false;
>>         struct reset_control *rstc;
>> -       struct reset_controller_dev *r, *rcdev;
>> -       struct of_phandle_args args;
>> +       struct reset_controller_dev *rcdev;
>>         int rstc_id;
>>         int ret;
>>
>> @@ -839,39 +1028,49 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
>>                                          index, &args);
>>         if (ret == -EINVAL)
>>                 return ERR_PTR(ret);
>> -       if (ret)
>> -               return optional ? NULL : ERR_PTR(ret);
>> +       if (ret) {
>> +               /*
>> +                * There can be only one reset-gpio for regular devices, so
>> +                * don't bother with GPIO index.
>> +                */
>> +               ret = of_parse_phandle_with_args(node, "reset-gpios", "#gpio-cells",
>> +                                                0, &args);
>> +               if (ret)
>> +                       return optional ? NULL : ERR_PTR(ret);
>>
>> -       mutex_lock(&reset_list_mutex);
>> -       rcdev = NULL;
>> -       list_for_each_entry(r, &reset_controller_list, list) {
>> -               if (args.np == r->of_node) {
>> -                       rcdev = r;
>> -                       break;
>> +               gpio_fallback = true;
>> +
>> +               ret = __reset_add_reset_gpio_device(&args);
>> +               if (ret) {
>> +                       rstc = ERR_PTR(ret);
>> +                       goto out_put;
>>                 }
>>         }
>>
>> +       mutex_lock(&reset_list_mutex);
>> +       rcdev = __reset_find_rcdev(&args, gpio_fallback);
>>         if (!rcdev) {
>>                 rstc = ERR_PTR(-EPROBE_DEFER);
>> -               goto out;
>> +               goto out_unlock;
>>         }
>>
>>         if (WARN_ON(args.args_count != rcdev->of_reset_n_cells)) {
>>                 rstc = ERR_PTR(-EINVAL);
>> -               goto out;
>> +               goto out_unlock;
>>         }
>>
>>         rstc_id = rcdev->of_xlate(rcdev, &args);
>>         if (rstc_id < 0) {
>>                 rstc = ERR_PTR(rstc_id);
>> -               goto out;
>> +               goto out_unlock;
>>         }
>>
>>         /* reset_list_mutex also protects the rcdev's reset_control list */
>>         rstc = __reset_control_get_internal(rcdev, rstc_id, shared, acquired);
>>
>> -out:
>> +out_unlock:
>>         mutex_unlock(&reset_list_mutex);
>> +out_put:
>>         of_node_put(args.np);
> 
> I suggest reworking this to use cleanup.h as well.

It's independent task. This is an existing code and any refactoring to
cleanup or not is independent thing.

Best regards,
Krzysztof


