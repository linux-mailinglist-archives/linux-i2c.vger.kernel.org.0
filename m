Return-Path: <linux-i2c+bounces-9370-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CE3A31BF5
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 03:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC1F2167E24
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 02:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233D31C54AA;
	Wed, 12 Feb 2025 02:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+Fd1o0+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB42199236;
	Wed, 12 Feb 2025 02:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739327130; cv=none; b=Yr8vR3VmoVurvQ9R4AqiGPPkd29iocMbxSMJCmy1NiqT6f4HHosJT0QqJ5TFcT4DUnQdMwKYiu2A7JplHwvMnj+zELHQ5uyxVGNvCB0nB0ObAfwkY/AR9mmFu3dEfEBDrp0c0Q3tc8Ao9UYPhVpAIWxZjBSXanStvYSYF6ZynCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739327130; c=relaxed/simple;
	bh=/D4oLXD6LukOuRDzE7hhtI/PhDeHQ4JgeRu/msm7Lyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nra7CQbGTIom6rqTKYsuuO5mJXAstBQVcUcDrH2P7mgLt60RPUXSoga/RrviTj7emv+ybFPNAaRdqyVvrQTsvADgItdnRD6zSHPWNjLDSmQzlnDY1E79bDHah6rvcANKSUIQjWPAI0AV+/4HwjF5m7aV95CF6J/GGx2dZaGmAjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+Fd1o0+; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ef60e500d7so52243277b3.0;
        Tue, 11 Feb 2025 18:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739327128; x=1739931928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqrwQ+AdMSSLFwzy2Bp4Gf8n4XSBGfuqabnYZ/GVUcU=;
        b=b+Fd1o0+2UTPqgYM3ryDr+fuySM0tN4vnZXJJATXnFYd63ZrvOfxFJCELr3Fx7BY+U
         +/fiM/APG1nYdO+TFJz//OEpUUfUh/gkbL2/dHxaDLUv/eX5ftH51KzAw8/xEDYBh8Vp
         Q2Z9omVkS5EIrLIeHRsntZ/XB3y4zmSxG2ThaMcXpDw0u3WOBaWkabbAPNHcWa0IdCJH
         Vg3R7Jdywsd+fusevCyKjKjr8WFRGErozpF+bIsRPl8PA0RK4D21M6LinrJqfcPCOWIy
         6M94EtBntovlx6x+8AXEaNE/veJfPUCBwhZSfLTMz0U7iQsQmJZvdt5Fdwgt6TdfJ1iH
         vGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739327128; x=1739931928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqrwQ+AdMSSLFwzy2Bp4Gf8n4XSBGfuqabnYZ/GVUcU=;
        b=Pc8eBUMSx7wgzaZFTFijL80KKQwMb2bZyWT1AkWKijz9xilyhjO7fe4zqjwqwSY79H
         db8VVcJ3dJib3oQrQ7A5zxjoBzdfwJf9BDewhRQfjXTpByTbXfUc4IO2bT/C7yvYDy6H
         /21qLsXmj0m/xWddNdm3y70Wc3VzLKtUIsrebXIREN9EXfA5e3eeSfsjMwsoZ19FUoJc
         Wo9kcH0SmE5N6NvSVwTizv2LRMvq9eqXVo5q1vrdvptdxBXLxAk/BjDJ5wrsPJH8g5SK
         Mgm7/3oAKK1A5MBkeubCyoLfswax1iqPfV9zqFK6AOQh6+N1ikLdAGgkuCs60YemQ4Nn
         V9fw==
