Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36491632172
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 12:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbiKUL6J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 06:58:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbiKUL6H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 06:58:07 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EA4E03D
        for <linux-i2c@vger.kernel.org>; Mon, 21 Nov 2022 03:57:58 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id vv4so18664328ejc.2
        for <linux-i2c@vger.kernel.org>; Mon, 21 Nov 2022 03:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MBbsIuonafwREhzlZL+FNmZyLBn3gGtNW8dW5Tq4ubo=;
        b=rMXy/vvwEhXKozlAX1RwrPPT42CNokrusCoQoaRmpnG1Qk15lltVbnd3j2iAUlPdCs
         ti02LF5TBqoq6YtuHwOVTeMM8V3j9A/NyTYlxdqupHWMVJXHr1OdUGXBc1PgZ4MAwDHo
         jBrJsSHfGHJvwDXnWS7nntzTuJE+2sCrNmMBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBbsIuonafwREhzlZL+FNmZyLBn3gGtNW8dW5Tq4ubo=;
        b=hPr64NXsMP5Rw/5OrviHfD6ZGN30OgPgwTSvZlNn6n1NEWcNtrWXWaYS4slSsjb6iF
         TeUZp7Dklk6ldhAaPl91GmkGkYspIrdW/cPqXlVqoONcpiAHzIVUgZfmn1KcUBe0lOMY
         C/1/q2cB47xMW9341/tq9wA7N4mADxCtPhJeQBOaCaC/xvAwdNwRZAzWAgVHMnS4d78d
         tK0L0gn9wvzykPobZX/EFaFltW/wL/WPCGRd6fkb3RyZo7qOkUckRTqnf3rCzNhjGgEA
         uqhJGZYsP7ZyQ3grDXPkRV9QAsoysLhgZUPw1rb3QsQAQHVODo12zAYsEaonxC7I5JDM
         6e1w==
X-Gm-Message-State: ANoB5pmHFx2qu9E2Zyskaf7uqMawGCg0RK2Y5H6nPX1c5c9t4WT5tD4T
        do+NMqaGbpAUw1akDvOCMsATgQ==
X-Google-Smtp-Source: AA0mqf4GqPNprIWVxYHjPd6mEdI7a0BfxK3crJG0H7ykmiHCidUbmzKoQBMNZ5VBRsnmPvjpZMda8Q==
X-Received: by 2002:a17:906:2342:b0:78d:9e77:1f8c with SMTP id m2-20020a170906234200b0078d9e771f8cmr6710101eja.236.1669031876837;
        Mon, 21 Nov 2022 03:57:56 -0800 (PST)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-55-94.cust.vodafonedsl.it. [188.217.55.94])
        by smtp.gmail.com with ESMTPSA id k19-20020aa7c053000000b00456c6b4b777sm5037181edo.69.2022.11.21.03.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 03:57:56 -0800 (PST)
Date:   Mon, 21 Nov 2022 12:57:54 +0100
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     Wang Yufen <wangyufen@huawei.com>
Cc:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] i2c: qcom-geni: fix error return code in
 geni_i2c_gpi_xfer
Message-ID: <20221121115754.GA39395@tom-ThinkPad-T14s-Gen-2i>
References: <1669025872-44226-1-git-send-email-wangyufen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1669025872-44226-1-git-send-email-wangyufen@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wang,

On Mon, Nov 21, 2022 at 06:17:52PM +0800, Wang Yufen wrote:
> Fix to return a negative error code from the gi2c->err instead of
> 0.
> 
> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 84a7751..8fce98b 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -626,7 +626,6 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>  			dev_err(gi2c->se.dev, "I2C timeout gpi flags:%d addr:0x%x\n",
>  				gi2c->cur->flags, gi2c->cur->addr);
>  			gi2c->err = -ETIMEDOUT;
> -			goto err;


Looks good to me.
Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasoluitons.com>

Regards,
Tommaso

>  		}
>  
>  		if (gi2c->err) {
> -- 
> 1.8.3.1
> 

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
