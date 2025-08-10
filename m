Return-Path: <linux-i2c+bounces-12201-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67347B1F974
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 11:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D774F7A857E
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 09:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF20236A9C;
	Sun, 10 Aug 2025 09:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0uftgnK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DA01CBA18;
	Sun, 10 Aug 2025 09:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754817022; cv=none; b=Q3ZbWYjWu2axlKkxO03WslVEO7Oo01al1uXfe0HjtGiCYwWTVe7Mch2Jq5I5VKu0Rx7Pavw1dECgZw619j5MkDnAYRU/u9/7alvaFmlOf47P+7jxFFEOIaMDGaOflZJgSsxcLETM03S20kY6uJPH3/pE3LpPMBpdADUhEyJ95Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754817022; c=relaxed/simple;
	bh=AarUpmoqBH0VjpicWfUBDo75sYZonSW04kSonv2nz38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CAMbJ9LPDbMGS49289qaNdzXB+YGX43+DwXXy6jHGpof+Eny0QAklQOe00i1KExEtXGGA0YMkCkVnzqiU1FB9RGkS6vS7JfFhybvRQGovmAv9g7tMt3cPNJrhhZwpfLeVCqHE4sGR1y/y4j4nDO5VMKllnS+tbGwHr5EnzDavAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0uftgnK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso22267815e9.2;
        Sun, 10 Aug 2025 02:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754817017; x=1755421817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WvZTBUTJuWW1WaJXGc+vnqzxzvAXh3a0z05/pfxtXiA=;
        b=U0uftgnKdwJ1CgvW+YM/vtcHynV/6pd3BkHiqYclvPFsz+o21y77CqHaeApAc5QYQV
         NBpucHWDMqzTIrPD7MWsoDLyGHgdEu+elJCgLcfBZYFYl2zPzX+WIV5/+vcfmi4xjkp5
         Kt7MiiDSwaOm3seV/kFJssO5bjuopDJPXhQanwznLUQFI9P3QDSoTbAt2akaYvfqzFJ8
         nIatqt6F19nkfh+7KHYM1dXDX1RyYOmCWmar7H7CWIcOkotAJdILWcKimrsGdYcp5jUk
         CDfhCdEK3ej03sbibTZ4Cas6LcLOhcjg53uh9qZo4/z4IQPYqBUPurRQZf0p4F6YiLhE
         gl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754817017; x=1755421817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WvZTBUTJuWW1WaJXGc+vnqzxzvAXh3a0z05/pfxtXiA=;
        b=siIkatgnEHdLhyJM9upni66ASzHbzKi9HVGuJZU0HwzHHAxaf4xOVFlHSEzdHAfi+o
         HZrX/FVGr1sQfbpKpmTI9UnN18ZxEmhOfW/iRxX5pZmjIGqMWUGMOXc2Erc1WJHrKd6U
         SguQBRCP3YsGxICR6buyh29TKJsq9RlgcVfaaBXIDLL2CRk8UngDUAY8a6oowv72W5VV
         JHkPFBxcn/MqcaFXFutWvmR/vveMFCFNYGzdErejasLphZrEbchYmg7dhFTSBnh+fSGx
         j9Pi7XJZUghIl9Hqtn6wDvtEMGAXRFSuBTDHFmuTmT0AXm0008FPttk750JuLBjVXq+y
         g4LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUjaP6vimoDTTO4YYLpJaIQRjmvqnAWIVCDmoLBFx7L15TrFwoVXycmOr6beOkKEY3YVi+fgOlW3KP@vger.kernel.org, AJvYcCXmdWkJyzzxrNMsZJ3LJrmF92UEiaoJrWQ6QrhKnV68nsQcEJ0CbsDGFVwZ1bRTybKXeQghrjnz6paJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyoFSak81AFSb7Y9L48TARGY8dwmhwxZdkeVm+2n/WF0WzIGq/S
	JRDpTBirZWheHZDtEHkF3B5PheKShDzHfxkBd8Y5FI8kpxZAVr7wI4JSDOz4Jw==
