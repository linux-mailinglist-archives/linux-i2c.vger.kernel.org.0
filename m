Return-Path: <linux-i2c+bounces-3743-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F9F8D758F
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jun 2024 15:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C35181F22240
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jun 2024 13:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE4A3B78D;
	Sun,  2 Jun 2024 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHCcJoWI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140533A29C;
	Sun,  2 Jun 2024 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717333644; cv=none; b=BFBz9tL8nq4rS41vQZL3e1pAfBKsHo7r/krCp93BBZpJke4OzHZEKWg1tPMOO0psmKTBzek98BiGOxaF6mOmv10O4nXPqEG7gZPrCaCZ5sWMdmNUDrcCcblMRg8b2u6tf10/JZP79qPjLT4e4HIOX45mW0LkRY0MnLIO22vTs/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717333644; c=relaxed/simple;
	bh=Cgksc72eAMMIcTvh3wyCdxIKeFLm1F+kDhJGe5dZzak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tYCk/wloZLMUkhi7VkRPGZ/4jtIvxohm5A2rqGL2yRmdfX0zxqPwo7uHOzCakqInxagyLkR6QDrHOWKzuyg1SbZefuNPejt9ObIXzvUxs4lOuva03qt3w91DomuTpbeRTB5pYCOHYl14HUJ/irLtfQ25oydsbHVhKAInQF9clvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHCcJoWI; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57a20c600a7so3785522a12.3;
        Sun, 02 Jun 2024 06:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717333641; x=1717938441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZQ5HXBwQ88FT7B7s1/v7gqMjd/4lRJq+5TYb9UVsi8=;
        b=bHCcJoWIQGc5cMaHa9ox37gs39YoL4QP3TcDllEmACHJUgrRhcqfF0CQvbJF/YklR2
         frCgUE7YXTfPMcaeh3JD7pLrt2lor8iutHZoWUOgSzl0diHHzuxaWOgJKVkwCsTui86E
         hGB1tiiVuo/VOet1KtpOrMSYHBFLKHqucrgDI7bYPjo2gVxg2j+DOdBCeUCR4S4M98I4
         HIp/jFdj8nrrIQv3T0smffoHYuVcWlWeYAkllG/kGVRZNdvFPlGNcQ4NcQINp7V/Ktir
         vd/8q168TK3T6QJGHy8Y2zYmtBmHW4JS7DbIWtrhPFNxckK+QiYSn1obMcG9nFipGL8z
         mYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717333641; x=1717938441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZQ5HXBwQ88FT7B7s1/v7gqMjd/4lRJq+5TYb9UVsi8=;
        b=frbVTMhVwg8SmWAohU6kwsy/36lZRVHJL1vyN3AaLSgcQkLDfaHC1IVlriX2n1TGQb
         3rE0Ow8FLHSfNrGeRXMDZ/htkRKzezjbpWhvZI9XcgQ0HAGHdDMq2373cVlH30imoq88
         w6PukgpS9JKGBmzn52WUs0+pq/e9b5RrXtUx6z9hzLvvh15Rl+3SL27zJpccx3VEvJqm
         vHeSQ8G/180ODRr/VmBpEGtD9tlh72cCGaPeyaG/ggjvukWkovDEC6R5/FRmN224/BrE
         08heT9eYgqEawLabarhMLU/1IuuYAVqLyanNSd0vLcRQ3o0enkZMISg+RvEXLRS7TVFU
         gtdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKWmKPnvZ1MC6Ij31TZP96CRuD6N7koYjb59x+CfPmEiAvumne8LqVqQmUCXbw6rjJhCGXmQAp+XmZCMhKGu4fLhfQB45QgCx0Pp61uP601zbTZF6w8PUYLLLW+hKonrwdl7ydu3Gah0LhmwG60CNTa9TFt9lvcQN4U8O2FxSD
X-Gm-Message-State: AOJu0YyWOxjeQzF0ZpGMAJLfx7gaS34kDogiDjxsVoxSxShkRW98x98m
	L7sCkVQ0DR9YLmzFB9y8wx84U2LyQrlX7a6btZs3lbRSo8K7h1CWmdne2MRWRyKbWEjn4P4He3x
	16OFngb7QvScXVXvFHkxoK0pbWHo=
X-Google-Smtp-Source: AGHT+IGKQNEUlUoT4M7yQQXU1HHxklUwAPHbBIEteybFFusX4q7/PREa8DEMOkDcDd6Jpmxx7OIdwdHQNYu7dlIl9xw=
X-Received: by 2002:a50:aa93:0:b0:57a:2537:a730 with SMTP id
 4fb4d7f45d1cf-57a36382342mr4828360a12.4.1717333641105; Sun, 02 Jun 2024
 06:07:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240520153932.116731-1-grygorii.tertychnyi@leica-geosystems.com>
In-Reply-To: <20240520153932.116731-1-grygorii.tertychnyi@leica-geosystems.com>
From: grygorii tertychnyi <grembeter@gmail.com>
Date: Sun, 2 Jun 2024 15:07:11 +0200
Message-ID: <CAGFuAux2BRy8SS=OqU=e4vryTnNLm0oKD6OCbEecy4ZoPO1yqA@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: ocores: set IACK bit after core is enabled
To: Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>, 
	bsp-development.geo@leica-geosystems.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

just a gentle ping...  Is there anything missing?

regards

On Mon, May 20, 2024 at 5:40=E2=80=AFPM Grygorii Tertychnyi <grembeter@gmai=
l.com> wrote:
>
> Setting IACK bit when core is disabled does not clear the "Interrupt Flag=
"
> bit in the status register, and the interrupt remains pending.
>
> Sometimes it causes failure for the very first message transfer, that is
> usually a device probe.
>
> Hence, set IACK bit after core is enabled to clear pending interrupt.
>
> Fixes: 18f98b1e3147 ("[PATCH] i2c: New bus driver for the OpenCores I2C c=
ontroller")
> Signed-off-by: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.=
com>
> Acked-by: Peter Korsgaard <peter@korsgaard.com>
> Cc: stable@vger.kernel.org
> ---
> V1 -> V2: Added "Acked-by:", "Fixes:" and "Cc:" tags
>
>  drivers/i2c/busses/i2c-ocores.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-oco=
res.c
> index e106af83cef4..350ccfbe8634 100644
> --- a/drivers/i2c/busses/i2c-ocores.c
> +++ b/drivers/i2c/busses/i2c-ocores.c
> @@ -442,8 +442,8 @@ static int ocores_init(struct device *dev, struct oco=
res_i2c *i2c)
>         oc_setreg(i2c, OCI2C_PREHIGH, prescale >> 8);
>
>         /* Init the device */
> -       oc_setreg(i2c, OCI2C_CMD, OCI2C_CMD_IACK);
>         oc_setreg(i2c, OCI2C_CONTROL, ctrl | OCI2C_CTRL_EN);
> +       oc_setreg(i2c, OCI2C_CMD, OCI2C_CMD_IACK);
>
>         return 0;
>  }
> --
> 2.43.0
>

