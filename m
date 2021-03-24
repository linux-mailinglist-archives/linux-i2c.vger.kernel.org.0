Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 634B2347879
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 13:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbhCXM0Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 08:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234499AbhCXM0P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Mar 2021 08:26:15 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 995CDC061763
        for <linux-i2c@vger.kernel.org>; Wed, 24 Mar 2021 05:26:14 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g8so24525269lfv.12
        for <linux-i2c@vger.kernel.org>; Wed, 24 Mar 2021 05:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iT8uCrZuHT3QZDUcvfmjktpdW+qD+ADtTYLgoO7f6Ys=;
        b=SA9oE0xSQoIp8P7EwHFaO2HG6zjZVZIrTuHkgJay0WRv1Sgj/fzID1oGr9XpeN+fll
         ZQuXG9ZDZQD7k1Wohn1Y9NdRXflBEaO/Tl5brOhnGSP0hSOQ7NYzB8mzRIQhox8/Ra4u
         g/zfXZUra67553qyjsJaHXNdvH/Hn6XpldGm7jh7IFzdivi2xEYnmCIr5u4H98uk/iKr
         qujBa6Yd5/DiUTTg2mkv2HnFuHLLClQRNpeohAUdcqCJqfJ29H03TJivBYrKRNz86g5Z
         3LtsmgwuQQrRk5mtQt1BAQn/mQtvGuV6vMO50AX4wgIPQxemYHrLpRQkbV8W9CJmCVK5
         xWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iT8uCrZuHT3QZDUcvfmjktpdW+qD+ADtTYLgoO7f6Ys=;
        b=T9t7tVY4GkMal+zSR0sIlOOJO0uyB2BDsM3TUE+379DLiWn63QHcjvlp02/R7Vmmc9
         kHjoDwEHDpZTflLl9ViYoy4WyiYZKSNPXXMKIMcjm4tMUjWOfWA3hpC9bhBAnoI3v+om
         Q6oKIDiccnwmuf4e175NRGcowwzrZE//j+YtNr0LnQ40Dj7O3xhDUMVcH6cA2Kf2SlZF
         XnCOq7utXEG1hhiG0Mt0gHS3Giaa8UZnHP3zHJHNKBTjKSWzGz+cpQhGnMQzpqLMp18u
         HZJfZcrzXGHg6l/EmfiBzc9jCKMWJqEurlS3giG52/CcUDGq9EiLHM0bcZJ95N0BTXX1
         smFg==
X-Gm-Message-State: AOAM532bdOMUZuzk0CVRnWmGPfwDJJHo/VkfiBk9j/6Xcv7TR3YzYLd0
        nms+22db4R7Q5fup4BdG8vM=
X-Google-Smtp-Source: ABdhPJw00rBAnipnAPaQNq09hKkJKvsgbFXlrCzJlRI2YMuc6mmlrjDHNJhb0NcOkaBGuc6dkZS3WQ==
X-Received: by 2002:ac2:5feb:: with SMTP id s11mr1771651lfg.558.1616588773073;
        Wed, 24 Mar 2021 05:26:13 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id y8sm318011ljk.9.2021.03.24.05.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 05:26:12 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] i2c: add support for HiSilicon I2C controller
To:     Yicong Yang <yangyicong@hisilicon.com>, wsa@kernel.org,
        linux-i2c@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, treding@nvidia.com,
        jarkko.nikula@linux.intel.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        prime.zeng@huawei.com, linuxarm@huawei.com
References: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
 <1616411413-7177-3-git-send-email-yangyicong@hisilicon.com>
 <7801d460-c1f4-5088-0ba0-47a07d187a2a@gmail.com>
 <e18bec78-8913-2d11-00b9-e229688caae6@hisilicon.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <816f8e2d-6e8d-c118-dfd2-af5348c30a48@gmail.com>
Date:   Wed, 24 Mar 2021 15:26:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e18bec78-8913-2d11-00b9-e229688caae6@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

24.03.2021 12:30, Yicong Yang пишет:
...
>>> +static void hisi_i2c_enable_int(struct hisi_i2c_controller *ctlr, u32 mask)
>>> +{
>>> +	writel(mask, ctlr->iobase + HISI_I2C_INT_MASK);
>>
>> Why you don't use relaxed versions of readl/writel? Do you really need
>> to insert memory barriers?
>>
> 
> this will not be used during the transfer process, so a relaxed version of readl/writel
> will not have performance enhancement.
> 
> the barriers are necessary as i want to make the operations in order to avoid potential
> problems caused by reordering.

The iomap is strongly ordered, hence register accesses are always
ordered. The barrier ensures that CPU memory accesses are finished
before h/w registers are touched. Looks like you don't need to worry
about the memory barrier in the case of this driver.

>>> +}
>>> +
>>> +static void hisi_i2c_disable_int(struct hisi_i2c_controller *ctlr, u32 mask)
>>> +{
>>> +	writel((~mask) & HISI_I2C_INT_ALL, ctlr->iobase + HISI_I2C_INT_MASK);
>>> +}
>>> +
>>> +static void hisi_i2c_clear_int(struct hisi_i2c_controller *ctlr, u32 mask)
>>> +{
>>> +	writel(mask, ctlr->iobase + HISI_I2C_INT_CLR);
>>> +}
>>> +
>>> +static void hisi_i2c_handle_errors(struct hisi_i2c_controller *ctlr)
>>> +{
>>> +	u32 int_err = ctlr->xfer_err, reg;
>>> +
>>> +	if (int_err & HISI_I2C_INT_FIFO_ERR) {
>>> +		reg = readl(ctlr->iobase + HISI_I2C_FIFO_STATE);
>>> +
>>> +		if (reg & HISI_I2C_FIFO_STATE_RX_RERR)
>>> +			dev_err(ctlr->dev, "rx fifo error read.\n");
>>
>> The dot "." in the end of error messages is unnecessary.
>>
> 
> i'd like to keep this, as i think this is rather driver specific and not
> violating any rules.

The common kernel style is *not* to have the dot + some other messages
in this driver already don't have it. Should be better if you could
remove it.

>>> +/*
>>> + * Initialize the transfer information and start the I2C bus transfer.
>>> + * We only configure the transfer and do some pre/post works here, and
>>> + * wait for the transfer done. The major transfer process is performed
>>> + * in the IRQ handler.
>>> + */
>>> +static int hisi_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>>> +				int num)
>>> +{
>>> +	struct hisi_i2c_controller *ctlr = i2c_get_adapdata(adap);
>>> +	DECLARE_COMPLETION_ONSTACK(done);
>>> +	int ret = num;
>>> +
>>> +	hisi_i2c_reset_xfer(ctlr);
>>> +	ctlr->completion = &done;
>>> +	ctlr->msg_num = num;
>>> +	ctlr->msgs = msgs;
>>> +
>>> +	hisi_i2c_start_xfer(ctlr);
>>> +
>>> +	if (!wait_for_completion_timeout(ctlr->completion, adap->timeout)) {
>>> +		hisi_i2c_disable_int(ctlr, HISI_I2C_INT_ALL);
>>
>> This doesn't save you from racing with the interrupt handler. It looks
>> like you need to enable/disable IRQ around the completion, similarly to
>> what NVIDIA Tegra I2C driver does.
>>
> 
> thanks for suggestion.
> 
> the hardware between tegra and this one is a little different as we don't provide
> a way to reinit the controller. so {synchronize,disable}_irq() after mask
> the interrupt here will avoid the race.

The disable/enable will be ideal, but synchronize should be good enough
as well.
