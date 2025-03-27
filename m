Return-Path: <linux-i2c+bounces-10049-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2D6A729F9
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Mar 2025 06:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E6523B7452
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Mar 2025 05:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78251C4A20;
	Thu, 27 Mar 2025 05:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdC4coa0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28752745E;
	Thu, 27 Mar 2025 05:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743054134; cv=none; b=IKNepB39pRGGBrx6+qBO9cIi+qZjPXVjwDBhaK2I+4RfrTlSo8SR20p9vL7Eqqy1GYp4uPu/iOzvIygsIaug6OW7gVzXswUEmCieqT5rKlI9pJmoPjrJx0iKa2B8qChKZARaK77P7DPGvPpiJD7yH0bUNoRaEIzNRi+wAVBVGbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743054134; c=relaxed/simple;
	bh=4CQXg4IpbDO0opy/ZXVipMMcl9v+moCgWgQYJOFdIH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BINw+cMXpeUs/TI9nbEhWcxFDUvRZXYtc84f8Zbt4ONoytQOHmhCh1BzLKzR4Qqx5b9hwI1n36L5X1AEUEz3jGK9twsh071OlNPQTR6JjEXeYHNR6bXfWvc0oj6eP064n6LJVC7NVgEM2cXXDNB+0enSL2bT6FwzypGbGpcivhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdC4coa0; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac297cbe017so305891066b.0;
        Wed, 26 Mar 2025 22:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743054131; x=1743658931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7e3luofiVZRkRA4IUg/8Z4HmtZaFEqJYjDfKz1mkgQo=;
        b=IdC4coa0TXl/qmwSfWRKxPIPqH0DBebMx57ml7MGL/c7kqozPRaBqvswqXXXwKsxKT
         RhvnbMfT4NKFUCg2RCt9WY+stllenWLNQcQ152OX9vV9elR/mhmhDXh4Dax0AvJetgyG
         FhZ+0DTnvzMNACEXlH59LpBqSq6Ytn99NCk9f/undI1Yz5P4syGrbemwGfqwh6iAxK5W
         lB4QPjyKTJQDAOaQbUkbOUDaUnd6Iw6hF8uq7f2zmTJv7m7JkKD3lbdJDnmWaXysmnGo
         sQCC0wXs2qy14QSm4OlW9IrWBLAmxSVAZDEJq+PgfE8x/q4JtH/mPDAX3WsJ7kn1H3u/
         422Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743054131; x=1743658931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7e3luofiVZRkRA4IUg/8Z4HmtZaFEqJYjDfKz1mkgQo=;
        b=IGeRZrLoOn1226X8AZkJQveKrurblhwNBktMzx9pD0YYM/JXceqkWjiW3tQuALP07h
         tCVhUpFw1PHulUa/rpO8dT3ThLulLdn6RC50ti+EXyvJPW1gqMwPiI5U+IXCdwYZTUfB
         +w4jDrxoJGXmUtbODDnrG5OiPkaDd9bTg0kn8ux7T7n0od7UtP10iZjOZN/mUpngXs6m
         T4RouyLBv7uoai0rRdqd1rQ3+lPUOzro/rXc9FnDl0TznR3Vct53b51nbgYhP79jC15O
         4fhGt43LkWX9VbHHONNSO54RSWDD510QrjCAsQ6EhSh8cCGyTBbPY/FqaaYqgxd9Lj7e
         RDiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIj7Q1o3pAkaCGI4X3DTD3acirVjXyLkYXxamoKP5Iujb/5ZanLA9Npq0uftNEtWVTsOuv/1GpEBjJTAo=@vger.kernel.org, AJvYcCUMGTfDc4yojbbQ3pX6amMjFLjYa8M1LLnK6aEwoYlVPsz6lWOmX1EG+/35HJSbdlZ2kz7ebVw28T3q@vger.kernel.org, AJvYcCUOQqJk0y8fYIRiaRPNan1pphyKFRa+PrPbAykfUPiNhQgevq1NKcfo28hACH888MU8H77+YkKrSRrdNfcgzL4=@vger.kernel.org, AJvYcCVJkYJrAmXIhxbL/EezgZFeQD+Maf4ZP8G+9FBd4jTLRutuPgo6b/seNtkhLvVv+OZGBM9QBMhY16Fd@vger.kernel.org, AJvYcCVedCMERi+A0BSuWN5EP4tTBT0EEBvbxqK2NRsVj8t9CJAHWD0LMb6yUATW+HBrx4SdySzfW/RbFiLpjQ==@vger.kernel.org, AJvYcCVs4pq+VRKHQ74DyfoogO7S+jiELNgsk6EdURJr7edySKF/D1iualoGynP/ZteuBsS4eWc6K919@vger.kernel.org, AJvYcCVx6Yxjk3S1Y9icDuhaUAoE6lDEMrXsNbYvS/CjmVn1f0GtmmmVIPNzjWa15Ir4WHJyUrO6Yueg54I=@vger.kernel.org, AJvYcCWTNi+T8cNcAzvF1ICTcmW3rDyeRjSl6o1UDk+DEZ0QLkcIika4oHur9qaopW6TibBG93TEScoPPHpH@vger.kernel.org, AJvYcCWZrpZAqolCFFAa/S1BOK+ZXMave4zKLDbMCTZc594kAoWRxIww8F0Wn3U6i6GiTPcuSwAt2yi1wwd8zYTS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6pJHe9zF1Qv+uOsUwvVfO81vcKSd6YrRH+8ZFc0vOawha4Po1
	joncRRwIE2Zmk+kZ1cwFlrYWAoBLLnYSVyIJ4iwKb8W2C9tj1r/Ep/yGuIvOmHLB1CynW5tcC7B
	P9s+RjqoitoWUB/xA+3Wcw4FGeVA=
