Return-Path: <linux-i2c+bounces-10609-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EADA9A573
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 10:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05B381B63B89
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 08:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5E8208961;
	Thu, 24 Apr 2025 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LRczqBk7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9EA2063F6
	for <linux-i2c@vger.kernel.org>; Thu, 24 Apr 2025 08:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482334; cv=none; b=OYARKROVNoa1z1xqbTb1hAZcgBRw/4X4P7zNFT1b5ggKkWCrXyH6N8NaCJcJiG5V9W5mSxqfhWGPWQNs279dRLx6k4e92NUFwNg7TEkdPpVYnK83JfJFBehZrW02MqHUtuLHtnmfQ6K1BPwqYifFhfHPEGhlLt+7qkfXtk3VJyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482334; c=relaxed/simple;
	bh=ngjogseDjbLoUNeCcKqcDS1JihcnEkNMlcYUIV+DoNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=PsSLThWO/EubqObLpe6PcbvHUpWlADZ6mzWxZnDgtO7lj39zp+M6GQH0m4J4C5qZuxsCzHAlV7Fd0K7CSFpK8UMP4XVfe9NrRmkco9F0vQh/DaQ27BhTUOwzyoyVyFWFY3rQp3tmhe58vhPSo5XUZZqZI6hIfRIb6xN3CXxIKsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LRczqBk7; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30db1bc464dso8122121fa.0
        for <linux-i2c@vger.kernel.org>; Thu, 24 Apr 2025 01:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745482330; x=1746087130; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngjogseDjbLoUNeCcKqcDS1JihcnEkNMlcYUIV+DoNk=;
        b=LRczqBk7+fTEuqOuvf/sG+ueEjruAUrFhaa6WPL49sgTP+bsK0peeL6KsxCSbHVWkZ
         5hs+ARh5sedq/MXm0lAqvdTXTfqrhuiXFXSIpy1wI9XcpQKAfkO/KZHmQGBBqe72IUbX
         HmCjgMsXkWZvrsKBs8wo9k8HNMpFSWLZEcvQiZYy+Sp52l2dil0TjwSwG8KHwSDQVx+2
         HaJVaiOlMux1nfbZSf1xLy7kOe+mXCNc+2C49eYbrPMnSjGV8/5f4OJvu7CvBNwOZq3G
         coWbyXrvP+jB+lz27pn57MeK2cu21jrv1Tb3mmb4+C34APn50xQk0ZoKPVR67utiP3dG
         uILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745482330; x=1746087130;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngjogseDjbLoUNeCcKqcDS1JihcnEkNMlcYUIV+DoNk=;
        b=MmuIbhSuZz7rp+GttN2JnVgmmvEySDQXhon1wk0x+3doGyrgZr9qgFmVUB+bL6YdAF
         0gAbVcMobIS0Z9ZT8Uaka7MjAzXyL2Rz7Jq9eFgYBwVViheYm3z0me2fxsLsy/29M+8C
         FFiSNduSeirlsIbCfmIGO3H37BKmzDDeKe1QMjcQQxastANxWi1BT6HlSEoScElC9Zdn
         QFcPHFez6cUilryYpfWaC5ZDVSMqn/NV8AGmQp0ZN6bHBRqV8unK2/aghsHliLiIt4rx
         7bU49ivN/CTx5XrK1uDx26EPeXT7qLkO51sp+udULLWyytz3gc2Kxs/25+msIuiLR++q
         Twlg==
X-Forwarded-Encrypted: i=1; AJvYcCUAONadxwf/53PmTV2+OTJugnDqBevUNj/s1PE8vNn5BUrUVPhfdpTkSUOTyaA1vSHPguguq73f/hg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvzsj9d8xNXAMKvWQRYYwbiWAOYSrnLib7oGZF59xnZmr9X5HV
	2GBPRNwTA1YImn1zOa7lo9VW9zMK9+2+xcU80rvYumIuOIC57EQRz5upbuCYE2T3jYRZRbKfavr
	v1wxcx1sxocyHfRoVtDx1zGif3yLtlWe9CN06MA==
X-Gm-Gg: ASbGncvfbreRxwGL/eyLLgO0HP+ngofndt6k8DK72jtcNrIzGVTfSC1SB/E3XwI6ld/
	ZfbpMtRmwQ3Uv8sQxz18kgWp60QtmxK9W0lgS60Hn5EBrW4R74AvD5ppfIBNp03gj6JKy7nAciI
	r34Y0yWl6pT6Eou9PtNgmLbdVhd5lkX14Ctf0zO1XEOHS3LiQ3B2r6GA==
X-Google-Smtp-Source: AGHT+IFbceL7o3clhs2RuiDyAIdchIBr6aL/LMDMKc7zOsM9dZhn008UBHhrWBGXFXtx2+8UxJ4Pdl2ytx5iQJL1TOE=
X-Received: by 2002:a2e:bd15:0:b0:304:4e03:f9d9 with SMTP id
 38308e7fff4ca-3179facad69mr7495011fa.28.1745482330540; Thu, 24 Apr 2025
 01:12:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-i2c-mux-v1-1-7330a0f4df1a@linaro.org>
 <16b14e5e-e5eb-5203-4cdf-44fbde9a5688@axentia.se> <CAMRc=MeYs0W31Kj-o530_8+EvhoDNzyZunk4xu6PbwK8N1OE4Q@mail.gmail.com>
 <aAnyAASQID8SK107@shikoro>
In-Reply-To: <aAnyAASQID8SK107@shikoro>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:11:58 +0200
X-Gm-Features: ATxdqUGHb7ZpzSc5O8AT5fXNftZF_IaZxwgwcmYklmj1TMA5Isf7jQ0qXPGf3u0
Message-ID: <CAMRc=MfdcH5dugiBLigTtoqAAsqZ_-fKJpJXnrDzQuSbKfw6oA@mail.gmail.com>
Subject: Re: [PATCH] i2c: mux: ltc4306: use new GPIO line value setter callbacks
To: Wolfram Sang <wsa@the-dreams.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Peter Rosin <peda@axentia.se>, 
	Andi Shyti <andi.shyti@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 10:10=E2=80=AFAM Wolfram Sang <wsa@the-dreams.de> w=
rote:
>
>
> > I just realized their emails didn't pop up in b4 --auto-to-cc. Cc'ed
> > now. Wolfram, Andi: do you want to pick it up or should I take it via
> > the GPIO tree?
>
> If there is no dependency in your tree, then I prefer to pick it myself.
>

No, everything's upstream.

Bartosz

