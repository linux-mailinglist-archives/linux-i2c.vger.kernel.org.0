Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC519FEFC
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2019 11:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfH1J5L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Aug 2019 05:57:11 -0400
Received: from mx2.suse.de ([195.135.220.15]:54716 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726591AbfH1J5L (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 28 Aug 2019 05:57:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 1AE86AEFF;
        Wed, 28 Aug 2019 09:57:10 +0000 (UTC)
Date:   Wed, 28 Aug 2019 11:57:17 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Nishka Dasgupta" <nishkadg.linux@gmail.com>
Cc:     <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: taos-evm: Make structure tsl2550_info constant
Message-ID: <20190828115717.2d1b1e97@endymion>
In-Reply-To: <20190819074601.326-1-nishkadg.linux@gmail.com>
References: <20190819074601.326-1-nishkadg.linux@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 19 Aug 2019 13:16:01 +0530, Nishka Dasgupta wrote:
> Static structure tsl2550_info, of type i2c_board_info, is referenced
> only twice: the first time in arguments to dev_info() (which does not
> modify it) and the second time as the last argument to function
> i2c_new_device() (where the corresponding parameter is declared as
> const). As tsl2550_info is therefore never modified, make it const to
> protect it from unintended modifications.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/i2c/busses/i2c-taos-evm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-taos-evm.c b/drivers/i2c/busses/i2c-taos-evm.c
> index c82e78f57386..056df6b2538a 100644
> --- a/drivers/i2c/busses/i2c-taos-evm.c
> +++ b/drivers/i2c/busses/i2c-taos-evm.c
> @@ -39,7 +39,7 @@ struct taos_data {
>  };
>  
>  /* TAOS TSL2550 EVM */
> -static struct i2c_board_info tsl2550_info = {
> +static const struct i2c_board_info tsl2550_info = {
>  	I2C_BOARD_INFO("tsl2550", 0x39),
>  };
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks,
-- 
Jean Delvare
SUSE L3 Support
