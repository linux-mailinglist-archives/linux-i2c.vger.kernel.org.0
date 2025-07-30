Return-Path: <linux-i2c+bounces-12084-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFA1B15F92
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 13:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EA5C16CAA8
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 11:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B4A295DB2;
	Wed, 30 Jul 2025 11:33:14 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0C215383A;
	Wed, 30 Jul 2025 11:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753875194; cv=none; b=pgs9d6jL7LM44ZEea0AhtBRY2MpYDtxhzMP2czEF39IUhzVGu5ez+4atEJzQaI/htC1XotRK+NMrKv4yIN2IVHnCuCrES5C0hVq1rZnyipGfteYR8RK4Zme8Ry8+qhlvEJHeiovT3YyyK48vf2WuorZzpqmIlmnMyVzX3nlaAsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753875194; c=relaxed/simple;
	bh=Q+yabLyIW7uC1xqhnObba1fTmUcHSjCC07MPdQrhtrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fnmOABIXZ4+c6RJ85H2DlbDZGbd7Z5Sm/tpxI6IdsZ4ADJ7NEp3zaFldZpv8Qs04AVq6g94cq10BMD9O5GR4mhvBDwjkmgPwwWiv1EurDfVTpbJlxeyxfQc+ZzODzTP4UqQFoXGj/bWzmvxRzKtwGVeXtm/QCbiR/+vE/AJFzuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-53921f6e23bso492014e0c.1;
        Wed, 30 Jul 2025 04:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753875190; x=1754479990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nW9Fed3oaCcY5j8zAXTzmhRy4s/lDYERKz+lZhw5SjM=;
        b=K/0owtIh/tIIFPQbNdacxQia4XVpwwgLLMM35Ni1MvwqpkPwWvQjpwt6orFpcJiJ5+
         SJxcbaNMVWw+kYJiBYs57z0ONm4qxLCuDo50zOHkzPek/XH8sHmg8GK/e48EJSk0VBvm
         JIWLSn/HohO9kKq4F+CEpbKDH+psajE9NgDQ8bpli5joXS1Hn2F6pwgT2ZaghPi+ICQ+
         NKVgl25xahkCuhfVMeSabT7cprkjxmiUrG2f5auCdzoGmTuloH85PWblqjXj0dccsBU1
         kzZ70Of6u6yR2bzzq7ugLTFMGI5DwIYmBYd3E9ROtUnHjTDY/7obOHsMh6PZxb0LmR7a
         f3yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH3xON6OwpRHlC8gKg/DQ3HD+Rqs4FV7/cRGlKraH7JI/MsL252uou/xg4a2uQekWMM8TubUZcsFxG@vger.kernel.org, AJvYcCUIP143pLnxp0nAtBZWQsiEfRMRceeKcu01dapyan9FlQ/bPgrlFOakRLK7itFqq2oy4LGJTcnqgrvr@vger.kernel.org, AJvYcCUQYNDjXvLqz9+Jg6oxvW/oMq3DO/ALVMkd3aG6RgTljevxQneY7H5se+8S2JjuFiHHnmysbT7H7IsC@vger.kernel.org, AJvYcCV9vomE9AuorAR8nEhM2En3SUZ1K/HDaEG3aQtjB0Da4DceSnsOljOpxh/5Txaj1uHat8Vq2DDN6is6SGkSBT0zsGc=@vger.kernel.org, AJvYcCVEK3b/vnoSgtejJOpJkrJc/xaQBVyPWkwTOJAmm3z/uh4+KnrX7tWo8RXhkwlQUhJkhTlUmuQrvy7dwQo=@vger.kernel.org, AJvYcCWLVuBuA4p1/YHftgx5d3Rc/pMDWydaZHbCSHtDvpnvq5TFI6gb3ASNGnU/yOockfyhmEE7pk0bakhvZ9k=@vger.kernel.org, AJvYcCWb3+g92ilOrr3ReO6BDjAgmrXYDmzR91kFci+EmSuAKXJQOp+m7WRnyQwjtHrbUrJ9rPrgqRV+Rb/60NjA@vger.kernel.org, AJvYcCXIkN5cqle7X1KnYXHYZ6VJbLxZgUL6GvfZU9hZFzcefvbouJRaV/w/fmq6VATaTGGVqtt6yfqBiFxP@vger.kernel.org, AJvYcCXZZJDKFrBqHSfNqmhGePiyzVUI2YLYw/Qr+F9ippCsAgZ4OvHKKGjRThowm4lHdp9KocHyxqVxxX/TOux+hw==@vger.kernel.org, AJvYcCXt2xO4ZYECSjyc
 Ut5ulQ2no1qc26xBdJFxnZYnQNov+v/MDlaKij4ckhzex8qy/s8qYAvwiSIp9nbw3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yznc0m5Xb6XYiU6iwBILMXg8L7XiskBEnWSdwEkthXdnzE903Bx
	GP6Rn/oT/Qt+dSi9gb6ik35993MEmAgOWK3yzXRIcIdquItnPAFDOwvjntJ8wx7T
