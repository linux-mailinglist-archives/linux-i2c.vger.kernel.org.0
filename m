Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 935A553FF5D
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jun 2022 14:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244190AbiFGMsT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jun 2022 08:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244199AbiFGMsJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jun 2022 08:48:09 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55BD71DA56
        for <linux-i2c@vger.kernel.org>; Tue,  7 Jun 2022 05:48:07 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id DE5A71F9F5;
        Tue,  7 Jun 2022 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1654606085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xbObRQJZko641pZGY/AZXRTZJ/fwXULsS4ZuKwqAmwA=;
        b=pDfzMqMrMuy6DRPXn8hU9tQmUKo3k7SPs9NKs2f513xT4f3fn8cIMFekG1dnDZYoZAD8nk
        zJaqFlKVVpZzjlkfofmXdr3ruRP+4FdwJe5a3A8CQoA6nM4XYTwCzKGz6Ufy/tb5x0HfUW
        0fWXYx6sidTQYCeB34wvDMhQhxmMzeg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1654606085;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xbObRQJZko641pZGY/AZXRTZJ/fwXULsS4ZuKwqAmwA=;
        b=rVX9bYUax2Ee+XTqc32zlwFy6qQ6QOJQI6V9CuDGzOqiOo+kglwJgHmm4EJxKG9QOvHqJe
        sD+6bk83OJEH4TCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD5F013A88;
        Tue,  7 Jun 2022 12:48:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id wVOYLAVJn2LVEwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 07 Jun 2022 12:48:05 +0000
Date:   Tue, 7 Jun 2022 14:48:04 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/8] i2c: i801: make FEATURE_HOST_NOTIFY dependent on
 FEATURE_IRQ
Message-ID: <20220607144804.57e60cf1@endymion.delvare>
In-Reply-To: <08ccd96f-deca-72b9-e14e-917434736ca3@gmail.com>
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
        <08ccd96f-deca-72b9-e14e-917434736ca3@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Fri, 15 Apr 2022 18:55:10 +0200, Heiner Kallweit wrote:
> Host notification uses an interrupt, therefore it makes sense only if
> interrupts are enabled.

It would be nice to have this comment in the code itself.

> Make this dependency explicit by removing
> FEATURE_HOST_NOTIFY if FEATURE_IRQ isn't set.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index c481f121d..eccdc7035 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1756,6 +1756,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	dev_info(&dev->dev, "SMBus using %s\n",
>  		 priv->features & FEATURE_IRQ ? "PCI interrupt" : "polling");
>  
> +	if (!(priv->features & FEATURE_IRQ))
> +		priv->features &= ~FEATURE_HOST_NOTIFY;

Earlier in this function, there's an action which depends on the
FEATURE_HOST_NOTIFY flag being set. While this will only result in a
useless action and wouldn't cause a bug as far as I can see, wouldn't
it be cleaner to move that piece of code *after* the check you're
adding?

> +
>  	i801_add_tco(priv);
>  
>  	snprintf(priv->adapter.name, sizeof(priv->adapter.name),

Looks good, tested OK on my system (non-regression only, I'm not using
the Host Notify feature).

-- 
Jean Delvare
SUSE L3 Support
