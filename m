Return-Path: <linux-i2c+bounces-14568-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA65CC1987
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 09:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62F0A303D324
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 08:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A201E30F80F;
	Tue, 16 Dec 2025 08:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPUTvZsQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B6430E829
	for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 08:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765873888; cv=none; b=ru3hoK2Q/0oLn8EpEZadydN9/iKc8WzgHldaVfsX4jupBUagP/hFahLRMasZD+6C5SnxQXy+/5QvFjzJT0Gbv0Cew0xrhbLoFIx4YUFK1/xbhe3kJL3uXn0FLvAUicO9MJ2Mt6JR7JRV90DPlCf3W01yfO/0/RqFFqVW5qIyjD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765873888; c=relaxed/simple;
	bh=Ne8lJ2W9R9L98LT3IXnbXQmyBQHpIK5exT1M5+MN3nc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AxuLb11dS7n3ntBfdSupuqGnfPzf+UlAnp7533WdO9AZUW96dSMN6LvNAiBmsncza5+jXw1Opg+8B/rZm520mxKLlpAWC/mSKOXiRdQZ7nls4ESaALhZmlznIlk83dfHRmkuZ0sx2sa55hX0wxP1nOHWNQEPdPwZO+dwyiCQrTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPUTvZsQ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so5925273a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 00:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765873875; x=1766478675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQojXGe1Xon9EVHvdwzM1mIfwrJqJkUgQsQeeW7RD5g=;
        b=dPUTvZsQe8fYWGyydhkf1cvyneHSrfKljJFuGuXcfWiuKNxU+LNiaWBih7LNQfAJzx
         QrzOHzgL8hjUjRpxCOlPVReqy/IF8lD8hBOxM7DxoCsZLLwDuKcxrJhYoXSfFnHpnWLC
         80s7AFuoZoYu0MBNrlNeiezqUyk+sib1FNkLjIuJQoUo+O8MmKuYbciVQ0QaQm7u43ay
         xFqfTH4sOrzGmeM8TDToNFl0MziS3Rw+pWoSNO1kfpbHct4Tw+fAFRMWs09GRrI2hS8O
         YHB8s/txHKzDBP0BGDr+GTbkRpPhVSn6E8BafnVyDakquuqPFYoA6KvxTBPbJC2cwaJs
         BkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765873875; x=1766478675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GQojXGe1Xon9EVHvdwzM1mIfwrJqJkUgQsQeeW7RD5g=;
        b=VyQ8Am+AgqxF9m3H8mUS82eXDvlk+X9UswFEIff0nXDHKoAfMHqFrKJ72miJ9CI/oA
         YaQE76DS/TY2KZlac8byvo/gM/6G6m3jaQZhrSCaQSSwfsMnsBhCes+md0MMYmnIvFwu
         vLCzRqzCJrPdOBjzjVnbt/Z1kRvxR1oGkn3p12Y3YfvAsipFz7Q1FfGq2M64H4PRrVWf
         /9nD9AhpastARADXJlyauHciLhmJo6PyMm8i2NYpZnUKPzJ8+V4OmPNvdCfEL5LOTHOA
         jOUuJxiT0jHO9QJcbJL9yj8e9axYYxRBSX9wYlp0R4w/o7kjKTD8nqZAoLTqGbFqpHFo
         ibYg==
X-Forwarded-Encrypted: i=1; AJvYcCW1f/KmFYKRUs40SifePB7MGqyJzHxJF69XgmETVxfiGy51mHPe12xjN5ujBnTeEOjap8vOO8IMPl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxedA3bs+bI0OgfQCAV9ct/mmr1MyLECbGzPEgezdk4sYArNaQi
	k1kM5kHPAX0yDNk0z3/hmbPZQAYg/tnnY5KnXZBoTB2M4xF+h65O9npf5e0MVl4LG7+baQebTfD
	OMO0FPGuU7N71cIt7y2T9s6zN3fs59ZH749Gh
X-Gm-Gg: AY/fxX4DFmQqM+hAAoSgO2GMS1i5aXZ0GKN3H3skgyoCbXWetlnVtk+BYVNMlIfjoDR
	+NDgyqjpha3uUp9v6CKRkgtTdXEXbBI3zYoue5xqJQs3Ew6lvBCtwGfUJtFp64He9BJmlZcbbMA
	2hS8FDVINi1r3Ffy6RuLl/cx22tB+aPopGqymTfov3kr8YvDaviJeMoBn+ElLFdkqKXppKDprO0
	g4nY3ZhighEspw5Qf9kBDqzwjf7vooE8NrpjnqLB27RGcI9ff7K7R6zRmGU64UlkavLtlVCJg==
X-Google-Smtp-Source: AGHT+IF9oQk2FiXL5zw3SFPOMjxnMAfpDixNAE5HmYPi/w8LYep12XKMVrteyQ+sNlIsL0XbXIk47PaTSEnkkhrP/LE=
X-Received: by 2002:a17:907:2dab:b0:b71:29f7:47dd with SMTP id
 a640c23a62f3a-b7d23a61d28mr1488792866b.46.1765873874874; Tue, 16 Dec 2025
 00:31:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763018288.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1763018288.git.zhoubinbin@loongson.cn>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 16 Dec 2025 16:31:03 +0800
X-Gm-Features: AQt7F2oYbSmMbrluLzV8GzEoG22ADpKx58O5i82UYBt5JYEe8XjPc_KZEsh9Cl0
Message-ID: <CAMpQs4+W+kLbbm2ELpLbZEFq0mK-x0ftLYJ+xd3MM1uDz+DUuA@mail.gmail.com>
Subject: Re: [PATCH 0/2] i2c: Add Loongson-2K0300 I2C controller support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all:

On Thu, Nov 13, 2025 at 4:48=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> Hi all:
>
> This patch set describes the I2C controller integrated into the Loongson-=
2K0300 chip.
>
> It has a significantly different design from the previous I2C controller =
(i2c-ls2x),
> such as support for master-slave transfer mode, and DMA transfers (implem=
entation
> in progress), etc. Therefore, we try to name it i2c-ls2x-v2.
>
> Therefore we try to name it i2c-ls2x-v2.
>
> Thanks.
>
> Binbin Zhou (2):
>   dt-bindings: i2c: loongson,ls2x: Add ls2k0300-i2c compatible
>   i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C controller

Gentle ping.
Any comments about this patchset ?

>
>  .../bindings/i2c/loongson,ls2x-i2c.yaml       |   1 +
>  MAINTAINERS                                   |   1 +
>  drivers/i2c/busses/Kconfig                    |  10 +
>  drivers/i2c/busses/Makefile                   |   1 +
>  drivers/i2c/busses/i2c-ls2x-v2.c              | 513 ++++++++++++++++++
>  5 files changed, 526 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-ls2x-v2.c
>
>
> base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
> --
> 2.47.3
>

--
Thanks.
Binbin

