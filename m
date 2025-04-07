Return-Path: <linux-i2c+bounces-10121-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBB6A7D2BD
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 05:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2A1E16AEDC
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 03:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52EDC221DB5;
	Mon,  7 Apr 2025 03:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1Xs6AV8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89062213256;
	Mon,  7 Apr 2025 03:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743998265; cv=none; b=OZrO5mNdcfZudds+GXSR7/ivoK0BST8k8M4DkOeHhyOxb4eDXDkCYHJwzJibwV1S/gzxTwJd5sWOPrgBX3BKfhruqWeVwiMchNJIOhsE7zUx4El587colKVtSgdpbExy4ED80Vhv6hNwkExF41CPDE8q+2YIJNdDQwR3DYW9f0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743998265; c=relaxed/simple;
	bh=Zl7zJlRHgV736TLgTKSkNSPMJeMp081ivuzgtiRLpB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1GneEsxBWHEsTrTx864ZG+MLGYuG32oXhRoGL46RPhEI01zfp7AsmDvNlJwPTbmhVSnm4ZUMPtaofTkl+zsqMHS59hkxTmIOEkBL60+SGzPri0iXSL3ObA3vjskfu+Nkfr1ag6ThBghQklnC45pIfs4NIBv8VsbkwjLoWDZ1Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1Xs6AV8; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c081915cf3so510581185a.1;
        Sun, 06 Apr 2025 20:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743998262; x=1744603062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R/CY5XdipwMeKeAFsG+OcOmPd/+b3qIxz+N90akQpaE=;
        b=P1Xs6AV8Dy7rloJWg3JSNzrT1AjaKHs6PzCCrbSFJsC5uv6d34CFozMXztH7Cgaieu
         /1tPSF8KJLbE8lyiz2NRXc9+QWpf6QB0Oa7ZXDQ0U6LFaAAtEhVD8tkTt7Haow5cGm+u
         4I4DwSEE0TaIgdEN02BvuEalhKyZxFFVjMMG/ZWIGcatZK00VePgfrvHFsW09deBFJ6+
         d4AVQuSnuG2dSh12Hn9XWt/3zpj5GBV+qsTKn/PoJVEajHTLD3rHqY99lT/rjGpL5Qj2
         yWi0wD0XaV1xGurogbSGPxp1o1vfr2Ec/bDzBM7Kc8GbTpg4gOH184Vj+YLB/jwOh7uX
         ssjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743998262; x=1744603062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/CY5XdipwMeKeAFsG+OcOmPd/+b3qIxz+N90akQpaE=;
        b=vKYG+Xb6qtcf8g8H6fpZifND9gOYDUVfC6B+4altGZxMQJtdZ+vVCXwhgmnkKJR7S3
         /DACFOzxwTPDar3oVmOM0ehMjpynYHF9/F0lZZYKYQEyzJkdlfKXyQfblpuUnoKfrfXI
         eAkcdmLsKrAjRWq3RnkEyYST3NWJ7XKwjYI9LtJG42clpfVjNb6r+3JVMY0m+HDGN1G1
         fsC3LQZx1dddxN1aW2WzTRO6nlzps63hcJOvySRQCnh60PHWiMrn9m3jt0pNBozHaryT
         RHf1YXRLR5T7xBRKWVkH1xXz331sUceMfPjIec7YrPjreBhe97R8m4Reht03yO/Qra4q
         kjHw==
