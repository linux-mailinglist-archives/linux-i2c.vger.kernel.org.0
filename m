Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D64D27A989E
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Sep 2023 19:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbjIURun (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Sep 2023 13:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbjIURuI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Sep 2023 13:50:08 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 282405367F
        for <linux-i2c@vger.kernel.org>; Thu, 21 Sep 2023 10:16:55 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id B2822338A9;
        Thu, 21 Sep 2023 13:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695301288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WW9uOvwO3Mam/IiYK7mVczzyGni94cPWhrwRuJNsY2A=;
        b=XC8HlXRq6IcIZa/6FzKj3kxyqus/x8O1J4jU0nZGfPdxBKuSK7RxAfM6YORbskMIWPyvxh
        z1+wVg0PUQKF9c9HZELC2DbAMEuA8+ZNbgOARUOKLOUcp5GFb2xwLt9RiTltYiaeqjYdm2
        Z+nKiMD0WCMWGjrLJaQEANb3PaNmGOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695301288;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WW9uOvwO3Mam/IiYK7mVczzyGni94cPWhrwRuJNsY2A=;
        b=De5rZ0VqbQF8BiKvyXdSpDw5Z6NV45i0jdEfDeJgP7LZTRrOpH52bDslA7M4ra0gxPKNw0
        UPk2U22HY84UeUDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8434B134B0;
        Thu, 21 Sep 2023 13:01:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 7sy9Hqg+DGX7KgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Thu, 21 Sep 2023 13:01:28 +0000
Date:   Thu, 21 Sep 2023 15:01:26 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: use i2c_mark_adapter_suspended/resumed
Message-ID: <20230921150126.32925f39@endymion.delvare>
In-Reply-To: <0d13ed54-af1d-4c21-a90c-ba8c6b03f67e@gmail.com>
References: <0d13ed54-af1d-4c21-a90c-ba8c6b03f67e@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner, Wolrfam,

On Wed, 20 Sep 2023 09:29:28 +0200, Heiner Kallweit wrote:
> When entering the suspend callback, at first we should ensure that
> transfers are finished and I2C core can't start further transfers.
> Use i2c_mark_adapter_suspended() for this purpose, and complement it
> with a call to i2c_mark_adapter_resumed() in the resume path.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> Rebased version of a previously discussed patch, now w/o touching
> the remove and shutdown path.
> ---
>  drivers/i2c/busses/i2c-i801.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 6d02a8b88..26f132277 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1818,6 +1818,7 @@ static int i801_suspend(struct device *dev)
>  {
>  	struct i801_priv *priv = dev_get_drvdata(dev);
>  
> +	i2c_mark_adapter_suspended(&priv->adapter);
>  	i801_restore_regs(priv);
>  
>  	return 0;
> @@ -1829,6 +1830,7 @@ static int i801_resume(struct device *dev)
>  
>  	i801_setup_hstcfg(priv);
>  	i801_enable_host_notify(&priv->adapter);
> +	i2c_mark_adapter_resumed(&priv->adapter);
>  
>  	return 0;
>  }

As I said before, I wish this was handled by the driver core instead of
device drivers individually, but until that is implemented, I'm fine
with this patch, only because other drivers are already doing the same,
so it can't be that bad.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

To be honest, I'm not even sure why this is necessary. I thought that
the driver core was already suspending the device tree from the leafs to
the root, and resuming from the root to the leafs, so a child would
never be active when its parent isn't. So I just can't see how an I2C
transfer can be initiated by an I2C device driver (child) to a
suspended I2C adapter (parent). But I'm probably missing something in
the driver model. Power management has become so complex over the
years...

-- 
Jean Delvare
SUSE L3 Support
