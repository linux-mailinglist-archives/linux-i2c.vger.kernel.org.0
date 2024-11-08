Return-Path: <linux-i2c+bounces-7902-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8019C214A
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 16:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72C6AB2280C
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 15:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8BC21B441;
	Fri,  8 Nov 2024 15:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeKkpdqy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBFF45023;
	Fri,  8 Nov 2024 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731081495; cv=none; b=DblHOWFWQSbZTomwXWIV66vPGZubdNq5zri2B12Ykd34EpcSE7zpQ2FPFfcSbNqE/l0/kyaFLaIV9VmF02gbCJYlnKDeomrqOlVP9grF2utkC0fXntZSIJGD4GHFyflGWAPVVtxyYXSis2Xu4Yo+nyhcuyRRCnzThsfrj8e0hlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731081495; c=relaxed/simple;
	bh=DnSthTbu7M7mwlarqGz7sH5e43UB54ZbBR8qTG1CjLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PsMIooivPsoJrloEm2I/2Kzns1PqAynWEyEAEDqfYIbRojoT/yBOOjmeG7mJZ50pBUCippQMTFh6lFsJLCmX4O+tCw/RF0N4CCrTN8O3bHJAmLJ/0dRfZEhO/ime3s4htI7cOwkUniRNsQEu6FWl+PoI/u2LJgCUHoVbDgEVJhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eeKkpdqy; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53a007743e7so2857515e87.1;
        Fri, 08 Nov 2024 07:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731081492; x=1731686292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bMuVQ8Erg4hrrl+JVXSYoq6sab0sBpa1d8BTm5zUoVI=;
        b=eeKkpdqyQ4/RUbB/DMXgNPAnT2qRENeKmNw/uOEFpXivKbf7a+exh7ZWJvxciF4t5R
         un3Nkyx0wiXOYT7npEl3J1cm3ImY8PyM7gY60iD3heUBZhvLvEGKpPtZmHT3arT6/b0b
         am5axUGVDuJ+FgVZzJAwdcS7ohnOsvzmmiR4Scb+bEJVJJ8SoNcUcc4oj9FBsCybef6V
         Lt58HWqbruxIh6P+IO5ZnpsqPBMnyffk22QH1BUb2O7tsDF7aRPk/W9ypmnSfLuBw319
         UIIaupYv+kN/i9mvULGHWrkd5SKWWAe914A/i8E5HmBtLAYG9p/BPbdGCDSajiQc26dP
         AFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731081492; x=1731686292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bMuVQ8Erg4hrrl+JVXSYoq6sab0sBpa1d8BTm5zUoVI=;
        b=FgBICUrrh6BoZPkEPPyoXRxhUGtw0o67XUPrsHv1eyd/rJTm6VKv2ROs7ippxFTxQF
         J4zS/cScH1OF0Uo81JZ/rtdfnT0dUmktyZK/T4Dn1CLHHWjUnc8xqSm45Lz+L0hP3oDy
         +qJd6xHQSDpU1u2+k2FretHdTc0Ruv5AEsW1wOT5V5gJs3WAs4f31Aoa0dpVFiK11LKN
         z82jhdw/NepwYIpPUWh8rgDLVRHBPmqi0wqM5uoxawmsQlnyFZHOYq00tTNZZ3RTsFl3
         r3lLe+ZCU+Sj7JpmdXoFWsL/6Vxudq69vibrNuhBj3pOWnKIXR6ci8aGohdUGdbAj8bY
         5fCg==
X-Forwarded-Encrypted: i=1; AJvYcCVBGhYYVHJdeheN4vS0QxQOf5LabBZ0/jFS2PGkeIp/Busx+kqgMcolUj3KA/8adlOYHP0tfNq9rdtc@vger.kernel.org, AJvYcCVIOVplChgQVBPz4PnJ8KBaYdVbYDcEm6hzJKTo3ULTPNMKBDQzC79hPmKK58xDvELJMgulpdDaufhb@vger.kernel.org, AJvYcCWAalcxi60hHRC2gbTY4oZ4kah2MIxhPy2XLmp2yYTJdl8HpsMOSLYkY8ETUaIWnf6XlAA7VUA3K22MVGza@vger.kernel.org, AJvYcCXAJmiBvxeAmiffKl5JxKAbaUbg6b1no+ODwaRRmdRtQbR6UcmATErKqcAELnX/0xZme+wJs9y1y4yN@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ3BZU6R0UUwJCCSAR5Gu2sMxdbvsfyv3hqaFOJqZ0fwsAHNg6
	kmfch6FKxg74Su0PtrbWxUlvSh17khNcDgaVzMIp87TQw2zXrY1l
