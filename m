Return-Path: <linux-i2c+bounces-452-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 799277F9181
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 07:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6157B20EAD
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 06:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5323C35;
	Sun, 26 Nov 2023 06:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBk1Z0wx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E7810D;
	Sat, 25 Nov 2023 22:04:02 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-7bae8dd095cso1052421241.3;
        Sat, 25 Nov 2023 22:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700978641; x=1701583441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHH9CY/YqMo7brFyHOai+ndS76FkZ3H1nz6R6LrdAVg=;
        b=YBk1Z0wx/rP7WHtJx/QM0f990StwIRg/XD2OlMzzfE4jKbKMRLWrVG5R7Mxzd5h35d
         96nLzFnU/kMr4stjfM9+DDM6ebkTM0GxZDz6pgPiExK0oBLUzCU4URZiYbqyhKjgUUTC
         sz2Hfo17eg7Ztb02p03HdMOAbXDoKQKddm92X2SNdYGrbj8/y7E+5XjNm9mW6qjU6dnR
         bSUJaLLWFFZe4J14ni0hB9+nQmOOXEah5s9ciZCpJOEHMTioId9tfOlQXaDylIvBjtQH
         D25z6cYLpeMvuo/BbE0fvbZQeXdTHVO5NWTPgZfdFrlqmB/WXrdTEzP1soXHIuHn88ac
         vqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700978641; x=1701583441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHH9CY/YqMo7brFyHOai+ndS76FkZ3H1nz6R6LrdAVg=;
        b=ZCzOBEdxMFDd9sdFIuMfNlnSWqDV4mv/yafW0YY4H1YNFWaqrV/GR/sqCsZbMUQ5M+
         61+MNZrctjAxa9d9yu74dD4fo5Ej5s7+UoGLBfzb5PekroM3D4cTtF7VT8prHf0izh1D
         hfjLOHM68P4iSkgws3XlDL7KHKG9KWMrPZFA6TfIoK7KrwE6JiQUWOWDZWQllPy2LD46
         TxE13FWVPJjV0WojQUU4EZ2lB/aoQ11ah5mhX9kTQFSieSDr1T3haHXeTK20yf4arWos
         MaEZv6JDzbDMTOtDGf0l5a2D5NQMM1mQunIiK6JayacPcac3xPg7c7UQ1EyR020RiOch
         P3Iw==
X-Gm-Message-State: AOJu0YzHixgqSp2EmJUyXnJxwqW49EEVtRoKcCTEGoH6Y4/voyxGJWen
	tCOLU8BU497nJVvAc/TKp8Syz+Cyzd5VYrDOkzM=
X-Google-Smtp-Source: AGHT+IHLRhMJYQeBCOLZWde7GehiGvp2CeeXwmeo/Cb6wVo9SAexhiAS3U+NJNh8FxJY8Qa/fKK61eRtSYxSc9j5ugs=
X-Received: by 2002:a05:6122:16a8:b0:4a4:cd2:5ebe with SMTP id
 40-20020a05612216a800b004a40cd25ebemr2735306vkl.12.1700978641255; Sat, 25 Nov
 2023 22:04:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231124101619.6470-1-hkallweit1@gmail.com> <20231124101619.6470-11-hkallweit1@gmail.com>
In-Reply-To: <20231124101619.6470-11-hkallweit1@gmail.com>
From: jim.cromie@gmail.com
Date: Sat, 25 Nov 2023 23:03:35 -0700
Message-ID: <CAJfuBxw4=Aku32yx3e0zbTCARSo9r1ST71UoaC-Dp3K3_m44jQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] i2c: scx200_acb: Don't let i2c adapters declare
 I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 3:16=E2=80=AFAM Heiner Kallweit <hkallweit1@gmail.c=
om> wrote:
>
> After removal of the legacy eeprom driver the only remaining I2C
> client device driver supporting I2C_CLASS_SPD is jc42. Because this
> driver also supports I2C_CLASS_HWMON, adapters don't have to
> declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
> It's one step towards getting rid of I2C_CLASS_SPD mid-term.
>
> Series was created supported by Coccinelle and its splitpatch.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>

Acked:


> ---
>  drivers/i2c/busses/scx200_acb.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/scx200_acb.c b/drivers/i2c/busses/scx200_=
acb.c
> index 83c1db610..3648382b8 100644
> --- a/drivers/i2c/busses/scx200_acb.c
> +++ b/drivers/i2c/busses/scx200_acb.c
> @@ -427,7 +427,7 @@ static struct scx200_acb_iface *scx200_create_iface(c=
onst char *text,
>         snprintf(adapter->name, sizeof(adapter->name), "%s ACB%d", text, =
index);
>         adapter->owner =3D THIS_MODULE;
>         adapter->algo =3D &scx200_acb_algorithm;
> -       adapter->class =3D I2C_CLASS_HWMON | I2C_CLASS_SPD;
> +       adapter->class =3D I2C_CLASS_HWMON;
>         adapter->dev.parent =3D dev;
>
>         mutex_init(&iface->mutex);
>

