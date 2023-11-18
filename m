Return-Path: <linux-i2c+bounces-251-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD947F030B
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 22:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECAAF1F2246D
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 21:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2D71A592;
	Sat, 18 Nov 2023 21:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdS/6sVM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51BD9182;
	Sat, 18 Nov 2023 13:49:55 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5437269a661so8243884a12.0;
        Sat, 18 Nov 2023 13:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700344194; x=1700948994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tu8B/DrosgiV85GSiOsUY9FsBSgQ5Nsx1mRRxIDJDOU=;
        b=YdS/6sVMQ60XA+ogF1yphuhWdZol+UlrJRCJnQ3Nt0ljfdbf57bPBTXJWlnMWZNiwZ
         7NV6dIIt+jG8MuVfOcSgs7JCxAqrzGy53bPjzOg9kCbWmqnwKRg3OCU8V3WZGw7W0qSK
         CyWTQMvw3LOeNBCSfppDK3ajn4nd9Lu2ueCA78ltnbLIoAnBeFRJ9r+Uo/ZnRK7/FHLp
         j2I4/DyhGTEbbLRHZY0TBjJqByPhdWdp3vs9qkoy0lgKRLUZpWVKRIiaTT4SOPDIzbIY
         CAEXEgdZ0aMWLKTXzGUfsoL7VwymZohPSCgcI/u5zI/ADmdfwBFtrPz4jDa67vkrh8Kk
         qiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700344194; x=1700948994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tu8B/DrosgiV85GSiOsUY9FsBSgQ5Nsx1mRRxIDJDOU=;
        b=jLrj7ZVKjT5CaNaX4lEdvsjCXgH//4sFJLbeYw2QDxXVJc/MVeVsTs1RU0nEmCOK3j
         Z3pBOPmHiaFZOSS6VGjouVIe8LkPW2q1KSLa3vMWTAnt4YKVgZiHD2F9c6qooJRdB59P
         xOadtdCNBxL7oExnk6w3Jgu+r2iAjf5Bl3Srq4I3eJZyYwz6n1JPwY2YOdOPul1VpUsc
         xFvcwqBXUI+5ywSFbRBjW5eE+e8qNkldG5xJtd33pFs+RSICcbSpcg/XOH5No6N9No7S
         V0+rJtwCU1FgjFWa3XxmhjXtqBBZztdu+1cbPkp1kn141sgtGXwqfVljBe0boEz6WWPv
         EiSQ==
X-Gm-Message-State: AOJu0YyrJzZTJMHhESXwENkg7mZr8c+AM64o63FEWoScUUqJLY/LF8f/
	vBq/hkOKZdGWbCl+RXpmquU=
X-Google-Smtp-Source: AGHT+IGvGe/YhVqfTTgGOZH6rxAZKgoCFGPA+F4kHVoXMK1rmU/eIymVSurR+kzjcJHGaQ8dnTci8A==
X-Received: by 2002:a17:906:38da:b0:9ae:50ec:bd81 with SMTP id r26-20020a17090638da00b009ae50ecbd81mr6889839ejd.21.1700344193504;
        Sat, 18 Nov 2023 13:49:53 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id cm7-20020a170906f58700b009e5e1710ae7sm1028955ejd.191.2023.11.18.13.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 13:49:52 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-i2c@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 04/20] drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 22:49:51 +0100
Message-ID: <2705713.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20231118174221.851-5-hkallweit1@gmail.com>
References:
 <20231118174221.851-1-hkallweit1@gmail.com>
 <20231118174221.851-5-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 18. november 2023 ob 18:42:04 CET je Heiner Kallweit napisal(a):
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
> 
> Preferably this series should be applied via the i2c tree.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
> index d1a65a921..f5f62eb0e 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
> @@ -302,7 +302,6 @@ int sun4i_hdmi_i2c_create(struct device *dev, struct sun4i_hdmi *hdmi)
>  		return -ENOMEM;
>  
>  	adap->owner = THIS_MODULE;
> -	adap->class = I2C_CLASS_DDC;
>  	adap->algo = &sun4i_hdmi_i2c_algorithm;
>  	strscpy(adap->name, "sun4i_hdmi_i2c adapter", sizeof(adap->name));
>  	i2c_set_adapdata(adap, hdmi);
> 
> 





