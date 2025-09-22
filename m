Return-Path: <linux-i2c+bounces-13088-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B764B91C56
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 16:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EDDC2A1439
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 14:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1522028136B;
	Mon, 22 Sep 2025 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QOPfvEsM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C97A26B95B
	for <linux-i2c@vger.kernel.org>; Mon, 22 Sep 2025 14:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758552167; cv=none; b=VyGcOLo2Z5v3JchEr6NVnIq5akRy4AneSjkn2yWe45xeNHO/GRZoY9WY5Ad5qWxpfoUfHw3dhO1HlCRYP9YP5spDEej/BIMobAsSiRVTThGtkOnQLH0n5N35A2EhksNPjWSNu0FX8BrQbr6y8yzpZaBq2Qmqg/4TpTgVh5VP+U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758552167; c=relaxed/simple;
	bh=cbgpVXooeJQoxtDkq+orZaKLHLZsU4tUaffVgtq1Mcc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1t2QLehnkJ4HBhX4Dz9p21sarqaGY+lzvBwpmkkTbWLXCC0xOzCqNYoQfEv9Fpn5uW+rksXXLhRUzJJ0o4P6XGbhws62OFPUGHaX8YpvwabZxorD0ZH+vC0+E4lBt4ULMZJhMOnkbUvNcAF6wldthpW6O+n0bIAiCOfHpl4N7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QOPfvEsM; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57d93a4b5e5so1476159e87.3
        for <linux-i2c@vger.kernel.org>; Mon, 22 Sep 2025 07:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758552164; x=1759156964; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cbgpVXooeJQoxtDkq+orZaKLHLZsU4tUaffVgtq1Mcc=;
        b=QOPfvEsMMEXAemiKfxrmMO9uFUY2th96vvKPTOtvxV3ikdb1FmTLRwjoX6RFivconY
         PzG+pCtxzyOFf6sAWFAL1bCvAhVXdEOunLbTe4jq4ABp1PZaeOVgGrIkpbyS4XLfJFnM
         0MVNU4sVv5x8nltBGXfhfxal9mmCyZ3v13vt/pitpGzJO8EAWgwjAKakptw3mYq+tZ7V
         4idRp4EOMvgLCUuBGCfE9pQIflKYxXhO3LX8RwmmTwHBG7njzouZWsRxufMSHT14TzVX
         u/Qok1HhHFGrKRw1rXVJbdVdYiQ1aCPuBsREu5ilKCuCjd3AEHvbwQGn+L4v57f9G3sX
         3Ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758552164; x=1759156964;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cbgpVXooeJQoxtDkq+orZaKLHLZsU4tUaffVgtq1Mcc=;
        b=I1P928pXi/REBui8+gy4UPwEy39D1kUbaNbJOx+HDXoq0ypTgM3QheZtAO82d60EQH
         1IpsP66sxt9XIM00yr0mNhdbOLX6mN5s+m8Z5CXnqmKjiTSeL3pdrO1rFgyMekqSarDK
         cVVu9MjDga13ugnjw3enboIHwCaKMUMcfoVA1k2/iwRz+aWBSeXaOSEEINBMWO+8FJmf
         T/77QWotGAqTfi+3E+VCns6KdoeVOcVihd/LB7jxk1TI2tHrVI0SpM8jkwDKZtkmxiSV
         zYLroX+H0quxqB+UgMLtiLoh6aGThdTSXLJc/ueyX330Q3mSwzOU/x+z/wGa9Fek0DzD
         A0pA==
X-Forwarded-Encrypted: i=1; AJvYcCUf3sQZeEPTZQYVovDCFaYyBe6dupEwnQXQuE5rXA+xZLHuar5HLAdfvtWmLbZ8FPs0xcIzrDU1HwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqe+VAEsaWrJJrDl4aAgf/HfPmuXBLO3OzfOn5D8ur6/H/ABX6
	47+j3yp2LUZdD3mZqiQ3sd07p9z3mPnsb0Irclo4VJbyJK/1AftXczTkcJDwTuzE0X8hGzLhKrR
	S77I3/ta/Ri8yJzyeOPC2gbPBBhMGIonVXKH/OWu+Dg==
X-Gm-Gg: ASbGnctcdqM2vCbU3Ot90BpOCVyR0/7EpOYXZtPb5dZ85IGhyUw5QlLZP6KgAzSZzVn
	1T2IBDqXn5fO+VLNi1aCrT1lof6vk0KbbMQboGMUhvPpb5RxELdvFdQBLvEs/u2kGuj1Waz+c7F
	p0KE2uzGzbu4E73r8E1WKiQ11xG2fjiPg3rrLqcJkuEaw1gT92uQYOC2CDC7E3/tHCNsP5W8yfH
	0O7eDFFW/OShB2lLksCsq0jcoDQsA9Q5me9fA==
X-Google-Smtp-Source: AGHT+IHaE9nqceFLj+JInNghJEvz7NuUskN6MHfzPYyLxUjABx4E3I4QkTLcuqh8bctTyJSvA4j3CUuzt28CZtnMZP8=
X-Received: by 2002:a05:6512:2395:b0:57a:501:54ab with SMTP id
 2adb3069b0e04-57a05015577mr5016702e87.50.1758552164438; Mon, 22 Sep 2025
 07:42:44 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 07:42:43 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Sep 2025 07:42:43 -0700
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250922-i2c-mux-v1-5-28c94a610930@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com> <20250922-i2c-mux-v1-5-28c94a610930@gmail.com>
Date: Mon, 22 Sep 2025 07:42:43 -0700
X-Gm-Features: AS18NWA6jseTsU1-el3RwI7NaUjcbCUkPeK98Ko-CDeIjcGra6Ar6whhs_lBYGo
Message-ID: <CAMRc=MdMMQxFfkMPHaUg9nMWuW9F1p+PT2i-ggcU5SSFKOVGKQ@mail.gmail.com>
Subject: Re: [PATCH RFC 5/7] i2c: davinci: calculate bus freq from Hz instead
 of kHz
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Michael Hennerich <michael.hennerich@analog.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Sep 2025 08:21:00 +0200, Marcus Folkesson
<marcus.folkesson@gmail.com> said:
> The bus frequency is unnecessarily converted between Hz and kHz in
> several places.
> This is probably an old legacy from the old times (pre-devicetrees)
> when the davinci_i2c_platform_data took the bus_freq in kHz.
>
> Stick to Hz.
>

This looks good but would you mind also changing the name of the field to
bus_freq_hz in order to leave zero change of misinterpreting it in the future?

Bartosz

