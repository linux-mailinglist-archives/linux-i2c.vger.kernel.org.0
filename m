Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20F493E16D5
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 16:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240556AbhHEOX0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 10:23:26 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:49890 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233428AbhHEOXZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Aug 2021 10:23:25 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 0E1F51FD3A;
        Thu,  5 Aug 2021 14:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1628173391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SPrLQmDrYvFZ5eeY3ciw6mMJMqppjs8uy28f0mWTPKs=;
        b=Y50xx53silHXZIpzXnMFQLtUL0dTTNO0wk76GNEoKa8DEFydBVX1F/ZTGhj4W/EGXPWsM6
        g5VsB85iyOosiuUXciHKi2yL3SVi0H/c3fMe3/zj7VCj9zdcsgcH6JSjWoaKnjDfn//I9b
        ImQxlPUrZzqm3KuIdnGZpTanycaqYgg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1628173391;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SPrLQmDrYvFZ5eeY3ciw6mMJMqppjs8uy28f0mWTPKs=;
        b=TaZK3LOqaezXffDwJ+hnPSxixJlU0+XYJtoZkxxrCw77gKiYZbeQIW9HLI/8+uBf+FOa88
        oa5w3QWAr/RLsfBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D713413A4D;
        Thu,  5 Aug 2021 14:23:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id n/tzMU70C2HAQQAAGKfGzw
        (envelope-from <jdelvare@suse.de>); Thu, 05 Aug 2021 14:23:10 +0000
Date:   Thu, 5 Aug 2021 16:23:09 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 09/10] i2c: i801: Improve
 register_dell_lis3lv02d_i2c_device
Message-ID: <20210805162309.14dbaf63@endymion>
In-Reply-To: <5d8e72e2-085b-32ea-0a86-eeecfe1e94f3@gmail.com>
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
        <5d8e72e2-085b-32ea-0a86-eeecfe1e94f3@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 01 Aug 2021 16:23:34 +0200, Heiner Kallweit wrote:
> - Use an initializer for struct i2c_board_info info
> - Use dmi_match()
> - Simplify loop logic
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 958b2e14b..1ca92a1e0 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1245,28 +1245,18 @@ static const struct {
>  
>  static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
>  {
> -	struct i2c_board_info info;
> -	const char *dmi_product_name;
> +	struct i2c_board_info info = { .type = "lis3lv02d" };

Can it be moved to the inner loop where it is used, so that
initialization only takes place when needed? I don't know how the
compiler handles that, to be honest.

>  	int i;
>  
> -	dmi_product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
> -	for (i = 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i) {
> -		if (strcmp(dmi_product_name,
> -			   dell_lis3lv02d_devices[i].dmi_product_name) == 0)
> -			break;
> -	}
> -
> -	if (i == ARRAY_SIZE(dell_lis3lv02d_devices)) {
> -		dev_warn(&priv->pci_dev->dev,
> -			 "Accelerometer lis3lv02d is present on SMBus but its"
> -			 " address is unknown, skipping registration\n");
> -		return;
> -	}
> +	for (i = 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i)

Outer block without curly braces is discouraged for readability and
maintenance reasons (see Documentation/process/coding-style.rst section
3).

> +		if (dmi_match(DMI_PRODUCT_NAME, dell_lis3lv02d_devices[i].dmi_product_name)) {

This causes dmi_get_system_info(DMI_PRODUCT_NAME) to be called for
every iteration of the loop, slowing down the lookup. It's an exported
function so it can't be inlined by the compiler. I know this happens
only once, but we try to keep boot times as short as possible.

> +			info.addr = dell_lis3lv02d_devices[i].i2c_addr;
> +			i2c_new_client_device(&priv->adapter, &info);
> +			return;
> +		}
>  
> -	memset(&info, 0, sizeof(struct i2c_board_info));
> -	info.addr = dell_lis3lv02d_devices[i].i2c_addr;
> -	strlcpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
> -	i2c_new_client_device(&priv->adapter, &info);
> +	pci_warn(priv->pci_dev,
> +		 "Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration\n");
>  }
>  
>  /* Register optional slaves */


-- 
Jean Delvare
SUSE L3 Support
