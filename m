Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC27834EDB8
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 18:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232101AbhC3QZI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 12:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231636AbhC3QYy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Mar 2021 12:24:54 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964B8C061574;
        Tue, 30 Mar 2021 09:24:53 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id o126so24740991lfa.0;
        Tue, 30 Mar 2021 09:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=339UXax5F8QdHr8UBYu8EdZcLhvc9+zU3y6Hdd2n1J4=;
        b=qlvOclVDnZBS8PoE5hSdIeacO7StUs2cVwGa1tUXP5aiZpOgEaILI0zZjzaspFMs28
         1oSI4bYqlTwCMnioZWSicvgAbirtaZ95YB1ImzCJUtrK9fk8ODpgHiATlaeCLFoPiIMV
         ImadC2KsDSWxhEtt9k5MqTjKkI3kkYa7wE8Om6KD2eKvwhr6Ivu4WA3qkbu8W5T75ePm
         dtB5p99k7hFOsHhgo4dhWyBKvxEjBlw8gE4vQrnfh1WU1+xSx7bTnVK8HSsq9pcWyA5K
         vkh3nbfNaEQ3BsPf2fbwLzeqlg5Ou4TBZrgA2MBXvT0HAjSTW+JrcTvb/JlrI+isOV43
         IQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=339UXax5F8QdHr8UBYu8EdZcLhvc9+zU3y6Hdd2n1J4=;
        b=c+NQft15KooCHjdOSO8a5cT97Tq7TdnA/5PDmWZ0WJDP1Q6iVbJMGAKeSGezqMEy4I
         qq77rpYz4rjjrxEHaHRVCTOPXOImBT6H8NB+1gxbuozFbfm1N//lHF4Sgfgdn1h/3la9
         1m0ArXrvNFad3ili5vvUj6HG6jdISfEPmUu4FD4K7GqoxDWfgln7ydxLgEMQPAmIOz36
         8+oJdg/Kf9T0KxePk4pVaih1bh2IM4Rr390wsqTI1ZAhjtRnLkOdpS8KHyYIwUrf/yS0
         T2dKVTfkCIw5pD5LZgjVX5cZmsbOEH1uiEW/jn2e54VaVmnr/JIizfWSa0jFf09kb5xs
         uGiw==
X-Gm-Message-State: AOAM532iMvLi4Pndk2J9s2K0o62mVHXcDmuQxqliwGdeupM4pAyAs6sw
        WFmRxyxZsw51olv9GTlQVIE=
X-Google-Smtp-Source: ABdhPJzoRcas0MxCnuDZ9ZRCeCbO6KYtWxEOLGqqnMJeQrpS+ht6SG1ElAitmGTlsZBauPbiA0oUzQ==
X-Received: by 2002:a19:b8c:: with SMTP id 134mr21452120lfl.430.1617121492193;
        Tue, 30 Mar 2021 09:24:52 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-98.dynamic.spd-mgts.ru. [109.252.193.98])
        by smtp.googlemail.com with ESMTPSA id 188sm2315632lfo.0.2021.03.30.09.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 09:24:51 -0700 (PDT)
Subject: Re: [PATCH v5 3/5] i2c: add support for HiSilicon I2C controller
To:     Yicong Yang <yangyicong@hisilicon.com>, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org
Cc:     treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, mika.westerberg@linux.intel.com,
        prime.zeng@huawei.com, linuxarm@huawei.com
References: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
 <1617113966-40498-4-git-send-email-yangyicong@hisilicon.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b761fa05-1bf9-ce4c-e2b5-f39b418f0da9@gmail.com>
Date:   Tue, 30 Mar 2021 19:24:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1617113966-40498-4-git-send-email-yangyicong@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

30.03.2021 17:19, Yicong Yang пишет:
...
> +struct hisi_i2c_controller {
> +	struct i2c_adapter adapter;
> +	void __iomem *iobase;
> +	struct device *dev;
> +	int irq;
> +
> +	/* Intermediates for recording the transfer process */
> +	struct completion *completion;
> +	struct i2c_msg *msgs;
> +	int msg_num;
> +	int msg_tx_idx;
> +	int buf_tx_idx;
> +	int msg_rx_idx;
> +	int buf_rx_idx;
> +	u16 tar_addr;
> +	u32 xfer_err;
> +
> +	/* I2C bus configuration */
> +	struct i2c_timings t;
> +	u64 clk_rate_khz;

Looks like the u64 is overkill here and it doesn't allow you to use
COMPILE_TEST because 32bit arches can divide u64 only using the
do_div(), please fix this.

...
> +static const struct acpi_device_id hisi_i2c_acpi_ids[] = {
> +	{ "HISI03D1", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, hisi_i2c_acpi_ids);

> +MODULE_ALIAS("platform:hisi-i2c");


Nit: I think the MODULE_ALIAS shouldn't be necessary for this driver
since it will be matched by the ACPI table. You should be able to remove
it safely.
