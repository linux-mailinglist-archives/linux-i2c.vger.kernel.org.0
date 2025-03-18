Return-Path: <linux-i2c+bounces-9875-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE56A669BB
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 06:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27E671895C02
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 05:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681531DDC34;
	Tue, 18 Mar 2025 05:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cwgqgpzy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981031DD0D5;
	Tue, 18 Mar 2025 05:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742276658; cv=none; b=gpCgRLxkIgW+9hGnxM4cADHFw/wjdmD8JJGkg9QvOcqGdwnrt37kT34liAQBJnHhAKYmJtORx9RGTSluTEKgmDiEDqX2FB9JIaDV0NP6n0Mc7XSL+vriX6JEwwlvZGkDSOmUyR89XrYek7eT1J3VakFg9oAIIma6XRZaYgoCWoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742276658; c=relaxed/simple;
	bh=++xiDYQBqwQPWf46v+TtQ6Rz7NRDZMdVj8iDgBtc3GY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JdWjTVQyaqcrn5/Y62X1zthwS60ckwrx3vsH9I65DlkkLAvL8nSLd9u3h7GL2UJMiHvYs74loRQ0/MxauVRzqKjefs/nha6/kFjg187z+SQ3CWmr1OmcD+ozVUeSEBbiWrToHksr0CJ8aB2JBTLImHh2HYI8QL7Ybr7Q5s8PhlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cwgqgpzy; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-225a28a511eso86633175ad.1;
        Mon, 17 Mar 2025 22:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742276656; x=1742881456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4PjJyZg36ViwqvSldxrB9EBP1m7xv7NYMkTSh+jaEjw=;
        b=Cwgqgpzyu0OBJXRZz6dvEcT2M+aUsL47Mp95SVdV4C/GxWv8+20KqBzEQreNHE+0cO
         vO3UeEvoc2sZ2gv3mm0P5/7Hfa5UBnpqWWnRZXEhCBs6XOsKCtOWihhkJOeQvDYfIgo4
         rw+xTYDa4YpMPzF7pscPzyxxHFqfnfiJoH6aPqoTSOfVwI7vSUWDY0mo97KJpWr4C9b2
         bvHrcG5QOLkC11cWOtT5x80u80WJNUVGGK9J+SMHsEcwaB7Z6wgi6W73hF8ddAQB+Rmw
         LrpXIpw7oIspRevE/6Rax6xVNLnq5ougUuca1yjxm+g/gsObD1N5/PPpwJ14KTMArZ4k
         Q4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742276656; x=1742881456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4PjJyZg36ViwqvSldxrB9EBP1m7xv7NYMkTSh+jaEjw=;
        b=lb2WLcZ+Xn/ciYktSRQzBoDmjIwIAr6/SBIVnHj/YBOkknSLmL88xMvXbJMCHd6YMY
         5D1GB0ihG5+1WCh9/8uJqOFQy968kk6QowtJzjFZ58Nje8Av4DFsqxc/Vxk6VwAufmG3
         dwgtdAh1Bby6Om18Wr5YiwqQ3KpWi91zhgEUxRQ6tRrsBZdG933IaNUIdkjSQ+TNSbAZ
         rNc360EcfzM40RQLc4A6hDMDMcJqVjv5uDNux1czZjBdC+dsh7vRHS99xZ9T/8SiOxiQ
         GCmo5+s3dvJeV0WgPdUzWZayu2bReNOxLEIafER9yOsPZ9pwliM2JhBo1aoxbLzrAPzc
         1O4g==
X-Forwarded-Encrypted: i=1; AJvYcCU5lAO6QOLYoq+cJbshaLiubAtM9N9lA4P/ZHH1VZb04s5vWnFVTzfaV1W7fRkjOZpJTt8VnN715r2F@vger.kernel.org, AJvYcCX8GsfYmu50JX4DSckM34jo0ae79JOhBtZihug1KNS5JMeNqQH0+zYJ/nP9IRradOw2171ViKaDL7ja@vger.kernel.org, AJvYcCXx5ur0GHL69UfzztrgMgc/SpzQbU8eSNa/ZC/VzLlSlCiYN0WktQUdF9goHlXeNGrHOaTv2Ki582BFdQJw@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ76p80fE+mSHFXIiX2GCQlqPQXWYKOUIyiJ6R1AumR9eqs7RY
	l7W+23wjSA0dv1xG4fywCXfUN6y9WWEksnXLP+ruxSM1/Da9JE6L
