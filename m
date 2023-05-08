Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91F1E6FB913
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbjEHU7L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbjEHU7I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:59:08 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9FC8171C
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:59:06 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1ab0c697c84so38037825ad.3
        for <linux-i2c@vger.kernel.org>; Mon, 08 May 2023 13:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683579546; x=1686171546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ynOyd6Hg89D78tR2kyoDL6UoW2jK18nV6B4gfEeggCk=;
        b=XOuCkhajBUA7uxMFgCyBS3dYWwk2BogYarz/LbqToOg/e+xRiDR2Mn/YvNIQRXJ82U
         D3JJDBHNu7h0tAwrugMTKdxswG0sL5tGB3rZGKc+qfPOZWUbNiOmlZSSpovkqVMrM46Z
         zlXygr/JspSO9jR9b9qRsSCIT2KCTRu0h1MRiiknNJRaTlm24OpyfQyin47Rq72M4A8X
         IoJkDIHCGL9bgNeLZEKKQqF2i0XyhRfpLhdodCA34by3MxGm1TofzPiRCfH8xPYKNkDT
         CgPgSbN0G34oWvzjJMdC5/jG01A3KKIvw4y7c8SYllJj29fYbSDuzUEDqb2sGFekKSuL
         RifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683579546; x=1686171546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynOyd6Hg89D78tR2kyoDL6UoW2jK18nV6B4gfEeggCk=;
        b=l6W8XgwmpVhy+/8MVdmjGHihUWTdhzXYLgcrAxS3cMct3Gq9g+OHQr0+sQ+72e4tFC
         YZvSvsHc4HLMuufazdibyJXTcAwsi1pyCiAfVv2so6a70MARDC4SxhzDQGn/9oj0Vm8O
         DvoIilCDx3jSWzZ6BAVHpKGVihrufWqdgZBwF4MBNjYS5mBAjlg5pZFPZg5LHuDs75wy
         Fx1oxJr0dhYZf56sdXc2ASrePFuSHkbKo4J3+995K1MVv6sVMdhPZqMn+YCxpXTS9Prs
         P4gqcRfvIEjJqOBW+IodFo8wUo1s1WkyG11Kh4ijl1NPDlG5o2/FArWclbGC3TG8i7YR
         LgPg==
X-Gm-Message-State: AC+VfDxZ5fIlBG1qVPAOGGHz7YQCokngRE36FrqRWq9YJ/2K39x9uLOy
        AJXIEvwwmRDZW5Hs4B0t1rCbwTa7yAU=
X-Google-Smtp-Source: ACHHUZ7AVBLABZLxt20WfKF7OOvp9GvI+duoMboMmEW4DdRIFiqG6vhtd7pv9a1lFmgFHqGQrN0j/g==
X-Received: by 2002:a17:902:f54f:b0:1ac:750e:33ef with SMTP id h15-20020a170902f54f00b001ac750e33efmr6724303plf.3.1683579546382;
        Mon, 08 May 2023 13:59:06 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id n17-20020a170902e55100b0019719f752c5sm7654190plf.59.2023.05.08.13.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 13:59:05 -0700 (PDT)
Message-ID: <70eb4357-a68e-24fd-5978-3e9e3a8fdb44@gmail.com>
Date:   Mon, 8 May 2023 13:59:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 09/89] i2c: bcm2835: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@kernel.org>,
        ye xingchen <ye.xingchen@zte.com.cn>
Cc:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-10-u.kleine-koenig@pengutronix.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230508205306.1474415-10-u.kleine-koenig@pengutronix.de>
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

