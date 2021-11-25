Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B8C45D76E
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 10:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353535AbhKYJoD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 04:44:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353943AbhKYJmD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Nov 2021 04:42:03 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C09F6C0613E1;
        Thu, 25 Nov 2021 01:38:34 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id c32so14821498lfv.4;
        Thu, 25 Nov 2021 01:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aQfEF2jOyB6rG0WgJqxX+s72gSlGzMx+nQDP2V3jnUo=;
        b=XP1s+2vl2wLKjYg8HW8m0tBRvF1KXYoTcuBdkaaqufBoeAAUNFbRtKZwsWlR9Qx9o7
         sQfne5msWVBOQ2sExqYlvGUSXCf/nzLL4eBoQjyPJrPkU6vh/e6Ski5TOJZXOR2ORSrI
         Bm+8i6X5FK/MPGj3rkm64ToQQgAAmHyN5TFzSlZBYu4WZP+L8sCHlNHUXxG5j1exzQDg
         TmzWk7pSIK/QvGZQw6J2q7td0fvZRwYoAPn0lK7WdP7iZemoSkWzW9UGjFqC6zGVMxLa
         llEiF9wHAVSX6MuEkqlXH6/AFGI+yHioqITD0XWU1zM8ylc0lOHJqsVFbzYAxOWc4mlA
         QxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aQfEF2jOyB6rG0WgJqxX+s72gSlGzMx+nQDP2V3jnUo=;
        b=JFMj3EnCmWSA3b3LS1j2vJkGfVvebfjRTkAiaWpCmiQFrYp5wwNgsxh82cQkBYMDhA
         VA0dbA3KO03pWxpIeBSyCNjO2Aac7OjxVeUNhx5TUsFuYUJkS3yhzvaiUkK9QpMm0ZFp
         z3PbdCJtuUZLlROCQLTarH+0G4x4Ti4afihRnX8LMCossvPG/qPpJWfkE9svx+LExefk
         DW+qC7rdkjslCt+qK8gPmNXUczUX7v9eY7oIvCyveFJHFih1rgHN/iVTaO+nbHsKl8FW
         irLkimbn/pBJ/uIYYNOYArQMDm7vuXcb1CTEbyDfkvtk3cJQe+9lt4t4kTzXmzr2oNmF
         sSrw==
X-Gm-Message-State: AOAM532NdryNS0lenYCSepCDiV0xwxsdYHkWcXQIyiw3LW3gLvoqXZpa
        8U2eFKnrBJrKkqvWc4Z7U/0K81Eskr0=
X-Google-Smtp-Source: ABdhPJzWc+bPvWIJYmGhydRiz7YOTBnPcF7QeIDgBqlVGZLg7GMaZCawciOk/gkfmc3Yo0+Xvj4ncw==
X-Received: by 2002:a05:6512:3213:: with SMTP id d19mr22334711lfe.519.1637833113104;
        Thu, 25 Nov 2021 01:38:33 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.googlemail.com with ESMTPSA id n9sm203122lji.131.2021.11.25.01.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 01:38:32 -0800 (PST)
Subject: Re: [PATCH v3] i2c: tegra: Add the ACPI support
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     andy.shevchenko@gmail.com, christian.koenig@amd.com,
        dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
        ldewangan@nvidia.com, linaro-mm-sig@lists.linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        p.zabel@pengutronix.de, sumit.semwal@linaro.org,
        thierry.reding@gmail.com
References: <1637831237-30652-1-git-send-email-akhilrajeev@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2a005ca8-e46a-59d0-c219-dfc94a3b810f@gmail.com>
Date:   Thu, 25 Nov 2021 12:38:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637831237-30652-1-git-send-email-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

25.11.2021 12:07, Akhil R пишет:
> Add support for the ACPI based device registration so that the driver
> can be also enabled through ACPI table.
> 
> This does not include the ACPI support for Tegra VI and DVC I2C.
> 
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 52 ++++++++++++++++++++++++++++++++----------
>  1 file changed, 40 insertions(+), 12 deletions(-)
> 
> v3 changes
>   * removed acpi_has_method check.
>   * moved dev_err_probe to init_reset function to make it consistent with
> 	init_clocks.
>   * Updates in commit message as suggested.
> 
> v2 - https://lkml.org/lkml/2021/11/23/82
> v1 - https://lkml.org/lkml/2021/11/19/393

Akhil, the patch looks almost good, thank you. Please see one minor
question below.

> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index c883044..b889eb3 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -6,6 +6,7 @@
>   * Author: Colin Cross <ccross@android.com>
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> @@ -608,6 +609,7 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
>  static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>  {
>  	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
> +	acpi_handle handle = ACPI_HANDLE(i2c_dev->dev);

...
> +static int tegra_i2c_init_reset(struct tegra_i2c_dev *i2c_dev)
> +{
> +	if (has_acpi_companion(i2c_dev->dev))
> +		return 0;

Can we use ACPI_HANDLE() everywhere instead of has_acpi_companion()? For
consistency. I guess that's what Andy was asking about in v1?