X-Gm-Gg: ASbGncsAj58Ff2C75NKfXqyFrfpNkC/Loer4k5YP9i2/qsT7847Z76KS7P1lpD/uIWX
	K5NlX3WXL9wL7QGUm0lMFdG16wIXl8LRxgJzGuGomgXyCJ6PHVFoquXzqTfTxhLP3TyMySblnUU
	gdXZ7yJTtS5YbB9m+RRUJ0difIwR0GacBOQjKTqzfN5jE8jGqxYllvNYvsvvp+uc/PVZiY6YoKL
	yLAK417oFApKDfkGzlpw/QXxCohQB8Ihbz5kZ+JMaL+CfocNDiAXxy6ycRLwiZr/C61dXQa+R2Q
	Mr0vA7jgup2Yc9LjkJ5vJN18uD+hNLPNWg==
X-Google-Smtp-Source: AGHT+IEG4+hnkrP/C2d3aMrojCXyVkPU61K+TAm8adcwhXu+66VTKGntSE5/7EnwZH0/VFjuGJm+Xg==
X-Received: by 2002:a17:903:228d:b0:21f:61a9:be7d with SMTP id d9443c01a7336-225e0b195fbmr207827245ad.49.1742276655724;
        Mon, 17 Mar 2025 22:44:15 -0700 (PDT)
Received: from [192.168.5.101] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4df4sm85134265ad.240.2025.03.17.22.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 22:44:15 -0700 (PDT)
Message-ID: <c7dc26a0-7cbc-4909-b2ac-582d108fc5e7@gmail.com>
Date: Tue, 18 Mar 2025 13:44:06 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v7 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Alex Elder <elder@ieee.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
 <20250316-k1-i2c-master-v7-2-f2d5c43e2f40@gmail.com>
 <401059d0-6b2c-4c40-8c4d-51749dca27f3@ieee.org>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <401059d0-6b2c-4c40-8c4d-51749dca27f3@ieee.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 2025/3/18 05:42, Alex Elder wrote:
