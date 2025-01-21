Return-Path: <linux-i2c+bounces-9144-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE90A1820D
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2025 17:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70F9E1889EC6
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2025 16:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05C81F4297;
	Tue, 21 Jan 2025 16:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Lbzou6gM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F561F3FFD
	for <linux-i2c@vger.kernel.org>; Tue, 21 Jan 2025 16:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737477412; cv=none; b=K3cZRAiMTRnitOKjgcQfvBdc1yDM4Qum/TFRy12lEdgyINtJ2OF69dFpedzo+zYoUMdhjEuvf9rO9aT6C6eJYuOWZWeLHqePLc4u6BVxQnfle9Rs3wu1WQj9swgkermfNAIfOCBJjQkaYTg3/CD8fePncB2vdtIJfM+9HDuiuk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737477412; c=relaxed/simple;
	bh=fDQgrDbYn3UfSPgwxEGhDivL9EG+kxuuU7rCZul2J9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p7gE4cX9/inWYOpe9c5NbU/SkI/BZgAE5c3vuhjeS2gRoS50jEAppR6KBudf62LCyTgx8wtqkZGyn8sDCYcy1xF/Dyk5QjiC2AtRNhtk1+IYF5YwFgMdpdI259vTQhxlZd0KFQly2CLGTkpn+c8nxzJOYfocG9nkd5wm6Bl5+xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Lbzou6gM; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5f4cc48ab37so1584845eaf.1
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jan 2025 08:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737477410; x=1738082210; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cexxH6pAXk9XIMe/5vkmpyhXiQxZL47Au+jT59VTaWg=;
        b=Lbzou6gM5fLCF06v8kGHDs5c5t+um4oeg0RNapxEUcr5xEPV4/ILot0rRKPmQNvso8
         H13blxnuBnCARd5/H/t5Dt8gYyMT+JSuoGbO45g8UqsvoXkBHtkE7KZO1ncRIOuEZSaY
         GEPohvJSZITdZgKjsjlT/g0O09J9V9D3B7CwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737477410; x=1738082210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cexxH6pAXk9XIMe/5vkmpyhXiQxZL47Au+jT59VTaWg=;
        b=fYYQi1xS0AJUtwSWq+JS3LNDXhMEyMx8n8+ih2PKBhVRpT08Qj2Ux9X7oez13SwFYA
         uYtRyFR1aGD6keXpTlUuQa6n0QPiJChEm/Q/NLLjkqyDkyfjL4myCvvXxgDX7uHfN3hw
         MDemkcNZsOb41dWTvCZuOkqvTwfV5Yr313v1E4NIXZVpg0d1D78Wnca5U/Gvp4luF0h3
         xOi7iRQ3uWzjdGlWfRA4SW9NPxRzvgV/nPZLlMwRKVcMdMpVXbQiG01r0fqKVijRKMcA
         zcCuHXb6P9q1TYGvWf8IvmCL7fFJ8aPWSl18g+3M29wiA9Zuekpr+5ytehs4vTAdGbdJ
         n8/g==
X-Forwarded-Encrypted: i=1; AJvYcCU/K34f7NBGRkTNQkjeH9VgalahxAkOOq0M6i4NDxprC+7pe4o6DpSgTBP4mn8npPbmnKc0L+Xb63s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ODVRsWsoGJCPx955Ewo66usOO5VuzXBvP8HuzANbVR5XcwUq
	kLsBU66CiP0Uwa5P1PLL1mgXIKg87nWEl2BRN9FwtkMfsDbCnJQ14eTAbL/PjiW6QTvJ5FobF7b
	ovD1TBTjvYEQBa4SVJrqSmee1gnaaXlHz3PPO
X-Gm-Gg: ASbGncuR9x5UxQL5aj3hAsy5H4th4cm1+KFOaHhp7D5eM/GD2K3GiFWqXmcqTfnQPah
	x+pvbs9VsHVY5F1CZ8uggdp2wGso4Ot0gnBbDp9qt3Y++/0drs9jG
X-Google-Smtp-Source: AGHT+IGlVH1md9rLHlre6FdKDPsxWXzSHreReGqe6SrbH8X46myPQ3FkCTFki4XSqAkzhsuZ7wNHv806BOGLb976Qxk=
X-Received: by 2002:a05:6871:538e:b0:29e:14ff:2f9c with SMTP id
 586e51a60fabf-2b1c0ac8a57mr9235328fac.18.1737477410034; Tue, 21 Jan 2025
 08:36:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121084818.2719-1-vulab@iscas.ac.cn>
