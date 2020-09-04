Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E664125D6FA
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Sep 2020 13:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729992AbgIDLEg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Sep 2020 07:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730076AbgIDLCp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Sep 2020 07:02:45 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C14C061245
        for <linux-i2c@vger.kernel.org>; Fri,  4 Sep 2020 04:02:43 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id s13so5662442wmh.4
        for <linux-i2c@vger.kernel.org>; Fri, 04 Sep 2020 04:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=NfwkNFk09ZusBLOpLBTzQZi+H+vFvkYJED/TT3XgJYw=;
        b=JZd50ylcdwr2PHwgwiiaZbZPtEwrGD9obMYXTwpZhmQPv/Lx0wB5KCsEfKIKGKv7ni
         S0TL0ck/MMQKYiuWElIRT0D4FGT8AJ6zDeu2mMpdm1mzf3FKDmAceMkHYdmQSn8OZkVU
         WYCL/bNmxjKSpU0YjiDiqFJzwHDIW/8oA5YwGb35qTuWFWL3pnnL8DMK/lfPXFqmR8VS
         Ge1jpfi/BDhBGpau/jZqgYHFBjpUo9RWBh3BL2x+X46DPjOzmrYEWUWRK0GxHH6Ms5W7
         XFO5XIpa4Y+4vtV2ytbTIiJKpkEbXF5SWJIeHjMpt7rIXEPmKV+g5tU55WRpK3AT+OZV
         cDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NfwkNFk09ZusBLOpLBTzQZi+H+vFvkYJED/TT3XgJYw=;
        b=sDsotwng79Qozrk+LDSEAnKrrIoCECfsz9ajDmkNPuGNPHlsD4vE2qNHJ55HSQ8SFc
         sFCEEprR2GkjvbNAhTp2pn1VJS7xVLyI4jKI4v6X5E3AwSCAl2Ue4xxi1Rofzq1uQfEq
         1NDRpRw2CN5w9GKQhvPfMZbzjjlWfmKHuriniw9vMJ8fd88Dqa+WC1L0yZgZ2Qq6lNrj
         GGTXERapuqf6C4uHYM6vC/UukzNLvjaizJ4tDfQNNm+7yukw8KQcAOe+07rKsInQDK6O
         ySapD8IpeAbiaopC16Ws2tl5Rka5DkSHrGlQuohWtu+jADxgpssmqqFsrsE43eMfI3/S
         gtNQ==
X-Gm-Message-State: AOAM533xkDt4VW6j6mW1GfVXrtuAQ5+1HQmOT9yuv4dc0qfvr8e6KKug
        iKH3/O8128tutda5lhw/Yo30mA==
X-Google-Smtp-Source: ABdhPJyDXc07W9KvlQK9EHpFRFv+t6KZPHfDW0yXqRKut/IryH4+skf+lxaDkSbM+QVtkaGdqqxNog==
X-Received: by 2002:a1c:b4c1:: with SMTP id d184mr7475012wmf.26.1599217362207;
        Fri, 04 Sep 2020 04:02:42 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id a127sm10514447wmh.34.2020.09.04.04.02.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Sep 2020 04:02:41 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] nvmem: core: allow to register cells during nvmem
 registration
To:     Vadym Kochan <vadym.kochan@plvision.eu>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200831015539.26811-1-vadym.kochan@plvision.eu>
 <20200831015539.26811-2-vadym.kochan@plvision.eu>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6ab47f55-af66-f035-d8d9-82d0c831b5b8@linaro.org>
Date:   Fri, 4 Sep 2020 12:02:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200831015539.26811-2-vadym.kochan@plvision.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Vadym,

Thanks for the patch,
On 31/08/2020 02:55, Vadym Kochan wrote:
> Add NVMEM_PRE_ADD notification step which is called before any cells
> binding - from lookup table or config, this allows to register cells
> in some specific layout (tlv) which should be parsed first and then
> registered. So there might be a cell parser driver which can register
> lookup table during this notification step.
> 
This is going in right direction but totally not correct way to do it.

1> this is not scalable as any consumer that will register for this even 
will have no idea of which what kind of parsing that provider needs.
It can work in your case but not really useful.

2> this is a consumer API, not the provider api.

How about adding a "parse_cells" callback in struct nvmem_config along 
with encoding type.


thanks,
srini

> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> ---
> v3:
>      1) Update core.c changes by extending notification mechanism
>         by adding new NVMEM_PRE_ADD event id which is called before lookup
>         table cells binding, this allows for notification handler to
>         register cells which require nvmem parsing.
> 
>   drivers/nvmem/core.c           | 2 ++
>   include/linux/nvmem-consumer.h | 1 +
>   2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 6cd3edb2eaf6..c48a69e0ebbe 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -668,6 +668,8 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   			goto err_device_del;
>   	}
>   
> +	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_PRE_ADD, nvmem);
> +
>   	if (config->cells) {
>   		rval = nvmem_add_cells(nvmem, config->cells, config->ncells);
>   		if (rval)
> diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
> index 052293f4cbdb..0f7107276756 100644
> --- a/include/linux/nvmem-consumer.h
> +++ b/include/linux/nvmem-consumer.h
> @@ -50,6 +50,7 @@ enum {
>   	NVMEM_REMOVE,
>   	NVMEM_CELL_ADD,
>   	NVMEM_CELL_REMOVE,
> +	NVMEM_PRE_ADD,
>   };
>   
>   #if IS_ENABLED(CONFIG_NVMEM)
> 
