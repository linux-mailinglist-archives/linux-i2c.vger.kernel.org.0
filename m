Return-Path: <linux-i2c+bounces-7706-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A4F9B8AAB
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 06:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AB1928332C
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 05:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEDE14A4E7;
	Fri,  1 Nov 2024 05:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCZGEqym"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43300A48;
	Fri,  1 Nov 2024 05:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730439322; cv=none; b=r+d+0nSZwsAYwGbRUaLz8hWvpMdUfbvK/DlfyB6bhT84OVsiPnOwwWRCeYNfXwihGHzGZdLu0j9I5OLJMO8pPlK0NpDw1IpjCSreMNYyrEIAGTya5itYgXFOEP1qF1GmV1Bu7acwpkPdagztpRaC47igEGWk2Gkm9PONL1+sQwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730439322; c=relaxed/simple;
	bh=mF3wB2Jve8vniIrTi1Xu3LFkNp5iYzxBBRHNal2XVNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dh/aM2N+nzz7QgplGDz6yImKHv30OqaUmexRWwJ3umR6jODR738TNnjAjeclaHRbkwbGtpbv5jjT/Ewt+wNELWLBd3YnZkdL/2k1Q2IjNhFbzJN2QN7OYDdDAAI7Df2BjAG/TTXi369q+OhCaIOL9Pg2jT0mWXaSJ1tTzNF0QIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCZGEqym; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e5a5a59094so15449217b3.3;
        Thu, 31 Oct 2024 22:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730439319; x=1731044119; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mF3wB2Jve8vniIrTi1Xu3LFkNp5iYzxBBRHNal2XVNQ=;
        b=cCZGEqymPnBETDPvpPrm/C0UvUww/+/PKLLAQHdHNit8GPGfYCiOEViZozi9Kq0rEx
         bRjiqC42edWs7n2VrKHi/tLeixDpWvzAFwpRogayzmKJupyYB/BzEBK1NdvOfHO0jKOt
         d1SHe2VBiFmP4CGmKW5DqwgIWbBvLgROtGyfkISWpjs0iEG9ooJR4DXljgE4KfS+7e3X
         fOjyri3I0vatF2SwECeHsQEDKnWkqCEd+lDlGgC8q8ysLfh/SG/w/taOE33iev5VlPdH
         i+vd3tl/B08V3wPTTYZQq55NDTPGQuHd9X3P9WPBa5DGRBpLQko3GhRmV/PoPx5++FVp
         0ULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730439319; x=1731044119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mF3wB2Jve8vniIrTi1Xu3LFkNp5iYzxBBRHNal2XVNQ=;
        b=cYjX00J/EIh9AMNS86MPaq5V9LZrabi/DiEPgHyDT6iDNYjb2407a1g2Ey97u/brPU
         I5o1ujE0z4q6yghFqLqUBuFMjAh+Rnv7ZKD/46VxfExp+nlDPTF4nJHc8wEPg9WxF0GK
         em+trRbebQBA2nbHbLQDfybUt24tRQ/9e48fT+op1DzWsM1BUHx8VlvgBx1tXECGJ/XA
         C3MfBShvLc4UYOJzTTawwU4ZyZA9jZHEjCeLM3EXF3vHc7fX55+lz6ybQIcI5pFbm2hO
         8A/ZibOBiTwTg9D4qobsh1Gy45PyW4nu8AXIrt4asdp8xDNshtVUgumfX6yB2T1dSAa3
         m3Xw==
