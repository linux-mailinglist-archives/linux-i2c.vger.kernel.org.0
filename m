Return-Path: <linux-i2c+bounces-9032-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17660A0AA09
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2025 15:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B4A6166A07
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2025 14:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475061B85D4;
	Sun, 12 Jan 2025 14:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vitjg6S9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8268629CA;
	Sun, 12 Jan 2025 14:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736692183; cv=none; b=CFz7+wRjpzSVCOjZCkPrISHbFBUH4pIV0kD55/sykQ2TbVJ13xJm1zNznbaInlSuqn0Bm5ZmKP4SAiKLY7vtKktovJYl9cLO8SF7TgEqMnhgHIQsC12bCi4iI3UXa+Du9tNE+r+Cni6Ng7V1wFijrt9dJKWEWaQ7oNfl26v4kI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736692183; c=relaxed/simple;
	bh=iC/NOCIdUS+xwhQkGFNZqrSTfCnnmnnyamInRsjFgFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=m855IV+lAlyC0KfarjlhYJE6eyIs3pxqqFo8QDNi+QgARA54OITCKROscQwSQFPTvBu6Qyu+khfxA5a4Jgb0XEiolDze2vxQdcX1Zd8lyin29Ja83aK7mMBhwPc5cYaFLWchmeF6hDQ3IQ4Xy1cey+HhmAu9225XNb+YQLkf9pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vitjg6S9; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so619745266b.2;
        Sun, 12 Jan 2025 06:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736692180; x=1737296980; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iC/NOCIdUS+xwhQkGFNZqrSTfCnnmnnyamInRsjFgFM=;
        b=Vitjg6S9bhLyIJO4MZBKRmCrt+gSviY0QTdUsmNaStw2R10E1f80y33qDFRKKjx3bm
         oPj8pUB8DmL3XaEJoENfFKSffCqxsBDdFXTGAA6SK1lPIzP1tCyILOCBP07DanraYID+
         WO9/zWJToXw66PHhiDyPqbli9qMwyhbBJ3d9qebHDp4TLv89yEkmbT5pwIlsNN0DgMtR
         vyLA24/DJm3W71gjMX+tCe4tuIzBM4jeLrhDGjUGdO8f58MFKSDd100gP5BxDXJPEcyt
         IJ8RxBb7bKjXBMTAYSLs3TbRZ0vSURwagZpqbzZhKj7lldFALEjbjEkbaqLH2p020b/v
         nEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736692180; x=1737296980;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iC/NOCIdUS+xwhQkGFNZqrSTfCnnmnnyamInRsjFgFM=;
        b=GLZm70HnvAzrbP7f13ksXUVFYBsTezANFaSXCJqWYrWZqlUFT4GTPuyFrWKLr+vHXp
         JFr82mN/IeINqEJzkQbRJ6xSRu30o/luwu7+rH3/RedvZVExWFqOtOoEze/1+LLX2jrT
         zTR0aqtKNtg15vUII4rLgchQTAra61iTbJP+hlBuzQ5PqptpHkR8DZ4LNevFoqckdbYw
         VQjU2dEbEyC4kjiJaUCWsZ9G1EAjNj0yapDXrJglJJw03Vw2K10fJixugOb5XAUxiUT9
         D5oDQfSXWyNcoyATLK7hunQDH9wW0ajNMcl3lSDiskLSQ/0Ae91vX2NZowFKwhKZgJ6a
         hItw==
X-Forwarded-Encrypted: i=1; AJvYcCU/cZdkGIHi1MJAtGMPg/tUjv8GcU0pEcM8HNshc3YaYf/HV7Ha93cQPsjTKOEhC3nIE66Jc7o2tw8=@vger.kernel.org, AJvYcCUNj3l9X763PzOf7Q+DFuPPb0Fd8ZerW8wCz1Ib/uYhFDJOlY+BCLs2UXijHSA8UTTIE1kbW3pJ5wKK6cDD@vger.kernel.org, AJvYcCX4ityIeXHuBN0LNq0RbMv7Cwc+E4jMcW5OdL0haRGLF+/oJbH8S0UntaLrfFqFI9G+T+wwCjYaNXa2O2iNLr8akCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1K3+TeeVQEQTTwq0wIHzUMkpqbPYvHiLmvsWa/KZjjIkcG7YG
	K4Bs86vXW/kl5qOEEbqEidLtEZ1nxLdI2QiKtDjCKKdBkJY33OKm/vnGMJKvkHXe3YggjeT4I2L
	q0l9ronkLWcqqY4HuP9WlkyP6Ej0=
X-Gm-Gg: ASbGncv1cDUuY+3KyVab8oKoYo06lSgivbGq23kpIOTfxLYP8j3UY1R19mZWckitarj
	lYxADMrCEegbygCEKmlH3oavUyADcnz4TvP05Ew==
X-Google-Smtp-Source: AGHT+IETdpkHEpawK5hYERSd2emMcy9NIUNgxNOVlaxEKFjdK2MIZxMJaF6JIYrbnNX3Z1gyicA+VcwjkT5QY+u5wf0=
X-Received: by 2002:a17:906:c153:b0:aa6:8cbc:8d15 with SMTP id
 a640c23a62f3a-ab2ab6a64fcmr1364036066b.14.1736692179778; Sun, 12 Jan 2025
 06:29:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250103091900.428729-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z3-ZsKyZ7aGnpjuQ@shikoro>
In-Reply-To: <Z3-ZsKyZ7aGnpjuQ@shikoro>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 12 Jan 2025 16:29:03 +0200
X-Gm-Features: AbW1kvaJSkkJx7Qa-f3s53zAl2MKCIhQYXZD85NuvAKAo_i1IxYFiEaz6JClcGo
Message-ID: <CAHp75VeVny4ZR87C9MYNoSC3Y-OSyMkTeiGdxMKSVSxfhs64qw@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] i2c: riic: Use predefined macro and simplify clock
 tick calculation
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Prabhakar <prabhakar.csengg@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 11:41=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> > +#include <vdso/time64.h>
>
> Hmmm, what about using 'linux/time.h' instead and relying that it does
> the right thing?

+1.

> Nice cleanup otherwise!

+1.

--=20
With Best Regards,
Andy Shevchenko