X-Gm-Gg: ASbGncsdNlyIj2StrSHeFZ9pQqutcee6BXJ/Q7Q7jF1SsslkibL8JrATpSFb2yReO8K
	KLNWO3L3O3ioLZJZDezFe6EkKU1NSHfZpIiTlm4n/I1ez6bUYEOjtJqjrIJfbOBDAboF3IgBQ1r
	6ld2fgCZd2Z9aPKeWZsoQv7dktBeWml5mMuG8rRIK9RXCKR20JR6w8GuAhazp1P/rSQFMXgsvpD
	ynlJ7B1PeDrn8wATPYNJVVnrkDVKxSbVLfSKB0Yd6L3ioug/lfmvR1vDRc+3lvXBf2K/fsqeXbS
	cyyVGVhhFahETziky3kqOcbfXiq3543gbvutom0kTb0t+cDdS/wZmqD6SjG2KaJxrh0uZtaxaTz
	QTEZIf+GTWmYq8g/olpFPp/cgER0/vbr3anXxHkEhqMOkfceUNp7+JqOjI/ElvQRz2kwdtX8Y0F
	Es9RD4vGUsJo+h3DfXn6NZsmA9C89ioAkH
X-Google-Smtp-Source: AGHT+IEI39Qe0sPacI0gnFG0jDx8f2VGWrXmRDWrdvWPyCAqwFKtJHGu0UEBwNgIX4mRIqCYJQCItQ==
X-Received: by 2002:a05:600c:c0d2:10b0:459:ea5d:418b with SMTP id 5b1f17b1804b1-459f4eb3fcemr48468855e9.9.1754817016582;
        Sun, 10 Aug 2025 02:10:16 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f12c:bb32:3d75:9109:b5a7:a261? ([2001:9e8:f12c:bb32:3d75:9109:b5a7:a261])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8ff860acbsm10209684f8f.51.2025.08.10.02.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Aug 2025 02:10:16 -0700 (PDT)
Message-ID: <97ff6fe9-0dfc-4116-99a0-7efcdd16f8dc@gmail.com>
Date: Sun, 10 Aug 2025 11:10:15 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] i2c: rtl9300: move setting SCL frequency to
 config_io
Content-Language: en-GB
To: Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Harshal Gohel <hg@simonwunderlich.de>,
 Markus Stockhausen <markus.stockhausen@gmx.de>,
 Sven Eckelmann <sven@narfation.org>
References: <20250809220713.1038947-8-jelonek.jonas@gmail.com>
 <9a1616dc-34b2-42fd-8f64-9d46fa3bb92f@web.de>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <9a1616dc-34b2-42fd-8f64-9d46fa3bb92f@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10.08.2025 10:49, Markus Elfring wrote:
> …
>> +++ b/drivers/i2c/busses/i2c-rtl9300.c
> …
>> +static int mshv_vtl_sint_ioctl_set_eventfd(struct mshv_vtl_set_eventfd __user *arg)
>> +{
> …
>> @@ -244,7 +245,7 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
>>  
>>  	mutex_lock(&i2c->lock);
>>  	if (chan->sda_num != i2c->sda_num) {
>> -		ret = rtl9300_i2c_config_io(i2c, chan->sda_pin);
>> +		ret = rtl9300_i2c_config_io(i2c, chan);
>>  		if (ret)
>>  			goto out_unlock;
> …
>
> Under which circumstances would you become interested to apply a statement
> like “guard(mutex)(&i2c->lock);”?
> https://elixir.bootlin.com/linux/v6.16/source/include/linux/mutex.h#L225

Didn't know about that before but no objections against it. Can integrate that
in the next version.

The link Sven posted was quite helpful on that, thanks! This looks quite similar
to how it is in Rust, that you just lock/guard it and it is dropped at the end of
the current scope. I like that :)

> Regards,
> Markus

Best regards,
Jonas