X-Gm-Gg: ASbGncvNNAMovev1UZFsi46OJNulmelrnDGMTZ9iOubspLW79t8h9y5CDVnj6CAvrN/
	IksxLGYEqGF58uU0DSxlXc4QieHpOfRx67Fe9T80s3IGr2+KEw6sV84kZW++RaI0r1fdCNAS3+D
	oWqNemV94mB5WN9vFsx5hQdEfR3Dm0rw8qJw+0KmT1zGdhnLT2nzPI1YyvHt4esjsC6t4Yy31Iy
	LY3X/070GM4ihsPfUblM97uCnKZhJE3KiMm+m08ROi/tpyqN3WR6WJ9VQVOUhbtKryht/1COcX7
	e/swur0FeLyigM8kNdSWB0+kJYijHJT9Z0DqGeQy31dNjGye15e/bZuAm+AvfmvP4gIlOSoNbaT
	R493YtyoBrgjPbSBhrIwYL6Ai1CJzJlSrlfDzKcR+AT3cU/qxSnya7HrdTS8b
X-Google-Smtp-Source: AGHT+IFPkosKlGkERIVmuMGG9+aqdcP45f0bxTejQih+tGzAuRStQsiDvSrEOrcSq4KNPVVkGtHTpw==
X-Received: by 2002:a05:6122:30ab:b0:531:2f9f:8021 with SMTP id 71dfb90a1353d-5391cf1fc33mr1910232e0c.5.1753875190063;
        Wed, 30 Jul 2025 04:33:10 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53903a4f34csm1548134e0c.10.2025.07.30.04.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 04:33:09 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4fbf1326dfeso491625137.3;
        Wed, 30 Jul 2025 04:33:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQOlbuSDP1Avs8vlLJ3uFM8F1h+U1+fl/9+d2Fzcpb4w/FN2DsAicwZoDKHb37zCGWIVHUpZpT5ry8BK4=@vger.kernel.org,
 AJvYcCVt1+TppUSdPmqHTu0K4JwN/NSbrNMiSlHPHzhh7ozBSQnj6SNIm10cRBzy2gvuXdtJ5WZsODpPrYjA@vger.kernel.org,
 AJvYcCVujVg0HIrSMRBeLbn4SxQsq4GoAm4dd2MuuTXlkN0avCuowzw1HKxNAHtkRNM6QwogAtG8rmwli1HXVehl@vger.kernel.org,
 AJvYcCW+cua7KQRFj3oRMLRYWz6aQjrXYVxbDkyvPHCRtdw8Hxi3NW+u8vdVmL/PZbx6/SAWN44hNrD7KaTB@vger.kernel.org,
 AJvYcCW6hM/U0cKgj7H9mqdiogNz3a+RS0hBPQUYMXY0e7CVRV5/xz+heWCcXsAbZZVW4WKFHgbgo7kk0DvIVvXyR9X2Iyw=@vger.kernel.org,
 AJvYcCWSGRbSjmqhSgqwTJY4Sen2MvHTAw+wQbPH2HZ3OTC0nNkc+97q3AoiRBt3I0yqzyfV/PgoFZ6SvmYaXA==@vger.kernel.org,
 AJvYcCWzUDLay05of/rJGJspHWBAbGElY25UYxTcT3epxoQ+kk43DLPcClhM7EXdVDf7/jZkLXhV306PIWLm@vger.kernel.org,
 AJvYcCX1zgXMKEctS2VjboJH4HiR8C70Mm/GFWfBr6ZmLFBRu/tU2u/yUbIAQwXeZOEZ+LLYr2s0R2K3YtKa+BA=@vger.kernel.org,
 AJvYcCXnvKcIW2wxcob6w+IFdXVTp8pmFZwvK4L0X+8amcUBhgVJ2syCrF04HY7QlRTVqmuRbaecD4ziC9W1YEoSxQ==@vger.kernel.org,
 AJvYcCXshMB49VcZHPzp+/FGdrLqodugkAJllsKMGVtCLaPIIOVhQUN7/G/f+oiNWSsWAYDJBoZcj6LsbWAc@vger.kernel.org
