Return-Path: <linux-i2c+bounces-8514-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1401A9F2AA6
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 08:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17FEE18873A6
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 07:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE971CF5EC;
	Mon, 16 Dec 2024 07:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WevJQVgb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D1129CA;
	Mon, 16 Dec 2024 07:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734332653; cv=none; b=GMZNyLX9bQyVoFNPaY5uF04v+4WJBTcoMrWUSgBEJlnX731vOfPTSIekcIzx112N/BV7KcdGyMKOnLeelYQOGO4kCxl7sqigd2kAh8SsD3LJ3qCdfEdyxQgoRLWYQFfskBS8JROND7CU8+QpySZwfrUtlvJyITGDBh8WKPegl7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734332653; c=relaxed/simple;
	bh=KeSpEDkKtZpQhSch1YgBwfAeYb9z/c43PHmS5zAo9i0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fFZrmEbiXsdri2EF6dNOXy/qBqdn0fhJmUNIWBDWgsDZvdxEr5lxS3nyhKUhqR3GJtUbQDRA5fa6BIfYqXSLCJ7CUtwn+wUC5QWTnmCMV73Y0GK1qHmWco7dAoFk+DX+cuwJQPk2RRLvSmshC8ZIxbGWWd9q4roKo39wt/BHxbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WevJQVgb; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e3a0d2d15adso2453106276.0;
        Sun, 15 Dec 2024 23:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734332651; x=1734937451; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsU5wmh2P4K8mF9Ggmz3hxOZU+54LH8riOqnst6ceWc=;
        b=WevJQVgbmXC1pclM8jpkZfyO8o9H4dSFa6ABjrT/c+AxQKnewTsDhp/j2p281yhSrY
         B8oMI2Law1CM7NYLVAm2I0NLqyM0PGNSZX41Unn7qVUb8kF+YACMvYHqAGOMYuewpK9l
         6tnnfATxDLsG0mA1LifEWm6tZtkey/MiaayomMBcje/nsSdF6C8Y/bC7WWl+DGht76to
         luEcr9I2qT/UzcUonSXKBClAFAmUMEoj+H+mDxr1IktlR2XQwiAQY6BMxvN1XfP1sW4h
         /9ykvBcM9bdvXxtMeSuFKkPa4Bg/isOPYImcjWrR+MddJct8MlIoHeH6p39Uk+wXi1Ki
         Hg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734332651; x=1734937451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsU5wmh2P4K8mF9Ggmz3hxOZU+54LH8riOqnst6ceWc=;
        b=C3rHQvOYzv54LmzyuMhBHrdZcVuYkEndznqxOO34/2frpXDPyUlzF782TOMZId+G5b
         7sLUIF5JOvgWS3Xy6CaMY9ouNFx1MDI8LLElp0IFy5Rvbcel3tjectbpIS2zPA405Z/Q
         dCbf5RRV130LoMQfMCYDfIq4DisgrOE+S36r7AVuTTWYzGJ6im0UJQjmSL6IplKtJOwW
         KJj4O/vJNU3T9fFIwYdz/Qv2usY7pOCdNKVt6K9u3c7NvECYReCJs+G1JxxVX4H4nXMq
         R6rFsuqWg9YuspTbCOCsBVJLfuq4UL/iJS8ykpYYuBNIuxSVJKHIFNisv6I8fcilnycQ
         Vt1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUw/Uar9vBZrZMC4NwBlmFfYUC8b1pdpgagOO+6J1bKEeMhpXo21Y5P3C53inatx2i3bZp7ZYRn9LSRxA==@vger.kernel.org, AJvYcCVLP2Sj64uMbAh3nhkjpyJEFK5fbQ3OhXnbbxfI11mRS7WYGj/VPmAWAEQsMvAzn6kE4WzvPheOOYYVAmY=@vger.kernel.org, AJvYcCVUnD2BN+6ofahDPqhklkTYEwFLYWVqWoIesUKRlXxojCCH5LlVWvnJuUUWwq/5k2xThLpqRyeJky0=@vger.kernel.org, AJvYcCVY4SHocZ7gMqjJ3OlfGI9wg2EZddo2OfSFG/FOQoJb2xYvD14CSzbfSVOoRfiKf/4UFy/dmplQ2B7f3xWYees=@vger.kernel.org, AJvYcCWE+3MhRmV/3D7WwzPFN1iSAjDdhNl0CgzIteV1Mxp9Wj+BoCuldaTzAZIzsdfwxL0oz74T/ebLRICX@vger.kernel.org, AJvYcCWSU1P6s1hO1hkSw06UUGwITro85/4EsOTD95KN09fx83pxcZcDbRMZ8SjeZMhSesA9LW1mO1FTHhwYtG1J@vger.kernel.org, AJvYcCWf9PrTyIV9ZZ2DDCceFJ9dXFPO3UOej1iESsY+elW7Q7M1Ku0kO6FkaMsFY5VQnxj6EG3jUReC@vger.kernel.org, AJvYcCX5k9u8xsoJov1/CFrKNCqyyhIaSC/htrzcQdFoo/zdBA8uLHXnn9q/YYgG69/Cn2r/HKSh9yjk9a9T@vger.kernel.org
