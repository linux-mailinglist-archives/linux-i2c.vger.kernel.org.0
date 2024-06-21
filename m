Return-Path: <linux-i2c+bounces-4195-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 338CE9124CA
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 14:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E308E287199
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 12:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0D017554C;
	Fri, 21 Jun 2024 12:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="bwNl9B2b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AD6174EC6
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 12:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718971698; cv=none; b=BujFPO2P4dwm8ApmReU4fM4WZAgxmv7F+0LaLugW/d5IIL7ja53mIux+mBQOarbxyAClS1Btu38hPuQakW6TvIxvbZyFDPOhEEYxSXg2YazX7Tsw0FZMG6yolQpA5tUPFArIelArkDGlBVaHPVt07Jd3niJ3wd2RTtzZX+Er1GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718971698; c=relaxed/simple;
	bh=5CsIqk65T8h28pv7LSZHK/r+thMfNFgpmh7VKRl0UWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t7bCvCMQwXV9Y1kGyuyOIX0un0JZ2L0KriP/mZ3rJT3pHhqKuvgbNh7qj9c3sUzNbn12mpusPbDZ2QkPMV+fjDs6jlbY5AujYXE2181lc/qtafOgauoML143qSqfOEksn620Zrk10OwrKP0O8suME1Kx7Y+gUj52dtoFD0TQA60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=bwNl9B2b; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7960454db4fso123516885a.2
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 05:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718971694; x=1719576494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CsIqk65T8h28pv7LSZHK/r+thMfNFgpmh7VKRl0UWQ=;
        b=bwNl9B2b5uBkts+d4e1DdRjRmxBlNK3fTwlrYckofd8DFZRyHpP+wuYJNoiJFzIY0N
         6J2XMZlIWqrBJdPaUYzL7AaytwBd2cv+HOibYo5pDM/cXmrBDsHNLJJg2+DNxDbfTG01
         PGNcSY0E5srlf0xby1j0hw0vKWRgAxMKkG1uK9hQshCVklS2nrHA+8JMmi+OcLH9ExEM
         76uZVM00QNMp5apgZUS8HFiWsw1t/COUYq6QZDqgb2TK+SDiYiCU5xgaajdsU4GHyF4a
         TgfV1+fSkkp2MooWuTU1LdWf577gqcZAi+/zsQBwMkDc00qjp1XBC1jfhw4NHZJs/Mg0
         fn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718971694; x=1719576494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CsIqk65T8h28pv7LSZHK/r+thMfNFgpmh7VKRl0UWQ=;
        b=mh3rtiN93O3qZsl2lLGwrDKM+pREs91b9HtT/GIWCn6gWwUHZvUrAQvcf1Mv9eROwL
         uPjTU6X4YQ9R6iKX5ZyO/ehtzcb0AI9RpNdXM7VBmMuBvDBwsE7eB3G4vTUebm838YNy
         JpoAK3VV0/VVfBpDGrFT9Ek5Uy1J9cS6VC8lD3qWUnRH1PzNBz+RfEcI5nTxVggM189P
         vcFtleBJ0AvZAArhav6PoFWdTBeMeRmqg2uO2zE8UpZ5bSMZ2zDbfYQRd8abTRs+xzYv
         Oe+3N9BLtfRxu1eK05owzO2Rsl9E9gtlZz6PwBCFnu3n4oFnVdGTUopN9aE7uSthdbYR
         eCLw==
X-Forwarded-Encrypted: i=1; AJvYcCWbB+kZuRGqW7t6mDIo3/SDa+k025OgnRFOjsYK/iM47xJ6In/Xe/b0ZtVuGOgiCo5sOjToEgYyDbqPLsGz7eU10ymeZW/vQMJ8
X-Gm-Message-State: AOJu0Yy8bMY/wkCTygX0QU452l6npF1CQb9HFg/OGAf0WGyPiFZPyFre
	Dw5wbuQQQtfcU72Mm0Mk2t44cYoTLu2jzPPApNKp/3yFgcz8d7yC5b/1H0dNBaZM3zFpcegZKM4
	8/Gl0+kWtznkHm1Vo6cDtoZzsO6jHA+j9MnkHuQ==
X-Google-Smtp-Source: AGHT+IH9SeiO8vfdoOxDABbDkc1VlJaHvluIQfS8YUVwP2eXorBPvqf3BAKJdJfTNAn0CNJ3/z1faNaXrP6fson02ac=
X-Received: by 2002:ad4:4245:0:b0:6b0:6629:bdf9 with SMTP id
 6a1803df08f44-6b501e2c710mr72849356d6.21.1718971694039; Fri, 21 Jun 2024
 05:08:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com> <jgqhlnysuwajlfxjwetas53jzdk6nnmewead2xzyt3xngwpcvl@xbooed6cwlq4>
In-Reply-To: <jgqhlnysuwajlfxjwetas53jzdk6nnmewead2xzyt3xngwpcvl@xbooed6cwlq4>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Fri, 21 Jun 2024 14:08:03 +0200
Message-ID: <CAG+cZ04suU53wR5f0PhudgNmkxTRtwEXTS1cWH1o9_rTNM94Cg@mail.gmail.com>
Subject: Re: [Patch v4 10/10] i2x: pnx: Use threaded irq to fix warning from del_timer_sync()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"J.M.B. Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>, 
	Li Zetao <lizetao1@huawei.com>, Chancel Liu <chancel.liu@nxp.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Fri, Jun 21, 2024 at 12:57=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org>=
 wrote:
> On Thu, Jun 20, 2024 at 07:56:41PM GMT, Piotr Wojtaszczyk wrote:
> > When del_timer_sync() is called in an interrupt context it throws a war=
ning
> > because of potential deadlock. Threaded irq handler fixes the potential
> > problem.
> >
> > Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
>
> did you run into a lockdep splat?
>
> Anything against using del_timer(), instead? Have you tried?

I didn't get a lockdep splat but console was flooded with warnings from
https://github.com/torvalds/linux/blob/v6.10-rc4/kernel/time/timer.c#L1655
In the linux kernel v5.15 I didn't see these warnings.

I'm not a maintainer of the driver and I didn't do any research on
what kind of impact
would have using del_timer() instad. Maybe Vladimir Zapolskiy will know tha=
t.

--=20
Piotr Wojtaszczyk
Timesys

