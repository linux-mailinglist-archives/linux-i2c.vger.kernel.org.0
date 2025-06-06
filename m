Return-Path: <linux-i2c+bounces-11265-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5C7AD031C
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 15:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC7AB17AC1C
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 13:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D03288C37;
	Fri,  6 Jun 2025 13:24:00 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8BC28852E;
	Fri,  6 Jun 2025 13:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749216240; cv=none; b=VPiMgmn6Ofw7Ug8fuiFSrHya2G6RjleDvQRGxFogiJtg0ketJHy8q6710CvP8/CIy9xNxXiMf0mcnVDliKKplYwf0SHvrn51PJiW4c6iMZOD/tmfbwYpXHHzsyEbhThl2PzUv9UJsYYFDmnUgTnO4mnTHxaJzwT1etPXFgT9Wo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749216240; c=relaxed/simple;
	bh=ODzVjULCU7LA5AwD99W9he//DtffyhQ9WeBhknElp8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJd8SDf0k8oXFV0fJy1nFdfBuyhFdGxvxidyMVcvY7XDBPCKQMNPs2uFXGApCDc0mHFLLyKTwWKxvLn7lTR95HxRSNO1XJBMGCviSPdiM2GQX2Du6ejdrlSaJUDttVdMhbZGz3Y4VREXvKe48vUv334zzwHwITEGcyvVt2toJFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e45ebe7ac1so451611137.2;
        Fri, 06 Jun 2025 06:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749216237; x=1749821037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mp5mCaEdHKFmEnLbLz+m6JFQFDxSV2BJAh/7PrIe5RY=;
        b=jc+nexL360YBPZzkGL2lV8VWC/Q8BFpT9N4eKMVWDszFJrkvFmKYIDEK0QrFtiNRHv
         aPmTcfci7/tRfYnV/MnI75xiWUEBPjGnf+RSAh4KdwouQSfM3nrYNzEICxodgFVRG7TC
         B3e3kJBbPjCNHmpy7Dj5GYwhEokFI4mtkrTsXh8Z5I5hKCweDdkWjgsxkdIbEl2Z4Ul/
         6Yu1v8IB9+WDTf+ZKiU5efmdCZFG8PA/5N60eBn1OTL0BHB1aug0ewiaRiBOHUDsuYwc
         5EcfMFFVI8i97hDZPJH9LVYWgQ4dVy6041I55grKr7P8kBIcK45Qn67YgeyXRLtflXI3
         750g==
X-Forwarded-Encrypted: i=1; AJvYcCVQklKoegDMYwbOFJIV2xJ298vgAYMh8AToInFNhfnbiX/nCHbLodSKvF+MHkEvMOEI4c6rNdrjua7E@vger.kernel.org, AJvYcCWJP3Kq9wTrp8IACv2TBXflgeKWw3MD/r9fYiAGH7rhDzTJDWN4dyDFwXzLOSRgZbW4om/ZBicGMLDBWrI9XJcT6TU=@vger.kernel.org, AJvYcCWTeafZTyjtpWfhvfPEym/7Tg1K9oXqGRjy2VF7BQF+GpviSsa7mT+uwc009l8UHQZjJ8ldGFlthWYVPfWf@vger.kernel.org, AJvYcCXGdH2xr0G/JcCeOqBwiDYUFVhSc9MEM9MKLa1dAz45JJxuiBiWG9FTBgANS1eKyZ5UfasOpg8+X5Kp@vger.kernel.org
X-Gm-Message-State: AOJu0YzBP+69pdr2OQ3WwOqwa9gNyenexB1Aj0/hqdbAU8wP8n6oEh4G
	9kah30Ktk9id7d8BfKMjl1Eb2vaQ5Vcx0FUkotpO035AQ79uF2ilW19TSJzvUGhL
X-Gm-Gg: ASbGnct1BUNNxHAJjxOTqOQaxjbjUMkvWUzTOQGg1E2K01iu68ZyIbPS5TlzuNj0YT5
	x+qPk4qcmPQ5PhApqgS1gSUCd+4WFwxlAWDH94gIcuxF5Hr/fp+6DjhyqQ5IvWtTtCrLzNwXhBy
	Xs5aoVQkwTh4TqjrAKXS/UzmbEhvChZ3w/0Vk923LfrJzqDW2v8bCOtH3Z5/PtXXjDFZqGgm5KR
	7Iv/xtjkpMUWkurEEcEImTKGyRmd14fizcz+dN4N3RYiJwqDjNerWmp3TKHvVrkVtz20KM52Hxr
	Jl872zrO22uzxMEf4QSbeyP+B5df2Spl2K3a879AbnfQe27bOGY86SzfwRteSfzhBbXjAXX6vbJ
	C1iTmkp1XKNo3kR0SxX6JhVVR4H9hiN++hqM=
X-Google-Smtp-Source: AGHT+IHRUA+s4LhE0rQQMXTB8bxlu6SiKH0fWfYoPKkOqmyfNKC2GKnlf7ZkrcTPc2U4P/8hXYExyg==
X-Received: by 2002:a05:6102:e14:b0:4e5:9cf0:4eb6 with SMTP id ada2fe7eead31-4e772887fc2mr2641089137.5.1749216236842;
        Fri, 06 Jun 2025 06:23:56 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87ec4dc0c21sm312759241.5.2025.06.06.06.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 06:23:56 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e58ef9cb69so635017137.1;
        Fri, 06 Jun 2025 06:23:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFZNlsL7bn8xSAt3Fr1TlgiTLvdr2YD607TR2wlgHIyll3wgcSF7+4uhPbd3ozAgGRUIDP9ZOBjwbI@vger.kernel.org, AJvYcCVC5knTn0qwZLZI8VdGKqgpI8wTWzfHppTvxmCfIsVqyIChHY2H1fMiZEBvcj4ihHfotbEaIvde8jWiw5Em@vger.kernel.org, AJvYcCVN7JYP07AspQGBSS0AekaxS+3pK0Ub+XaV0iuX+TRFEmVB0KNDDAOUMjOgtX7HcO0fi4yA8zh5Yo4A@vger.kernel.org, AJvYcCWLw/eGGWw4irGKCdjHwKgUFjPpk/8GU/N7b2jphz6O2ZfVT7mk98TA0rg4AbKEP/nUTgw2p89CCg7hRQC2fPGF7Po=@vger.kernel.org
X-Received: by 2002:a05:6102:149f:b0:4c1:9780:3830 with SMTP id
 ada2fe7eead31-4e772a0b67amr2750672137.23.1749216236152; Fri, 06 Jun 2025
 06:23:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250530143135.366417-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250530143135.366417-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jun 2025 15:23:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmzU6_3Na==q02jEb-mJmkA6oT1g+xP2RUw9UC1wEx9w@mail.gmail.com>
X-Gm-Features: AX0GCFvn0KOWXwFEAW2t_z0vkiPVJ2lZPCcUTJH01Ivefj35RTpeaQ5i6J8a6R0
Message-ID: <CAMuHMdVmzU6_3Na==q02jEb-mJmkA6oT1g+xP2RUw9UC1wEx9w@mail.gmail.com>
Subject: Re: [PATCH 5/6] i2c: riic: Move generic compatible string to end of array
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 May 2025 at 16:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reorder the entry in `riic_i2c_dt_ids` to place the generic compatible
> string `renesas,riic-rz` at the end of the array, following the
> convention used in other Renesas drivers.
>
> Also, drop the unnecessary comma after the sentinel entry, as it is
> not needed.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

