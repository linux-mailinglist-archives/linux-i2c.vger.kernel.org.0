Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC473E1095
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 10:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233100AbhHEIxQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 04:53:16 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:51588 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232591AbhHEIxQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Aug 2021 04:53:16 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id A4AD222353;
        Thu,  5 Aug 2021 08:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1628153581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aiibZiBsGLxZzcEofCQ5/cVaZHIJxt/90S1cOIXUNZ4=;
        b=rHQuanuIzcjkghpVGQrLPyJtXh4fX803Kj1z6UN2OPLCI6x0WjHRbiPls36tX5j1+r85oz
        ujQDkwMbA8dUGgsRsW3jzwVgEbEsM7C0waIPRFLPIEq1zFqGJ832fDW/9NBTnJxXXOQldG
        yGyjEltZkQ4MDPzPw+8Kl87Z+TaZsAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1628153581;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aiibZiBsGLxZzcEofCQ5/cVaZHIJxt/90S1cOIXUNZ4=;
        b=t1pqZb6cC+YAYE8gmx6O/qmtjfprqym8cqZGUtK7a1nurM51Q8hXP1Eqk4TYyfgWIF9+Va
        ho3Oug/pVqdbloAA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 6E3E713785;
        Thu,  5 Aug 2021 08:53:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id Zz+mGO2mC2HaVQAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Thu, 05 Aug 2021 08:53:01 +0000
Date:   Thu, 5 Aug 2021 10:53:00 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 04/10] i2c: i801: Remove not needed debug message
Message-ID: <20210805105300.34fdc132@endymion>
In-Reply-To: <3bf865c2-2c1b-e419-2f8f-44295e495197@gmail.com>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
        <3bf865c2-2c1b-e419-2f8f-44295e495197@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 01 Aug 2021 16:19:24 +0200, Heiner Kallweit wrote:
> If a user is interested in such details he can enable smbus tracing.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 504f02e1e..d971ee20c 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -558,10 +558,6 @@ static void i801_isr_byte_done(struct i801_priv *priv)
>  					priv->len);
>  				/* FIXME: Recover */
>  				priv->len = I2C_SMBUS_BLOCK_MAX;
> -			} else {
> -				dev_dbg(&priv->pci_dev->dev,
> -					"SMBus block read size is %d\n",
> -					priv->len);
>  			}
>  			priv->data[-1] = priv->len;
>  		}

I think this is a leftover from the development phase, when we were just
adding support for this feature and needed to verify that the interrupt
callback was being called when and only when needed. I agree it no
longer has any value and can be removed now.

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
