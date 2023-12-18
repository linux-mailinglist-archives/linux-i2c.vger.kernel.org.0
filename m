Return-Path: <linux-i2c+bounces-855-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 381CA8177A7
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Dec 2023 17:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07C311C23A2A
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Dec 2023 16:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0074FF7D;
	Mon, 18 Dec 2023 16:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWipHW0h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D9F1E4AD
	for <linux-i2c@vger.kernel.org>; Mon, 18 Dec 2023 16:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a2343c31c4bso210293066b.1
        for <linux-i2c@vger.kernel.org>; Mon, 18 Dec 2023 08:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702917394; x=1703522194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WkK4FgQcLbhFdJi4Jp87jPDU2b5+hBhOY6crvocMwE4=;
        b=CWipHW0hXVbjbmrI3NyapMdY74ILnvwxrh0/IKoEfvJdmhM5PgUrooWeK/+CqnlOgw
         B3ifrtsuIinMm33dx8rIeQltKOW8e2g0uYEJB/t3RXDhnjCl8oPpq77W6YYWvgjEtxOa
         qPv5YUNPhSWrXNq10cGeRFm/IlMbkV0rq5TBMsZQppHORYQOByXTtshmy4cXKSQ/MT9b
         mwY8UgY5eZsQ5kDVhYCbYiZdSZTrBDjUKQx23E3m9vNEA4XGvrlcZAGeKCIvxYF9pGIM
         Vzp9G8Jxs1poJL66/xu7C0JSZgC+qj03l7QM3Pbd1jq2fZoI8g4HDnfgureje9GhqVRz
         7E3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702917394; x=1703522194;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkK4FgQcLbhFdJi4Jp87jPDU2b5+hBhOY6crvocMwE4=;
        b=UQ+XN/owIJNDNNZFPB4r+fgaKMYjRjLgCPODMOeJ7MCQBNRAXqGMhpc0GLGEhBNxod
         zZRkODj5QcF6xpuotu0PBqwtoR8xIuazSnsgHTTiaCU5yH02ZI5hOF335S5R2FYJeapP
         OF404ngsw7rC5nAJbHc05pnCTokCLGuzJRPz9/vWN6UL07nF8IZ4dAEckCTMO9yAB2wE
         x71gxRWxaq5RSuCHaPBV9BmStYei3cYnHwBKhqmE4v04B0YoJ08Ogvrda9DoikOT30gz
         qVsBo+dQwXv0dHI/pPvTd62GtVwZXKMzRtsWi9e289NTtbdY5TMfJzpNRT+VUvVLJGyQ
         hYLQ==
X-Gm-Message-State: AOJu0YzcdIb02EuGSqCpqjOAuGcJQpzhC/oOcGxNPDs8gTfB7PFxuKpa
	LEaWp/P/oVdWWT4KvVNOIh4=
X-Google-Smtp-Source: AGHT+IHwh1eqpeTA+XLRxvh7xVKoiEuDdqY6a4eN5VHC2KmH/fds0MZK3bCEdkIKdBdXdMr+6G3QKQ==
X-Received: by 2002:a17:906:197:b0:a23:5aab:8c04 with SMTP id 23-20020a170906019700b00a235aab8c04mr545193ejb.160.1702917393792;
        Mon, 18 Dec 2023 08:36:33 -0800 (PST)
Received: from ?IPV6:2a01:c22:7744:1300:ac89:da88:4c31:cd86? (dynamic-2a01-0c22-7744-1300-ac89-da88-4c31-cd86.c22.pool.telefonica.de. [2a01:c22:7744:1300:ac89:da88:4c31:cd86])
        by smtp.googlemail.com with ESMTPSA id tl12-20020a170907c30c00b009fd585a2155sm14191537ejc.0.2023.12.18.08.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 08:36:33 -0800 (PST)
Message-ID: <5ae9cb9f-cb56-445f-903b-9b6139c11bf2@gmail.com>
Date: Mon, 18 Dec 2023 17:36:35 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] eeprom: ee1004: add support for temperature sensor
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <c295881f-77aa-4f54-b06c-d48031d76339@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <c295881f-77aa-4f54-b06c-d48031d76339@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.11.2023 12:17, Heiner Kallweit wrote:
> Jean and me are discussing how to best instantiate temperature sensors
> that can be found on RAM modules. First idea was to extend
> i2c_register_spd() but I think reading the "temp sensor present" flag
> from SPD can't be properly done from an i2c core level.
> Therefore, for DDR4, do it from the ee1004 driver.
> 
> The temp sensor i2c address can be derived from the SPD i2c address,
> so I think we can directly instantiate the device and don't have to
> probe for it.
> If the temp sensor has been instantiated already by other means
> (e.g. class-based auto-detection), then the busy-check in 
> i2c_new_client_device will detect this.
> 
> Link: https://www.spinics.net/lists/linux-i2c/msg65963.html
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/misc/eeprom/ee1004.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/misc/eeprom/ee1004.c b/drivers/misc/eeprom/ee1004.c
> index a1acd7713..4bce8f9d9 100644
> --- a/drivers/misc/eeprom/ee1004.c
> +++ b/drivers/misc/eeprom/ee1004.c
> @@ -158,6 +158,22 @@ static struct bin_attribute *ee1004_attrs[] = {
>  
>  BIN_ATTRIBUTE_GROUPS(ee1004);
>  
> +static void ee1004_probe_temp_sensor(struct i2c_client *client)
> +{
> +	struct i2c_board_info info = { .type = "jc42" };
> +	u8 byte14;
> +	int ret;
> +
> +	/* byte 14, bit 7 is set if temp sensor is present */
> +	ret = ee1004_eeprom_read(client, &byte14, 14, 1);
> +	if (ret != 1 || !(byte14 & BIT(7)))
> +		return;
> +
> +	info.addr = 0x18 | (client->addr & 7);
> +
> +	i2c_new_client_device(client->adapter, &info);
> +}
> +
>  static void ee1004_cleanup(int idx)
>  {
>  	if (--ee1004_dev_count == 0)
> @@ -204,6 +220,9 @@ static int ee1004_probe(struct i2c_client *client)
>  		err = -EOPNOTSUPP;
>  		goto err_clients;
>  	}
> +
> +	ee1004_probe_temp_sensor(client);
> +
>  	mutex_unlock(&ee1004_bus_lock);
>  
>  	dev_info(&client->dev,

Jean, do you have any feedback on this one?
Also not sure why this patch is marked "superseded" in patchwork.


