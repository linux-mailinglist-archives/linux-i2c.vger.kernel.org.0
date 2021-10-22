Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7B9437233
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Oct 2021 08:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbhJVGwY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Oct 2021 02:52:24 -0400
Received: from mout-u-107.mailbox.org ([91.198.250.252]:45534 "EHLO
        mout-u-107.mailbox.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbhJVGwX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Oct 2021 02:52:23 -0400
X-Greylist: delayed 332 seconds by postgrey-1.27 at vger.kernel.org; Fri, 22 Oct 2021 02:52:23 EDT
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4HbFFS5mZjzQkB9;
        Fri, 22 Oct 2021 08:44:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Subject: Re: [PATCH] i2c: mt76xx: add I2C_FUNC_NOSTART and I2C_M_REV_DIR_ADDR
To:     "zhaojh329@gmail.com" <zhaojh329@gmail.com>
Cc:     "matthias.bgg" <matthias.bgg@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <202110200007146639874@gmail.com>
From:   Stefan Roese <sr@denx.de>
Message-ID: <12006f4c-137c-4d78-fbaa-40776c65f079@denx.de>
Date:   Fri, 22 Oct 2021 08:44:24 +0200
MIME-Version: 1.0
In-Reply-To: <202110200007146639874@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 688E1131C
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19.10.21 18:07, zhaojh329@gmail.com wrote:
>   This patch adds I2C_FUNC_NOSTART and I2C_M_REV_DIR_ADDR support for
> MediaTek MT7621/7628/7688. This is useful for some I2C slave chips,
> such as 'drivers/input/joystick/as5011.c'.
> 
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> ---
>   drivers/i2c/busses/i2c-mt7621.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index 45fe4a7fe0c0..3d2763d9c090 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -150,6 +150,9 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   	for (i = 0; i < num; i++) {
>   		pmsg = &msgs[i];
>   
> +		if (pmsg->flags & I2C_M_NOSTART)
> +			goto nostart;
> +
>   		/* wait hardware idle */
>   		ret = mtk_i2c_wait_idle(i2c);
>   		if (ret)
> @@ -174,6 +177,8 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   		} else {
>   			/* 7 bits address */
>   			addr = i2c_8bit_addr_from_msg(pmsg);
> +			if (pmsg->flags & I2C_M_REV_DIR_ADDR)
> +				addr ^= 1;
>   			iowrite32(addr, i2c->base + REG_SM0D0_REG);
>   			ret = mtk_i2c_master_cmd(i2c, SM0CTL1_WRITE, 1);
>   			if (ret)
> @@ -187,6 +192,7 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   				goto err_ack;
>   		}
>   
> +nostart:
>   		/* transfer data */
>   		for (len = pmsg->len, j = 0; len > 0; len -= 8, j += 8) {
>   			page_len = (len >= 8) ? 8 : len;
> @@ -242,7 +248,8 @@ static int mtk_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>   
>   static u32 mtk_i2c_func(struct i2c_adapter *a)
>   {
> -	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_PROTOCOL_MANGLING;
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_10BIT_ADDR
> +		| I2C_FUNC_PROTOCOL_MANGLING | I2C_FUNC_NOSTART;

Nit: I prefer to have the "|" at the end of the upper line instead of
adding it in the 2nd line.

Other that this:

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan
