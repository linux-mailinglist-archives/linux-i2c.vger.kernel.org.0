Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5D10492FC1
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jan 2022 21:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349294AbiARUyU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 15:54:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232844AbiARUyS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 15:54:18 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D25C9C061574;
        Tue, 18 Jan 2022 12:54:17 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id br17so383482lfb.6;
        Tue, 18 Jan 2022 12:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=HpMWFxxSFp183F1JLnMN8qo1Jyfffb8+zQnkm7nqsuQ=;
        b=Uvpc3EITEQPzNo9Nh/EtLx0EW89tflyjAt8JslPAmlqsJg8F+3twTbN2ODQYk5TeYF
         gV1SCJasNKZDOxMde90fRAojFPp1VtpjuERAMqagSKdyYujHlEuJH4cHd6G0ccTTN7dA
         2zOMa6NNkAd7OXWdX4Ow5p6YU+AZnCmaVnE4TXnnr8TPPoX8vkp8Gj5I0qqyAz4fCCP4
         XYmwUdPL6VjJyF5XuRg3W3IdpPJ3rqRAH+pxLQrJOVfiQVXmAmHKZpJ496KaHiqI2vHk
         dkNfJYOZpiSXUGuyWkdJ0oOpzD6zG/kDMOZS2AYc2nCcsa0fVwQMcvEwAmjAJupqZB9d
         zvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HpMWFxxSFp183F1JLnMN8qo1Jyfffb8+zQnkm7nqsuQ=;
        b=PJvWvomGyMMwdjd6HjsRiwwowjqkH29N9Vb3Za0BS3FG0LNMCn5GscirdP7+yCa6E4
         AJDdk266tck3tkSg6JqTRY2dnbSTv2gstZUoa2dDkHCQPUDTJ/V+C35wSQLFbYkkHdtR
         4Ou72EHnSLXu6xrdT1LL461XVnpp4108P4OkznUVXvx0OUpg1gEu0LeGaC6YdQzf6f6H
         LlbPBa0T1g8zPbHTgRULgqffz93Rv+kOwpByGVlpqCgxYdS9wKtBFBRV66ybDAtCdnY5
         v2iYO1uguqBNc4g5AgeIiTQfbdAj3byxlekIrst8l0pu6H79Vv8WZEFwr8mlgKVGaH+z
         vjGQ==
X-Gm-Message-State: AOAM532klMXgRr1tcxfhQz9yXPMXW5RIvfgoKlMYyACe1aGQhtb2c5vm
        g7ywA24d4DEopUzHp2m4JS0=
X-Google-Smtp-Source: ABdhPJxMl6URYk6hUsJ3vIgJmWSOZFrR+RXF7LU84Qbkzf0ha4Dop2nL+FVJj33OhaJBdcX1Dky8ow==
X-Received: by 2002:a05:651c:1a06:: with SMTP id by6mr7311585ljb.244.1642539256137;
        Tue, 18 Jan 2022 12:54:16 -0800 (PST)
Received: from [192.168.2.145] (46-138-227-157.dynamic.spd-mgts.ru. [46.138.227.157])
        by smtp.googlemail.com with ESMTPSA id d2sm1426721ljj.120.2022.01.18.12.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 12:54:15 -0800 (PST)
Message-ID: <d9a21970-b403-4674-dbd6-5dfab0a83a3b@gmail.com>
Date:   Tue, 18 Jan 2022 23:54:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] i2c: tegra: Add support for Tegra234 I2C
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>, robh+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        mperttunen@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1642080623-15980-1-git-send-email-akhilrajeev@nvidia.com>
 <1642080623-15980-2-git-send-email-akhilrajeev@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <1642080623-15980-2-git-send-email-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

13.01.2022 16:30, Akhil R пишет:
> +static const struct tegra_i2c_hw_feature tegra234_i2c_hw = {
> +	.has_continue_xfer_support = true,
> +	.has_per_pkt_xfer_complete_irq = true,
> +	.clk_divisor_hs_mode = 0x2,
> +	.clk_divisor_std_mode = 0x4f,
> +	.clk_divisor_fast_mode = 0x58,
> +	.clk_divisor_fast_plus_mode = 0x24,
> +	.has_config_load_reg = true,
> +	.has_multi_master_mode = true,
> +	.has_slcg_override_reg = true,
> +	.has_mst_fifo = true,
> +	.quirks = &tegra194_i2c_quirks,
> +	.supports_bus_clear = true,
> +	.has_apb_dma = false,
> +	.tlow_std_mode = 0x8,
> +	.thigh_std_mode = 0x7,
> +	.tlow_fast_fastplus_mode = 0x1,
> +	.thigh_fast_fastplus_mode = 0x1,
> +	.setup_hold_time_std_mode = 0x08080808,
> +	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
> +	.setup_hold_time_hs_mode = 0x090909,
> +	.has_interface_timing_reg = true,
> +};

Why tegra194_i2c_hw can't be reused by T234? Looks like I2C h/w hasn't
changed and somebody just made a minor tuning of the timing parameters,
does it really matter in practice?
