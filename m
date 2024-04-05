Return-Path: <linux-i2c+bounces-2769-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD40A8994D7
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 07:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BACB1F226DC
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 05:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4085D21A1C;
	Fri,  5 Apr 2024 05:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J51kVWNX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F9528E2
	for <linux-i2c@vger.kernel.org>; Fri,  5 Apr 2024 05:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712296647; cv=none; b=Vb7sAjOgDn4+dfasxAXEuSroI8dd1+zPQBOcMGojHAmknNN6eqJGD0aIRHi9i3DjgqbmiFij0zoLOZrucWMRJGIX8PvsmuFWP8swK+JR/8Fi2QMCMQOa8rdh4nb3Ab0gm8kKsb+Do0fgvpzvwSMW036nSe6ulejRvyjOla5wriU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712296647; c=relaxed/simple;
	bh=oqJa033AHhcameFbJPXh+1l/zp7LC9VF7zYgON64eHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z4SHbpo/b3FQH41MaizKHSHgnu2ETYOXM8kWEggB8jBAOvVanI3nfND4866l7EZo9RfBtOih37gaIMCSus/Xqy+aKwkGJbIOV6NDFci0c9+3l1IOJSAfEUWsFA4mlcaOE8noxq1hRRwHm/X9jVnjmdrA7UwuQalvaZsf5Ah5MOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J51kVWNX; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56c404da0ebso2691699a12.0
        for <linux-i2c@vger.kernel.org>; Thu, 04 Apr 2024 22:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712296644; x=1712901444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zxr6lBfBPbgVArswocA61dd5bHGRLLlZvavnKDdnvvI=;
        b=J51kVWNXPRjVNxc8w6Fyd+YOEpMx6yRiW011tclQyteFn8aIOReixMUUc6yyH2eQNY
         teOXpmn/XfpYXNXgZQqgCmF4LFDnpWTtdsjU90UPvl18iKaIpMoR54JazFtc+3l30rgk
         s6IQNWItUwSzea/9O85RKpfuFxWAjmVnq+rHSR9o3a/ri6iSJwSLq1M4oon9AA519r9f
         NDqgW6K3a8ukxgDpgMX0mTw+zKC4iRW/Ab0lGFqTDpXBkawR9/7WNbObyU7vpIw6i7J6
         6rppTD7ADeu06/8JjCjoFoE/L8SGIWYwy6hbfQ7/JXQ+1JyAtNRrYnis41q89idDMF/h
         KimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712296644; x=1712901444;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxr6lBfBPbgVArswocA61dd5bHGRLLlZvavnKDdnvvI=;
        b=h3en+bCtvh9zoFjUbdWp5yHc1kpCPQCnrjTXJ2maYWP09eM+2OJY7fWEkHQE7cVKM4
         xrgUb/u+RqAeqI0R8KgE2OQtQzs7Cbc6GI3Eu8/Jma0ToPAFuYF0frlhES4kPENpBZQP
         hRJ5OkVEpk2LM300EsoTib7i+j2CO2HlK1NLa0nBzi8qX5fCkGDI4eNUKxUuEx68HxCW
         /kIq2kvo0IKshCgo4BjDjR8ubMDVXNy+ZxOGccqQ87jmnE5XJtwHowrftAhzq2ZemOcj
         lKmCIHltPQRQobqTC4X1/gZe1UR+WTN9H2pCtDuXKK1Oukq+z/pIajzyBdh9NlTqlg0g
         WDkA==
X-Forwarded-Encrypted: i=1; AJvYcCVVVzrmaGEwHWdLYIjvpQOmsyK14kiNWWY3I/YuO971Ehb8ETsZxf6UAKJNswWF8hUGoMeQ5U/0GPesjRfBeE+uL3nas9S5Fg3c
X-Gm-Message-State: AOJu0YyFrTORuugvfHOKBTZUHV55opNfvNly5zr6Zn11qfWDmHSpgVPO
	Wg7YDSHJVYIg/fPb+Vqhk9yBewx3Ci0GHW6hzfxjR8guDpiuE50gCRTM4w0W
X-Google-Smtp-Source: AGHT+IEIO5owW3KM0YD8aJWadIjEploS5itRPPjF+COfalOs8TqMMx3peivPxMM0NLCpRN4Bpoqpzg==
X-Received: by 2002:a17:907:7243:b0:a3f:1b49:c92b with SMTP id ds3-20020a170907724300b00a3f1b49c92bmr431055ejc.48.1712296643447;
        Thu, 04 Apr 2024 22:57:23 -0700 (PDT)
Received: from ?IPV6:2a01:c22:72bb:b200:29bd:ea8c:77cf:edc8? (dynamic-2a01-0c22-72bb-b200-29bd-ea8c-77cf-edc8.c22.pool.telefonica.de. [2a01:c22:72bb:b200:29bd:ea8c:77cf:edc8])
        by smtp.googlemail.com with ESMTPSA id ov7-20020a170906fc0700b00a4e44f724e8sm442467ejb.186.2024.04.04.22.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 22:57:23 -0700 (PDT)
Message-ID: <b31f445a-6f9b-47ed-94eb-b80360846625@gmail.com>
Date: Fri, 5 Apr 2024 07:57:24 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: i801: Fix missing Kconfig dependency
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5b43041f-4f97-41dc-87fb-c2da425e7654@gmail.com>
 <4dhfyaefnw2rtx5q7aaum6pfwha5o3vs65iqcrj2ghps34ubtw@b3bw3gggudjs>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <4dhfyaefnw2rtx5q7aaum6pfwha5o3vs65iqcrj2ghps34ubtw@b3bw3gggudjs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 02:54, Andi Shyti wrote:
> Hi Heiner,
> 
> first of all, thanks for the fast reaction!
> 
> On Thu, Apr 04, 2024 at 10:09:50PM +0200, Heiner Kallweit wrote:
>> The original change adds usage of i2c_root_adapter(), which is
>> implemented in i2c-mux.c. Therefore we can't use the multiplexing
>> if I2C_I801=y and I2C_MUX=m.
> 
> What is wrong with select I2C_MUX?
> 
It would solve the issue, but:
We would uselessly enable I2C_MUX also if I2C_MUX_GPIO or DMI are disabled.
W/o them the mux part in i801 is a no-op. The call to i2c_root_adapter()
is in a conditionally compiled code part, controlled by:

#if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI

> And is this covering all the cases?
> 
yes

> Last thing, how have you tested and reproduced the issue?
> 
The CI bot report included a link to the kernel config. So it was easy
to understand the root cause of the issue. I could reproduce it by setting:
I2C_I801=y
I2C_MUX=m
I2C_MUX_GPIO=m
This config was also used to test the fix.

Underlying reason for the issue is that i801 has a code dependency on i2c_mux,
but not on i2c_mux_gpio.

> Thanks,
> Andi
> 
Heiner

>> Handling the dependencies in the code would become unnecessarily
>> complex, therefore create a new config symbol.
>>
>> Fixes: 71b494e043d2 ("i2c: i801: Call i2c_register_spd for muxed child segments")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202404042206.MjAQC32x-lkp@intel.com/
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>


