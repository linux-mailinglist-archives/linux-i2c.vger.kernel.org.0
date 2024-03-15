Return-Path: <linux-i2c+bounces-2370-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC82D87CDD8
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 14:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82F78281969
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Mar 2024 13:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EB925775;
	Fri, 15 Mar 2024 13:12:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5D71BF3C;
	Fri, 15 Mar 2024 13:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710508321; cv=none; b=erEernYzog+mcrNEz5ISJJfa9At12JRwUJdq1JxIZcuIdCLNiZOOyYT4oqcx7z6dNaHyoQWKh2GncJxCyeVPw2g/lOH2cLa+6qruMSwDQ4RjlPJJlbyPMnoiydxacGdcXBXs2mDJa13yCOkBdmPytBjH96oeTQuw01OWOg4AZao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710508321; c=relaxed/simple;
	bh=UuwHY4ZFMlB65Epsbt1kUiq1o/nxTSKYqjs+6mdTBe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O96zgCFe15LaZnIqEiP9GcIKNvgkXJq5bohe9JBwEe0+gSm/W37Kk8twUH0KZ0ILaFLdvfMwYHQgZ7lV/EeWc0gbCo03EDryZjtjKdOz2aGSlN80bwYyWolaNLjKjYYmw/u0TnFUMlgSYkyBP/OqZ2q9msyyt5/FQbl4idFjcYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-60cc4124a39so20979797b3.3;
        Fri, 15 Mar 2024 06:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508319; x=1711113119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVOxCh95/KJi62+yTmpvlCdEQMQ6jz665GzmWbEhPz8=;
        b=Kiw9r5Bc+lQahQmXDXRo+g/dWGH+VV7E7Wy1eKx5NER3Mw54xacz5ynvVJ16qnOo59
         VthZze8ihRmx8n6PZChAZx+PPzcnljG2jXDSqCY9KAoLjl2nz2LWA3T/QEGpGyDRoZ+e
         JLkB/LaXRSblgvSe8a5qzSmEKpvvz4HnoEG/wakeanzJUBdf+3oexh+iqhoprqXEplT5
         7SqCYVnDSgTgHq3PUYTacjEPOA2294cibOWkQ/Pulq1LnX0b6LNWpqXmBfXqpQRai6pJ
         UvJkPBNSMRMnJ3NILnPKfTRdlIodg31/v+n8be/YbaETUz4S1nfZBK56yzX03dezbE4q
         hKmw==
X-Forwarded-Encrypted: i=1; AJvYcCXTs5LVGgO+ADZhcAEtu+d6SY2nXXJcvnlyE9KXvuy0pw68APfRmKrvnwDqplrn+ZX+dkRMsdh6I5UW7/GbpGVob2f3hMrygkBAfaOWwC80ZItQT/bqUx96rVEDNbsjUtdxzdziJ65c0Ns+TLX8H7229ClSalw5ccIMLb7aU5dgpAe+b+gho1IRpyuFIRSJV2PuyiOowNg5/7sCY3Uy98daLPGS0AxN
X-Gm-Message-State: AOJu0YzdAjz8xLV2PaCCnfMvYDqXGCkuJ9zPxIvAPMNCJbsdaRAT2RoW
	dkVGv0skaIDs2cLb6FDWk7qLGNSyIsOx8cOuW6Kvg9ErPOz4W6eja+qjEbYiPFY=
X-Google-Smtp-Source: AGHT+IFwRnSQ1uOS60vnGxMSEj1ecuv83vG7+F1w6usuIyvzsJscLH1CZQK3kHFryhGYn5rlTYSQog==
X-Received: by 2002:a05:6902:507:b0:dd0:972b:d218 with SMTP id x7-20020a056902050700b00dd0972bd218mr4559997ybs.41.1710508318692;
        Fri, 15 Mar 2024 06:11:58 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id x1-20020a25ac81000000b00dc6d6dc9771sm720570ybi.8.2024.03.15.06.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 06:11:58 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-60a104601dcso21567257b3.2;
        Fri, 15 Mar 2024 06:11:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUn/GjSwbgqw9/5A9VRB8MkZ1LEI6aQtEhwGW9dVMRl+/NyLa16j5wivuhGTjQbccSQyImF96Ze9AnFeHHgtXDkYQTYE/o8CrD98z3bQw6pkK1kQc/b2hrb8+lDnif0OwhnJCV5E7Z2vwTEGDR2UdTsbviYlW5CfJQSAPBjqH/05+Hld5G4xyBzt5ebTLZilAFs8W9O0Pv0mDzK8/TS9P7QsmcU+yt5
X-Received: by 2002:a0d:d44e:0:b0:609:254f:766d with SMTP id
 w75-20020a0dd44e000000b00609254f766dmr5095186ywd.26.1710508317947; Fri, 15
 Mar 2024 06:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315103033.141226-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240315103033.141226-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240315103033.141226-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Mar 2024 14:11:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVAmVE-WwoZ5fzmXpM7-RW_-GXKRmXgywN_Sh+tmK32zQ@mail.gmail.com>
Message-ID: <CAMuHMdVAmVE-WwoZ5fzmXpM7-RW_-GXKRmXgywN_Sh+tmK32zQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] i2c: riic: Add support for R9A09G057 SoC
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

On Fri, Mar 15, 2024 at 11:31=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Extend the RIIC driver to support the RZ/V2H(P) ("R9A09G057") SoC. It
> accomplishes this by appending the compatible string list and passing
> the RZ/V2H-specific OF data.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Dropped setting family

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

