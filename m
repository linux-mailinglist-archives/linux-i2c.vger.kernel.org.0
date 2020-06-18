Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C06AB1FDA49
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jun 2020 02:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgFRAfZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Jun 2020 20:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726815AbgFRAfZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Jun 2020 20:35:25 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A6DC06174E;
        Wed, 17 Jun 2020 17:35:24 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c17so5088804lji.11;
        Wed, 17 Jun 2020 17:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aVNC1BmCPpKa2GzBW7dZAnKvPYTYo+NPkmNdX8JLnR4=;
        b=oq6rqjjV490TaHz7ljJj2OKmweYzMHSHXI8CX9EksQ7PVkG8UJip1AAb/GSVvL+jDM
         gNNMfBwQesoftmWn4/qvZ2jKf5u7uk8Cs4e5s0Edu0eD+CMDuR93LP7yhtqBTwsBUkdL
         n3C4c3+y06dbDvQixw9hRQrwAJWg63+r7eNfztdqITbNFJ9ec/IQ0ugOVpI2xqaKVAoi
         yKFZ5HJxuVr/EFBDmT/IRtiP3zDo06T17G7f5qK3ajHCKn31FETW1T3ONoJoBPiyLv5f
         jrW80a951reSe6OyyD74jlnbJpI4k/EeAvx8jTtCbIkaAvX/tI8tdDCmNJo3lDcm4j8W
         ojzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aVNC1BmCPpKa2GzBW7dZAnKvPYTYo+NPkmNdX8JLnR4=;
        b=TuJoKgWqgqrfpRb3Usrdnle8RJFmHND1NkzPec9kR6XlyfSU6eeacKA0E0nR6Ysejj
         4qOiHUvjSTXk+QdHSm40EOhaZWLy4UWNsJjr4/HTpf/jjJkDwOKDRSPOP4oKMcWs8yNG
         z55VOS3SJU5pGqCig+g9LIe0qhbgGA3MhiY8S+HxlLfTovfvRRXijDEOfOCNjPxDwoBC
         KGpe5M4fed0M8PxMRRWqhjNss0+fCfea1RSEByzHNajFZF7nD2nh6hQseARRNFiDeEGY
         +QTm48+me3EAZAakT2U+dD+bke2Wy9OpUBpe0ssZ6JHrrQ3eis7Qjsbpf3Aehsgv1IC6
         6tMw==
X-Gm-Message-State: AOAM531tZIOKR+CGD3TT7W+A8V9SCO8G5bp6qYNe1MgWVFjUzFEF6+cZ
        373eX8FJ+5oLn+vcYm8+iUdKuo2p
X-Google-Smtp-Source: ABdhPJySoj+3HX79azrckkO5FfjiF1ZkiNatXCo3k3yqzun4HMezlgP82x/GEbVO5pYeo7L78Uwfjg==
X-Received: by 2002:a2e:b4b9:: with SMTP id q25mr919864ljm.313.1592440522621;
        Wed, 17 Jun 2020 17:35:22 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id o19sm267788ljc.23.2020.06.17.17.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 17:35:21 -0700 (PDT)
Subject: Re: [RFC PATCH v2 14/18] gpu: host1x: mipi: Split
 tegra_mipi_calibrate and tegra_mipi_wait
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1592358094-23459-1-git-send-email-skomatineni@nvidia.com>
 <1592358094-23459-15-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <457e3754-c783-0ec4-068c-8b5f5ff8de0a@gmail.com>
Date:   Thu, 18 Jun 2020 03:35:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1592358094-23459-15-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.06.2020 04:41, Sowjanya Komatineni пишет:
...
> -static int tegra_mipi_wait(struct tegra_mipi *mipi)
> +int tegra_mipi_wait(struct tegra_mipi_device *device)
>  {
> +	struct tegra_mipi *mipi = device->mipi;
>  	unsigned long timeout = jiffies + msecs_to_jiffies(250);
>  	u32 value;
> +	int err;
> +
> +	err = clk_enable(device->mipi->clk);
> +	if (err < 0)
> +		return err;
> +
> +	mutex_lock(&device->mipi->lock);

The timeout variable should be assigned *after* taking the lock.

It will be better if you could use the read_poll_timeout() or
readl_relaxed_poll_timeout() here.

>  	while (time_before(jiffies, timeout)) {
>  		value = tegra_mipi_readl(mipi, MIPI_CAL_STATUS);
>  		if ((value & MIPI_CAL_STATUS_ACTIVE) == 0 &&
>  		    (value & MIPI_CAL_STATUS_DONE) != 0)
> -			return 0;
> +			goto done;
>  
>  		usleep_range(10, 50);
>  	}
>  
> -	return -ETIMEDOUT;
> +	err = -ETIMEDOUT;
> +done:
> +	mutex_unlock(&device->mipi->lock);
> +	clk_disable(device->mipi->clk);
> +	return err;
>  }
> +EXPORT_SYMBOL(tegra_mipi_wait);
