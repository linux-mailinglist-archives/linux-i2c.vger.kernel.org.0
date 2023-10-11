Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63C9F7C5001
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 12:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbjJKKXj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 06:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231628AbjJKKXh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 06:23:37 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A4AFB0;
        Wed, 11 Oct 2023 03:23:35 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-405497850dbso61556505e9.0;
        Wed, 11 Oct 2023 03:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697019814; x=1697624614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bX+yrAuVDTEDKkc7P0hOKfzpwI5t1BU6OZLf3VDs9ao=;
        b=FS2cGOrKfi8VkcP2/nRVGaQ18DieQWSXkyQ2aZ/47vav+7df78GY53/I+3f8dqhG8Y
         3AgTHHSGC1S45LrtXgl7yskO9OaL8er8vmbZ9llGCnlsjSWILQxHZ4T7NTMNwzMMmsV3
         Du60voNV5eFQljR4+aNzLfLcWjx4/b30m0Yr4uwN2OSreRsdaNl0jnfns4VTEd4pvEDx
         9D9HJSrRs52fM8XQU2bCgpWdOLGXxY4HJqJow4GOtREGKSBON/44M9ASH3qL2Kn/oGrU
         N3+QZJYwmzoMhnToTOVYDYpFKYmix9mu3ZJs1SNKLA/Ib3n20IZ0V9Ou4HYr2/CwJ6sK
         RW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697019814; x=1697624614;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bX+yrAuVDTEDKkc7P0hOKfzpwI5t1BU6OZLf3VDs9ao=;
        b=U3WkmYw8Mog7/FpXYu6c/L0BsFg2D04NBM+E+k6K/TO7Z1ssyfQsNQJxmXcyZME/67
         mmeSkN8ecNwxxmye/t/J6uYgftEssyGHdDOTtCr7XO13VZOx55A3SA2+2F77rdoY6vOA
         ZGLVO0QEB3cwcPscUS2id04wdISBatpcrSLiZrVVJYbu3PBPwfeMqi7SUoGPuhgnXlNc
         c2Voc/Ny398VUUDB1trVMJk7uwfktJDRfXko2jXkfnrPDdS/aKgXFZastKXSS/xGi8eL
         C42Dho7BJiMxATT8qKl/2HTz2XxxHpLYEDGJnXIrJy3/zhftto5DzFt33VHnX4LeNem5
         +RiA==
X-Gm-Message-State: AOJu0YxPsI3+eJsbugwuv4uAQD9kO7X804JeIXm1AmBVDxzlwZ8edhdS
        VIGR+PaGf0WrtoxaKgzlSv7w1TQkiScZR3jr
X-Google-Smtp-Source: AGHT+IEW1PktiicAatOHgxHgnvHkX2qPEEz4bBWzDDSvTEiBL2y6OpAV7YLva3DDVFDRP/UXlFVX3w==
X-Received: by 2002:a05:600c:1e28:b0:407:5b7c:2f6a with SMTP id ay40-20020a05600c1e2800b004075b7c2f6amr2510587wmb.0.1697019813855;
        Wed, 11 Oct 2023 03:23:33 -0700 (PDT)
Received: from ?IPV6:2a02:168:575a:b00b:10e9:ac6e:518d:a489? ([2a02:168:575a:b00b:10e9:ac6e:518d:a489])
        by smtp.googlemail.com with ESMTPSA id v10-20020a05600c470a00b00407460234f9sm11116659wmo.21.2023.10.11.03.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 03:23:33 -0700 (PDT)
Message-ID: <ba3c0972-2ba2-4df7-826e-a7634027b967@gmail.com>
Date:   Wed, 11 Oct 2023 12:23:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: brcmstb: Add support for atomic transfers
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa@kernel.org>
References: <CGME20231006144123eucas1p111cbbdbd70927ffbd697f7edf6b7ae1c@eucas1p1.samsung.com>
 <20231006144117.4079796-1-m.szyprowski@samsung.com>
Content-Language: en-US, de-CH, fr-CH
From:   Gregor Riepl <onitake@gmail.com>
Autocrypt: addr=onitake@gmail.com; keydata=
 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
 DMcsQA==
In-Reply-To: <20231006144117.4079796-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

I admit that I don't understand the I²C subsystem very well, but doesn't 
this introduce a potential race condition?

 > ...
 > @@ -240,7 +241,7 @@ static int brcmstb_i2c_wait_for_completion(struct 
brcmstb_i2c_dev *dev)
 > ...
> -	if (dev->irq >= 0) {
> +	if (dev->irq >= 0 && !dev->atomic) {
 > ...
 > @@ -287,7 +288,7 @@ static int brcmstb_send_i2c_cmd(struct 
brcmstb_i2c_dev *dev,
 > ...
> -	if (dev->irq >= 0)
> +	if (dev->irq >= 0 && !dev->atomic)
 > ...
 > +static int brcmstb_i2c_xfer_atomic(struct i2c_adapter *adapter,
 > +				   struct i2c_msg msgs[], int num)
 > ...
> +	dev->atomic = true;
> +	ret = brcmstb_i2c_xfer(adapter, msgs, num);
> +	dev->atomic = false;
> ...

What happens when one of the if() branches is taken in one thread while 
another thread is just executing the assignment of the atomic flag? My 
expectation would be that the first tread still sees the old flag value 
and happily executes the branch, while brcmstb_i2c_xfer_atomic() sets 
the flag just after and initiates a transfer.

I'd expect that access to the flag must be atomic as well, so maybe 
something like 
https://www.kernel.org/doc/html/latest/core-api/wrappers/atomic_t.html 
is needed, or some other synchronization mechanism.

Or is it guaranteed that brcmstb_i2c_wait_for_completion() and 
brcmstb_send_i2c_cmd() can only be called from the same thread as 
brcmstb_i2c_xfer_atomic() ?

Regards,
Gregor
