Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C80A6540100
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jun 2022 16:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241035AbiFGON3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jun 2022 10:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243705AbiFGON1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jun 2022 10:13:27 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5292A21248
        for <linux-i2c@vger.kernel.org>; Tue,  7 Jun 2022 07:13:22 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 750821F9BA;
        Tue,  7 Jun 2022 14:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1654611201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K1UFrLWacvJkw6MScUfl7W5FJUnbgbBAyqpYTgxaIew=;
        b=RU1yyO49BOqJ9MIbgTHpzSKwzHPo9vo30SL26+vNRabHvMXGyjZ53xZso0TusiF6AUNXD1
        /h5janxF3AjBnYYU1KqpPBRakdlDO6lVv14D5Fw16Fu66UJMvsyh+M3brSJOGLNSm8zW1W
        rqM5kAUAkjwXnJilH1Z+PjWpH2riMG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1654611201;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K1UFrLWacvJkw6MScUfl7W5FJUnbgbBAyqpYTgxaIew=;
        b=yeFeAxxod7xuFPnkphUIxV/dePT4m3EzRo9sFovTPeM+xO8M9OEB02Tc/0CaTZYWOOi1IH
        jaDLOBtPC2WqF3Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 53E7413638;
        Tue,  7 Jun 2022 14:13:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id aQvsEgFdn2I+PwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 07 Jun 2022 14:13:21 +0000
Date:   Tue, 7 Jun 2022 16:13:20 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/8] i2c: i801: make FEATURE_BLOCK_PROC dependent on
 FEATURE_BLOCK_BUFFER
Message-ID: <20220607161320.6ce0db40@endymion.delvare>
In-Reply-To: <5e5774c2-26a2-dd4b-29ca-e1eca32ef889@gmail.com>
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
        <5e5774c2-26a2-dd4b-29ca-e1eca32ef889@gmail.com>
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

On Fri, 15 Apr 2022 18:55:46 +0200, Heiner Kallweit wrote:
> According to the datasheet the block process call requires block
> buffer mode. The user may disable block buffer mode by module
> parameter disable_features, in such a case we have to clear
> FEATURE_BLOCK_PROC.

In which datasheet are you seeing this? Can you point me to the
specific section and/or quote the statement? I can't find it in the
datasheet I'm looking at (ICH9, Intel document 316972-002) but it is
huge and I may just be missing it.

Also, same request as previous patch, I'd like a comment in the code,
so that developers don't have to read the git log to figure out why this
piece of code is there.

Furthermore, as far as I can see, the FEATURE_BLOCK_PROC flag only
affects the value returned by i801_func(). i801_access() does not
verify whether this flag is set before processing a command where size
== I2C_SMBUS_BLOCK_PROC_CALL. I think it should? Otherwise your fix is
only partial (will work if the device driver calls .functionality as it
is supposed to, will fail with - I suppose - unpredictable results if
the device driver calls .smbus_xfer directly).

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index eccdc7035..1d8182901 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1675,6 +1675,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	}
>  	priv->features &= ~disable_features;
>  
> +	if (!(priv->features & FEATURE_BLOCK_BUFFER))
> +		priv->features &= ~FEATURE_BLOCK_PROC;
> +
>  	err = pcim_enable_device(dev);
>  	if (err) {
>  		dev_err(&dev->dev, "Failed to enable SMBus PCI device (%d)\n",

Thanks,
-- 
Jean Delvare
SUSE L3 Support
