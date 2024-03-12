Return-Path: <linux-i2c+bounces-2337-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FFF8795A8
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 15:06:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B5A61C2169D
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Mar 2024 14:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6027A72C;
	Tue, 12 Mar 2024 14:06:35 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751894DA10;
	Tue, 12 Mar 2024 14:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710252395; cv=none; b=MxBH8QLyhk/Yzs5aStfcFu7PC2aRAJRtEIztPrr7eUstaZ3NmLOM+2mkEojD6s20J1Pr8tRsslp8Rgl8a6k5tu77CHqJH4atC1pUjV69NMfxIGl3s7fdxcjrUQTZSrlXPN/ZJBS83IhYN03opm6vS8YnqWcZ9Cb+zEzQfvSkJfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710252395; c=relaxed/simple;
	bh=CMcT7NFgND7n3RWDv6iIu5xR7PvIHiE7LpCchCOE3AM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYQOBEMJse2XDvSbs4Vz7pPzfcChtBnDUByNflmmAVIB43FTvXPrehQi0uum+7gYUus2zMpNv2vgn/kgy8Ko9z5m20tpW9Jlf1VpkNPDtxCcEwzFPilyo2/YXUYsx6Am+iO3TH3YIu8fdn11Ze78NyF70o9Q+mVRAdPYfdQB7jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5a1ca29db62so2557188eaf.0;
        Tue, 12 Mar 2024 07:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710252391; x=1710857191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMM3M1Kjys3ldpK+AwrnZJ+C5QFF9zdbpLWE/OA8c6A=;
        b=gccCedgwmZ4WwYRiZvFXUtgaS//cm+Ub4KFrFv7g6Gx8U+1PZWdmkUsLkynVuLdAVE
         k3yt53ny37LugzUJ590/gPbqJt/oC6uG22zCACLGbl88M+1YH1sKxOAR47VlOa5gas7s
         ol/u1u62yiLrd/G1eMAhP3IJdxoSHlXyZ7d7QZCo4juHV0m+dVIXHTYN5o5ohC+eYBQr
         MJL/XiBIJIqdCWZN+I6Epbvc9HK1T/3tDS/P1OIJRZnWs0okmpXev+paX3pve0PcRwBc
         yeC9han+cq3Q6/R4V1vLNpCJyYJshKDeq6RhyyomUwxmrPK9HlIZAiY2q3ShFAHFruVj
         pJ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJLMa9yeiiqSfbkj+a+onWUO72Y2VmDrwmY3OY/BOAEWQvYHkDnUQG2Q9b+Qq8fggAT+x2zANwNJLvcsZjuzMbpmmz5SDfUKN4OZi09PDRK11dV7hdwTrav4HJM1pULXbBhOCwUotoa+QyDucWzET14zALhyNOZ8VFbSpPInVkF+UWImUpVqYU/QTIWCh3aCSqmpCFx7K8ACMAs4SX6B500O+5CzR3
X-Gm-Message-State: AOJu0YxpcwXT8G5HpEOJQhLYqdUk0RJDcp86NcLHxJVSO+78Dwj6oqCc
	QZxl5hxnEN4uba9Xz/YB9eq/4vwbIln4SaGD5IZ9/ShTVvMQdHI4wXUHoSTh8Js=
X-Google-Smtp-Source: AGHT+IF6B1qZXJ3O89Oqai8iMQfbpUTm0RZHHWNOrIB7zEo0rozok8wXZXj7SKZ4Vzr3unD8o1KTZg==
X-Received: by 2002:a05:6358:7423:b0:17b:c4a8:1417 with SMTP id s35-20020a056358742300b0017bc4a81417mr11434992rwg.1.1710252390449;
        Tue, 12 Mar 2024 07:06:30 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id a18-20020a5b0ed2000000b00dcc45635f27sm1671166ybs.18.2024.03.12.07.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 07:06:29 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso5445592276.3;
        Tue, 12 Mar 2024 07:06:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7WYXy8KAIuPFvUr8N/cjWi330zNp2NECmM/dfZd2FV2fbQKa5sKl5B7raagv17mp0ErRqskzYaLMotqvVWBd47/6Gz7lkhd4Vo+wU35bnZ15jjtybCzupu7vO8gOv1wIjb8IsSqUcxp9axS0MJKyAMCBAuAPrZKq+E2eA68VBUCx710XTFDrxaHWVRCbsoYa8zFrCWEeFZf3hgqB3dVD9TI8cEYEu
X-Received: by 2002:a5b:f4e:0:b0:dc7:4f61:5723 with SMTP id
 y14-20020a5b0f4e000000b00dc74f615723mr7341132ybr.39.1710252388801; Tue, 12
 Mar 2024 07:06:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240308172726.225357-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <7082ed3b-d6d0-4228-b7a6-7c0e0e46b8e2@linaro.org> <CA+V-a8tM29h10DULurMJtBZBnLK_ZF7pH_Y0bhZTvWO0O7-G-Q@mail.gmail.com>
 <2974085a-d9b4-4a66-b60f-c02a06a74647@linaro.org> <CAMuHMdVgp_vFnWr5ruzdyc1vNQKoCdM=pLZmgmkDjmUHvQBJJw@mail.gmail.com>
 <b04f9c39-9797-40b8-a25b-8154ad559cd5@linaro.org>
