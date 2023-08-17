Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2F677F858
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 16:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237258AbjHQOHZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 10:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351353AbjHQOGy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 10:06:54 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 996E43A94;
        Thu, 17 Aug 2023 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1692281147;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/ApwB3YcsnCn9XG5biIy0Go7jLf5KCwN2xtUDT8/hm4=;
        b=ZDaaatgUmptBPIVXZLB0THIMMl452wQVKPuIuM1Y5gbOa3tuqRlCexp8NHwv9a8K5kh3uK
        2Hd5jL99jLBiUN9GIP78NBsi8j8RuU+k+ayviI+vPQ+3sieHtYGivNYiwrNliWmA2zAna9
        e0hBpn5fCa6gZc1Hf13Lz33Ph5Bzias=
Received: from [192.168.43.126] (hen56-1_migr-78-240-185-16.fbx.proxad.net [78.240.185.16])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id dcfff382 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Thu, 17 Aug 2023 14:05:46 +0000 (UTC)
Message-ID: <e44e39b5-e989-6820-f283-9e3271048940@sionneau.net>
Date:   Thu, 17 Aug 2023 16:05:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/8] i2c: sprd: Add configurations that support 1Mhz and
 3.4Mhz frequencies
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
References: <20230817094520.21286-1-Huangzheng.Lai@unisoc.com>
 <20230817094520.21286-2-Huangzheng.Lai@unisoc.com>
Content-Language: en-US
From:   Yann Sionneau <yann@sionneau.net>
In-Reply-To: <20230817094520.21286-2-Huangzheng.Lai@unisoc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le 17/08/2023 à 11:45, Huangzheng Lai a écrit :
> This patch adds I2C controller driver support for 1Mhz and 3.4Mhz
> frequency configurations.
> @@ -347,6 +347,10 @@ static void sprd_i2c_set_clk(struct sprd_i2c *i2c_dev, u32 freq)
>   		writel((6 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
>   	else if (freq == I2C_MAX_STANDARD_MODE_FREQ)
>   		writel((4 * apb_clk) / 1000000, i2c_dev->base + ADDR_STA0_DVD);
> +	else if (freq == I2C_MAX_FAST_MODE_PLUS_FREQ)
> +		writel((8 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
> +	else if (freq == I2C_MAX_HIGH_SPEED_MODE_FREQ)
> +		writel((8 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
>   }

Maybe using a switch case could be beneficial to readability instead of 
a series of if / else if ?

-- 

Yann

