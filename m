Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7C8C6B9767
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 15:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232137AbjCNOLY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 10:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232596AbjCNOLH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 10:11:07 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E695DA101F;
        Tue, 14 Mar 2023 07:10:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 700A6CE1387;
        Tue, 14 Mar 2023 14:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB55C433EF;
        Tue, 14 Mar 2023 14:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678803049;
        bh=sEMn1V5G+koN0eW/Us3rxgycAcXGdhxPgCAOKL170UY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TmeKpdIpSsYdIbRYLzrYy3fHMpQAaSx/rq0QeYenQmYnSQpflnj1wnSDBudEaeeLe
         I69lnV75yXzLq8QFOKWnGIWMbyAl9as3PjafH1kj5+1ZCqCac9EUA3eDpqC1Y0QxKy
         WWT3sqAlvOGo0jvRsLfgSt1GEclBCyj7nxnbt1YQMsjEuM0vKbsuO73mnQxRLjJtqr
         6jUGZA53hUIeCENblI8OaDfM2kRQWcHaSKo0X5CfS9hFNTgxxDrn0uUaoj9tzkPdvo
         mNKu/cikzLo2VQEsNMNSJZU/oF8eum26yfJEalR9zN0aFyD/wHl9dru0ldJJwnKaRS
         sqB4v3Er+jQNg==
Date:   Tue, 14 Mar 2023 15:10:36 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wei Chen <harperchen1110@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: xgene-slimpro: Fix out-of-bounds bug in
 xgene_slimpro_i2c_xfer()
Message-ID: <20230314141036.lnwvpputzfcyeiyz@intel.intel>
References: <20230314135734.2792944-1-harperchen1110@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314135734.2792944-1-harperchen1110@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wei,

On Tue, Mar 14, 2023 at 01:57:34PM +0000, Wei Chen wrote:
> The data->block[0] variable comes from user and is a number between
> 0-255. Without proper check, the variable may be very large to cause
> an out-of-bounds when performing memcpy in slimpro_i2c_blkwr.
> 
> Fix this bug by checking the value of data->block[0].
> 
> Signed-off-by: Wei Chen <harperchen1110@gmail.com>
> ---
>  drivers/i2c/busses/i2c-xgene-slimpro.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-xgene-slimpro.c b/drivers/i2c/busses/i2c-xgene-slimpro.c
> index 63259b3ea5ab..bc9a3e7e0c96 100644
> --- a/drivers/i2c/busses/i2c-xgene-slimpro.c
> +++ b/drivers/i2c/busses/i2c-xgene-slimpro.c
> @@ -391,6 +391,10 @@ static int xgene_slimpro_i2c_xfer(struct i2c_adapter *adap, u16 addr,
>  						&data->block[0]);
>  
>  		} else {
> +
> +			if (data->block[0] + 1 > I2C_SMBUS_BLOCK_MAX)
> +				return -EINVAL;
> +
>  			ret = slimpro_i2c_blkwr(ctx, addr, command,
>  						SMBUS_CMD_LEN,
>  						SLIMPRO_IIC_SMB_PROTOCOL,
> @@ -408,6 +412,10 @@ static int xgene_slimpro_i2c_xfer(struct i2c_adapter *adap, u16 addr,
>  						IIC_SMB_WITHOUT_DATA_LEN,
>  						&data->block[1]);
>  		} else {
> +
> +			if (data->block[0] > I2C_SMBUS_BLOCK_MAX)
> +				return -EINVAL;
> +

you could eventually put this check inside slimpro_i2c_blkwr() so
that you have it once and for all, for everyone.

Andi

>  			ret = slimpro_i2c_blkwr(ctx, addr, command,
>  						SMBUS_CMD_LEN,
>  						SLIMPRO_IIC_I2C_PROTOCOL,
> -- 
> 2.25.1
> 
