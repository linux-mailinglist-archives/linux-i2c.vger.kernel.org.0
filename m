Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F03363DD60C
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Aug 2021 14:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233730AbhHBMyB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Aug 2021 08:54:01 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:53702 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233688AbhHBMyA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Aug 2021 08:54:00 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id C109521FDC;
        Mon,  2 Aug 2021 12:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1627908830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VdFhtn57yPP2EIBIBkmFa7iqmG16GZMqN7QHTwaZQA8=;
        b=gq7IyBQ+SFEtioP87J/oAmy+7WA1ZiUBVj6WKYwCtF7Rx1REGhu1ugqo8sMm7G8TEEffEb
        1Tm2qmTST7V4VpFtGe4OBptQOFhlsmEiuaHSyTshaAzp7rf42lGFUWr07wKXla+sToqzAf
        0C437JzPmql+8eoS5CaKXqDf9h4KwbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1627908830;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VdFhtn57yPP2EIBIBkmFa7iqmG16GZMqN7QHTwaZQA8=;
        b=NhU65Tg01hJOp/OWhYW5H5A0F3YfIx473GEoYr72JW7Q2QS3DR2njV6oTOmFySdr0+X1zZ
        c7o43MjpP9iYmaCQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8E87D13983;
        Mon,  2 Aug 2021 12:53:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id RfFbIN7qB2GdWwAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Mon, 02 Aug 2021 12:53:50 +0000
Date:   Mon, 2 Aug 2021 14:53:47 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 01/10] i2c: i801: Don't call pm_runtime_allow
Message-ID: <20210802145347.605ce8d5@endymion>
In-Reply-To: <c0eeddf6-f630-d18b-cdae-0d74ed095f9c@gmail.com>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
        <c0eeddf6-f630-d18b-cdae-0d74ed095f9c@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Sun, 01 Aug 2021 16:16:56 +0200, Heiner Kallweit wrote:
> Drivers should not call pm_runtime_allow(), see
> Documentation/power/pci.rst. Therefore remove the call and leave this
> to user space. Also remove the not needed call to pm_runtime_forbid().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 92ec291c0..362e74761 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1891,7 +1891,6 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	pm_runtime_set_autosuspend_delay(&dev->dev, 1000);
>  	pm_runtime_use_autosuspend(&dev->dev);
>  	pm_runtime_put_autosuspend(&dev->dev);
> -	pm_runtime_allow(&dev->dev);
>  
>  	return 0;
>  }
> @@ -1900,7 +1899,6 @@ static void i801_remove(struct pci_dev *dev)
>  {
>  	struct i801_priv *priv = pci_get_drvdata(dev);
>  
> -	pm_runtime_forbid(&dev->dev);
>  	pm_runtime_get_noresume(&dev->dev);
>  
>  	i801_disable_host_notify(priv);

These calls were added by Jarkko (Cc'd) and I'm not familiar with power
management so I'll need an explicit ack from him before I can accept
this patch.

-- 
Jean Delvare
SUSE L3 Support