In-Reply-To: <b04f9c39-9797-40b8-a25b-8154ad559cd5@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Mar 2024 15:06:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV6yHcTaZKMJxS7sabzhCGKt4i6bjKJiNDaCoHkeZXUvA@mail.gmail.com>
Message-ID: <CAMuHMdV6yHcTaZKMJxS7sabzhCGKt4i6bjKJiNDaCoHkeZXUvA@mail.gmail.com>
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

On Tue, Mar 12, 2024 at 12:04=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 11/03/2024 10:00, Geert Uytterhoeven wrote:
> >>>>> -          - renesas,riic-r9a07g054  # RZ/V2L
> >>>>> -      - const: renesas,riic-rz      # generic RIIC compatible
> >>>>> +    oneOf:
> >>>>> +      - items:
> >>>>> +          - enum:
> >>>>> +              - renesas,riic-r7s72100   # RZ/A1H
> >>>>> +              - renesas,riic-r7s9210    # RZ/A2M
> >>>>> +              - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
> >>>>> +              - renesas,riic-r9a07g044  # RZ/G2{L,LC}
> >>>>> +              - renesas,riic-r9a07g054  # RZ/V2L
> >>>>> +          - const: renesas,riic-rz      # generic RIIC compatible
> >>>>> +
> >>>>> +      - items:
> >>>>> +          - enum:
> >>>>> +              - renesas,riic-r9a09g057  # RZ/V2H(P)
> >>>>
> >>>> No, that does not look right. If you added generic compatible for al=
l
> >>>> RIIC then how can you add a new RIIC compatible which does not follo=
w
> >>>> generic one?
> >>>>
> >>> The generic compatible above which was added previously was for the
> >>> RZ/(A) SoCs and not for all the RIICs. The RZ/G2L family was also
> >>
> >> No, it said: "generic RIIC compatible". It did not say "RIIC RZ/A". It
> >> said RIIC RZ
> >
> > At the time the original bindings were written, only RZ/A1, RZ/T1,
> > and RZ/N1 existed, and all RIIC modules present in these SoCs were
> > identical.  Later, we got RZ/A2, which also included a compatible
> > RIIC block.
> >
> > Somewhere along the timeline, the marketing department became creative,
> > and we got RZ/G1 (RZ/G1[HMNEC]) and RZ/G2 (RZ/G2[HMNE]), which were
> > unrelated to earlier RZ series :-(  When marketing started smoking
> > something different, we got RZ/G2L, which is unrelated to RZ/G2,
> > but reuses some parts from RZ/A.  Recently, we got RZ/G3S, which is
> > similar to RZ/G2L...
>
> That's fine, but then the comment "generic RIIC compatible" is confusing
> for anyone not knowing this. Commit msg could also mention why the
> generic compatible covers actually entirely different hardware. The
> commit msg so far focused on the differences between these hardwares,
> thus my questions - why do you create generic compatibles which are not
> generic?

I agree the comment should be updated when adding a new variant which
is not compatible with the old generic variant (i.e. in this patch).

> >> So don't use generic compatibles as fallbacks. That's the point.
> >
> > It's indeed difficult to predict the future. So SoC-specific compatible
> > values are safer.
> > At the same time, we want to avoid having to add compatible values for
> > each and every SoC to each driver, so we try to group SoCs per family.
> > For R-Car that worked out reasonably well, however, for RZ...
>
> I did not propose that. Nothing changes in your driver with my proposal.
> Use SoC-compatibles only: for fallbacks and for specific(frontbacks?) par=
ts.
>
> To give you some sort of guidance for any future submission:
> 1. Use SoC-like fallback compatible, prepended with SoC-specific compatib=
le.
> 2. If you insist on generic fallback compatible, its usage should be
> limited to the cases where you can guarantee for 99.9% that future
> devices will be compatible with this. I doubt anyone can guarantee that,
> thus we keep repeating on mailing lists the same: go to point (1).

Personally, I am not such a big fan of method 1, for several reasons:

  - Support for new SoCs is not always added in chronological SoC
    release date order.  So you could end up with:

        compatible =3D "vendor,socB-foo", "vendor,socA-foo";

     with socA being (much) newer than socB.

  - Worse, adding support for different modules in different SoCs
    can be unordered, too, leading to

        compatible =3D "vendor,socB-foo", "vendor,socA-foo";

    but

        compatible =3D "vendor,socA-bar", "vendor,socB-bar";

    Which is inconsistent.  Fortunately we now have "make dtbs_check"
    to catch mistakes there.

  - When a third SoC arrives, which one do you pick?

        compatible =3D "vendor,socC-foo", "vendor,socA-foo";

    or

        compatible =3D "vendor,socC-foo", "vendor,socB-foo";

    Obviously you pick the former (unless you detected the issues
    below first ;-)

  - When socA-foo turns out to be slightly different from socB-foo,
    socC-foo, ... you have to add of_device_id entries for all
    socX-foo to the driver.  With a family-specific fallback, you'd
    be limited to one entry for the family-specific callback and
    a second entry for the misbehaving socA.

So far my 5=E2=82=ACc....

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

