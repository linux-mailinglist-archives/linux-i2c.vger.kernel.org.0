Return-Path: <linux-i2c+bounces-6630-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E97D976F62
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 19:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50F3F1C23CEF
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 17:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B151C1739;
	Thu, 12 Sep 2024 17:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ww89bcac"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F72E1BF7FD;
	Thu, 12 Sep 2024 17:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726161190; cv=none; b=bIzXqv95Dnl0r+l1sW6MG6Q+HVqFi8iu3vJnhZdNGdwFmetrGcN02D8bipBmo2Bh5hkt7xRqfpCN9kpO/FX5pv4hpPDtUt8XX+m2Uj+X1WVHcpxqqahTzAwLrpC7K6OHHpFkHTu77/4KYEH0AuQ1reZzLYj3vNv8cxr8klMPtkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726161190; c=relaxed/simple;
	bh=Uh2MxIxQ/yGhdh3W/Q1aIvKCfw9Pnc/lIfCxLrWsy4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPX80l/dSsD/TcWe9wxv2Vg3JSqWDN10FtNjRo9ypYnVYCdD0HeOwY1w1pZ268+OwKWTVu09Nih8pYFTH0cgwPa3Fh374QrR+tTdkL/gaowUGAaCNopiYtsvWafpr4nnKmXfwwzXD6jvY7CgT/F0iBf9QYB48wYgM3Zifc8lrac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ww89bcac; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A20C4CEC4;
	Thu, 12 Sep 2024 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726161189;
	bh=Uh2MxIxQ/yGhdh3W/Q1aIvKCfw9Pnc/lIfCxLrWsy4s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ww89bcac5RMM9LfT5E/Z5uGSK/+90DPIRmLBZUx6j3iXShdS0pjEDs2vRwKor0zWl
	 9o8AsmRiUUbYDijvRS6VnOsKVjmxmhlRdsPt54iwbTlsVEipFOBQ9Ay7954RVN86i6
	 Cb6cL/y29QnEQGJZ8/0Rs/5X/kXAheyHtSp0pvWVIThgpKSCjcDJXt31tc5mMx4qR2
	 SUsYztGc5+b+bCZh4hzNela0vG+Uj2/wAmxOXjocYcLUkzlUJ9OvzpSDReHIwVejg8
	 LKpPbCUGIYzWlyCPwv2K+ga3fV8+tK9h1YBlDzKafO6jh3EqxMSgZUG+aBsu70Ojf1
	 JJBvdVNwoX/BA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso17485691fa.0;
        Thu, 12 Sep 2024 10:13:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDFXlpWNnJ/rvuL4aidgM743FjTHF0EC6Z3bFHAfHyMMFbfuwVJzt7TZ7ZMXZpDtUpp0F+8htHLoEk@vger.kernel.org, AJvYcCVt6VWLmNAM/IjqmYS42UJS3kZW+FdWEc2iStqMNj2QFuIJNd7LoDedGqdc8YuZNX4GDGhdsVh0@vger.kernel.org, AJvYcCX9+uiGmEUGigOJsJHc1Au7qjVZN3bCDS0BVdYnvYyLaPW8gcpP3Ys+xjEACfQTRRb+GAl9I4WwX4SFGEYx@vger.kernel.org, AJvYcCXw9ILgpbzwZFISSNQaYjluPG082ROQYvW1Qde5lzO5jt1w2uk03cmVgQGuFAirq/a5eJzsROfP4gbsEV2Gbbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkEiklvmsY+TP2YAqe2LeSJeCzP0m3ftYqMAAazu+TWBf/IWmI
	LuY4cucLsdJ+Q9r33S1xIb7MPDig86sgqtWvpVzy0LIn1oo1dT4jp0lTpH0pHbdvYkUdfKElKXD
	jkw0bRSLkukLXsvqYN/eH6lbeW/k=
X-Google-Smtp-Source: AGHT+IGIUFkqvWaSQ8T5GIp3f+JiV+Kxa64xAgUUR7OTFLlYkfi4JdHSKeXIy5ianI3Ta2mcOwvpikk+DcC65vzXGog=
X-Received: by 2002:a05:651c:b0f:b0:2f1:a4a0:86a1 with SMTP id
 38308e7fff4ca-2f787ddf3e0mr22206901fa.20.1726161187917; Thu, 12 Sep 2024
 10:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912104630.1868285-2-ardb+git@google.com> <5ed76217-c30e-4b9a-9462-0dbd859b2a79@wanadoo.fr>
In-Reply-To: <5ed76217-c30e-4b9a-9462-0dbd859b2a79@wanadoo.fr>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 12 Sep 2024 19:12:56 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEYpD4LdZ9jQebyViWW98ogX7=tKzQNLNZxdBUORgpnQg@mail.gmail.com>
Message-ID: <CAMj1kXEYpD4LdZ9jQebyViWW98ogX7=tKzQNLNZxdBUORgpnQg@mail.gmail.com>
Subject: Re: [PATCH] i2c/synquacer: Deal with optional PCLK correctly
To: "Marion & Christophe JAILLET" <christophe.jaillet@wanadoo.fr>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-i2c@vger.kernel.org, stable@vger.kernel.org, 
	Andi Shyti <andi.shyti@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Wolfram Sang <wsa@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Kernel Janitors <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Sept 2024 at 19:11, Marion & Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> (trying to merge t and cc fields from Ard's and Andy's messages)
>
>
> Le 12/09/2024 =C3=A0 12:46, Ard Biesheuvel a =C3=A9crit :
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > ACPI boot does not provide clocks and regulators, but instead, provides
> > the PCLK rate directly, and enables the clock in firmware. So deal
> > gracefully with this.
> >
> > Fixes: 55750148e559 ("i2c: synquacer: Fix an error handling path in syn=
quacer_i2c_probe()")
>
> Hi,
>
> If that matters, I'm not sure that the Fixes tag is correct.
>
> IIUC, either it is a new functionally that is added (now it works with
> ACPI...), or if considered as a fix, then I think that it is linked to
> commit 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C
> controller").
>
> I don't think that 55750148e559 introduced a regression. The issue seems
> to be there since the beginning. Agreed?
>

No.

The original code used IS_ERR_OR_NULL() to explicitly permit the case
where no clock exists at all.

This has worked fine with ACPI boot for many years before this fix was appl=
ied.

> If yes, then it may be needed to backport it in older kernels too.
>

No, it used to work. The fix is what broke ACPI boot.

--=20
Ard.

