Return-Path: <linux-i2c+bounces-9454-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CA6A35868
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Feb 2025 09:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 995E43A58B7
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Feb 2025 08:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740CB22155B;
	Fri, 14 Feb 2025 08:04:51 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70F31632C8;
	Fri, 14 Feb 2025 08:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739520291; cv=none; b=eCjgDdXRhfe3g5trCDAgib5OKOjjXRkiiq3svNGw724RkAd0q1qyiwUZUK/csg/vvbivNaBaFQcNeCL/KBnidRpJrvVuWE/vhFH67XfQBHZLbIxdiOnO+MXY+pYSWDbKhRD0Fz3FRY2szwOXVXWSE5TiTDaVs3/dPT2W9B6RvJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739520291; c=relaxed/simple;
	bh=vYvVgAJLQm7ccE+HrE//utOM8SSI5WytHPDwHky6veA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DsncRG6xxEmG9f7B1eCJKwkDiYyQLNlbOPQcbbmTGVz1FibzLLltzIhECmoo6Xv3+DktKiZ3uYzY0D6PLN056ZHc/9FQVRMCA27KbWhRQBmtiRJLJF7rVeTDRZOhrlMHjEXFJseeH4o/6N75v51hQmJIaEfJdklR3svKOFusfRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85c4c9349b3so455416241.3;
        Fri, 14 Feb 2025 00:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739520287; x=1740125087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEmjeJJTOC7QfeGz/l1e5CAhsK/j60DY8H03y2S0Hl8=;
        b=FtkLFsr03eskLgFGe5+wiLwyIjbtCL5AyqJhQJQGKW4dgzACb+PFMD48QNGHVaHMA6
         AldLkDjuUdLFO9keX++GyWFbq/AMmAC+SXB1L0jfxLYdURgdpigkvSbdbzBlA57pLMs6
         iHZNP5L1fwdldlc9Y+5sbKGjtqbWFmIHTtM3MJVUAnd6pBL0s/OKRhtutWTv8kGv1NGX
         TTjeKbV2zbE2SV+UX6vw4tW1cCrU+j7WjXcEzvhMbV/BkmJY3ZEzKmwPxA+ogFWyjdK5
         iQVami0vh20rWmku/yAfBq36ob9PK2rV9bkJ/1grbUV7/GXkFPLvHFvr9GOah1dRswCF
         LiXg==
X-Forwarded-Encrypted: i=1; AJvYcCUEUNqUV/XYmJrOeILJE4RkCAKQ5O63Zk+EwDBj5lAgbUiT5TZ0BA3kWnJAWTo8LUrAKAFj4Ui2hbzoAm6J@vger.kernel.org, AJvYcCUu/93H8Z4O8NDwXLQ2gZRct8x6HZNglxhhEHi5snk9tp0McF4j0HBf7G4itfic64LKMmoesEWcPYU=@vger.kernel.org, AJvYcCW0LS91HVePv6GpykvqdYJWx1Y2TJXbsAXaj4mj9N6vaxgCO8FzLgBMrENz42Yz5ZdD42sYkg5z1HjkifJHCrW3tvg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFPWGlmQlTuwfxmv7WSMH5o46U7xLClVU1QTlqA7D5A0Zm9iVW
	zvDn+KdPorrbAWwMlJmizncwe8dYz9qNCh3jOR0a3surr6AzhTbn8SWG1PWQGCQ=
X-Gm-Gg: ASbGnctzocCMXSx1Tabnaayq1lgF9q+uKknIKvpvIsZ3iXp0GQ8lBnrHiDaU0iN+Rks
	UGY5YBEHOy1gWv13/IPdwU0UUDlZwMVIZd6grxwUWASoGvAxowqcuIL+lA+sofL+2UG8cFETuQo
	qpd2iN/LicYGrlF+X0iuN6eNJ051UaFUEt5PLCB4VXKmc2xElrPJDZo2TLluQBDbKeWuUukL/Ap
	rqqDWf5YGalMj4BgrxYslX8DeKMbH5W18mKJsq0tW/rZ4iKzs1bJ2VOdCXOpzBr51zR/vy9nJU+
	pSn9TYO3O3m9YFiKYZDYcvxnjMcvLAUjC6rwp9wRzz97bz3T70vuUw==
X-Google-Smtp-Source: AGHT+IHsKwUj7IFzLK9JwQPUrw/pHh3ifR3R85zEH1CJrS4QIUrkQEU/SLf6q6gnPRLAN3mG1dKAbg==
X-Received: by 2002:a05:6102:2c84:b0:4bb:eb4a:f9ec with SMTP id ada2fe7eead31-4bbf22df260mr9463252137.16.1739520286957;
        Fri, 14 Feb 2025 00:04:46 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e85984c6sm477397241.16.2025.02.14.00.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 00:04:46 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4bbd554fe87so471369137.0;
        Fri, 14 Feb 2025 00:04:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDPkQHj9DUfAJYCnQjLh7a3xsg8JAL3oGWGzU6Sfn2Rl+4a+SZ8IEkZkeTODEWdQ7gl+Sb7v3rKO4=@vger.kernel.org, AJvYcCWhKIH3VqyqKDGenfcWkLITAHCGQsmX1i+IaZb6xwQmKOF6Ap5+cdgwdJpQRsE0hQI6BlltJGqT1K4Iv2LhbLQrKcc=@vger.kernel.org, AJvYcCXnMMrIG6OvbV8nu0+YN8DMGohWSWRIwo/I+OZebb4jhOBvT+9ZKz5Odej2x/+4ZwdKOyeYDX6HaTavWz/N@vger.kernel.org
X-Received: by 2002:a05:6102:1611:b0:4bb:9b46:3f87 with SMTP id
 ada2fe7eead31-4bbf21b4b54mr9074741137.6.1739520286475; Fri, 14 Feb 2025
 00:04:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com> <65f5eiy6kh6nhdjgpylrdjpw35jbae4s454u7qeqamh5hny7ms@ip4btvgxlaq4>
In-Reply-To: <65f5eiy6kh6nhdjgpylrdjpw35jbae4s454u7qeqamh5hny7ms@ip4btvgxlaq4>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Feb 2025 09:04:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfj=kmaQ6OgUwyhNq+ZK2ZbpSfD2BS0B96VHoKAMonVQ@mail.gmail.com>
X-Gm-Features: AWEUYZlKBGDrp8GUpmIDR1fGcTzBqQ1-W6-xx6LlSCcVReodURXv16fRWTmPbuY
Message-ID: <CAMuHMdXfj=kmaQ6OgUwyhNq+ZK2ZbpSfD2BS0B96VHoKAMonVQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Krzysztof Adamski <krzysztof.adamski@nokia.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Roese <sr@denx.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andi,

On Thu, 13 Feb 2025 at 23:41, Andi Shyti <andi.shyti@kernel.org> wrote:
> > > @@ -952,6 +952,16 @@ static inline u8 i2c_8bit_addr_from_msg(const struct i2c_msg *msg)
> > >         return (msg->addr << 1) | (msg->flags & I2C_M_RD);
> > >  }
> > >
> > > +static inline u8 i2c_10bit_addr_from_msg(const struct i2c_msg *msg)
> >
> > Having never used 10-bit addressing myself, or even looked into it,
> > it took me a while to understand what this helper really does...
> > So this returns the high byte of the artificial 16-bit address that
> > must be used to address a target that uses 10-bit addressing?
> > Hence I think this should be renamed, to better match its purpose.
>
> It's coherent with i2c_8bit_addr_from_msg(), right?

Is it? Unlike i2c_8bit_addr_from_msg(), it does not return the full
address,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

