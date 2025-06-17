Return-Path: <linux-i2c+bounces-11503-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC21ADCE36
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 15:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C10327A77E4
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 13:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5672DE219;
	Tue, 17 Jun 2025 13:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fg+ZSxN0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175432DBF41;
	Tue, 17 Jun 2025 13:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750168265; cv=none; b=RvKvP+c7MSf8jsR8G+nGfjWUUQqUQRg2jAeUd0nztu+kNZV1x7iDjvY8yZ8fx7XvIT3VDZpDhYf0W5JEU9kyrHr23Mvu7/E5+/0MuXN46vvXVu5XHFSN2tZ6nulI+hT3g63LmjnbQ0Co2/5dAXo2skVOvpmpMx14cfHgA4g15ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750168265; c=relaxed/simple;
	bh=IGltngzbELGQw+XQq/WWyCGYqZ4fB47Qdv4Z+NL+foY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QOBgFonNhcVUm/C6cZ8g7ENuovaRCK9Rd49u2Za7OGUIFnvgsVyPrntZyGqRpBYk22ZsoaWYlgaSkVADqH+yTqztt90Xn92gTccbJVI51W5H2stM4HhxG0Ut7l8Fc7kdYN6wgzVcVR0IAY5Lcb6mSrIIzN2rNJIlWcPcURWgIL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fg+ZSxN0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so73345435e9.1;
        Tue, 17 Jun 2025 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750168261; x=1750773061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNl8wyegafLnqZVF/hrUk0udF1cnoaAfeahNhjIdcWc=;
        b=Fg+ZSxN043FFB2xU8Cq4o4ihPy9Vd9IP8agvSgzdxjzpjdB3JZ033w9wGYf6891Nxz
         HIcecEYQ8yBSj6QKNnbbxPUSApH0fxCgfEfQe1YmhwSvps1r19eua9LTeJZYn1/WgZED
         33A5LnLaW5VT0wFn8+5bkabD3F2rG4daircHoJXNMQTaXmQhIJk550k8qJqXVm2Of0u0
         JSiFZJuJp0//3hiEWUuyIWwFzlfRYbQnJpHYlkqwzjm7qpwH3yQudYYnIH+SRFHrr1sM
         Ryb03v+/xp2y1Eh3XVE2ZpoZWHroJWLGaV0LO9S7MaRYspnDDIRq5OV+VauizIzt5fL3
         QHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168261; x=1750773061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wNl8wyegafLnqZVF/hrUk0udF1cnoaAfeahNhjIdcWc=;
        b=NTOg8p2mpzws4WIqVLrgZsKqJLKsNOMQWmgYT9kchjKmFliC8v5R0CgbjJ7hHaUr3n
         3ivrSIpsOkUGM4Opbl61vave+i3NyePpw9yYqKFi9Bf9f78h1Ns5pTorbNF6pkZCztEz
         4i8GsiAzfHonHbYGPUjb0SdjeS4cqjXwQ11T6xWWLzkeTJ7NSIOLr1Ez66Xd7jvP4+oM
         i1YYCvJHg5mXwr9JKty8fCWTFGjxkCMfAjGC8Y3+4b8kaN9KeAH77FEWNBM6/wdbDIl1
         dFHmo6p8p5DfaPPl5ah4Suf0FrY/DifbFEedpnvkiyVxOESAm/c0Tt1HQaMdh3QQ5X/i
         raWg==
