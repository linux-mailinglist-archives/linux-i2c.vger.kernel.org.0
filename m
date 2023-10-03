Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCA67B701A
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Oct 2023 19:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbjJCRm4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Oct 2023 13:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbjJCRm4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Oct 2023 13:42:56 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962C6AB;
        Tue,  3 Oct 2023 10:42:52 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441DCC433C7;
        Tue,  3 Oct 2023 17:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696354972;
        bh=sr31N4h3bq02A/ddKJ/WDzDhSutvV5w7GfrIuqiakpI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M8z/PNZbksvHrABXDOZg64hkD56vVavPYEouOcdhLLy/telDwVu4pXPBuCth5vR+F
         WwJJJkSmXYXh+UwSjtSJPogexkZFSDOCWxjXOMHw8PieAakXbS94fDbBrc7wV8JzUA
         +MP/vxx8BlBf1jYeLKt0iUWP1PVKFdqhFbCJul1SzdESHga31kwDG5EY98VX2PHc4q
         2puaKf4eXJncUKYPej2a8jsBW9uQ0GLVkOSq21wHgXHnx7jYE9fpFHSDzIlAD0nYwu
         rd4B8WQcNOLdwnaY0VwHhU0X5xsuYm7BeJDBypARXd0u86W8GJEzPgofJAQ0ssHYru
         AIqaSck7LuQUQ==
Date:   Tue, 3 Oct 2023 19:42:46 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: stm32f7: Fix PEC handling in case of SMBUS transfers
Message-ID: <20231003174246.vdazyls3c7kykd63@zenone.zhora.eu>
References: <20231002084211.1108940-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002084211.1108940-1-alain.volmat@foss.st.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Alain,

On Mon, Oct 02, 2023 at 10:42:10AM +0200, Alain Volmat wrote:
> The PECBYTE bit allows to generate (in case of write) or
> compute/compare the PEC byte (in case of read).  In case
> of reading a value (performed by first sending a write
> command, then followed by a read command) the PECBYTE should
> only be set before starting the read command and not before
> the first write command.

What is this patch fixing?

Can you please point this detail in the documentation, I haven't
found it[*]

> Fixes: 9e48155f6bfe ("i2c: i2c-stm32f7: Add initial SMBus protocols support")
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

please, don't leave blank lines between tags.

Thanks,
Andi

[*] Hope this is the correct one:
https://www.st.com/resource/en/reference_manual/rm0385-stm32f75xxx-and-stm32f74xxx-advanced-armbased-32bit-mcus-stmicroelectronics.pdf

> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 579b30581725..0d3c9a041b56 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1059,9 +1059,10 @@ static int stm32f7_i2c_smbus_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
>  	/* Configure PEC */
>  	if ((flags & I2C_CLIENT_PEC) && f7_msg->size != I2C_SMBUS_QUICK) {
>  		cr1 |= STM32F7_I2C_CR1_PECEN;
> -		cr2 |= STM32F7_I2C_CR2_PECBYTE;
> -		if (!f7_msg->read_write)
> +		if (!f7_msg->read_write) {
> +			cr2 |= STM32F7_I2C_CR2_PECBYTE;
>  			f7_msg->count++;
> +		}
>  	} else {
>  		cr1 &= ~STM32F7_I2C_CR1_PECEN;
>  		cr2 &= ~STM32F7_I2C_CR2_PECBYTE;
> @@ -1149,8 +1150,10 @@ static void stm32f7_i2c_smbus_rep_start(struct stm32f7_i2c_dev *i2c_dev)
>  	f7_msg->stop = true;
>  
>  	/* Add one byte for PEC if needed */
> -	if (cr1 & STM32F7_I2C_CR1_PECEN)
> +	if (cr1 & STM32F7_I2C_CR1_PECEN) {
> +		cr2 |= STM32F7_I2C_CR2_PECBYTE;
>  		f7_msg->count++;
> +	}
>  
>  	/* Set number of bytes to be transferred */
>  	cr2 &= ~(STM32F7_I2C_CR2_NBYTES_MASK);
> -- 
> 2.25.1
> 
