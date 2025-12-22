Return-Path: <linux-i2c+bounces-14676-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A25CD5C67
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 12:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F9C630132F9
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 11:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6DE1F936;
	Mon, 22 Dec 2025 11:07:06 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C53730BF68
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766401625; cv=none; b=S1+OTJTuvkYiYIHtci3GplACeVAGE8uVFfotVZ5SBfl1Sz3wwfl+Vgo9/T7JmmxiP2cnYl0Shgy10aiM78MxDgnRmY9y5kCPcMBiCeilPwjBcJpW+MwwdGdZsYH+DplXN+fBc8Sx1rEBDA7YMN4a6wLwrmU8yJXpHxGOZrpkl3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766401625; c=relaxed/simple;
	bh=Sa6vRFp+J8CzdQeFDX4yWNCdRt01fLLpAObxTP7lVIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MaQX57oCNTpgC4kLGCLRdTWP5N/+JXEngtV4SQcJFMndghMhKCuTFLqWIz35gwGIXG30V/W6rDg1lRdXr1r2yPaUOju59YJGxRsg3fPgi0BICaWySInV/eJMV4GLz66Uj2o7OrA9xViLEmLbKdtFBWH7hAXTzZuRUvkjUr2i+hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-450b2715b6cso2359745b6e.0
        for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 03:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766401622; x=1767006422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Er9fT5sSTO9v6Ol7FhPUI+D4OHHff+0Re947MEjlztA=;
        b=vA/31slqx8IB9tAoq/1A1v9th5lgu7BA8IfvqNLh8g4PyvGfpdER8F30IRWdLD44Mb
         AsexUriR1qdZdN2f0FNTpFOgimTN4fUcuR6ZqLGMu2EAajTrnAwCyctBNn/ePOfREmBt
         agPh3gmgZm2nMi0DWUncy89Np3BT4yne7HaFKW1IX+bwRb5JdL4MkM1hz/BVStwPwGV7
         u93rNKoAMIC/glFos3OFAPDv5+Eru9JrifAfsyM3OI555Rh2XIU4ysW4hGgJV32RdoYS
         VhWUAesHHZYJADuMRETaGceW6bjwDGMsJjc2bdqogA0RuRdxFOFZBdb9yWg7/fBAED6B
         +Qwg==
X-Forwarded-Encrypted: i=1; AJvYcCXzSJN2vDkO1Ldi+EWBy+OjTDFSjeARBupraLT3ag58rcawOGLpGwhMOMGAgfpsSyXX7/krvv5d73U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTIgeJ5JHjMsfJZ1rAp45svvlk2iy8im/39T48l3YvmfkP0l3f
	PtrJCCCItX2hNehEhGWCCb1GJm0N+YdYFTmYk/yQSPhOpo2M2HetFIFgWOgcoNIt
X-Gm-Gg: AY/fxX48nCHox6zbRVTQMChELvm9ZlK2IHa7doysZsjcbUEUm9X62RYJlamOeZdai88
	Qmpm+2lYh+Qo3X63k3rpWi9hjcbkJDrRWtlnkOHIH41VqPGm41arEK+3GPL6HyvjAn0NydW+JWV
	VvSalG+cJj60M0FnHaVymLpyDUwEr6cbeyJSoRF/E40CXVHzqZKmDJIAW0f52+SBlPfuaiaPBKl
	Qu2tv8Cz/rr3yYsuIXtcGAzSKDBKt1DuhelRl8HLs0an63wphMyrw7oLgkl3ZLInoDAGEpxIgUJ
	3frYfGp6Vsemys8qa31RUIVT+fsH0BjOBSQU2bB5aIXtu/DKuid/j6B0xvFQt0ilK1P0kGcawJs
	JRLY7z73XXPqQuWztcnu2fN3aoWS2SQSKvGnBj7h3TkLvhuyewqECaZYI7eOIKSLHOUGxIsWePc
	r8XjTfNIvSHKOVP7fQmVlmcIdq6pdX+a63CaBM6Spg0UuAtQUo6JxusnXwUsI=
X-Google-Smtp-Source: AGHT+IE/CIvMHG6sdm9sV1Dr76wFjapmfpMpSugHRYj+x+cJwz7ad3oa9VyawMivU4Mp1khEK9n62w==
X-Received: by 2002:a05:6808:c115:b0:450:3da1:aecb with SMTP id 5614622812f47-457b20189cemr5124712b6e.1.1766401622367;
        Mon, 22 Dec 2025 03:07:02 -0800 (PST)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com. [209.85.160.41])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc6673ccc2sm7180019a34.12.2025.12.22.03.07.01
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 03:07:01 -0800 (PST)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-3ec3cdcda4eso2875111fac.1
        for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 03:07:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVsxOagyKQ3nwAJi39hVa/qA3IFwkMN9DwPmblUhTxvOLbdOsAGvD2UHI2K8/hEGitaGzheZhRcPuk=@vger.kernel.org
X-Received: by 2002:a05:6102:e0e:b0:5e5:5ed7:60ae with SMTP id
 ada2fe7eead31-5eb1a817635mr3544923137.31.1766401227460; Mon, 22 Dec 2025
 03:00:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com> <20251210-rz-sdio-mux-v3-3-ca628db56d60@solid-run.com>
In-Reply-To: <20251210-rz-sdio-mux-v3-3-ca628db56d60@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 12:00:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXmKPe6AyfAeD9nObqVhofZ4a5559_=DbDZzJ57A7=k9g@mail.gmail.com>
X-Gm-Features: AQt7F2qYMU-2Y0vKWd5gUo3SltdOK-02OVX3vIl9B9fuc7xPsFnO8gx3yQGyGmE
Message-ID: <CAMuHMdXmKPe6AyfAeD9nObqVhofZ4a5559_=DbDZzJ57A7=k9g@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] phy: can-transceiver: drop temporary helper
 getting optional mux-state
To: Josua Mayer <josua@solid-run.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Dec 2025 at 18:39, Josua Mayer <josua@solid-run.com> wrote:
> Multiplexer subsystem has now added helpers for getting managed optional
> mux-state.
>
> Switch to the new devm_mux_state_get_optional helper.
>
> This change is only compile-tested.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

