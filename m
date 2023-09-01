Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 925B178FD0B
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Sep 2023 14:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbjIAMTj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Sep 2023 08:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236716AbjIAMTj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Sep 2023 08:19:39 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ECF9E7B
        for <linux-i2c@vger.kernel.org>; Fri,  1 Sep 2023 05:19:32 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 348BC1F853;
        Fri,  1 Sep 2023 12:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1693570771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yTGFN/YunX0V03zERO1lp8CC4a/5LqUfy0IhLkF6JDw=;
        b=NVWco+V1AjKL3M0KKBGbn4X/Ht+fRlrrYta872Nqfv5/Pi4FsmHqXHWl4vM+X5oYGUM73z
        JxaS4o0+bf4ElKYih+jINmjws9wuvqyqe8QtavEl7hSTBX6rFQZl2zfJ0TytomLNHrq6cK
        FJ2+cezf55DSTPeVQMZAfqK7XnKXn3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1693570771;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yTGFN/YunX0V03zERO1lp8CC4a/5LqUfy0IhLkF6JDw=;
        b=Wjj0egcTqj7EfbUZfcLJz/q+kPxLUeX3JWMNpQeVrP+LIUx++6EpQ42UBzFLLZHzCdPGaJ
        xJripuxQnx6YHKAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A2951358B;
        Fri,  1 Sep 2023 12:19:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id nmexANPW8WQ4HwAAMHmgww
        (envelope-from <jdelvare@suse.de>); Fri, 01 Sep 2023 12:19:31 +0000
Date:   Fri, 1 Sep 2023 14:19:29 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: fix cleanup code in remove() and error path
 of probe()
Message-ID: <20230901141929.640fc5d5@endymion.delvare>
In-Reply-To: <07386d35-0f9f-bcd7-185c-d8eed60fc794@gmail.com>
References: <07386d35-0f9f-bcd7-185c-d8eed60fc794@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_PASS,
        T_SPF_HELO_TEMPERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Sun, 27 Aug 2023 22:26:05 +0200, Heiner Kallweit wrote:
> Jean pointed out that the referenced patch resulted in the remove()
> path not having the reverse order of calls in probe(). I think there's
> more to be done to ensure proper cleanup.
> Especially cleanup in the probe() error path has to be extended.
> Not every step there may be strictly needed, but it's in line with
> remove() now.
> 
> Fixes: 9b5bf5878138 ("i2c: i801: Restore INTREN on unload")

I think it also fixes 9424693035a5 ("i2c: i801: Create iTCO device on
newer Intel PCHs").

> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 73ae06432..7a0ccc584 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1754,6 +1754,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  		"SMBus I801 adapter at %04lx", priv->smba);
>  	err = i2c_add_adapter(&priv->adapter);
>  	if (err) {
> +		platform_device_unregister(priv->tco_pdev);
> +		outb_p(priv->original_hstcnt, SMBHSTCNT(priv));

Doesn't seem to be needed, as I can't see SMBHSTCNT being written to
during probe?

> +		pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
>  		i801_acpi_remove(priv);
>  		return err;
>  	}
> @@ -1779,14 +1782,13 @@ static void i801_remove(struct pci_dev *dev)
>  {
>  	struct i801_priv *priv = pci_get_drvdata(dev);
>  
> -	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
> -	i801_disable_host_notify(priv);
>  	i801_del_mux(priv);
> +	i801_disable_host_notify(priv);
>  	i2c_del_adapter(&priv->adapter);
> -	i801_acpi_remove(priv);
> -	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
> -
>  	platform_device_unregister(priv->tco_pdev);
> +	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
> +	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
> +	i801_acpi_remove(priv);
>  
>  	/* if acpi_reserved is set then usage_count is incremented already */
>  	if (!priv->acpi_reserved)
> @@ -1803,8 +1805,8 @@ static void i801_shutdown(struct pci_dev *dev)
>  	struct i801_priv *priv = pci_get_drvdata(dev);
>  
>  	/* Restore config registers to avoid hard hang on some systems */
> -	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>  	i801_disable_host_notify(priv);
> +	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>  	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
>  }
>  

Rest looks OK, I'll give it some testing 

-- 
Jean Delvare
SUSE L3 Support
