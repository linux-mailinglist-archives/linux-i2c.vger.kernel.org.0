Return-Path: <linux-i2c+bounces-2301-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE1C876C20
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 22:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69C81B215C3
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 21:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C715E5F852;
	Fri,  8 Mar 2024 21:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glmeL94i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023DC5E097;
	Fri,  8 Mar 2024 21:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709931645; cv=none; b=D1osnco4gMCVYBAvg6jrTFb/+gGP4GOf8z3OASAUfGuSVucRLRnZZQoiftG6qcM1RvPC/tsI/qLl/1njxRvpqNnaXTkHxf4fwU9oaVUygwzjLrOOna7C9VEIYWSIFqYphRUIvj74jSBNeuM6mqihAJ50Zj2dYF4OmOecCCpyuuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709931645; c=relaxed/simple;
	bh=pTJxBYv1pjIHlsarzxs32JXHhlIz2wJe+DXB0ukuJMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VCv0cy64lND+X9zLpU18Ym3+v7veyZIVPZbOWsW2PI0yDtOizyJ+Liv0za5alRGbG3jsy3WdHwiuUGlTee2DlXQlYSx6D991lgFYY1EQb3JWXAtupaGDxcz2FpAenOLxU6Q6SdCDRshFDyhLFA99FT6HbWbcm9TY6g8hlKILTBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glmeL94i; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7db123701bcso1052975241.2;
        Fri, 08 Mar 2024 13:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709931643; x=1710536443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnwE0ZnAw4eXL9cINkP79BZdzw0jTPR+wR/OArytB+o=;
        b=glmeL94iM96EKABDckKNQcwfPdiRIlvTrO/9JrElSO7f07yleJRuH3BCC/87SowD7E
         ek5IKoEO9PWr0ifgvHcQRjgyadWIw/dTsZabMwiHlJ35nLlQdzpPK4zWP3Rbp4O4FrFZ
         1SgIV37Yma9Trva4XJSHz94flDMLxuCaUrV+iE0Xxqt2JhuHu/KSoOE/nV5Hcmm2Zilf
         MTjSOOXbynGtWQseTAYhLfH9ars219yfBm11d7zK+6y5G/SXbaB+LkgrRnprskD5gDJc
         7FlqqCzVPfR3emGXBlSg0IpCYg2+cLzEMCyKu/eBKYybFp5gudwfne0Fp7rixCFPmjLG
         jwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709931643; x=1710536443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnwE0ZnAw4eXL9cINkP79BZdzw0jTPR+wR/OArytB+o=;
        b=U9eJDkZe7MU0MJmqvXCMqCUWk4XIrcobsLFY6HqMcn6Ngm/ZRAx83Hc5wZg/2IJke9
         kqlOgOb+J7xgaMR5qps+k4f9jd9VSeAldODkeFXjIgj4Q46y0NguohibgkKzRU52xDs0
         hMHGYNPAfAs40/Zo7m/k/G2YGBBAp2KlW6Aqp6oeADqqbeTnj9Cnm31eAtuQXXeAHjGq
         1z0jnrV3irJbVz8PMuoJ8TSm62s5tzsLKiAEAivc4Lmfhar8/5pvGyhG12rpInpOlt7/
         /wVLzpmYCnO+9S4OS5XkZLQKECGLsGev5af1qmRbWogSAzt5u/MT4AsMs+DAsyTdbyTt
         8l2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrIUDw7aZ1oWSlyX4ukSwXziAZdDCIt2XecgxorrII3+Rg8+nvSAuUS2C+ZhPRu5jtWcsDbSYcvpSd4yIXzt18Uj2LX57Tfw6npGO1OR1nGfWOf9n0jJBHx7c1WVYqwzMpR+6mzu/TNavIsw2rl+iNP1cLoBvWSPKr5j5SVEWnSsEnqhppL7iL6pipbsK9xAw+D3oWnDZ+OsOKXunZkjRprX0p2A6W
X-Gm-Message-State: AOJu0YxQJsESJySnyvwv06zbYzN6AYGwXENZFKt8Wtkee7tfXGrHImjo
	ryCVyh0KN41ZBijXErSqnZ4YWxVcGVW5N1Y5OIxOmpIZ6r8E/ix8zgktrMVCfZRdW4b/1B+ciAO
	XVkyigUGi/FiRUBmmMKVCIBwteyZHMLjf
