Return-Path: <linux-i2c+bounces-8603-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC619F69C5
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 16:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E30916A92E
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 15:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618701F2C21;
	Wed, 18 Dec 2024 15:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZQm8Khj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1631F130B;
	Wed, 18 Dec 2024 15:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734534913; cv=none; b=Y06VM3QbL2vW1NFHh33ZXE4SwBLHdknkI36uhvn39G0l0fJMy1ZIXqDI6DqmJT+FlA5OqUbZc+S80JheUGS6RDdAEhJYdk5G5BtgZD/DVZvnleYlJR4cMpJU42fN/UGMepFIz8kRoWOgO+9sqpsila0IFfwaql7RWCjSG7oAeDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734534913; c=relaxed/simple;
	bh=fyUSODclmG7/An2MOCBWS3X3EK3sYPQrCzfR20pWSzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UxRsFGdEqibpEyeYVUvONts+KDuu/Xt5IbeZQHh+DD4V9tBssATBPEv3us+F7srswN3bqQjiTFYF1BbC6B65KqWPrMk0ok3l1o6igT+3ENPsWW3TFYXdrnchmD4gfMwBgcmd0j/+4XwF/4ZbWkDLTrrpG736VEhsGB9TxzlFvBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZQm8Khj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21649a7bcdcso62700335ad.1;
        Wed, 18 Dec 2024 07:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734534911; x=1735139711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BniwaVTCowROQnATdcgMHlEoMA/xTtbAYFVm4+9btY=;
        b=IZQm8KhjKJxXoX0oZo7QXeJ+zdDpbKRq5pw1KPWBXxZ/y0899Udcq5ygGgvP47OF/X
         Lv4PJFqjtuoaA9NYl6JTQx2nyCy6ybOXbbShhnpBxCJ0WSpS6r3lozcwr9zqALnXcJ9e
         JJlC3QFxWTyl9UiwK0x1Y0qq/hkV3swZQtkkR3HSvjYxwz9YFrp9Zc0rn0CrN96BTgSR
         CMYiTAU/rgDMSURnuyO3U+MSuQQjcNrzbjDrCnKMW6kkXDAWJTez42nmOawvwNxPk5wf
         tUdQ4D4CbbDRNVg40DUeMoaaUUDZMct8E2UJCrgrwmQd1mEQcgpjgpx9eglFimSejAqa
         QK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734534911; x=1735139711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BniwaVTCowROQnATdcgMHlEoMA/xTtbAYFVm4+9btY=;
        b=L7THls+R10uk2hzNGkviuAL3OvjxrALe1In0FMBOFPwevIPEgoHF3+vTgjiBg2y9W4
         7/Ely1sesHbgvUszEq7YGDGVkVgahVIWiOKEPOcUSVmFXa7N71HLGihcQjY6UZbOQ/GM
         2EEn3MYqCTC5fQENlRX4dXM/BNalvCAXGDnJr6GKPFPwsw+fjhFeI77yxmTvmNiqLWbz
         IW72iD9Ss4lOMDO52Jn4Vb/4XgmyxEJSzCLUNAAt++NA9SpWR7qI+mVA/qcMFRsaiavP
         EHfqHR2/35dkfi5Hk6jwsxZzR/mxnqFyUu3ozFfAg8pEL3ncCQfLP/nBO6owJiqixEn1
         Xbfg==
X-Forwarded-Encrypted: i=1; AJvYcCULKWsIwhZM8c1hypB5MVJQ3qBv+jp1W/isE6bgsQKYHy9L2iqpz5Ilsdx5RZ+zED24IT2awx7FBCAlAzTw@vger.kernel.org, AJvYcCUNVvElmAdTO/M4qGERS4eICAxN7b7gkcE8pstYo5pgKDzy03uIpXrSEE+TY9cKHD/l5PIoon/EEwid@vger.kernel.org, AJvYcCVZOTwWDGHNqwfv+JhmZii0ZpxpYqALPm3XgB+xPAHAzO2aVkJRezHz8dlzAHzoHNbAYKu43LtygF2f@vger.kernel.org, AJvYcCXFueLUmtGENWiQ/5eWJcDLVAxC9s5rxdvzmxiXerivYVhwNPUlBAsimI2mqGdyJ0mkbSfMu0Vu0MbFbaA=@vger.kernel.org, AJvYcCXfKVqIvbl2IkYZ0IzftHB6htBhRe7JP//I+atl5k9x6M/46kJ7eHaaQWXvOWD/r88DTev4aka/8pST@vger.kernel.org
X-Gm-Message-State: AOJu0Yx98sk3LXKy6ToYqI9l4ou3ZKUhNvSUq4mZKtm8B04llLCCBSlW
	OQzJrBAyYuDp+ZUXn2pjirQJzEL9UcPLIperwEO0Akf+zXagG3dV
X-Gm-Gg: ASbGncvu1zYnLn+nOsZkEYtkyEEubWY0PA+Z17ExfYNyNdYfPMNSMJRLIJllLuc5UJV
	HlVtYc/6xs17QQ1PBT4f5fSmGuN1/QDinVHyJNfNvJqVhTJL7avVkKJ85LJz8+trIOM6/lWVFHO
	Gev+APKBfB674tT5rx3VQDlveIMyR97CMFIdjjha4/+2QU11ajOKRm8scfkNLaJE9GOmykFU8Yw
	vGs/1UfxbILMQcNniDcGCLGiwwHOqmCEX1yB1DFhZpxxsPXnjGqWaaOiAuIhOyCPeI0RQ==
X-Google-Smtp-Source: AGHT+IE/4h1YDKKtjFs+zOt9aPjTBxQjnBuzdbZVp1TZRkO/LfYMNmgU1weizT6Rb4caps0E/nTJOw==
X-Received: by 2002:a17:902:da8a:b0:211:7156:4283 with SMTP id d9443c01a7336-218d7252824mr43701715ad.43.1734534910892;
        Wed, 18 Dec 2024 07:15:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dcb47dsm77953085ad.61.2024.12.18.07.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 07:15:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 18 Dec 2024 07:15:09 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	eajames@linux.ibm.com, jdelvare@suse.com, corbet@lwn.net,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	Delphine_CC_Chiu@wiwynn.com, broonie@kernel.org,
	peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
	naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
	patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
	peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 2/4] hwmon: (pmbus/crps) Add Intel CRPS185 power supply
Message-ID: <3c7d8856-d58c-4ac2-84fe-7a7374fdddc8@roeck-us.net>
References: <20241217173537.192331-1-ninad@linux.ibm.com>
 <20241217173537.192331-3-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217173537.192331-3-ninad@linux.ibm.com>

On Tue, Dec 17, 2024 at 11:35:33AM -0600, Ninad Palsule wrote:
> Add the driver to monitor Intel common redundant power supply (crps185)
> with hwmon over pmbus.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

Applied.

Thanks,
Guenter

