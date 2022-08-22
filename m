Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0F059C0C1
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 15:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235285AbiHVNlI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 09:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235244AbiHVNlG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 09:41:06 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962B215FC9;
        Mon, 22 Aug 2022 06:41:05 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id r15-20020a17090a1bcf00b001fabf42a11cso11293969pjr.3;
        Mon, 22 Aug 2022 06:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=zPi97ExUikdEhfcrJGFr1ffQESaGom6KZJXieoIftH4=;
        b=mkTPMemOP4acTG60S3Hl5WBTG8ZAtPdovT7QZdsI5p5AxPKU2zKh0kgpRHUVVHQjbf
         +EAqonNoO2IGw0EiwZWbcefHkrNojqBQhOtnpYUFTXZtKew8nzi5oJkrtw4Uv/VGZOUm
         2cNNmcyTIrB507VqwtQubBMJj09+UzrKFy3eyL4gujU2jFdsFyshFzYuVP0XnPQXEJqm
         G5RKeiCBdz3PXv0yq/GLHFIvTx/E7oxplZq9FK1Gbec7t4rpwTtalp2SGgDFQuRnNm5R
         8Dc6IqiBC9YgLKOxPqr1FgoHa00G9NNwmMtzcqUxp+fwE5C6AIgnuoZf6p8KLzBkicZ7
         v9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=zPi97ExUikdEhfcrJGFr1ffQESaGom6KZJXieoIftH4=;
        b=ijG5GqEqgMrsepFkJlbxC30MirowFQ5eZGwnjxpKICuaVJ3uYqtyod2ICc/smUY+V7
         ku20Gbaw3FwbqeqWGJ+aKWP5f3SCqZg0RSr+2MbcoiApbi7HKjsyH4/HWsV7GVYMeUCi
         9Jk5hXX3Tj8/3IGB8Idb4nMjqV+S9O7QHFiNCjPuvPw0hpleIybrSl0xkaazYmmvWAcA
         allRVeZhgadpm8i3+x6lxpPr/kPPX/mugjoj+WBg4t/FRxp00Vi5WaBX/qzdVO9pIdt4
         L4/DVYD7di+vKvY57gGO36T9lZsu4XG9yDLX7S0ICIy7LEp3qzjJoJ6NVhwF9b5bIoUR
         falg==
X-Gm-Message-State: ACgBeo1SYwHyAR1YIZSmyBD9zSgQx0B7GGlZ+2yfgzNmXHiJhN6LP8Oy
        /kPV/tB7yE4U2pIdl8hEES8=
X-Google-Smtp-Source: AA6agR6BmLWM4+c7BACerNedLr15QWhRQiBzPH6XlAV+yW1IbPumDgepk2/BpzLbsUqKkTcRv71xVw==
X-Received: by 2002:a17:902:7247:b0:16f:8361:ba26 with SMTP id c7-20020a170902724700b0016f8361ba26mr20294979pll.83.1661175665106;
        Mon, 22 Aug 2022 06:41:05 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-77.three.co.id. [180.214.232.77])
        by smtp.gmail.com with ESMTPSA id q28-20020a63f95c000000b00428c216467csm7404876pgk.32.2022.08.22.06.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 06:41:04 -0700 (PDT)
Message-ID: <78a90d0a-e0ba-0189-aa84-4ce2952e33f3@gmail.com>
Date:   Mon, 22 Aug 2022 20:40:56 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/3] docs: i2c: i2c-topology: fix typo
Content-Language: en-US
To:     luca.ceresoli@bootlin.com, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
References: <20220822091050.47099-1-luca.ceresoli@bootlin.com>
 <20220822091050.47099-4-luca.ceresoli@bootlin.com>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20220822091050.47099-4-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/22/22 16:10, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> "intension" should have probably been "intention", however "intent" seems
> even better.
> 
> Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 

The typo error is introduced in [2/3], so it makes sense to squash this
to the errored patch.

-- 
An old man doll... just what I always wanted! - Clara