X-Forwarded-Encrypted: i=1; AJvYcCUYJTtvlD5xkFCCWTj/6vQpQgZyV5YQzUBv/oFLg8Ob5Fh+E0JlSHrNunry67uUoxrM8EBLLdHj/4k+@vger.kernel.org, AJvYcCUiVw5/5mbMVHuVQ4ZBuGVsLNWZl6dtmQQRS4J3VuTnupsISB8ZtQ3qgaXmq9Sg4DzwOjwTxItWI0VPcxY=@vger.kernel.org, AJvYcCVQa7h/kIXsAcKCnK1Yb91I39oae//A7q+3ifNYi3ImeQwyaa13m2pFOfOx69sZizVhAEsWSBLmiaHPGbiBcYY=@vger.kernel.org, AJvYcCVyNDbxxVupHmDne3AyXzTnsd6F0KgchzOTRGdwFSCEk+F6iY4Hjz9e7l+C+2KOXMYppVta3Vges1BNt7QF@vger.kernel.org, AJvYcCWEMVANJ/i2VYxoRFh+wNf7i2PyMH3ALOvEHgcAJrJ3lokQYIDGWNfM0lbS29NeBjtJn2s95c6diag=@vger.kernel.org, AJvYcCX3ioplJpsJPpMcmQIVxkHVRYWYzgXSFqE3HcxiIFWbWwlIu+nUlV3PEdzvDI+Y5rm8yl/ihEuh@vger.kernel.org, AJvYcCX7lGTiEVVOCg1GFrJp/cZWiTPWP8U/v3zka2yBlKNXLMDCfXgv5rJfVsJKqm7n9qckryPswYcYkbSG@vger.kernel.org, AJvYcCXduaqkfuIsPZe4aVu4ijOcQyiBkZqRHOicT+k0O0dI9sfux09XWvd/LucIc+XNmToId4p2MutKnQkC+w==@vger.kernel.org, AJvYcCXswE/O4V1ozUS00dB7Yed7oYSFZVQCdbKaeCyKJW+yAuQzbuIVhiO2zFX2RBJ+5xoy1GU4rozILaIA@vger.kernel.org
X-Gm-Message-State: AOJu0YycIroLFybI+CP7u7nznDKUioPK9Ckr7/KVoWfE9zK2Pu+xU4uQ
	e0QVfEElG9QeQkrSZUbdJ1+CoX+NpUkcprGNEMFP5yIPVJ2AJX7giSeUi8Y9quEgfXQ8cspqcXF
	Aeogn2Vtyn466hXvvj2/KbCB9oFM=
X-Gm-Gg: ASbGncv395GYe3stp/SHGDuW7AVF9oq9mK5DUKcYpDTzTxe6nhrtRHxEFt++mrn4ghF
	qQ5HgoA94komxqYzyyyy0ZHj9wyPths97llfQOveBsxYWSUvZupH97c/nrMRApdnj4Rp7W62VYu
	M3N3cj/ZelWGlCTLs4UvCAnACVQGJgDs4=
X-Google-Smtp-Source: AGHT+IEMT6jC3otOLY2+jOJPHXOzFROO3YopZvE8lHCSsXNWFhoxDLbOAPOO9nvDAukMRHd2MGxHoMAvgrjIuvXD2LY=
X-Received: by 2002:a05:690c:7002:b0:6f9:b12b:8953 with SMTP id
 00721157ae682-6fb1f5f54d2mr19732747b3.20.1739327128394; Tue, 11 Feb 2025
 18:25:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207074502.1055111-1-a0282524688@gmail.com>
 <20250207074502.1055111-4-a0282524688@gmail.com> <01801937-6257-4381-bf18-90badf795da8@wanadoo.fr>
In-Reply-To: <01801937-6257-4381-bf18-90badf795da8@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 12 Feb 2025 10:25:17 +0800
X-Gm-Features: AWEUYZm7YgqpjIvBT60mCR7Y2j4SJyw5Ijy4sGaZXuVGNju1fwDvfHQWVzOsSR4
Message-ID: <CAOoeyxUsoqtieRQVYr4DWPKOV4kTgcib1c3-tbz7KayTnshaig@mail.gmail.com>
Subject: Re: [PATCH v7 3/7] i2c: Add Nuvoton NCT6694 I2C support
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Christophe,

Thank you for reviewing,

Christophe JAILLET <christophe.jaillet@wanadoo.fr> =E6=96=BC 2025=E5=B9=B42=
=E6=9C=888=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=883:06=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> Le 07/02/2025 =C3=A0 08:44, Ming Yu a =C3=A9crit :
> > This driver supports I2C adapter functionality for NCT6694 MFD
> > device based on USB interface, each I2C controller use default
> > baudrate(100K).
>
> ...
>
> > +static int nct6694_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs=
, int num)
> > +{
> > +     struct nct6694_i2c_data *data =3D adap->algo_data;
> > +     struct nct6694_i2c_deliver *deliver =3D &data->deliver;
> > +     static const struct nct6694_cmd_header cmd_hd =3D {
> > +             .mod =3D NCT6694_I2C_MOD,
> > +             .cmd =3D NCT6694_I2C_DELIVER,
> > +             .sel =3D NCT6694_I2C_DELIVER_SEL,
> > +             .len =3D cpu_to_le16(sizeof(*deliver))
> > +     };
> > +     int ret, i;
> > +
> > +     for (i =3D 0; i < num ; i++) {
>
> Tiny tiny nitpick: unneeded extra space after num
>
Okay, I will fix it in the next patch.


Best regards,
Ming