X-Google-Smtp-Source: AGHT+IE+YJRPuE45zAJuly7sRzZ9edVWYuRFA055vs6Y4HK/g7Ba5F53rGd+uT+sYiCfKR7OvGEqog==
X-Received: by 2002:a05:651c:b10:b0:2fb:6169:c42a with SMTP id 38308e7fff4ca-2ff20225b59mr18443731fa.30.1731081491747;
        Fri, 08 Nov 2024 07:58:11 -0800 (PST)
Received: from ?IPV6:2001:470:dcf4:ac:f506:8665:9278:2fb6? ([2001:470:dcf4:ac:f506:8665:9278:2fb6])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-2ff178df92asm6986411fa.9.2024.11.08.07.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 07:58:10 -0800 (PST)
Message-ID: <cf32d676-831c-4c3f-8965-c9be3abd5300@gmail.com>
Date: Fri, 8 Nov 2024 18:58:07 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] add driver for the WCH CH341 in I2C/GPIO mode
To: frank zago <frank@zago.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Wolfram Sang <wsa@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20220616013747.126051-1-frank@zago.net>
Content-Language: en-US
From: "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
In-Reply-To: <20220616013747.126051-1-frank@zago.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Frank,


Are you going to further proceed with this patch set? As far as I can 
see, there were no updates since 2022.


16.06.2022 04:37, frank zago пишет:
> The CH341 is a multifunction chip, presenting 3 different USB PID. One
> of these functions is for I2C/SPI/GPIO. This new set of drivers will
> manage I2C and GPIO.
> 
> Changes from v5:
> Addressed reviewers' comments.
> Better handling of 0-bytes i2c commands
> Use of better USB API.
> 
> Changes from v4:
> I should have addressed all the comments: rework of the GPIO interrupt
> handling code to be more modern, changes in Kconfig wording, some code
> cleanup.
> Driver was tested again with up to 4 of these devices. No
> error seen.
> 
> Changes from v3:
>    - really converted to an MFD driver. Driver is now split into 3
>      modules (MFD+I2C+GPIO).
>    - minor code cleanups
> 
> Changes from v2:
>    - bug fixes
>    - more robust USB enumeration
>    - Changed to an MFD driver as suggested
> 
> During testing I found that i2c handles hot removal, but not gpio. The
> gpio subsystem will complain with 'REMOVING GPIOCHIP WITH GPIOS STILL
> REQUESTED', but it's a gpiolib issue.
> 
> Changes from v1:
>    - Removed double Signed-off-by
>    - Move Kconfig into the same directory as the driver
> 
> frank zago (4):
>    mfd: ch341: add core driver for the WCH CH341 in I2C/SPI/GPIO mode
>    gpio: ch341: add GPIO MFD cell driver for the CH341
>    i2c: ch341: add I2C MFD cell driver for the CH341
>    docs: misc: add documentation for ch341 driver
> 
>   Documentation/misc-devices/ch341.rst | 109 ++++++++
>   Documentation/misc-devices/index.rst |   1 +
>   MAINTAINERS                          |   9 +
>   drivers/gpio/Kconfig                 |  10 +
>   drivers/gpio/Makefile                |   1 +
>   drivers/gpio/gpio-ch341.c            | 385 +++++++++++++++++++++++++++
>   drivers/i2c/busses/Kconfig           |  10 +
>   drivers/i2c/busses/Makefile          |   1 +
>   drivers/i2c/busses/i2c-ch341.c       | 377 ++++++++++++++++++++++++++
>   drivers/mfd/Kconfig                  |  10 +
>   drivers/mfd/Makefile                 |   1 +
>   drivers/mfd/ch341-core.c             |  90 +++++++
>   include/linux/mfd/ch341.h            |  26 ++
>   13 files changed, 1030 insertions(+)
>   create mode 100644 Documentation/misc-devices/ch341.rst
>   create mode 100644 drivers/gpio/gpio-ch341.c
>   create mode 100644 drivers/i2c/busses/i2c-ch341.c
>   create mode 100644 drivers/mfd/ch341-core.c
>   create mode 100644 include/linux/mfd/ch341.h
> ---
> 2.32.0


