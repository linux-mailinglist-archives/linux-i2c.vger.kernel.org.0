Return-Path: <linux-i2c+bounces-10340-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E90A896DA
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 10:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB9283BB1B9
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 08:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3210E27A11F;
	Tue, 15 Apr 2025 08:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ua5uIq85"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC6E21ADCB
	for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744706102; cv=none; b=W1sp31OZQFt3j36RHjada6h1qvkOgkrvmVjvJ7hIU6Drpe3skuGOOCSJT8GdHHIaY+rw80WtpxFuYM96RxdcyVywr+MGS2Gz0HHeq5bXZ6XAlgYq3fu1XJ6D4ekh+Hzra8hMexwvI7L+QqtMuTvZViJn/vLX79A7p/VjJXloYy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744706102; c=relaxed/simple;
	bh=pMm89t95o7OKrNVjsydMNLYP38f7HmPCCO08YZkEjWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SsssfSXumfbe1O7JXapYgBN6nK2YpRAqoExVlqG0nL9bxPEPjLpQ1BPGW4ZtRtK9WNjj1xoK+55AvNuuxPleb1LpNeg9jfaMfgJ1WoPwqZHFvPLJjiqD7yEzfiFW67kt2knXriUyOtNl2U05cmHb7mlyvMWQHOzazWfRdr2Tjw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ua5uIq85; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-31062172698so23138741fa.0
        for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 01:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744706097; x=1745310897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMm89t95o7OKrNVjsydMNLYP38f7HmPCCO08YZkEjWA=;
        b=ua5uIq85C2AdK/AUBujwKDHq4bvs+sAeel5zshKpU0AjAKP622wi93GMDMsnTBRgHG
         OIj6CojC8Ld1FftCkGC+ZBQ3o0Ff8Xe5tQ/6rLwkXR9ZXw3K+677KWpqD07SHm2rMsv3
         z87pcItbzyDvnVl+pbWusY1cmhOW/OmRsgKtXran0qApi4jymcO8crPjyan6fn0JPsWf
         0tL0XFqtZduFkdNsBSxLsXh+G3anb6X1LViv9gpvLT61JLvzeWTeJeiDTcREBWMKyvv1
         CRkW9VS3gWVHviRe0DOeTLD+NMxuYzdWw6ooid3RZehoJjbZAPcGJCQPEOXQ5xpcuVT+
         k2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744706097; x=1745310897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMm89t95o7OKrNVjsydMNLYP38f7HmPCCO08YZkEjWA=;
        b=OxyxBGJMFPwysbzr7m0rkUTtsepuUNuWgQDfA3RKD6vZ2fhapLDzxjv5ViDTf5lFS/
         B2T08zuLLXouTra3row4weZEBWfYnb6e7gnvRE1y/JwbvWEvuoWZETwQvxht6nRmLi3Q
         /wGX4ivaEALT44Cy3vsOxMEynbVu+g1XTqbW0vG3H10WTRFvWaLPQjSrxxSBXtpX85Gv
         jXFu2nvPj9X8+A7fyTcvQF+qd+vssaj7+ReTHgciqvjc1gLKnhfzaaGzl8V6ay0DF10s
         wQUJV5A9HyPrbU23bIfOrmcIQs8EORxdFyIiVLX33+6FNCNPfFrb+/INlfyl5ekPnSCm
         O1aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPw5Ux3qHchDgcCLqUDUrvlLcGrsIGERYmk0R8gqzsUVAgPizXjov9/YkaILfLmwvYJE1aPR6yhTY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw8hj4VB6NGKu0zTSN/uchTbzmc6hQpb3LPqAk7G7+56ZeTLCP
	oXzZAfZ3rxew2A/iilXm9brOLftxLjFwHYs4kPPobSODcM2U/B1Mr8owknplw+u+6bdVgcs7Yx0
	8Z5IDZaa0dMIjrJ0JJ0r5BEUbGHS3ixOwq3ol1A==
X-Gm-Gg: ASbGncsmosRb+lSS8YcutnVpBGB17tZLiCtGJnE+iaSfsqNIcZsrbIzZLwBjodzD67c
	n2huCI/9fZEsnW8V5/aRiviPF2RhrtSzIvafbGpvdIq/FWHm6Shb26bkqGTZ3MjmRk+kSYL3fp0
	z5L5QiGF45EkRhuz9jmMjOCQ==
X-Google-Smtp-Source: AGHT+IF4gUiycvwx5xihfrwfi5caUZrBVPZ9i4AgpgkHBlnlRrfQCIE5fGWeGhYLe8jkRfewjlLY4sZ2tgruT1T8EY8=
X-Received: by 2002:a2e:bc22:0:b0:30a:4484:3ee1 with SMTP id
 38308e7fff4ca-31049a20e75mr43738081fa.23.1744706096919; Tue, 15 Apr 2025
 01:34:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-i2c-mux-v1-1-7330a0f4df1a@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-i2c-mux-v1-1-7330a0f4df1a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:34:45 +0200
X-Gm-Features: ATxdqUGEx-uTaMP16LDfzXWDKy3BdmMOqJmGzQUi1FnyT_MvycLeo1V79XiWUh8
Message-ID: <CACRpkda+JJKjwE_zqbyCNt_Ndn8y079mF6PW1AEGwtJ4WnCQ0w@mail.gmail.com>
Subject: Re: [PATCH] i2c: mux: ltc4306: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael Hennerich <michael.hennerich@analog.com>, Peter Rosin <peda@axentia.se>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:17=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

