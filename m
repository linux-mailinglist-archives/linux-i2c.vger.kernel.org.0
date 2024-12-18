Return-Path: <linux-i2c+bounces-8600-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAAA9F674F
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 14:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE05D7A1760
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 13:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7EEA1ACEA9;
	Wed, 18 Dec 2024 13:31:51 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA18817C219;
	Wed, 18 Dec 2024 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734528711; cv=none; b=MZjPT2u9rMeKvHMwiVXL9jyeubFPVdizY4GuY9IrQS8ZooI1WLVnDtgJ9STdcBeJarlxjqS2WPm4PC1hxYirH4a0/DDOFTexBjhVXQ8dWACQnDSvZVrJdIDiSX8jRYP9tjVHxJrAsS57rziR/TLCsjyp6oNbKheUDnErc0vKvVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734528711; c=relaxed/simple;
	bh=M67mW0vysFwnvjj1IVUzkZ4GR3CeNqaYeZEiUUl5tvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UgL5l2YcGSj+r7stiLRsC4d2+mMAY6r3f6wB7qVZM3AV+JVbdO6v+B7Ee+BjBZQ/sXdTROvQeoD0WzlGNi5pnpW+SeITGLVM7HGr8BTywb+W5ZXG39nEcckKHU9DJUOmJJT8cKQeuf99P36ZJpqiu3GPJIcEYnzrjFlbENi9T7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6f1be1daeso521032985a.0;
        Wed, 18 Dec 2024 05:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734528707; x=1735133507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cL/KgIXTFRYnZUnBOg8gRh9RZCj4EmozXh9LLXsdgJM=;
        b=F/r8utlMZHmmxtN13HjbNn0MqN2Ev++oWX4GX/k5i4vuxeMn8oSJf/z5BnDZdOJTZL
         v/bYUsL8xlfOEXEurJnuuuKKDu6R6GBnIybSFa9Upkf6EApjvm5G6DBbHQsrWMvmdbJo
         Ou9aNl4vjauCE5Qf6rWe7FfNTa42Yjt+F8LO72b8jEHZM8MRNKI/04y1LqLX3HnNwgZ6
         AI+VTaDdsWmQmLgyhlT3o+ojQMQxDP3HeY9Q42j0Ukn/6kAcsKgWeoZstl+83OpZgkQw
         dZv2W3dD2gaQPg4zBbsxKt75qk9TROhwd1GDVxvhzyEnAUEe6TK2ypZzKS0cV9F/8NoG
         EeCg==
X-Forwarded-Encrypted: i=1; AJvYcCUuYsjSybk67iqQJ77X+bodm8bVbUL3wbp2FcMGbwDBNa6OacrfNaMC+BRSzpVannzN4iIlE00+84D0lWn9@vger.kernel.org, AJvYcCVs/utIjnlUVyjJB2tiWt4MgJNGQ2/rL/h9z/g0OvHr04f9o0h4zq886cK7GeZ5APF4q979EERUCuH5wLLC21iBnCE=@vger.kernel.org, AJvYcCVvha1QOmB5OdWVfvbEj0k+WA4GNpiyQUWOLWtz4RL0dXWDwpnCkqhf/JNz5+f0ahfXIiS/VdfmL80=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx69NImB4rFRWxAeUxB98HUIyJAbJaSiBDko5GC+8nQGfh4p1VQ
	EhgTE4PtfCokMk8EYa7yozzAyIgscXlHCjRROegdHC15BtHpKEjte/hcE6T+
X-Gm-Gg: ASbGncu60Ju13zVsNKrUliNe2/8Qd6Txul18lVnFavWAZMfCbGqmli6oHHZB+rxEtQo
	YYi47cnDEpwX3lx1+O5F6XorC/sszDKEBViPfKHRh8guBKbK1aMJWMyRUuJhvRm7Cc0fJsYfoqn
	wwjR+ZPMJ9FoG4x1bkmCvZoPL7uJ7zbyg+Fd3c24INY87myOoa2dJVPNah0dwOOa9wys3YMwKh3
	BGPciNs48ZoOQbQIKcFEgvjo08LLpq5tIrxZ7MOEFl0BQtzR71AAYG23QGICa5ZCY73YqRBrPRe
	xSPPrIYje2xd/mGKIWKzbLU=
X-Google-Smtp-Source: AGHT+IGElyw5NFZH+33CE7KgQbeT6Kvf/ELkyrHY/esm7XaW8WQR7uXx3OqdphPMDfNZW9RrVgAB1g==
X-Received: by 2002:a05:6214:f27:b0:6d8:7ed4:3367 with SMTP id 6a1803df08f44-6dd091b15a1mr58156396d6.19.1734528707038;
        Wed, 18 Dec 2024 05:31:47 -0800 (PST)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd3a9ad7sm48585446d6.130.2024.12.18.05.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 05:31:46 -0800 (PST)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b702c3c021so395323085a.3;
        Wed, 18 Dec 2024 05:31:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJz+D/YkP3nr2ABMNFzFGjS/sjEjGZHP2mwtyQQPkkJcenP4c6Z/LawbRdJXTupJAvpWX6WTRBnjhT20lUnMhB5ZA=@vger.kernel.org, AJvYcCXXwHlxVEepBc6r365ZFcIsVDGzjzXvcF2gCYZZAI+fAvM1vCgxsGaK9NMaHPY11gGvyHx2T6NYKTI=@vger.kernel.org, AJvYcCXvCfXqFsbsgi8zI58Z1ybqXkYROSPDfbGdXtz22NEc0kZgO8D6wVfthlkN1OaBtQZWoIVKj1tS3xBocHDr@vger.kernel.org
X-Received: by 2002:a05:620a:31a4:b0:7b6:6701:7a4a with SMTP id
 af79cd13be357-7b8638be02dmr435077685a.53.1734528706069; Wed, 18 Dec 2024
 05:31:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241218001618.488946-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241218001618.488946-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Dec 2024 14:31:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWNMVGL0WEiPMgnXyvmbWEsDZX18mhQg_H5GUBpKdVp0w@mail.gmail.com>
Message-ID: <CAMuHMdWNMVGL0WEiPMgnXyvmbWEsDZX18mhQg_H5GUBpKdVp0w@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] i2c: riic: Add `riic_bus_barrier()` to check bus availability
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 1:16=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce a new `riic_bus_barrier()` function to verify bus availability
> before initiating an I2C transfer. This function enhances the bus
> arbitration check by ensuring that the SDA and SCL lines are not held low=
,
> in addition to checking the BBSY flag using `readb_poll_timeout()`.
>
> Previously, only the BBSY flag was checked to determine bus availability.
> However, it is possible for the SDA line to remain low even when BBSY =3D=
 0.
> This new implementation performs an additional check on the SDA and SCL
> lines to avoid potential bus contention issues.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Used single register read to check SDA/SCL lines

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

