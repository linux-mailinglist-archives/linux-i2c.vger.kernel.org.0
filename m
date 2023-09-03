Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 120D5790BE7
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Sep 2023 14:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237131AbjICMe6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Sep 2023 08:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjICMe5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Sep 2023 08:34:57 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88023126;
        Sun,  3 Sep 2023 05:34:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E13CACE0AAD;
        Sun,  3 Sep 2023 12:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0AFFC433C8;
        Sun,  3 Sep 2023 12:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693744491;
        bh=UMR3ZO3Oyzaw2vPMohgPUvv7KmBJIsfQZe44eRmjYiM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jkv+aUejPpshdhukh1Q8Ar4VxhgnCN6FlK6b+LPmI0dK34acRB9u/VNUIvFFKHNii
         hivdJtFJRW8mF3/pmy0MzyRZxOIf7nMX0DLEcfEZNHgwBKOE0MunBziXDWbZec0fVh
         j5KfsGlYJjP9SHQfLvRwxUxlpWZE5mw+XZv0e884vuR6sklMfe/Rg/0RL9j8zlPd0N
         Ym99VkR8g0QegVp1PjU8TjzUhw5bN/KRGNST3vcfZHKKwvFTALU1Agfd7WBdLI3pxC
         YnKZ4TIEj72DWyboE/7uEHFc6hpRDfHHHYqu+5HfCEnwUzwilYs2O6/nvmu0NCF8ea
         XV3ao+pp6H8Lg==
Date:   Sun, 3 Sep 2023 14:34:46 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c:octeon:Add block-mode r/w
Message-ID: <20230903123446.vjgpplnogejbzneb@zenone.zhora.eu>
References: <20230725223335.mzgdgr7qgeyc6hj7@intel.intel>
 <20230816230708.2724780-2-aryan.srivastava@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816230708.2724780-2-aryan.srivastava@alliedtelesis.co.nz>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Aryan,

[...]

> I have re-ran the patch through checkpatch --strict and changed the
> comments

Thanks!

[...]

> +static void octeon_i2c_block_disable(struct octeon_i2c *i2c)
> +{
> +	if (!i2c->block_enabled || !TWSI_BLOCK_CTL(i2c))
> +		return;
> +
> +	i2c->block_enabled = false;
> +	octeon_i2c_writeq_flush(TWSI_MODE_STRETCH, i2c->twsi_base + TWSI_MODE(i2c));
> +}

can you leave a blank line here?

>  /**
>   * octeon_i2c_hlc_wait - wait for an HLC operation to complete
>   * @i2c: The struct octeon_i2c
> @@ -268,6 +286,7 @@ static int octeon_i2c_start(struct octeon_i2c *i2c)
>  	u8 stat;
>  
>  	octeon_i2c_hlc_disable(i2c);
> +	octeon_i2c_block_disable(i2c);
>  
>  	octeon_i2c_ctl_write(i2c, TWSI_CTL_ENAB | TWSI_CTL_STA);
>  	ret = octeon_i2c_wait(i2c);
> @@ -594,6 +613,128 @@ static int octeon_i2c_hlc_comp_write(struct octeon_i2c *i2c, struct i2c_msg *msg
>  	return ret;
>  }
>  
> +/* high-level-controller composite block write+read, m[0]len<=2, m[1]len<=1024 */

can you please improve the comment?

> +static int octeon_i2c_hlc_block_comp_read(struct octeon_i2c *i2c, struct i2c_msg *msgs)
> +{
> +	int i, j, len, ret = 0;
> +	u64 cmd, rd;
> +
> +	octeon_i2c_hlc_enable(i2c);
> +	octeon_i2c_block_enable(i2c);
> +
> +	len = msgs[1].len - 1;

why -1?

> +	/* Prepare core command */
> +	cmd = SW_TWSI_V | SW_TWSI_R | SW_TWSI_SOVR;

cmd needs to be initialized to '0'.

> +	/* SIZE */
> +	octeon_i2c_writeq_flush((u64)(len), i2c->twsi_base + TWSI_BLOCK_CTL(i2c));
> +	/* ADDR */
> +	cmd |= (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;

can you please write some more meaningful comments?

[...]

> +	/* Wait for transaction to complete */
> +	ret = octeon_i2c_hlc_wait(i2c);
> +	if (ret)
> +		goto err;

just return err, no point having a goto label here.

[...]

> +err:
> +	return ret;
> +}
> +
> +/* high-level-controller composite block write+write, m[0]len<=2, m[1]len<=1024 */
> +static int octeon_i2c_hlc_block_comp_write(struct octeon_i2c *i2c, struct i2c_msg *msgs)

more or less same comments apply here as _comp_read()

[...]

> @@ -720,6 +869,7 @@ int octeon_i2c_init_lowlevel(struct octeon_i2c *i2c)
>  	/* toggle twice to force both teardowns */
>  	octeon_i2c_hlc_enable(i2c);
>  	octeon_i2c_hlc_disable(i2c);
> +

this change does not belong here

>  	return 0;
>  }
>  

[...]

>  #define TWSI_INT_SDA		BIT_ULL(10)
>  #define TWSI_INT_SCL		BIT_ULL(11)
>  
> +#define TWSI_MODE_STRETCH			BIT_ULL(1)
> +#define TWSI_MODE_BLOCK_MODE		BIT_ULL(2)
> +
> +#define TWSI_BLOCK_STS_RESET_PTR	BIT_ULL(0)
> +#define TWSI_BLOCK_STS_BUSY			BIT_ULL(1)

The alignment here is a bit off.

Andi

>  #define I2C_OCTEON_EVENT_WAIT 80 /* microseconds */