In-Reply-To: <20250121084818.2719-1-vulab@iscas.ac.cn>
From: Ray Jui <ray.jui@broadcom.com>
Date: Tue, 21 Jan 2025 08:36:38 -0800
X-Gm-Features: AbW1kvbvgQHOEZLkgykV65EL9GDaOW2E0A8XAjZ2diyhwXeDwXXdzA8VCS17DGI
Message-ID: <CAJ8Y1dR4c_bDgV3DTy_KqTNdCPSgVhA5ecS7HsJ516SegnBtrA@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: iproc: Refactor prototype and remove redundant
 error checks
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: u.kleine-koenig@baylibre.com, andi.shyti@kernel.org, rjui@broadcom.com, 
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000d8dc62062c39fb16"

--000000000000d8dc62062c39fb16
Content-Type: multipart/alternative; boundary="000000000000d4c002062c39fb3c"

--000000000000d4c002062c39fb3c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 12:49=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> w=
rote:

> The bcm_iproc_i2c_init() always returns 0. As a result, there
> is no need to check its return value or handle errors.
>
> This patch changes the prototype of bcm_iproc_i2c_init() to
> return void and removes the redundant error handling code after
> calls to bcm_iproc_i2c_init() in both the bcm_iproc_i2c_probe()
> and bcm_iproc_i2c_resume().
>
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/i2c/busses/i2c-bcm-iproc.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c
> b/drivers/i2c/busses/i2c-bcm-iproc.c
> index 15b632a146e1..59cbf8b3b025 100644
> --- a/drivers/i2c/busses/i2c-bcm-iproc.c
> +++ b/drivers/i2c/busses/i2c-bcm-iproc.c
> @@ -678,7 +678,7 @@ static irqreturn_t bcm_iproc_i2c_isr(int irq, void
> *data)
>         return IRQ_HANDLED;
>  }
>
> -static int bcm_iproc_i2c_init(struct bcm_iproc_i2c_dev *iproc_i2c)
> +static void bcm_iproc_i2c_init(struct bcm_iproc_i2c_dev *iproc_i2c)
>  {
>         u32 val;
>
> @@ -706,8 +706,6 @@ static int bcm_iproc_i2c_init(struct bcm_iproc_i2c_de=
v
> *iproc_i2c)
>
>         /* clear all pending interrupts */
>         iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, 0xffffffff);
> -
> -       return 0;
>  }
>
>  static void bcm_iproc_i2c_enable_disable(struct bcm_iproc_i2c_dev
> *iproc_i2c,
> @@ -1081,9 +1079,7 @@ static int bcm_iproc_i2c_probe(struct
> platform_device *pdev)
>                 bcm_iproc_algo.unreg_slave =3D NULL;
>         }
>
> -       ret =3D bcm_iproc_i2c_init(iproc_i2c);
> -       if (ret)
> -               return ret;
> +       bcm_iproc_i2c_init(iproc_i2c);
>
>         ret =3D bcm_iproc_i2c_cfg_speed(iproc_i2c);
>         if (ret)
> @@ -1169,9 +1165,7 @@ static int bcm_iproc_i2c_resume(struct device *dev)
>          * Power domain could have been shut off completely in system dee=
p
>          * sleep, so re-initialize the block here
>          */
> -       ret =3D bcm_iproc_i2c_init(iproc_i2c);
> -       if (ret)
> -               return ret;
> +       bcm_iproc_i2c_init(iproc_i2c);
>
>         /* configure to the desired bus speed */
>         val =3D iproc_i2c_rd_reg(iproc_i2c, TIM_CFG_OFFSET);
> --
> 2.42.0.windows.2
>

Looks good to me. Thanks!
Acked-by: Ray Jui <ray.jui@broadcom.com>

--000000000000d4c002062c39fb3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 21,=
 2025 at 12:49=E2=80=AFAM Wentao Liang &lt;<a href=3D"mailto:vulab@iscas.ac=
