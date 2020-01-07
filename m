Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A15F132239
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 10:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgAGJ0S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 04:26:18 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37257 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgAGJ0S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 04:26:18 -0500
Received: by mail-wm1-f65.google.com with SMTP id f129so18540187wmf.2
        for <linux-i2c@vger.kernel.org>; Tue, 07 Jan 2020 01:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bingham-xyz.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v/rtF6ISjcdgqtOikIlxzqttA5C9gU1CMvRuZozFK/E=;
        b=UhYIEJ/xN8VjnYaPAgMHddWY0y/+ptTikwDE89aG22GmtvGBCIdAO1ykcNo/gXrY9m
         ohgg3ametVmSUdpZPqpNEypL0yPG4M08v265JRZeZ7CYLo8bVx1kfqwEHXQ6PKme5D7M
         Ssh3NkHmP8gSSaAv/Bcy1KE1RIGh06mfRYlw5+CYjfIapmgO4NnWhsoRBtBbOBFAv3VP
         FqwhhA6NIXSGEWW5ADn4uN6DONGm2GJxEUz6T83rMXwbrC8KY+sDPaSKqZBKzbKoVDq5
         JGFScEeP8Ior8YDv4lUsqnsonx8oZYSZrluwkCxAra1NoefVZ9nMz8xkrt9Ar61ANlt4
         2hvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=v/rtF6ISjcdgqtOikIlxzqttA5C9gU1CMvRuZozFK/E=;
        b=XL8T9HqnkQrEXiyljPgvY2+94xqABQWUf6xoFjTn4ekwMNLNcfvt8nZDfxISsS7GkL
         zPhLuLGQmLA6nwrhUbwQeNKE3EocKg3a+vIS8N1g8W7Y0IGnbS8Ax3UWqusGSiR1ghpk
         dotSZWJmwfjjoq5OVxXaL9Wy/tDB3HMJgF08PXTbTJ92EAddkIPaUzP3Ms2j1eNdY58X
         TB9NLNZPlYSg6bbseT8Gx1cNOOL5CELp5H6bvptnhOiUYMvfdxVbXyUu1Whal75HsCdA
         SGr0RMmbD9vy7ftNZg81jMqjt26o6oBEX9ioqFnYuuGPF8TwrxZbcC8vY2uoBPWlko4H
         VkQA==
X-Gm-Message-State: APjAAAXKL/SGSLmPscqwQq6wxc5BfGW2E4XDVOlPgk9l6n+yXsz+WGrp
        6PJ0a8LpZmQW2s1hQZ+WqJ4l4w==
X-Google-Smtp-Source: APXvYqwymYtKwJZ4Lhn0IV1mYpht8GFk4tDbE8osnAJ/vZs3Vr4S1yL3HlpFvNgQDtHM6AuXLjxiwQ==
X-Received: by 2002:a7b:c946:: with SMTP id i6mr38484852wml.28.1578389174564;
        Tue, 07 Jan 2020 01:26:14 -0800 (PST)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net. [86.31.129.233])
        by smtp.gmail.com with ESMTPSA id m7sm25806784wma.39.2020.01.07.01.26.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jan 2020 01:26:13 -0800 (PST)
Subject: Re: [RFC PATCH 1/5] i2c: core: refactor scanning for a client
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-2-wsa+renesas@sang-engineering.com>
From:   Kieran Bingham <kieran@ksquared.org.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran@bingham.xyz; keydata=
 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
 QglrIkyNWSZm4Hhw98VxYDwOwmYhoXmAFg==
Message-ID: <bf17ebe6-550e-dcd2-c5c4-ff669519ef79@bingham.xyz>
Date:   Tue, 7 Jan 2020 09:26:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191231161400.1688-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 31/12/2019 16:13, Wolfram Sang wrote:
> There is a pattern to check for existence of a client which is copied in
> i2c_detect_address() and i2c_new_scanned_device():
> 
> 1) check if address is valid
> 2) check if address is already registered
> 3) send a message and check the reponse

