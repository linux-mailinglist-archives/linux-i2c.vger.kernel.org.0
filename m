Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 149C648813D
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jan 2022 04:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233303AbiAHDsE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jan 2022 22:48:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233254AbiAHDsE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jan 2022 22:48:04 -0500
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2249C061574
        for <linux-i2c@vger.kernel.org>; Fri,  7 Jan 2022 19:48:03 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 012AD41EE3;
        Sat,  8 Jan 2022 03:47:59 +0000 (UTC)
Message-ID: <16b8e618-0040-dc68-57b3-ef347f84d25c@marcan.st>
Date:   Sat, 8 Jan 2022 12:47:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH v3] i2c: i801: Safely share SMBus with BIOS/ACPI
Content-Language: en-US
To:     Alex Henrie <alexh@vpitech.com>
Cc:     linux-i2c@vger.kernel.org, wsa@kernel.org, jdelvare@suse.de,
        alexhenrie24@gmail.com
References: <20211216173110.82ae177385322c0992d00126@vpitech.com>
 <a5da4d27-f2cc-9018-5266-9f40d74818ad@marcan.st>
 <20211217195128.49285f55facfe061655a6279@vpitech.com>
 <7fb63895-e8fb-c9c3-c5da-f922ae0c69fd@marcan.st>
 <20211220104106.e4c0e3d95145cc2f2a91c3d3@vpitech.com>
 <20220104183727.95caa694dea38a7ae5fc8c49@vpitech.com>
From:   Hector Martin <marcan@marcan.st>
In-Reply-To: <20220104183727.95caa694dea38a7ae5fc8c49@vpitech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2022/01/05 10:37, Alex Henrie wrote:
> Hi Hector,
> 
> I had an idea today that you might like better. In your proposed patch
> to share the SMBus with the BIOS, the kernel will lock itself out of
> the SMBus if the BIOS uses it unsafely. What if we add a module
> parameter to instead return -EPERM in i801_acpi_io_handler, effectively
> locking the BIOS out of the SMBus instead of locking the kernel out? I
> tried hacking that behavior in and so far it's working well on my
> troublesome machine.
> 
> -Alex
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 8020b6b97..442eef67a 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1629,6 +1629,9 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
>  	mutex_lock(&priv->acpi_lock);
>  
>  	if (!priv->acpi_reserved && i801_acpi_is_smbus_ioport(priv, address)) {
> +		mutex_unlock(&priv->acpi_lock);
> +		return -EPERM;
> +
>  		priv->acpi_reserved = true;
>  
>  		dev_warn(&pdev->dev, "BIOS is accessing SMBus registers\n");
> 

I think this makes more sense. It would be up to users to choose to
cripple whatever the BIOS does, of course (the reason why I sent this
patch in in the first place was because I needed the ACPI SMBus routines
to work on my machine to make backlight controls work).

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
