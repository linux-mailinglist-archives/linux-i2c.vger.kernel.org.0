Return-Path: <linux-i2c+bounces-4998-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E559325B1
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 13:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69AAC1C224DF
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 11:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F1E1991D0;
	Tue, 16 Jul 2024 11:33:37 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315291799D;
	Tue, 16 Jul 2024 11:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721129616; cv=none; b=hKKCnrkIOnEtPolc0nnRD1glSg+ArLKDEIaY74hXXtHChUwuWj33GM9W7KQGiZDulJyJZHvP8nlIHS6sxdTJ/FYPc34Zw4xF7/NHtDqnVVP6T4ac8iFnzlurK+wLL+yJcM/qdm3mbwbNz19m9PhrY9+JzZWyxiw45Gzb6YeBwQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721129616; c=relaxed/simple;
	bh=sosqrIxnBeUnlwj1KeZsQy403vNwtsK+OO+Up7CJZpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TS4yilI06QP7YXwSApuYtSnZkhes2kLK7ywOelGesBOBg59hAxwbdp2tdzbUWhF1cesP9Jy2umj7QdSBN6fIPEhPBpA6hUpmwYE91r3bHUvu5tzNUyu5ql5GpVbfkGnzMGZYNFTGdotkgSq3DVSLanMgxlnGpGCT1Gg4p9Oqm5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-65f771485f2so28750857b3.0;
        Tue, 16 Jul 2024 04:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721129613; x=1721734413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTjJvunI/3IdeTHGVPBeO3bQArOQUTZAiowXG2DOChw=;
        b=e+nvCMeT6b1nzsmjvdoMvprJH1Ycio7I82CBbACYJdc1vOHRd+9+cCFBb2039K+0Ax
         9xXQr1rdgBfUzpnaKaGaCo9mMMokkjkppicSUjDAKJ/eBUiRePP/TCp5R4cqnp5nZrvP
         2wAjN3v0oa300A20K/IfZjReyANAvndSXzBtDF3H7Jg/1HqDlOozFqE7KUlOpakf6dwO
         tQTx56X+OyquPiBDhzb08xcWYFNSVME9Wo/4TB3eDu2HIzfOtQTybL1VpO4wbDdrvatq
         C/4o1TCXOKHrXzCC8yaWgndIb5rvsB/R4H/lR0tBY4DjDvqW9MCBoIAFJgOeChH/Q3We
         p7Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWc8bjsIqZA9EYrr/aEpHqrpklf5bWGA4wzR++G9Zllx7MwCtaWSDOkeTko5RyhjYY8v4XpzD5pJnwfOBAo03eDgE5rVi2vgC6p
X-Gm-Message-State: AOJu0YzQU/Tfp4HLxpN8E2Y66J3dhp4ht/fkkf9jkD+awtt8L2ksKWQm
	pL3fSZDOH4iZGpvk91TsFzSpdmvvddynRSmf6zHH2ipwDzPOSFH5uAOmN/Kq
X-Google-Smtp-Source: AGHT+IE9tnw4i4Q1y38buyT2l2NfRqFGMwIZ780Q1WZf7lP1eYoALkXHEvZdzmmg6PT7QtiYPPUvPQ==
X-Received: by 2002:a0d:ea07:0:b0:64a:7d9b:934 with SMTP id 00721157ae682-6637f2badf5mr19604947b3.16.1721129613548;
        Tue, 16 Jul 2024 04:33:33 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-65fc4452033sm11204797b3.126.2024.07.16.04.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 04:33:33 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-65465878c1fso60920017b3.2;
        Tue, 16 Jul 2024 04:33:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5J9JZWTVnaCGWqtrB8il0g08ZcgaZHxGhWKbg2JHvJKOOdpS6Skqd5fKOCUggdwZmM5kZWHQRtmCi1gqkgqA3gjmQLZyBXF/9
X-Received: by 2002:a0d:eec1:0:b0:64a:efa6:b3d5 with SMTP id
 00721157ae682-66380c110afmr19020037b3.37.1721129613037; Tue, 16 Jul 2024
 04:33:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240706142313.2028-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240706142313.2028-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Jul 2024 13:33:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2yU75c2Erv8swXwTye=TQWAHQNQCQ8xMHbFspm1Ohjw@mail.gmail.com>
Message-ID: <CAMuHMdW2yU75c2Erv8swXwTye=TQWAHQNQCQ8xMHbFspm1Ohjw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: delete entries for Thor Thayer
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, linux-i2c@vger.kernel.org, 
	Dinh Nguyen <dinguyen@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

CC Dinh

On Sat, Jul 6, 2024 at 4:24=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The email address bounced. I couldn't find a newer one in recent git
> history. Delete the entries and let them fallback to subsystem defaults.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch, which is now commit
8c91b81933d35ae4 ("EDAC/socfpga: Transfer SoCFPGA EDAC
maintainership") in v6.10.

Dinh took over a previous entry in commit 8c91b81933d35ae4
("EDAC/socfpga: Transfer SoCFPGA EDAC maintainership").

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -846,12 +846,6 @@ ALPS PS/2 TOUCHPAD DRIVER
>  R:     Pali Roh=C3=A1r <pali@kernel.org>
>  F:     drivers/input/mouse/alps.*
>
> -ALTERA I2C CONTROLLER DRIVER
> -M:     Thor Thayer <thor.thayer@linux.intel.com>
> -S:     Maintained
> -F:     Documentation/devicetree/bindings/i2c/i2c-altera.txt
> -F:     drivers/i2c/busses/i2c-altera.c
> -
>  ALTERA MAILBOX DRIVER
>  M:     Mun Yew Tham <mun.yew.tham@intel.com>
>  S:     Maintained
> @@ -871,21 +865,6 @@ L: linux-gpio@vger.kernel.org
>  S:     Maintained
>  F:     drivers/gpio/gpio-altera.c
>
> -ALTERA SYSTEM MANAGER DRIVER
> -M:     Thor Thayer <thor.thayer@linux.intel.com>
> -S:     Maintained
> -F:     drivers/mfd/altera-sysmgr.c
> -F:     include/linux/mfd/altera-sysmgr.h
> -
> -ALTERA SYSTEM RESOURCE DRIVER FOR ARRIA10 DEVKIT
> -M:     Thor Thayer <thor.thayer@linux.intel.com>
> -S:     Maintained
> -F:     drivers/gpio/gpio-altera-a10sr.c
> -F:     drivers/mfd/altera-a10sr.c
> -F:     drivers/reset/reset-a10sr.c
> -F:     include/dt-bindings/reset/altr,rst-mgr-a10sr.h
> -F:     include/linux/mfd/altera-a10sr.h
> -
>  ALTERA TRIPLE SPEED ETHERNET DRIVER
>  M:     Joyce Ooi <joyce.ooi@intel.com>
>  L:     netdev@vger.kernel.org

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

