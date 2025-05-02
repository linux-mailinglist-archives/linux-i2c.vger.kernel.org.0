Return-Path: <linux-i2c+bounces-10729-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CECABAA6C36
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 10:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1DB53BC131
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 08:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FB32676E6;
	Fri,  2 May 2025 08:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cN/XaZgW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9C31A239E;
	Fri,  2 May 2025 08:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746173088; cv=none; b=lb/eH/jpvg3w6o+f/dANy2OKIm4FhGQY/xrZxEK24Bh70nVdCX2VXE6yZUj8wwHvgddkBAyLQ1fNKXcUh8y2KygoaFPdqFROvbUom8ezXjHSDt92Fqu/OzIWHdcvbyio0EVre2YOOf5dVJXLoHNas4xlmduOly3XRdX7oaZ/a8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746173088; c=relaxed/simple;
	bh=lpFYu7EcDLoKz0qYfMmHW8QQH2ESF/DMhc3myvypuo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4pB5q0BubMgVl+B9UQ0YGvcQBNnxeodsIq/VFOCs9gux7ucOyLQSxuRotsKXB5RTba9wYDJ+M3aZQyK2jN5tJbvAhdynT0HoMIYX4P4KcWw+h5aqmZCRNt2DQ6AxkOfuZLxelvsBZQ4VwYZTIWH/MhG4rgDnmANR1r9TYrrUsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cN/XaZgW; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1673962f8f.1;
        Fri, 02 May 2025 01:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746173084; x=1746777884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpFYu7EcDLoKz0qYfMmHW8QQH2ESF/DMhc3myvypuo8=;
        b=cN/XaZgWZapqgr0KH1LsHvblrbDl8iQ1RwkDoD/2sX4Vl0msqUjkBtckdow/fF4T+q
         fAlsjbxHUHCdBsjZIOaUjjA4LYq2baUJqlkmMldTYFeV/dqTgswZfGEUNhoph4gpgUfi
         5nzW2tC124v9nEnQebkWEJB+7ETrVIEZLuFygGtqJoLK0ZnwmuB+w1EEuk45ELZpwukS
         W/3swyBwjtUyTTOwO8G2W9/1toFKr3KAwFj+aS2hM9UzuawB/5pNUELTbm+jFAhfPyAS
         uhh+qxNSB0yyqb27vFy1rSP1xpEXnCAqiTntuUfJElvdWm6Zjts0vRy64GHLZylHVwEy
         AXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746173084; x=1746777884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpFYu7EcDLoKz0qYfMmHW8QQH2ESF/DMhc3myvypuo8=;
        b=WfwXc+ggCcg6HJ4el27BAyEkmiGIXjpuMU/qFbNVWRnQOzlmdBJRWcUUbYA/4orX+J
         1lLUaZx080aHxnupYnes+UhFGi/wrQejXoVjxnhUVUCliYJISw/HWrwji6WwtPR37yZ2
         LUkOGgTh/XjbIGYrGRaunbQ8FFCxgN4UUKbl1HvA1FcuB4JiwGSgtnLW+vMQZS3d+b0T
         b1n/DdZKIG+ZJO5lYX56zjJdsM0k08Jja8PsbndH7FhpJbyEWvuAXwdIzQt8xNBC7OV+
         6vlHLvciNeE96H2X4qqMRfSkhji5pENUydLkAV4AnzH0gynuti2F2s3gk3JKcOgBFVrc
         B93Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6XtGflFW3Ec4TF1x2CoDNNj34fmTb/I66eWa4LJ8mGnNQQKBJcwfGSAIC4XHu+cqZ2W7ef+7CDYo=@vger.kernel.org, AJvYcCWzsvhfuvHl39stj/s4ZXjvinV0p/oDNd6IU3NCG+mPQkrZghMESTIxRqtWHr6IDTH4G55I+JocMzFPjfORf87knz4=@vger.kernel.org, AJvYcCXwvtPR4c1csC5+bnMuJHksc6H3cR34w20gKEDfUtWhaK/0KYz4tof4ZznxpSdiIel+p57GqlKFbyueewKn@vger.kernel.org
X-Gm-Message-State: AOJu0YzFTZXqjWgiMATu/x5QqqTxu/2fQOL0Q9T+E7IGZ/QcsM4x/+YJ
	+B+38O39XpQ/jYiiFUze5q8K8tD40h4IFucZF4bZ1EopUJ6t4yMsuNEk3vijEkHuGJxedqOsEHb
	jGlyqCKVuQy7Ja0bdxi3OtHiK7kE=
X-Gm-Gg: ASbGncvlmz0bgcSSxM9ggRY0HvAM6HAFqcm5/N3Xj039S+3KwyNwS1tbHk20n2tUAdg
	BVZ2assO1Q898xqlBvORkBU/vTZJ45a/7vM0kEPz11dUNOJ+OMyjIfnaVaREJnNCgIzxiLo0sT7
	XRaAtzzl52/Q1+IBVbpmRO848=
X-Google-Smtp-Source: AGHT+IHr2IhG6YD236IIPh74F3zA2fk0M1SGYv6Q9ytCaIbxSKQI/seMnkMYbdORGJhuLgiPX7q768hIKAA81Ped+G0=
X-Received: by 2002:a05:6000:240c:b0:3a0:8a19:db31 with SMTP id
 ffacd0b85a97d-3a094034de9mr4142802f8f.9.1746173083977; Fri, 02 May 2025
 01:04:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501204003.141134-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <24rt2nozt3gk26vctj6zx2rgvoteus7lpzboysifbndhmcjzwn@6szzps23svdw>
In-Reply-To: <24rt2nozt3gk26vctj6zx2rgvoteus7lpzboysifbndhmcjzwn@6szzps23svdw>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 2 May 2025 09:04:18 +0100
X-Gm-Features: ATxdqUHSpJnUjBOW0KVTVCyxTEZrwfTdCU5SjEskSWT927WSZ1jUaaU8C_VvQB0
Message-ID: <CA+V-a8s2b+Epjhn_9z1zREY6ohraF142+b8jtEthD-34fRy84A@mail.gmail.com>
Subject: Re: [PATCH v10] i2c: riic: Implement bus recovery
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andy Shevchenko <andy@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Thu, May 1, 2025 at 10:19=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Lad,
>
> On Thu, May 01, 2025 at 09:40:03PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Implement I2C bus recovery support for the RIIC controller by making us=
e
> > of software-controlled SCL and SDA line manipulation. The controller al=
lows
> > forcing SCL and SDA levels through control bits, which enables generati=
on
> > of manual clock pulses and a stop condition to free a stuck bus.
> >
> > This implementation wires up the bus recovery mechanism using
> > i2c_generic_scl_recovery and provides get/set operations for SCL and SD=
A.
> >
> > This allows the RIIC driver to recover from bus hang scenarios where SD=
A
> > is held low by a slave.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>
> I'm happy to see this patch in. Thanks Wolfram for your tests and
> reviews.
>
> Merged to i2c/i2c-host.
>
Thank you.

Cheers,
Prabhakar

