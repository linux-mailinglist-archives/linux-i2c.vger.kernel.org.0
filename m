Return-Path: <linux-i2c+bounces-5982-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5813D967BF9
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 22:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94DA0B21106
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 20:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364476F2FA;
	Sun,  1 Sep 2024 20:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZSTFNxE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6233555884;
	Sun,  1 Sep 2024 20:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725221324; cv=none; b=nOIfUF0q3Bds3I7MbAGIQhwDG3EAxLDd6dUdNRc+g7fuNpmVjrMmih8nrnwhfjPYQv3EvFF3eWpEfc+przl+aTjW2WQ1H+MFjmnldOjOVBMGWoi+d/sPq6tb/ZUl3QSoJvE4/dO1OMYYbs5aedwwoTBQ/FO7j8PvDUjkVF+I6tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725221324; c=relaxed/simple;
	bh=5GDiLXYPYR0yl4cdDkTQ7U5cfgzKtLmJ6SGoNL/OkHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hub6n5Yzq/KHScwcROebUKmXQ488ILQIU27CT8BHUCHKXW7734tjCGsC+xnPKJXyNqt3muVggpP2lvGGCqP/bW3K/yZ7216vuPOfZG6soykT2qGocs9RVLtW9oXhA0JYY99xWBor2I6MJpNi1U/OGjbGqwMiMgonD6lP26nlbqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZSTFNxE; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f4f24263acso52603781fa.0;
        Sun, 01 Sep 2024 13:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725221320; x=1725826120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xjqjSj/VGazRon4I2W0SxJIbXW1Oz0RFL3zE8cIx2xg=;
        b=ZZSTFNxECGWsCcP0aNTDC/cGUtbQ/BNFi/hmcbUK/e1b6lKbTy/kmeu4AA8MSBDRgv
         +vj/IP7x9/pGD/8IoPdxTY4ymQvVAdU2bHe3GNRdSJQqUJiPbMiejDQM8Mv+gyvrr1LM
         k1Yz7jMsS93+6aRra7ZJJSZIvjDi1tfHRkIlgkckB0n1JbzVWEahsieHBh1h1bdTHu7c
         74E1qEsvecK3KMW9YV93R0aIFDFze7p8B7IXeHNkb9sCsCEAMIqYZ5Zr5IbOjviqqOTv
         /p/EoGXnx/DBJfu8BpPhBKPocfvTsoTUwrkGfzRjTZwxNkg9Lw4g61+pQV7JvceHcLqf
         cBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725221320; x=1725826120;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xjqjSj/VGazRon4I2W0SxJIbXW1Oz0RFL3zE8cIx2xg=;
        b=w6stnsg6zIdGlph2L18/zgGX+q/YWwm0r//iZiUnD9WK+ma649irmI6vVUMlqHXTUo
         pAdKDMqlgRH11ZlFxIB+8gMeLQ876q2qU7AYCCXJHSdyKGpHVO5T42Z8JT5eCSbu6Z5G
         8+zAqXThHKGGROCfnxmhtFeH5rIVNGWcDFf1+/VVl8msIIr57+mlLWoRNHnY7qqg/8Gk
         QRY1q/F3557r7dZvCp9FM+KS7SoUMocKdDfbIQuqG0UXdzm1JTokvySnv3qBtby1pLrC
         i36sSrXoFfM5+F9ZAGH5rI3mz1/Siu1ryQ40ALG/cNTSo6IDaaHNFJ+8LPGOSHWOnmNn
         cGCg==
X-Forwarded-Encrypted: i=1; AJvYcCVPAtiTFgpUxuQv8XClT4A1DVVrdh3/LiIfqI0Y+k1GmJjP+aU5jBeakaF7pfhtG5FqsZDncgruxGpL2v8=@vger.kernel.org, AJvYcCWTx/8Ie6m1M6kwXwV5mnUTroQ0GzhHEjWCKyyclL8RYqrvT9vRJzwuY+Uz/fJBylD2VGtjdm4mxrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCpoaSOl4ZBmD/VG2gGG0RXCgQQp0HheJV7I2m7Nz5vt1F4P65
	2NMJj1V/U9Et08cAT9+amHEkULavYjNJ0+8C+iVNLw3UcDWnLXlS
X-Google-Smtp-Source: AGHT+IFJ0O501IVLkL8/1UtCpUnYb7N98arMju+uJ5w0tYDORU3GTViZEIXnRmA0in+tQf72szZTMA==
X-Received: by 2002:a2e:a590:0:b0:2f3:cb70:d447 with SMTP id 38308e7fff4ca-2f6108ad85amr102923241fa.40.1725221319960;
        Sun, 01 Sep 2024 13:08:39 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9c81:5a00:ed3a:5232:3874:6e94? (dynamic-2a02-3100-9c81-5a00-ed3a-5232-3874-6e94.310.pool.telefonica.de. [2a02:3100:9c81:5a00:ed3a:5232:3874:6e94])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a8989196500sm470092266b.138.2024.09.01.13.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Sep 2024 13:08:39 -0700 (PDT)
Message-ID: <930fbe3b-5e3f-4f0c-a193-dec1e0321037@gmail.com>
Date: Sun, 1 Sep 2024 22:08:43 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] i2c: Replace lists of special clients with
 flagging of such clients
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
 <ZtQ0KMWUk9iAUCCl@shikoro>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZtQ0KMWUk9iAUCCl@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.09.2024 11:30, Wolfram Sang wrote:
> On Thu, Aug 22, 2024 at 09:45:37PM +0200, Heiner Kallweit wrote:
>> So far lists are used to track special clients, i.e. auto-detected and
>> userspace-created clients. The same functionality can be achieved much
>> simpler by flagging such clients.
> 
> This looks promising and I like the idea from a high-level perspective.
> Need to dive into the details. However, I think this is 6.13 material. I
> want to let it cook in linux-next for a full cycle.
> 
Fine with me.


