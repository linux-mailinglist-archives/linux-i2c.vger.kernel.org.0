Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6ED657A853
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jul 2022 22:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239310AbiGSUgX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jul 2022 16:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239767AbiGSUgN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jul 2022 16:36:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 038AA45F6E
        for <linux-i2c@vger.kernel.org>; Tue, 19 Jul 2022 13:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658262968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=takPyX+c7DxSDI8v9MKZPYo25db1qJMbIDQOmjpNFXE=;
        b=QoRT9x+nfd9JbqwTqdK9evOLRCZeTp8uj95X5SN3/r46vnU2csL7I1XeIfVN/4Kp/C5Y4G
        wiDD7FDKY8S0uwkJWlPcdqWEamPIBDFfCscl3PYQSCikZvBaz5pEmiMG5CaEgABCaq42bN
        OAs3uhlaWRg9iVM/fYmpShpOx54LohQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-czvWj22SNPuASsNRs2e2ug-1; Tue, 19 Jul 2022 16:36:07 -0400
X-MC-Unique: czvWj22SNPuASsNRs2e2ug-1
Received: by mail-qt1-f198.google.com with SMTP id n14-20020ac8674e000000b0031ede6b9526so8020917qtp.3
        for <linux-i2c@vger.kernel.org>; Tue, 19 Jul 2022 13:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=takPyX+c7DxSDI8v9MKZPYo25db1qJMbIDQOmjpNFXE=;
        b=tg7YCP1TJnbwnXoylXSHCeWYsjQFHb6Sev3PjoIBFJHtcBnRdDhbxZWOnzA8fR8xTx
         X2zm/tb+5FpABjVnqPoO0RH5dB9HtzolTV3DjPeoAt5jAdwk+Hj7LI5hLIbk8JRAxuwT
         23ZNekCg7soRZ8lUrrOCv1RCOBLfwRBVfJZJXPY/qyAj9aI3Ne/jegWkpmSO7QClOcmd
         VJhviyixPtfhUOXqE7alYkfZy4twHKasPz3s78IZnQh95FDgaotGEIfpC0IdtnuJ8Ywm
         2aqyjXbcDySQOZZNSRhAnsINFWtMuQz7VOnHWlQnwspm6i8SrfDF/Q4DXzGbhYnZCLLA
         NexQ==
X-Gm-Message-State: AJIora9zA/lsenRxI3xOhZ3wR5g36chV/GFWJ5skZj3lj9ZCj56e56y8
        31pEX6MsKfaA1/1nT9Y5ZVpoQc/EzSp+O3gG1FnOyLnC0EY6mywglDPG8/Odyy/BxwcoJiXjfpp
        JkLJo4R5NRU5XwVV6N/Xg
X-Received: by 2002:a37:ccb:0:b0:6b5:e1ad:75b9 with SMTP id 194-20020a370ccb000000b006b5e1ad75b9mr9931094qkm.601.1658262967068;
        Tue, 19 Jul 2022 13:36:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tAzt2tTk4tcnbDcqODkuX1qe3mjaBF2On6EHRapv2Dkf+sudVlRQyXpLaaNySdqvHYRb1c+w==
X-Received: by 2002:a37:ccb:0:b0:6b5:e1ad:75b9 with SMTP id 194-20020a370ccb000000b006b5e1ad75b9mr9931079qkm.601.1658262966858;
        Tue, 19 Jul 2022 13:36:06 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id y13-20020a05620a25cd00b006af20edff0csm15339630qko.58.2022.07.19.13.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 13:36:06 -0700 (PDT)
Date:   Tue, 19 Jul 2022 15:36:03 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: qcom-geni: Use the correct return value
Message-ID: <20220719203603.o7bdp4vionxvcy2z@halaneylaptop>
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
 <20220717035027.2135106-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220717035027.2135106-2-bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jul 16, 2022 at 08:50:25PM -0700, Bjorn Andersson wrote:
> The introduction of GPI support moved things around and instead of
> returning the result from geni_i2c_xfer() the number of messages in the
> request was returned, ignoring the actual result. Fix this.
> 
> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 6ac402ea58fb..3bec7c782824 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -688,7 +688,7 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>  	pm_runtime_put_autosuspend(gi2c->se.dev);
>  	gi2c->cur = NULL;
>  	gi2c->err = 0;
> -	return num;
> +	return ret;
>  }
>  
>  static u32 geni_i2c_func(struct i2c_adapter *adap)
> -- 
> 2.35.1
> 

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