> On 3/16/25 2:43 AM, Troy Mitchell wrote:
>> This patch introduces basic I2C support for the SpacemiT K1 SoC,
>> utilizing interrupts for transfers.
>>
>> The driver has been tested using i2c-tools on a Bananapi-F3 board,
>> and basic I2C read/write operations have been confirmed to work.
>>
>> Reviewed-by: Alex Elder <elder@riscstar.com>
>> Link:
>> https://lore.kernel.org/all/20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org [1]
>> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
> 
> I know I said it was fine, but I'm going to reiterate two comments in
> the probe function.
Hi, Alex.
Thanks for your review!
> 
>> ---
>>   drivers/i2c/busses/Kconfig  |  17 ++
>>   drivers/i2c/busses/Makefile |   1 +
>>   drivers/i2c/busses/i2c-k1.c | 605 ++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 623 insertions(+)
>>
> 
> . . .
> 
>> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
>> new file mode 100644
>> index
>> 0000000000000000000000000000000000000000..ae43dcd31e8aa480766b44be91656657c7aaaf4a
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-k1.c
>> @@ -0,0 +1,605 @@
> 
> . . .
> 
>> +static int spacemit_i2c_probe(struct platform_device *pdev)
>> +{
>> +    struct clk *clk;
>> +    struct device *dev = &pdev->dev;
>> +    struct device_node *of_node = pdev->dev.of_node;
>> +    struct spacemit_i2c_dev *i2c;
>> +    int ret;
>> +
>> +    i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
>> +    if (!i2c)
>> +        return -ENOMEM;
>> +
>> +    ret = of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
>> +    if (ret)
>> +        dev_warn(dev, "failed to read clock-frequency property\n");
> 
> If the property doesn't exist, I don't think this warrants a warning,
> because it's optional.  Perhaps if a different error (something other
> than -EINVAL) is returned it would warrant a warning.
> 
>> +
>> +    /* For now, this driver doesn't support high-speed. */
>> +    if (!i2c->clock_freq || i2c->clock_freq < 1 ||
> 
> For an unsigned value, !i2c->clock_freq is *the same as*
> i2c->clock_freq < 1.  Get rid of the latter.
> 
> I'll leave it up to the maintainer to decide whether these
> comments can just be ignored--my Reviewed-by is fine, even
> if you don't change these.
> 
>                     -Alex
I know it's right what you said.
But I don't know if it's worth to send v8?
Maybe I can fix it when I add FIFO function?
If I'm wrong, let me know.
> 
>> +        i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
>> +        dev_warn(dev, "unsupported clock frequency %u; using %u\n",
>> +             i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
>> +        i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
>> +    } else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
>> +        dev_warn(dev, "unsupported clock frequency %u; using %u\n",
>> +             i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
>> +        i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
>> +    }
>> +
>> +    i2c->dev = &pdev->dev;
>> +
>> +    i2c->base = devm_platform_ioremap_resource(pdev, 0);
>> +    if (IS_ERR(i2c->base))
>> +        return dev_err_probe(dev, PTR_ERR(i2c->base), "failed to do ioremap");
>> +
>> +    i2c->irq = platform_get_irq(pdev, 0);
>> +    if (i2c->irq < 0)
>> +        return dev_err_probe(dev, i2c->irq, "failed to get irq resource");
>> +
>> +    ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
>> +                   IRQF_NO_SUSPEND | IRQF_ONESHOT, dev_name(i2c->dev), i2c);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret, "failed to request irq");
>> +
>> +    clk = devm_clk_get_enabled(dev, "func");
>> +    if (IS_ERR(clk))
>> +        return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
>> +
>> +    clk = devm_clk_get_enabled(dev, "bus");
>> +    if (IS_ERR(clk))
>> +        return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
>> +
>> +    spacemit_i2c_reset(i2c);
>> +
>> +    i2c_set_adapdata(&i2c->adapt, i2c);
>> +    i2c->adapt.owner = THIS_MODULE;
>> +    i2c->adapt.algo = &spacemit_i2c_algo;
>> +    i2c->adapt.dev.parent = i2c->dev;
>> +    i2c->adapt.nr = pdev->id;
>> +
>> +    i2c->adapt.dev.of_node = of_node;
>> +
>> +    strscpy(i2c->adapt.name, "spacemit-i2c-adapter", sizeof(i2c->adapt.name));
>> +
>> +    init_completion(&i2c->complete);
>> +
>> +    platform_set_drvdata(pdev, i2c);
>> +
>> +    ret = i2c_add_numbered_adapter(&i2c->adapt);
>> +    if (ret)
>> +        return dev_err_probe(&pdev->dev, ret, "failed to add i2c adapter");
>> +
>> +    return 0;
>> +}
>> +
>> +static void spacemit_i2c_remove(struct platform_device *pdev)
>> +{
>> +    struct spacemit_i2c_dev *i2c = platform_get_drvdata(pdev);
>> +
>> +    i2c_del_adapter(&i2c->adapt);
>> +}
>> +
>> +static const struct of_device_id spacemit_i2c_of_match[] = {
>> +    { .compatible = "spacemit,k1-i2c", },
>> +    { /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, spacemit_i2c_of_match);
>> +
>> +static struct platform_driver spacemit_i2c_driver = {
>> +    .probe = spacemit_i2c_probe,
>> +    .remove = spacemit_i2c_remove,
>> +    .driver = {
>> +        .name = "i2c-k1",
>> +        .of_match_table = spacemit_i2c_of_match,
>> +    },
>> +};
>> +module_platform_driver(spacemit_i2c_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("I2C bus driver for SpacemiT K1 SoC");
>>
> 

-- 
Troy Mitchell

