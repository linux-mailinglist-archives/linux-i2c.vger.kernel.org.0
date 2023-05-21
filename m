Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE33C70AD36
	for <lists+linux-i2c@lfdr.de>; Sun, 21 May 2023 11:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbjEUJXo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 May 2023 05:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjEUJXn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 May 2023 05:23:43 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E85BE;
        Sun, 21 May 2023 02:23:42 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-953343581a4so722371066b.3;
        Sun, 21 May 2023 02:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684661020; x=1687253020;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKZukhm5GSKmU51vFPYjTGL4UgfSHtcD+TagC/Ptxm0=;
        b=skLr/EdpMfEGH9Rbaj/MDqy/ZaCgApTqRce7kKKb/XpIOmxL5ymm0tNmZTn+iosc5T
         pCI3QttHtALspn/OgQ4CrnDoE/S0wLEUD2mjP/0KT3yfLlcBGDtXdwl4nzjh4LEsAW55
         fRPctXrHaSyg3rch1vDJ2o5yzUXb1A18zRpFXRXV5HIH6jzLRu1pa2L7yKawF227dQmq
         uLWwgNJLYrWX6dIFhrKvw5i2ktBJSkKvZXIiTp1Di66t+lSgvkbD3urv7w5hyFFjEAaJ
         JbuRkwrpvzf+w0wh1H5w5O6z4wrX6RXTPbkaSodDnd54zUW3q+FZ0mDG5FeFeE1Shweh
         RkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684661020; x=1687253020;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKZukhm5GSKmU51vFPYjTGL4UgfSHtcD+TagC/Ptxm0=;
        b=JvbRCJrACtNhwZxJFR4Oh2uXB5RK4lEfb48SYUWn4J/0vyejhPomNyPPQk0Zea5Q6a
         lgPY2kKvzbbaCrawrN7Sq4pCKnrR4KuO6r5MK/dBMEBt1ImLBcWfJBgJC3g/r1IVtb87
         RLMXFolD7AahHHxcDyIZXg39tpk71InRHAQxxfeN4fG2cCvN9QJKSnjs2WxeP1i40Qvc
         wCE2tqZQsF3cSL7ZVTRrgWQISGQzOh9asFwLjt3CuLpiH1uygc0OTkU5c3lRFQzvReEO
         7VQ2GgXVJRAnanIiq6aHELewENCNhbNscIG5vbMLBgRaUhT9Re9+1abj7DzqT8gNKwi8
         YB9Q==
X-Gm-Message-State: AC+VfDxaxN/grMGwhLQbypxJ7LtiZAN60zT4/ePuZgkD/jiNkzGlpHqD
        AE/O3CTvdLL7duACs0Wlx+U=
X-Google-Smtp-Source: ACHHUZ6F95+Byml2u7GCsJXRFro0lfF2gly6Xq17xAqm93aO+AjPp3AXFSISVTQTNvriGN6myyKvsA==
X-Received: by 2002:a17:906:da89:b0:94e:70bb:5f8a with SMTP id xh9-20020a170906da8900b0094e70bb5f8amr6049235ejb.66.1684661019559;
        Sun, 21 May 2023 02:23:39 -0700 (PDT)
Received: from ?IPV6:2a02:168:575a:b00b:a38f:4e43:c984:c3e8? ([2a02:168:575a:b00b:a38f:4e43:c984:c3e8])
        by smtp.googlemail.com with ESMTPSA id gv3-20020a1709072bc300b0094f3b18044bsm1711947ejc.218.2023.05.21.02.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 May 2023 02:23:38 -0700 (PDT)
Message-ID: <6f1e866b-a96a-3134-c735-c941681b0638@gmail.com>
Date:   Sun, 21 May 2023 11:23:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Evan.Quan@amd.com, Lijo.Lazar@amd.com, Sanket.Goswami@amd.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com,
        andriy.shevchenko@linux.intel.com
References: <20230518161150.92959-1-mario.limonciello@amd.com>
From:   Gregor Riepl <onitake@gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: Mark dGPUs as DEVICE scope
In-Reply-To: <20230518161150.92959-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> As the power supply for a dGPU is only for powering devices connected
> to dGPU, create a device property to indicate that the UCSI endpoint
> is only for the scope of `POWER_SUPPLY_SCOPE_DEVICE`.

Is this a given fact?

I could imagine that a dGPU device would be capable of feeding power 
back into the system, for example when an external docking station or 
display device has a power supply connected to it.

Although I don't think it's possible (or safe) with a desktop system, 
maybe a portable computer with a discrete GPU would be able to do this?
