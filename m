Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB0F76555B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 15:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjG0Nys (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 09:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjG0Nyr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 09:54:47 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E765E30C0
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jul 2023 06:54:45 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742bso10989995e9.2
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jul 2023 06:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=devtank-co-uk.20221208.gappssmtp.com; s=20221208; t=1690466084; x=1691070884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OfdsUyWNnEJciwAi9tkOFXhMC6Z3uDKYKT9or1dyiEU=;
        b=OuM5n6Ew/Y1WgNMgLXSnnlLvHCsvyT4cEzhnsmXewPt3bH7lxaQCqkj0/Obi8/9kD8
         Y3hbPNJ8p4MmErC2nqCOIo3qcciGgR74UTIVFxopqH/6ykzSNP2xDP1zXUmVVMxuRC5f
         JujQXxJRSd5757ZwTC2PqGCMSPy9BtvJGxJ3p3tPVsOgy2ve9trVP5dLPEaVCb/Sflsj
         Cjl3Cq+vUXH1nCDiW/mV7wPf5N9Mq8lWX13NYOVbTRyJQFhkfNT2fmQyTe1qYaH/PAfP
         5I7CxwwBKd/lkAzxW5xXVqFdY71ag1Czam70MkdnhjDYzUv2AmrS+AXuPeGk4o/bfrO+
         qlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690466084; x=1691070884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OfdsUyWNnEJciwAi9tkOFXhMC6Z3uDKYKT9or1dyiEU=;
        b=ku+gSiNpYLCS6BZvFnO/AuuKmMI9ZpHGLRucSy0R4Ow9bkskSkXzjfE5oA56rhh+1/
         UX2CFGfA678Txgjk/8JUdICqJAxOpCBYd4KN99/VVMffA31jFmOpuhguOaI3pcY36I45
         FDoG1SfNi0u81GHSq2oz/uP8WEX2hdM2KgkMnNqZDjdG9DwojE+pCKfB+Cn/pOyfZUB2
         uLF0epaM6km5d8b6XiNRZoXVSdgB27uGUf5tv0h1cv6eMscn1BnPwSeM7iICyk8sNIa2
         xmFyg7mJAUHpVhgjNmxig3KxLcrNkEF+qF3+byskJy51CpvopIpkonI5qYU7SvaaGf9A
         sLYA==
X-Gm-Message-State: ABy/qLbXttP+Ux765jdtxs//KvNAYg1+tD6HAOEC3H3R6n3vgkdk6Yi8
        Sxwd4ESdB8T/h6hnU39JSrI8DxClLuABHNzSduCABw==
X-Google-Smtp-Source: APBJJlHsPa+5NTBWeG27KIUK8LBS8NPDuPMqjoMkw//yrbpdgT3Jq8NFl/VO6oFLwbEgpbGAi+A4+Q==
X-Received: by 2002:a05:600c:ada:b0:3fb:d1db:545b with SMTP id c26-20020a05600c0ada00b003fbd1db545bmr1676687wmr.20.1690466084299;
        Thu, 27 Jul 2023 06:54:44 -0700 (PDT)
Received: from [192.168.200.236] ([212.82.82.3])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c248100b003fbb5142c4bsm4813129wms.18.2023.07.27.06.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 06:54:43 -0700 (PDT)
Message-ID: <ac708760-ed6a-a36b-ac8f-25654276a57c@devtank.co.uk>
Date:   Thu, 27 Jul 2023 14:54:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] i2c: tiny-usb: check usb base class before assuming the
 interface on device is for this driver
Content-Language: en-GB
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Till Harbaum <till@harbaum.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230727083354.4903-1-harry.geyer@devtank.co.uk>
 <20230727113029.ckrxe4qmy2nznh4e@intel.intel>
From:   Harry Geyer <harry.geyer@devtank.co.uk>
In-Reply-To: <20230727113029.ckrxe4qmy2nznh4e@intel.intel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andi,

On 27/07/2023 12:30, Andi Shyti wrote:
> On the other hand, checkpatch is OK with lines up to 100
> characters and this one looks like it's withing that length. So,
> up to your personal preference.
I am happy to resend the patch.
> If you resend it, you can add my r-b.
Not sure what you mean, I am sorry. Please, can you explain what you 
want me to do.

Thank you,

Harry.

