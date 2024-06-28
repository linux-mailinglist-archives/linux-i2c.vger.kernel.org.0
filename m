Return-Path: <linux-i2c+bounces-4474-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF9191C20A
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 17:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1AC1B21E89
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 15:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487F71C230E;
	Fri, 28 Jun 2024 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWSvh0ol"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9321BE86B;
	Fri, 28 Jun 2024 15:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719587123; cv=none; b=BWBKJtmoEhclEBLbkXN0TIBibvFgNR+1zt/3/0JTW3ahAQ6+vYNgRZ1nzuvXU4XJzEvGdcL1Awj6wl95y1mAZiJ+VVCJlXy5IDj9SYtSIjAWo2atSheB0ouxjA4Ydeu249PooYZNf91/VKQG9BuduLEze4OWpznGR3+rxfcwVt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719587123; c=relaxed/simple;
	bh=68em2kaxpR+HtPn/ITg+JzOt5scSzEvzBrjNvtPit1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JS25kIRSwpn3zitHPgApZogrChcBdgKUoNZRrFHw6yWJ2mvjgDr3+jVTnhrCwjrIMWnk+eLTU/8dSio6H7eZU/BMn/2kjgQvdeO77NJ/+OeJVXldUPIvo5ogGuX8ERM/brrEMvUy361PyAy1mn1OGlhRZCfZS9ZLgBAER7T8uzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWSvh0ol; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7066a3229f4so536276b3a.2;
        Fri, 28 Jun 2024 08:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719587121; x=1720191921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ivUyFiHDZ5QXCTCYWIVAND7EWAtzazPUw5d6lB+IJig=;
        b=ZWSvh0olGJMNJ+sZHNDW3migZuaeLGKSk6YZYQ6Xs6KxC8t7L5cCa26Mi/N9eYxYK+
         BwaNeR+2a5Bp9/fzx2HsrnBhFU4MkOc8r7flV74cX5ZVKesAMePTONe5eRKOMqML4Vmj
         9Kk0ca76jXVaEnokaVRjOOPnPfoxnUOFvnYhlp+UYDOjpPVwRpk6kPNSrZZMHeOaDj/r
         mf8As528P+WcBB5GUccy7ble7MTgP/phE7quoz+caByc3J5MxOhloyPmD527jO5s5imD
         5ahFwcgRRI7UlLjfOJOzAOLReUqbUu1eaMKAtixjJflFB2t1Y2tg04nWlyRAqTj3GkOZ
         dXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719587121; x=1720191921;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivUyFiHDZ5QXCTCYWIVAND7EWAtzazPUw5d6lB+IJig=;
        b=d+42tjp3cg4PxdJYqftk7mqtPAfEwKq3SY6e3HqEFwpYITaHw4w5OQlgWPtZRXtS53
         ZImWQztyu2suq2yh3ZTaMXSnB0flHbolD3fyjiTcYdz4fKV7WcgUArfqTr7jgMZLTVJZ
         WkYQE1Nvo536a5Zl2MynQQq7X8x4iwceUj/uNLhIRzXHmntNSWul1ew2LykKCzjlSwt/
         IZxId2l/NiyVP1MGBVsXgrJEBpfTkgBwddLMzpQd22zx59kT6VtBb5mbJI9sd297XnTG
         GjPQYsoMXMf/XtT04/94BviYTt+BSajOmKlb/DN6JPFOgMFvWpLZuaOHSrhp5KNcocp9
         ga1A==
X-Forwarded-Encrypted: i=1; AJvYcCUb6cUdCZ9RGJ1ARm8xekuf+36qRXq55Tq3c/laivov7X1k5YdW1TJ9EfI02ZiIuXsnxubYcFBkfPwyB417fWN53w1JPsvuT7YXx/iE61i46WsCaX1IyVe/NTbX7LMBHuX/d3JR4Ssuu99Hl1SnK8rpe9ZDA/82OW5h9RQRTiiLVPpUHw==
X-Gm-Message-State: AOJu0YzNxH1svA8MG8wfTt7aclxW/qwZVKfgZJJ1V9z6n/qAWJ2Q6K4P
	M6TLam+B9qpVasULorXRs2HlJ/Yih8DgdyWLimGJF2DqQsm8nvCI
X-Google-Smtp-Source: AGHT+IGeYhlf0RK1HkapzwhDi9gibNLOPPjWcViViABSEc4hBAYRFIWn63Gen48LJn3695Wa1ZmYYA==
X-Received: by 2002:a05:6a20:158b:b0:1bd:29f2:c7d8 with SMTP id adf61e73a8af0-1bd29f2c9a9mr11215427637.42.1719587120671;
        Fri, 28 Jun 2024 08:05:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a95402sm1699946b3a.198.2024.06.28.08.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 08:05:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5ba653be-c1e9-4a39-8cdb-a8c0a4a1bc59@roeck-us.net>
Date: Fri, 28 Jun 2024 08:05:17 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Add Mule MFD support
To: Farouk Bouabid <farouk.bouabid@cherry.de>,
 Quentin Schulz <quentin.schulz@cherry.de>, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Peter Rosin <peda@axentia.se>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
 <fdeea79f-4568-4e70-9b49-0c02abc91170@roeck-us.net>
 <4f92528b-8311-4c0b-998b-f0221d7bd474@cherry.de>
 <c2803eed-b4f4-44cf-a7f7-9557d05e798e@roeck-us.net>
 <19ee521d-298d-4718-bdc6-f282666de371@cherry.de>
 <2a1ae708-3718-4f70-9837-bcc50b7c8f66@roeck-us.net>
 <85b2061a-9f5b-4998-b9cb-21308ee1965f@cherry.de>
 <dbfa52ab-c6fa-4c11-89bd-87445941bac3@roeck-us.net>
 <20999754-c4c3-40f7-a9fd-88b2d3d10785@cherry.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20999754-c4c3-40f7-a9fd-88b2d3d10785@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/28/24 02:03, Farouk Bouabid wrote:
> Hi Guenter,
> 
> On 28.06.24 02:05, Guenter Roeck wrote:
>> On 6/24/24 09:13, Farouk Bouabid wrote:
>>> Hi Guenter,
>>>
>>> On 19.06.24 15:31, Guenter Roeck wrote:
>>>> On 6/19/24 00:45, Farouk Bouabid wrote:
> 
> 
> [...]
> 
> 
>>
>>> If we cannot proceed with that then we could add a compatible to the amc6821 driver to add the mux device (Basically the "tsd,mule" compatible in amc6821 compatible list would be a combo driver with mux logic + amc6821). Do you think that is more appropriate ?
>>>
>>
>> Implement the mux as part of the amc6821 driver ? No. We could discuss
>> instantiating the i2c mux driver from the amc6821 driver.
> 
> 
> If I understand correctly we would have the amc6821 for "tsd,mule" compatible probe the mule-i2c-mux as platform_device. Possible DT representation would be something like:
> 

Yes, something like that. I have a patch series ready which converts the amc6821
to use regmap, so the i2c-mux driver might work as-is with that patch series in place.

Thanks,
Guenter


