Return-Path: <linux-i2c+bounces-9029-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE45EA0AA00
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2025 15:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B7E27A367D
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2025 14:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C671B81B8;
	Sun, 12 Jan 2025 14:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLPvSN1U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D2D29CA;
	Sun, 12 Jan 2025 14:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736691922; cv=none; b=onK13C1ZcOM4RacPiTCfkzxIfixFarqOlejpqvpXQWWnzARWBhhimcQ106fVGzM3otj+W4r+ZjAXyYOrnbEq8MOEP1KZVbd+s1CQM2Il5UI1rpKwo2Pa6wPV06U9dTfQujHPnZtA7Nb6qDY42jX1FvGuY4gTS0ZnzSTTNE54zWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736691922; c=relaxed/simple;
	bh=dEW/UrPBd5B4wYsB+D0Jq/PZ/e1zbmaic0vzM7BQiOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sIqvXFbnS2xmxJOqMQ6S2zrHd/xrAjqyGWohl3si0vjk5+/0metPZvDGuc9OPowUxzBjcvpf0jG9KTy5co5m++ekx5DvYI5BlIr9gGiKfuQeVvGcTdb/NzTfJkiCI2xTIsBbf+LMbO2EXZIPBamZuZsTy3SQTxgMfBaXZ0ORuWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLPvSN1U; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa68b513abcso622015566b.0;
        Sun, 12 Jan 2025 06:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736691919; x=1737296719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBjVaClL6WFVbusP2/xv1jX9mWhdlAzc6iu2Wxm6VBk=;
        b=DLPvSN1UnudvskcSTWmoveI0QZAmi1VGP7/zqoT2T4dQfr20/RddsiHxcDtYQvRjXT
         ULfYkwoJKeXb1E+xcq+0a7UPNEtRiVNGN8WVfuvB6iUpggg349HBflNWfX4h9hesGITo
         Crf3jGgz1sTJDpF8juGyOhqwGBizodM0TCJ4FxXl2UoyCgFL9ZB4uBjrxdogMwClZKlo
         A8No90zN1nrc14ImsWVhpIJ1PzKwzmVeDLBcoN18yARNKxAW3/hynE0Ghm9+RpVgS7Gm
         IIsKzb7dj45S9Aw0jOJjdW5qUEOTkkcEvlTfxMUu5fXkkuLsC3XFRnD79ZigxT2MDIy1
         2hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736691919; x=1737296719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBjVaClL6WFVbusP2/xv1jX9mWhdlAzc6iu2Wxm6VBk=;
        b=azPgI0kQpeqBkRcqjnZtyJGwXFQQEKWVDTos1hnNFG6QU8Glg35KJHRZxChVUn0ye6
         uduweQb5DBBveRd+Axqz9qnltsXrRIL7zoNWVMGJ8z9sUARPKgPdF/M6DmfJBOs4Ow25
         6qH3CzKykKJxpVNr5KFhoPWqWRQkxT/bXmctX0SfssjQqPgRS+7aOcFxbCRXKE5Piiu0
         MHBl+mi49ZjSQNtPDkM9tCLKyTz16TrRma1wCRNGZa0RrqteTjA+krY0rS8zHjxnBCtp
         uKrVzYw6Z/vClrlX3Em/Z1Sk6oBP2aEFq/W92p10zO94yKKVFKYxCYZZ+r1afLYkzx4t
         v+GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXjxTIGYD54LYlMu069GcxMnSLXt0rjH1KFibUMq1NNiP0mjf+i0sYrl+DTL4EuartqkbzoVEsErAy5sjP@vger.kernel.org, AJvYcCWdJQwl8TTdX4mNpOoBQf1m7aEMkB81zte+8gkI1OOt9xYQwtUKSySsgQ5zue9mLC5X9ks7G9BeLsM=@vger.kernel.org, AJvYcCXGfxi+Fb95hPJnMA6TRoRFkTujTGawv9ub7u5a5f9A0VU1nQffp5VWk/YQ5F+i6tq0LkrIXrCg1YsGQ7iWA8bItvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrYxVTimp7+xD2/bPbUoJpzjjQuairyHMn0ikVA5tFKoDN+VUp
	d6ns/IPZ1jYtQsZZiTvcGYazxmwAo5JDBUj0hpuHGNve6H1vAx/T/oBtUxRpunf+lZQ3njf2WxQ
	giPXRqALrvN+NNBY623/1pGdaCUjEtfCm
X-Gm-Gg: ASbGncttuNZnpqSd/vIexaHkfEIV6M/nXpNigXQuRp1FnjpyMihy2mkLsIMp+vq7zKM
	RMLI+MpJuMhhVwmHvj3vpZ9fhMuFFJf1YF+fg1Q==
X-Google-Smtp-Source: AGHT+IFWuE9OUxANf5rI/jbrrwuOA0ZyyQ5nVQrYq07A3JpUuSnmBZagtgSp1iJ8ZrKv1GWp7QERTFYq9F+WsDwz5oE=
X-Received: by 2002:a17:907:7e81:b0:aac:4324:977e with SMTP id
 a640c23a62f3a-ab2ab73b67dmr1412130566b.27.1736691919183; Sun, 12 Jan 2025
 06:25:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250103091900.428729-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250103091900.428729-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 12 Jan 2025 16:24:43 +0200
X-Gm-Features: AbW1kvZkxM5hLy7H5F77RdIe_rWnniWx81cp4Vl8ae6o2Q4qNcP8N0dLxrYzM8o
Message-ID: <CAHp75Vff+S6Cx4VqJ_TEGvbQNN_ZTV15fK-+B8A82qR9LsTEZw@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] i2c: riic: Use BIT macro consistently
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 11:19=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Easier to read and ensures proper types.

ensure

...

>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>

> +#include <vdso/bits.h>

Please, don't include vdso/* directly in the code that has no
relations with VDSO.
Use linux/bits.h.

--=20
With Best Regards,
Andy Shevchenko