X-Gm-Message-State: AOJu0YwW2oR3tCX0RXx8Qa+fioDHhtdxd72CR5RGIP4/B6znPwiJXXD6
	Yob6rX6dCGXDQhcnkZLytJAiSgqnrcQ9yWAKQIY7JU3/H04JVwArCk5/nPlr57MAlUhVe9yKIas
	CJBo2r07vtZfxZX0sUyRRJgI2UQM=
X-Gm-Gg: ASbGnctqYft5gHoREbzjO/BcdUZf7GFMDymiBj7+0Mp7UGMz4WBAD9ch5mcyDLBTcgS
	lf86GBvrtj6pz6iVyG1M+H/r5yaYgsnt3AjTgRtxdl7IAYaCi48tt3COmKUE68tqeVkv0XPs=
X-Google-Smtp-Source: AGHT+IHLFDXpcf4og2XrYkLAxxhOSZA2+BQlHOzPM0PO9nHe4iVqax2MnRn2XR8QWV2Gsxx89csWs78ajaevICvrWAc=
X-Received: by 2002:a05:6902:11ce:b0:e39:92ec:b5f6 with SMTP id
 3f1490d57ef6-e434f084c2amr8834964276.41.1734332651424; Sun, 15 Dec 2024
 23:04:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-7-tmyu0@nuvoton.com>
 <CAMZ6RqK+B3nc9bLWR49vwDJX3=pbjOKKoa=e=Pnc7wJNQx7JPQ@mail.gmail.com>
In-Reply-To: <CAMZ6RqK+B3nc9bLWR49vwDJX3=pbjOKKoa=e=Pnc7wJNQx7JPQ@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 16 Dec 2024 15:04:00 +0800
Message-ID: <CAOoeyxXNvnsdbrhjaKq13x=27-nK0U73+6yvRfTjJLAY+v_OcA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Vincent,

Thank you for your comments,
I understand, I will make the modifications for these drivers,

Thanks,
Ming

Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2024=E5=B9=B412=E6=
=9C=8813=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8812:10=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
...
> > +struct nct6694_hwmon_data {
> > +       struct nct6694 *nct6694;
> > +       struct mutex lock;
> > +       unsigned char *xmit_buf;
> > +       unsigned char hwmon_en[NCT6694_HWMON_CMD0_LEN];
> > +};
>
> A global comment on this series: do not declare your buffers as some
> opaque unsigned char arrays. Instead, make it a structure (or an array
> of structures if needed) using the little endian types for the
> different fields.
>
> You already applied this change to the CAN driver after I made a
> comment, please do the same throughout the series.
>
> The same applies with any other comments made by anyone else: do not
> only apply to the patch where the comment is made, but apply it
> broadly to the series.
>
> Thank you.
>
>
> Yours sincerely,
> Vincent Mailhol

