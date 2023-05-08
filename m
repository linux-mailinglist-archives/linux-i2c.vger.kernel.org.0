Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5526FB916
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233818AbjEHU7n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233773AbjEHU7c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:59:32 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5073A6E88
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:59:30 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-64115e652eeso37634874b3a.0
        for <linux-i2c@vger.kernel.org>; Mon, 08 May 2023 13:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683579570; x=1686171570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ynOyd6Hg89D78tR2kyoDL6UoW2jK18nV6B4gfEeggCk=;
        b=c3t/VBfbjVXjCIxNy8BiF9i+Ka1Cpk8zZTdIv1sXuNdD788s2OO6ln/HA1xUGL/Os9
         yoSTAp7Nd5UCHDfw2xFJ+EKECilri9QV+uoj9ZKM46DVlxF68G2O+1wF5q2cPtW2W4j7
         5LKLdWyStlQ6ifhvjUF2Z9i9DdbTULJc5qgXL8bwr6WAPhhfE/PBP0SfJllvE294VorX
         tpnvtkpozC0jBxQYgFmshILywkhLHxhLPf8rE16hOI3pLLOeU+9MRTb0Ts8w7CHe3d1G
         kE9IsDXAlzA1msJq5ET2JWrLrnpM3k69IhhCiEVXIpN4huwFWUDToCZJVQlAi3TFvB/b
         GTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683579570; x=1686171570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynOyd6Hg89D78tR2kyoDL6UoW2jK18nV6B4gfEeggCk=;
        b=bdQSX7R54pJSW10eKLVKlBhyClU97zvkCs03d18UDRIb0MV2WFUntQC7sUGb+ivTAB
         k9zJO5GBxQiqG+srTmHCIzor3ohMmp1kE/L7rJt8gwuZT3QhGBwp6itODWsOws6JHiAm
         /IyYyUnbgg1LvutNpBTMzN3hwlkEHzKf/uCbu2R+JDVv63UJvPDtVKSIN+8K2vsHJu8c
         f9ofGrxcFo8inrDgMY4oe2ezTyHFebUymxEEy7vZNHIPAfqIhy3/2TTbANrOYERcaYYv
         Nef01bsuNvcYJVY7uJA1jCTOCHIkbLf2+5jB/ppWVXtclTfdVWpFg10l486hukhjYRCV
         ajAQ==
X-Gm-Message-State: AC+VfDwUZBrvcbiNuFldFQzJJ5QeyWt5bDXrNd9WR/mRAiJymDzNFu9S
        AKkXOcMmu6/owEPOs18r4yM=
X-Google-Smtp-Source: ACHHUZ6ii9JXbJdIjokcJ2aNAkJNxuqYAoGyPOQihwp09M77HyvVygn2Qwnts+TYh59sGOLVsftZfg==
X-Received: by 2002:a05:6a00:14ca:b0:635:7fb2:2ab4 with SMTP id w10-20020a056a0014ca00b006357fb22ab4mr12534842pfu.6.1683579569809;
        Mon, 08 May 2023 13:59:29 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id v16-20020aa78510000000b00627e87f51a5sm354644pfn.161.2023.05.08.13.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 13:59:29 -0700 (PDT)
Message-ID: <2bffa8ec-abd9-1678-3a45-610775e49336@gmail.com>
Date:   Mon, 8 May 2023 13:59:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 10/89] i2c: brcmstb: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-11-u.kleine-koenig@pengutronix.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230508205306.1474415-11-u.kleine-koenig@pengutronix.de>
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

