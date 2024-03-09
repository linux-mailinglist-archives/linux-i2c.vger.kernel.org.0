Return-Path: <linux-i2c+bounces-2310-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D5787747B
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Mar 2024 00:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A28C1C20EB9
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Mar 2024 23:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7A352F82;
	Sat,  9 Mar 2024 23:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYJZT4p0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B7F4E1DA;
	Sat,  9 Mar 2024 23:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710025568; cv=none; b=Ec4whSQ2oI/vNmxFsBeeFyxXj6Tl2ujvH6UKGsGQZd2qvnzTZ7gvvnUhEy7WLzydTeLmGIfgu/K6CoK5IvZE12iPCIYvkpz4h18IZNFqu/rLHMfs/nJGTHCafqN1bBrSw18sRXC0rPf11Z1+ty3En8zVzMeZQNSY0EmpELFvFJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710025568; c=relaxed/simple;
	bh=/thngdVDKlrNaMKuRN62fjZWYmLfJznXkNHPUyz/34Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8O5UlSSYSxv1nHvrd2xgVOID+VcYDV5MXi18yyHkx//3omBTr5HsApHa7k02EZBnwv+cFJyQghE3khzhEo4mGzAq6N0pRXKXs2WrYgHcGgeXuNMy2uEOk9fk3dfPLN1+RlkSLIzsbfQqfIz2Ve55ywK+fSYewxjlqEFGvxWm+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYJZT4p0; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7db36dbd474so1007731241.2;
        Sat, 09 Mar 2024 15:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710025566; x=1710630366; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOq7BbI2JVGZBDzmJf70D3TONafwYFp02xrmfbBTFFQ=;
        b=XYJZT4p0ENK0GNV++DiCeeuqHSUw6XS/A79r+o+Doun+XwwDZqrHVoiHmBaE0XFPip
         TdO+msASNnh9VQx0Ex5nxlLqGMuqodBLVxmKTCkAzv4bAO7gTF1J/3yxF//OjeCWGdqZ
         gBMeTY+wccrV3qzd60AJbYX824SNcCCp4yyA7hwFv6QFd3fpptYjLdiGhoKpo7xa1Ax5
         x42vwIfwtvbzq/0uO/AlvO0CCWU+76TgzwmSjLr7OYHQL2yMrXHAdk1nKse4uKhIaTn1
         YM7YNEFoYaRtZST76OgrvByw9L+eIBg44N9UoeagAqK0KfyvmCHqpCwZRUDuD6OiaCis
         p1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710025566; x=1710630366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOq7BbI2JVGZBDzmJf70D3TONafwYFp02xrmfbBTFFQ=;
        b=FEawyy8fc/5hAWIWFzBQBPkHRYzDDQj5Aalb6npnLicBhCQ7r2mhgktJLOkSFjerSG
         vFq+DXXgsNKd8FnZF3iVW9toOiEW+She/AHuqglGtN2mt3KY9YBQPHBeLr9vxUNAGp+v
         lWDh/c8WD4G3bspmyBODcOighThnn3nbPhSnvI/K61QN25ngL3UD49L4D7eFM6W5qi37
         Idmm3Cbb9CvmxWnF5pPGNlq7rIyHGFGsoo7F30GMnQ0NzGsdrLDwobltkeD63Rkdp8iA
         p+BpzFdP39Ah0t11B/gLtbAQjzGJ1HmY+qGX6li+5J30TbyaHAQxQSLw8tV6tbQNXX4Z
         5CaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXisNWPgnAJF6H2p9Jl/W50zE63PxfN4yiFUefX5hBwYGI6AlU/uYWE3wh4RPc4DH2wrIVP7WPIjMYVRhAKB4fX1P3s6JSOl0L8/Z9lVJxXx8e2nR6xn+yzRRlhNHQ2yqo0PA4oXI76eo8QAKBXnn1DLhc9hpcgL5lF8FluNoSzTDTDqNI96wyUquuqV8mGwpH9ORerf9Wvl1IwDoZT0ZEZy8+9obXa
X-Gm-Message-State: AOJu0YzDVAyE05+crirhUU7mOkeZEEqnbdvkgbXmvSm51eXbL05kBzvN
	0POV34TtGJ4qhkaR4ZXbjRd+75NIk/etXGp0TM9By4mujqom/6iHgczLBzxSaVk/VrNhAVLvupZ
	bmM1AA098C6UsPtoZvreKfRb0Heg=
X-Google-Smtp-Source: AGHT+IFDmKM/QLReY0QmYUEUY84H93MTKMlc9pqF2JafzhPJPNJcMCcPosmn0hkTsjHTT4uWPtTEfpH5pL6JgwfbA8k=
X-Received: by 2002:a67:f842:0:b0:473:c2a:8110 with SMTP id
 b2-20020a67f842000000b004730c2a8110mr1438933vsp.24.1710025566199; Sat, 09 Mar
 2024 15:06:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240308172726.225357-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <aee88f81-0b8a-4f57-9dab-b4d13db47abe@linaro.org>
In-Reply-To: <aee88f81-0b8a-4f57-9dab-b4d13db47abe@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 9 Mar 2024 23:05:40 +0000
Message-ID: <CA+V-a8s9OaZ7_RXGjkZYpNS7879ku-aXJ+AvsfgvuTZshyWd5A@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: i2c: renesas,riic: Update comment for
 fallback string
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brandt <chris.brandt@renesas.com>, 
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

Thank you for the review.

On Sat, Mar 9, 2024 at 11:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/03/2024 18:27, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > With the fallback string being utilized by multiple other SoCs, this
> > patch updates the comment for the generic compatible string.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>
> Really, you review a comment change? Internally?
>
> Is this some sort of company policy? Are these even true reviews?
>
Yes this patch was reviewed internally and it's "real". Unfortunately
I cannot share the repo externally where this review was done but I
can assure it was reviewed. As this is not a single patch all the
patches in this series were internally reviewed. Is it bad to review a
comment change?
BTW what makes you think I have added fake review tags?

Is there any guideline you can point me to that states what needs to
be done when the code has been internally reviewed please. I'll make
sure I'll follow it.

> > ---
> >  Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/=
Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> > index 2291a7cd619b..63ac5fe3208d 100644
> > --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> > @@ -22,7 +22,7 @@ properties:
> >            - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
> >            - renesas,riic-r9a07g044  # RZ/G2{L,LC}
> >            - renesas,riic-r9a07g054  # RZ/V2L
> > -      - const: renesas,riic-rz      # RZ/A or RZ/G2L
> > +      - const: renesas,riic-rz      # generic RIIC compatible
>
> Just drop the comment instead.
>
Ok, I will drop it.

Cheers,
Prabhakar

