Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC93577A79
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jul 2022 07:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbiGRFgQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jul 2022 01:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiGRFgP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jul 2022 01:36:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF3A811C2B;
        Sun, 17 Jul 2022 22:36:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A6F02B80F4B;
        Mon, 18 Jul 2022 05:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D078C341C0;
        Mon, 18 Jul 2022 05:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658122572;
        bh=oXQ0REC+Jxcalror2bfMG5JlruGcUiiYvci9f0C3/0g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EUukFc5ZUZPngypYNnL+l04SX3vGUWzi2DeYHLiY2vgtP5L44Jv22+CFi+ZvCht16
         tX5jzYAotIZDVePzaH8V/F3eqU44Bg3uZCsKmtg5KBsYeUtUx8e7wQ8HL1mR3hXIqS
         atmOsxr3PhmN7PyIFTakYSM950V0nrPJo9fsOa/Cv422lzKOqq3HYr0eTBz6NeDEL5
         YBXSq7DoTMehjB4bT+G3nFIgc2VQAHHhKK+XHD1iP1wjsB+KUR0ztt/EmhqZRN3eYU
         IUm6Q0K8uU6PpwWTb6w9NtE8LjqAZF31VJa80BCBtRPCQCc2Q7CiduP96NRWqc4Etn
         HiMuq9p+eyG2A==
Date:   Mon, 18 Jul 2022 11:06:07 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: qcom-geni: Use the correct return value
Message-ID: <YtTxR/X5+UZW9pZZ@matsya>
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
 <20220717035027.2135106-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220717035027.2135106-2-bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16-07-22, 20:50, Bjorn Andersson wrote:
> The introduction of GPI support moved things around and instead of
> returning the result from geni_i2c_xfer() the number of messages in the
> request was returned, ignoring the actual result. Fix this.

Thanks for the fix, looking at master_xfer() it does expect error
return, so look good with one nit:

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

Unrelated, should gi2c->err be set to ret here..?

> -	return num;
> +	return ret;
>  }
>  
>  static u32 geni_i2c_func(struct i2c_adapter *adap)
> -- 
> 2.35.1

-- 
~Vinod
