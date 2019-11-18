Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1874CFFFBC
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2019 08:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbfKRHsA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Nov 2019 02:48:00 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60345 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbfKRHsA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Nov 2019 02:48:00 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iWblN-0006ki-Ms; Mon, 18 Nov 2019 08:47:57 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1iWblN-0006g1-Cz; Mon, 18 Nov 2019 08:47:57 +0100
Date:   Mon, 18 Nov 2019 08:47:57 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-iio@vger.kernel.orgi,
        Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] i2c: smbus: switch from loops to memcpy
Message-ID: <20191118074757.edyfvz5s3pqnu67y@pengutronix.de>
References: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
 <20191112203132.163306-4-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191112203132.163306-4-dmitry.torokhov@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Dmitry,

On Tue, Nov 12, 2019 at 12:31:32PM -0800, Dmitry Torokhov wrote:
> When copying memory from one buffer to another, instead of open-coding
> loops with byte-by-byte copies let's use memcpy() which might be a bit
> faster and makes intent more clear.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> ---
> 
> Changes in v3:
> - new patch using memcpy() for moving data around
> 
>  drivers/i2c/i2c-core-smbus.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
> index 7b4e2270eeda1..bbafdd3b1b114 100644
> --- a/drivers/i2c/i2c-core-smbus.c
> +++ b/drivers/i2c/i2c-core-smbus.c
> @@ -397,8 +397,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
>  			}
>  
>  			i2c_smbus_try_get_dmabuf(&msg[0], command);
> -			for (i = 1; i < msg[0].len; i++)
> -				msg[0].buf[i] = data->block[i - 1];
> +			memcpy(msg[0].buf + 1, data->block, msg[0].len - 1);

Can it happen that msg[0].len is zero?

>  		}
>  		break;
>  	case I2C_SMBUS_BLOCK_PROC_CALL:

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
