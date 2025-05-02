Return-Path: <linux-i2c+bounces-10736-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A743AA7127
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 14:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16E123AE5FD
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 12:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9F62550AE;
	Fri,  2 May 2025 12:04:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA42E252914;
	Fri,  2 May 2025 12:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746187467; cv=none; b=PIadk/LT4KEzFcSwo1Nl5amG5HZze9KtYoaiuRxglgndk6DpiUZJnl8IhExdz8BHVTNkOpAXpSjdvkN1maRUtqHaHvBCJ+qn4pVTZzb8oM3lBCJBg1cWzgesl7eW2yvo8lvswGxmb+mGYmsvwpcNW7g7qyh63+F1E6qXy6WJ2t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746187467; c=relaxed/simple;
	bh=XWPx6xFTy9CLJ6Wlt8NgWF6CuTT4a7VdsWU7Y8a9FZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AFOy8XEoR53Kqa2vS4ixAlnPlyFRAdLiMjlAHQ2MSL33pndVP9XdpBmSeuNBVkfJKJ++QEaanu3+wxvL4PoSCHAS9IFulKHpcYCybxng08fuYsCu+tNmd8b1Rsmhf35akSeyYVrVCwU5dCBTIxR3isbcGph8HYbAHyDXvfZfDP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c55500cf80so190272085a.1;
        Fri, 02 May 2025 05:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746187463; x=1746792263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOzPOAHQMCOmxdJ2d2e+AsU+FXI1A0XpJIu1H20/Q4s=;
        b=AVffqMcx9088huzkde79Hq5AOihRGMPdl9XSK7lEqgvapPk9MT9iWcfFeNdWRn9g3Q
         hYA6IVEf3O053BJr/J1saydFKjPWoznuM0wvssdo59S/fwfZ7NNqHPP/YL5u5hn1e+eJ
         0x7et39Vd/pAlD9/rOqdzHNwuukBk4EFh85/bF7v1eOOUgp7t10y4WCURWKgDqXwECWI
         D94iNIgZ9q+/ywWIbXfu0qbgexA/kN0NCtDUdA6Hsw6YPy4fJGoDHGoZ4swEfhmOHolC
         6BeYDC1Q9BgNQyqeotKlfZAb/mp/g53axOAkYy2P7Ql1Q82sH5JGnAhLP9edFIQeGJW0
         58Lg==
X-Forwarded-Encrypted: i=1; AJvYcCV3vchOUlGrnIx3f/u03pwFv0ZEJXWrkuk0DKBu8jeyIJY87TQoh2fc7KtCp1ioJw4mCyXr06g4CgHf@vger.kernel.org, AJvYcCWtEuqPoVuyd71HYOX9b5Rrp5Ycq1EsqBNeRwh3zq4ac9jZgm3Cfr2tWrD4gSpJSWUabkB+4+GP0SUj@vger.kernel.org, AJvYcCXAFCGa9iboHj3GpL1e9qhmoPDWKAS1qULkbLGMAfpSjs9lzqR7JjvXfgNEsexY9NZZjwgdOQ/NBNdHcELJ@vger.kernel.org, AJvYcCXmg6HPv5L7iqfwKQLrE7semsZVd080PQ6O7y7GCg6nZQ+WNwXMABqfPB8SJRtBN1Y/H3clJvjSU1EZ7gCHxoH4tT0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq8rjM9B17gszPnsA3INQ7CT32q75Oke23y9ottWnrClgNxFR3
	XphPeT//XVYbqUNgn7lbWY2HOIw7WbPsep3s1ng4OinfV+XwUPYTBoMegdrh
X-Gm-Gg: ASbGncuVPENeszZrRxAVqfXzSdvtZ9U9Xg5ArlbYNxfU6jErPun1jKM7vEkFr1R5SkZ
	Ip4JgYpy3NRjraGPwVsMnogFhC/Z6g0PLicrt7V+6LppCWgzgPOyGhjQUth4XbwqF/lP9XepF17
	p1oW/scrow3hzBvG2syjNCEIwfaUKTGYs4OGxqPxcbQ9JtnW4JlI7Q8HU+oq89VSZF3dXiVsbXO
	9FoBQhM2i6ImI/EhzEGekz8tE/Cb3DThLNCmm2lTQ8B7dKvT72GTZWEAbj2QGmrGebbX1jv+UA+
	oNMovbuGW8xgaoN5ZBzenD1TH60guZUeGHlMT0oFJnCX9sg+9LzSg3r28CS781XeZ6/FlPNKALB
	YmedHFJM=
X-Google-Smtp-Source: AGHT+IENK4Pel0k6kzKGAMVpIiHHD0NWpIQc4fa7VVXS490kDieCwVNBueFzYVwM/lb4fv05NTbljQ==
X-Received: by 2002:a05:620a:bd5:b0:7c5:60c7:339 with SMTP id af79cd13be357-7cad5b23c32mr362364585a.9.1746187463564;
        Fri, 02 May 2025 05:04:23 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23d1c8dsm174633885a.60.2025.05.02.05.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:04:22 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47686580529so23902791cf.2;
        Fri, 02 May 2025 05:04:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLiRxTqZFfJx6YPgqDh9umSqa089E/8n6PoIE9YzxToxgNx3+MidwAv7bMRJFfKBJEQCnQA21W3GQtbjCcduyNPi4=@vger.kernel.org, AJvYcCWg1IzYBtXuQXu3gvJUih2dCPeWd9oB0l5jDiF2i7AqPmKgnOuLxY4OHXNTzQLeo1uaUINNqbDEMWpF@vger.kernel.org, AJvYcCWl+51jIj0W40ejOizznjMuqnmaQNhXgGepSurJ/7QhJAwYFrxSEKzZrv/P7e6qIq8eSq/xLWAw3PRC@vger.kernel.org, AJvYcCXbY/psSh3+/2UO8w8JkKk/1opqL3/F9sHEpXDxXzNQuCfBgI0Edg7/MAa3CWQNCrB+a650Me29DNuPICNb@vger.kernel.org
X-Received: by 2002:a05:622a:1b10:b0:476:78a8:4356 with SMTP id
 d75a77b69052e-48c3183797bmr34905511cf.26.1746187462708; Fri, 02 May 2025
 05:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501203310.140137-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250501203310.140137-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 14:04:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQZBSoOVUN=Q9qiDRgPXGYiApZ+ao462+xtCjZiXNoBg@mail.gmail.com>
X-Gm-Features: ATxdqUEJgHYtUiuy-xcdw0i5gv_WbXbGpCAVJDeLjetj7gfcOPxvIqq6CYKlgKs
Message-ID: <CAMuHMdVQZBSoOVUN=Q9qiDRgPXGYiApZ+ao462+xtCjZiXNoBg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/V2N
 (R9A09G056) support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 22:33, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document support for the I2C Bus Interface (RIIC) found on the Renesas
> RZ/V2N (R9A09G056) SoC. The RIIC IP is identical to that on RZ/V2H(P),
> so `renesas,riic-r9a09g057` will be used as a fallback compatible,
> enabling reuse of the existing driver without changes.
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