X-Forwarded-Encrypted: i=1; AJvYcCU2FLZxnAHzt0byOx3Ta9zGYb76POv7lzrJuWuUpovtOr+VYQRr/7Gtm+I420pvg4/1iO+XCk/WMda4@vger.kernel.org, AJvYcCUXFOn+PLLogV8p22eJdb2FQbhLrHlXi3PPgMAIPg7uuvyEQlwv9obbJDHH0X08WOurHb2tT3iU9iVCudB9jA8=@vger.kernel.org, AJvYcCV6gjrPz3OqKHMfm02+kZBGGc02wVELf5FldZtrg2D0AN8mf36nPzIJu2AkseKh9ipPVZY7I5GF1zklFYE=@vger.kernel.org, AJvYcCV9JuXtdnQWnR0tzRMcDYSy1KRj9hXhPev/Y7KPITreqhm2X/WCN1RoOdjOmIN/7Jsz4IY6e7OJpOuS@vger.kernel.org, AJvYcCVQqsYDNwnfaJWifVn/rmoCyeMLO3+6F1H4BqPTGZDy1g123YmGW8o479L2clNslqwuYt2YZEUjhZ3Dlw==@vger.kernel.org, AJvYcCVZW1+laTclbX7nvDS6yjq6YqG4wAUAimf6QCCH5dFPe1IlOnsG0v9xPo8xFncb0jYVfVwoCQBPl9gLA/AJ@vger.kernel.org, AJvYcCX/11Gcnu7iZe6RzMU7coJmbwixkp812Wp1YxJ31/i1zckQjECDbekPv1c/7xGMJVTU07RW/9PrQvw=@vger.kernel.org, AJvYcCXhVPpB6+eI3akFNPL0G7mf2ayjdPG+eyVhaR4xKNkZQZ5d4qUbdYRsEkiOzLPc+OFwOP0A0Bp6DRTq@vger.kernel.org, AJvYcCXw2jW6uaX9ZMtbjJXSBkOQy7MDL8ffMVO7ISKgkACpcZFeovErIUj9sRk45P5yczYS4yHftwlY7Z8N@vger.kernel.org, AJvYcCXydXEX9ADXKixVFwTXge2p1D24
 6XExmf+mCdK0N4U0F4/xfSGxRM1trpowdkt6dAsuMP0bKNIU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdr2NnkrAscnGbXJSU3PbHRsuUCtmHeU5kyn/79C2aBqfz7GUz
	PTjCtSA1lDMYKt6UxTS5MlKKWmgkNQVm2oiduxOT8DLaSx1KKzsMi8U1BjmktZdAP/3xMCha0kb
	hnbxMCFTGPUGkTh9dVS5zbP9FkVw=
X-Google-Smtp-Source: AGHT+IHjsVRspkXLMwsYEmdGwWWGIm1yStruCFD+i35y9G/88OmDQfdzXmmSjrklqqMdHbeNzsY2oAGGOZsTre5vDXo=
X-Received: by 2002:a05:690c:600a:b0:6e2:af9b:a862 with SMTP id
 00721157ae682-6ea64acc9ddmr26252277b3.13.1730439319137; Thu, 31 Oct 2024
 22:35:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024-adventurous-imaginary-hornet-4d5c46-mkl@pengutronix.de>
 <CAOoeyxUhnyYG3p+DQJG-tvU5vc5WYQZLLqCXW=uPcXTjq2gVfw@mail.gmail.com>
 <20241025-truthful-honest-newt-c371c8-mkl@pengutronix.de> <CAOoeyxUEf5vjqL67WjR-DbrhE0==2hqHLEyZ5XEBhEfMfQ5pag@mail.gmail.com>
 <20241025-spirited-nocturnal-antelope-ce93dd-mkl@pengutronix.de>
 <CAOoeyxW5QwPMGAYCWhQDtZwJJLG5xj9HXpL3-cduRSgF+4VHhg@mail.gmail.com>
 <20241028-uptight-modest-puffin-0556e7-mkl@pengutronix.de>
 <CAOoeyxU1r3ayhNWrbE_muDhA0imfZYX3-UHxSen9TqsTrSsxyA@mail.gmail.com>
 <20241028-observant-gentle-doberman-0a2baa-mkl@pengutronix.de>
 <CAOoeyxWh1-=NVQdmNp5HBzf1YPo9tQdh=OzUUVFmvC-F7sCHWg@mail.gmail.com> <20241029-fresh-dinosaur-of-penetration-d695ff-mkl@pengutronix.de>
In-Reply-To: <20241029-fresh-dinosaur-of-penetration-d695ff-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 1 Nov 2024 13:35:08 +0800
Message-ID: <CAOoeyxW4Wrnm=R=ygmF1pMvheP++h6aL_rEDOGTxg--ME2PNyw@mail.gmail.com>
Subject: Re: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > Okay, so each child device may allocate a buffer like this during probe():
> > priv->xmit_buf = devm_kcalloc(dev, MAX_PACKET_SZ, sizeof(unsigned char),
> > GFP_KERNEL), right?
>
> basically yes, probably devm_kzalloc() or embed it into the priv struct
> directly with ____cacheline_aligned:
>
> | https://elixir.bootlin.com/linux/v6.11.5/source/drivers/net/can/spi/mcp251xfd/mcp251xfd.h#L498
>
> The size of the driver's RX and TX buffers depend on what they want to
> send and expect to receive. The next step would be to create structs the
> describe the RX and TX buffers for each driver. If you have a common
> header between each driver, create that first.
>
> regards,
> Marc
>

Understood, I'll make these modifications in the next patch.

Thanks,
Ming

