Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E99DEFFF98
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Nov 2019 08:37:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbfKRHhB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Nov 2019 02:37:01 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35651 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbfKRHhB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Nov 2019 02:37:01 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iWbal-0005qx-Ti; Mon, 18 Nov 2019 08:36:59 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1iWbal-0006MR-7C; Mon, 18 Nov 2019 08:36:59 +0100
Date:   Mon, 18 Nov 2019 08:36:59 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-iio@vger.kernel.orgi,
        Luca Ceresoli <luca@lucaceresoli.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] i2c: smbus: use get/put_unaligned_le16 when
 working with word data
Message-ID: <20191118073659.7yomkvqthuenqjpu@pengutronix.de>
References: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
 <20191112203132.163306-3-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191112203132.163306-3-dmitry.torokhov@gmail.com>
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

On Tue, Nov 12, 2019 at 12:31:31PM -0800, Dmitry Torokhov wrote:
> It is potentially more performant, and also shows intent more clearly,
> to use get_unaligned_le16() and put_unaligned_le16() when working with
> word data.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> ---
> 
> Changes in v3:
> - split put_unaligned_le16 into a separate patch
> - more call sites converted to get/put_unaligned_le16
> 
>  drivers/i2c/i2c-core-smbus.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
> index f8708409b4dbc..7b4e2270eeda1 100644
> --- a/drivers/i2c/i2c-core-smbus.c
> +++ b/drivers/i2c/i2c-core-smbus.c
> @@ -15,6 +15,7 @@
>  #include <linux/i2c.h>
>  #include <linux/i2c-smbus.h>
>  #include <linux/slab.h>
> +#include <asm/unaligned.h>
>  
>  #include "i2c-core.h"
>  
> @@ -370,8 +371,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
>  			msg[1].len = 2;
>  		else {
>  			msg[0].len = 3;
> -			msgbuf0[1] = data->word & 0xff;
> -			msgbuf0[2] = data->word >> 8;
> +			put_unaligned_le16(data->word, msgbuf0 + 1);

You claim this was clearer. For me it is not. With the explicit
assignment to msgbuf0[1] and msbbuf0[2] it is immediatly obvious to me
what happens.  Even though the endianness is explicitly mentioned in
put_unaligned_le16, it takes a bit longer for me to understand what it
does and which part of data->word ends up in which byte.

Concerning the "potentially more performant" part: I wonder if this is
backed by numbers and if it is indeed benificial on some platforms if
this is a compiler problem.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
