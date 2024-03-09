Return-Path: <linux-i2c+bounces-2311-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF452877481
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Mar 2024 00:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49B951F219B3
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Mar 2024 23:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF9C5339A;
	Sat,  9 Mar 2024 23:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jewKj7jd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7231943ADE;
	Sat,  9 Mar 2024 23:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710026959; cv=none; b=R51Ky22pIPoFgsHhCH0I1IiphxF9+3+TUnqBx/GG0oOuGPBdl4LhI3D2GJqoIbm734UaAlq+RIJlcdEKkN7VeFcskRDqxMaoHVuoMigq0FxHhJPZ5OylkFbBp2oOu/vseOJX6hovP2WK+niD3FGkc1csvCy0vSph1EceaqdQT9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710026959; c=relaxed/simple;
	bh=RiFYW+zTZNx95akeahA3PSf7Dx8KAVXi6pxRc7N5gag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqOiM96kCm23RbEOZAQz4A78sBHtoEAmHy3P+q8lJ4QvF3pPiDLaC10jVxDQEfDl0kI12cg2y+CMZvmw4xqmR5oxdOP8iZEC57YDCjXlLGo2EyNasQBBd+kgg1yO9aNk/ACBFaDdTw5e7NpyYmiC5jH4Z8Uyf9Rf22HzjpcxBhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jewKj7jd; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-21f70f72fb5so1740514fac.1;
        Sat, 09 Mar 2024 15:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710026956; x=1710631756; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pv2oTx4yAt7rLN+LxRpSAXwNMBDUXYe5fhs7ipCtTPw=;
        b=jewKj7jdyw2BeHwvTVpYWg1FcKUGvBnr6LC1bE/T4rYRWaPdKLQ7klR7ikEkk7btzS
         +eS6Tkv9t5iYm1OgMJH8cQuNGtp2pUyXUVxSD4GUiOBd7C/jOYX2qc4O4CIOw5F/n6t4
         3YP1XuICCVbK4Y2Z/tHFZU9nEA+73RYtdZ+hv9MCRz2bBa8+AEyVX4i+XHhnofMAXj4H
         p1qLU0KzYJ/Y+aqmw2/6Xl/N7/txWrWIN1Ps4MOaB/grc5iwYa97WaLws6ttBk+sVCF+
         USmjFPmwgg/h/p1xpUOXfhnG9KKNs+NeroxgUY/9wHJOwRzPPS5divo1LjOGRJ0dY2Py
         16PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710026956; x=1710631756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pv2oTx4yAt7rLN+LxRpSAXwNMBDUXYe5fhs7ipCtTPw=;
        b=fs84PCPTWVn2RBw0ARJj2mLPU2gEzTvtrRE3d+/GIMt/RZYpqQZ7jbghDLNYcuxq5+
         ipz1BTgnax2GUWNc0bX86EjjYPqbC5oGLGGW869PWUgmDZQq64Ze6XPnUMq72yS02crT
         z4T89GECVze8RYNIE9noZ38ns1OmacGjrcS41QhRvw78n419MdL6jzKnz6tGxKcwjSc6
         yTaCdL3U7pSrsuKtwIdWL76QRGae6elSLXaFL/EbMlsziWQ8xGSej91pUsMeIyIHBCji
         kJetMIuwoYL2EmOehUvW54qpBS4a4IFeDNu3tnELJ5tS7tplJwVspEmrdZ9BGGryuaa8
         BJ6g==
X-Forwarded-Encrypted: i=1; AJvYcCUZ1fvWM1KlDn1Omr/fAzy0SJOMoOOA92MG3DTCrBLEHVBQglBen8mTyO4lFf3T3zL4YKigXz4XWnG0zdlaxFxNcyD5m2wux9pRbQS4ed5zkGqsL56yxYIdPpecqjO7UoMqLypOLVhrYPeDpMrjojX6c51tsSUp112Rlv9bfAwCbOZyhb4JfJwBmvRVgZadJavthIha5aphbd2TWSbzV6lSh6QSaYeI
X-Gm-Message-State: AOJu0YxPAgEvLy44BHWZc5UNFix14xXKMZL1gcLN3FCufvKheWUqm4TQ
	nSmGoAn/5dLg5H9IYriONL3Ab1ccdvS888uaxAIoFvF8xVqrNtMUChSiRjNHojDgna/XtDNfB+D
	Xb1LM4E5h2xyXjL4mv2KRVCg3mKEoWXZLW0w=