s/reponse/response/
   (My email client highlights spelling issues, sorry :-D)


> Because this pattern will be needed a third time soon, refactor it into
> its own function.

This looks reasonable to me, I see Laurent has a concern over the use of
a WARN to present a backtrace, but I think in this instance it will be
useful as it will facilitate identifying what code path provided the
incorrect address.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/i2c-core-base.c | 57 ++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index a1eb28a3cc54..20a726dc78db 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -2108,29 +2108,39 @@ static int i2c_default_probe(struct i2c_adapter *adap, unsigned short addr)
>  	return err >= 0;
>  }
>  
> -static int i2c_detect_address(struct i2c_client *temp_client,
> -			      struct i2c_driver *driver)
> +static int i2c_scan_for_client(struct i2c_adapter *adap, unsigned short addr,
> +			    int (*probe)(struct i2c_adapter *adap, unsigned short addr))
>  {
> -	struct i2c_board_info info;
> -	struct i2c_adapter *adapter = temp_client->adapter;
> -	int addr = temp_client->addr;
>  	int err;
>  
>  	/* Make sure the address is valid */
>  	err = i2c_check_7bit_addr_validity_strict(addr);
> -	if (err) {
> -		dev_warn(&adapter->dev, "Invalid probe address 0x%02x\n",
> -			 addr);
> +	if (WARN(err, "Invalid probe address 0x%02x\n", addr))
>  		return err;
> -	}
>  
>  	/* Skip if already in use (7 bit, no need to encode flags) */
> -	if (i2c_check_addr_busy(adapter, addr))
> -		return 0;
> +	if (i2c_check_addr_busy(adap, addr))
> +		return -EBUSY;
>  
>  	/* Make sure there is something at this address */
> -	if (!i2c_default_probe(adapter, addr))
> -		return 0;
> +	if (!probe(adap, addr))
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static int i2c_detect_address(struct i2c_client *temp_client,
> +			      struct i2c_driver *driver)
> +{
> +	struct i2c_board_info info;
> +	struct i2c_adapter *adapter = temp_client->adapter;
> +	int addr = temp_client->addr;
> +	int err;
> +
> +	/* Only report broken addresses, busy addresses are no error */
> +	err = i2c_scan_for_client(adapter, addr, i2c_default_probe);
> +	if (err < 0)
> +		return err == -EINVAL ? -EINVAL : 0;
>  
>  	/* Finally call the custom detection function */
>  	memset(&info, 0, sizeof(struct i2c_board_info));
> @@ -2232,26 +2242,9 @@ i2c_new_scanned_device(struct i2c_adapter *adap,
>  	if (!probe)
>  		probe = i2c_default_probe;
>  
> -	for (i = 0; addr_list[i] != I2C_CLIENT_END; i++) {
> -		/* Check address validity */
> -		if (i2c_check_7bit_addr_validity_strict(addr_list[i]) < 0) {
> -			dev_warn(&adap->dev, "Invalid 7-bit address 0x%02x\n",
> -				 addr_list[i]);
> -			continue;
> -		}
> -
> -		/* Check address availability (7 bit, no need to encode flags) */
> -		if (i2c_check_addr_busy(adap, addr_list[i])) {
> -			dev_dbg(&adap->dev,
> -				"Address 0x%02x already in use, not probing\n",
> -				addr_list[i]);
> -			continue;
> -		}
> -
> -		/* Test address responsiveness */
> -		if (probe(adap, addr_list[i]))
> +	for (i = 0; addr_list[i] != I2C_CLIENT_END; i++)
> +		if (i2c_scan_for_client(adap, addr_list[i], probe) == 0)
>  			break;
> -	}
>  
>  	if (addr_list[i] == I2C_CLIENT_END) {
>  		dev_dbg(&adap->dev, "Probing failed, no device found\n");
> 

