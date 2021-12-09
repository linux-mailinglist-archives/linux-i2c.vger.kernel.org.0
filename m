Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9924646EC08
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 16:43:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239962AbhLIPr2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 10:47:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236613AbhLIPr2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 10:47:28 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8B5C061746;
        Thu,  9 Dec 2021 07:43:54 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id k37so12822252lfv.3;
        Thu, 09 Dec 2021 07:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=zmr1TAXCDUHBoO/fN5HJJIcyfXLJJrTVzqtdSWu9w4U=;
        b=B3MQZDVoWi0elr+edK/mkohSqqJzZ1Pnmhw4lsMb9ovurYaUTqx8nnfcZd4mh9+rlu
         aHDUkX58r7ERf06e9wEb+CVvebxoRH0NjmjSBcrHLfuIGkBqeJBBQ79XWDzpKNbz5Ca0
         0VZcjJdx0sCdvTa4AqLMlcYcV0tWteo7iY0j+YI/ZlCDxeEfOfpik9uqCxFm/9T9Uu4U
         ZYK26YXATPMkB1UeQU9p58w+6xisRm/BzZtQlnUWTkr3LZcX5KU8tPU2o3CsAdtxYgw7
         C2NjNO9PxNEPZtQMWzT28aqIahT3gRkt7bjH926DJGi7Km5kavfIWIoT1Wyt83Iqgblu
         5fOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zmr1TAXCDUHBoO/fN5HJJIcyfXLJJrTVzqtdSWu9w4U=;
        b=Wlejwx34hd4LuAAhW2uKtTZ5Sbd9f+PGPG0qZm5cair5+dS51Wj2LPCLtJFn9vNtFD
         Rw6qDAvGeb59Ov9mTgf07c+ThlbqfqRzZC3yZ7Fwo363auy86h5xTCbUDYKrrkbi+H/U
         L11JJYRNSTvV/XJjYe4WeT46142irsSM0LgQzRzbHJw/3n0yOecuwcZCtQ0OHHna6IM3
         m8Sk7bAqRyvaPBND/fPN0zme6RsMd/w/kGdobX7wGyil3Vf/Fi0uzSxpmscQs+sjkCuV
         MgNAskOZJxlkOSszHC7skS62KQcc/VBHcfg2rkSAKV0HJEmYHmL8K0TLrVS5J0nIgh9N
         hSlg==
X-Gm-Message-State: AOAM531I8TLV2tmLcw6zkS9VQ/tlntodLvzXfczZNaYAb6reDYpt9+ca
        ziyFd7xvBB8drWazBtlkYDUvio8rCZo=
X-Google-Smtp-Source: ABdhPJxX4GW3ep3V/uqAp1KIFYrKxz5iouYUzd+/NXOgsELglbKLG+ys0UQMXhdYNvG9QblVCcPgSA==
X-Received: by 2002:ac2:46c2:: with SMTP id p2mr1430988lfo.87.1639064632209;
        Thu, 09 Dec 2021 07:43:52 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id m18sm22333lfu.71.2021.12.09.07.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 07:43:51 -0800 (PST)
Subject: Re: [PATCH 2/2] i2c: tegra: Add SMBus block read and SMBus alert
 functions
To:     Akhil R <akhilrajeev@nvidia.com>, andy.shevchenko@gmail.com,
        christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        jonathanh@nvidia.com, ldewangan@nvidia.com,
        linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org, p.zabel@pengutronix.de,
        sumit.semwal@linaro.org, thierry.reding@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
 <1639062321-18840-3-git-send-email-akhilrajeev@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9443afa6-b668-ae31-2413-05aa95a9567d@gmail.com>
Date:   Thu, 9 Dec 2021 18:43:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1639062321-18840-3-git-send-email-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

09.12.2021 18:05, Akhil R пишет:
> +static int tegra_i2c_setup_smbalert(struct tegra_i2c_dev *i2c_dev)
> +{
> +	struct tegra_i2c_smbalert *smbalert = &i2c_dev->smbalert;
> +	struct gpio_desc *alert_gpiod;
> +	struct i2c_client *ara;
> +
> +	alert_gpiod = devm_gpiod_get(i2c_dev->dev, "smbalert", GPIOD_IN);
> +	if (IS_ERR(alert_gpiod))
> +		return PTR_ERR(alert_gpiod);
> +
> +	smbalert->alert_data.irq = gpiod_to_irq(alert_gpiod);
> +	if (smbalert->alert_data.irq <= 0)
> +		return smbalert->alert_data.irq;

Why GPIO is needed at all if what's actually needed is the interrupt?
