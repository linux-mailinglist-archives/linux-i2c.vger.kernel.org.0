Return-Path: <linux-i2c+bounces-9750-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD73DA55775
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Mar 2025 21:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB7003B5379
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Mar 2025 20:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068BC1FDE18;
	Thu,  6 Mar 2025 20:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="en6xyb5B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3501DC19D
	for <linux-i2c@vger.kernel.org>; Thu,  6 Mar 2025 20:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741293071; cv=none; b=p2lijScYhUVNI4IHRT21Dum/Jxvgj2Uyj3CCqRgP9Ps90rGuRJTrvAKnUY3SSlB6OuawamFD1HuP/xosjATp/Ei9FsNsQyKIDT1KK+huyEpr7zUGBLWhO9C8YHHsxJ2fPpB5vsxOgQ2j3QpvvT0RzJTlgZPPzihhBKCCRaKjo1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741293071; c=relaxed/simple;
	bh=S/KGJtxOG74t83ZzIR/ZfVntYBBU+88Q/ZYDz95bXB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l0+MmWWMH8CZUiQZ8QxOcu/VO+e7lsEf5R3kKm2j1iTT+mgwaiMtpaFRdhMvl4UB4n2MboBKLvky/pq8FAz1A8PuB2Qw2+OjwhsWxs8VHwTA8k6bFbjFcAD2tjVcE0ctQU31Y4RhbpYx1SLDHrRLYBW+q1p+7Wc8zIFVjHfC0xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=en6xyb5B; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-85aec8c95c4so89937039f.1
        for <linux-i2c@vger.kernel.org>; Thu, 06 Mar 2025 12:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1741293068; x=1741897868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=loHfFjVjvy4eqcBCmiUQ0o6uWWkbgvV0v2eUTHhrrUw=;
        b=en6xyb5B+uxR+6roYwaL2xu/n1eMRQFQF5W0/I+wn8KNrtlsApnvDqx/6tumH8QBHA
         8VhIPlEWm74T5gbVFrNx5Oayy9jURi8yXU4qrX7N+HBIcprfydchysZXSEu+osN+Bjko
         qoJSPTbQh79n/oE6LTsz7bghccT5xvYtugcKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741293068; x=1741897868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=loHfFjVjvy4eqcBCmiUQ0o6uWWkbgvV0v2eUTHhrrUw=;
        b=V+ceVj3KXCuQviyZVUUFYtr+EbIYVKpP4d9RqT/fGxAkUapxsdz7R8O9b1CvWZm9kt
         TPpxJ69cQkXbEEpcUZXtZncjKU9ULTDFbDZmoNhjYzoqaRqNQhdCYZfN/IxYJUAFH3i0
         PKD5pqAcdVLvfRdrV7bFYoaPiqfunf6XkW930bEJJOz7/ORTFY6CyqoYPnE5T5xEo+/w
         pZvAIg0IuYX1QZfLqXnEjGuchdYQuIta3VBJpA2Chy6NkseSV4OTTxvfO0Xdpbo00k6y
         o6LlrcXWgrdOzvkKZ11pS47Ok6NOmQWDPnPycyLjvmVzBD7rIiu+mBTF+EJoLlR26uBn
         Gu+g==
X-Forwarded-Encrypted: i=1; AJvYcCUm9ksKis6xvKLODq7U0PfIIbcJnEm4VzmPcCbboA8wQ9lOd8Hj+HiCvmDWcYfVszQSVVAPp8FU8/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+umG9iC/ClkvhUBSIcFgeKce8W2Ctss67BZzzDqeTBUyAeszI
	mcQJyEp9+aFbDgKVM6HNWgymm6ziETY8CoUCcQlVGAeAazdJ55X9FccUgccA8g==
X-Gm-Gg: ASbGncsWU1rgZEgwB8rTWRtOez0rF0wNTYOtuLqS+94zMgf0j5QBObzttCJmiVuLlTC
	b7CDfK19I1R3+yK2B+hn8e6c5UNahBDbaArpZlv3ujcppy+sYBCJCg6opJJJgEPku6CTykf2c7n
	/BNEDe+fXtW22D7KGi9JHSr7AreUpr/N0AaLIPev01Gjs0wQSLTW2O2lJstuUIGxbldkX+lu0CZ
	JmDqY8SLP12tKrWNn3M7+/haoL5Hu7CkHIXDPPRsyfacWoQd9TMe2ZrVD0/z/mVzfQCmXi4cQoh
	3uR+zmBSMCnpKW8kTPoQGtADjVDFb+0/bK7FJrZIDOb5S8bDAySVEA3ZOxRaTVcwNTc4QcXQFIY
	ZgIk=