X-Google-Smtp-Source: AGHT+IHfrY5eqkMvWcxZ840qTOcv4FAT4TdgmwRqaMkPCAIY8ekf5maI7uBQFLo2gCpaOhgOgrdWSwl9J9QO8ngD+pw=
X-Received: by 2002:a05:6122:4785:b0:4d3:499a:830c with SMTP id
 ee5-20020a056122478500b004d3499a830cmr557596vkb.13.1709931642864; Fri, 08 Mar
 2024 13:00:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240308172726.225357-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <OSAPR01MB1587CFE774834B31820E7D5486272@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <CA+V-a8uJO_qz6CaD2zUXC1Kf7tuM+Nzq6W+WHjy09NN2FAn+fA@mail.gmail.com> <OSAPR01MB158788EB1E8959BA8455E5FD86272@OSAPR01MB1587.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB158788EB1E8959BA8455E5FD86272@OSAPR01MB1587.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 8 Mar 2024 20:59:35 +0000
Message-ID: <CA+V-a8uVCwww7MGVYe_0194SDJ5wsxjwRCAwLLQq+KF7nMVTiA@mail.gmail.com>
Subject: Re: [PATCH 4/5] i2c: riic: Pass register offsets and chip details as
 OF data
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brandt <Chris.Brandt@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>On Fri, Mar 8, 2024 at 6:15=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
>
> > Subject: Re: [PATCH 4/5] i2c: riic: Pass register offsets and chip deta=
ils as OF data
> >
> > Hi Biju,
> >
> > On Fri, Mar 8, 2024 at 5:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas=
.com> wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > Thanks for the patch.
> > >
> > > > -----Original Message-----
> > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > Sent: Friday, March 8, 2024 5:27 PM
> > > > Subject: [PATCH 4/5] i2c: riic: Pass register offsets and chip
> > > > details as OF data
> > > >
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > With an increasing number of SoCs reusing this driver, each with
> > > > slight variations in the RIIC IP, it becomes necessary to support
> > > > passing these details as OF data. This approach simplifies the exte=
nsion of the driver for other
> > SoCs.
> > > >
> > > > This patch lays the groundwork for adding support for the Renesas R=
Z/V2H SoC.
> > > >
> > > > Signed-off-by: Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > ---
> > > >  drivers/i2c/busses/i2c-riic.c | 59
> > > > ++++++++++++++++++++++++++---------
> > > >  1 file changed, 44 insertions(+), 15 deletions(-)
> > > >
> > > > diff --git a/drivers/i2c/busses/i2c-riic.c
> > > > b/drivers/i2c/busses/i2c-riic.c index
> > > > 49a12f1ecdf9..3398d639b754 100644
> > > > --- a/drivers/i2c/busses/i2c-riic.c
> > > > +++ b/drivers/i2c/busses/i2c-riic.c
> > > > @@ -46,18 +46,6 @@
> > > >  #include <linux/pm_runtime.h>
> > > >  #include <linux/reset.h>
> > > >
> > > > -#define RIIC_ICCR1   0x00
> > > > -#define RIIC_ICCR2   0x04
> > > > -#define RIIC_ICMR1   0x08
> > > > -#define RIIC_ICMR3   0x10
> > > > -#define RIIC_ICSER   0x18
> > > > -#define RIIC_ICIER   0x1c
> > > > -#define RIIC_ICSR2   0x24
> > > > -#define RIIC_ICBRL   0x34
> > > > -#define RIIC_ICBRH   0x38
> > > > -#define RIIC_ICDRT   0x3c
> > > > -#define RIIC_ICDRR   0x40
> > > > -
> > > >  #define ICCR1_ICE    0x80
> > > >  #define ICCR1_IICRST 0x40
> > > >  #define ICCR1_SOWP   0x10
> > > > @@ -87,6 +75,13 @@
> > > >
> > > >  #define RIIC_INIT_MSG        -1
> > > >
> > > > +#define RIIC_RZ_A_TYPE       0
> > >
> > > > +
> > > > +struct riic_of_data {
> > > > +     u8 family;
> > >
> > > Do you need family as compatible have this information?
> > >
> > Yes this is added to future proof it, as the RZ/V2H SoC has some bit di=
fferences in the slave address
> > register as compared to RZ/A and RZ/G2L. Comparing the family outside p=
robe is not always preferred
> > hence this is added as part of OF data.
>
> Ok. Got it.
> But the family variable is unused and is wasting memory.
> Simple reg layout is enough for device data??
>
Ok, I'll drop it for the current implementation.

Cheers,
Prabhakar

