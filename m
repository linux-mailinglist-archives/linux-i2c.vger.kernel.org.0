Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2AB1F55DE
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 15:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbgFJNdt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 09:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbgFJNds (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 09:33:48 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A4A2C03E96B;
        Wed, 10 Jun 2020 06:33:48 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x22so1474483lfd.4;
        Wed, 10 Jun 2020 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YEZkLSkeVvdVz2I9RR2Z8l3HmZABbiGFnykMWSMSezE=;
        b=OdUq18jK2Why49i+Fv2ZXOOBYqasjrH2pqWcZVdLX967PGJq9HdqxQaquw3YwPXeTf
         PMGfty+eAs7DMXM8DecR12of2f7QSIlpaTAbGp5n351K94hBsEn+7kbYQKYPaVFb2v2p
         8agfdrk4em/hCjeb7qpsJd/hD6NCgojvqQMhP0IOzcGrPoqdAxz3QUcRgANFJmUGPEEO
         N4lP/hIr4j1F0db02LJWebmPEEsspl7RPQpzijtmiGB8t+AyV4YZa7vqK7oj0mfaz2j2
         y8dRex51vZi3RqpOLHVmEtea3dsUAdoNSHIkCrxIJZ099zQ3Epn3+V+EFShEsCDd5LgS
         rhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YEZkLSkeVvdVz2I9RR2Z8l3HmZABbiGFnykMWSMSezE=;
        b=fAJQbgDbHm7AW3fc5gh3j3cwq5zmQ37d2drqYsbftaeBylv03AtfLzWzmCKtWY9pfg
         NX4GcYGkBHG39BLCEZrndflws5ElQ+7da1mNt8Jvj0cwgCvdbDr8ik+c4z0p7ZtmHaTg
         43vltUB+8koE+BJNY69osONIjya2T6wBkOcXTebRA5yCkqU1LtZRWedzPlTmmMgF7PYt
         TvcCPkAE0LJPj3OmTrjc1FNk5R/4WqSKPu6ULkMp+ElsHlPqVTnxp7NNgUgOUuhl3Y/G
         fGvW5mCsmFr+ohGL91xW+viRY5USnMfjzjY3/kU3H0+UqQ2QMJUe1ZBz2mvZEaIGxNg+
         JuVw==
X-Gm-Message-State: AOAM532iZvlskYGe0dPAFWuFx2GWetW42Pf4uPEZ9cxRUgCWDJxsp+tO
        KiM7cKB7UVnuYdnvVpIhloFYU7T4
X-Google-Smtp-Source: ABdhPJx6QoodCmeaFLd2gAfQNcaDVSeaiNrrnokJtx5cXUmYo+dwjW5WfG+0fI8yb+gdaqJI/l13kA==
X-Received: by 2002:ac2:5e90:: with SMTP id b16mr1832962lfq.170.1591796026124;
        Wed, 10 Jun 2020 06:33:46 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id 4sm4997461ljq.34.2020.06.10.06.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 06:33:45 -0700 (PDT)
Subject: Re: [RFC PATCH v1 13/18] gpu: host1x: mipi: Add
 of_tegra_mipi_request() API
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
 <1591768960-31648-14-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e84c6723-e94a-3fcf-8b38-eb680c88de25@gmail.com>
Date:   Wed, 10 Jun 2020 16:33:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1591768960-31648-14-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

10.06.2020 09:02, Sowjanya Komatineni пишет:
> This patch adds an API of_tegra_mipi_request() to allow creating
> mipi device for specific device node rather than a device so Tegra
> CSI driver can use it for calibrating MIPI pads for each stream
> independently.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/gpu/host1x/mipi.c | 10 ++++++++--
>  include/linux/host1x.h    |  2 ++
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> index e00809d..f51fe69 100644
> --- a/drivers/gpu/host1x/mipi.c
> +++ b/drivers/gpu/host1x/mipi.c
> @@ -206,9 +206,9 @@ static int tegra_mipi_power_down(struct tegra_mipi *mipi)
>  	return 0;
>  }
>  
> -struct tegra_mipi_device *tegra_mipi_request(struct device *device)
> +struct tegra_mipi_device *of_tegra_mipi_request(struct device *device,
> +						struct device_node *np)
>  {
> -	struct device_node *np = device->of_node;
>  	struct tegra_mipi_device *dev;
>  	struct of_phandle_args args;
>  	int err;
> @@ -252,6 +252,12 @@ struct tegra_mipi_device *tegra_mipi_request(struct device *device)
>  	of_node_put(args.np);
>  	return ERR_PTR(err);
>  }
> +EXPORT_SYMBOL(of_tegra_mipi_request);
> +
> +struct tegra_mipi_device *tegra_mipi_request(struct device *device)
> +{
> +	return of_tegra_mipi_request(device, device->of_node);
> +}
>  EXPORT_SYMBOL(tegra_mipi_request);
>  
>  void tegra_mipi_free(struct tegra_mipi_device *device)
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index c230b4e..a61ca52 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -325,6 +325,8 @@ int host1x_client_resume(struct host1x_client *client);
>  
>  struct tegra_mipi_device;
>  
> +struct tegra_mipi_device *of_tegra_mipi_request(struct device *device,
> +						struct device_node *np);

Looks like adding a new function here is a bit of overkill. What about
to change tegra_mipi_request() to take the node argument?
