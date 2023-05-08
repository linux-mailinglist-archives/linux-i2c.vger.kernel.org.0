Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9406FB914
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232915AbjEHU7O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbjEHU7N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:59:13 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DFC4198D
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:59:12 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64115eef620so37516784b3a.1
        for <linux-i2c@vger.kernel.org>; Mon, 08 May 2023 13:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683579552; x=1686171552;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ynOyd6Hg89D78tR2kyoDL6UoW2jK18nV6B4gfEeggCk=;
        b=r2JRzi/DQmI1Nris20YjH/gGXy/2sAnal/ZZrKpcRo0lNjYRmG0cIqi3zX3m9b2Lsu
         wOtCUjVgbB6zRUm4FnJIqo1/EwHvfoLzW3A+yQgOcSaIdZjSII/tvBR8gvtzbpRSjfTg
         9Y/L+mWh5ezgjzlGKKUpvjbEi6zmnt14WXBk8TiGkBCGHo/tHPXdyLy4fTFCHiVdiovE
         OozDXaEpcfKIO8VZ+6V2MqcsKQIiCzRGNnzhDVw73SorWZ6rbF5HywkrwWdOmbPLg7oW
         RXXTlsqM6kGKlG6ob3Ki8Llx+B71Hg7xWNzOMAAy7gTe+9fgMClfMZ13vzLsTY7yFykV
         t5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683579552; x=1686171552;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynOyd6Hg89D78tR2kyoDL6UoW2jK18nV6B4gfEeggCk=;
        b=WC2//uJ5DKnasdmBnZE99FCrRkLtHc/cbgQPYZ7xdzH3rOmsY5JiGXIbllRks8125o
         LDwGao7VsQdZWlMtE9dBRZcyadxczl+XAXELGciE47cm+NU3R1xvBE5/3rN/Ls5x6Fgt
         2iFUAfBpZSXUWpaakQMjAM009xdgBCiih95n5sFf9v/HZ4/btE1jovzOyuRi739hDOiM
         yk0rzcYH7BLu3G/26vHGWQgJrJefXG5HZ7dB81ro372I9chLWNUDyiRBjFsFPcCWGx/J
         G+3CCKOzvs1tUH0bWvpfA3XG/ymVeeeuKSW14GtrDXv3m6nG/pwre8hRS8N5ATqCxC4T
         vM/A==
X-Gm-Message-State: AC+VfDzGt81Jf1PH+0K4KfN8YrC5qxf/vMY0E6/xM+P6vaF2LWJyx3CF
        GYAJQiQvaw6/RmvpT9Hpdkk=
X-Google-Smtp-Source: ACHHUZ5HTjIU9N5y8Xasql4zgHziqZ8Hx/QTqkHFvE577s7gZ82k6OUgd9L4+uKHV6HFU2tbrIEoLg==
X-Received: by 2002:a17:90b:246:b0:24e:243b:8735 with SMTP id fz6-20020a17090b024600b0024e243b8735mr18295233pjb.13.1683579551822;
        Mon, 08 May 2023 13:59:11 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id j3-20020a654d43000000b0051afa49e07asm6429801pgt.50.2023.05.08.13.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 13:59:10 -0700 (PDT)
Message-ID: <c964919a-3d00-95f2-236b-34965bd6e003@gmail.com>
Date:   Mon, 8 May 2023 13:59:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 07/89] i2c: bcm-iproc: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-8-u.kleine-koenig@pengutronix.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230508205306.1474415-8-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/8/23 13:51, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