X-Forwarded-Encrypted: i=1; AJvYcCUdP2bPmD5tsBfR+CR5x4+HO45BorK6BZtLHexFyQOczZP8C6yDKl42CbHvRkbqqJUdf2WjLDT9fvAfb8jb@vger.kernel.org, AJvYcCWveuQ8g9PuVXe8jzv6nm9KJb9ghZ3TJ2BvrOI2jP87RU1tIvfCT+Fxpbum7PbIGy3MzlprVFUhqU2Z5nY=@vger.kernel.org, AJvYcCXLqVN1vo51zkxFuuXfzF2AtFf8fLIx2lifKi62UtJ9FU8gpZ5oV2Q9sJCCC8xDHzOfeKgLbKBmInL8@vger.kernel.org, AJvYcCXTbbvp+O2BvAvlA2dsOPwJCuEER3VBlOg77xeyCMDMk7zSyDcDbYwSssrcdouYeQRxzqf879ur2f3r@vger.kernel.org, AJvYcCXWXoCVR/6m0yaYrdmYYP1JGun49eLb76WA1rm9gBwiwIzszFy5+JdIpEB9Y7AF0EJb+X6XoBVP9zz1@vger.kernel.org
X-Gm-Message-State: AOJu0YxAN/c0I1CLSIPbnmxzgCG56trv9jOTfuS70ZJXtlRfRd9Na+5U
	4Yl5rlipjxORUZ1SkoE8odczbU3eflrRVdgVSAUg5aPnNM6tRwXN
X-Gm-Gg: ASbGncvrVHPGhjeTAF5v/909DT2s08kuwWebU0h6uXovVQYdf2g3hsZhMx8TUR8GOK8
	r+4PWqXw373QxWZ3BaeNaZdG0ch2G+nfxxio8yAX06XzyBb6yCNe4RUwP7LNFkqUQkApUi2EYkQ
	uyT38vADe7AXX9T93hMAJ0uIK0QmNl/9SRo9vObZJBqg8ykCW4BK5icHq0NdIxm2jOw4z6w4Z50
	n7HT5ZDynQfjyKrzU7TNXr0cfLtwFRIe/O/X0U0AaLDVjcSeoAiUSnVeLThJz7NOPjHvZthauen
	EiyGvbwIODJNxTNdWZPs
X-Google-Smtp-Source: AGHT+IG7S6m/etaeZaD9RBkFsyIrUD+K4SGfOdf76m1VNO2dvIgZVgFhj9vXuuhtf1aG6Yd6cTKDpw==
X-Received: by 2002:a05:620a:1a18:b0:7c5:674c:eecc with SMTP id af79cd13be357-7c774d718bfmr1429782085a.32.1743998262320;
        Sun, 06 Apr 2025 20:57:42 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76e75a605sm545114585a.29.2025.04.06.20.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 20:57:41 -0700 (PDT)
Date: Mon, 7 Apr 2025 11:57:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, ghost <2990955050@qq.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 9/9] riscv: dts: sophgo: Add initial device tree of
 Sophgo SRD3-10
Message-ID: <geunb7qwiniferytaufnekojx2eoq6g5scu6mddwf7gkspxucs@yynb6kfbspje>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-10-inochiama@gmail.com>
 <20250407020945-GYA13182@gentoo>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407020945-GYA13182@gentoo>

On Mon, Apr 07, 2025 at 02:09:45AM +0000, Yixun Lan wrote:
> 
> On 09:06 Mon 07 Apr     , Inochi Amaoto wrote:
> > Sophgo SG2044 SRD3-10 board bases on Sophgo SG2044 SoC.
> > This board includes 5 uart ports, 5 pcie x8 slots, 1 1G Ethernet port,
> > 1 microSD slot.
> > 
> > Add initial device tree of this board with uart support.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/Makefile           |    1 +
> >  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi   | 3002 +++++++++++++++++
> >  arch/riscv/boot/dts/sophgo/sg2044-reset.h     |  128 +
> >  .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   32 +
> >  arch/riscv/boot/dts/sophgo/sg2044.dtsi        |   86 +
> >  5 files changed, 3249 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-reset.h
> >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2044.dtsi
> > 
> ..
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2044-reset.h b/arch/riscv/boot/dts/sophgo/sg2044-reset.h
> > new file mode 100644
> > index 000000000000..94ed1e3777c3
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/sg2044-reset.h
> > @@ -0,0 +1,128 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
> you might want to use your gmail suffix? IIRC your outlook account
> isn't preferable? besides, it's better cosistent with your signed-off
> 

Yeah, I forgot to change the copyright since this patch is wrote 
several months ago. I will update the copyright for this patch. 

Thanks for reminder.

Regards,
Inochi

