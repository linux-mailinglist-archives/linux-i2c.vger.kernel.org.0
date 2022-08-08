Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C005F58C996
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Aug 2022 15:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243186AbiHHNjR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Aug 2022 09:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233640AbiHHNjQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Aug 2022 09:39:16 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714A6BC36;
        Mon,  8 Aug 2022 06:39:15 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id p18so8576204plr.8;
        Mon, 08 Aug 2022 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :to:date:from:from:to:cc;
        bh=8iifaV+8MVmiI4Q6s1LNqii3vIk7Vj/dQwIhaILr6b0=;
        b=gMP0UYPcKlcW+vRAjudk92o2bp/xzK30lmKfhTNGH/UDjm34i1zJVUlqjsQSikvThh
         KulflxxlArGj/RFhTh7XjOfCFNUqPIQdTUnpJQl1HkfvpPTtMDFwXWrrIdaNPR6kaeWz
         x4v0bDeez2bUuHZX2Lm7fdrUlPfgmjgfTcezObB3R73crfoBezOzQe67CqozrkdcbuMi
         UBZtTJNsdsOwMkuEHTfIF7vUvzIq/n5roRAMGDG5weruLAwn/DXmSCrJ2oH39uOVHpMR
         82s0wgHF4b5ETveswqCX3j5Hutk9VL29eAuY6jnrUPii4x3rFM8FpPgbnTf1jpQ2rOXs
         zpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :to:date:from:x-gm-message-state:from:to:cc;
        bh=8iifaV+8MVmiI4Q6s1LNqii3vIk7Vj/dQwIhaILr6b0=;
        b=Y7wsLsB3LUX8SAwm+wwJTyqvQw4soVnLK7G/u5WDtJDmrmUHEUvt236JFbKih1XkfW
         Fj0FUlsVlt4/FJbqp56GTj9LugQtkbjVcY/ZVB3yARdiYnj155uqLLxPRToQAhVhA3Mg
         ZI6h0pe0+MfLMsw0NWeOzOe9YOFZlzgO5rQ6I+ri9SnwD4lmOzapZ39XI+4uN3rOWBbw
         4eomtYerXvh4qJVWaDikBSuIvLHYDZMjAeBjqo05zxqz6iJKxkk7/7z4c0/Y13uVdzCO
         c373+IgPkIavGmIYii4/5vBas2PqEQpT7vwowv1W/vxplRZuqyxsy9+5VH76ZQVFhNTa
         LqjA==
X-Gm-Message-State: ACgBeo22OfVkeU8kCWIABPPJA6CVGBmaE8EzEaQGmKKxF5RsSJ+0X/aQ
        6h2BkPoZ/E6ROhb7OMEoEtU=
X-Google-Smtp-Source: AA6agR4UYHF5ZSW7qtpsH4e40VJZ2WfJzBlvpQNNt/80FcG0PQZDzSvCKZNgnDC2zS11FvdNc/H6Dw==
X-Received: by 2002:a17:902:db08:b0:170:9ba1:92e9 with SMTP id m8-20020a170902db0800b001709ba192e9mr7447409plx.45.1659965954786;
        Mon, 08 Aug 2022 06:39:14 -0700 (PDT)
Received: from robin-HP-ZBook-15-G3 ([2409:11:2360:3e00:49bb:2134:3324:6c70])
        by smtp.gmail.com with ESMTPSA id b16-20020a170903229000b0016d3ee4533csm9045690plh.18.2022.08.08.06.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 06:39:14 -0700 (PDT)
From:   Robin Reckmann <robin.reckmann@googlemail.com>
X-Google-Original-From: Robin Reckmann <robin@robin-HP-ZBook-15-G3>
Date:   Mon, 8 Aug 2022 22:38:04 +0900 (JST)
To:     Wolfram Sang <wsa@kernel.org>,
        Robin Reckmann <robin.reckmann@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
        Robin Reckmann <robin.reckmann@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] i2c: qcom-geni: Fix GPI DMA buffer sync-back
In-Reply-To: <YvClCC4ArBEjQJl9@shikoro>
Message-ID: <alpine.DEB.2.22.394.2208082230340.8545@robin-HP-ZBook-15-G3>
References: <20220807140455.409417-1-robin.reckmann@gmail.com> <YvClCC4ArBEjQJl9@shikoro>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On Mon, 8 Aug 2022, Wolfram Sang wrote:

> On Sun, Aug 07, 2022 at 11:04:54PM +0900, Robin Reckmann wrote:
>> Fix i2c transfers using GPI DMA mode for all message types that do not set
>> the I2C_M_DMA_SAFE flag (e.g. SMBus "read byte").
>>
>> In this case a bounce buffer is returned by i2c_get_dma_safe_msg_buf(),
>> and it has to synced back to the message after the transfer is done.
>>
>> Add missing assignment of dma buffer in geni_i2c_gpi().
>>
>> Set xferred in i2c_put_dma_safe_msg_buf() to true in case of no error to
>> ensure the sync-back of this dma buffer to the message.
>>
>> Signed-off-by: Robin Reckmann <robin.reckmann@gmail.com>
>
> Thank you! What would be a Fixes tag for this?
>
>
Thanks for having a look!

Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