X-Received: by 2002:a05:6102:418b:b0:4c5:4591:ffda with SMTP id
 ada2fe7eead31-4fbe87b425emr1711001137.21.1753875189085; Wed, 30 Jul 2025
 04:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-3-b505c1238f9f@oss.qualcomm.com>
In-Reply-To: <20250730-topic-dma_genise_cookie-v1-3-b505c1238f9f@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 13:32:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0JO=qtregrrHsBZ-6tpNdPUj3G1_LWRfRsj0vBb+qyw@mail.gmail.com>
X-Gm-Features: Ac12FXwFObS4veqAcz-kMArtfpOLnucchkvqP_CejUTAp0AxApTTYboaikMMzJA
Message-ID: <CAMuHMdV0JO=qtregrrHsBZ-6tpNdPUj3G1_LWRfRsj0vBb+qyw@mail.gmail.com>
Subject: Re: [PATCH RFC 3/6] dmaengine: qcom: gpi: Accept protocol ID hints
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Paul Cercueil <paul@crapouillou.net>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Viresh Kumar <vireshk@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Frank Li <Frank.Li@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, Viken Dadhaniya <quic_vdadhani@quicinc.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Konrad,

On Wed, 30 Jul 2025 at 11:35, Konrad Dybcio <konradybcio@kernel.org> wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Client drivers may now pass hints to dmaengine drivers. GPI DMA's only
> consumers (GENI SEs) need to pass a protocol (I2C, I3C, SPI, etc.) ID
> to the DMA engine driver, for it to take different actions.
>
> Currently, that's done through passing that ID through device tree,
> with each Serial Engine expressed NUM_PROTOCOL times, resulting in
> terrible dt-bindings that are full of useless copypasta.
>
> To help get rid of that, accept the driver cookie instead, while
> keeping backwards compatibility.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2145,7 +2151,8 @@ static struct dma_chan *gpi_of_dma_xlate(struct of_phandle_args *args,
>         }
>
>         gchan->seid = seid;
> -       gchan->protocol = args->args[2];
> +       /* The protocol ID is in the teens range, simply ignore the higher bits */
> +       gchan->protocol = (u32)((u64)proto);

A single cast "(uintptr_t)" should be sufficient.
Casing the pointer to u64 on 32-bit may trigger:

    warning: cast from pointer to integer of different size
[-Wpointer-to-int-cast]

>
>         return dma_get_slave_channel(&gchan->vc.chan);
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