X-Google-Smtp-Source: AGHT+IG3t+M0Sd4QGM8IcjTJ8M+ia/7Mi3XDtcLmvU8toOATQlbGKf+G0QuDaS520ZPFijFdXU7SWw==
X-Received: by 2002:a05:6602:3584:b0:85a:e24f:2b60 with SMTP id ca18e2360f4ac-85b1cfae990mr142309839f.4.1741293066607;
        Thu, 06 Mar 2025 12:31:06 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id ca18e2360f4ac-85b11a74c4fsm41603039f.36.2025.03.06.12.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 12:31:05 -0800 (PST)
Message-ID: <7e5b0362-50f9-4cb7-abb6-6f26d14b7407@ieee.org>
Date: Thu, 6 Mar 2025 14:30:14 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 2/2] i2c: spacemit: add support for SpacemiT K1
 SoC
To: Troy Mitchell <troymitchell988@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
 <20250303-k1-i2c-master-v5-2-21dfc7adfe37@gmail.com>
 <ff0faba3-08fe-4ddd-803c-03df4e1e1e2d@ieee.org>
 <74b70a83-e10e-4496-9bc6-e376211db670@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <74b70a83-e10e-4496-9bc6-e376211db670@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/6/25 7:16 AM, Troy Mitchell wrote:
