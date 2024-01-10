Return-Path: <linux-i2c+bounces-1251-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBDD829552
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 09:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C511B24113
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 08:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578D937149;
	Wed, 10 Jan 2024 08:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeRlS2K7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCB833CFD;
	Wed, 10 Jan 2024 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5542a7f1f3cso4470780a12.2;
        Wed, 10 Jan 2024 00:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704876230; x=1705481030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBqz+NKkAhcga/7KbDtJF7MTdjSbEbQnaZUr3GeRp3U=;
        b=CeRlS2K73BZ0jiyfJrcSerCsePBTyIHLp0H4SIPv3t0uJxqKsGuZ9vvx8nq0oXovs6
         HMK7XGcZKns/hTbuP7YxldMSggFbtirGJ5O/jApBW2XjVMDtJvbilGsgPsscdyHf224O
         WLYTlQmq8cHFppBRoH+Y0WDB+6bE96qtS3Q29bt+51CFlAfQCov2RC+jdsRrr2Y3L+4O
         ep2+C1/2P58Gd5kvZjtvU0irueC2FGJesEYjwRWnm4JCSMH8zx26q5XZxKy/cvne+AO2
         KvtsxlpliQsHB+MzXDT92hRYzgxmb/3/K8EdeGYOHuJRQoIJHPpYWzSEvT8bR4oPCbu1
         kktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704876230; x=1705481030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBqz+NKkAhcga/7KbDtJF7MTdjSbEbQnaZUr3GeRp3U=;
        b=X1AT9lvB6QH5BaZ/KSQIyoJdFunQfGm8W58tPHUrs/CU8AbBo4r/elET1MfDXCbms3
         UZl4j7V1b3dERAW9atQfZRNrl78Yp2KwltFX9Q0/swxoWwEKq4uSzr5tlvEuIFZL8OSe
         rPk2jVmZmsIfOr4jXMhkd6755jCt7O7zC6L2kiI5EZVEHEtvUtf62dRjkB7rpX+XjuOD
         c6GL+kazhGYEpLJR8TyY96DI8sYb6r2QUgogXSHqAsTMiHkVlJie/ZJ597xcP9NW3mY7
         6JhWeBLeQvWT/XlXh8ANr8WwRZx52mjugzCtiBYHyvPZ5gBzfFT8QBD/FF0gBxqM+kcD
         FPpw==
X-Gm-Message-State: AOJu0YymHhJQtpWp+1cmmnVyamF8WV4MYd1seyxxdkcliQtGMujzLIPD
	C9xEVvqoxdF+dpBF1FxN67+axy3T7R+h56X+eQxLUydIL08=
X-Google-Smtp-Source: AGHT+IHa/PFtRzn+HpK1gr7bBYK+GoY2so+241U3ZxtOU8InhDxiYMj+taDmyfj/73a7cxq+54y7jqF4GNUm8x5fFJs=
X-Received: by 2002:a17:906:3e08:b0:a2a:2498:93c5 with SMTP id
 k8-20020a1709063e0800b00a2a249893c5mr424762eji.73.1704876229573; Wed, 10 Jan
 2024 00:43:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109145121.8850-1-rand.sec96@gmail.com>
In-Reply-To: <20240109145121.8850-1-rand.sec96@gmail.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Wed, 10 Jan 2024 10:43:38 +0200
Message-ID: <CAHb3i=ttHrFw7NuL3qw1xdXDkGu9tOQdH+WuCMWgukmU6QrTKA@mail.gmail.com>
Subject: Re: [PATCH] i2c: Fix NULL pointer dereference in npcm_i2c_reg_slave
To: Rand Deeb <rand.sec96@gmail.com>
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	deeb.rand@confident.ru, lvc-project@linuxtesting.org, 
	voskresenski.stanislav@confident.ru
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 4:52=E2=80=AFPM Rand Deeb <rand.sec96@gmail.com> wro=
te:
>
> In the npcm_i2c_reg_slave function, a potential NULL pointer dereference
> issue occurs when 'client' is NULL. This patch adds a proper NULL check f=
or
> 'client' at the beginning of the function to prevent undefined behavior.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Rand Deeb <rand.sec96@gmail.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index c1b679737240..cfabfb50211d 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -1243,13 +1243,14 @@ static irqreturn_t npcm_i2c_int_slave_handler(str=
uct npcm_i2c *bus)
>  static int npcm_i2c_reg_slave(struct i2c_client *client)
>  {
>         unsigned long lock_flags;
> -       struct npcm_i2c *bus =3D i2c_get_adapdata(client->adapter);
> -
> -       bus->slave =3D client;
> +       struct npcm_i2c *bus;
>
> -       if (!bus->slave)
> +       if (!client)
>                 return -EINVAL;
>
> +       bus =3D i2c_get_adapdata(client->adapter);
> +       bus->slave =3D client;
> +
>         if (client->flags & I2C_CLIENT_TEN)
>                 return -EAFNOSUPPORT;
>
> --
> 2.34.1
>


Thanks for the patch!

Reviewed-by:tali.perry1@gmail.com

