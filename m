Return-Path: <linux-i2c+bounces-10590-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88959A98808
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 13:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EC955A00A9
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 11:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B85D21FF4D;
	Wed, 23 Apr 2025 11:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HhV/ai/G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A8D1A0BFD
	for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 11:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406060; cv=none; b=So/dG5Js96Ef4F8E9fXabuOGRtyVWpooev3jABLllA8g4Kwb3mA9e6nNKJ6gdkbSfwoS9KArOueDERS94JamuripdelKr/GqXd9Iaxdi3VH3cXqc8LEVB4LSuRfk1ZyXOw4eF4uKjIawUQ/tmwT7y9s5CT1faRX/2aFpVcHDATY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406060; c=relaxed/simple;
	bh=YnfzKMEwLBYoy9n3/p/PzVFMeRhxGAjnJtCfLo3CK04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ApVAPUyAPpe1BKcKzoJ6vBOGMAzhhbUpgr0eToAojT4C7MfDu1YUeEutqigCDBLlyrVLz9oBOUZV9Nz+2At4Hlhc5T5aptws+ahryLxXNPGjZ2JoO3wW5MdnwgAqSyVaSns6QokmT3CH3nb1bdvvn8ucnWiVusZe1TMjlpDhpnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HhV/ai/G; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5499659e669so6804656e87.3
        for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 04:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745406056; x=1746010856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnfzKMEwLBYoy9n3/p/PzVFMeRhxGAjnJtCfLo3CK04=;
        b=HhV/ai/GZNfP0KshxWTOSpygdXV6n5HU1KBbQM/2ffGVjmDgv2W9aUbLM4Jc/B+slk
         ELFFg6+XRwmkqZFdTFBakZ4g4COw1EbC0OfEcxcQikk9RtTXLn0VioLfOcqX0t3W1psN
         /XLiqfnbv+jqJ7LsGoOqvqGWeADMezDebdsjemufxzy+Nwd5x1RJeG6WgQTcUiVcX3HL
         fZXf2XlJHyPqdysgEgay18H/l8zq+xYffJcPbHP5txcYbeY7VSjMXIdtfZa4VoOUJQF6
         VK5I30/rl5QK7E7UQ3eXJ1uMb+QXiv0LOhQmC+XswAvHOkm8d8Rg7FV7B8TUUl0KrUaV
         rmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406056; x=1746010856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YnfzKMEwLBYoy9n3/p/PzVFMeRhxGAjnJtCfLo3CK04=;
        b=H+ck0HKZeUvD370/hJd7jf7LKwOfKbLCfJTpN0fq6ArEHjm0rzQ9ed6B/gfJS82sIH
         fHRnD5sKm00tEpKoGkQ18T2/nX+RTpTl/qSnY0BTXjUkmXJsvslqoH1l7t5bF/cjefMj
         347DFudyJt5A8Uc/hbpQotgJUz84aK17v2ZrdYGfEgfWVDTMG5aQKx0f74OmPoj+cYsf
         3ZRIkwuX3pjnQYbbs55Sir4jG4do6o9BSclL7OtvOGwQHuQMUch0+NH03Xhz80YmwcYM
         klIG6UMX/C95LJuIETir9ARPfc1/9aSzpH0KAIxPbbC0ytamDNin6uGcGkLiIIWbpUa1
         dkAA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+QfgLiWK4xRSjgjncRZczaRVJRkbUASvrckX01VB/v9y+dobwC8p24j5P+4ws2DYAQ0d/coJd3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuvZs4nkywtfx29V/dcQf43t5Fuyf1G4OXB4NQwsF8E24X6JVM
	yFE/cWTf5Q9V1jVnc/Np9nCAhMUiQHwOiUv7fFJmrVbPLbStqUQb5SfvCLzqo8AT04oO2rra5UL
	Y3vZcxvVRRV0fSmFeEJ1knAGNhl52P27REE3RZBlwN0fQsbZxw84=
X-Gm-Gg: ASbGncujJU+D+o1IA5o3WOx33bZW66ivvFiml4co40r2p/a6j9UW8Lp3Zgm1xY+vHPc
	7+ExgwycJ+FKD1+mazRmiTUGPJy5pCDxoE0/XDaZJbkrQv0PqISx1Gn9/j86IOKa7eIq7zO6R/3
	yyYQ4rqmjwq0W97yopMOpx/w==
X-Google-Smtp-Source: AGHT+IHMCySz3z6SljYbbcEsFOxE9JkbCutC0ziw5S/nYiq5XuUyK8ef365iq8jZ7YlaLZiMtkJdFLKp9/dUsZ/eF3c=
X-Received: by 2002:a05:6512:31d0:b0:54a:cc03:693d with SMTP id
 2adb3069b0e04-54d6e61dd6bmr5088730e87.9.1745406056469; Wed, 23 Apr 2025
 04:00:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 13:00:44 +0200
X-Gm-Features: ATxdqUE_gVFsHXxkj74AZEmclfvOPWvTaJ08Tt0ls6iGN_ulCw8C7P0a0FJrIas
Message-ID: <CACRpkdYdDPL_L-q2bofv+6wv53xSCsvOugt7+xE3oxX2=PtMew@mail.gmail.com>
Subject: Re: [PATCH 0/6] hid: use new GPIO setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Rishi Gupta <gupt21@gmail.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 10:55=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO drivers under drivers/hid/.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

