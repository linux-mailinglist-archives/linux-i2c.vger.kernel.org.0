Return-Path: <linux-i2c+bounces-2410-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3661C87FEE4
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 14:33:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6848A1C222BE
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Mar 2024 13:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BED80056;
	Tue, 19 Mar 2024 13:33:10 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03BC80033;
	Tue, 19 Mar 2024 13:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710855189; cv=none; b=FQhbJaOCPqFtSrt1ThztfSw6Nn2QAH3QELFVrKyGlSp33STpZIpt3eNlCLMRvmJf9rAhERkhQYog14kgAIVhewS3J3IkMvZ8Zg7o+5ZwNTusBipY/u9BcdX+0A6B84nFWV26b0pUMpkBkxEcF9d5q9t7JHiMSF97Nq8d/cwkdEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710855189; c=relaxed/simple;
	bh=QhRrO4t3mnaFHkJr71jsofv13X+SxCwQsEZqbdKoNs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJcmiCVjGsZH2VYTP6J30P+EoBx9Z9uQ4c0fgkWVDe8JhSTUdI11tE81V4MXS9cwIkRakgnR/+A6hVgXBinqX53CR5zz09z2bF1k/yDCuSt6pAvrWj1I+SDbvDVgo+xW8m1Plnhvefa1AvPFgZ/2tBHHlzDx0qppulKGIXGiGy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-60a0a54869bso50082667b3.1;
        Tue, 19 Mar 2024 06:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710855186; x=1711459986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38M4gqCnai9ujwQRg/Dny0B+nGEzSFU18aCGQJZWilM=;
        b=MOhcO0VQTciFPTaCIIb6rkjZfmiZdGHz1OVEF1PgxFyvscMZObTEPG2c0R2xVUsKWC
         BEtwwV+MnZbyv2cshHHWzm8hk/94nZlIisQk+4cbYHlWRsM7yK2kaNx9Txg989Wguncz
         aHeBU+2emqs/+36XxLYpN52umcrrEyYwMtmaEwT90+safwFvkvkaow+5wiE4SXYHM2Hb
         hFPvOsfIllg6CwAYLyMX8BAOEbcEoNfv4T199NG6SSL8fWAlFkyTSluTlyjWiQHEc9t8
         2jYgIiRcmWWBMxONaZ+nJKlmC5lAn1pqWgvebcDAmt1VpFNn7ss5RqgpskzZjf9GdGJm
         hA3w==
X-Forwarded-Encrypted: i=1; AJvYcCWJbMRg8BY+MZZnpn6l1rkH0vzUw3Xqd192wU4Y+ZvbzahgdNOr1mwhcABy47K09uYt7j4w5zYUh87nnCsvZ9V+RSntA+lXYWZqynuF1PK1SrtWqs61RQZHi3jIiIgcHxXjkp085jNyqJ4NjX0i1bzsHZgqFlIwxrre8yNl2s+g8bsNsnStvHrB6jFAzc6C7pwF6LnlS4vU78H9u9ydNvGO9oli76TE
X-Gm-Message-State: AOJu0YzWQYXU5weJBw2/6MWqchFSceTy7OOtiHlphXVsDrM5SwrMKedQ
	51Q9r7yq4ziXPenzGEITXqBKKKmSIdQwq93XL4gGBXRE6HKlNa0rznezDofNmTc=
X-Google-Smtp-Source: AGHT+IEowR4a30ZrSBpd+hOhO+aLbLt5NB4KJIuEJOUB7Cr6D6ssCH8a+LCg1s74z4iIdtEW00hBXw==
X-Received: by 2002:a81:928f:0:b0:60a:6b60:16f4 with SMTP id j137-20020a81928f000000b0060a6b6016f4mr1580641ywg.8.1710855186570;
        Tue, 19 Mar 2024 06:33:06 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id z132-20020a814c8a000000b00610eaf46c6dsm130453ywa.117.2024.03.19.06.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 06:33:06 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60a0a54869bso50082537b3.1;
        Tue, 19 Mar 2024 06:33:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEjU5qBeP0eg3Bexn8zjOx2SoyzV4zfwUExnfR2EIMdLNtBonjVpPyTmR+ZAPEN0K7EpJaXPPheZQJ5cD2EuyfBmrSEbJm7VNsRa+IdkOlv0m2ENjf4ZzkHp8jXEHdGbSUC+PYbMdyi3wBal0PyGIc0H4VoCZJmIobKjBNiT8DsxYW5gnYjq1wIAva5WItr8+NlSX3P6KLl7TThomMnVtxhStKGmuA
X-Received: by 2002:a81:8647:0:b0:609:f029:7f3e with SMTP id
 w68-20020a818647000000b00609f0297f3emr1589217ywf.4.1710855186236; Tue, 19 Mar
 2024 06:33:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319132503.80628-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240319132503.80628-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240319132503.80628-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Mar 2024 14:32:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4My_nuQ_Jgb4=jGG8UBzkpZPAmgq=QFcsXRTOa=+Fuw@mail.gmail.com>
Message-ID: <CAMuHMdX4My_nuQ_Jgb4=jGG8UBzkpZPAmgq=QFcsXRTOa=+Fuw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] i2c: riic: Introduce helper functions for I2C
 read/write operations
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 2:26=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce helper functions for performing I2C read and write operations
> in the RIIC driver.
>
> These helper functions lay the groundwork for adding support for the
> RZ/V2H SoC. This is essential because the register offsets for the RZ/V2H
> SoC differ from those of the RZ/A SoC. By abstracting the read and write
> operations, we can seamlessly adapt the driver to support different SoC
> variants without extensive modifications.
>
> This patch is part of the preparation process for integrating support for
> the RZ/V2H SoC into the RIIC driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Made val as second argument for riic_writeb

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