X-Gm-Gg: ASbGncvQGItLV3WEjtjtYNn75UhwuLP81zDpHNeC+finLItgtc74xpjgs+vsBw1jczp
	JV6wDO9apEDZjj2+Lg+SfWwRS6Ol2POPEn99RxLoa1hIxOrxcezc9nVkaijc+UteZyTUA4TdQgY
	VDbboVNMaWFIXth4IFGkmydhwocI52zYz+Cme67Pf+w8Ho18aBjYu9uKocAT/9
X-Google-Smtp-Source: AGHT+IFUPZQ1oRIdY9EEcy2F8CooCpoh6U0x2eSBcVY+uGsZIglU4m08EJj/dKDKpQppPx9bV2Is0UchEO1VoA0ykZ4=
X-Received: by 2002:a17:907:7203:b0:ac6:cebc:4255 with SMTP id
 a640c23a62f3a-ac6f8ba6fffmr209952566b.25.1743054131027; Wed, 26 Mar 2025
 22:42:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-5-a0282524688@gmail.com> <08f1177f-6623-46ff-8936-5b628326d8bf@wanadoo.fr>
In-Reply-To: <08f1177f-6623-46ff-8936-5b628326d8bf@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 27 Mar 2025 13:41:57 +0800
X-Gm-Features: AQ5f1JpBjP78pCUd0_AYX3swIjS55-LjqJNkYWnqFMVYWdfzgVQvLBr0lkg1km4
Message-ID: <CAOoeyxU09h-BiOcEZ4ZAF0ChQwY5FjBSidc5mb2oxnh96y+V_w@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
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

Christophe JAILLET <christophe.jaillet@wanadoo.fr> =E6=96=BC 2025=E5=B9=B43=
=E6=9C=8827=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=885:56=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> > +static int nct6694_can_probe(struct platform_device *pdev)
> > +{
> > +     const struct mfd_cell *cell =3D mfd_get_cell(pdev);
> > +     struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> > +     struct nct6694_can_priv *priv;
> > +     struct net_device *ndev;
> > +     int ret, irq, can_clk;
> > +
> > +     irq =3D irq_create_mapping(nct6694->domain,
> > +                              NCT6694_IRQ_CAN0 + cell->id);
> > +     if (!irq)
> > +             return irq;
>
> Should irq_dispose_mapping() be caled in the error handling path and in
> the remove function?
>

I think you're right. I'll add this function in the next patch.


Best regards,
Ming

