Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B88F2711763
	for <lists+linux-i2c@lfdr.de>; Thu, 25 May 2023 21:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243352AbjEYT1L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 May 2023 15:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243679AbjEYT0x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 May 2023 15:26:53 -0400
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E89E2E62
        for <linux-i2c@vger.kernel.org>; Thu, 25 May 2023 12:25:21 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id 2GRsq4ImI4WeJ2GRtqoeWa; Thu, 25 May 2023 21:16:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1685042196;
        bh=cdwDlTSY5nLJWFnEJZ9cFeJSFlxNwy4TcFGd8KOVKQY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=HFT9MXOA+YJs9tcYjw3E2SCcaV6P49sY+lqyK/urEYTqhQPWDrLjUzSmLlciPDHkF
         SV/AfgVXxXZ2C00ETDTBu0scNPIGNAcxC50lok1FZOj/1xRkkdxAMCm15wrUY+TH6O
         3/S6wgweKUxHGIjEU3A3zAQIr5d4imxjqNwxpj3tng7XVUW0zcQ+Rma+rH/ZhSBc6u
         JqlnArApxBZM0Co6zKrIqArtUDTPzD9X971fKC0oVCtZDr/0k9L15NHq8rqyNgS0pW
         q7JpsV6SVYm3z2T7MGD/GaLwYSc1N6lDyBUPSI4TRlPPQ7JBrmO9dHlcFW37AvydOg
         ykXHiYNVR4w1g==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 25 May 2023 21:16:36 +0200
X-ME-IP: 86.243.2.178
Message-ID: <d63a3757-0f58-d125-b735-7fe86230bc9c@wanadoo.fr>
Date:   Thu, 25 May 2023 21:16:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] i2c: ocores: use devm_ managed clks
Content-Language: fr, en-US
To:     =?UTF-8?B?5byg572R?= <m202171703@hust.edu.cn>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        hust-os-kernel-patches@googlegroups.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <5572a733.abc0.18846f13b0b.Coremail.m202171703@hust.edu.cn>
 <20230524154318.2259-1-silver_code@hust.edu.cn>
 <68c4b991-6af9-36e8-354c-7c3b232ba4c2@wanadoo.fr>
 <5cceb5b5.c1fe.18850f830e0.Coremail.m202171703@hust.edu.cn>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <5cceb5b5.c1fe.18850f830e0.Coremail.m202171703@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le 25/05/2023 à 05:33, 张网 a écrit :
> Hi  Christophe,
> 
> Thanks for your suggestions. However, both clk_get_rate and clk_prepare_enable
> will return 0 if i2c->clk is NULL, so I think we may not need to take this issue
> into account.
> 
> Regards,
> Wang Zhang
> 

Ouch!

For some reaon, when I read:
 > +	rate = clk_get_rate(i2c->clk) / 1000;

I read "if i2c->clk is NULL, then the i2c pointer is NULL as well and is 
dereferenced".

:/

sorry for the noise.

CJ (slightly ashamed)

