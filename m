Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDF6B6FB915
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbjEHU7S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233293AbjEHU7R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:59:17 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87A51198D
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:59:16 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1aaec9ad820so47684905ad.0
        for <linux-i2c@vger.kernel.org>; Mon, 08 May 2023 13:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683579556; x=1686171556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ynOyd6Hg89D78tR2kyoDL6UoW2jK18nV6B4gfEeggCk=;
        b=jm0BGbGFQmS95GBrqJWpKx/CLvD6hRxcvNN8EX7ugKURnWK7ePrle5ky29zV42YktL
         Z98Rdjh9m0VALSx877RIJHWKtM6DF6k3U9wBMNCozJbD+Mzb3abG598D5BpYc3TvE4DL
         WeA1q0t2IVE7sYVGtb2vKYWzuqkOTshu4cLPJfY8Kgg360G2AIBJwWfDQK73ChWAiq2j
         VPm9O1eIgDlTZ8APVlnQdWOIOxDaZ9Pdu7D6dc0nXiMKP0+yGf3A+AeCjN9Vp+wmwJvI
         gkGGza+z+QDDM0pzglNQC2uvGeYgTg6s/JlcO3DQmBSMSP36K26n3n8jLXH0u7cFtRzi
         vl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683579556; x=1686171556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynOyd6Hg89D78tR2kyoDL6UoW2jK18nV6B4gfEeggCk=;
        b=UzA9/ERX1dRZct96fTnM96O/64ch0OYTIhRbv8XrCbozSaQ2NuRYTc3EC3idBe9xY7
         5GOBBC+IQDLB+ENEjXuyjgvbyMOOExXW1ClSWs++97GoerpSPzUwh1k0ITI9sdT/r7f0
         RJd0RNs6+27s3ShcUP6enXkLYLHBWFVQD+LavFdU/89a0/g0lW6WFxCvB0uGoHRRJPVS
         bGPvpTLbv93iRtyLT1mYnFcMbU+LhjYv9RRAd8fGZRiMjYRZRsxGUX4oPL8ljvfT+qQb
         /qEj712hoEE8iDxmo4l6Jx2ZYL4hMU523hRxDSLyo2RXwdG3e3Hft4khIZ6Zz2gDUdzg
         yKIw==
X-Gm-Message-State: AC+VfDzJKfhZe+dph8Nsa9Nmla/5KqESqt6dkZBa/mchGuzejp+QDZ+R
        LnmfkVXp3a9SXG9mfCqqBop4rS1C4Aw=
X-Google-Smtp-Source: ACHHUZ6hgUrcWykbOhALdpucOkcSP0Dxf23vlHyoG+3TeWbIwhsuJ5FK4Mv/SuszshBhBXBZ2aY5mw==
X-Received: by 2002:a17:903:244c:b0:1ab:19ff:3a20 with SMTP id l12-20020a170903244c00b001ab19ff3a20mr14049098pls.54.1683579556028;
        Mon, 08 May 2023 13:59:16 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id g24-20020a17090a579800b0024dee5cbe29sm14974034pji.27.2023.05.08.13.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 13:59:15 -0700 (PDT)
Message-ID: <669d1319-b4b7-a8fd-fda5-2b20a9e11891@gmail.com>
Date:   Mon, 8 May 2023 13:59:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 08/89] i2c: bcm-kona: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-9-u.kleine-koenig@pengutronix.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230508205306.1474415-9-u.kleine-koenig@pengutronix.de>
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

