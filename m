Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F410A3E1B5C
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 20:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241108AbhHEScr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 14:32:47 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:59472 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238354AbhHEScr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Aug 2021 14:32:47 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id D8B08223EB;
        Thu,  5 Aug 2021 18:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1628188351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xzT2vONXueXQpKNnzFfXm/Ju8eKjhv07rgrrL4xin1I=;
        b=SkwXSJ+dzXY53eBOjNdh5AROHS2JqCj4s8IhJdhxCpkd6KHfmGllE5P7hgH/adit7yY3B7
        xny1VOdQ4YE+r0dH8VOMr0cun7SaP9/e3F/pXXJDnf1ApYm7yEHVoPBczjcbVXG4B5VC8q
        JyHKk32CpY6DUQW6xvICTsZs7/QzEDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1628188351;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xzT2vONXueXQpKNnzFfXm/Ju8eKjhv07rgrrL4xin1I=;
        b=53cxeIM6iE/OWiNHiqp6OUm4I0r6meF0yl+Gy5Xz76M83yQ/FFnPw9mOhxhblk+vjX0M+D
        goXJiYYN8sxS/rBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 9A3B713A5D;
        Thu,  5 Aug 2021 18:32:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id 9p25Ir8uDGFVfAAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Thu, 05 Aug 2021 18:32:31 +0000
Date:   Thu, 5 Aug 2021 20:32:30 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 10/10] i2c: i801: Improve handling platform data for tco
 device
Message-ID: <20210805203230.35058c09@endymion>
In-Reply-To: <cf0ba833-8fdb-42ca-3b6f-b305bf28516a@gmail.com>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
        <cf0ba833-8fdb-42ca-3b6f-b305bf28516a@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 01 Aug 2021 16:24:30 +0200, Heiner Kallweit wrote:
> The platform data structures are used in the respective i801_add_tco
> functions only. Therefore we can make the definitions local to these
> functions.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 1ca92a1e0..64217479a 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1464,15 +1464,14 @@ static inline unsigned int i801_get_adapter_class(struct i801_priv *priv)
>  }
>  #endif
>  
> -static const struct itco_wdt_platform_data spt_tco_platform_data = {
> -	.name = "Intel PCH",
> -	.version = 4,
> -};
> -
>  static struct platform_device *
>  i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
>  		 struct resource *tco_res)
>  {
> +	static const struct itco_wdt_platform_data pldata = {
> +		.name = "Intel PCH",
> +		.version = 4,
> +	};
>  	static DEFINE_MUTEX(p2sb_mutex);
>  	struct resource *res;
>  	unsigned int devfn;
> @@ -1516,22 +1515,20 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
>  	res->flags = IORESOURCE_MEM;
>  
>  	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
> -					tco_res, 2, &spt_tco_platform_data,
> -					sizeof(spt_tco_platform_data));
> +					tco_res, 2, &pldata, sizeof(pldata));
>  }
>  
> -static const struct itco_wdt_platform_data cnl_tco_platform_data = {
> -	.name = "Intel PCH",
> -	.version = 6,
> -};
> -
>  static struct platform_device *
>  i801_add_tco_cnl(struct i801_priv *priv, struct pci_dev *pci_dev,
>  		 struct resource *tco_res)
>  {
> -	return platform_device_register_resndata(&pci_dev->dev,
> -			"iTCO_wdt", -1, tco_res, 1, &cnl_tco_platform_data,
> -			sizeof(cnl_tco_platform_data));
> +	static const struct itco_wdt_platform_data pldata = {
> +		.name = "Intel PCH",
> +		.version = 6,
> +	};
> +
> +	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
> +						 tco_res, 1, &pldata, sizeof(pldata));
>  }
>  
>  static void i801_add_tco(struct i801_priv *priv)

I don't really care either way, to be honest. But fine with me.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
