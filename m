Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A40005B2451
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Sep 2022 19:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiIHRXC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Sep 2022 13:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiIHRXC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Sep 2022 13:23:02 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910E2EA63D;
        Thu,  8 Sep 2022 10:22:57 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id 9so15351069plj.11;
        Thu, 08 Sep 2022 10:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=7Oz2UofAHKorC9j0RD6IelT8WYHTb9Gu37CwZ57THiM=;
        b=YbhZNQ06yiNsUetMQwsrxi0wsXY69m5PNuTL2BlSzw9bC2R2cGrpbOp1c51BI1TMSB
         1vN87SWUS8zxt19fXBH4Rlqtu1Ip4CstlXjotXkvM/rWWxjQGxjAJiZ6bTC4Q4juZPka
         3KWGx9QHe49PE7EE91+iDiHqtvf+KA29ycU1bphNJG13Yf0BSVr/OPT0qpz2qV21lmY0
         DFdDdtRbPmfeV60H6ONe2hTlEpvqvUko27MngmOwMxYTG9L8ENDB5Ckp9RlweQN7rc4B
         QSg6UzyNqBqQArmtCtS5QhqmQ176ArsK+QsB3HDCLJH0fz+R3Nz/PZJqjWBzLTRFg7Qy
         3XjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7Oz2UofAHKorC9j0RD6IelT8WYHTb9Gu37CwZ57THiM=;
        b=8GheJa050pXMzgOh4Lvz42zFXbp0nkrURC3XWYn06FMkicZ3OIBLo7ZPZYHAHhRY3X
         v/JkLaDEapOOfmNQWiSkB5YW3YBDbq0ctg9kuRnTWtJBlq0aUiL8RmQjchYanvMum2m3
         miaFOZUUfTVKLpz16osbnwX4thJelBZKjoSUcnUmIbjbAqMaEiYpDmd/3Z0dPEpgSDW4
         EEY+BQ1v5QdJCqTHj7foB60IoMQS2kkos79BawAT38L/FXBSSO6rc4uIHi6MhSbGArpN
         QUzXJ8a/jtc6cTRGKqTOOaVFNNZGTZtFoa6y3TtgkUoETLGM2+pZdl6UEL8amRjAWD0Y
         pJsg==
X-Gm-Message-State: ACgBeo1Cmdpdv+R0cpiCr71odJwBCedmxHBI00ClXu0kW2ML2v9YOhge
        pzD/jgL9kQ62BK4i5TJbTr0=
X-Google-Smtp-Source: AA6agR5SO5PtbneJlrlAt8lOZCSenCixGrtMjoHKqZrDOYs9zeVCPYs+WcB9N0Kcb+f3cxeEDpF6/w==
X-Received: by 2002:a17:90a:d589:b0:200:4228:d6cb with SMTP id v9-20020a17090ad58900b002004228d6cbmr5283784pju.78.1662657777049;
        Thu, 08 Sep 2022 10:22:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z7-20020a17090a170700b0020087d7e778sm2030469pjd.37.2022.09.08.10.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 10:22:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 8 Sep 2022 10:22:54 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zheyu Ma <zheyuma97@gmail.com>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Jean Delvare <khali@linux-fr.org>,
        Bill Brown <bill.e.brown@intel.com>,
        Wolfram Sang <wolfram@the-dreams.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: ismt: Fix an out-of-bounds bug in ismt_access()
Message-ID: <20220908172254.GA2865640@roeck-us.net>
References: <20220729110216.557010-1-zheyuma97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729110216.557010-1-zheyuma97@gmail.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 29, 2022 at 07:02:16PM +0800, Zheyu Ma wrote:
> When the driver does not check the data from the user, the variable
> 'data->block[0]' may be very large to cause an out-of-bounds bug.
> 
> The following log can reveal it:
> 
> [   33.995542] i2c i2c-1: ioctl, cmd=0x720, arg=0x7ffcb3dc3a20
> [   33.995978] ismt_smbus 0000:00:05.0: I2C_SMBUS_BLOCK_DATA:  WRITE
> [   33.996475] ==================================================================
> [   33.996995] BUG: KASAN: out-of-bounds in ismt_access.cold+0x374/0x214b
> [   33.997473] Read of size 18446744073709551615 at addr ffff88810efcfdb1 by task ismt_poc/485
> [   33.999450] Call Trace:
> [   34.001849]  memcpy+0x20/0x60
> [   34.002077]  ismt_access.cold+0x374/0x214b
> [   34.003382]  __i2c_smbus_xfer+0x44f/0xfb0
> [   34.004007]  i2c_smbus_xfer+0x10a/0x390
> [   34.004291]  i2cdev_ioctl_smbus+0x2c8/0x710
> [   34.005196]  i2cdev_ioctl+0x5ec/0x74c
> 
> Fix this bug by checking the size of 'data->block[0]' first.
> 
> Fixes: 13f35ac14cd0 ("i2c: Adding support for Intel iSMT SMBus 2.0 host controller")
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>

This patch has not been applied, and I don't see a response to it either.
Is there a problem with it, or did it get lost ?

Thanks,
Guenter

> ---
>  drivers/i2c/busses/i2c-ismt.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
> index 6078fa0c0d48..63120c41354c 100644
> --- a/drivers/i2c/busses/i2c-ismt.c
> +++ b/drivers/i2c/busses/i2c-ismt.c
> @@ -509,6 +509,9 @@ static int ismt_access(struct i2c_adapter *adap, u16 addr,
>  		if (read_write == I2C_SMBUS_WRITE) {
>  			/* Block Write */
>  			dev_dbg(dev, "I2C_SMBUS_BLOCK_DATA:  WRITE\n");
> +			if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
> +				return -EINVAL;
> +
>  			dma_size = data->block[0] + 1;
>  			dma_direction = DMA_TO_DEVICE;
>  			desc->wr_len_cmd = dma_size;
> -- 
> 2.25.1
> 
