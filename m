Return-Path: <linux-i2c+bounces-10449-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC29A9141D
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 08:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE3D31905C49
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 06:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184901F873B;
	Thu, 17 Apr 2025 06:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTRcxvr2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D01E3208;
	Thu, 17 Apr 2025 06:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744871683; cv=none; b=OugaM39KTdz369HcDnEmK7eTDYSsSacGhVUofSKZWI9Lb/NpaelVaX4+dPkOiQaQ5EUE/jL2UceAiATKVMkWiq/AijURLXXvnDBdStSXmDZZEfkhO3lChjCEU0e9sJ+xUTNAqXkrqULivVY49RWeXBAz4AsbQGAUVMKjKVKasu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744871683; c=relaxed/simple;
	bh=VbjRr/Jft/Twem3Xcaq9JpF8u/T3o8QiM7CQBIL5NvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bzspp66B+1N795uZqfharn9h7cKK4vrw6wciZ0xfIxWtutYKBAEdZMPWOyPDZHtQAxPwTVklXW0QCaIJYuw4e6xEBTR7W4cqD2Q0T707AA2wgh53yWAadxuv2CvqwEeYUmQXkh9uhTFO4aVuP4Mt7HxZM3MpKn44GHKKWezltWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTRcxvr2; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-476f4e9cf92so2902811cf.3;
        Wed, 16 Apr 2025 23:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744871681; x=1745476481; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djrKksg0US7wjpYKbjxhKXGkwEFNIq44MXbCORg+NoM=;
        b=cTRcxvr27+XeFGtOlCZpqEUiGIwDfrmMJQJegMcaJVUQqgnylrA65AZW9Kd9RnfFqa
         rOv5Ru05NtEtkNh0VWYKGd5fzrgA9Qz0ZxYN7dQBHJkHihGKXwcwAYgwxzP1IT7J2M51
         bZIrubMhYcOx8XehelNZrHlJ7D+CJMvNzTksoE1dVNSWBGZusCXzDQvj0r9cmQ08fzfy
         fsU7yyeJkWJmdHKNEbNBaFtlb0o2Wahf2nE0YZ3rBUuxs1Pn0holPzyirWIeOScOGUW/
         MSd4Z1bYmKdfc80CKG0v8hvIr6fK22sa5/8etcPFaeMY1mkx/XHhy2w9ZUjgMNK2NOiV
         nlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744871681; x=1745476481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djrKksg0US7wjpYKbjxhKXGkwEFNIq44MXbCORg+NoM=;
        b=HTS/Xetr0hihz+HHfPJrJLNBXM2L5q04rwrfMnS9FmrLVZsjlt1G6+lSp5RgPTQK2u
         Nc6rWIocnef+w2cgw0zseRWYjVmV0EbEzWBjcopwWoszzBn1l3qKSdkVFnXCzpYU7PxO
         /4ytj8IXvy1bsK/msRpaZ9NEd7/UwLFcE6XIjqG11c3LckQbYThUyzGE7rc3rkIGilU8
         ZZxm6VfDJCKD2FYJtIdVTiA9Y3fqNREttpeiYVavGQAH5k7bJEmoSOncCkpPV7GH78oo
         G21+2QEJf0b1+XOdWpZwhNSSgHFpmimf30I0JdoBP+cU05eP8EH8WBoV7DhUwLhF30RV
         L+7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhONewchUl8UWqT3A7Qcn5iHcGx57JYAn5jkwbNELgR9bEOXaAczdCFQaw5u+4LY07yWIdUAviZzKu@vger.kernel.org, AJvYcCVAiOlh+j7iaLpi7wrltBK+G5wXcF1joZs5MYHa7P7Bmx3wlKzVi/9NU4tvS66992sHaMHT8A83jgHv@vger.kernel.org, AJvYcCVIQJsZs5IqDCGOCkBorgxgB2PHPLNjLoAjdx5+uKOgnGE73q5d1ZM8neTRVsJsgzbTd0AIRJP5MT9v@vger.kernel.org, AJvYcCVbiz3VIjtD8NoGsob25hG/7KdI7J7vpmLX4vjL0Lc0TzM5UXIlzBUOJB/U8+MRKkPur4tdAcYD9J8IzbKX@vger.kernel.org, AJvYcCWFONkqdoQ5Jec6c+YzRdpo2MA8e1Zr8KqhcmqD3sNGVkg5pV8DtYMEalcK3/htfv7lecrRLoNn@vger.kernel.org, AJvYcCWkeKVfe5DCeo0PlMdsl9DvtXW7QkIrNIquwMheb6pochXVpnp7OyICSssIgpiMt1xJzBxtBmNOCmg8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb+FrhdHH9Vv40ksB0ZMlQqAZZi0P+CCKLghGzW6ujQ4pSjz/0
	/OJuXWd2tLYqitbA/0kjeU1sv4tyVl/dkEOTHyyUK9EIofs2G1NUYACRtinIR6iqxNP4XXajb7W
	MDO4k5b9RRLW7NqWjryt6b1N0JTc=
