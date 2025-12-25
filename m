Return-Path: <linux-i2c+bounces-14776-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B780CDE2B9
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 00:38:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5F323007941
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Dec 2025 23:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EA62BEFFA;
	Thu, 25 Dec 2025 23:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="d7jQvPVi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF13246BC6
	for <linux-i2c@vger.kernel.org>; Thu, 25 Dec 2025 23:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766705916; cv=none; b=rGlVbAW9INK79C1/y/DitMXqIieyh6gdoRf5yv4zrUSUFj3pco+mXzxmPiSgo5+vpCBYDpRB5cDHQfQDgHoRULtgWPAWBkOCpJg9P3MJl1l5ltKPvts9YbVpTXqE3kJyet0LkCG0Zn2tIR+dKccVMPSewK42STn4oBxUR8A8Ptk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766705916; c=relaxed/simple;
	bh=6zP0IiflYyQSASWEEFsBwCauqhKF6QYxOO+2s05ZiBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RDVU3G2c7uW0Rso0/ZixL95o1xRmE2JVwIoq9/gxhs9PpPdRkoFFWvG2/ttfr3ZSB7PGzj2KfAFyhIr++mlJFyi6/A4F+b2qH0YVUvrwKt7roI9v66iUm7IGiIVANJVJQKN1Wqx9dFsH/CjWlbsc5hhmvkxwBHw7+pEyobGE1Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=d7jQvPVi; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6467c5acb7dso3235887d50.1
        for <linux-i2c@vger.kernel.org>; Thu, 25 Dec 2025 15:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766705913; x=1767310713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtwWuXybhT2W9TxRXdZy0Vcd5dnmb9iqNRTDjEbh5tI=;
        b=d7jQvPViQQ40LzJNkFoZ4e2lQ4iDbbccroeE1jFGYzptCJMrJvoySZrRs3KBulXs+B
         weCfmF924Id6/KC/GRy5R6wc3HMJz87Kv8OSiZQJiZyd9QOMDHBxwk4CvhAf4HKGK5aN
         kCrYEZOxv3V9x0mKOXsO33ezB/d44xTRu/6L6AvDzlWkItboizTkGQRh97pgLk7nOFCw
         CdkGXaGW1yD8HsZuVlJ2WLKu9QnhAmSQFasmauttTGy1L9wOconApV0h5c48tZNspMrC
         xomgg4BQO9Ckc5tnUIf2Xr/EJKPF7RHTgL3g8TEIg7DlI8lLDWz/rSww1o1ZhRWO0WBC
         /yEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766705913; x=1767310713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZtwWuXybhT2W9TxRXdZy0Vcd5dnmb9iqNRTDjEbh5tI=;
        b=Gcd7V1WoOersg0txzzbptm76yWkxUjSbYRmaKUnFTx/omQe9EFGMvYpBAKoi4CFcvD
         PaHAQPPUT8GtJhC+GFatoN6pq+Z54q5nZoZzdnhin2sm15h3VX8RgD7kqom/k0EWID/d
         WN8GNRzZ5sbU6o5oJmS/UdYZyzhVRm33xbM5Bvfe/Ud5hU50WchobGaTuee3l6YpWrxA
         KfiXsuQFdvqw6WC0SWItEBoSGXKQ9SjgTEbLBcoEmnn/LTCECHMhkyGoSqqxDgTaYojM
         Ic0pXRasNsiAUCVekKAOW29sZnJS978E1hxQ1T8cg84QloyAISO2vk/PqJqp5qya1sne
         UtgA==
X-Forwarded-Encrypted: i=1; AJvYcCVz3/g+urPajTGTTyUerjnh/O9FdN6Q4JXupM5RV1tW91wv83euieCbxwvG/1fk4MAWkW+3vrGJ+UI=@vger.kernel.org
X-Gm-Message-State: AOJu0YziDfCfGWJ50TYZUZVvIRhydmi6d6JCE0+/Fxmm/F8d77eGYJt+
	qU1djLyxgItIlb57TYYlGlCWphUedhEAtq2UJeK8qAJS4G2y9usi5J1vrcQeTh+BmppgDsgkzhZ
	+Zpi+IWSCBhzJqY8KOWJUQgD9W09UyH4joOvOP78C3Q==
X-Gm-Gg: AY/fxX6I4UdWhBXK48gYCaR9lUKYUumvhCxXq39XzHPR1vFpYti9rLJBE+gd2CGFUf1
	WVpeK2lDj6xNYEYLyLWTvvpMUkpFuIaGskEE+7KEglxaeMsEkoqXiJy/VL9cLj7o6xOPTWRyLnq
	45tlThFFPVPhWaoDaao3Q12MXrd/PLBRixrAebEWmRSOjdYmHNnla77yImf0ZdsinPb2sTuR04h
	P8B0K/V+FWvGgci1jVklNoG16sznxT0WQjdnD/immg1dIbxCzPm/zxJo9f5cmWhoGzqImtUnoJd
	nBa65uBktJSOnuORxLju+xvAGH57gbjFfFm36YlQ
X-Google-Smtp-Source: AGHT+IEqsYbbjwXLehn9TCJIOLfPJOIm/LDNAeoiYZx4u6S31/Kpcix2Mq3YrFQJu4uTOl2wq4xpYsyoxIEJ6tMxyHM=
X-Received: by 2002:a05:690e:1517:b0:645:5811:fb30 with SMTP id
 956f58d0204a3-6466a843f55mr16899140d50.11.1766705913510; Thu, 25 Dec 2025
 15:38:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com> <2dmrli7yzznpurg74wet4oidhljjf3csdjly2dwpyvyndhrec3@uc6ke7mep6fv>
In-Reply-To: <2dmrli7yzznpurg74wet4oidhljjf3csdjly2dwpyvyndhrec3@uc6ke7mep6fv>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 26 Dec 2025 07:38:22 +0800
X-Gm-Features: AQt7F2psMc2LHbqeHhwPYOjN4t7xqZys30Ti3iWo_ZH1lUjqY_uTazP9ZogzLZM
Message-ID: <CAH1PCMbGbe6MQtAucf-4W+H_G0LrvPNGyaB_OUyxqf5TF=jixg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] i2c: k1: add reset support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Encrow Thorne <jyc0019@gmail.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@gentoo.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Andi

On Fri, Dec 26, 2025 at 5:01=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Encrow,
>
> ...
>
> > +     rst =3D devm_reset_control_get_optional_exclusive_deasserted(dev,=
 NULL);
> > +     if (IS_ERR(rst))
> > +             return dev_err_probe(dev, PTR_ERR(rst),
> > +                                  "failed to acquire deasserted reset\=
n");
>
> If this is optional, why are we returning with error?
>

According to include/linux/reset.h, if the requested reset is not
specified in the device tree, this function returns NULL instead of
an error. Therefore, IS_ERR(rst) will only be true for actual
errors (e.g probe deferral).

BR,
Guodong

> Thanks,
> Andi

