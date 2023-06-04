Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D37B7217D8
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Jun 2023 16:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbjFDOjA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Jun 2023 10:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbjFDOi7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Jun 2023 10:38:59 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1727B6;
        Sun,  4 Jun 2023 07:38:58 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 4BA691FE60;
        Sun,  4 Jun 2023 14:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685889537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6gAq3YdQZS0iM/rW4fDuJ13sOhdtiOrgKPqbYAwIgZI=;
        b=gq6SisJ+O2I5EQv4dN9J1h/gwh3iH1t3kloI517y6pGS4nYsCUFAdwf3PvgC9qRgFEvJiM
        BxTAqAMUqXwwrmjyNgi9gTtRQdyDY4MIsLDW9GBeVasiYYHc0k9cLcFba8Llw+RgM1qTy4
        qwfaMPAe8sDk8N5gqZha9Cu+VvOzpKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685889537;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6gAq3YdQZS0iM/rW4fDuJ13sOhdtiOrgKPqbYAwIgZI=;
        b=grywVk61Fh2wVRiasb/81njSneFpd9aeF3z8FfIiUjihVtBL0xT/LzY7D/DIBpvx3oUoDS
        x/MZgLSIAR/J6qDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 29E24139C8;
        Sun,  4 Jun 2023 14:38:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id mq+NCAGifGQKXgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Sun, 04 Jun 2023 14:38:57 +0000
Date:   Sun, 4 Jun 2023 16:38:55 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Marius Hoch <mail@mariushoch.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: i801: Force no IRQ for Dell Latitude E7450
Message-ID: <20230604163855.5b7ea1e0@endymion.delvare>
In-Reply-To: <20230514103634.235917-2-mail@mariushoch.de>
References: <20230514103634.235917-1-mail@mariushoch.de>
        <20230514103634.235917-2-mail@mariushoch.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
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

On Sun, 14 May 2023 12:36:33 +0200, Marius Hoch wrote:
> The Dell Latitude E7450 uses IRQ 18 for the accelerometer,
> but also claims that the SMBus uses IRQ 18. This will
> result in:
> 
> i801_smbus 0000:00:1f.3: PCI INT C: failed to register GSI
> i801_smbus 0000:00:1f.3: Failed to enable SMBus PCI device (-16)
> i801_smbus: probe of 0000:00:1f.3 failed with error -16
> 
> Force the SMBus IRQ to IRQ_NOTCONNECTED in this case, so that
> we fall back to polling, which also seems to be what the (very
> dated) Windows 7 drivers on the Dell Latitude E7450 do.
> 
> This was tested on Dell Latitude E7450.
> 
> Signed-off-by: Marius Hoch <mail@mariushoch.de>
> ---
>  drivers/i2c/busses/i2c-i801.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index ac5326747c51..5fd2ac585160 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1624,6 +1624,20 @@ static void i801_setup_hstcfg(struct i801_priv *priv)
>  	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hstcfg);
>  }
>  
> +/**

As reported by the kernel test robot, please don't start a comment with
/** unless it's a kernel-doc-style comment.

> + * These DELL devices claim an IRQ for the SMBus (usually 18), but we can't use
> + * it, as its actually for the I2C accelerometer.
> + */
> +static const struct dmi_system_id dmi_force_no_irq[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E7450"),
> +		},
> +	},
> +	{} /* Terminating entry */
> +};
> +
>  static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  {
>  	int err, i;
> @@ -1657,6 +1671,12 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	if (!(priv->features & FEATURE_BLOCK_BUFFER))
>  		priv->features &= ~FEATURE_BLOCK_PROC;
>  
> +	if (dmi_check_system(dmi_force_no_irq)) {

If the problem is caused by dev->irq being 255, and now that we know
that this value is special on x86, wouldn't it make more sense to
restrict this quirk to CONFIG_X86 and simply check for dev->irq ==
0xff? This would save us the extra effort of maintaining a list of
machines which need the quirk.

> +		/* Force no IRQ for these devices, otherwise pcim_enable_device will fail */
> +		dev->irq = IRQ_NOTCONNECTED;
> +		dev->irq_managed = 1;

This field is undocumented so I have no idea what it does. Is it not
sufficient to set irq to IRQ_NOTCONNECTED?

> +	}
> +
>  	err = pcim_enable_device(dev);
>  	if (err) {
>  		dev_err(&dev->dev, "Failed to enable SMBus PCI device (%d)\n",


-- 
Jean Delvare
SUSE L3 Support