.cn">vulab@iscas.ac.cn</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">The bcm_iproc_i2c_init() always returns 0. As a resul=
t, there<br>
is no need to check its return value or handle errors.<br>
<br>
This patch changes the prototype of bcm_iproc_i2c_init() to<br>
return void and removes the redundant error handling code after<br>
calls to bcm_iproc_i2c_init() in both the bcm_iproc_i2c_probe()<br>
and bcm_iproc_i2c_resume().<br>
<br>
Signed-off-by: Wentao Liang &lt;<a href=3D"mailto:vulab@iscas.ac.cn" target=
=3D"_blank">vulab@iscas.ac.cn</a>&gt;<br>
---<br>
=C2=A0drivers/i2c/busses/i2c-bcm-iproc.c | 12 +++---------<br>
=C2=A01 file changed, 3 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bc=
m-iproc.c<br>
index 15b632a146e1..59cbf8b3b025 100644<br>
--- a/drivers/i2c/busses/i2c-bcm-iproc.c<br>
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c<br>
@@ -678,7 +678,7 @@ static irqreturn_t bcm_iproc_i2c_isr(int irq, void *dat=
a)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return IRQ_HANDLED;<br>
=C2=A0}<br>
<br>
-static int bcm_iproc_i2c_init(struct bcm_iproc_i2c_dev *iproc_i2c)<br>
+static void bcm_iproc_i2c_init(struct bcm_iproc_i2c_dev *iproc_i2c)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 val;<br>
<br>
@@ -706,8 +706,6 @@ static int bcm_iproc_i2c_init(struct bcm_iproc_i2c_dev =
*iproc_i2c)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* clear all pending interrupts */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, 0xffffff=
ff);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static void bcm_iproc_i2c_enable_disable(struct bcm_iproc_i2c_dev *ip=
roc_i2c,<br>
@@ -1081,9 +1079,7 @@ static int bcm_iproc_i2c_probe(struct platform_device=
 *pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bcm_iproc_algo.unre=
g_slave =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D bcm_iproc_i2c_init(iproc_i2c);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bcm_iproc_i2c_init(iproc_i2c);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D bcm_iproc_i2c_cfg_speed(iproc_i2c);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
@@ -1169,9 +1165,7 @@ static int bcm_iproc_i2c_resume(struct device *dev)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Power domain could have been shut off c=
ompletely in system deep<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* sleep, so re-initialize the block here<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D bcm_iproc_i2c_init(iproc_i2c);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bcm_iproc_i2c_init(iproc_i2c);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* configure to the desired bus speed */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D iproc_i2c_rd_reg(iproc_i2c, TIM_CFG_OFF=
SET);<br>
-- <br>
2.42.0.windows.2<br></blockquote><div><br>Looks good to me. Thanks!<br>Acke=
d-by: Ray Jui &lt;<a href=3D"mailto:ray.jui@broadcom.com">ray.jui@broadcom.=
com</a>&gt;=C2=A0</div></div></div>

--000000000000d4c002062c39fb3c--

--000000000000d8dc62062c39fb16
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YVhHgdTTB3aAzFyz4UFRLwxCzIG7d7GIiB9MoLImssS08R5WQ5EJCd1fAF6iefLupAn/plPmn2w0
GF8bLF/FhwOn8jObLW5pQiKhjQSv3QIDAQABo4IB1TCCAdEwDgYDVR0PAQH/BAQDAgWgMIGjBggr
BgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9j
YWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUFBzABhjVodHRwOi8v
b2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMDBNBgNVHSAERjBE
MEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20v
cmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRwOi8vY3JsLmdsb2Jh
bHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAfBgNVHREEGDAWgRRyYXku
anVpQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBSWM9HmWBdb
NHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUIScG7uNJuCYBQieQC+eonQS9tdkwDQYJKoZIhvcNAQEL
BQADggEBAGLwq/sDtwLmkAa5/UpIG4o5HA9EH7SaYi05EUlzrDdIeZsJnXDkxmG9144wNZBbndHx
nKXRnpJjCX4jhZeNQFyY4m5c9c8bMytO4zb8XUJIxCjqkhtukJtqHieEogwGsmZlpOxt6Ucc2JXg
6oTTbyITD4Bvn7cFb7EI2FBcT7K8bf8AvwtNLl/dKYtUA/nEvVhjqp0wsDL3t//Q3GTwGWZB41gf
LC04V6gD9TVFl7i/N48Gu8PzTt4Kt0SZvBr7kQ9PKi7DVyXe23Ou89QVflaja3bPjt2UZCyq0JxJ
Nu5SjFDWjKlBCzbLDGkCBlM4DpjAb0y4MyKOsiVv7vIxNlYxggJtMIICaQIBATBrMFsxCzAJBgNV
BAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhHbG9iYWxTaWduIEdD
QyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwcAgHcg4j27cIp1UUwDQYJYIZIAWUDBAIBBQCg
gdQwLwYJKoZIhvcNAQkEMSIEIA3vtwQQpW2c6yWrxl5y11HOUxdybzcYDyBcMwZGT0lBMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDEyMTE2MzY1MFowaQYJKoZI
hvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEF
AASCAQCazFTy/UxsOTl/eRtYHAmFctJTsC+4HRtbDeEIehNXVfd2qxuCbEfxuAKVZkxa6UnS/Snk
mkHmnG1B64L7kcisSMtWBy6uO8EBWi/+3wFKpv3rQq/WP+O0+L6WrhUZhg2lW4dhH8WfXyw9DHK8
w04KbXHb1NYMCgAKgbtuWQ8xVsouUxOlMGRI8CFGWQtMYaGtPavzb2wynnNZy4rWLpyU9IiJUslE
6ay4MmmbaQI4Y1Df5N0fdayM2pg2BwxfDPxYQtoCqX2hnW1DCBryyMnCNaWQBOzBK+jFNPCn61F9
nnfFiIW3wbPXLYPddQourI/iQYrMSKcynaeF5UTT1pRA
--000000000000d8dc62062c39fb16--

