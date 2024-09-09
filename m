Return-Path: <linux-i2c+bounces-6378-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0B0970B8F
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 03:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DE06B217CD
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 01:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9421A17C91;
	Mon,  9 Sep 2024 01:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKGHjbaL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9501614295;
	Mon,  9 Sep 2024 01:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725847000; cv=none; b=JTnOmAIgh4YPjZNz/XbZWMcPxp8K7PHqZIETSzUXXVsVNbHzHTKuT9IlFrTHXCS6xBCw6d5qiuOgvAOZvD/pty5fqaYVGURmcr5cEfiQTcIlXAfeXmp1zoIXF3T7OsCAPfOhClHSifWx526/rVLaNMX/Pb9TB5YMcMlw+YWNgOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725847000; c=relaxed/simple;
	bh=sQxGUu0Obt7f3qYWvw/iDZL92IIp8f4FF2v6+4pReKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DqJ9QgrjFXsCFM+Sdye2HIFgBTOo666kOmyAvpFsfXmqx964dGpDgRZgqd4vKhJxliisjJcxts19uM0tGm5LzKx1zn0b3EW4SfAwOl37xC7tnLN8u7ZcXZ/s+a1IVkA4tTP9dkPETj6YpZ6YIVmkRwG2VZLbcovYcvLIwvkFjQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKGHjbaL; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8d4093722bso183968066b.0;
        Sun, 08 Sep 2024 18:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725846997; x=1726451797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCJjcmJDKMrQ+us9cppRbmfBwPVnybr35b5gsVcmfwU=;
        b=RKGHjbaLqc1JoI4b/BOceTLZJnZA1B3CSWWqvpRiAZMdYBalHy8Qz58jgdlqBlMcJu
         m8hFscwzyQAp3Lpp0K0BmwgG7EsLIodEzbWyr28DytbnXgDZ+e169KdxlGu7etZQRpSu
         I2MxXkEB7noz9HXoZdVO1S0lc5mj+BwNh5LMxviuZObB3a60g9/7L5U52kgIDTt8NdWc
         7XJwUb+UHf1GA5mOMTsx6pEIDDlT+62h121wQ5fZ41JJcuTcv7GtTJVNGYaZRB1BRMPj
         yg6aJqGfWat2Th1405Uv5KNwe53ppL1W6/Nhs4fkvK32JDpNXjtFyb5C3L9xVcb+X7EN
         P6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725846997; x=1726451797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCJjcmJDKMrQ+us9cppRbmfBwPVnybr35b5gsVcmfwU=;
        b=uZMN5yb/ueVcWrxfp4XkJUwCC4zhi4V/tf/05g3IwCeMRySyf6c50bJjjlKVEAPAZ6
         QvvI9YwKgN6LEu8oIr41I+jk02uCguaihgj2Qj9+WlDiQpKucJPmynWCDM/nW3Mm1IBK
         eJ6vz+cTA/hmnlb+RXh6aWqFi8yi2I9GYFbZXPY2HpkgGOoLCjnRj+IfNLFgqEzIm7nR
         nLexl4ToTJhogWHL9eqlk2TiNWsYDTNkDw16pCB3M+SSQQJuAEShsPk2SbBiFKjb3BFc
         DFTrV+QCfaZ+Rb0N5db5hGjXcaaFs6z5qFwrwJPTeN1IIWoW4tVdjrszuVinF4upgwRG
         hbDA==
X-Forwarded-Encrypted: i=1; AJvYcCWbDICa5+Vl0iO+9V1UYYUZh62RL888n+eaRd+0dcKuQbFPnwbAAe8rWCpSUbTiFftEJlqYOI/awVY=@vger.kernel.org, AJvYcCXwpA0p4C6V9mWH5wn0eu2Or0/Cwq6P4kVD5jJrTcA2nWbB7HTd2Gwi2WlzhO2JNX5pHxdVC/WJfGk65lbV@vger.kernel.org
X-Gm-Message-State: AOJu0Yws5PN3rL5UuojCgwOKQyK+2AuAvdeQiFgeIiPgVSd9+Gv3Vgfy
	LYiystd3vvYsUUaWgNHJiQoXs5qsPcUUCVy9Qyb81RqWXeVS30iYCmPyjfCR7cD6QscDcZ16bpj
	IFzwVwyz0Fy5OxJGK5IGUV0K5oQ==
X-Google-Smtp-Source: AGHT+IHMalItQyCwxTtL77V0zr8I2TJKjvPfT7o1+ANn5fimShLiSwPZZusUqd9F6N6LzZkQOlwLmH7vTO6V+4zCbS0=
X-Received: by 2002:a17:907:6e8d:b0:a8a:794b:9891 with SMTP id
 a640c23a62f3a-a8d1c72daffmr628007566b.51.1725846996519; Sun, 08 Sep 2024
 18:56:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-7-kfting@nuvoton.com>
 <3wz36hrpicogoakqhmveppcrt6s52zmlcgjpio3wwpil3rdwdi@ft7tloqqf2zt>
In-Reply-To: <3wz36hrpicogoakqhmveppcrt6s52zmlcgjpio3wwpil3rdwdi@ft7tloqqf2zt>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 9 Sep 2024 09:56:25 +0800
Message-ID: <CACD3sJYFNV9Vxmq1Ydp=+wh-52DOCMsECO+RmP_K6t4B8wzbmA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] i2c: npcm: use i2c frequency table
To: Andi Shyti <andi.shyti@kernel.org>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi:

Thank you for your review.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:43=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Fri, Aug 30, 2024 at 11:46:39AM GMT, Tyrone Ting wrote:
> > Modify i2c frequency from table parameters
> > for NPCM i2c modules.
> >
> > Supported frequencies are:
> >
> > 1. 100KHz
> > 2. 400KHz
> > 3. 1MHz
>
> I agree with Andy, please add a good explanation for this change.
>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 230 +++++++++++++++++++------------
> >  1 file changed, 144 insertions(+), 86 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index 67d156ed29b9..cac4ea0b69b8 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -263,6 +263,121 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] =
=3D {
> >  #define I2C_FREQ_MIN_HZ                      10000
> >  #define I2C_FREQ_MAX_HZ                      I2C_MAX_FAST_MODE_PLUS_FR=
EQ
> >
> > +struct SMB_TIMING_T {
>
> Please run checkpatch.pl before sending the patches.
I did run the checkpatch.pl against this patch.
Here is the log from the checkpatch.pl:
-------------------------------------------------------------
./patch_i2c_v2/v2-0006-i2c-npcm-use-i2c-frequency-table.patch
-------------------------------------------------------------
total: 0 errors, 0 warnings, 265 lines checked

./patch_i2c_v2/v2-0006-i2c-npcm-use-i2c-frequency-table.patch has no
obvious style problems and is ready for submission.

It seems that the values of I2C_FREQ_MIN_HZ and I2C_FREQ_MAX_HZ are
not aligned in the email but they're
aligned in my editor (Vim with a default configuration).
>
> Thanks,
> Andi

Thank you.

Regards,
Tyrone

