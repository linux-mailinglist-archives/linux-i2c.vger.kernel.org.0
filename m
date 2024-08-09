Return-Path: <linux-i2c+bounces-5238-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 163EB94CA48
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 08:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 485931C2274C
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 06:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1B316D304;
	Fri,  9 Aug 2024 06:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ahENB5z+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5623770C
	for <linux-i2c@vger.kernel.org>; Fri,  9 Aug 2024 06:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723183997; cv=none; b=CFPPmST92qT60NSSPGJ6ZQbj0Shkia/QQmzoF0q7LuJLVsipRO/KqL0DWk7Ck8AXLosb7fRoyKJcN6bELCGnUaI7uJ9w8mAjhHUacSsdkUbHx0vio3BetwhWmcio4X4xB1Kn1AV2B5byAPZwjUvAPYYrnMuc5OY2UusSXT4Cv9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723183997; c=relaxed/simple;
	bh=LUfpBH5hJq5mJAgbujuJTG3p5WmKGZYJduZ2mr1FAHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyZiT8vKQyEvOi2BC1bp2As1fopdENYyeyS2ZXJ8ir/e8k7H85bBeggspO8u4l0MdS13tQOQkRfgfdwL3LzGTMtfjFmLFHtSl/80csry4wTxZMKdTCnrObq+ULjFitK3RWrK/QNdp6tFrh0dydCieHQj7MLJsS80C4rPC/YAwEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ahENB5z+; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5b01af9b0c9so1816958a12.3
        for <linux-i2c@vger.kernel.org>; Thu, 08 Aug 2024 23:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1723183992; x=1723788792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v/PjL/AFb85dVI3DKWfWI3LllKjRgfnxTMskidgbimg=;
        b=ahENB5z+MloBxmOqNh5o1QYSYvHYkF5dx5+tdDiCVP9L4xEx4wrmiAl/juwjLX2mpw
         wbj8lUSHlXHlWn2r7PlczDt6uygdFYsB6vVM6S2Ta16pTyxFjJg/yrnz9ZIHPUOWG30r
         crinTGHDv4LAPhjqz1ZardPluk/VYGaguGTmTv5Q0LwWE0lWSEFvPol0cn97P31PblV/
         q5OpI6W6NnHGKbWfpuI5bKbKHUbgcipQLrDBzAD8Y5H3UoQG/cjt8/n7rG4HTDZ0Jqz6
         dM+4RBBr9cw8KYPesARAcXpxzERv3h1pdcoYUTuiU/qtuMbKYg9v1iTPbG5pc+mqU2G6
         e1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723183992; x=1723788792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/PjL/AFb85dVI3DKWfWI3LllKjRgfnxTMskidgbimg=;
        b=tuFDUy3ERZgUQydDVVt9FZQiX+RmH2i43aQmnh3RLKyQzqgHkorXXL/iqmUf78jRwz
         497uLHqIVauwzCllmL+jh8R0apWFid9UzdsY3rsJH9UIU5orBTzKizLWcr3YLt8HBMsE
         +VFNrPnNX39UWTrbcnplU3dBN/SdWDPcmMNCJkAkSdr50YGkN4ZNrojmJ5doqmBPpxUM
         Mo8rA6dqKPhsU6f5Lj5XOdaAT7A2XCHzuSCMWosn+XmCkIVjHIbTt70bFMPLVKaD7SNo
         PL1IlWtW8iLouUZAgm91TPZCp6/7i+zqDdJ5dV61pd0VN89vwHdaFp+j2uA9Rj8Swu9c
         57dw==
X-Gm-Message-State: AOJu0Yy4BTG3xnPTD6K2apk/CadbcXz9AX8ALAF/DvASSHRYHe/i5d12
	BGubHFJVteDaDI8nf8RsrYkmBJlPZd96Viivl8DVqISswjBkzJl4mTaiNgNWYEM=
X-Google-Smtp-Source: AGHT+IFnQDB/G3rJ1NYoBODYoPhd1Hk0v4H/4m5gWvj74OkkfQijLy8DyS3EE72gRgVcvkWwHXN20Q==
X-Received: by 2002:a05:6402:280a:b0:5a3:f5c6:7cd9 with SMTP id 4fb4d7f45d1cf-5bd0a65a9acmr429414a12.26.1723183992482;
        Thu, 08 Aug 2024 23:13:12 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2d3518dsm1319431a12.78.2024.08.08.23.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 23:13:12 -0700 (PDT)
Message-ID: <b2b3830e-5399-4c50-8676-b21479edebf3@tuxon.dev>
Date: Fri, 9 Aug 2024 09:13:10 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] ARM: dts: microchip: at91-sama7g5ek: add EEPROMs
Content-Language: en-US
To: Andrei Simion <andrei.simion@microchip.com>, brgl@bgdev.pl,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
References: <20240703084704.197697-1-andrei.simion@microchip.com>
 <20240703084704.197697-3-andrei.simion@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240703084704.197697-3-andrei.simion@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03.07.2024 11:47, Andrei Simion wrote:
> From: Claudiu Beznea <claudiu.beznea@microchip.com>
> 
> Our main boot sequence is
> (1) ROM BOOT -> AT91Bootstrap -> U-Boot -> Linux Kernel.
> U-Boot is the stage where we set up the MAC address.
> Also we can skip U-Boot and use the following boot sequence :
> (2) ROM BOOT -> AT91Boostrap -> Linux Kernel.
> Add EEPROMs and nvmem-layout to describe eui48 MAC address region
> to be used for case (2).
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> [andrei.simion@microchip.com: Add nvmem-layout to describe eui48 mac region.
> Align compatible name with datasheet. Reword commit message.]
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>

Applied to at91-dt, thanks!

Please note that I've adjusted the commit message.
Please have a look and let me know if you disagree with the changes.

Thank you,
Claudiu Beznea

