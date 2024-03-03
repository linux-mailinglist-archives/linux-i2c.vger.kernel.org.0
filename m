Return-Path: <linux-i2c+bounces-2121-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8352A86F496
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Mar 2024 12:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5F511C20AF0
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Mar 2024 11:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD32AD4C;
	Sun,  3 Mar 2024 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6MZ0mrY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609B2BA46;
	Sun,  3 Mar 2024 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709464520; cv=none; b=V8S3HGBf4LTZXrMH1Qv3Tvuj1Vb6VOWXDkts7Hc5TxmfkGFXJ1RIxGQlasYemSbwjDKGRj4y+u1LLelEEWBV7wztFmtCfqkvG5PNca/+B/0nDqXECmDCJZwXdcIRvcYN7cOY6+pwZdLyEMyDYpM4q5Szs1oGKyRS/drNFlWAIPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709464520; c=relaxed/simple;
	bh=RB9TQhlSLnlD4Oq8sKe8PbKMl4hDKLEdTEKSxiREv6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXYzcUmDXOPAavL6JAF1PJ+0NozXfSfiCs6WwVDS85RXEF0MJWRpeznSD3yF6kdNybxP2dRR3fbRsSgFPn5Z/RQhk32yV4RjNWpHqCnKDx3cSVR2lsRd2Ck8n4LUNOs1Ipr/P6LrZJuaCFPABY3VuSyo/b9ucAmlztrPo/iDDRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6MZ0mrY; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso478914666b.2;
        Sun, 03 Mar 2024 03:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709464517; x=1710069317; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RB9TQhlSLnlD4Oq8sKe8PbKMl4hDKLEdTEKSxiREv6c=;
        b=W6MZ0mrYbt0Y75Z8E3juOYUNajjZs4PBk65Xg/9PBa7jIEt89W03Bg6Ot8Jmv7tNpA
         +cHGR0Gy8qNU/zWK++PlsZyCnbJgyuSOC11Iy8B7ptgoRdryDMsboIiUcZZsRZlVm+tH
         C/wappi8h+h/R/JG53ycmVLJslTFfGrad/XjYnh6jN92kBz1Nbv2dMDeqyIYvcz3lcT1
         xaT1YuMevbLZGNQVIrNC+G7QD/evBOHeqpRO/C9kr4rVYMBdfoECXjn66Yw2rLyX3e57
         VVdLEsPeMg8MUMVTebfkn1T5RG1H2OmHxHPe0pbF58Pio4m6ThmJiYsMD50kBCVsJ/dJ
         rtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709464517; x=1710069317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RB9TQhlSLnlD4Oq8sKe8PbKMl4hDKLEdTEKSxiREv6c=;
        b=weABUzKGLVpY6S1VivfcXNHfXOvMH+Kms130sWYm3R8JyIOTUuZrfIjzGTq7ofYiu9
         9mMrV2OockWRABQo7XbZLE3x72O8tyC1Jq91OaLUADWXNfge95hxTWOvxJwv6DKMYN+v
         /EjbGcB0PnkBazcAHuGYbMAqpUTLsZD3w+ugP4TlkOZnj9DPo3OtouWVdaEtD5m4mN2J
         ZOW3hlyhbtfKEDvvTppprIDRpfropDhU8byR/p7qqoEHOgMxY9OizvTAqV/ziq7xnuLV
         3cWw02TY0KIGVk/CwPt1Lt/PHzoLq77oUDUP4SmFPuzr92XEbtDsoy+rC1GRkhS73Nvl
         xnHA==
X-Forwarded-Encrypted: i=1; AJvYcCVJJgSE3wCsGT08o2274IfAp7wHkF9n9kUiO8zLuRvVRS4bcjCR4OqEsKg+wsf7o6/FiZqpI0aCNK9750/q9VgUAt6eWFxdGgqq0bdPe3kE7fI0Ak5qmqM5MlShVmPDxofddaqiggGGoC4NWTPI3Q==
X-Gm-Message-State: AOJu0YwXaMB9rncdXBTpOCy7jiAKsdjC0q+6s+Uvxh+dwlSXxjXXQd33
	2DN54+qbm40DJIcOjEb6hGVCS0BvZEVIEe85bHVpGh+VV7RQW00+JYuuyhSOTNTlr5gl1UrgBCU
	moyiNt5Olt43GhIgq/Ji9ZS4YnQ4=
X-Google-Smtp-Source: AGHT+IGr/241ztiljhGTg6LOnVp9/D71oFXqrO2UIzE3SlwQMWjjPk26xq79/XZL59Nsgj8yXHeCc8biYMLh056p0Bg=
X-Received: by 2002:a17:906:f856:b0:a43:f1fe:cf1e with SMTP id
 ks22-20020a170906f85600b00a43f1fecf1emr4865828ejb.55.1709464516472; Sun, 03
 Mar 2024 03:15:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240106160935.45487-1-hdegoede@redhat.com> <20240106160935.45487-3-hdegoede@redhat.com>
 <20240107171055.ac7jtwhu2kbalaou@pali> <20240213173050.0cf4a58f@endymion.delvare>
 <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com> <20240227214011.xeys7rtukn6hksdw@pali>
 <4344926b-40e9-4423-b208-c18263248a82@redhat.com> <20240229205724.4izh253onvh4mijd@pali>
 <cc13a44e-ca2b-4c4a-b2c6-23ae4b13f473@redhat.com>
In-Reply-To: <cc13a44e-ca2b-4c4a-b2c6-23ae4b13f473@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 3 Mar 2024 13:14:39 +0200
Message-ID: <CAHp75VdUFdJyoipyWzkNsnTwkmHEmdu6HvjnRa04vDEE0RbMjA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Jean Delvare <jdelvare@suse.de>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Andi Shyti <andi.shyti@kernel.org>, eric.piel@tremplin-utc.net, 
	Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com, 
	Kai Heng Feng <kai.heng.feng@canonical.com>, platform-driver-x86@vger.kernel.org, 
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 2, 2024 at 1:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
> On 2/29/24 21:57, Pali Roh=C3=A1r wrote:

...

> But the only real problem you have pointed out is that
> if people *manually* rmmod i2c-i801 that then after *manually*
> modprobing i2c-i801 again the i2c_client for the lis3lv02d chip
> is not automatically re-instated, instead they will need to
> also manually reload the dell-smo8800 driver. Which IMHO
> really is not an issue since they are already manually messing
> with drivers anyways.

Actually we probably can add some code to the i2c core to list the
clients that were instantiated in a way that can't be done again after
removing the respective bus driver. But this is just an idea on how to
inform users what exactly can go wrong after the rmmod/modprobe cycle,
I haven't investigated this anyhow.

> And note that even that problem could be fixed by using
> bus-notifiers as Andy suggested. IMHO using notifiers here is
> overkill. But if you are ok with moving this code out of i2c-i801
> and intel dell-smo8800 if I use notifiers in the next version so
> that things will keep working even after a *manual* rmmod of
> i2c-i801 then I'll do so for v3 of the patchset.

--=20
With Best Regards,
Andy Shevchenko

