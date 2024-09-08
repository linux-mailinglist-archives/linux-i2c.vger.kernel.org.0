Return-Path: <linux-i2c+bounces-6356-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AEA9706BE
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 12:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29311281E82
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 10:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9971D1509AB;
	Sun,  8 Sep 2024 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jV/z2/7t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E034B5AE;
	Sun,  8 Sep 2024 10:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725792641; cv=none; b=j1ZFH4TZ30I4+T6bEqVjm6uBhyLbqnqK+G0zcZ4pNzq2WcyZAlvu5tYZf70ZZJ/yE2SZMDs681syNWd7tKkwmmjrOPuQPrwRSkbalu7tifkEslG3z24m+700KJtV0lyqLCSGotPCSxgF8SZ7V73r3T0vqZyu8wV4uRAyzxqdp0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725792641; c=relaxed/simple;
	bh=XTEKknxXzDedLq8V/KCwXhmxrkjWHhIY8sXQoZD4sqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qny92cgFpzRKAZ58AaSpa9qB2x6E6tnJNRNQY80S7JwAsKdXc0qpZnzaQCrQCx8ppNfb/D6GjEKqFkqsxohBoHFa6IW3FLJnMAJyLX2mUDcacfXk0MJv9HL5WM3aaFeNInIzkLthZNG9qQd6lSiCNzqWNH+uFloDOQm9N/Qy1Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jV/z2/7t; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c3c34e3c39so5035751a12.2;
        Sun, 08 Sep 2024 03:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725792638; x=1726397438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8UC9BcNKMNBnj+FF0WoUDB/hfX7jIiecCwc+cDfBDY=;
        b=jV/z2/7tbzwXTzWVmS1RgrZmvj6fLasXLRPmXuRhDlY3l+5kBwAHAlpNlBSKStdr7y
         F32RRPl/0jt0QcVzo271nDONH0kIGsBSK6pzK5OEoUvs8D39VFqs7n/Ogm0LLo1OKGSb
         GuGDUygmrKsqtIIq3916w4RVKHLaflWg1U5oWDuVydsxlcZb35CER9lx1p/gr5Y/+npX
         RfGdxPa7adpj79T/ei79ECGTMdh/7xuTvnaz3cpyTzVrCPHrtYkvYSPJa92sg90Z6jGl
         XjyQuqOX2FPyU9jRQwNSx1dgqhywI5ksb+mfcou/ACVlWiMqWDOWxadCJo42boTyTSI5
         oYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725792638; x=1726397438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8UC9BcNKMNBnj+FF0WoUDB/hfX7jIiecCwc+cDfBDY=;
        b=RNdW1nIJ2PSOp7gv9FELMyLfUHVjFAJaIBB54NL7aPAME37L6rZ/OiqD0eWFTMk+2e
         AaGUVm57VOmjGhVRIs+fZbh9jV8W/jtZv0hlHP8DpNPGfCucKgUpDUkc441r+3Jyimx8
         T1mfOMKVzTlAePp6Lx7ahcffPeTdlki7sjvLuxD3qzyX0hZ/O4HWkqxrGEEJcXF0ygw0
         IZFB7E8sKoX08kdXMh7NlNCv79baT/cSVAxiEwXZ8kV/UlRcWnR8rPN6cezNL3QuJZNE
         f81n57BrLCZYs8Pn/BxFvEjYpPGPcOVUEdOItN50JaN2mheQHsRgSYvHZPsFwt4zDy0V
         Q0lw==
X-Forwarded-Encrypted: i=1; AJvYcCXBb4yVg2VBAwhMSzhFtjYiGqkxQxY0xgXDBW8T3m+LFjZ/CGcuSM9fgpzQJR02J58R+/dr0ybsPZSCIJWk@vger.kernel.org, AJvYcCXWrcg4SmfbeJIqEgeVdxklii8Ul2pBOricPDkqPhGRD8sj5OdfhSr/0geO26HPZwO3SUysVjr3x/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmI9NDUJ7jEn3p1gOjF2ygAxzYLnUH8qr83mS9ZqRj1qXDj2iR
	SZx0vsjHgjMHDUok2qJqslhe0chMApPDXNi+uwroCJ/NMaPEL9Ln5HmqVogKmR4XfRoAbjzohb+
	ZQokJQ6aJlSskiRCQ127/Aejpehc=
X-Google-Smtp-Source: AGHT+IHjNDzrG+Hu8Kq74TDaYMI626cC24Kdi6p4FMuvK+r3YMdG+pdfZ2q+Ju+rX5OhSWYBrVs/4g1tic81Vld1G6U=
X-Received: by 2002:a05:6402:5309:b0:5c2:4404:a193 with SMTP id
 4fb4d7f45d1cf-5c3dc7c5012mr4781758a12.34.1725792637172; Sun, 08 Sep 2024
 03:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-8-kfting@nuvoton.com>
In-Reply-To: <20240830034640.7049-8-kfting@nuvoton.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Sun, 8 Sep 2024 13:50:26 +0300
Message-ID: <CAHb3i=txqvDpNXSRkke3SXZKCUAnapODGczO+GCJkQOKpgcTCA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] i2c: npcm: Enable slave in eob interrupt
To: Tyrone Ting <warp5tw@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, andi.shyti@kernel.org, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Charles Boyer <Charles.Boyer@fii-usa.com>, Vivekanand Veeracholan <vveerach@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Tali Perry <tali.perry1@gmail.com>

On Fri, Aug 30, 2024 at 6:49=E2=80=AFAM Tyrone Ting <warp5tw@gmail.com> wro=
te:
>
> From: Charles Boyer <Charles.Boyer@fii-usa.com>
>
> Nuvoton slave enable was in user space API call master_xfer, so it is
> subject to delays from the OS scheduler. If the BMC is not enabled for
> slave mode in time for master to send response, then it will NAK the
> address match. Then the PLDM request timeout occurs.
>
> If the slave enable is moved to the EOB interrupt service routine, then
> the BMC can be ready in slave mode by the time it needs to receive a
> response.
>
> Signed-off-by: Charles Boyer <Charles.Boyer@fii-usa.com>
> Signed-off-by: Vivekanand Veeracholan <vveerach@google.com>
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index cac4ea0b69b8..5bdc1b5895ac 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -1781,6 +1781,12 @@ static int npcm_i2c_int_master_handler(struct npcm=
_i2c *bus)
>             (FIELD_GET(NPCM_I2CCST3_EO_BUSY,
>                        ioread8(bus->reg + NPCM_I2CCST3)))) {
>                 npcm_i2c_irq_handle_eob(bus);
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +               /* reenable slave if it was enabled */
> +               if (bus->slave)
> +                       iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR=
_SAEN,
> +                                bus->reg + NPCM_I2CADDR1);
> +#endif
>                 return 0;
>         }
>
> --
> 2.34.1
>

