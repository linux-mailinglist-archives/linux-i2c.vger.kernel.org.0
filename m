Return-Path: <linux-i2c+bounces-453-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F16D7F928D
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 13:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F4C52810E9
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 12:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D73CA78;
	Sun, 26 Nov 2023 12:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRfPNDE5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6459C;
	Sun, 26 Nov 2023 04:18:53 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40839652b97so22224685e9.3;
        Sun, 26 Nov 2023 04:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701001132; x=1701605932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fq7dC2Z5ePegGE/m91H74oxk/74+QrTnRyFTk/SdOGE=;
        b=nRfPNDE57w7Wufs5QeZnfN/3SYIcF8stQGE6fhH/y9mclTu2hft/fQxLt3NcV8Q8zZ
         IxclDFXlfVJXG0dkJzfksbcI2csx4D0FVOQ5QaFf7eMYrWVLmHNlfOTO8gesjEEWckOw
         bih0QGsSLuvU1YC8LeI3YDGlCajJKl5qSq244rd7afpnpBakdoCmcFciAyIotMTraXrO
         H/9i+VpsGhRmfZK95MCN6PwBp1nfUWtIVu5p2di7D92eb8+O91bobWILAS15qXqaIiNV
         GFHUvES9SIJr3fbCoq4a4ATl2cvFl9XzybGIiC1AXaacyyG/F7KHZg+qUALIaub9Q3C4
         +XBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701001132; x=1701605932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fq7dC2Z5ePegGE/m91H74oxk/74+QrTnRyFTk/SdOGE=;
        b=qNQpfFdwHsV2AcGCnSGdHZWTF4ozGg8m7bJGhvUK5VwBHZ/pzr3A+JhqIsIpsSvtqB
         mCh9ing0EcCdJDtD2ur7lLz0tzewoHiDmsgDu13thJk2bNYh3J1EpZaYWP3dBMLWhizB
         duzpx1cWOmhZFebI2bq149Mumg57mfu66gbVfjVWaeyYU6++hTWsw8nusoD+cklTR/vz
         oppJ53wkbIbVbAZsYRZbCH0U3KM9A/fMjyHX//Ntd2Y41VVRlvzHkP7s9chXnrDW58p5
         8DWznha/W0XnIF1kXRCT2iQmBs1gzgYYiHDbaExagOl1A6Hhopas+tDR78+2FBwfy1SJ
         vOOg==
X-Gm-Message-State: AOJu0YwdoOX91CWY9s+C2iL/uLGcjQjLETmmCtiVFea+8BeigO4NBJE8
	lfUZD74HvLscThwr1nrsXomnEkI0dHE=
X-Google-Smtp-Source: AGHT+IGO8LDSOlJg3UekamZkpPr0+okVb88Um3byeGiM8a3G0JSiKbksJpPdNHHTRx5yVIEJ6crMog==
X-Received: by 2002:a05:600c:314c:b0:404:72fe:ed5c with SMTP id h12-20020a05600c314c00b0040472feed5cmr5956333wmo.29.1701001131751;
        Sun, 26 Nov 2023 04:18:51 -0800 (PST)
Received: from ?IPV6:2a01:c23:c42d:f800:9d4a:26da:56c3:eb86? (dynamic-2a01-0c23-c42d-f800-9d4a-26da-56c3-eb86.c23.pool.telefonica.de. [2a01:c23:c42d:f800:9d4a:26da:56c3:eb86])
        by smtp.googlemail.com with ESMTPSA id m21-20020a056000181500b00332f82265b8sm2961340wrh.4.2023.11.26.04.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 04:18:51 -0800 (PST)
Message-ID: <aa9b9945-aba4-4cb1-8089-3f572f00df9b@gmail.com>
Date: Sun, 26 Nov 2023 13:18:52 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] i2c: scx200_acb: Don't let i2c adapters declare
 I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Content-Language: en-US
To: jim.cromie@gmail.com
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org
References: <20231124101619.6470-1-hkallweit1@gmail.com>
 <20231124101619.6470-11-hkallweit1@gmail.com>
 <CAJfuBxw4=Aku32yx3e0zbTCARSo9r1ST71UoaC-Dp3K3_m44jQ@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <CAJfuBxw4=Aku32yx3e0zbTCARSo9r1ST71UoaC-Dp3K3_m44jQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2023 07:03, jim.cromie@gmail.com wrote:
> On Fri, Nov 24, 2023 at 3:16 AM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> After removal of the legacy eeprom driver the only remaining I2C
>> client device driver supporting I2C_CLASS_SPD is jc42. Because this
>> driver also supports I2C_CLASS_HWMON, adapters don't have to
>> declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
>> It's one step towards getting rid of I2C_CLASS_SPD mid-term.
>>
>> Series was created supported by Coccinelle and its splitpatch.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>
> 
> Acked:
> 
Thanks. Could you please respond with a proper Acked-by tag so that patchwork
can pick it up?

> 
>> ---
>>  drivers/i2c/busses/scx200_acb.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/scx200_acb.c b/drivers/i2c/busses/scx200_acb.c
>> index 83c1db610..3648382b8 100644
>> --- a/drivers/i2c/busses/scx200_acb.c
>> +++ b/drivers/i2c/busses/scx200_acb.c
>> @@ -427,7 +427,7 @@ static struct scx200_acb_iface *scx200_create_iface(const char *text,
>>         snprintf(adapter->name, sizeof(adapter->name), "%s ACB%d", text, index);
>>         adapter->owner = THIS_MODULE;
>>         adapter->algo = &scx200_acb_algorithm;
>> -       adapter->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
>> +       adapter->class = I2C_CLASS_HWMON;
>>         adapter->dev.parent = dev;
>>
>>         mutex_init(&iface->mutex);
>>