> On 2025/3/4 08:01, Alex Elder wrote:
> 
>> On 3/2/25 11:30 PM, Troy Mitchell wrote:
>>> This patch introduces basic I2C support for the SpacemiT K1 SoC,
>>> utilizing interrupts for transfers.
>>>
>>> The driver has been tested using i2c-tools on a Bananapi-F3 board,
>>> and basic I2C read/write operations have been confirmed to work.
>>>
>>> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
>>
>> I have some more comments, and some questions.  I appreciate
>> seeing some of the changes you've made based on my feedback.
> Hi, Alex. Thanks for your review.
>>> +static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>>> +{
>>> +    u32 val;
>>> +
>>> +    /*
>>> +     * Unmask interrupt bits for all xfer mode:
>>> +     * bus error, arbitration loss detected.
>>> +     * For transaction complete signal, we use master stop
>>> +     * interrupt, so we don't need to unmask SPACEMIT_CR_TXDONEIE.
>>> +     */
>>> +    val = SPACEMIT_CR_BEIE | SPACEMIT_CR_ALDIE;
>>> +
>>> +    /*
>>> +     * Unmask interrupt bits for interrupt xfer mode:
>>> +     * DBR rx full.
>>> +     * For tx empty interrupt SPACEMIT_CR_DTEIE, we only
>>> +     * need to enable when trigger byte transfer to start
>>> +     * data sending.
>>> +     */
>>> +    val |= SPACEMIT_CR_DRFIE;
>>> +
>>> +    /* set speed bits: default fast mode */
>>
>> It is not *default* fast mode, it *is* fast mode.  (There
>> is no other mode used in this driver, right?)
> yes. I will talk it below.
>>
>>> +    val |= SPACEMIT_CR_MODE_FAST;
>>> +
>>> +    /* disable response to general call */
>>> +    val |= SPACEMIT_CR_GCD;
>>> +
>>> +    /* enable SCL clock output */
>>> +    val |= SPACEMIT_CR_SCLE;
>>> +
>>> +    /* enable master stop detected */
>>> +    val |= SPACEMIT_CR_MSDE | SPACEMIT_CR_MSDIE;
>>> +
>>> +    writel(val, i2c->base + SPACEMIT_ICR);
>>> +}
>>> +
>>> +
>>> +static int spacemit_i2c_xfer_core(struct spacemit_i2c_dev *i2c)
>>> +{
>>> +    int ret;
>>> +
>>> +    spacemit_i2c_reset(i2c);
>>
>> I don't have a lot of experience with I2C drivers, but is it normal
>> to reset before every transfer?
>>
>> If it is, just tell me that.  But if it's not, can you explain why
>> it's necessary here?
> 
> My initial idea was to keep the I2C state in its initial state before each
> transmission.
> 
> But after testing, this is not necessary. I will move it to `probe` function.

OK, that seems better.  But honestly you should do this only
if you're certain the reset isn't required before every transfer.
I don't know, but I assumed it was there for a reason.

>>> +
>>> +    spacemit_i2c_calc_timeout(i2c);
>>> +
>>> +    spacemit_i2c_init(i2c);
>>> +
>>
>> Here too, maybe I just don't know what most I2C drivers do, but
>> is it necessary to only enable the I2C adapter and its interrupt
>> handler when performing a transfer?
> 
> It is necessary to enable before each transmission.
> 
> I have tested moving the `spacemit_i2c_enable` to the probe function.
> 
> It will cause transmission errors.
> 
> As for the `enable_irq`, I think it can be moved to the `probe` function.

It really depends on whether you intend to rule out
any interrupts other than when you are performing
a transfer.

This might be reasonable, but sometimes drivers will
keep an interrupt enabled most of the time, sometimes
they restrict when it's enabled.  Hence my question.

> 
>>
>>> +    spacemit_i2c_enable(i2c);
>>> +    enable_irq(i2c->irq);
>>> +
>>> +    /* i2c wait for bus busy */
>>> +    ret = spacemit_i2c_recover_bus_busy(i2c);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = spacemit_i2c_xfer_msg(i2c);
>>> +    if (ret < 0)
>>> +        dev_dbg(i2c->dev, "i2c transfer error\n");
>>
>> If you're reporting the error you might as well say what
>> it is.
>>
>>      dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
>>
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg
>>> *msgs, int num)
>>> +{
>>> +    struct spacemit_i2c_dev *i2c = i2c_get_adapdata(adapt);
>>> +    int ret;
>>> +    u32 err = SPACEMIT_I2C_GET_ERR(i2c->status);
>>> +
>>> +    i2c->msgs = msgs;
>>> +    i2c->msg_num = num;
>>> +
>>> +    ret = spacemit_i2c_xfer_core(i2c);
>>> +    if (!ret)
>>> +        spacemit_i2c_check_bus_release(i2c);
>>> +
>>
>> The enable_irq() call that matches the disable call below is
>> found in spacemit_i2c_xfer_core().  That's where this call
>> belongs.

I think the above comment is important.  I'll look at
your next version of the series to see what you do.

>>
>>> +    disable_irq(i2c->irq);
>>> +
>>
>> Same with the next call--it should be in the same function
>> that its corresponding spacemit_i2c_enable() is called.
>>
>> With these suggestions in mind, I think you can safely
>> just get rid of spacemit_i2c_xfer_core().  It is only
>> called in this one spot (above), and you can just do
>> everything within spacemit_i2c_xfer() instead.
>>
>>> +    spacemit_i2c_disable(i2c);
>>> +
>>> +    if (ret == -ETIMEDOUT || ret == -EAGAIN)
>>> +        dev_alert(i2c->dev, "i2c transfer failed, ret %d err 0x%x\n", ret,
>>> err);
>>> +
>>> +    return ret < 0 ? ret : num;
>>> +}
>>> +
>>> +static u32 spacemit_i2c_func(struct i2c_adapter *adap)
>>> +{
>>> +    return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
>>> +}
>>> +
>>> +static const struct i2c_algorithm spacemit_i2c_algo = {
>>> +    .xfer = spacemit_i2c_xfer,
>>> +    .functionality = spacemit_i2c_func,
>>> +};
>>> +
>>> +static int spacemit_i2c_probe(struct platform_device *pdev)
>>> +{
>>> +    struct clk *clk;
>>> +    struct device *dev = &pdev->dev;
>>> +    struct device_node *of_node = pdev->dev.of_node;
>>> +    struct spacemit_i2c_dev *i2c;
>>> +    int ret = 0;
>>
>> There is no need to initialize ret.
>>
>>> +
>>> +    i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
>>> +    if (!i2c)
>>> +        return -ENOMEM;
>>> +
>>> +    ret = of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
>>> +    if (ret)
>>> +        return dev_err_probe(dev, ret, "failed to read clock-frequency
>>> property");
>>> +
>>> +    /* For now, this driver doesn't support high-speed. */
>>> +    if (i2c->clock_freq < 1 || i2c->clock_freq > 400000) {
>>
>> In your device tree binding, you indicate that three different
>> modes are supported, and that the maximum frequency is 3300000 Hz.
>> This says that only ranges from 1-400000 Hz are allowed.
>>
>> In fact, although you look up this clock frequency in DT, I see
>> nothing that actually is affected by this value.  I.e., no I2C
>> bus frequency changes, regardless of what frequency you specify.
>> The only place the clock_freq field is used is in calculating
>> the timeout for a transfer.
>>
>> So two things:
>> - My guess is that you are relying on whatever frequency the
>>    hardware already is using, and maybe that's 400000 Hz.
>>    That's fine, though at some point it should be more
>>    directly controlled (set somehow).
>> - Since you don't actually support any other frequency,
>>    drop this "clock-frequency" feature for now, and add it
>>    when you're ready to actually support it.
>>
>> And I might be wrong about this, but I don't think your
>> (new) DTS binding should specify behavior that is not
>> supported by the driver.
>>
>>                      -Alex
> 
> I will support standard mode in next version.

I'll wait to see what you do, but please try not to change
anything substantive between versions of a patch series.

> We just need to modify the function `spacemit_i2c_init`.

Thanks for your responses.

					-Alex

>>
>>> +        dev_warn(dev, "unsupport clock frequency: %d, default: 400000",
>>> i2c->clock_freq);
>>> +        i2c->clock_freq = 400000;
>>> +    }
>>> +
>>> +    i2c->dev = &pdev->dev;
>>> +
>>> +    i2c->base = devm_platform_ioremap_resource(pdev, 0);
>>> +    if (IS_ERR(i2c->base))
>>> +        return dev_err_probe(dev, PTR_ERR(i2c->base), "failed to do ioremap");
>>> +
>>> +    i2c->irq = platform_get_irq(pdev, 0);
>>> +    if (i2c->irq < 0)
>>> +        return dev_err_probe(dev, i2c->irq, "failed to get irq resource");
>>> +
>>> +    ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
>>> +                   IRQF_NO_SUSPEND | IRQF_ONESHOT, dev_name(i2c->dev), i2c);
>>> +    if (ret)
>>> +        return dev_err_probe(dev, ret, "failed to request irq");
>>> +
>>> +    disable_irq(i2c->irq);
>>> +
>>> +    clk = devm_clk_get_enabled(dev, "apb");
>>> +    if (IS_ERR(clk))
>>> +        return dev_err_probe(dev, PTR_ERR(clk), "failed to enable apb clock");
>>> +
>>> +    clk = devm_clk_get_enabled(dev, "twsi");
>>> +    if (IS_ERR(clk))
>>> +        return dev_err_probe(dev, PTR_ERR(clk), "failed to enable twsi clock");
>>> +
>>> +    i2c_set_adapdata(&i2c->adapt, i2c);
>>> +    i2c->adapt.owner = THIS_MODULE;
>>> +    i2c->adapt.algo = &spacemit_i2c_algo;
>>> +    i2c->adapt.dev.parent = i2c->dev;
>>> +    i2c->adapt.nr = pdev->id;
>>> +
>>> +    i2c->adapt.dev.of_node = of_node;
>>> +    i2c->adapt.algo_data = i2c;
>>> +
>>> +    strscpy(i2c->adapt.name, "spacemit-i2c-adapter", sizeof(i2c->adapt.name));
>>> +
>>> +    init_completion(&i2c->complete);
>>> +
>>> +    platform_set_drvdata(pdev, i2c);
>>> +
>>> +    ret = i2c_add_numbered_adapter(&i2c->adapt);
>>> +    if (ret)
>>> +        return dev_err_probe(&pdev->dev, ret, "failed to add i2c adapter");
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void spacemit_i2c_remove(struct platform_device *pdev)
>>> +{
>>> +    struct spacemit_i2c_dev *i2c = platform_get_drvdata(pdev);
>>> +
>>> +    i2c_del_adapter(&i2c->adapt);
>>> +}
>>> +
>>> +static const struct of_device_id spacemit_i2c_of_match[] = {
>>> +    { .compatible = "spacemit,k1-i2c", },
>>> +    { /* sentinel */ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, spacemit_i2c_of_match);
>>> +
>>> +static struct platform_driver spacemit_i2c_driver = {
>>> +    .probe = spacemit_i2c_probe,
>>> +    .remove = spacemit_i2c_remove,
>>> +    .driver = {
>>> +        .name = "i2c-k1",
>>> +        .of_match_table = spacemit_i2c_of_match,
>>> +    },
>>> +};
>>> +module_platform_driver(spacemit_i2c_driver);
>>> +
>>> +MODULE_LICENSE("GPL");
>>> +MODULE_DESCRIPTION("I2C bus driver for SpacemiT K1 SoC");
>>>
>>


