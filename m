Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 524276B9A77
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 16:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbjCNP6N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 11:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbjCNP6M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 11:58:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777D17FD47;
        Tue, 14 Mar 2023 08:58:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ED00F61812;
        Tue, 14 Mar 2023 15:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD7DC433D2;
        Tue, 14 Mar 2023 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678809488;
        bh=BgMk4i31f2UPRQv6nUIFJd7c91enlTxExm1X254lxPc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AKyt1qoJTB4gsbjLZHxEDHowQQtn436EZrP2hV50t/0NiSHeZUsNOHTtPT58FoLCg
         uYmZxD99oz2/I+Uu6Jveue1B+vDhrS89M+g73W6skf926NhAZGfMU/Uze6f6kH7JlU
         IEK7W2XKqiImCcJui4fw/phleUqYfxvMYqumhlx27uc1WkvY/xdV1ppTrCUT3T2Cft
         JJ4/I6FoFJBW4OwRzVFBjaWdgKFHLc5k1Y1SqpGPZNVEW3kR7UM89zYrXNYmvmKOAj
         i8EUsx7Ncvd+ChjA6L3xzRRoT0aqytkAZM0M7UIgzi8gGlrV1/jzXVV4gRNWew6PWL
         GqXuih9vP9rpA==
Date:   Tue, 14 Mar 2023 16:57:59 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wei Chen <harperchen1110@gmail.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: xgene-slimpro: Fix out-of-bounds bug in
 xgene_slimpro_i2c_xfer()
Message-ID: <20230314155759.ej2gax7r4ek7itmh@intel.intel>
References: <20230314135734.2792944-1-harperchen1110@gmail.com>
 <20230314141036.lnwvpputzfcyeiyz@intel.intel>
 <CAO4mrfefBKL2exRrCOzVXXzzNXFhJhHOfciJZpiAdyyC_0msxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO4mrfefBKL2exRrCOzVXXzzNXFhJhHOfciJZpiAdyyC_0msxQ@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wei,

On Tue, Mar 14, 2023 at 11:43:41PM +0800, Wei Chen wrote:
> The data->block[0] variable comes from user and is a number between
> 0-255. Without a proper check, the variable may be very large to cause
> an out-of-bounds when performing memcpy in slimpro_i2c_blkwr.
> 
> Fix this bug by checking the value of writelen.
> 
> Signed-off-by: Wei Chen <harperchen1110@gmail.com>

I forgot to check earlier, can you also add:

Fixes: f6505fbabc42 ("i2c: add SLIMpro I2C device driver on APM X-Gene platform")
Cc: stable@vger.kernel.org

> ---
> Changes in v2:
>  - Put length check inside slimpro_i2c_blkwr
> 
> drivers/i2c/busses/i2c-xgene-slimpro.c | 3 +++
> 1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-xgene-slimpro.c
> b/drivers/i2c/busses/i2c-xgene-slimpro.c
> index bc9a3e7e0c96..0f7263e2276a 100644
> --- a/drivers/i2c/busses/i2c-xgene-slimpro.c
> +++ b/drivers/i2c/busses/i2c-xgene-slimpro.c
> @@ -308,6 +308,9 @@ static int slimpro_i2c_blkwr(struct
> slimpro_i2c_dev *ctx, u32 chip,
> u32 msg[3];
> int rc;
> + if (writelen > I2C_SMBUS_BLOCK_MAX)
> + return -EINVAL;
> +

There is something odd looking here. Can you please fix the
formatting and leave one blank line from the variable declaration
and the 'if (...'.

Remember, please, to run checkpatch.pl before sending the patch.

Andi
