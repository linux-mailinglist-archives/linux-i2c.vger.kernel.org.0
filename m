Return-Path: <linux-i2c+bounces-3886-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1B58FE281
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2024 11:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11F011F21AC1
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2024 09:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B836A13E3E8;
	Thu,  6 Jun 2024 09:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Crpew3vw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F2813C816
	for <linux-i2c@vger.kernel.org>; Thu,  6 Jun 2024 09:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717665788; cv=none; b=F38EwoHWIrYnhlNZVQvxB/3C9ZSthyKcXL8dZiUDs7CQPrFEpYB/Q91fwEq+VgFrcvde5hhV6lXiC+ZwKTYpud3+3huVtYAtQc7864s6DSpXOxA0k+JmtqUoFgxrFNVQ+VM3wcQ4NRBHgIbsI9pJOyjRbxcU6jXf4aaNCYSIdjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717665788; c=relaxed/simple;
	bh=SEZNCNy3TlFdmEoQ2GZ2Aljta1PfdelqlRlbOXhQfSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEDtvEvQF1I+ZoAJdhmMazk+ELnOFRwQDWCcsqr9yHItSNes+wcWmOFkHfNple9mgl+YRiRl3Emssvd229Tpt8LrGMp7LVmjkiX4wXAPKViUaRw/EHosFZWQipDSqehA4x86dZONaYe8e0uaQzVEwHaLsBt2Ks1rXOVxp17hrxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Crpew3vw; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6267778b3aso58472266b.3
        for <linux-i2c@vger.kernel.org>; Thu, 06 Jun 2024 02:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717665785; x=1718270585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xdo3ldNDeMyIM6Kx3VweI5RQmky1PUGTcMckmPYOvUE=;
        b=Crpew3vwwN9zyUOgT8tIFNgxp6++QSlGxmrGff8YAu5UGYudOjqQDqhBzlxUPFrMEe
         lQwbh+TQKRib3IVWV9RMF6rMtxZY3hsHCdU8I8HbI+LwhVLWO2kNrzZTpubG4X8B44RJ
         Sa9y8BdAM7ILpQeaOW6QluO9bTBQt0iYhgtSdnXRaT2II2RLT45JCxqq9PrtDmwcD+AF
         PUuW7ByZTP3xMdlOyIzevGQ/ba4qyWq4jG9E1Po+nIM2JUxIF27KbXtvexwTSnnAn+hG
         +58pBzJJKugJO0tN85bPtr8AAMA7y2gdUZYSJXNiNjD/9mj74dQ5dkh9jTXyoXWFDYTC
         +C5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665785; x=1718270585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xdo3ldNDeMyIM6Kx3VweI5RQmky1PUGTcMckmPYOvUE=;
        b=k9o8sYfjNAWVftNQroCxfNXfsKDtnK4LZFBUTjszwfvi81AwLDasKtAFjtCn5IStTa
         o1bHm5Cf8XjIL01DvCPRTQlr40AvdiMLLMeVBm+TEfLBd07ZppzD2wiwxVQp1U3Fvvki
         2BhadSdk0LJoWaIIogz2EbKG3xix2IfMtpdvuYppRyBrOaskcsQ8Rk8UXQ2XchSnD0gR
         STCFZDIAbi4mqUQjLm6XC5DtRNVnfq634WBFnnqd6MXPh0Q++YXiD7+lCcUGo5zOJTY9
         dGn696+Xu1M1Zjp3xDCl7D6EXc0QuN0/bH6Mu/Zj+7TXUkUw7OMjZud3nUsf3POOFQAi
         58+A==
X-Forwarded-Encrypted: i=1; AJvYcCXooCh9vJcVwhzMBet3/YHfPgESUytPgreA7uo9B5YAj379zI5ypbPl5PHEGmRDxoeKjLtrimdPnf4r9RrkLln/5meM1gEfVMm7
X-Gm-Message-State: AOJu0YzlLB6hsFijvZTPs6haFGuakBDWKeX5Kh/+AAx51eoJxZ+pwRJb
	BnhYDkXjN3anHSoBP4nYDz1HB6b1WW16eWEyBBFJ7/fdjys5Qf1534r4UoTMxwhIdGTxn/IwF5M
	5xABBmfqMX3PUZHv57BXqjldXdeOS7MFWOedW
X-Google-Smtp-Source: AGHT+IEbpprl6blPk8T2xU2kaYzhaNrmYq2+TvX42xRzC/TSvUdDQXwO9kRI4X6UmxZu4UT9hOygjZqZt2phPUhxZ0w=
X-Received: by 2002:a17:906:4694:b0:a5a:2d30:b8c1 with SMTP id
 a640c23a62f3a-a699f680d76mr317202766b.14.1717665784784; Thu, 06 Jun 2024
 02:23:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com> <20240605175953.2613260-2-joychakr@google.com>
 <b2ccaf40-fe04-490f-a625-4c502c038627@roeck-us.net>
In-Reply-To: <b2ccaf40-fe04-490f-a625-4c502c038627@roeck-us.net>
From: Joy Chakraborty <joychakr@google.com>
Date: Thu, 6 Jun 2024 14:52:51 +0530
Message-ID: <CAOSNQF3bw4+-SPEVf9wwsrt0L-6VNK0NWuDKW6AhX701+OKjsg@mail.gmail.com>
Subject: Re: [PATCH v1 01/17] hwmon: pmbus: adm1266: Change nvmem
 reg_read/write return type
To: Guenter Roeck <linux@roeck-us.net>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, manugautam@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 2:59=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 6/5/24 10:59, Joy Chakraborty wrote:
> > Change nvmem read/write function definition return type to ssize_t.
> >
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > ---
> >   drivers/hwmon/pmbus/adm1266.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm126=
6.c
> > index 2c4d94cc8729..7eaab5a7b04c 100644
> > --- a/drivers/hwmon/pmbus/adm1266.c
> > +++ b/drivers/hwmon/pmbus/adm1266.c
> > @@ -375,7 +375,7 @@ static int adm1266_nvmem_read_blackbox(struct adm12=
66_data *data, u8 *read_buff)
> >       return 0;
> >   }
> >
> > -static int adm1266_nvmem_read(void *priv, unsigned int offset, void *v=
al, size_t bytes)
> > +static ssize_t adm1266_nvmem_read(void *priv, unsigned int offset, voi=
d *val, size_t bytes)
> >   {
> >       struct adm1266_data *data =3D priv;
> >       int ret;
> > @@ -395,7 +395,7 @@ static int adm1266_nvmem_read(void *priv, unsigned =
int offset, void *val, size_t
> >
> >       memcpy(val, data->dev_mem + offset, bytes);
> >
> > -     return 0;
> > +     return bytes;
> >   }
> >
> >   static int adm1266_config_nvmem(struct adm1266_data *data)
>
> The series doesn't explain what a driver is supposed to do if it
> only transfers part of the data but not all of it due to an error,
> or because the request exceeded the size of the media.
>
This patch series is actually a follow up on
https://lore.kernel.org/all/20240206042408.224138-1-joychakr@google.com/
which has now been reverted . I shall try to collate it and send it
again with a better explanation.

> For example, this driver still returns an error code if it successfully
> transferred some data but not all of it, or if more data was requested
> than is available.
>
> I didn't check other drivers, but I would assume that many of them
> have the same or a similar problem.
>
> Guenter
>

