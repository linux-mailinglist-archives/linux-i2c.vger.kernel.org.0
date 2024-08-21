Return-Path: <linux-i2c+bounces-5621-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D45959A18
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 13:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C976CB26E56
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 11:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6842A1B1D5A;
	Wed, 21 Aug 2024 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQXws2py"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3381AF4DC;
	Wed, 21 Aug 2024 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724237716; cv=none; b=g6wvZqY5dkfYUaa2J7+71v2oeaknNeaBCqhdo7OU3tNTYFa6je5uSxDOOYa3NUFqqtafArStpeAC9wktiRDJ/tQswdPl3Lq4UkG+5WrYQT0gKV5Apwznz2gw4ZTKNp4WsuaZnbFZ69MsGgCEc5Neo8SuVG1lPerAFs7upyOuIX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724237716; c=relaxed/simple;
	bh=LdumwN1jo/n/KBtkjPSwNc2sSNEbK5/h0uSru882m18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MSnWoSDih5Fb3fXDCrSghV3l1euGpv/6s9AzXwnZDTql6FKRM9qsqPat3lSMdArV3vSAvjJetsxmsRoAgtwvfA0b0VrVrgdQz6rSVOnPw1c8IVQy0MT8uUL9o1JXr9NMyNjgtjsugm49xDmuYYNEkowYSOf0Qhiu7hQZENUW1pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQXws2py; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e1633202008so3117517276.2;
        Wed, 21 Aug 2024 03:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724237714; x=1724842514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdumwN1jo/n/KBtkjPSwNc2sSNEbK5/h0uSru882m18=;
        b=dQXws2pyB73Q+30Rnvyo9/1xYqXMAo8kz1rZtKIRIgxksp45huXHM/+CAT91CK+62c
         SXC8GTvbdHIJMfkAvHfFc/z6lIYOPMqtdXAhylTs74skiqVOZC5QOKgNxUpD+OFistU2
         ehbOaCUBsa1KfrnhkJeORdBy7PxID5SAMvH2T5W5ITsrNPbHhcBi1GEHnWscKxcJ2pLH
         i5pf8gaJu9AmkC/4nCIgnUTLf6tBhsYBG/RLNJTaj+5TAxjeOQI7+QLpe8G+tTS9XeDl
         riRZEcjZUGgOHrslhYLuCi1JzRTQuw+Iagu3vGadepQy1iZJ6trWWpMz/PRr0TMmQ2fW
         nKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724237714; x=1724842514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdumwN1jo/n/KBtkjPSwNc2sSNEbK5/h0uSru882m18=;
        b=YkAIeYWOL13RkkU7WsEOdCXYWu6lpX5Y52aSi83hkVWMGqMkH2+Cn8OfA72xrnykYc
         DfdBqGvq9xjtIYemy6ER3x0YrNmzvKm1y8GAd1prX6x5Hw/Hi7qc1DpspJM7Hy27c57i
         VnDumB/icwQhu2wEs+f9l/s/LCkDCu8c2sKTJxVsLl5XR271Bq0pmKBCdcTAspFXEMfg
         yMGGJx6ZHN/MFhCy5Ue8+D6O7OnMdZvBsZ0vczDtqUlCr2+YW3t6h7XniwU8XiXVk0xY
         nUmYE6k2PExB5IMzJIAXG8FLXpgfnrPv9lEcI4UjJI7wcmVQlI63zhCrd8JWGye30DCn
         RBDg==
X-Forwarded-Encrypted: i=1; AJvYcCVUcvdsEP2RyS8CS9phbpx9QmRvsWuzL3j/qfQUdZTu4lyPpbf+BVDzynV/j6pp6AevTGfdmTWe/8ge@vger.kernel.org, AJvYcCWAVf3RN5N/eMB4RfJvORlvjQcTQV/6/FPYD/qfZwPEcJhkHdoF6pxWCSUCvS+iU3oTTVUaYaSpTYlU@vger.kernel.org
X-Gm-Message-State: AOJu0Yztev5QkWbAn37/ZZK6Xp7LmtrioMwxOdabROMhCcKMl11kt5+l
	UF6VA/VqUugS4xu4ECzyUzJT/ci9QCCvhYKeS9sGf+oOvIucqSM5dTcdoTmsJl0WcbaHmux86zP
	nTEntIPISkG9v7n9ARmNL7aIzLCDYrA==
X-Google-Smtp-Source: AGHT+IH3vI6LbwOUVb+46FaZR6BIKjdGiYb4a97FSAhxpbogC94O6y5okZKDM4QDYpM3D9grOhSHMFn22LgX3CznpNc=
X-Received: by 2002:a05:6902:18d3:b0:e0e:af13:b773 with SMTP id
 3f1490d57ef6-e166547b8cemr2745174276.23.1724237713710; Wed, 21 Aug 2024
 03:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <CAOMZO5DiSvAG225poAoj9hHKioq9XSg_Y7kJ8PG66HEVo-SjMA@mail.gmail.com>
 <d3c5d73f-a756-4f35-97f1-9301529cce34@lunn.ch> <ZsUXEkc5A5IBLpJv@shell.armlinux.org.uk>
 <CAOMZO5CymmmUUhBrYwyCJ54sj=55wAVMqWpuYRbJOhoaroCUXA@mail.gmail.com>
 <CAOMZO5DUmw=PZ_v32Y_xkbOTkQiR-9BPmNH7992YSV0m3Yhbfw@mail.gmail.com> <ZsWDicqAjmkHgaPD@pengutronix.de>
In-Reply-To: <ZsWDicqAjmkHgaPD@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 Aug 2024 07:55:01 -0300
Message-ID: <CAOMZO5AzHT79v4BnfoHqSt+S0F7hk9xYMZQPQOtXswqK4O4ygg@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, andi.shyti@kernel.org, 
	linux-i2c <linux-i2c@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksij,

On Wed, Aug 21, 2024 at 3:05=E2=80=AFAM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:

> Do you have a multi master i2c bus? If not, can you please test
> following patch:
> https://lore.kernel.org/all/20240715151824.90033-2-eichest@gmail.com/

Yes, this fixes the problem, thanks!

I will reply in that thread with my Tested-by.

Thanks everyone for the help.

Cheers

