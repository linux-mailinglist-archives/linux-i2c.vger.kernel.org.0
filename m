Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFEAF2234DE
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 08:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgGQGoN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 02:44:13 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:35157 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbgGQGoM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jul 2020 02:44:12 -0400
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id AAB4D1C0008;
        Fri, 17 Jul 2020 06:44:10 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] i2c: mv64xxx: Use fallthrough pseudo-keyword
In-Reply-To: <20200716215431.GA19300@embeddedor>
References: <20200716215431.GA19300@embeddedor>
Date:   Fri, 17 Jul 2020 08:44:10 +0200
Message-ID: <878sfi4p51.fsf@FE-laptop>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

"Gustavo A. R. Silva" <gustavoars@kernel.org> writes:

> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1].
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>

> ---
>  drivers/i2c/busses/i2c-mv64xxx.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
> index 829b8c98ae51..8d9d4ffdcd24 100644
> --- a/drivers/i2c/busses/i2c-mv64xxx.c
> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
> @@ -251,7 +251,7 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
>  				MV64XXX_I2C_STATE_WAITING_FOR_ADDR_2_ACK;
>  			break;
>  		}
> -		/* FALLTHRU */
> +		fallthrough;
>  	case MV64XXX_I2C_STATUS_MAST_WR_ADDR_2_ACK: /* 0xd0 */
>  	case MV64XXX_I2C_STATUS_MAST_WR_ACK: /* 0x28 */
>  		if ((drv_data->bytes_left == 0)
> @@ -282,14 +282,14 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
>  				MV64XXX_I2C_STATE_WAITING_FOR_ADDR_2_ACK;
>  			break;
>  		}
> -		/* FALLTHRU */
> +		fallthrough;
>  	case MV64XXX_I2C_STATUS_MAST_RD_ADDR_2_ACK: /* 0xe0 */
>  		if (drv_data->bytes_left == 0) {
>  			drv_data->action = MV64XXX_I2C_ACTION_SEND_STOP;
>  			drv_data->state = MV64XXX_I2C_STATE_IDLE;
>  			break;
>  		}
> -		/* FALLTHRU */
> +		fallthrough;
>  	case MV64XXX_I2C_STATUS_MAST_RD_DATA_ACK: /* 0x50 */
>  		if (status != MV64XXX_I2C_STATUS_MAST_RD_DATA_ACK)
>  			drv_data->action = MV64XXX_I2C_ACTION_CONTINUE;
> @@ -417,8 +417,7 @@ mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
>  			"mv64xxx_i2c_do_action: Invalid action: %d\n",
>  			drv_data->action);
>  		drv_data->rc = -EIO;
> -
> -		/* FALLTHRU */
> +		fallthrough;
>  	case MV64XXX_I2C_ACTION_SEND_STOP:
>  		drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_INTEN;
>  		writel(drv_data->cntl_bits | MV64XXX_I2C_REG_CONTROL_STOP,
> -- 
> 2.27.0
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
