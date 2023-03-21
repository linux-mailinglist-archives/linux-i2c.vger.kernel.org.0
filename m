Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C98D6C36EA
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Mar 2023 17:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbjCUQ10 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Mar 2023 12:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbjCUQ1Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Mar 2023 12:27:25 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 965E846099;
        Tue, 21 Mar 2023 09:27:13 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id c18so18552259qte.5;
        Tue, 21 Mar 2023 09:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679416032;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bWItCEGK6khz5+cq2aChgbY6kgyAqOoNV2Ytyqot+Vs=;
        b=FNtohfhtxSZvVpqqzY72Cp+HY9Kpexhj6+Gkb/85IHjdXmTSdq83nZyL69pl1feNlZ
         Ox34bIJ4oDpn3wn7Sp8vov50ID7VufAPS620zGc/iRtluVvPFi2t5T0wbIdQ3OhTtirX
         Z6+aOv633+HgR/wL2MY4r+xcy7jCXM2sk7Ows0MJeyfQTkqx4b2coq+Fpi7zFHSbxz+f
         RULW6aL8rKl73KT4gFRNbrbklrAuixMXNkX3qRNNmtKKCwugjxL7TbYai8e8/OBsfBnV
         dwnYvxu3reKHic0bo4XDgRLxixS3ib1fCFNAUpsD6mrJwdGbddcWflRqIFtKd0rmW7aJ
         zE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679416032;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bWItCEGK6khz5+cq2aChgbY6kgyAqOoNV2Ytyqot+Vs=;
        b=NXCeK8jxWOFzv8CNS/cnjOl03K9SAF5XIYxzLFlH2Rpop4O1MHKh11a4fWSuhEHtWn
         myqyKk4+7YuBl57T1t2KOXHeCbv+/uACxu5H8AbUvNJZ+HPTFSVuJ5UuvYux8lCSAp1c
         k04csaDs1xFZErWNPizWsqRJ3omfOSkC2RPcbvtrxDDBem8+EBwS1gg5wcUNZ+UTdWBy
         CJ8wM6ulDg/7yuidoUqKWozsHiXjXDQ41l490LVb7YCzO6UJxIJMmuQexef4hU9iF9WG
         57KvCNYNMum8BdKo9Zj5851Hu+GGBbKH4I6QkHzbTfPAYh6LE+9St2hhyJKrbTCgeieJ
         CDAA==
X-Gm-Message-State: AO0yUKV11+0V6RYl6FD+QxB1pc4B3BkefyKt+y87gEm0noutcQgyuUXL
        fj1m22ttZ1lzAg3hfGYZpRvqaSc/aDs=
X-Google-Smtp-Source: AK7set+AXBqUGKxjyRYI1M909bkOFeWTq7pmlBghLp8uVYfmremXh3d5YGWtNHaHTLUssNIBSVW/Ew==
X-Received: by 2002:ac8:5f4d:0:b0:3b8:6ae9:b10d with SMTP id y13-20020ac85f4d000000b003b86ae9b10dmr804759qta.2.1679416032509;
        Tue, 21 Mar 2023 09:27:12 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id h2-20020ac85682000000b003e388264753sm357387qta.65.2023.03.21.09.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 09:27:12 -0700 (PDT)
Message-ID: <044a2033-3398-0836-6b54-798d62fcb84c@gmail.com>
Date:   Tue, 21 Mar 2023 09:27:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] i2c: brcmstb: use devm_platform_ioremap_resource_byname()
Content-Language: en-US
To:     ye.xingchen@zte.com.cn, kdasu.kdev@gmail.com
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <202303211944063761253@zte.com.cn>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <202303211944063761253@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/21/23 04:44, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> Convert platform_get_resource_byname(),devm_ioremap_resource() to a single
> call to devm_platform_ioremap_resource_byname(), as this is exactly what
> this function does.
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

