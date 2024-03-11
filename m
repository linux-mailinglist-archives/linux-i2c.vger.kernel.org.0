Return-Path: <linux-i2c+bounces-2326-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1E6877C2B
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 10:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32E62281D2E
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 09:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA55B14291;
	Mon, 11 Mar 2024 09:00:40 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C2A1755C;
	Mon, 11 Mar 2024 09:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710147640; cv=none; b=cms3LiqsnpswWi6Xwyte1H/6RMBQ61+9uPY83+Rvs4hRvJDwH1u+q6KPuawI3pAKUZfOrVLAEBgNIm0FQktsRmruMaiASYBVRnN2fzLZMJ3Chsc26tOydPRpCFH2K/0+7kwf/WyQXCnCTk5UHFtSdjBUNNMT1GnK//Lgpbk3wuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710147640; c=relaxed/simple;
	bh=0O6FBsd4NTZycTrEFX5YT662K9M5re4skJ3TZydmxQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGaP43VH2eiL+/3XmiQFvXBvBD1Yt1sArI/lQ2NltrSX5nXNyyJE/MQH3c8HjXL2I1sNWbNUA2O/i3P9Vemt4nxrTQurAMAdCDfEJ2yDVzdaoZSxTdQgNRDMomHwQJNAsmZUyRt5oXKFuGoF5CnAIBcgMeBbZxd+HEywCikWyM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-60a057b6601so21805577b3.2;
        Mon, 11 Mar 2024 02:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710147637; x=1710752437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2hRnN3Ii0PKC/b/lsBmjg1nzJN5vZTlFaVVXF4Tk84=;
        b=bnXO5G+Ost5ndlP8Q3NMkAW0THYzr6xmNSbg6j0RCg8DvBkVwomRpqleAobjaZWGrV
         RTrPkKocQyii5LPIJiOj1WAfj/kqypivV6IjVleQr8ajz2y2a+QLlCk083+3UT+ROaT9
         kHyoO7jpXENh7nM7axTiTV9RaGX/ZdWsRR5ZAOs5Im2cZpYEf64UXBpP1SXBDFKfNB9T
         l+3pRX+3kKM9kJMVaO7y2hqIChyku5KXGa/Iws1QBytfkaIeRKIz6MKNQv5H8xyM89P7
         KoaCsPTfyzoIjF4i1amRp7QKv43SzT9YxT/KUGbWQs49J7mKYr4eX0LibjLYuM5gRW01
         ppZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaQrHJQSusHxU0Nn+PTcaellouNVuGbG6o9kkAYIdYu56RWx04+FzdlQiml/CsnLKVgD6bJeRuMRr8fAm6efkEYmSwyupT/CYCVcyZDeY+PVdptHZRqYG7emhAGrSZFYSaUVshu1HaVIVQxZZ7NzS9OCU1/n6/o6J0MaPPlmKOhQhYn+xYuywpWzHGQQkIyBG1fV2YP/MLK1su/T3UEYRSFI4AJ5nu
X-Gm-Message-State: AOJu0YwLkd1W/SFSqBn6/RvbkBd0+71cnzKZaS3OXI41eRAaaOjWF48p
	8CMFzwWv1XGMkuIvRgluEBFxy5lNFKgwHwMnygWunnQssYhNBED4CLp0PAOinHU=
X-Google-Smtp-Source: AGHT+IFE3hacL/x5rfm5DcSYbZvAIjceedkZsJj2IsQ0p8CFe98NWUdwX7T7Cn4V329MZrjvXbM0UQ==
X-Received: by 2002:a81:a150:0:b0:607:7c29:8f4f with SMTP id y77-20020a81a150000000b006077c298f4fmr5548287ywg.13.1710147637167;
        Mon, 11 Mar 2024 02:00:37 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id o137-20020a0dcc8f000000b0060a0c161e03sm1227311ywd.59.2024.03.11.02.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 02:00:36 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so3873289276.1;
        Mon, 11 Mar 2024 02:00:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPcBmX+CekcK02HcUPgCcCzS00gpS47V4P1VGGxFY5ZlCE2hFBcgpwtlnhewVg2qnQdmFfcqYXsOfCOs20g7fNU+hcZHNMSHG0BlE0pGX9COrCTr9p77o+tTFs6YwvFMB4xj05jjUWVNmeaYr6IdzTXYlclTn1Wv5qVuZLfX5DRXCy2vrbbZQ2Og86YEM/nRWNtktw3T7nToqiTwXL0oa5jxqRFLdZ