X-Google-Smtp-Source: AGHT+IEijGBrQm3bQWLHeoCTEMejt5wl9ZptNHRQH6rTNP4qm8EsvGQcP3y4QEZ6BllP8oHGAoebwF69y5eMU2VmUVA=
X-Received: by 2002:a05:6870:b51f:b0:21f:d4ee:ae01 with SMTP id
 v31-20020a056870b51f00b0021fd4eeae01mr3227819oap.18.1710026956376; Sat, 09
 Mar 2024 15:29:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240308172726.225357-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <7082ed3b-d6d0-4228-b7a6-7c0e0e46b8e2@linaro.org>
In-Reply-To: <7082ed3b-d6d0-4228-b7a6-7c0e0e46b8e2@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 9 Mar 2024 23:28:50 +0000
Message-ID: <CA+V-a8tM29h10DULurMJtBZBnLK_ZF7pH_Y0bhZTvWO0O7-G-Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: i2c: renesas,riic: Document R9A09G057 support
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

On Sat, Mar 9, 2024 at 12:00=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/03/2024 18:27, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document support for the I2C Bus Interface (RIIC) available in the
> > Renesas RZ/V2H (R9A09G057) SoC.
> >
> > The RIIC interface in the Renesas RZ/V2H differs from RZ/A in a
> > couple of ways:
> > - Register offsets for the RZ/V2H SoC differ from those of the RZ/A SoC=
.
> > - RZ/V2H register access is 8-bit, whereas RZ/A supports 8/16/32-bit.
> > - RZ/V2H has some bit differences in the slave address register.
> >
> > To accommodate these differences in the existing driver, a new compatib=
le
> > string "renesas,riic-r9a09g057" is added.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>
> I have doubts this are true reviews. What did it even show? Why this
> review did not point problem with generic compatible?
>
As mentioned in path#1 these are "real"!

> > ---
> >  .../devicetree/bindings/i2c/renesas,riic.yaml | 21 ++++++++++++-------
> >  1 file changed, 13 insertions(+), 8 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/=
Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> > index 63ac5fe3208d..2a7125688647 100644
> > --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> > @@ -15,14 +15,19 @@ allOf:
> >
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - renesas,riic-r7s72100   # RZ/A1H
> > -          - renesas,riic-r7s9210    # RZ/A2M
> > -          - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
> > -          - renesas,riic-r9a07g044  # RZ/G2{L,LC}
> > -          - renesas,riic-r9a07g054  # RZ/V2L
> > -      - const: renesas,riic-rz      # generic RIIC compatible
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - renesas,riic-r7s72100   # RZ/A1H
> > +              - renesas,riic-r7s9210    # RZ/A2M
> > +              - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
> > +              - renesas,riic-r9a07g044  # RZ/G2{L,LC}
> > +              - renesas,riic-r9a07g054  # RZ/V2L
> > +          - const: renesas,riic-rz      # generic RIIC compatible
> > +
> > +      - items:
> > +          - enum:
> > +              - renesas,riic-r9a09g057  # RZ/V2H(P)
>
> No, that does not look right. If you added generic compatible for all
> RIIC then how can you add a new RIIC compatible which does not follow
> generic one?
>
The generic compatible above which was added previously was for the
RZ/(A) SoCs and not for all the RIICs. The RZ/G2L family was also
compatible hence they fallback to the generic RZ one.

> This shows the ridiculousness of these generic compatibles. They are
> generic till you figure out the truth: oh crap, it's not generic.
>
Sorry I lack skills to predict the future of upcoming IP blocks which
fit in the SoC.

> Stop adding generic compatibles when they are not generic.
>
BTW I am not adding a generic compatible string here and instead
adding a SoC specific string. Anyway DT maintainers "should not" have
been accepting the generic compatibles from day 1 for any binding at
all.

Is there a guideline where you can point me to please for when to add
generic and when not to.

Cheers,
Prabhakar

