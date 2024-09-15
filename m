Return-Path: <linux-i2c+bounces-6752-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38942979646
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Sep 2024 12:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59B1D1C20EB7
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Sep 2024 10:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601311C3F1E;
	Sun, 15 Sep 2024 10:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMfyMZvZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC6743AD9;
	Sun, 15 Sep 2024 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726394978; cv=none; b=awDmmaCOvdWxxw07+Nz2ou23Jb4IhSSEhXHB75/l4jr/d7wUdiMMS6ga1QA0hzNLDz5Od7AQej6NTUNUfEVOeWEYPgJ0jvjPggXW7kTalRi6pKD/TJPgtM/s1f111ZZX7auIraPllrt1nH/eHBfZMHLwWU2oubv+9BGgW2gx22w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726394978; c=relaxed/simple;
	bh=AiBwI9RHjL7pzSgnaY8FkwVq8dBhc8U8HPlIjMivQIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNm9kaMjexPPmgkQjryWod4NdSKltHreGjH3W6oomhwFLu5pvf7Q/WYbS6zQNfYW5c5wpmwDvIhaIPAcfuaN/EWTJjyMm6gqoNqMLbqmQAnDmkvXwNXpVAXkESWcDg9f1IinGef136awxAe+4GoNeQNnr8mNfzsqRQqaBTEq9vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMfyMZvZ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5365b71a6bdso2465054e87.2;
        Sun, 15 Sep 2024 03:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726394974; x=1726999774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/DaHEnUjrhvmfJyjNw/EJYlPiWPCk7haRRTEhJV3pU=;
        b=hMfyMZvZwqqEm2epT4mdCdiyhtkN2ogEEdU81vO2bXr2J+lpTQb242YFLkdsz1e0dB
         A6j015JqN9aScEWQeJAqo+M+VdDyMa91Msr9xyjQn2DmgFV+gHJnK0g/Rgu764VO2b5u
         yGg36LOEiklEzvDGMJmNQVbPikqQLvoA3xY6L9nuO29e3JPE+d6ldIc1gw7N3iSnhOLX
         kW2i5CUqG9jPZ8EkmZrJIamGEiuBVUpRb73uLZFfWRpTXUkeJa3GPH7TNwKIG5uvLXUB
         hpZQFi9f2cbU0QVi9drjQI4BCX4s0XSPSkk/jjk9f2lVxKykipnpksM6Ht1ec6KeAWz0
         iHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726394974; x=1726999774;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/DaHEnUjrhvmfJyjNw/EJYlPiWPCk7haRRTEhJV3pU=;
        b=fnGhdKtGAhI01afBnynlWZzgBJCM28QN2D2FBJeE64zy7j2ZBiR/Fy1VIBxkT4I1Je
         cLDRQLHyls4ko8D6RZ3cPRAnYc7Jx0b5qHz+rRax+XU9J+R+tfQUsSAQI/tJLqpvBNqm
         47x60cz2T1wFkBjgmjwvT6jti2hgPSZixTXMjjo+1/bb4eAD3Itt+Dv3D9HmkjgfnPwD
         YI89dTWXkE1r51xeRIXroypm6S6GFk2efJdXH44S32NTAg+NkKjQ/1Momnua7MYiLaXx
         ZYTM6PU6wtIaPLXk99L939f7iLqQNzL58Va2xoNjb+j50aj7FSjrlN4fBqj1dahhrccC
         RKnA==
X-Forwarded-Encrypted: i=1; AJvYcCVUoRsl6ZWN29dZJp9Soj7zg/krDmOmVKqWXFpbGM0P0jURJEtduJ/kbkFegR7DdmYMxhQn5tbG6PVmbONK@vger.kernel.org, AJvYcCWIh/UgDWLo2boX/qZyxQVm95yhuGDQMqMrHFH8hzlMXELgKsDGucsOVs5DE+i34EvVwjZIMAOatTcN@vger.kernel.org, AJvYcCX/qccsO2EebcD0ilTyN8LN11FSmHb1z27tOAFj3DarnNQpypgQ3bpLQH0jhmysYMlIcwwi7doyj/Jr@vger.kernel.org
X-Gm-Message-State: AOJu0YwLGzPi11SDqWD7aDBiFOzNPoz+KAUjoDcQ6EZJlMYSloTWJMcS
	1J4T3WMRoiL2gHLDDhW96nALGJsHQMkTaIA51RPPVs0xuLjNAGh9
X-Google-Smtp-Source: AGHT+IGaUky0E13On+sxK3FeW8LoYl+upTv1F/M3d5F2vr5G6OAHtvOyCkJgJ5xhe603775A/voLzw==
X-Received: by 2002:a05:6512:3f06:b0:534:5453:ecda with SMTP id 2adb3069b0e04-5367fee2703mr4169678e87.23.1726394973484;
        Sun, 15 Sep 2024 03:09:33 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5368704c2c2sm513630e87.75.2024.09.15.03.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 03:09:32 -0700 (PDT)
Date: Sun, 15 Sep 2024 13:09:32 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
Message-ID: <ZuayXMGMdEqSyvUl@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-7-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-7-wenst@chromium.org>

On 24-09-11 15:27, Chen-Yu Tsai wrote:
> Some devices are designed and manufactured with some components having
> multiple drop-in replacement options. These components are often
> connected to the mainboard via ribbon cables, having the same signals
> and pin assignments across all options. These may include the display
> panel and touchscreen on laptops and tablets, and the trackpad on
> laptops. Sometimes which component option is used in a particular device
> can be detected by some firmware provided identifier, other times that
> information is not available, and the kernel has to try to probe each
> device.
> 
> This change attempts to make the "probe each device" case cleaner. The
> current approach is to have all options added and enabled in the device
> tree. The kernel would then bind each device and run each driver's probe
> function. This works, but has been broken before due to the introduction
> of asynchronous probing, causing multiple instances requesting "shared"
> resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> time, with only one instance succeeding. Work arounds for these include
> moving the pinmux to the parent I2C controller, using GPIO hogs or
> pinmux settings to keep the GPIO pins in some fixed configuration, and
> requesting the interrupt line very late. Such configurations can be seen
> on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> Lenovo Thinkpad 13S.
> 
> Instead of this delicate dance between drivers and device tree quirks,
> this change introduces a simple I2C component probe. function For a
> given class of devices on the same I2C bus, it will go through all of
> them, doing a simple I2C read transfer and see which one of them responds.
> It will then enable the device that responds.
> 
> This requires some minor modifications in the existing device tree. The
> status for all the device nodes for the component options must be set
> to "failed-needs-probe". This makes it clear that some mechanism is

Wrong status name ("failed-needs-probe"), "fail-needs-probe". This is
minor, but it confused me as I went through patchset first time, since
there are different name in different patches.

> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

-- 
Best regards,
Andrey Skvortsov

