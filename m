Return-Path: <linux-i2c+bounces-10692-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D177AA4E53
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 16:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 205EE3B3EA4
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 14:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33CBF25A625;
	Wed, 30 Apr 2025 14:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAUtO5JM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D4D1DD889;
	Wed, 30 Apr 2025 14:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746022771; cv=none; b=IGWvjdGQhBs0FJ/CH56FqcuEjnyumKTaJmJ2ws2vIzBfOIbg71OAffBbwtaG5JLED9wtmb83kCekh2vOfK///vSwzZF0I6GunPc19Fp8zIJtRej20SQQTy8TW8vaTNeyELsEn4PsZMYjvC8TT+N0jivTwOu/OXrNwHpNbTfyKc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746022771; c=relaxed/simple;
	bh=qYXytSF/h4BAw3XvCix160+CM+1Pr/rGmOL9cZ5Dxso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=CZ6x3Ft5mB0QZyKKDSo+I2lf/Na5gCn06haTkkAKybNrc5LSrINUnYKH9AAy0tDT9SayXGHgc6L4TVmjbSb+7mwjOTPoTfa3KOkuPD3r/Zm8lBJEgLrrTV4SjfBzaqy8A3GMgy8g4bePjAuSq5mSNqfiN1ysbNCzTRJBHhvh3iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAUtO5JM; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so5235748f8f.1;
        Wed, 30 Apr 2025 07:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746022768; x=1746627568; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYXytSF/h4BAw3XvCix160+CM+1Pr/rGmOL9cZ5Dxso=;
        b=mAUtO5JMi/9lo6gqEhCRE3995IttP0ZwlCWCI44NoPh/7eosa7nofiG/Zg/THKyyki
         bB5/63u5tPnlOI6slKSuxQRl74t7pEfUNAw9Wg79V5YvmGHesCQnh89xNu3iyBLpVehD
         qrtgfb5uF11Id6lap1oDIHKeOdBa+xB62m5Ey+IiT0hq/6A1fe3akA3Y+nvQMpk1Dxmr
         ALQD1qiwu6hVUBUBjuHg9f67F3OFkCt2HpVIqpmD/L3Ms5nHdhIsKC7DwGiPeryX5NdP
         dSJOetjlCnYQXF0tqGPeveQf3p0SPlkYWC1M5OYO0GOKQk6+sw2hp8TVUr4ctLQpkuZP
         995g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746022768; x=1746627568;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYXytSF/h4BAw3XvCix160+CM+1Pr/rGmOL9cZ5Dxso=;
        b=fONCBVBhkiitkeiA1s814phD2/hrUzmMGF8s6o82RSxfB9qs8BrHkT4yzfv4Vza2tF
         KPH+JPYGRypuRVYwqGgM/R6NBfSsBm23CiTNWPklnFQrBkPJdiN0cRtDNRIPZy8+wkFO
         I8DqORaanjSzae1U8RTkmTveYz/HDd2pzlkMdR4IyDETHWyBxBi4JjMI4b4odR5IfW/1
         Pyvpr5cRIj3jkguJhRQrLtI4Vem7acbxo0WKm/VPwmb30D+J0N8W7QvW3iNPQoRgRsxn
         vb2nUBngZFu/epjS/dlZfFVLLG1nUtotSBIwkZWtm/irDs5hJPUHZ0uQIHo7G3oi4//H
         Ueww==
X-Forwarded-Encrypted: i=1; AJvYcCVhy67+bbKvER2T39hVHC4Cvat0WDcFQQztxv+H11MyHxn9xSH6GI0q4HrZ6IqBxDVG7fM32cqWB4OV/U08FAXLMTg=@vger.kernel.org, AJvYcCW3UYWItPc80imRcATQM0+BHdCmArPmFtHV7mJHg/zT+vCPLqmfYiYFUojh1DRO2UIzOVcDMgO17OU=@vger.kernel.org, AJvYcCXWtSygCiMblCAnA9tO+IHPnOxNG00dZLblxmAR0ylsbrhKVmLKjzd/npfEi3J/45PEaD3bUlVDZXvtDCXv@vger.kernel.org
X-Gm-Message-State: AOJu0YwVe7fcm9H4l8AS0MPz+fm8RDCW+LMdPq9wnBEhAvJBqUegIUPl
	tI9H+B7E3ipvNv0MUiQyRHulXMN9ryqpmMr/GxmoZbTAFtGr5ZQX5AT0EzOSgF4DSfq8DwG0A4S
	4hV6KrsRYQ2fq+xr9oli7PK0CqZg=
