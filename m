Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85F4557B000
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Jul 2022 06:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbiGTEbU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Jul 2022 00:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiGTEbT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Jul 2022 00:31:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F943AB37;
        Tue, 19 Jul 2022 21:31:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DCCACB81E1C;
        Wed, 20 Jul 2022 04:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5BAC3411E;
        Wed, 20 Jul 2022 04:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658291475;
        bh=9vk4xKxP8lVL1s/pMXIOKRaVSSg6mFT6qNL6NWQDIDM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XwiGIanvhB4+BTxWrDUaK98VKqNtXceIRW9WoazUaS//iCjWLk1yzcyFRk9M3Arx7
         m7e1P/ITincK/UEAI4dthPMspTB8vrdZTN6/QfrVtzPVhzZ8XCjn6xuvBdI8UeyNv7
         l+6EqE2VbPsYhXTOZALFYF6xqs05P0bIhkjtmgPy2oiVUccxB3PQM6Ml5EoKd8vP+r
         Jj4PPrb6d9W3u0tfH1PkVfFYBtbNVFqXV/MhQrMrFPje7QBlG1SgdA5cCeKGwsTGSN
         eSeUE8Uz5uIsMP6bOc7ocQrQwgwUe0Jo/jBCZHI5yb5G2p+sz0ac6DIYTYHF4xI5Z/
         8+lQMHJ/qydMg==
Date:   Wed, 20 Jul 2022 10:01:10 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: qcom-geni: Use the correct return value
Message-ID: <YteFDuAIgbMjH83u@matsya>
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
 <20220717035027.2135106-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220717035027.2135106-2-bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Reviewed-by: Vinod Koul <vkoul@kernel.org>

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

-- 
~Vinod
