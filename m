Return-Path: <linux-i2c+bounces-4077-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7103E90D329
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 15:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 395D7B2449A
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 13:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E3A15FA96;
	Tue, 18 Jun 2024 13:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ai+ac9+m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DCF154C02;
	Tue, 18 Jun 2024 13:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717541; cv=none; b=b2r/Vi6qEj0UuET+/NHybbaVFNCmR/W5siWMWtbXRj2cfEEQCrNPWSqMpbHaxdt7CAbaoJBWXLMp6i1+UZIkT38B45rwOf00U/0jXJoQxrKK0EhZGgFlxud4vyl5sML7LEVhWWH3lvC3+xivGz4vdkxViTMHD6Dtwh3gQ4EjqE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717541; c=relaxed/simple;
	bh=PPxLoT9BzBda+0TPqQBQVseMBZPIoA0HnsreLI0+ttg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fBrOiY4xpFDosfmj3MCum2LE5pHOQf+mq0TZXDNhs/7fl8DRuPgkYo7XOqITE9mFIFXMzmL3b6hZdUOUhB/y+4lebTGsrg1buK8Y6i3DDfkzBgAE8P7ujsmYW6FcM6xQPPSX1SPD2xKwA/et9fWeKD5iKLMExPtFoLMXqSr29EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ai+ac9+m; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70599522368so3848323b3a.2;
        Tue, 18 Jun 2024 06:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718717539; x=1719322339; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oID6sXnxDXA/SiLWafjjXs7e8AQ+wI2NLEuM6Dp+7Jg=;
        b=Ai+ac9+mYZhEwB9u2c2BXM16m+Tbtmk8c0RjN5HLKZPXG1tEB9knV3bvn+8mHmP1tR
         7vKPLnQaYzis7xfzP2CaeWYU0PtJFfVitITe7FcJQ++hmtbcOSuRsjxngMN6Ts+nXt31
         rzUNL5LjnCYJyUsZn2Nc05x1LVkFGyMKDXQttfQoAml8sZkqPnNHOPHwbqI4MT1g61u2
         CZfJqlj4Oz4fV8ovzfMipm4uPLvvKHfs3AT0i+jRSJM1xv9GFg1sJ70rAio+HUV4fzVt
         i2jOGP9LZmmL7zMjDxfaNF3+Awf3IhfjQR7W2qYARIclWcC+/hiQ6xKg2zqU3DIcv19v
         W3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717539; x=1719322339;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oID6sXnxDXA/SiLWafjjXs7e8AQ+wI2NLEuM6Dp+7Jg=;
        b=OoQRdKUpAcxBvM7bpuNrHhcqtRugqV0UPOiXdPXqV2mhJCzpMB/M6QXcnY9pwiZ78E
         YnewCotYZgHPSjQbI3Smqsa6o6H7YLIKouU6qC04ZK48tRL89cIdf5eSYgZA3GZmeQw2
         bVA0bduCRHFm9SZL8kn2DXbYZH3y4woEvAAgl6ZmtYryj2Ak1tX5mLbQS/w1Cl4uimIL
         asNAKN4C6RWi0U+44VHONzpHCXGnu6NyQmIObR5xH9I/L7qarrZN1Cl7JzwjxiRV3HTM
         MrLIJfyLvJAuMa67cuk3GwrDdnGCBxFfTDm4Ij2zKCkKGMBiv1sQGxdkjcHKZy2Wmo7d
         6uTw==
X-Forwarded-Encrypted: i=1; AJvYcCXU8P/Q4qzY4elVKFW7WvlcLxp2TLOPd9Q1OWxXTCnm9GCne02BrGImwe2iqdH27RwHPRJ+UxPZdP34Lh7DAtqzRGlXoSlQyC6PjNKjEnaWYMfljBPNMgGktvgGjGI7G5vpljhvyb/9RqlMn99xjcyt1UZmWidkvMAeszAAKugYSP3Pzw==
X-Gm-Message-State: AOJu0Yxf89X3mt3/KiF5M8CHpH6KFY2e0VM6ZiCVhzuxDUGsYeWOqHys
	rAzpnsm00fODnBJui1odQlTeLv5OOaueolxwjpL9qcz6jYEklVBUcgLxuQ==
X-Google-Smtp-Source: AGHT+IHksL6eMBnmENqjS1uVpx29FcncN0UOU745Ih8OCdjgve7QFKKkB8et2BOHKvMIOBQFtx41oQ==
X-Received: by 2002:a05:6a20:7491:b0:1b2:ae30:95b5 with SMTP id adf61e73a8af0-1bae82a7234mr12451751637.56.1718717539203;
        Tue, 18 Jun 2024 06:32:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b9c9sm8952931b3a.160.2024.06.18.06.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 06:32:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <975af7e5-b1b0-400e-a1c3-6d9140421f25@roeck-us.net>
Date: Tue, 18 Jun 2024 06:32:16 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] i2c: smbus: Support DDR5 SPD EEPROMs
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Armin Wolf <W_Armin@gmx.de>, Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-6-linux@roeck-us.net>
 <a5aa120d-8497-4ca8-9752-7d800240b999@molgen.mpg.de>
 <efb77b37-30e5-48a8-b4af-eb9995a2882b@roeck-us.net>
 <33f369c1-1098-458e-9398-30037bd8c5aa@molgen.mpg.de>
 <4e09b843-3d2d-46d7-a8e1-2eabc4382dc7@roeck-us.net>
 <f20ea816-5165-401e-948f-6e77682a2d1b@molgen.mpg.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <f20ea816-5165-401e-948f-6e77682a2d1b@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Paul,

On 6/18/24 03:25, Paul Menzel wrote:
[ ... ]
> 
>      $ ls -l /sys/bus/i2c/drivers/spd5118/0-0050/eeprom
>      -r--r--r-- 1 root root 1024 Jun 18 12:17 /sys/bus/i2c/drivers /spd5118/0-0050/eeprom
>      $ cp /sys/bus/i2c/drivers/spd5118/0-0050/eeprom /tmp
>      cp: error reading '/sys/bus/i2c/drivers/spd5118/0-0050/eeprom': No such device or address

That suggests that the i801 driver got an error when trying some chip operation.
Unfortunately I have no idea what that error or the failed operation might be.

>      $ od -t x1 /sys/bus/i2c/drivers/spd5118/0-0050/eeprom
>      od: /sys/bus/i2c/drivers/spd5118/0-0050/eeprom: read error: No such device or address
>      0000000
> 
>> sudo i2cdump -y -f 0 0x50
> 
>      $ sudo LD_LIBRARY_PATH=~/src/i2c-tools/lib tools/i2cdump -y -f 0 0x50
>      No size specified (using byte-data access)
>      Error: Could not open file `/dev/i2c-0' or `/dev/i2c/0': No such file or directory
> 
This should work after you load the "i2c-dev" module.

If you get it to work, please provide the output. Maybe it helps tracking down
the problem.

Thanks,
Guenter


