Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55A8D3F88AC
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Aug 2021 15:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235852AbhHZNWH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Aug 2021 09:22:07 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:35610 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbhHZNWG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Aug 2021 09:22:06 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id D773422262;
        Thu, 26 Aug 2021 13:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1629984078; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4Wb4jFCKsDy8o5ctzGFs+L82lSshGzatP4+kHNonr+c=;
        b=jdMTgra2YdHsGGxbPK13MPwPvBuZ0HvT4AwhYMGON4oIC5lvv8Gu2FiqUWzaM2uFhuU89n
        xKMlXvDftQVSjqhHA7gZmKXcDgAcYk5HRBqIraLl3wKmDZ+9MBGQV00x1T4xuas6Gs+xm/
        sYY29o1nIX2plIvLU8I96CS8lnJd2S0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1629984078;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4Wb4jFCKsDy8o5ctzGFs+L82lSshGzatP4+kHNonr+c=;
        b=0mmOjnCX/iar3Ik/WvXaPqDLw6nYkTIL2p5ZYuG1d8r+M85TVY2RAMHRmS7rdiFbk5Ao1q
        /Fem5Ti8ilMP0hBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id A7ACE132FD;
        Thu, 26 Aug 2021 13:21:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id eOllJk6VJ2GWUQAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Thu, 26 Aug 2021 13:21:18 +0000
Date:   Thu, 26 Aug 2021 15:21:17 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 4/9] i2c: i801: Improve is_dell_system_with_lis3lv02d
Message-ID: <20210826152117.1cfc7e99@endymion>
In-Reply-To: <effeb0c0-36cb-afc4-4d9a-7ef348c928ae@gmail.com>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
        <effeb0c0-36cb-afc4-4d9a-7ef348c928ae@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Fri, 06 Aug 2021 23:15:15 +0200, Heiner Kallweit wrote:
> Replace the ugly cast of the return_value pointer with proper usage.
> In addition use dmi_match() instead of open-coding it.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
>   - avoid assigning potentially dangling pointer to *return_value
> ---
>  drivers/i2c/busses/i2c-i801.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 89ae78ef1..f56060fcf 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1192,7 +1192,7 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
>  
>  	kfree(info);
>  
> -	*((bool *)return_value) = true;
> +	*return_value = NULL;
>  	return AE_CTRL_TERMINATE;
>  
>  smo88xx_not_found:
> @@ -1202,11 +1202,9 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
>  
>  static bool is_dell_system_with_lis3lv02d(void)
>  {
> -	bool found;
> -	const char *vendor;
> +	void *err = ERR_PTR(-ENOENT);
>  
> -	vendor = dmi_get_system_info(DMI_SYS_VENDOR);
> -	if (!vendor || strcmp(vendor, "Dell Inc."))
> +	if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
>  		return false;
>  
>  	/*
> @@ -1217,11 +1215,9 @@ static bool is_dell_system_with_lis3lv02d(void)
>  	 * accelerometer but unfortunately ACPI does not provide any other
>  	 * information (like I2C address).
>  	 */
> -	found = false;
> -	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL,
> -			 (void **)&found);
> +	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL, &err);
>  
> -	return found;
> +	return !IS_ERR(err);
>  }
>  
>  /*

OK, it's a bit different from what I proposed but it still addresses the
concerns that had been raised. So fine with me.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
