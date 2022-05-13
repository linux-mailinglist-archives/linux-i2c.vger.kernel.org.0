Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC21526795
	for <lists+linux-i2c@lfdr.de>; Fri, 13 May 2022 18:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382129AbiEMQvM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 May 2022 12:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382689AbiEMQvA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 May 2022 12:51:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1895715E;
        Fri, 13 May 2022 09:50:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 43B8BB830F5;
        Fri, 13 May 2022 16:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E38C34100;
        Fri, 13 May 2022 16:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652460646;
        bh=/SJ3ynd9dz9LD1HOGD+pWoI3QNdCc8TOcMx8HqshsiA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FWx8hycsPbrgaLFKWt2JwzZY0bYAb1+FpugiFBuLm+BnsqE0Llq7YizVun+Rk8yE4
         1OOP+YSbHF7FgLKyFoqhPQhNFHGhE+j+2ODKShLe8eRUC90CEnsrP2R3mvusn93PGd
         SNR0LyUfowfqZXQbk6Sd126/qk+Qo0Lbf5VlDonh41sx4p1ryEFvEMTrbdIHyWf1C1
         v1BYUIgPpEbh9An+KR1i48Cb+RoGhBLDNljvSYefiH4kqRBjOjcNWSUuSsC24wSsM2
         X3E8IP8pq1idp/1xat/7JO5/hbpEbNw5Ma92fLnQw1sVfV31PC3anNgD+z0xek+f2C
         3yoBg9azSKDxw==
Date:   Fri, 13 May 2022 09:50:43 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Wolfram Sang <wsa@kernel.org>, Michael Walle <michael@walle.cc>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH] i2c: at91: Initialize dma_buf in at91_twi_xfer()
Message-ID: <Yn6MYxzY1zo8Ln0X@dev-arch.thelio-3990X>
References: <20220505152738.1440249-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505152738.1440249-1-nathan@kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Ping? This is a pretty obvious fix and this warning turns into an error
with CONFIG_WERROR so some of our -next builds have been broken for over
a week now.

On Thu, May 05, 2022 at 08:27:38AM -0700, Nathan Chancellor wrote:
> Clang warns:
> 
>   drivers/i2c/busses/i2c-at91-master.c:707:6: warning: variable 'dma_buf' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>           if (dev->use_dma) {
>               ^~~~~~~~~~~~
>   drivers/i2c/busses/i2c-at91-master.c:717:27: note: uninitialized use occurs here
>           i2c_put_dma_safe_msg_buf(dma_buf, m_start, !ret);
>                                    ^~~~~~~
> 
> Initialize dma_buf to NULL, as i2c_put_dma_safe_msg_buf() is a no-op
> when the first argument is NULL, which will work for the !dev->use_dma
> case.
> 
> Fixes: 03fbb903c8bf ("i2c: at91: use dma safe buffers")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1629
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/i2c/busses/i2c-at91-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
> index 5eca3b3bb609..c0c35785a0dc 100644
> --- a/drivers/i2c/busses/i2c-at91-master.c
> +++ b/drivers/i2c/busses/i2c-at91-master.c
> @@ -656,7 +656,7 @@ static int at91_twi_xfer(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
>  	unsigned int_addr_flag = 0;
>  	struct i2c_msg *m_start = msg;
>  	bool is_read;
> -	u8 *dma_buf;
> +	u8 *dma_buf = NULL;
>  
>  	dev_dbg(&adap->dev, "at91_xfer: processing %d messages:\n", num);
>  
> 
> base-commit: a181b8d187319bf265a2019ddde856a3d2f107a6
> -- 
> 2.36.0
> 
> 
