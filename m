Return-Path: <linux-i2c+bounces-12872-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEE3B533B7
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 15:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 661BBA8848D
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 13:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BE4326D57;
	Thu, 11 Sep 2025 13:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tRHrj973"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA4D3112D9
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757597244; cv=none; b=I4ktHISRf96F1PNJjsrMtY6ihCHENojEaaSN5HvL1f+tEP6pmCUG29aMhxYgfBhHdVJb82TPTzPpOhhd5WggTkAvEbaF+YA+FGhYN5TZdGwEMP84qWwJh+19VX9RpnKQU1lLIRbJzquLqJw/rYXbw4dB6Jikwvm021QCw4b/qLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757597244; c=relaxed/simple;
	bh=A7yKxmDExMeHFoZ5DS5kS/O/awUG1znqYvQLffqw0n0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsC+ULhSW5HDDVzaw2rw3feNLZVZmH9l1BPipzW7tPnkt8wQtGuQYoeJ19TSa8/oKfHBNiDnT7MKE7ojhkUYzVbnCbvF3tUj2EvA5XNuDuS7YsM6FblOjPgKmhrSKv4wnqn2QKsXaALT4VBTIAT/ygjAFxiEJTj8cwGOiMZszyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tRHrj973; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-336c86796c0so5415891fa.2
        for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757597241; x=1758202041; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DeUccbeQ/kyM8X+MjI6gjEtxWNHGIttYsHKE4be0R7E=;
        b=tRHrj973G55r4OyQWIn7hI2+n0BSnUWv57OqmDIfoBhLK1FL40cPaHiE73uh2bV4Wy
         41aqxqZx+QMhqjklcVLEmqBG38QE/c97qC6X3ptv/mmv/LFMEwNi/Whqzqa3vz1u4hao
         4OlbtV8G1ULnGjE1QyBEZwQsfDE2xPGPI7g61osmt6ISwibFpglCJB3NU6FxIEZppT+1
         bQ+/advy5gI6LNRHiW1HYSgo5ydlP2Jxz/Se4H3GihA16QS2f6UbVKQBqLPHp1/F7yMY
         rpIBF/oUpvwtxyVa3CuyEbqgdbOrXy1x0fzoGn5aC2i8E6nB78qEMB+e9IwttCUzCSFE
         TFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597241; x=1758202041;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DeUccbeQ/kyM8X+MjI6gjEtxWNHGIttYsHKE4be0R7E=;
        b=levdqDSRh9msLT1Q65hO+LcgRsPvKJRz6hqGMcuN/UEM5blzhDMsE35F6DhsF0IAN2
         LdyFZbXATNDdb4J0Gq1IDPnAQHkq2yRDueEuFS31ZQoC9WV3JHdaUydlYpkJt16BgoPb
         nu3UT2kZxyh3/GW2nR41JTmcaZFZr0IRpMKxjpn+ntFyo6XgzAsTV2mmO7zpsC1S6ln2
         fwlDM3EoQOGy84O7LhnrkZV/4oscDuPadDsZt42Z8ZKl4TBPDP1SYyuW2CTiwAPLXNpt
         23r2TwiICbE5pz9VCt/WsnEIb+oKnIckCZCZP5XAxcwInUPulfKvrZd6Fm53BRex+YlB
         vfHg==
X-Forwarded-Encrypted: i=1; AJvYcCWnkq9iYgqwE1huSOiSGg1n2zRD63jkLoYBkbQ1tNAWHraS1IXRCruYKJ2Xp7uaLxbycLT5YLG3yww=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPBuyFz6DZpBaZ6joakdIDJ1oQYc7J+BbLPTlzZ3Xfm4SLEVVE
	k01Fn4VfWoUPHrUhz0KxtL94hvQBv5cvJ6cd3R4xVbFgNbNyAljxOhSEqn9cVXiQMHs4WBjV7fx
	4f15kdnfvfzK9BNK3kpXAoLfSQY5+Z4sgNL1ojP5oc2v2SEDI/720ryQ=
X-Gm-Gg: ASbGnctlhg8Lh5xEckGDcpFLq0I2cdQ4RII9xKJO2xCxeLtHxtRuuovl/QPNrFPvanU
	7My9BqUIUjKoYWgEOojcuuadpkUVJ7cAWAtqfQf+BySSLZo+ujSjT729O5/QZCw3hUv/ceWe+ST
	ndga7mCE62HjcHj2y460xMoRNq7qHbbQmZf1FBPPZHr1PFo7FSZxbqkeDnRejyEohqQ3OEXKX5f
	gQbzEEtwzxIlSymWUvKpviY4pjvrMOj+6GCwWZCd4SVIkKIBw==
X-Google-Smtp-Source: AGHT+IGBB6D1hNdnllPGf95Uj3l9EU2JfY7JcduwYvVgx0oChEBeWjvr5yTav4TCpbqAhFjiHyDJdIQ3rvnvP4CkIb8=
X-Received: by 2002:a05:651c:1117:10b0:336:b4d2:6c4 with SMTP id
 38308e7fff4ca-33b520d6d1emr49059301fa.17.1757597241429; Thu, 11 Sep 2025
 06:27:21 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Sep 2025 09:27:19 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Sep 2025 09:27:19 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250911131832.59335-3-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911131832.59335-1-hansg@kernel.org> <20250911131832.59335-3-hansg@kernel.org>
Date: Thu, 11 Sep 2025 09:27:19 -0400
X-Gm-Features: Ac12FXwV3WssWXmZ6g0rdQcbcorV7HFa5hX2cT1C7ZyRIRy9qt885Y0faI-jmjQ
Message-ID: <CAMRc=McKOTWxu=M0S0p0Uyhod-h4mNH9QfsLsycN4vbHJPtgeQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] gpio: Add Intel USBIO GPIO driver
To: Hans de Goede <hansg@kernel.org>
Cc: Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Sep 2025 15:18:31 +0200, Hans de Goede <hansg@kernel.org> said:
> From: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>
> Add a a driver for the GPIO auxbus child device of the Intel USBIO USB
> IO-expander used by the MIPI cameras on various new (Meteor Lake and
> later) Intel laptops.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Co-developed-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
> ---
> Changes in v5:
> - Move GPIO_USBIO Kconfig option under 'menu "USB GPIO expanders"'
>
> Changes in v4:
> - Drop include <linux/dev_printk.h>, unneeded auxiliary_set_drvdata()
>
> Changes in v3:
> - Drop (offset >= gc->ngpio) check and make usbio_gpio_get_bank_and_pin()
>   return void
> - Propagate usbio_gpio_set() ret val in usbio_gpio_direction_output()
> - Use devm_gpiochip_add_data() and drop auxiliary_driver remove() callback
>
> Changes in v2:
> - Add a config_mutex protect usbio_gpio_update_config() calls, which
>   read-modify-write banks[x].config, racing with each other
> - Adjust usbio_gpio_get() to have an int return value and propagate the
>   usbio_control_msg() return value
> - Use __le16, __le32 type + cpu_to_le16() and friends for on wire words
> - Some small style fixes from Sakari's review

If Greg wants to take it:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

or I can take it once patch 1/3 is in an immutable branch.

I'm fine either way.

Bartosz

