Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35B7D599E1A
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Aug 2022 17:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349676AbiHSPPf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Aug 2022 11:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349448AbiHSPPb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Aug 2022 11:15:31 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE7EC6EA1;
        Fri, 19 Aug 2022 08:15:30 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id bx38so4790636ljb.10;
        Fri, 19 Aug 2022 08:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=J7TGRTezofvJGmRn6WMwQvntLGym5tFzI3/5S+8ph8c=;
        b=UETRV2CQOVm4smk4fY6/wnI3buuWka4WnocxnkAAYVMJeIgOQ6cd3ltCLGFxNV/aV0
         EcU69MAjV5OMyf9wsdq67xddMNO6uJx54NCSWfFGwi2VaYUdE14EgeffZ7BVrAf3gTtR
         ECfzp0S8bHTA6XcytmDlxIZ8UnqQCY2RK+sSTLs/wQhOdj13rFHM1j9gSXL0caOvzw1I
         HXuBcwO+7ilE1oTXUisQaycsoeTSwiwaKzfClN/SxVONVRZcubh7FzAbioYHqkut8zcD
         /FI7gEQ++iM00MupIb9afU/nAReXxudNL/iY2SV0jYHO4dIUuc440ApnkbKQ3V0eYG+Z
         j0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=J7TGRTezofvJGmRn6WMwQvntLGym5tFzI3/5S+8ph8c=;
        b=AK14+GFVBmVpOdh4N+Ngt/uVSfN1FYZEBrCYHykXYu+tACkSSecbwD5N60O2Ao4wEH
         QhL9rWirndG5pPv2xMx26Q1FqUvXUJXtdXLwjzdlZWrJBscJ/ARydyhWF0/W+6dBRd6r
         aeJReKvaq8WLN+EzsO4ilrV38lJB595znGaxD7ddpKs8SEeGIkVcDJvLl6BN6o7M3PVS
         8zFMkG8EFz7gzH5UK9C93hLGcvBgBkLLKM4W1PzHgpqYtmNQSGrKqVs+rBWMpm4g3q76
         8yIIVYCSi7fC2tX0mOdQOmEdqy9MgDKODVoP3WopzGueGisB0kXyfUARJvvCz8Qlimko
         7gmg==
X-Gm-Message-State: ACgBeo0VGSPTqBBqC3tc2p+Te8Zyvn/3Kvcbp+rl82i9oIUSL2aXGdGZ
        rHx7yijtBpc+Dlx5qzQ5XPTKoB2QLIs=
X-Google-Smtp-Source: AA6agR7+l5iinUm2hfAr7gcZ3bfFnz+NsNrXZJYivWrsh1jP3FybA1+VLwUDE2WYl9tOtgzpelm/VA==
X-Received: by 2002:a2e:956:0:b0:261:b3cb:fe5 with SMTP id 83-20020a2e0956000000b00261b3cb0fe5mr1980321ljj.184.1660922128509;
        Fri, 19 Aug 2022 08:15:28 -0700 (PDT)
Received: from [192.168.2.145] (109-252-119-13.nat.spd-mgts.ru. [109.252.119.13])
        by smtp.googlemail.com with ESMTPSA id u1-20020a05651c130100b0025fdcdad0e4sm644138lja.35.2022.08.19.08.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 08:15:27 -0700 (PDT)
Message-ID: <20281ca7-e597-7030-4861-5f9a3594726d@gmail.com>
Date:   Fri, 19 Aug 2022 18:15:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, christian.koenig@amd.com,
        =jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, sumit.semwal@linaro.org,
        thierry.reding@gmail.com, wsa@kernel.org
References: <20220819122313.40445-1-akhilrajeev@nvidia.com>
 <20220819122313.40445-2-akhilrajeev@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220819122313.40445-2-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

19.08.2022 15:23, Akhil R пишет:
>  	if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
>  		i2c_dev->is_vi = true;
> +	else
> +		i2c_dev->dma_support = !!(of_find_property(np, "dmas", NULL));

1. You leak the np returned by of_find_property().

2. There is device_property_read_bool() for this kind of property-exists
checks.

3. If "dmas" is missing in DT, then dma_request_chan() should return
NULL and everything will work fine. I suppose you haven't tried to test
this code.
