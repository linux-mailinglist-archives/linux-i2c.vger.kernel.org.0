Return-Path: <linux-i2c+bounces-1473-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD3983E3C3
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 22:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDA6D1C21E18
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 21:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5973D249EC;
	Fri, 26 Jan 2024 21:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="euN+H75C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7406D1CA9C
	for <linux-i2c@vger.kernel.org>; Fri, 26 Jan 2024 21:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706303751; cv=none; b=bKxlQWi4cVPSxoSUkQLAq4qYVj68a6NAwLlDfm3m+BUdUnc399dGmpduR0ZbzLTJN9jLamtVplbx1+GmgZKenTzYGMuvX7QKgY4Pw4ktZ3jgfmq7rxDXkPWeSDZuJHptyPqazkHTh3//gUc5A/iDXRjAJM+YqidaDwsnxK1Urxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706303751; c=relaxed/simple;
	bh=wOysG9DzYSHUo3+iH5jcojpeAro4Ok4FvC/vPse3BWo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LzqoParnf4rCnpGIygAzXel1MwcfpeZxeCFJCNO/rR75AgDcqYLGH2S0a6aNEUYHmWzw71G6GcuaL80VfNN1mQg3P0qUxH3pdZIgVHQ83nZFXcjXZoZZEtl+x0Z1JHwf/ooEZsDkHnrehtyITVUS8KpHushOLmdTSs/R8LO1zxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=euN+H75C; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40e60e137aaso17627965e9.0
        for <linux-i2c@vger.kernel.org>; Fri, 26 Jan 2024 13:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706303747; x=1706908547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9SrvWh2L0ryUgVnN45lOrGnhJs3ZOxdXiE3KnSNI0Nk=;
        b=euN+H75CDaajPQMsFxghFozRXE5eUTBPyl8bq5M98eUR/gd85Seoggk6WEhXbzRMM0
         mIcxGaX3vqY8roy1tQp22BK0WIYfCW8OPToknGtxPV6lygicV7cD5uuAhXe4e1lRLgYJ
         qRKb6fc414U3tZ05/IMQq1N97DhYTdAThBv5mtY7k0K5yFeydkGJHF3JfZoEdGcCktqa
         U2/hVsO8mwqsHz7W3bsMkD9uz1Saw/wtNU6rTDWAdC+7Ew/pONf8RhYcRZl3Xv11qA/A
         8D+00iu78u43S4kj6Ycn2BTR4csvBo3kpY8efJs+TdNbxqLadp5VHgHmJt0Vz6uVD0IO
         VQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706303747; x=1706908547;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9SrvWh2L0ryUgVnN45lOrGnhJs3ZOxdXiE3KnSNI0Nk=;
        b=psh8TKnlhOtfdvY8B6tkKs0MRyV40X/PyR0Gjvd+R8P0MlJjlVIfunQ/zTcSGFJcAw
         1wJ7Eyvi4F/4rgbTTHY8PKOSE7qjG6IV6LmN8Z3onyw8wmSH4E1iTS8bbUkv988Q0gSM
         v8sjloG/ZMVAwFmm+awguEZiC//QpAbkfhHwmJosZakFTxD/Mqc+yEbn1AALI5jNJxTB
         EB7JYbZt/eKB69b1tz2bZyEoMPFx/V4QpLUx81R6l5c86Skka1iSc1vF2nVkdLQfF0kA
         IdJMWJYQrcrnIB2aGvyS5RSWjA5jJwiGCTR4pWDKQOz6BrwvRKiAliwt7ZRBMgd3cA+3
         Mang==
X-Gm-Message-State: AOJu0YyI7qpd5Vs7+FNLhIOJ9GivN85ZMQCgh9Us567weARJCpWr98qk
	eUKsy5O1OM9C51HfW2Mpc/HKLvwMwA+EOCulqhSOt7LJ18XTz8zH
X-Google-Smtp-Source: AGHT+IEUrndNbjFwHDmudrDjrpF1HPhKHynO57vMK5Rt7Si4MU/aoHoxDyo1tPeoRMf8hxVjaiFzCA==
X-Received: by 2002:a05:600c:5028:b0:40e:47cb:6d75 with SMTP id n40-20020a05600c502800b0040e47cb6d75mr299949wmr.58.1706303747246;
        Fri, 26 Jan 2024 13:15:47 -0800 (PST)
Received: from ?IPV6:2a01:c23:b936:a00:2153:65f5:37dd:e726? (dynamic-2a01-0c23-b936-0a00-2153-65f5-37dd-e726.c23.pool.telefonica.de. [2a01:c23:b936:a00:2153:65f5:37dd:e726])
        by smtp.googlemail.com with ESMTPSA id eg18-20020a056402289200b00558fc426affsm970964edb.88.2024.01.26.13.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 13:15:46 -0800 (PST)
Message-ID: <90278953-69f9-4602-be25-37da18e9ffb3@gmail.com>
Date: Fri, 26 Jan 2024 22:15:44 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] i2c: Support i2c_register_spd() on multiplexed bus
 segments
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
 Peter Korsgaard <peter.korsgaard@barco.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <9f37f64e-f5b8-4928-8716-6d2846c2688a@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <9f37f64e-f5b8-4928-8716-6d2846c2688a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.01.2024 12:23, Heiner Kallweit wrote:
> i801 is the last bus driver supporting I2C_CLASS_SPD. It's used for
> device probing on muxed bus segments. Only known use case so far is
> systems with more than 8 memory modules (with thermal sensor) on
> muxed smbus segments.
> As discussed with Jean, to be able to remove I2C_CLASS_SPD completely
> the following has to be done:
> 
> 1. Extend i2c_register_spd() for use on muxed bus segments
> 2. Enable explicit instantiation of thermal sensors on memory modules
> 3. Extend i801 to call i2c_register_spd() on muxed bus segments
> 
> Step 2 has been accomplished:
> caba40ec3531 ("eeprom: at24: Probe for DDR3 thermal sensor in the SPD case")
> 393bd1000f81 ("eeprom: ee1004: add support for temperature sensor")
> 
> Patch 1 does step 1
> Patches 2 and 3 provide the basis for patch 4
> Patch 4 does step 3
> 
> Note: i801 creates the mux platform device, loading and probing of the
> mux driver may be asynchronous. Therefore we can't call i2c_register_spd()
> for the muxed segments from i801. Instead we have to add a flag to the
> platform data, so that the mux driver knows it's supposed to call
> i2c_register_spd().
> 
> This series replaces the earlier RFC series.
> 
> v2:
> - remove now obsolete comment in patch 1
> - fix link error in some configs in patch 2
> 
> Heiner Kallweit (4):
>   i2c: smbus: Prepare i2c_register_spd for usage on muxed segments
>   i2c: mux: add basic support for calling i2c_register_spd on muxed bus
>     segments
>   i2c: mux: gpio: Allow to call i2c_register_spd on a muxed segment
>   i2c: i801: Call i2c_register_spd() on muxed bus segments
> 
>  drivers/i2c/Kconfig                        |  1 +
>  drivers/i2c/busses/i2c-i801.c              |  1 +
>  drivers/i2c/i2c-mux.c                      |  4 ++++
>  drivers/i2c/i2c-smbus.c                    | 20 ++++++++++++--------
>  drivers/i2c/muxes/i2c-mux-gpio.c           |  1 +
>  include/linux/i2c-mux.h                    |  1 +
>  include/linux/platform_data/i2c-mux-gpio.h |  2 ++
>  7 files changed, 22 insertions(+), 8 deletions(-)
> 
Any further feedback on this series, or is it ready to go?


