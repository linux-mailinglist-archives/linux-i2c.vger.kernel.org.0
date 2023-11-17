Return-Path: <linux-i2c+bounces-202-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A8E7EEC55
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 07:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADA27281116
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Nov 2023 06:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960E463C1;
	Fri, 17 Nov 2023 06:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXyBdO6o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75466D68
	for <linux-i2c@vger.kernel.org>; Thu, 16 Nov 2023 22:41:04 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4079ed65471so13438395e9.1
        for <linux-i2c@vger.kernel.org>; Thu, 16 Nov 2023 22:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700203263; x=1700808063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JlgVTuejQa/lV6ReGk/RIpb+zqQD3zqpKbctMFlPTVU=;
        b=cXyBdO6oPqWNReCvXEo+y4FkTa4wMm8YUJTSeWYZmLV/cWzRGRiMPZ450mbhLdkHA5
         G5a2e/zSeWqtBgO/UqKRmwCRdiEezs6VJZdDEYlBDlEIA09l6fuU/5uXPhn8YoHouwr8
         OIpu0ScwZM4Q1FOfzAsSZnD1NXLq+GelQVZTasTqPw4OFni3HLQemNAmcpRby6po7HGw
         YR/LGKOJ/WFalr5fSkd24NoycMzZ5uCu0OKRRkLBM6moOb2ag75ZR5DWZBOjXZLluT8u
         BQ8lqRaxJIyA+c3Xq+LVAZXWdzWQWnWEA8Blv4Lwy2m50c8L6UkEjaEcEedSGq26QbAS
         v2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700203263; x=1700808063;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlgVTuejQa/lV6ReGk/RIpb+zqQD3zqpKbctMFlPTVU=;
        b=IZbJRm8fv7acfTKNymhFS1ELcoPQrTvy337nxqxDwD9zWEK7bQR31IUIIyHtaNliEj
         Xsol4qt2YPC+df3HhjX0CJeMfyl2/t2dxxQU233Do/DzrqPZjY7qaT/chruoP8fqdi21
         G4WD9bQgoOvn7Ukj6bkjYjQOf5H8H7iHrS6HJKGaW7zBh4AtDchaGs7fv2zvTke0uj6u
         Ld+Lq3vD42PPTxkPF8YqAW0XLr6IrQceTnGqCHDDlyDx8vBRRUnKHS3Ump3LA6OxpJSM
         vpnEIBajV1J6VhMVEVnfWrQcisj4iK/li/q4dNCOaWQwJ/AnJnxppTNHBM9bTOnjc0Kl
         3qog==
X-Gm-Message-State: AOJu0Yx47DFoL1JOcy0V3NHnUlhuFyqg1RLyUqdGbWi02PLhR0t4LYmz
	3kILrP/qpE0iC9nSXfzP/Y9TDSrYp9E=
X-Google-Smtp-Source: AGHT+IHFmsyQSLGgM51GzWnHqmWnvNA+OWkPDwdu0Mxml5S4mVJ9Zcp8HFqlAOrWkyhT+vT21JsBYQ==
X-Received: by 2002:a05:600c:894:b0:40a:44c0:fd43 with SMTP id l20-20020a05600c089400b0040a44c0fd43mr3759560wmp.17.1700203262581;
        Thu, 16 Nov 2023 22:41:02 -0800 (PST)
Received: from ?IPV6:2a01:c23:b96e:ed00:c0d:6914:f32c:c6f8? (dynamic-2a01-0c23-b96e-ed00-0c0d-6914-f32c-c6f8.c23.pool.telefonica.de. [2a01:c23:b96e:ed00:c0d:6914:f32c:c6f8])
        by smtp.googlemail.com with ESMTPSA id 19-20020a05600c025300b004053e9276easm5905539wmj.32.2023.11.16.22.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 22:41:02 -0800 (PST)
Message-ID: <48c6cfce-5b36-4dbb-9422-a0175203fb51@gmail.com>
Date: Fri, 17 Nov 2023 07:41:03 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] eeprom: ee1004: Add support for multiple i2c busses
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <ab18528d-e0be-49f6-8ea3-1f4e73fa353a@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ab18528d-e0be-49f6-8ea3-1f4e73fa353a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.11.2023 16:30, Heiner Kallweit wrote:
> There are systems with more than 8 memory slots where the i2c bus for
> SPD is multiplexed. i2c_register_spd() isn't used yet on such systems,
> but it's planned. So we need to extend ee1004 accordingly.
> With this extension a maximum of 8 i2c busses is supported.
> 
> I don't have such a system for testing, therefore I just verified
> that the driver still works on a system with a single i2c bus.
> 
> For the sake of simplicity the extension uses the existing global
> mutex to protect access on all busses. This could be improved,
> but we support 8 busses only, and SPD data is small and rarely
> accessed, so it shouldn't be a problem.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---

I sent a v2 that improves the code.


