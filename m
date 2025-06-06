Return-Path: <linux-i2c+bounces-11263-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86967AD0311
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 15:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4AA7189DDDD
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Jun 2025 13:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB8A28934B;
	Fri,  6 Jun 2025 13:22:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AB9289343;
	Fri,  6 Jun 2025 13:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749216161; cv=none; b=aGVMNYDQlYcn3AHOhrYw2JNtSDPYghBU3bdqE6Qjuoc6A41rxPW+D7SxpUOBknmi4jogvxZKh3tooTvIJA+aRd2oF6j1jpFydfDKBrLM1LjXJ9JNeLoyahWkzRlFKK93gAonC6tQkK4mm0LnFYLM4P6geWPXh8nD9+laQBxSVPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749216161; c=relaxed/simple;
	bh=ZsoJUjaH+oW4xo2G82bXQWjuaJqme9bI2wN1OlWKaZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmX0g6XhaoR8qgkPq6VEJq5VPzuJ0qTsY7I+RL1eqSflfUGcgarZ6fgy0lUhm2ErGISH7dtTgF+oJsywii4KGg7ofpV6Ipy1zzA7dFmFgqf1zOgD2gYlb/myUVemyzX5uYL90IfcBkC9pzXhYr1NWvHNa7eZjdVC1ibyTi3/NsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-52d9a275c27so1461756e0c.0;
        Fri, 06 Jun 2025 06:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749216157; x=1749820957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WI/wExaY6eJYLw1Pr2aYNx1yhBsKo1FCeIuLICYqtY=;
        b=QMP+snqcucIQwrjSGgPgYQgNDQ6EKvfTGF82x6Z7BnG5o+nngI3NZxZKyNx4RncCnF
         A30Dxqwzmza4xFNcK64GBmsiv1NuhtmN7LhA4XAvu5QgrzE54OhTUprpxJdruck8Z88O
         yWWLPxfXJt5qHKvdXa0e+dM1bKWArxCFobmvO/BwGzQqDRT0QnJayi7NKvLa/zDJBID+
         S0tiPtVlfgZfrLiFQJEOqn9GCZEp62F7MDxU5q/hEp3s2Rm/1meE8Q4w4ni5+s7kTNUO
         MWwlt97ftyyMREIBrGBm3jrm5Fmmgjt/Gr9rn7x2jIa1OUkFPIp8Sx/bYFKQcWRq6/e2
         liVg==
X-Forwarded-Encrypted: i=1; AJvYcCUnyTWlyI+HoECMhU9WSAbfM4AbylSqTvNwoMMZ2fI9CDv/Znoijjf1oFvm70+8UJce8AcGmukmthq5Qhu8IzoLCXQ=@vger.kernel.org, AJvYcCVDaLUd8wbWxOH3Un+L/F69KqABVfcieoKnLy+EKtIye72Zq5MwW0eHHBxExuQjuGgc13sXFI3ZTot0@vger.kernel.org, AJvYcCXnund3PeqyhEP9li4pBIJeuXcivDCoZGBWT0AgmLfaMVvC1YBmeHCe5OPE8xkoSXU6Lwi/oJK7I4SN@vger.kernel.org, AJvYcCXy102tDK1ZxloQfgOlDGhbXLL7Tzuda5oKri3Hbpjpjh7uYnC44H58UtD1mONCMfzPOP86TIB4bUQz8JCd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ueEwgrGBp2Rw3L7MOUmpmcAGFswOBb6lsUUHtZzZHLmlegSZ
	ZbR9YinUDOxiacFt0gj0NHEZQncsh7/02le7svjCG9+IX816UzJ/kIaW0f0X3dxG
X-Gm-Gg: ASbGncuxEFHRtr4J6/0VPWfGpeSj6CrdiOsoIxWXlkhuqVlPuZKB6Ky+ZWlWJuQmz/w
	gY19Kz3PFxQYrBaO3WKXrkbrh5sEgOLYrbkxAc04R1+UACxFnipeN7+9ZtvtGSqw0vC3GhvWlkd
	6+rQXm7RUeL6oexHU/37IVyc645to1CxXpezFgkNpOj0KAnWDhxxOXJzEdbcCP4F/CecYKcHl7r
	v65mL2VU17h1yJtdWU6q0cqt2O+Smo+EZr+aj2pDa5a5fUZry4EdWy3IitKwCcAMt5ZLvv+Pzgi
	R2qCmLeHIJ52AYlLn9WWIbzQG1W4SckY3y+PVdTlt+7AdQhXmeXwKyPQ2GNaO//oR/2RuZ+uh1e
	MHhKAhd0dFPV+abyh3Xh/nJCFH+EvvktmxRM=
X-Google-Smtp-Source: AGHT+IHjyyUrgUoFL4ZLk6Amkq5vhXLvxbXBs+lVBPtlig3neeFV4+dsM3b/3HeVe8tHg2+BW+Sgyg==
X-Received: by 2002:a05:6122:4f97:b0:530:602c:4d4c with SMTP id 71dfb90a1353d-530e4799d82mr2720231e0c.1.1749216157504;
        Fri, 06 Jun 2025 06:22:37 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-530e64315aasm1074278e0c.48.2025.06.06.06.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 06:22:37 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e47c2a9cdcso1436434137.1;
        Fri, 06 Jun 2025 06:22:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYBy5/RJ31bNJPR3kg1Ws76xBY3d0kuBHAtJ+8+uw6emXe28y9ZzhjeOUv0cecDWCSqcZpXY+P3MbB@vger.kernel.org, AJvYcCVYwkBvZJOTPhp5LrTeFf+c6x9K9i+YNvZs2AijehEyOeZoM/uLmdjs1Z3D1gCchoSHJqqA+XRliill/dPd4Ad+dpw=@vger.kernel.org, AJvYcCVw/gRh4ikMCZOTDoixQyuJ4ZaTJjqi8hKPnxKkBWtwrNazdiKemkKqcSqx/k9OgnwhSPydf3/Adl6r@vger.kernel.org, AJvYcCXCPkuz7NMKOlXCGjwdsyS6jwgV3u4U50PZraRDuM1Sfz/6A0Dn/oBgAS54l1T9kSBMjAuflU5TL2X2IrQ6@vger.kernel.org
X-Received: by 2002:a05:6102:2b9a:b0:4db:154e:ad1d with SMTP id
 ada2fe7eead31-4e7728caademr3197869137.2.1749216156656; Fri, 06 Jun 2025
 06:22:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250530143135.366417-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250530143135.366417-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jun 2025 15:22:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtMYaXC3H2rq9bj5nAndbdHxSmKrd1Sfe+exSvbx8r1A@mail.gmail.com>
X-Gm-Features: AX0GCFuZnGL2g4R1vtjMM1CxH1Pkf-zaqqHeM-r0-cbgiLfKvJLbRBgcT1l-mKY
Message-ID: <CAMuHMdXtMYaXC3H2rq9bj5nAndbdHxSmKrd1Sfe+exSvbx8r1A@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: i2c: renesas,riic: Document RZ/N2H support
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
> Document support for the I2C Bus Interface (RIIC) found on the Renesas
> RZ/N2H (R9A09G087) SoC. The RIIC IP on this SoC is identical to that on
> the RZ/T2H SoC so `renesas,riic-r9a09g077` will be used as a fallback
> compatible.
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

