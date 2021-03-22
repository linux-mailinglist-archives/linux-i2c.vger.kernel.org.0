Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39CBB344921
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 16:22:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhCVPVp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 11:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbhCVPV2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Mar 2021 11:21:28 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D01C061574
        for <linux-i2c@vger.kernel.org>; Mon, 22 Mar 2021 08:21:27 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id y1so21506704ljm.10
        for <linux-i2c@vger.kernel.org>; Mon, 22 Mar 2021 08:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GnNcJXlzVtN/IeFct4i+/nqSuBy9qoMVGTHskkkOtO0=;
        b=pVbZ6c3b0AfT+md2vsz9Y5Ws+NY4VlCNsvyL+g97AXhOHWjwGruknBTFoitiy9LMlH
         5ciEtFXOO5llt5HVa9r3mp14907+d3O9D9Iyxr8lu433TC+njm2W0ZqXuJU3IapGeg/t
         8BoxsNdFJkx2+L5G2JtsaQ0qVf1pLcqMEcRp4+hSQONa0+AY/UZBbGVUVb7NMdph7YYC
         NOXyk8gs+0S/7pAs0GUW7m9ZNDqsbkYkc9AxhqFNwwy9j/mD35dus2KqaGyU4liAQ7DE
         PJm6M+q7+4RoUlrwtkw2lGRaBwCNkLGbpFHFoZSFxXFfetfCVpDmyCozatBLn5ZJBt3E
         FSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GnNcJXlzVtN/IeFct4i+/nqSuBy9qoMVGTHskkkOtO0=;
        b=pZ0iQUTu5u/1GMh5dys/aJd2TxOOltN3CxbkDzEOtlH5ZK2qSqtpQITQhMemt5pfpf
         w+inufc3tvUI9m5/w15aeuc82FkQ4ZBPU7fm1doyrIO5uE1awFj++Wzov00kQyjsCzJO
         iy3r5e0BuZxzPH8ZzyRWadK8p41kKP1amnJ2BQF1Ba2T2JAjLaJYNPrTXM+4HOp4O4ab
         BaezzGgen5cD+2A+g2mhfym4HwE95q4LWit9q5MOOMGcL8LqVO2Ka9Hwx6kuhQvwPxHE
         bFyXFZFGvDjG6ixzCLAeJcfVge0ooeW1CAE/6dPxwRdc6Qa2/XOSDPMd0zzJSl4mkYM9
         4GJg==
X-Gm-Message-State: AOAM531dxW0P5SxDZSRGEAcGwl1/u8mTDVYn5hy289T7giKP3dRaadmI
        7wO5ZANGNbj5zWl/UzN08FQ=
X-Google-Smtp-Source: ABdhPJw5RJl3ThRDpZ9lRJEzoSMT3wygZK4Osd8agKHeSe+Arj2eOKpgE9q0O0tsBWn9Acmi47iOeA==
X-Received: by 2002:a2e:7d03:: with SMTP id y3mr105689ljc.0.1616426486406;
        Mon, 22 Mar 2021 08:21:26 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-47.dynamic.spd-mgts.ru. [109.252.193.47])
        by smtp.googlemail.com with ESMTPSA id i185sm1598899lfd.279.2021.03.22.08.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 08:21:26 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] i2c: add support for HiSilicon I2C controller
To:     Yicong Yang <yangyicong@hisilicon.com>, wsa@kernel.org,
        linux-i2c@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, treding@nvidia.com,
        jarkko.nikula@linux.intel.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        prime.zeng@huawei.com, linuxarm@huawei.com
References: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
 <1616411413-7177-3-git-send-email-yangyicong@hisilicon.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7801d460-c1f4-5088-0ba0-47a07d187a2a@gmail.com>
Date:   Mon, 22 Mar 2021 18:21:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1616411413-7177-3-git-send-email-yangyicong@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Yicong,

22.03.2021 14:10, Yicong Yang пишет:
> Add HiSilicon I2C controller driver for the Kunpeng SoC. It provides
> the access to the i2c busses, which connects to the eeprom, rtc, etc.
> 
> The driver works with IRQ mode, and supports basic I2C features and 10bit
> address. The DMA is not supported.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/i2c/busses/Kconfig    |  10 +
>  drivers/i2c/busses/Makefile   |   1 +
>  drivers/i2c/busses/i2c-hisi.c | 525 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 536 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-hisi.c

...
> +
> +#define NSEC_TO_CYCLES(ns, clk_rate_khz) (DIV_ROUND_UP_ULL((clk_rate_khz) * (ns), NSEC_PER_MSEC))

This is a very long line, you should split it into two.

Parens around DIV_ROUND_UP_ULL aren't needed.

...
> +static void hisi_i2c_enable_int(struct hisi_i2c_controller *ctlr, u32 mask)
> +{
> +	writel(mask, ctlr->iobase + HISI_I2C_INT_MASK);

Why you don't use relaxed versions of readl/writel? Do you really need
to insert memory barriers?

> +}
> +
> +static void hisi_i2c_disable_int(struct hisi_i2c_controller *ctlr, u32 mask)
> +{
> +	writel((~mask) & HISI_I2C_INT_ALL, ctlr->iobase + HISI_I2C_INT_MASK);
> +}
> +
> +static void hisi_i2c_clear_int(struct hisi_i2c_controller *ctlr, u32 mask)
> +{
> +	writel(mask, ctlr->iobase + HISI_I2C_INT_CLR);
> +}
> +
> +static void hisi_i2c_handle_errors(struct hisi_i2c_controller *ctlr)
> +{
> +	u32 int_err = ctlr->xfer_err, reg;
> +
> +	if (int_err & HISI_I2C_INT_FIFO_ERR) {
> +		reg = readl(ctlr->iobase + HISI_I2C_FIFO_STATE);
> +
> +		if (reg & HISI_I2C_FIFO_STATE_RX_RERR)
> +			dev_err(ctlr->dev, "rx fifo error read.\n");

The dot "." in the end of error messages is unnecessary.

...
> +/*
> + * Initialize the transfer information and start the I2C bus transfer.
> + * We only configure the transfer and do some pre/post works here, and
> + * wait for the transfer done. The major transfer process is performed
> + * in the IRQ handler.
> + */
> +static int hisi_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> +				int num)
> +{
> +	struct hisi_i2c_controller *ctlr = i2c_get_adapdata(adap);
> +	DECLARE_COMPLETION_ONSTACK(done);
> +	int ret = num;
> +
> +	hisi_i2c_reset_xfer(ctlr);
> +	ctlr->completion = &done;
> +	ctlr->msg_num = num;
> +	ctlr->msgs = msgs;
> +
> +	hisi_i2c_start_xfer(ctlr);
> +
> +	if (!wait_for_completion_timeout(ctlr->completion, adap->timeout)) {
> +		hisi_i2c_disable_int(ctlr, HISI_I2C_INT_ALL);

This doesn't save you from racing with the interrupt handler. It looks
like you need to enable/disable IRQ around the completion, similarly to
what NVIDIA Tegra I2C driver does.
