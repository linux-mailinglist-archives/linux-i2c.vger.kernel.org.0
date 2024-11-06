Return-Path: <linux-i2c+bounces-7852-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 400959BF37E
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 17:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 577B11C22147
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 16:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0624205AC9;
	Wed,  6 Nov 2024 16:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZManZ8S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C331D86E8;
	Wed,  6 Nov 2024 16:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730911439; cv=none; b=UMq4CjrtMNS8hsriUSdERCMtcRDPHfbcSU1GIoNFc85ys19G+0GDSBhPewR7xjIpUq1cGfaVYvsf1NRZcXuBoDHsw64HBPrCgmto0+YzctXSVYUxt0d1Z8RtptUdYdpbWCH8cYHu9TshZSLMrUQogZ5SP3F37i4vQwBxMiHFzok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730911439; c=relaxed/simple;
	bh=j4jGBR3Ung9FSoqSz2fDPnJ3iS++OPt8jcVIKcxxogA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VTuaI9q/Oks9vY8Od1wjUOq0BAsmTq5Y5SreJVh+DFxz35/phuT7lJ+uIUzbaxSXPRhPmSMqkOovsJS5EygNgnN/lHcVk8hIAJ43muEdlghssRzPZc98qOu1+KlUX8QzoSiVb4ToeeLBfA+EYFiErcKCgT99xlTG2HL2bdusgnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZManZ8S; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-720be27db74so23956b3a.1;
        Wed, 06 Nov 2024 08:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730911437; x=1731516237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9olawbYn7htf1Q9WNRGiGe7mdjgouMY6rNID+WumQL8=;
        b=kZManZ8SsEvnEZlErJt4zR5gm2CpaHHWH6UVmHxTg5ERImzXhypruJ4ll3pIzTjqrh
         uppWzLNnvq2lROFKUwwb04sC7BOQL8WgAOCuLO+9h1EbhA6JJ1VC8JNHQ7iRAE2tbTE8
         VcY/jIpdZmSle5mRLXX5uty+40Aj12ffqu0hq+ZXjqd2d4hqIx8EIF03B1FeIM+FxUV5
         5wVB+/Szl7q/mSpzysii5b7mlwKvUED9tBwqwoBCzy9pFDpKG9DS2KikAePyLx2iOZCl
         PuGmYluvEw0YOxTwXKW9VbBLlbk5baLzbsNiM8MEPjWy0YnD7yE8EeTFD14F1AfAa6D2
         F6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730911437; x=1731516237;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9olawbYn7htf1Q9WNRGiGe7mdjgouMY6rNID+WumQL8=;
        b=paYQ9OkGMU26FY1vJOhRGepiex6SJ4FQoDGgbBzuT8EkJpzKfhdUKLqF7Ft8R2K8Nc
         p1Wa25WFMbky7YIIKvSlwuSaSB23XyYd6iVWkxHGt+d0oHKW89r67oWHvH8gKzr1QGx/
         F9ubZeuinJiw5HF3LJ+T+t6uIbKpe9yQbrQKZZR0t02COJuE02Q4w0zS3agPadbw0kuf
         3MmA4eSBNLcoA//kc2cL8qEVydp4chZV3AoJ3lX85rmW6tRFSVH8Ct6oDSwJLjS1vo4V
         Q+DoyyjtnjDBEAtwmnBkGHNntApI1foQ41BDlxA2dpG8GExa1Tq9I4Pp5TGv0God04jd
         776w==
X-Forwarded-Encrypted: i=1; AJvYcCUoVF3RR+C4t+n2ktCnUcNeMohLYee0PNeUskMHpPuuERyNi9QdoHNgknuSO0SNgQ2q88hsqmNEL7F/@vger.kernel.org, AJvYcCV9IkP77xL2liRnUlcFR8xLLkV4MgDG4oqayaL8GtoLuLHb6nM42Wc2l+RC9qUeebb4ezwjvK8QMJQz@vger.kernel.org, AJvYcCVk2f+PcYk8Dh9xmWBWL7N0kWKh0wvSiOLfDLPLYmoA8p50bQXmrFJmt+1qaPPE715OJVRF9PuS1RvkCt0x@vger.kernel.org, AJvYcCVu+KCSdyQbwmlq9HmA5wlV0B8r9Gs+ePyukW2e+mJeHabwKCsIpo9Yttl9SIYsQ9Jck7kZStGAz3gyk9I=@vger.kernel.org, AJvYcCXiGw4BQfp22LDinSVFLKPCJZn4N83A9hgCeaKeXIDGZ9ZVljgxfgljqF9hIvm9pGNAljBXTQ1Yihvg@vger.kernel.org
X-Gm-Message-State: AOJu0Yym48zgU/Th/SGPa73c33kblZF1a1XpveUJQ01topVXTguiN4um
	lTSk4IflCo5LupKV6rLO5BG9H7sV54MXwpGPcRvpcN9kO8JxR3vh
X-Google-Smtp-Source: AGHT+IHeyxhAU+AaFeNKPaTYqQiv6WAIcMyVXX1JkvSgtHctOd1+31cBPtk5P5wYgnLaaWh1rmsdYA==
X-Received: by 2002:a05:6a00:4b45:b0:71e:667c:8384 with SMTP id d2e1a72fcca58-723f7a279d5mr5160955b3a.9.1730911437314;
        Wed, 06 Nov 2024 08:43:57 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2eb586sm12329636b3a.149.2024.11.06.08.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 08:43:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2b731ba8-1b6b-41eb-bae9-3403555506ef@roeck-us.net>
Date: Wed, 6 Nov 2024 08:43:54 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: add ltp8800
To: Conor Dooley <conor@kernel.org>
Cc: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Yin <peteryin.openbmc@gmail.com>,
 Noah Wang <noahwang.wang@outlook.com>, Marek Vasut <marex@denx.de>,
 Lukas Wunner <lukas@wunner.de>
References: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
 <20241106030918.24849-2-cedricjustine.encarnacion@analog.com>
 <8e4dc080-d779-4b06-8fd1-74784e06323a@roeck-us.net>
 <20241106-gatherer-glancing-495dbf9d86c7@spud>
 <20241106-overcast-yummy-9c6462ff2640@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241106-overcast-yummy-9c6462ff2640@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/24 08:11, Conor Dooley wrote:
> On Wed, Nov 06, 2024 at 04:06:02PM +0000, Conor Dooley wrote:
>> On Tue, Nov 05, 2024 at 08:34:01PM -0800, Guenter Roeck wrote:
>>> On 11/5/24 19:09, Cedric Encarnacion wrote:
>>>> Add Analog Devices LTP8800-1A, LTP8800-2, and LTP8800-4A DC/DC μModule
>>>> regulator.
>>
>> A single compatible for 3 devices is highly suspect. What is
>> different between these devices?
> 
> Additionally, looking at one of the datasheets, this has several inputs
> that could be controlled by a GPIO, a clock input and several supply
> inputs. It also has a regulator output. I don't think it is suitable for
> trivial-devices.yaml.
> 

All PMBus devices are by definition regulators with input and output voltages.
After all, PMBus stands for "Power Management Bus". Some of them are listed
in trivial devices, some are not. Is that a general guidance, or in other
words should I (we) automatically reject patches adding PMBus devices
to the trivial devices file ?

Thanks,
Guenter


