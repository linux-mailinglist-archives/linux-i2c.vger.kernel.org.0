Return-Path: <linux-i2c+bounces-8889-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4695DA0092E
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 13:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F28218839A7
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 12:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C651FA144;
	Fri,  3 Jan 2025 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSC+AYhq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A011F9EAB;
	Fri,  3 Jan 2025 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735906943; cv=none; b=F6AkcUHmxzzvvGUPhJl+0jux2k0d0/fklS4BA7/Vf7RxMpYoXFmQpJ4pwpYT6Gmo5HvRtufwvFkJDAdTUVN9K2OhYn+/kz/RAtlv+Tz0N0o/dtgQ0j2b+EFKDlP8LFa7pV6YXRdf3NIvfoxvYzDNcGgIUwSApViIosbLbmnQvlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735906943; c=relaxed/simple;
	bh=ImaIoelHIX1sWqmvDE+d2Qq1gngnZKfBDSpE8ejsmZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWefbKq+EaLt3JrDETrFO565lX+dDOqcYTGrdcgAfnuwl3L5wnKx1H4LgljQZLgzeEdO1BxW0IJAxuEBek7QvBX1DhUumJtUNQ14e2/cjK1K1iJUnIX26G0/wKPkmY2oLnMqho4KEgBmPyLHxy5naU9V5o2fWwpjJvdozpHxnyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSC+AYhq; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-518ae5060d4so3563230e0c.0;
        Fri, 03 Jan 2025 04:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735906940; x=1736511740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEwomEMmAZ1rFZMeWgRtCAYpGeB0XoZkMU3WaXHeq08=;
        b=DSC+AYhq+ItBtB4MJKQcl2Gu2HdH94qJO2cNRZxFJ6QuQR2kDd0p3KNgIzoBZTgqG2
         G5YV5Z3IEQIqH8KYidQBV1U4sMvRbJOP7QpjuaAtydskmRbbATlF/CPaEx+3+8eDxlWd
         GNmKO5jefFYCB5v8dVcoIyY6mbaVhd+DhHYl+hQzBL5AQVfeg+8rclHK3OeAvHvuiLTv
         q1WsP40P28xlneY287jn/JS5yqPrJUkLRvkLOXZhCCeS6BQhg+MJpmmm+y/DmXg+eNYR
         MmdVYtnGvKqhK1JjNuDewQx8a6/Mp9w8sOtUveTvYpUz5r34Jd1QtkMHSvN0eeTDmoMx
         j3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735906940; x=1736511740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEwomEMmAZ1rFZMeWgRtCAYpGeB0XoZkMU3WaXHeq08=;
        b=k3bTeO+v6H5fqnbREJ7nldSefWZ5dA4rjIOwvqRYExv0X+souslxlmomaM+3uUPMVb
         66Ne1nL/bpPTn+RG2tGB40QS6y2JQUD17Azj1f2L2j5i3pDwOlo5Gvn9UopwyMQOtWdK
         1eASInN5NhnSmXXboP4dwUnDeBr8ODjpONsXzsg0yBg9t9g59J8tv8NTwyesuesJGRN/
         O/GeT1lPm/CbFh60t23cB+Ud/KR00Fnnm+9EEduLhMD34HTXPbh+d8UYP+vI2aFKYv/n
         S+43ODQkFQKX6m8y7dsm31u/0kEVX5sTboKFOx1Y2j45qFRN/t0VRb+vOEHDsd4HUHi8
         yhYg==
X-Forwarded-Encrypted: i=1; AJvYcCVijCEqjUADi9lqPCdHANjD+0ER5udgWmEy2MNa/hPTiPRFFB2OkSe9HpWrWa2VpK6o+UZVoyz2ZW4=@vger.kernel.org, AJvYcCXLda5168XHBDJtBocYfeCcBMKHwTnVAhBWQdw7QiHg1IG1bk6p0isRsg6ZcWLMrVPyr9iXpfTkJ3N+w0ANi+ljS4I=@vger.kernel.org, AJvYcCXPZ8VrlaAPrtq1MCa/hBKqCaIsnjid24JDjwLTocqJtlhNeS80ifsL82HSP83eMBB4RvPk8KjMiEu0rEaN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0vgTldLp9G4brHwMzz/aBPWqpi1OR5dvw5Kh9aiCUDgFU/ctt
	QnAxjaIVCvkwiODsonMvo6DjWT/+NHvXL1pPdr2DChDST/+k21UnMVNZHG4NkpBBldY/Lv57X4H
	i9aucC0L4zxQO2mfavPixbKCGdH0=
X-Gm-Gg: ASbGnctWWnJ9EzKe378pyoOVNyS3i/4Q+1RNMz4R1hB4tToEiZb5BMAjGXzikBWJ9QA
	5VO/pOtXsDUnyKhJtwWcGsTG3MG85OMAIz9JMiXFo2WUzcMOXZCovaOrOGpzYiNYUROHVhlI=
X-Google-Smtp-Source: AGHT+IHxCZ5MUO7Dz37B1LRzm67INFoFHnMzMcPQuSdZrCSkCAg5+1FlkTTBqWOo6Jl1RMeuXUCoFseo+2F1DIbvXt8=
X-Received: by 2002:a05:6122:4302:b0:515:d38a:e168 with SMTP id
 71dfb90a1353d-51b75c6b4bdmr36132956e0c.4.1735906940455; Fri, 03 Jan 2025
 04:22:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250103091900.428729-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWJbdQybi6CBLQD1z1yF1t+C9LyowRnqAAnKV_=zs1Qjg@mail.gmail.com>
In-Reply-To: <CAMuHMdWJbdQybi6CBLQD1z1yF1t+C9LyowRnqAAnKV_=zs1Qjg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 3 Jan 2025 12:21:54 +0000
Message-ID: <CA+V-a8tH9TA9MWGiVOKXjt8hJKM7McfQ6iOpA_WpYKkn_vTVaQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] i2c: riic: Introduce a separate variable for IRQ
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Jan 3, 2025 at 10:48=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Fri, Jan 3, 2025 at 10:19=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Refactor the IRQ handling in riic_i2c_probe by introducing a local vari=
able
> > `irq` to store IRQ numbers instead of assigning them to `ret`. This cha=
nge
> > improves code readability and clarity.
> >
> > Remove explicit error handling after `platform_get_irq()` since
> > `devm_request_irq()` already handles such errors.
>
> Where does it handle such errors?
> I only found the following check in request_threaded_irq():
>
>         desc =3D irq_to_desc(irq);
>         if (!desc)
>                 return -EINVAL;
>
> Although irq_to_desc() takes an unsigned int, it should indeed catch
> invalid (negative) interrupt numbers, but the code above would not
> propagate the correct error code (e.g. -EPROBE_DEFER).
>
Agreed, I had missed that. I will restore the check.

Cheers,
Prabhakar

