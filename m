Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3613D578D81
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jul 2022 00:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234908AbiGRW2r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jul 2022 18:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234877AbiGRW2q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jul 2022 18:28:46 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A321B286D7
        for <linux-i2c@vger.kernel.org>; Mon, 18 Jul 2022 15:28:41 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-10c0430e27dso27750188fac.4
        for <linux-i2c@vger.kernel.org>; Mon, 18 Jul 2022 15:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CM+L+F29IjkyytSgiUJ9L1anz4s5cjBnkaXschPxT+s=;
        b=Yq+Uz2UfmII9HsrH9h2DcdOQOcBpvQWk4eGZIG76Nm98EAHedcqcyuNAfAsNGU5wnS
         LBfYbf7o2RvpXaly6M22s2nyQ0ugJJqli+6xTfusfX5eDw/5Biz17R25ooPX8/RGqFe6
         OhV5B4sZZFKnCfWKZHTTvnAslOt4t+I6ricgU1JoXJwNm6omRCV9Fq2vQpnJRFf7cBUU
         5xgKP/GqmnHWela1juasxpglmhsEAHiS5Jzx4um2HEd+pUW9hAEK2VoeQEAz6GA9zF7c
         OA9Y0yqapLTCWBLRlmqrWwOGdnTrfeKDVBup2BqP9eIerIjg9AOe0PdhrQnZh498afur
         ps4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CM+L+F29IjkyytSgiUJ9L1anz4s5cjBnkaXschPxT+s=;
        b=REdHpgtKM3FJnngPXTgYh5bZZhTNtQb4rNIHHT9v6WKfdXqaiqAQTwAkVuOThT2S9G
         FRCreJDL/IB5/K/mUtu5Q5nhms0aEgtXiuWEgJHuznTzLdDTGs0w5FvOaMnUUzfrUgtk
         Vmfxdft2zu3p4sJ8NXwrOhx6LcrDsZH45mCm2v/2jgIRCxkUPKJ+y0LgcbXa/JA97oO4
         l8y464jTktt2C3qFb82sF/7O26KEm1OIRmcx9RZwgV6QH0bl26lSr3H3Tg0HPv2mHgNS
         cn4oCeQvgYt7C90hxCwzYUymVu02DyLd0OLIyM735g0MST08naaRPMuBBD7o2rLXTQtb
         3TwQ==
X-Gm-Message-State: AJIora8pkC6qzOj+BJrmczCyM+AZe5VRaBK7PNSzh8hKEw8wyXEikhfk
        AMrGmerOK5FILbSuYG248UbyBw==
X-Google-Smtp-Source: AGRyM1vPyGVktBCtcTaxH8G86pSgyCdxCEPnpid+y/LK/LtOaq0k5UVTTe7VlXBijDZQo/uwJ6aRSQ==
X-Received: by 2002:a05:6870:c5a0:b0:10c:5a7f:1e1c with SMTP id ba32-20020a056870c5a000b0010c5a7f1e1cmr16718133oab.250.1658183320998;
        Mon, 18 Jul 2022 15:28:40 -0700 (PDT)
Received: from baldur ([2600:380:7819:4216:5926:b852:ebc3:8111])
        by smtp.gmail.com with ESMTPSA id e11-20020a4ada0b000000b0042568efdaccsm5388483oou.15.2022.07.18.15.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:28:40 -0700 (PDT)
Date:   Mon, 18 Jul 2022 17:28:24 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: qcom-geni: Use the correct return value
Message-ID: <YtXeiKWhFtldI2eE@baldur>
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
 <20220717035027.2135106-2-bjorn.andersson@linaro.org>
 <YtTxR/X5+UZW9pZZ@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtTxR/X5+UZW9pZZ@matsya>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon 18 Jul 00:36 CDT 2022, Vinod Koul wrote:

> On 16-07-22, 20:50, Bjorn Andersson wrote:
> > The introduction of GPI support moved things around and instead of
> > returning the result from geni_i2c_xfer() the number of messages in the
> > request was returned, ignoring the actual result. Fix this.
> 
> Thanks for the fix, looking at master_xfer() it does expect error
> return, so look good with one nit:
> 
> > 
> > Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/i2c/busses/i2c-qcom-geni.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> > index 6ac402ea58fb..3bec7c782824 100644
> > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > @@ -688,7 +688,7 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
> >  	pm_runtime_put_autosuspend(gi2c->se.dev);
> >  	gi2c->cur = NULL;
> >  	gi2c->err = 0;
> 
> Unrelated, should gi2c->err be set to ret here..?
> 

When we reach this point we have concluded the current transfer
(successfully or not...), so I believe that the purpose of this line is
to clear the "error state" that might have occurred during that transfer.

I believe this line could be removed, as the first step in a transfer is
to clear the error state again. But as you suggest this is separate to
the proposed change.


May I have a R-b?

Regards,
Bjorn

> > -	return num;
> > +	return ret;
> >  }
> >  
> >  static u32 geni_i2c_func(struct i2c_adapter *adap)
> > -- 
> > 2.35.1
> 
> -- 
> ~Vinod
