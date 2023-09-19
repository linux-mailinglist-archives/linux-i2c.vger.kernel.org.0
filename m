Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAEE77A6857
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 17:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbjISPux (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 11:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbjISPux (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 11:50:53 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E4E591
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 08:50:47 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 396CF2293C;
        Tue, 19 Sep 2023 15:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1695138646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hgWyPwVZvxWbx1I2UhP0J11+yh43ZD9mfZhrg5X6Y2I=;
        b=jD8XzwOrMHkeTazk0pbkaD2DxFZi1rU4O0tHHeWaGdG+hJ+lTYXjvM+sietObkw13mUvj7
        vgD5pNMV/j2sl0FE7Qnk4QDqNndH1m9IchTIVAYTnuQFbM0ZwtrJjb5fH7hSOnHQW6Ymt9
        67zSZcEiITJ2oAA3XvoYAFTicAZ0RxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1695138646;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hgWyPwVZvxWbx1I2UhP0J11+yh43ZD9mfZhrg5X6Y2I=;
        b=P/olnfZsLGNXdA60eUSD9FTMoOuHZ+B9PvNRUSZBac8vZL04nROt79msIJteL1GIK7w8jG
        RJ3HfXVg3JupbADw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D889134F3;
        Tue, 19 Sep 2023 15:50:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 0O2uAVbDCWXoBgAAMHmgww
        (envelope-from <jdelvare@suse.de>); Tue, 19 Sep 2023 15:50:46 +0000
Date:   Tue, 19 Sep 2023 17:50:44 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: add helper i801_restore_regs
Message-ID: <20230919175044.748bd8de@endymion.delvare>
In-Reply-To: <94271a34-dbf5-440a-9f53-dc27b8384812@gmail.com>
References: <94271a34-dbf5-440a-9f53-dc27b8384812@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 18 Sep 2023 13:57:01 +0200, Heiner Kallweit wrote:
> In few places relevant registers are reset to their initial value on
> driver load. Factor this out to new helper i801_restore_regs to avoid
> code duplication.
> Even though no actual problems are known, this patch may contribute
> to avoiding potential issues by:
> - restoring register values also in the error path of i2c_add_adapter
> - making restoring registers the last step (especially in i801_remove)
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> This patch is a reworked version of a part of previously discussed patch
> "i2c: i801: fix cleanup code in remove() and error path of probe()".
> ---
>  drivers/i2c/busses/i2c-i801.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 9bd712eaf..811541797 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1629,6 +1629,12 @@ static void i801_setup_hstcfg(struct i801_priv *priv)
>  	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hstcfg);
>  }
>  
> +static void i801_restore_regs(struct i801_priv *priv)
> +{
> +	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
> +	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, priv->original_hstcfg);
> +}
> +
>  static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  {
>  	int err, i;
> @@ -1755,6 +1761,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	if (err) {
>  		platform_device_unregister(priv->tco_pdev);
>  		i801_acpi_remove(priv);
> +		i801_restore_regs(priv);
>  		return err;
>  	}
>  
> @@ -1779,12 +1786,10 @@ static void i801_remove(struct pci_dev *dev)
>  {
>  	struct i801_priv *priv = pci_get_drvdata(dev);
>  
> -	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>  	i801_disable_host_notify(priv);
>  	i801_del_mux(priv);
>  	i2c_del_adapter(&priv->adapter);
>  	i801_acpi_remove(priv);
> -	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
>  
>  	platform_device_unregister(priv->tco_pdev);
>  
> @@ -1792,6 +1797,8 @@ static void i801_remove(struct pci_dev *dev)
>  	if (!priv->acpi_reserved)
>  		pm_runtime_get_noresume(&dev->dev);
>  
> +	i801_restore_regs(priv);
> +
>  	/*
>  	 * do not call pci_disable_device(dev) since it can cause hard hangs on
>  	 * some systems during power-off (eg. Fujitsu-Siemens Lifebook E8010)
> @@ -1802,18 +1809,17 @@ static void i801_shutdown(struct pci_dev *dev)
>  {
>  	struct i801_priv *priv = pci_get_drvdata(dev);
>  
> -	/* Restore config registers to avoid hard hang on some systems */
> -	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>  	i801_disable_host_notify(priv);
> -	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
> +	/* Restore config registers to avoid hard hang on some systems */
> +	i801_restore_regs(priv);
>  }
>  
>  static int i801_suspend(struct device *dev)
>  {
>  	struct i801_priv *priv = dev_get_drvdata(dev);
>  
> -	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
> -	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, priv->original_hstcfg);
> +	i801_restore_regs(priv);
> +
>  	return 0;
>  }
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

Thanks,
-- 
Jean Delvare
SUSE L3 Support
