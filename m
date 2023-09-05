Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57EA47925BE
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244617AbjIEQUW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354254AbjIEKWq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 06:22:46 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 359EA199;
        Tue,  5 Sep 2023 03:22:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 8ECFDCE10BD;
        Tue,  5 Sep 2023 10:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E07CC433C8;
        Tue,  5 Sep 2023 10:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693909358;
        bh=d0WWaRDwoMZNo0weBWOUYSbs+np+nwdICmtyfDltmrY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XHFaFS7lrm51Y4lZmWc8wotwtZwwFaqSlPglbvV1Tmr3HVisKCEZ9TGiKhl4HSNC8
         MozOQ2C7M0fOECRfCwuiogBiKDjfXnnG0WFcTsXGLHyVXphtemu2xKZorP/LTayBIM
         da+psHNUc91ULQXG/UzcLEDmMBfo5uS7Daec1omTdf4brQKqRuxaRBUqdfL9A/FC4l
         9BhYtRhbyTYpMRdfIPuMXWpLnZEjuMUTy4V2zE33YLmAXbVyTb5rRtba7lxro6e+a0
         bxeph+LETCcCPm4DasybnHEYxTJ3fV0xBkf0MPzL8vIgMmZyPMadrKzp5RF7+Wpt+F
         18sLx14L3orTg==
Date:   Tue, 5 Sep 2023 12:22:34 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c:octeon:Add block-mode r/w
Message-ID: <20230905102234.nlaeskxbbvu74co2@zenone.zhora.eu>
References: <20230903123446.vjgpplnogejbzneb@zenone.zhora.eu>
 <20230904231439.485925-1-aryan.srivastava@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230904231439.485925-1-aryan.srivastava@alliedtelesis.co.nz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Aryan,

In the title, please leave a space after the ':'

   i2c: octeon: Add block-mode r/w

Please check with "git log drivers..." to see what's the rule in
a particular community.

I guess Wolfram can fix this, though, before pushing.

[...]

> +/* high-level-controller composite block write+read, msg0=addr, msg1=data */

I think this comment is fine and great to have it, but it's
missing a bit of clarity, can you please expand the concept?

> +static int octeon_i2c_hlc_block_comp_read(struct octeon_i2c *i2c, struct i2c_msg *msgs)
> +{
> +	int i, j, len, ret = 0;
> +	u64 cmd = 0, rd = 0;

can please you move rd, j inside the for loop? The basic common
sense is to have all variable declared in the innermost section
in order to avoid confusion.

It's a nitpick though, not a strong comment and, afaik, not a
real rule.

Same comment for the function below.

> +
> +	octeon_i2c_hlc_enable(i2c);
> +	octeon_i2c_block_enable(i2c);
> +
> +	/* Write (size - 1) into block control register */
> +	len = msgs[1].len - 1;
> +	octeon_i2c_writeq_flush((u64)(len), i2c->twsi_base + TWSI_BLOCK_CTL(i2c));
> +
> +	/* Prepare core command */
> +	cmd = SW_TWSI_V | SW_TWSI_R | SW_TWSI_SOVR;
> +	cmd |= (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
> +
> +	if (msgs[0].flags & I2C_M_TEN)
> +		cmd |= SW_TWSI_OP_10_IA;
> +	else
> +		cmd |= SW_TWSI_OP_7_IA;
> +
> +	if (msgs[0].len == 2) {
> +		u64 ext = 0;
> +
> +		cmd |= SW_TWSI_EIA;
> +		ext = (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
> +		cmd |= (u64)msgs[0].buf[1] << SW_TWSI_IA_SHIFT;
> +		octeon_i2c_writeq_flush(ext, i2c->twsi_base + SW_TWSI_EXT(i2c));
> +	} else {
> +		cmd |= (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
> +	}

This first part is basically a copy/paste with the write()
function... can we put them together in a common function?

Can we put as much as we can in a single function?

> +	/* Send command to core (send data to FIFO) */
> +	octeon_i2c_hlc_int_clear(i2c);
> +	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + SW_TWSI(i2c));
> +
> +	/* Wait for transaction to complete */
> +	ret = octeon_i2c_hlc_wait(i2c);
> +	if (ret)
> +		return ret;
> +
> +	cmd = __raw_readq(i2c->twsi_base + SW_TWSI(i2c));
> +	if ((cmd & SW_TWSI_R) == 0)
> +		return octeon_i2c_check_status(i2c, false);
> +
> +	/* read data in FIFO */
> +	octeon_i2c_writeq_flush(TWSI_BLOCK_STS_RESET_PTR, i2c->twsi_base + TWSI_BLOCK_STS(i2c));
> +	for (i = 0; i < len; i += 8) {
> +		rd = __raw_readq(i2c->twsi_base + TWSI_BLOCK_FIFO(i2c));
> +		for (j = 7; j >= 0; j--)

is len always a multiple of 8?

> +			msgs[1].buf[i + (7 - j)] = (rd >> (8 * j)) & 0xff;
> +	}
> +
> +	octeon_i2c_block_disable(i2c);
> +	return ret;
> +}

[...]

> -		    msgs[1].len > 0 && msgs[1].len <= 8 &&
> +		    msgs[1].len > 0 &&
>  		    msgs[0].addr == msgs[1].addr) {
> -			if (msgs[1].flags & I2C_M_RD)
> -				ret = octeon_i2c_hlc_comp_read(i2c, msgs);
> -			else
> -				ret = octeon_i2c_hlc_comp_write(i2c, msgs);
> -			goto out;
> +			if (msgs[1].len <= 8) {
> +				if (msgs[1].flags & I2C_M_RD)
> +					ret = octeon_i2c_hlc_comp_read(i2c, msgs);
> +				else
> +					ret = octeon_i2c_hlc_comp_write(i2c, msgs);
> +				goto out;
> +			} else if (msgs[1].len <= 1024 && TWSI_BLOCK_CTL(i2c)) {
> +				if (msgs[1].flags & I2C_M_RD)
> +					ret = octeon_i2c_hlc_block_comp_read(i2c, msgs);
> +				else
> +					ret = octeon_i2c_hlc_block_comp_write(i2c, msgs);
> +				goto out;
> +			}

the rest looks good...

Thanks,
Andi
