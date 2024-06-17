Return-Path: <linux-i2c+bounces-4066-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B69490B595
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 18:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 712301C22B57
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 16:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581E314EC69;
	Mon, 17 Jun 2024 15:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQ2APQT+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B85EAC5;
	Mon, 17 Jun 2024 15:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718639376; cv=none; b=S7aEgw8sgbsgZG6o83Id1CFSxLGpP9xpISVuP6XiCOzQpmVUWRYqGoxHUxyjegnbJXaCXJh5C5ItVzASnt4xgE/B518kXNGQmDgOsHK27AhTh0XbV88NbPDCMqaPk2pS7Jnzc4TnrZzoczxwPYR1kHAlt9wxjCDh8uiSeU2kTdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718639376; c=relaxed/simple;
	bh=9jxoacm0VNzafJu9FOapUXFOnY1Zd94cS5szpcO+6Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrVuZWPxS80t77K7rIGRMHBI99hc21jSEur0EE9AiBMccC/8ZdHd3JbsJdY/pp+6yNnoaiNbpwI1/wHC1+jqCO/HkiqxQSV8zS9a2IjD5252lufZlb/i7MF0ECSz4ai5Hdvd/4i8HpwkDWzNQOagsj1QhPR0QIPxfxqmk+29VGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQ2APQT+; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f717608231so34377225ad.2;
        Mon, 17 Jun 2024 08:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718639374; x=1719244174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHo927smNjkpt0+sCP+aYgix3Q+5w0hosKdaxQjMOgQ=;
        b=MQ2APQT+iO+Eh0DXJQkI4uU+NnoTm57gpAHrOcGq3sb/q0iBES4aesC9E7BAFWyvzE
         /8pP5TIM+H0bGTfECCMxrG+ru7qGjPZcaHg4lRspd5PFTw1i6TCPTqGBjeYIJqe4gUyw
         bGEW7bwtLS7seet9zfDkBgk7GPiL/ZHitZJ5zDJ/W3+RFXdV/5pCZbPOL8/jFlOnej8Y
         nXevDfIwy+xipH7Ixf3rgdIMOrDolXxI4hOhJIbNIcvFl1B2SGYrZQipwW+AahrSpmTV
         CMdJfkzBeG0ZS6zSq0vAUq3Fz4p1ZLUIsl2W6WMOQ3ted8ttgmmEXPSsteZnvzHisi7W
         30rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718639374; x=1719244174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHo927smNjkpt0+sCP+aYgix3Q+5w0hosKdaxQjMOgQ=;
        b=XtuurV6AnhqW08ikfC/v7F/AbLBgYiLnbi0E6nyKKeG0W52yiCAPIF4VzcSpOGHAUd
         BL6qjOjwdP7Q3Z/qdA3A6HiOhbgyxXArVjLIjBpJ15weTHE0HyqAn4OiXHgbOkU5RTFY
         mBZePZQc6p3S4jmL74wD8liEoqtKe8jbAVjECUdHlDjWbTvJM4j9WpqjVkTlMKqaA0MR
         7NZTYOZEvHkec/KwlhaoUA5qeBMUfgAbJDQbbKbUBS7kpUB4uq8oJ2J6Y1rfKDpiDryT
         /7J4+Wjrqlx3dWIN2BnMxK6O6JBhRXnDtAuq3FAcNT1PFtlJZwLSacLMP7wZzYedJATn
         L9Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXXaikpSaFCDI9IPmEQp+B2Fuw0OK18xie+Y9nrweBdSv8FemS+CcEIahVP0k5R9oUHgSEEkdetK2dpo9a7DlJ7bzBoxYz/dVvqCx1V40NxyVF7MLKWszEbHKbUIpWMrjO/Doz2Cb41vnOSNxWXLOWEXQwY77azFCjvloA2ZXr6Yl13Fg==
X-Gm-Message-State: AOJu0YzTJm0htyL7hociH7PmG0sWSf6Pc9oN3qGf94rzBXxIqETVBwCX
	HaqKJq+yH3P9PTrVvf3wZj2uA0I29JXnMeGiQg6GIYO1Vi0AZEXw
X-Google-Smtp-Source: AGHT+IGNbnjCGTfKI07a4UNbGPXQuG49aaEGA13NJD7JLoGUMWXHzLxcA414MUCJx0aBqKwSDo3jQQ==
X-Received: by 2002:a17:902:e889:b0:1f7:4021:508a with SMTP id d9443c01a7336-1f8627c7d14mr158688035ad.33.1718639373888;
        Mon, 17 Jun 2024 08:49:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855ee8349sm80467885ad.120.2024.06.17.08.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 08:49:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 Jun 2024 08:49:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactcode.de>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Armin Wolf <W_Armin@gmx.de>,
	Stephen Horvath <s.horvath@outlook.com.au>
Subject: Re: [PATCH v4 5/6] i2c: smbus: Support DDR5 SPD EEPROMs
Message-ID: <4e09b843-3d2d-46d7-a8e1-2eabc4382dc7@roeck-us.net>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-6-linux@roeck-us.net>
 <a5aa120d-8497-4ca8-9752-7d800240b999@molgen.mpg.de>
 <efb77b37-30e5-48a8-b4af-eb9995a2882b@roeck-us.net>
 <33f369c1-1098-458e-9398-30037bd8c5aa@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33f369c1-1098-458e-9398-30037bd8c5aa@molgen.mpg.de>

Hi Paul,

On Mon, Jun 17, 2024 at 04:42:47PM +0200, Paul Menzel wrote:
[ ... ]
> 
> I applied your patch
> 
>     $ git log --oneline --no-decorate -2
>     00058a6 eeprom: Add basic spd5118 support
>     a0e5865 i2cdetect: only use "newer" I2C_FUNC_* flags if they exist
> 
> but reading eeprom fails:
> 
>     $ sudo ./eeprom/decode-dimms

decode-dimms does not need sudo, but that should not make a difference.

>     Cannot read /sys/bus/i2c/drivers/spd5118/0-0050/eeprom at
> ./eeprom/decode-dimms line 2465.
> 
Well, it _is_ a hack ;-), but that specific operation should not fail.

Please try the following:

ls -l /sys/bus/i2c/drivers/spd5118/0-0050/eeprom
cp /sys/bus/i2c/drivers/spd5118/0-0050/eeprom /tmp
od -t x1 /sys/bus/i2c/drivers/spd5118/0-0050/eeprom
sudo i2cdump -y -f 0 0x50

All those should work, and the size of /tmp/eeprom should be
1024 bytes. The output of i2cdump should start with something like

     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 51 18 0a 86 32 03 32 00 00 00 00 07 ff 7f 00 00    Q???2?2......?..
                                     ^^

and with

     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 51 18 0a 86 32 03 32 00 00 00 00 00 ff 7f 00 00    Q???2?2......?..
                                     ^^

after executing the "sensors" command.

Other than that, I can see that your system is an Intel system,
meaning the i2c controller would be i801, not piix4. I wonder
if that makes a difference. Has anyone else seeing this tested
eeprom access with i801 (or any other controller besides piix4),
by any chance ?

Thanks,
Guenter