X-Gm-Gg: ASbGncvvh/iHoQaTFpClqhWzjgaKQVM5NkR7p6O+FFdEzVnAzVTkJhg1eYkVlgp9THK
	s2Xjsk9RfpEESfPMUGPcI+QnPW5oMSfyTl4QqcixIunbegHFo9IDZJ7JpheWfTRpkmragc+YT2j
	BzI9KQYD/UW+YoANYix6bUow==
X-Google-Smtp-Source: AGHT+IHeVVx97jV8CvcEwLno1fQedZbosuupGPjGSFQ/trOVbpjS3wz2VStDQdszZITBakzfY8RQp7A9SzLo5OCvsso=
X-Received: by 2002:a05:6000:310b:b0:39e:cbe3:881 with SMTP id
 ffacd0b85a97d-3a08f7549f2mr2811481f8f.12.1746022767422; Wed, 30 Apr 2025
 07:19:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407121859.131156-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aAC8f0dAMERD8GjW@shikoro> <CA+V-a8sM2mFS--zLSZt28mOUDuO2FpW0TsaV50A_VxFZ-juP4Q@mail.gmail.com>
 <aAFgwEB4SdgH-1fQ@shikoro> <CA+V-a8tmTqFi4iqGhR3cfUgKw7mxJrm6ixGAHq747ptrL3t2jA@mail.gmail.com>
 <aAITBfrOI0GAhGRA@shikoro> <aAikKreK-BCP-zLp@shikoro> <CA+V-a8uHxfmJLOO25acfK2=EZt41f_G6LShNpeL9RVy-X=Q3Cw@mail.gmail.com>
 <aAtSayFrtSh9LC-J@shikoro>
In-Reply-To: <aAtSayFrtSh9LC-J@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 30 Apr 2025 15:19:00 +0100
X-Gm-Features: ATxdqUE44CXC8WnKFwq3_VVnLNnAIvGPlZ2qSZSscL6iMQzvtr-GBdjlm2x7PMc
Message-ID: <CA+V-a8smaANOtJ9ETNudArHUcwvOAnKB+fEeEFnb_5ioxFSMKw@mail.gmail.com>
Subject: Re: [PATCH v8] i2c: riic: Implement bus recovery
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Fri, Apr 25, 2025 at 10:14=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Prabhakar,
>
> > I prepared a setup on SMARC2 RZ/G3S and I can confirm it is working
>
> This is good news!
>
> > (but this is failing on SMARC RZ/G2L I'll look further into this)
>
> This not so much. Hmmm, are you verifying against the same I2C device
> on the carrier board? If you compare against different I2C devices on
> the module board, the culprit might be the I2C device.
>
You were right, it was the slave indeed. After recovery from the
generic algorithm during the transfer I am seeing arbitration lost due
to which there was a timeout during transmission. So for now we can
conclude the generic I2C recovery algo works for RIIC. I have tested
with two slaves:

- PMOD RTC on SMARC RZ/G2L
- PMOD RTC + Audio codec on SMARC RZ/G3S

After tidying up, I'll resping a new version of the patch.

> > For the SMARC2 RZ/G3S to make sure the I2C GPIO pins behave as
> > opendrain I have the below patch for pinctrl
>
> Do you really need this patch? The GPIO lines are wired to SCL/SDA which
> are already pulled up. Search for R118 in the module schematics.
>
Agreed the pullup isn't needed. This was needed on SMARC RZ/G2L as
there were spikes.

Cheers,
Prabhakar