X-Gm-Gg: ASbGnctsA56zVjsvFRodFdLns6gPf0XUc+ybqCVX+mphd2M0Fj3WPhn5j4nJZelaj71
	FNeXdI0C2thItau10QJ3B4xn9nkhF1BOv+Jv8pH0f2OIIdu7bMzBdZrV7hGw014npUYi9IFwTQs
	ITCNZcMKGS6XoMiS5v23jN9dtz/RVydqf4zE9beAoWAmeBMah7Yah1I1A=
X-Google-Smtp-Source: AGHT+IHgsGgJmwmxEKpnhc3KaUBpTUWHrt6Vox1Gn3UnUAAe0PK/gYXRZtPTbixswh+oM9dFXyzr2ky1IWWsAGRzgTE=
X-Received: by 2002:a05:622a:1984:b0:476:9b40:c2cd with SMTP id
 d75a77b69052e-47ad8166f80mr66686231cf.47.1744871681175; Wed, 16 Apr 2025
 23:34:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-6-f9af689cdfc2@gmail.com> <20250416201606.GE3811555-robh@kernel.org>
In-Reply-To: <20250416201606.GE3811555-robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 17 Apr 2025 10:34:36 +0400
X-Gm-Features: ATxdqUEmV2dRyfh29pPC1NXM6TzAsbkslAEtgKdCvmLjQOkkOfZg9YZfF61iss4
Message-ID: <CABjd4YxKe0cb9qwS-ZHxuYmq3exD8TUPrY-9ZLsT5tCEdvPzWQ@mail.gmail.com>
Subject: Re: [PATCH 06/13] dt-bindings: timer: via,vt8500-timer: Convert to YAML
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 12:16=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Wed, Apr 16, 2025 at 12:21:31PM +0400, Alexey Charkov wrote:
> > Rewrite the textual description for the VIA/WonderMedia timer
> > as YAML schema.
> >
> > The IP can generate up to four interrupts from four respective match
> > registers, so reflect that in the schema.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 ---------
> >  .../bindings/timer/via,vt8500-timer.yaml           | 36 ++++++++++++++=
++++++++
> >  MAINTAINERS                                        |  1 +
> >  3 files changed, 37 insertions(+), 15 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.t=
xt b/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
> > deleted file mode 100644
> > index 901c73f0d8ef05fb54d517b807d04f80eef2e736..00000000000000000000000=
00000000000000000
> > --- a/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
> > +++ /dev/null
> > @@ -1,15 +0,0 @@
> > -VIA/Wondermedia VT8500 Timer
> > ------------------------------------------------------
> > -
> > -Required properties:
> > -- compatible : "via,vt8500-timer"
> > -- reg : Should contain 1 register ranges(address and length)
> > -- interrupts : interrupt for the timer
> > -
> > -Example:
> > -
> > -     timer@d8130100 {
> > -             compatible =3D "via,vt8500-timer";
> > -             reg =3D <0xd8130100 0x28>;
> > -             interrupts =3D <36>;
> > -     };
> > diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.y=
aml b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..7d9dc93b708823de9594d20=
ef6b7e0367c5a36f1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
> > @@ -0,0 +1,36 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/timer/via,vt8500-timer.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: VIA/Wondermedia VT8500 Timer
> > +
> > +maintainers:
> > +  - Alexey Charkov <alchark@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: via,vt8500-timer
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 4
>
> Need to define what each entry is.

Will do, thanks.

These are OS Timer Channel 0~3 Match, respectively. The hardware has a
single 32-bit counter running at 3 MHz and four match registers, each
of which is associated with a dedicated match interrupt, and the first
of which can also serve as the system watchdog (if watchdog function
is enabled, it will reset the system upon match instead of triggering
its respective interrupt).

Best regards,
Alexey

