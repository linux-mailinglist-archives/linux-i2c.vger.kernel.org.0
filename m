Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD3D879BFEB
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Sep 2023 02:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236765AbjIKVSU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Sep 2023 17:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236787AbjIKL0J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Sep 2023 07:26:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6390FCE5
        for <linux-i2c@vger.kernel.org>; Mon, 11 Sep 2023 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694431518;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2Iim/K20vnt05KkdZYOYBtAD92BDdr0wfxtmdMEpivQ=;
        b=hLkSFKhN4B4cyQ926IewAvN3TcP62j+E86JtKxJvC86/5j7YSK9qxXzD9QIWBLLR6O52WS
        H3bZc2hQg6Lpcv8Hw80rrZ74noVzvvCEKF8LgbS9Joal9MdtHduaNo9uUFB5HR+fqkIY8u
        VE2+0VIyQR1Q4tqREbsUaXicUjiQf8c=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-RS5Gn6H0Np-qTIrozEZaIA-1; Mon, 11 Sep 2023 07:25:17 -0400
X-MC-Unique: RS5Gn6H0Np-qTIrozEZaIA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-98e40d91fdfso299246166b.3
        for <linux-i2c@vger.kernel.org>; Mon, 11 Sep 2023 04:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694431516; x=1695036316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Iim/K20vnt05KkdZYOYBtAD92BDdr0wfxtmdMEpivQ=;
        b=ClCubaTDuf3jAdiZJGLrn12PMUmoU0/i+hV+jhx77n1ApXRZrg2IIPulH0RVby/1zm
         FmBEzAFlw9tTX2I8qu/6sXahDbj3NtlyJUTlG6z5+grT7R9fhQV6f/4QpKqOEbJ8Lm5z
         fXiQzAJophcgQ5eS2d0gxTfcGb3AVzS2sYxD74+duR1dVjDBTaHEV60s2qvPxjxlxjme
         HI+CFcasVY1QVw+A5oMeoRlyASxObOQTE95ZKmRTte6F5NcxBwfArPRh+8m2GdIcskLB
         EpPv8OQTEM+YRHd2asGUk1XZBmBG/3Iak1x6avIXlJSuRvVa9zHGjZXC/lhk/sZoJ7nn
         YxfA==
X-Gm-Message-State: AOJu0YwiLhAPDq5IfQINyPWaAsiPJFKi2tgowKLvX5QhNHixqqgtcXdT
        EIV1KCjCWdMVZTNjDWtObGvFQ4zG6w4AjeVJTjW+ewlx8RdLbUk4tY8kTb6EXZUhv/IZxlVykdL
        HStvr6jINcOSOOf2zs5ZL
X-Received: by 2002:a17:907:a073:b0:9a1:d400:39e5 with SMTP id ia19-20020a170907a07300b009a1d40039e5mr7153723ejc.4.1694431515985;
        Mon, 11 Sep 2023 04:25:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRmzBlFjuupO/WhzEW9QA8x/A7Crw88ZDujh/u8xJM8zhdS52wjhVtQr5s2VmPio2T37TxEA==
X-Received: by 2002:a17:907:a073:b0:9a1:d400:39e5 with SMTP id ia19-20020a170907a07300b009a1d40039e5mr7153710ejc.4.1694431515670;
        Mon, 11 Sep 2023 04:25:15 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id z20-20020a170906241400b009829d2e892csm5243509eja.15.2023.09.11.04.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:25:14 -0700 (PDT)
Message-ID: <f1ac222b-00ce-70cd-2d26-d66bc0b0ef70@redhat.com>
Date:   Mon, 11 Sep 2023 13:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] platform/mellanox: NVSW_SN2201 should depend on ACPI
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Andi Shyti <andi.shyti@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1693828363.git.geert+renesas@glider.be>
 <ec5a4071691ab08d58771b7732a9988e89779268.1693828363.git.geert+renesas@glider.be>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ec5a4071691ab08d58771b7732a9988e89779268.1693828363.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 9/4/23 14:00, Geert Uytterhoeven wrote:
> The only probing method supported by the Nvidia SN2201 platform driver
> is probing through an ACPI match table.  Hence add a dependency on
> ACPI, to prevent asking the user about this driver when configuring a
> kernel without ACPI support.
> 
> Fixes: 662f24826f954d49 ("platform/mellanox: Add support for new SN2201 system")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Note I'm only picking up PATCH 1/2. I expect 2/2 to be merged
through the i2c tree.

Regards,

Hans



> ---
>  drivers/platform/mellanox/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
> index 382793e73a60a8b3..30b50920b278c94b 100644
> --- a/drivers/platform/mellanox/Kconfig
> +++ b/drivers/platform/mellanox/Kconfig
> @@ -80,8 +80,8 @@ config MLXBF_PMC
>  
>  config NVSW_SN2201
>  	tristate "Nvidia SN2201 platform driver support"
> -	depends on HWMON
> -	depends on I2C
> +	depends on HWMON && I2C
> +	depends on ACPI || COMPILE_TEST
>  	select REGMAP_I2C
>  	help
>  	  This driver provides support for the Nvidia SN2201 platform.