X-Received: by 2002:a25:e095:0:b0:dc6:d808:cf75 with SMTP id
 x143-20020a25e095000000b00dc6d808cf75mr3988125ybg.20.1710147636388; Mon, 11
 Mar 2024 02:00:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240308172726.225357-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <7082ed3b-d6d0-4228-b7a6-7c0e0e46b8e2@linaro.org> <CA+V-a8tM29h10DULurMJtBZBnLK_ZF7pH_Y0bhZTvWO0O7-G-Q@mail.gmail.com>
 <2974085a-d9b4-4a66-b60f-c02a06a74647@linaro.org>
In-Reply-To: <2974085a-d9b4-4a66-b60f-c02a06a74647@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Mar 2024 10:00:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgp_vFnWr5ruzdyc1vNQKoCdM=pLZmgmkDjmUHvQBJJw@mail.gmail.com>
Message-ID: <CAMuHMdVgp_vFnWr5ruzdyc1vNQKoCdM=pLZmgmkDjmUHvQBJJw@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: i2c: renesas,riic: Document R9A09G057 support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Sun, Mar 10, 2024 at 9:10=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 10/03/2024 00:28, Lad, Prabhakar wrote:
> > On Sat, Mar 9, 2024 at 12:00=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> On 08/03/2024 18:27, Prabhakar wrote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Document support for the I2C Bus Interface (RIIC) available in the
> >>> Renesas RZ/V2H (R9A09G057) SoC.
> >>>
> >>> The RIIC interface in the Renesas RZ/V2H differs from RZ/A in a
> >>> couple of ways:
> >>> - Register offsets for the RZ/V2H SoC differ from those of the RZ/A S=
oC.
> >>> - RZ/V2H register access is 8-bit, whereas RZ/A supports 8/16/32-bit.
> >>> - RZ/V2H has some bit differences in the slave address register.
> >>>
> >>> To accommodate these differences in the existing driver, a new compat=
ible
> >>> string "renesas,riic-r9a09g057" is added.
> >>>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >>> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> >>> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> >>> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> >>> @@ -15,14 +15,19 @@ allOf:
> >>>
> >>>  properties:
> >>>    compatible:
> >>> -    items:
> >>> -      - enum:
> >>> -          - renesas,riic-r7s72100   # RZ/A1H
> >>> -          - renesas,riic-r7s9210    # RZ/A2M
> >>> -          - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
> >>> -          - renesas,riic-r9a07g044  # RZ/G2{L,LC}
> >>> -          - renesas,riic-r9a07g054  # RZ/V2L
> >>> -      - const: renesas,riic-rz      # generic RIIC compatible
> >>> +    oneOf:
> >>> +      - items:
> >>> +          - enum:
> >>> +              - renesas,riic-r7s72100   # RZ/A1H
> >>> +              - renesas,riic-r7s9210    # RZ/A2M
> >>> +              - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
> >>> +              - renesas,riic-r9a07g044  # RZ/G2{L,LC}
> >>> +              - renesas,riic-r9a07g054  # RZ/V2L
> >>> +          - const: renesas,riic-rz      # generic RIIC compatible
> >>> +
> >>> +      - items:
> >>> +          - enum:
> >>> +              - renesas,riic-r9a09g057  # RZ/V2H(P)
> >>
> >> No, that does not look right. If you added generic compatible for all
> >> RIIC then how can you add a new RIIC compatible which does not follow
> >> generic one?
> >>
> > The generic compatible above which was added previously was for the
> > RZ/(A) SoCs and not for all the RIICs. The RZ/G2L family was also
>
> No, it said: "generic RIIC compatible". It did not say "RIIC RZ/A". It
> said RIIC RZ

At the time the original bindings were written, only RZ/A1, RZ/T1,
and RZ/N1 existed, and all RIIC modules present in these SoCs were
identical.  Later, we got RZ/A2, which also included a compatible
RIIC block.

Somewhere along the timeline, the marketing department became creative,
and we got RZ/G1 (RZ/G1[HMNEC]) and RZ/G2 (RZ/G2[HMNE]), which were
unrelated to earlier RZ series :-(  When marketing started smoking
something different, we got RZ/G2L, which is unrelated to RZ/G2,
but reuses some parts from RZ/A.  Recently, we got RZ/G3S, which is
similar to RZ/G2L...

> > compatible hence they fallback to the generic RZ one.
>
> riic-r9a09g057 is also RIIC RZ, isn't it?

Yes, as in "it comes from the division that calls its products
RZ/something". But...

> >> This shows the ridiculousness of these generic compatibles. They are
> >> generic till you figure out the truth: oh crap, it's not generic.
> >>
> > Sorry I lack skills to predict the future of upcoming IP blocks which
> > fit in the SoC.
>
> So don't use generic compatibles as fallbacks. That's the point.

It's indeed difficult to predict the future. So SoC-specific compatible
values are safer.
At the same time, we want to avoid having to add compatible values for
each and every SoC to each driver, so we try to group SoCs per family.
For R-Car that worked out reasonably well, however, for RZ...

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

