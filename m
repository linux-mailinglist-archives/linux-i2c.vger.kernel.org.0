Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0113E15DA
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 15:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhHENjO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 09:39:14 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:40340 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241775AbhHENjO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Aug 2021 09:39:14 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 18A892023D;
        Thu,  5 Aug 2021 13:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1628170739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ielTrnIEbu8D6YHydkiuCZS6K1AQ3+xvbkECGwUHwV8=;
        b=OH5chrizcXecXJxMndIhLt+oCTsZbIh8oMfxyGulRgqIMUzpYhoVyQ8Zy6//bWQ76W57I0
        VFfhh7Ob9/giXxY0bgp76LqmT0Q79hK413nXG3NpouvsL7Rq13DlMUcTwlwiDakD0tKcOV
        sQyH+C35DbOH5TufJQQYc/km6KECmmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1628170739;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ielTrnIEbu8D6YHydkiuCZS6K1AQ3+xvbkECGwUHwV8=;
        b=9mSD3n0XgQewkfz1vRvvRYXKCS0nd9wmybTaMpuAiFtfqsvxqhhVlv44+45kHKZ6g5ydLJ
        7IxyLoTfuv9UrcDg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D8CF913A46;
        Thu,  5 Aug 2021 13:38:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id znP5MfLpC2FaNAAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Thu, 05 Aug 2021 13:38:58 +0000
Date:   Thu, 5 Aug 2021 15:38:57 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 07/10] i2c: i801: Improve i801_acpi_probe/remove
 functions
Message-ID: <20210805153857.442ca8e7@endymion>
In-Reply-To: <064c1f0b-9f79-3fb2-cac1-35ef26c33296@gmail.com>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
        <064c1f0b-9f79-3fb2-cac1-35ef26c33296@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 01 Aug 2021 16:21:54 +0200, Heiner Kallweit wrote:
> By using ACPI_HANDLE() the handler argument can be retrieved directly.
> Both address space handler functions check the handler argument and
> return an error if it's NULL. This allows to further simplify the code.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 23 +++++++----------------
>  1 file changed, 7 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 5b9eebc1c..5fa8dc1cb 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1633,31 +1633,22 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
>  
>  static int i801_acpi_probe(struct i801_priv *priv)
>  {
> -	struct acpi_device *adev;
> +	acpi_handle ah = ACPI_HANDLE(&priv->pci_dev->dev);
>  	acpi_status status;
>  
> -	adev = ACPI_COMPANION(&priv->pci_dev->dev);
> -	if (adev) {
> -		status = acpi_install_address_space_handler(adev->handle,
> -				ACPI_ADR_SPACE_SYSTEM_IO, i801_acpi_io_handler,
> -				NULL, priv);
> -		if (ACPI_SUCCESS(status))
> -			return 0;
> -	}
> +	status = acpi_install_address_space_handler(ah, ACPI_ADR_SPACE_SYSTEM_IO,
> +						    i801_acpi_io_handler, NULL, priv);
> +	if (ACPI_SUCCESS(status))
> +		return 0;
>  
>  	return acpi_check_resource_conflict(&priv->pci_dev->resource[SMBBAR]);
>  }
>  
>  static void i801_acpi_remove(struct i801_priv *priv)
>  {
> -	struct acpi_device *adev;
> -
> -	adev = ACPI_COMPANION(&priv->pci_dev->dev);
> -	if (!adev)
> -		return;
> +	acpi_handle ah = ACPI_HANDLE(&priv->pci_dev->dev);
>  
> -	acpi_remove_address_space_handler(adev->handle,
> -		ACPI_ADR_SPACE_SYSTEM_IO, i801_acpi_io_handler);
> +	acpi_remove_address_space_handler(ah, ACPI_ADR_SPACE_SYSTEM_IO, i801_acpi_io_handler);
>  }
>  #else
>  static inline int i801_acpi_probe(struct i801_priv *priv) { return 0; }

Looks completely reasonable.

Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

Mika, no objection?

-- 
Jean Delvare
SUSE L3 Support
