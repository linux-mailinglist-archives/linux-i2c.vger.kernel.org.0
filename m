Return-Path: <linux-i2c+bounces-8531-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4E59F3628
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 17:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAEA17A4CAB
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 16:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2A1200119;
	Mon, 16 Dec 2024 16:34:18 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB841B4124;
	Mon, 16 Dec 2024 16:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734366858; cv=none; b=m4G1b3rRR2iOFJ/v/wyft5PzkuRZti3et/ulAnlaHR7TTR+RYRZvdL8maoxQQ7hs2Y/0SP2O85Z+ywFkVnqhQTLh4fPUVV0cQk5wULjx/zE6WL3l8EqdyptORF0d6zxGS8iKvq7WY75uFf9QjKFCccqZMJkdIffil2GuFjeFXNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734366858; c=relaxed/simple;
	bh=kFoo4DyvqMPRulseCXgJTHl4x23nYItPt7xx+aCJ25M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kNhzXezRxYPUhKjBRetwoR0ml+06MOoNrycmD2tiGO/m/W3R/dLb4I2BFhIa84ZFwCJ6xTdKHJcgTAJMM0LcJ1R4Ia6d7NEI7QZsQj+KWFop1NRTzLHu/FVEg+WR6PUh6V1a03h0ChdnSK3Sj37RY9ewLBTV6EMqtHo8ps5w8Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6d8f99cb0d9so38395596d6.0;
        Mon, 16 Dec 2024 08:34:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734366853; x=1734971653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2m1QeJS3LZ/1IJPGEh2oyL9XdI3XSzd5/J/PMLNGlr4=;
        b=DQEJQNq2Jn0Cl5ozyrzuOz2wnH1ihCFezAyjpRnp2/IhExOSvyF1Yu+zBKpcxWGgoa
         s2X8GDlEByrIK/v7KT1lyngNJdcqw3Xr8epvwTyNmTS+Lgc9DfyumKarsnXhOI7nckSX
         uYGTWCRacW0kGZHjHZ47G+cRGmpFxNYkKchPExEPy8SAkWuhzmfJUYdW3CUWuh7ZD2qM
         gdxqk2OGQJufFVPmcsOKzhbPpn9Y45yA0at4Pp/3wNlUzWTOX5fdHu/jRpYGcm1t8u8U
         xSxig4dPzTosljcDv2nMiU+09YCcXYOy5VzSIi0ET7nACP9uSztbC6xcPiKVsxjz2AWH
         sNHw==
X-Forwarded-Encrypted: i=1; AJvYcCUi1isGTWnZGnH+/LVygM2yeptrAK6WSNrw1NKI9HVa3RD7pMqOeS9SmiRBDACLtsOLV0hZ2i++aX97h8KeJZuFU4k=@vger.kernel.org, AJvYcCV6JN9LeYYD0e0Tq+oVPOTN0DjQnIaZUMQeMN+pwLvHVOPefV1SV+bBFhRU5Bcmv5Pi2OGQjJDCNs9/@vger.kernel.org, AJvYcCWKGVvPAqd+StRf+qrMZnzG40q/i1FamzrJYdjWR7bCkBDoYfU1j2yKZjfUGePHJzYoto0uLZtRNRZ0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpqw+iqWJVTlvAYl6cXBpgciTeEqCUvlmp41wL6kTnAV/wfEhf
	8RvPVC7kTZxGA1+acWaIADV1NTqnkV9ViE+kqlg47pyDlGRZUDVdvVUxU/Uw
X-Gm-Gg: ASbGncvPdI/K1sP6QAUOSozRBKt1QZZJ79ozekmDImx+YUA5RAR/QlMDGIuLuHhLS3B
	Rt+u97kuMkFyz3ebxt4kxELEOCuTkY69q+2hLqEd6sb6rWGUShDDQNTqxfZoB/yf604qFWGHg7z
	9tIb52pXhTY9BgTazY280Lovfht9KNbNU4EOHR6Fp3eWrgl4NjnhzK5yBrdyzBBGBQ9HhvyasVS
	xpzfSNWUVMiH2fsnihUEvmEdu1r/NNKXhDFW/FkEDhQ07jB9y+2LL0rAGPOFZvjFrlXBhFSOIre
	BI4xfVphu2rH9hLB537QubY=
X-Google-Smtp-Source: AGHT+IHmkM9Icywzba7z0rRWtFmn8FyE9LoQOa8XbyBRZVJHPEstoLgfFVY4RBkzthgyclAEs+GVgA==
X-Received: by 2002:ad4:5d67:0:b0:6d8:7efe:f791 with SMTP id 6a1803df08f44-6dc8ca53b8dmr273661056d6.18.1734366853516;
        Mon, 16 Dec 2024 08:34:13 -0800 (PST)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd3805d2sm28951946d6.112.2024.12.16.08.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 08:34:12 -0800 (PST)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b6f95d2eafso301012785a.3;
        Mon, 16 Dec 2024 08:34:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUAykmaqalwb3/4frGfWvOJWymw7vfSlXmzySw4cfcHrPMndYbIkGZCQsThQB3mVPi5PNLdrnO8psNKecs6y3VQEzo=@vger.kernel.org, AJvYcCVD1dQwgmI8aaoVSmQOF0TlgDcYhxwo/aS2PT+lMYTZDBfvaFg+DK6+muCOo5/heLJKRzY6tnhfJ6Kh@vger.kernel.org, AJvYcCWtoG/ZHdgG3PM9q48VrN84XrRqYpuwYBlN40DOPAV3OUZihWaveHysTaKga56o9BD7kCvFi+N/jiiL@vger.kernel.org
X-Received: by 2002:a05:620a:472b:b0:7b1:113f:2e55 with SMTP id
 af79cd13be357-7b6fbf455famr2305918885a.58.1734366852581; Mon, 16 Dec 2024
 08:34:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216120029.143944-1-biju.das.jz@bp.renesas.com> <20241216120029.143944-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241216120029.143944-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 17:34:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXvQ5SWHkU7dXHmDtQ_fzU75ZTWSNr1ZDhq8GUgc-E8mg@mail.gmail.com>
Message-ID: <CAMuHMdXvQ5SWHkU7dXHmDtQ_fzU75ZTWSNr1ZDhq8GUgc-E8mg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: i2c: renesas,riic: Document the
 R9A09G047 support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chris Brandt <chris.brandt@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Dec 16, 2024 at 1:01=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Document support for the I2C Bus Interface (RIIC) found in the Renesas
> RZ/G3E (R9A09G047) SoC. This IP is compatible with Renesas RZ/V2H
> (R9A09G057) RIIC IP.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> @@ -26,7 +26,9 @@ properties:
>            - const: renesas,riic-rz      # RZ/A or RZ/G2L
>
>        - items:
> -          - const: renesas,riic-r9a08g045   # RZ/G3S
> +          - enum:
> +              - renesas,riic-r9a08g045   # RZ/G3S
> +              - renesas,riic-r9a09g047   # RZ/G3E
>            - const: renesas,riic-r9a09g057   # RZ/V2H(P)
>
>        - const: renesas,riic-r9a09g057   # RZ/V2H(P)

BTW, I think you want to make resets required for renesas,riic-r9a09g057, t=
oo.
Or perhaps make it required unless compatible with
renesas,riic-r7s72100 or renesas,riic-r7s9210.

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

