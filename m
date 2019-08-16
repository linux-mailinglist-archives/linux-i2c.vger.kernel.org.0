Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC4E902D4
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 15:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727203AbfHPNXH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 09:23:07 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35207 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727159AbfHPNXG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Aug 2019 09:23:06 -0400
Received: by mail-wr1-f65.google.com with SMTP id k2so1545710wrq.2
        for <linux-i2c@vger.kernel.org>; Fri, 16 Aug 2019 06:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=12WjHYZX+Rr3RgTHxllK3XvP8HDPsnIrAe4bhzquf8s=;
        b=WIoWZBD6D2JoEwSTde0/szg9IkhzXUDer4E6BedtiekZPlyX/Ry0y679N/DN345Gyf
         dPdgC/zehWhYSMwAaTGSjkEX+b1UhAluUCCZhtsN/DEYLSp7EnQs3fYuRVoh810eUwPd
         h1F2NS2oBUToW7qOkdsHgR2kVxI0NaTLWlUTGgnNv1yoVQ4M91ve45CX6TAkRCh8xsQW
         qsZZ5hQODWt0akaF8czRpMPmSKeC3vIhT3ZT0PphmiYs2L5u5LN+x+e1TxBudzWekPAP
         Zrm+HeZeaTRb1bJTOg+L+OFdf/DWi7qvHPHEEz6QCnMwZvSYstHSsfZyVZWYKD+aXUW5
         GAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=12WjHYZX+Rr3RgTHxllK3XvP8HDPsnIrAe4bhzquf8s=;
        b=av7sH1m2XlAlGf4klitpY/J7VyrS2gGJK/zl27MJRBZnJpYQzA78J6e4VTQ2mzU9Qa
         XiX/XGnG2U8eoLGiQW9zAdczN3ytZCGQ23uZCvea170YnSeX17wEyUeVsGJCsB4QT7SP
         r+kk5xDfjACRjHVZzEhZCly7CLkWKJaIG6BLDn7KysPaA1z62Tz7003blVHpojz4rTJC
         p64nGCNlvz3fMLzqeM1Bj8ld8HG/xg/jQGZKLeJe3a71YUpWk/NshLtuEFi2krE0nlNZ
         7wXReehERd4oLnhEnZtrByO5Z6PCzcmZ+tuXlQ3zSaME5OOtpV84Y46nOiUGot7tGOUI
         4lOg==
X-Gm-Message-State: APjAAAXbEZYHiP08y4Z0Egdytx1w6U5L2/Ygrgraepi8Ur+mhpr6Zw9a
        g/tAqG4m4Z24Eb7j+n5FA4Ts+PeCDo8=
X-Google-Smtp-Source: APXvYqzkM0LHr/n5fpf/X7qbR7SWjYj4apz+lZ78GK5SSUfzZ220eukwPCk/tu09jD7URu3ac2FNbA==
X-Received: by 2002:a5d:6742:: with SMTP id l2mr10881963wrw.70.1565961784693;
        Fri, 16 Aug 2019 06:23:04 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id c15sm18980483wrb.80.2019.08.16.06.23.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 06:23:04 -0700 (PDT)
Date:   Fri, 16 Aug 2019 15:23:03 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v1] i2c: i801: Avoid memory leak in
 check_acpi_smo88xx_device()
Message-ID: <20190816132303.hxg3ukf7herzuw6h@pali>
References: <20190816131705.77750-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190816131705.77750-1-andriy.shevchenko@linux.intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Friday 16 August 2019 16:17:05 Andy Shevchenko wrote:
> check_acpi_smo88xx_device() utilizes acpi_get_object_info() which in its turn
> allocates a buffer. User is responsible to clean allocated resources. The last
> has been missed in the original code. Fix it here.
> 
> While here, replace !ACPI_SUCCESS() with ACPI_FAILURE().
> 
> Fixes: 19b07cb4a187 ("i2c: i801: Register optional lis3lv02d I2C device on Dell machines")
> Cc: Pali Rohár <pali.rohar@gmail.com>
> Cc: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Nice catch! Thank you.

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

> ---
>  drivers/i2c/busses/i2c-i801.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 09b7e27ca97b..1e4cde64293b 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1194,19 +1194,28 @@ static acpi_status check_acpi_smo88xx_device(acpi_handle obj_handle,
>  	int i;
>  
>  	status = acpi_get_object_info(obj_handle, &info);
> -	if (!ACPI_SUCCESS(status) || !(info->valid & ACPI_VALID_HID))
> +	if (ACPI_FAILURE(status))
>  		return AE_OK;
>  
> +	if (!(info->valid & ACPI_VALID_HID))
> +		goto smo88xx_not_found;
> +
>  	hid = info->hardware_id.string;
>  	if (!hid)
> -		return AE_OK;
> +		goto smo88xx_not_found;
>  
>  	i = match_string(acpi_smo8800_ids, ARRAY_SIZE(acpi_smo8800_ids), hid);
>  	if (i < 0)
> -		return AE_OK;
> +		goto smo88xx_not_found;
> +
> +	kfree(info);
>  
>  	*((bool *)return_value) = true;
>  	return AE_CTRL_TERMINATE;
> +
> +smo88xx_not_found:
> +	kfree(info);
> +	return AE_OK;
>  }
>  
>  static bool is_dell_system_with_lis3lv02d(void)

-- 
Pali Rohár
pali.rohar@gmail.com
