Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F703E11A2
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 11:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238897AbhHEJwS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 05:52:18 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:60104 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232728AbhHEJwS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Aug 2021 05:52:18 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 0F2592231E;
        Thu,  5 Aug 2021 09:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1628157118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eqX1JDFpbJs936siW1aR4IwV1kqhp4/yCgdxapSVaRQ=;
        b=kNYStU1DalBNyW7UJrj3lwvlo+FFNoAvfr5sc5g2AmM/bEBsAESo/EQi6eqP0LyhAZ2EQG
        +PJYhEeFJNR0etOVvQx+fKnpULJS+9400IZywBU/S77OTpdUrnGamMw8RkecVR7vGEL/md
        fjgAhdNytSlmZ8xv7IXB1xDWXNoq/30=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1628157118;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eqX1JDFpbJs936siW1aR4IwV1kqhp4/yCgdxapSVaRQ=;
        b=mD+ebSHaT85v1HHz1Jr8ty7nT8NwxQuDLSsllb4l0t4QuYMc+kjOOZeSQLc3dZhOQx6837
        NswQgzjz8ZrrqxBg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D62AE139CD;
        Thu,  5 Aug 2021 09:51:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id ZjHzMb20C2EkagAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Thu, 05 Aug 2021 09:51:57 +0000
Date:   Thu, 5 Aug 2021 11:51:56 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 05/10] i2c: i801: Improve is_dell_system_with_lis3lv02d
Message-ID: <20210805115156.70e364be@endymion>
In-Reply-To: <f2477399-62df-0036-7d35-4e8634afad9c@gmail.com>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
        <f2477399-62df-0036-7d35-4e8634afad9c@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Sun, 01 Aug 2021 16:20:19 +0200, Heiner Kallweit wrote:
> Replace the ugly cast of the return_value pointer with proper usage.
> In addition use dmi_match() instead of open-coding it.

Pali, would you be able to test this patch?

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index d971ee20c..a6287c520 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1191,7 +1191,7 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
>  
>  	kfree(info);
>  
> -	*((bool *)return_value) = true;
> +	*return_value = obj_handle;
>  	return AE_CTRL_TERMINATE;
>  
>  smo88xx_not_found:
> @@ -1201,13 +1201,10 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
>  
>  static bool is_dell_system_with_lis3lv02d(void)
>  {
> -	bool found;
> -	const char *vendor;
> +	acpi_handle found = NULL;
>  
> -	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
> -	if (!vendor || strcmp(vendor, "Dell Inc."))
> +	if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
>  		return false;

Looks good to me.

> -

I see no reason to remove that blank line.

>  	/*
>  	 * Check that ACPI device SMO88xx is present and is functioning.
>  	 * Function acpi_get_devices() already filters all ACPI devices
> @@ -1216,9 +1213,7 @@ static bool is_dell_system_with_lis3lv02d(void)
>  	 * accelerometer but unfortunately ACPI does not provide any other
>  	 * information (like I2C address).
>  	 */
> -	found = false;
> -	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
> -			 (void **)&found);
> +	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL, &found);

The choice of return value by the acpi_get_devices() designer is very
unfortunate. It would have been much more convenient if the return
value was different whether a match has been found or not. Oh well.

I agree that the proposed change is a nicer way to work around this
limitation. Unfortunately I can't test this as I do not own a Dell
laptop. Were you able to test it? If not, I hope Pali will.

>  
>  	return found;
>  }

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
