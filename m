Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2800674270
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 20:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbjASTMg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 14:12:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbjASTLp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 14:11:45 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D38C5966EA;
        Thu, 19 Jan 2023 11:11:08 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-4e9adf3673aso41018607b3.10;
        Thu, 19 Jan 2023 11:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8B7GFIEyvVIjKkXuyuV/XZR25dZL8cuwoxhgwZD0+oQ=;
        b=mqhgld+dIyTo2kp0Mk2Y4DNEUiD/ir0lLR7a4B0Ljiq6ccy+HZjf/pRVywA0HfpgH7
         t5b8BaX/nDmdn/NYXHasVHalNVD7FwzVKr1tw/zdBH/oQ3lovUVpWezZ53dG2dlUkMHf
         Q9JItj9taaVHK648X1yE1DORGQXB8OrfiSBM8qAKLBLPTxART6VO2/qzLesj8jcH3s+s
         mgXrCwnCeUDNt+3TS3Zg4BIic4wutd78xSPYxqj5Zh3aG+u0DvTHMHtz82MD8mLI7dIn
         Pie/FORTlQA4+O8nNB879+4XjLbOKuIhWtX8LHBFWA0gq4LsIVDD1UBWMkBaGS3ArQIc
         xZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8B7GFIEyvVIjKkXuyuV/XZR25dZL8cuwoxhgwZD0+oQ=;
        b=ck8MGg/zuHS5X1jfryZBar0Lygu0mnBrTqpoQQX/VxZTAvbL/668qaRqEdVAQVhCXq
         S518yqxdDLgQJfme5QnX/S9Zmrq6+4ZwdD4ZGkanIMg6Op3Idt+6g7oGiXjYr9GYrKUT
         THi+dhFUcZIn5VY7BE9A/niPNNxT/ifL6Aw3312g4KZexFvPAFYg1sKvi+IHwPnWolx5
         m50oUWFJ674WXDvnyxwYSIFP4rCjeW1fFGjaDXhSW3IYMWWEk2e+lIYfXyJZh2V58wdv
         OFLM3sRURx1Q4lTXIQoKBGPBpwVOFP7p5BoOetoEmZWco9O5udCUdkTL9C6if9xIfo7A
         Ywhw==
X-Gm-Message-State: AFqh2kqxiR/bt2D+mnMr4lGBGpDcyi+6zbr91yhuUiBCFefqWivlqhAi
        tRRdBicCNakUpoJ209fVBYk=
X-Google-Smtp-Source: AMrXdXuWMn1rH+G1fyL9hdDio9/BBoS+R16vIqP/WZu6/MRmQw1ifoJM8wSvyYWLDRgevK436a+vJQ==
X-Received: by 2002:a81:1d01:0:b0:4de:5e26:9d3 with SMTP id d1-20020a811d01000000b004de5e2609d3mr4903725ywd.23.1674155438660;
        Thu, 19 Jan 2023 11:10:38 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id r18-20020a05620a299200b006cebda00630sm24688137qkp.60.2023.01.19.11.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 11:10:37 -0800 (PST)
Message-ID: <26e462e2-c61b-6003-b3ec-9ff0026d418d@gmail.com>
Date:   Thu, 19 Jan 2023 11:10:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] i2c: bcm2835: Use
 devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To:     ye.xingchen@zte.com.cn, wsa@kernel.org
Cc:     rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, stefan.wahren@i2se.com,
        eric@anholt.net, christophe.jaillet@wanadoo.fr,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <202301191718471268817@zte.com.cn>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <202301191718471268817@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/19/23 01:18, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

