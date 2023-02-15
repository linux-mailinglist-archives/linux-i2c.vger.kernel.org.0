Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93E34697F4D
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Feb 2023 16:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbjBOPQ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Feb 2023 10:16:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjBOPQ1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Feb 2023 10:16:27 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DEE539CF2
        for <linux-i2c@vger.kernel.org>; Wed, 15 Feb 2023 07:16:09 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id CA9B43399F;
        Wed, 15 Feb 2023 15:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676474167; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nDSIna7Cqf/wbN5SVWQwDYDdjrEElC8LAHBXTWXVSYw=;
        b=dbQmSFYjcn9Zw6hmKLGRPwJZmbJxPsf4Cynxw2s1Ic8uQqP9MZb9wwpnzWJhu55bxQpw10
        phgeKQSuFg8ZR/oWsqORLQHX1Af0EmEJWTYcArQ+CTIFKBRxwQbhM3oo6SzKaft+bkJRYY
        1REWJJrzU3j4SJwAycS9KgWiY3JnGOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676474167;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nDSIna7Cqf/wbN5SVWQwDYDdjrEElC8LAHBXTWXVSYw=;
        b=sgKEIFrbJf1FvlukhdHb3BYhJNic6fT1Evk5Os3AHUQWEutV8VXZHYJ3k5rIUYkld/aUUW
        ZG5iYiO6mpFH3cAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD48B134BA;
        Wed, 15 Feb 2023 15:16:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id F0PRKDf37GOBHQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 15 Feb 2023 15:16:07 +0000
Date:   Wed, 15 Feb 2023 16:16:06 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 08/10] i2c: i801: centralize configuring block
 commands in i801_block_transaction
Message-ID: <20230215161606.00bbba00@endymion.delvare>
In-Reply-To: <83fd2bd5-1f49-4943-ca67-e774f98905cb@gmail.com>
References: <8db86d89-d083-2a65-76a1-6db34f433604@gmail.com>
        <83fd2bd5-1f49-4943-ca67-e774f98905cb@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 19 Dec 2022 19:21:33 +0100, Heiner Kallweit wrote:
> Similar to the patch for non-block commands, centralize block command
> register settings in i801_block_transaction().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 85 +++++++++++++++--------------------
>  1 file changed, 36 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 0d49e9587..78663d8df 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> (...)
> @@ -824,6 +846,13 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
>  				"I2C block read is unsupported!\n");
>  			return -EOPNOTSUPP;
>  		}
> +

No blank line here.

> +		break;
> +	case I2C_SMBUS_BLOCK_PROC_CALL:
> +		/* Needs to be flagged as write transaction */
> +		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
> +		outb_p(hstcmd, SMBHSTCMD(priv));
> +		break;
>  	}
>  
>  	/* Experience has shown that the block buffer can only be used for

Other that this minor style issue, looks good, nice clean-up.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