X-Forwarded-Encrypted: i=1; AJvYcCU8kNv8pe9vlWWjgOPC39jkeQqT/E0mz6fq0qBssGB3piBRU6+ynbIyKhzcskJXNTL+RgrUYWVrWob3+14e@vger.kernel.org, AJvYcCVbZaA1eKMAMYXZSfTq11d2p5tYdFV2hVGsSDQ6Fqy8C2v3I/Gyw/nd2eg+FonPlvc0IiAtFhH8/tpL@vger.kernel.org, AJvYcCX05g4sc1wmLjQaUr6l0mId6NIEDoEhqkwVDnqUnbg7AcheDjqlk12kLNik04IDtqaPW9LydfRGmHWu3SuW6MTkv9s=@vger.kernel.org, AJvYcCXYn3n0ywQ+ligzA4FIQcg2KG3oLnsPFwQJjF2Kj1c7Jqe8w3Xgnz1jo2h7sjHSRTjbjVlJ5JNR8GQn@vger.kernel.org
X-Gm-Message-State: AOJu0YygwN7I69QLmoKgRg5EKzdqKeTuPlaksN+kwnrYnbVJnnHfAwue
	oe9tmmgRkfADizgbGB31wUnnUNEVrs2Yj9xLtZj8sxV+/c5oimqYNp5CzLXn6vnBxuN6Cqf8S/U
	5/+QpE1d+RsqJRc+ca4zpL2nzvBGQzNU=
X-Gm-Gg: ASbGnctUJHauluxYtjfeKLYdp1BpFz8vSncqCq3vxHTGrSzuQyRQit0fkfEZElNbtBX
	X4TwJDN/tlzTh/NBO/uVgTPTuxAcaPKhIZ+RsjXY1zKVmjBUD2SUvI4wwdxGji4uvYof9jUd3dt
	Jj3b6IDmX1OuKe0zI3M7E6l8hFWtBbq4ovkPZQbsLhTA==
X-Google-Smtp-Source: AGHT+IHD06M89+R92xiEL8UI2HjrT/wU9KTtjXOhKqwmV3gg6qcks/pYMku3d5ryWfwdV85um2KzP4iV4g7S75iGXDw=
X-Received: by 2002:a05:600c:3f09:b0:43c:f895:cb4e with SMTP id
 5b1f17b1804b1-4535020de49mr53384425e9.17.1750168260361; Tue, 17 Jun 2025
 06:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613113839.102994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250613113839.102994-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250617-enthusiastic-anaconda-of-tenacity-2f79e2@kuoka> <2fbc985b-113a-4409-9825-49bdd029e95b@kernel.org>
In-Reply-To: <2fbc985b-113a-4409-9825-49bdd029e95b@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 17 Jun 2025 14:50:34 +0100
X-Gm-Features: AX0GCFtvSoLqf-Eyyght_AYKGMsUbMYxK_o7uZIaKRsvzxVD-EmSBsZMTRj_ndU
Message-ID: <CA+V-a8vvjHf+mz=A9AiD+ud6P-oGHhMt7KdOGsXW8cAjAJVoNA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: i2c: renesas,riic: Document RZ/N2H support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andy Shevchenko <andy@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the review.

On Tue, Jun 17, 2025 at 8:15=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 17/06/2025 09:13, Krzysztof Kozlowski wrote:
> > On Fri, Jun 13, 2025 at 12:38:36PM GMT, Prabhakar wrote:
> >> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>
> >> Document support for the I2C Bus Interface (RIIC) found on the Renesas
> >> RZ/N2H (R9A09G087) SoC. The RIIC IP on this SoC is identical to that o=
n
> >> the RZ/T2H SoC so `renesas,riic-r9a09g077` will be used as a fallback
> >> compatible.
> >>
> >> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> ---
> >>  Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b=
/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> >> index 86d79e167547..6876eade431b 100644
> >> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> >> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> >> @@ -33,6 +33,10 @@ properties:
> >>            - renesas,riic-r9a09g057   # RZ/V2H(P)
> >>            - renesas,riic-r9a09g077   # RZ/T2H
> >>
> >> +      - items:
> >> +          - const: renesas,riic-r9a09g087  # RZ/N2H
> >> +          - const: renesas,riic-r9a09g077  # RZ/T2H
> >
> > Where is an entry renesas,riic-r9a09g077 alone? Please add complete
> > bindings, not half-patch and then next time second half.
>
>
> Ah, sorry, I saw it in patch #2 (the tooling I use jumped straight to
> patch #3 so that's the reason).
>
> Anyway, this should be squashed with #2, because it is trivial and
> entire 4 lines of commit msg plus 3 reviews is really too much for
> something like that. Don't inflate work for us.
>
Sure, I'll make a note of it and send a new version with this patch squashe=
d.

Cheers,
Prabhakar

