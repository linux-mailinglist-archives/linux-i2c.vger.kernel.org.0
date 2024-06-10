Return-Path: <linux-i2c+bounces-3959-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B459026A1
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 18:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC224B237B6
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 16:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46C4143734;
	Mon, 10 Jun 2024 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKyogNdx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF3982495;
	Mon, 10 Jun 2024 16:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718036603; cv=none; b=HfMb4zFz7wJV6+9tP4p+1azu3qOTtuIJLMdyuUOmtlos5AsZbmBpAcM/Mkk3KIoRFpCLQH9NGgYDzyDQqoYQvqTOZD/wdyVop9MkYSM5NvwanT0SSuaD6AkN8RUx/kwIVqCUwpDHm5beu5jvcK4er5/DkeTlgqAFdtNB1H97hE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718036603; c=relaxed/simple;
	bh=xxxwDL1VhagEgWqEC94FMiAapAmQyT105SOPUo8n98I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GKw78jJRmpQTrKD5HTgs/0eL3rt8XH9I22K+wT5I8o35/jmBEDpLPFvFk0pfeu4HQP+xOwdH/siGh67KigUhBvbwXa1DJYo9NcX+zIhn8tx//tffWCrc02zUw/j7GlsTZvqaIxxR+lLQoamJEqdf8il1Y8g2tZzQGzJrDKTccX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKyogNdx; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ff6fe215c6so3997900b3a.3;
        Mon, 10 Jun 2024 09:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718036601; x=1718641401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oL/ZBT9csiX0Fm2nxo5GzFgdOzvJwnHo2NeNg9h2dGg=;
        b=hKyogNdx5r+8/sgPrJNg6vGDQjyLcODoNuPwL/2LaHDwGTb+pVmRqvl/mJxcky3Oy+
         cIZ/rEArYu2qTZ6mQHvAKhO+ww3TZRJuJeqM/vKdcjRYx4+XFCDYB+SItW+gr8V5q2bv
         9b/4+g0if4T38S8u35WhvKAFf8fsPjlTvTjWI5le1HdP4JESbL4RLCMJvad5iEfH0O4Q
         fAhPfiZDwBfKaSZkt9tkTT48h6+g05StyNbCERZXOV87Ds3CkmAWn9MUqgy/qe9Rco0v
         UvwqdlWqXJluSMM4BOy+Omsvff3pJTzdkcwoOe8UBH8UN9LkPU34mhWYK4fCqwMi8JC0
         D3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718036601; x=1718641401;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oL/ZBT9csiX0Fm2nxo5GzFgdOzvJwnHo2NeNg9h2dGg=;
        b=ZdKarl1+NwMH99RrEgDD3709hBtSRXEqWzga7dR1iU30zddMWlyjf9RDea+TfeMoCz
         A37K1v7p+gaJZYDyWODO9b9vsJEwdOitctsVA3pNwqPpDk4tHVYOgoJOiAnUTO0fXNIE
         VZDULsf0RUjlP/v2GGzp3VoSKb1y+ww7WY9lijZLM3CdaRq690gOfO5v316UXCAHw0fg
         2W42DNMo0Ph/n8VZyZu6EXBkTWOXEK0ytV94CvJShLtKzoO3t2lbawyAeJfLe526A2tY
         mebFgJNLyUVaFF0UFln8kflx5p9GxGWl1JArTBF0iBbAjVAe0Hnt9wHidNpHMC0+ES2f
         T6/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5zEcS/hgXiIDmvD6kCIQIUKeK1zDZO0Xy75uHAqkEQsTA8DhwWNnuXkCHG7rmECdjWPk0AuDLQGFFUkYWFf8m/Poh4PaNZXERT6xau5+s/eZm9RV3uDm1VDbPGk1BhWJs8D36z37OuJ4sO7/H813xMAlD4JIf19w/NZaTK1huYLDPzNcGVd8dRva0PAAQibm1okE2XdKzc2pg1QeYgcnYeiPmQ4B2GTpTgfeKZ7139mx/L4Gb4+YXvnFu
X-Gm-Message-State: AOJu0YwuKfXb60pAZno24vpwXBnd3ag/xv/SzEJ7dLHVF8wrXx1N78O1
	tYba5Qon3atuXO3sz1/3L4NG4P6IiIcJUZ5tLUexH1Dw3ZxDv8go
X-Google-Smtp-Source: AGHT+IEpfugtCmqnolrSDWFn6mD7tthrk1U/6t8OeTiLrRnmPGdiOT6KR48Kjbtqp3vsTpQlnZObVA==
X-Received: by 2002:a05:6a21:33a5:b0:1b4:2011:d694 with SMTP id adf61e73a8af0-1b42011d7a7mr10534979637.29.1718036601345;
        Mon, 10 Jun 2024 09:23:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e2b38167a2sm4851815a12.90.2024.06.10.09.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 09:23:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6e966bb8-5ef2-448d-b6bd-c1012509a2cc@roeck-us.net>
Date: Mon, 10 Jun 2024 09:23:18 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4,2/2] hwmon: add MP2891 driver
To: Noah Wang <noahwang.wang@outlook.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, jdelvare@suse.com
Cc: corbet@lwn.net, Delphine_CC_Chiu@Wiwynn.com, peteryin.openbmc@gmail.com,
 javier.carrasco.cruz@gmail.com, patrick.rudolph@9elements.com,
 luca.ceresoli@bootlin.com, chou.cosmo@gmail.com, bhelgaas@google.com,
 lukas@wunner.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20240603105306.180874-1-noahwang.wang@outlook.com>
 <KL1PR0401MB64911C4D68B4361C9EA97422FAFF2@KL1PR0401MB6491.apcprd04.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <KL1PR0401MB64911C4D68B4361C9EA97422FAFF2@KL1PR0401MB6491.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/24 03:53, Noah Wang wrote:
> Add support for MPS VR controller mp2891. This driver exposes
> telemetry and limit value readings and writtings.
> 
> Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
> ---
[ ... ]

> +
> +static int mp2891_identify(struct i2c_client *client, struct pmbus_driver_info *info)
> +{
> +	int ret;
> +
> +	/* Identify vout scale for rail 1. */
> +	ret = mp2891_identify_vout_scale(client, info, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Identify vout scale for rail 2. */
> +	ret = mp2891_identify_vout_scale(client, info, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Identify iout scale for rail 1. */
> +	ret = mp2891_identify_iout_scale(client, info, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Identify iout scale for rail 2. */
> +	ret = mp2891_identify_iout_scale(client, info, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	return ret;

	return mp2891_identify_iout_scale(...);

Guenter


