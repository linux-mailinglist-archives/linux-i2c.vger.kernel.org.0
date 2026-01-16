Return-Path: <linux-i2c+bounces-15217-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAAED2EB8A
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 10:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1ACF304B95B
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 09:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219CA31AAAB;
	Fri, 16 Jan 2026 09:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5A4L6n/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB403203B4
	for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555518; cv=pass; b=hGcInboUclupO77DgjnDP3lGdIG/DOFMu8VWQxhSY0a+ZMt/Cbt4L+a8SGqXyoRJlOBvJZ0DkVUZ4Q02YC8j2nuHT5jaBcVEHjt8Q1r3X7hbWmUVOxIh/MI4TcwMdMIUVsMqYeyUfiyDWG6kd7FDgs+Tl/DZq11E7yoru44CWsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555518; c=relaxed/simple;
	bh=2kXTc6rtb1n8msxIhzkYUgOALIZz59Pq2CxmSyGP5mU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ffoBI95yB6r3V3iZd4FutYjtbjeCw+Y2hhwuKyR/UagFyrJjaFZSIMCTlj9nliFEwf0HT8G+i9FyR+xhZE2kX4TfRnH6kjDwT6q/ELk9xeUBKHcBW0J4T6mWX19BCm/D+gZLgdTz0u2CDTzxhoay/pLZk9j0OJFV/QykWKZLtbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5A4L6n/; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1233702afd3so2305429c88.0
        for <linux-i2c@vger.kernel.org>; Fri, 16 Jan 2026 01:25:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768555517; cv=none;
        d=google.com; s=arc-20240605;
        b=bPJ2RW/+3NNUS4KeZ2xalqyYxrGU0QzKr5V45sToHqmqb+xpRFDe06UGVYQjYUcV9G
         GMmSru4zgdLvsbrbtrJIGsu2BYQ7iRbwxJasmrleQbayGLxewhYFlGIZdqct5HGbccVc
         uPOFfL/wYAjdByK4fQvJMMA5oGpsEphzPXfnpq/itewVVeX+Zwix4xJWjdMxEEsqKlzo
         kKUskuyluS1ZT3RWLnkXBpkYhE9H+O2sk1omIHFrOytj1+F1cI5TbLm+oWLB9BnSSUVk
         rI8mg5VUSSvY5zBmPhPJtNcGZuv1J1jDwRuhVdpEvd89pZOgPYMSu1GElK5NATuC/7a3
         ZWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1gVkLjFWXdsLXhZXMgSkslb6Gc2W6vyzdGMqF3LNrLk=;
        fh=Ctbtgsol3C1Out/0eY+JLpTvJ6RL8pM1AuPaDI5D2Mc=;
        b=KtfZO4rrZ6BJTHd8YvMgb+uH1T5coxU51ibCz7kd3D6C5Cs07r23WISRD73k/ymI5c
         eTpwYguzd6L8g9Dx4RSKmulBP9bTzUqJ6uE5llk9QDdkJQpTHpJCvDbuMYvZYiK94cHr
         CBYVjYX9wJdPf9WRI0RT8T3znpEg1xdGY5i2YkhVhHc3dKKPQagQvdYRscTj4dCfIMmU
         X6/pILvxxIvDn/eNdtvMzuowB9vp5/QSx52+5Hzl5JJFnCnMeZuFb4YriGvXL/mHhEa1
         3el/+dT6bi5pFqKv04kRTTbKbZtWAGH9P0AwkKftUYceOW98rV5Ikdn9rHklSWYE+Kp9
         8nvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768555517; x=1769160317; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gVkLjFWXdsLXhZXMgSkslb6Gc2W6vyzdGMqF3LNrLk=;
        b=F5A4L6n//jrHljxplxc9mP+RK50Kn1Gr/oMOz1jM6yj7HzyoevecqUqj0Q6mmDew4a
         2y0gywBy27FSbr1buaflNV+dtXyd8AWXsMofB6llb4d0lorKcI9PdJNSrvB3sANIH3Gc
         opKdFUAJOx5jHAwztgJqbgskLoyo71+FuFHXnUNMl8avjVVnDHpjj6iiW1VUzx39iw7a
         QSItmsv8xUlHAwycSpiYev2CUEn3DMjVfouLuOUsWlRO4Co4gUaHg8SiHRc4ZXEnVsi8
         w284Til/CC4+vXUDUafBy5GieWIxTUaGMSNi2TD3gUsqiTOMrFIdlpQD4arzouaAqqeY
         gY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555517; x=1769160317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1gVkLjFWXdsLXhZXMgSkslb6Gc2W6vyzdGMqF3LNrLk=;
        b=nRYulxQARhsqccuqk4Zwd58Xg6004KTBbccw91YGoiquHI1Gcj0sPBLC574uUdQyV1
         UBWpRs4PLhtB3mwitBYjp69Bapremv9x6EuwSq+rlkwNBLjC4nThdHz2tfROzvTTCj1Z
         YCLGdG54CwhTnhKSo/y6jj2R0SvaD1n8BtY+GImUn71MJRizlhtUAo7FSXjJo9Fl6U1S
         px67OrloC4d+nmbwuoo1J/GWzOjuMjybYaHrq3ce5Z8zBfkjU2b2vdh8FmYh0nwX1PiA
         Rn2V6xm7DBPpAgHOtRPEBf8ppv6Mp7Sm822RPC9G4m5Q2AEwaivi3DANo+wEU8mbGUDg
         vPyA==
X-Forwarded-Encrypted: i=1; AJvYcCUVIZG7sUCAb62xzitDRBwwTU1KeuCfyR4iLRaYz3N01sAmqQqD/lPF5lzG1HLU5k2xnR/r1HthQ7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeUbEwJP87eW4vB0s6bqTNKvcgIaKkgS2Ptd+JG2BAQErwJCLJ
	ni1jG704zZ/pK/z7xxB0zXOxVjx9nWVONGfjZhC/riMNWI5H7KvTFRpyuFjJOmwfuHcInKMTHSC
	+SRd0ZjkTDnMCRmu7AGMcNpHJHgKBq0E=
X-Gm-Gg: AY/fxX4e6aw7xJllHOuYx3Fw/PNZmQSDZdIeBVxoc0jhTEMZi6+9Rg9731kkmJG9K8X
	ROOWAMuSAI1FXB94oUPHcOURKIR745k5tcOUzcBH+4oLhLZgfrGt6yCRI4ggeFLrlaostCERvEG
	PZVfYRLtvxs+fSlruKnS0GhUyLFDekWV88Ymivto5zkSCm8zcNMIFNyvneB8cDdHID0ATF7/Cfg
	mILUk6PQn/MWNQNeHZ5kcXcnIW2QIgcpFDo8sDHIw4wfjtLSDhjiO6BIJ3rJB809KALNilKbw7+
	jpfyIunKemjZRzL6v4VQ5GGnLRJ0xJPjAwg4i2xhlX3mt8ikEFb5AM7fDZPi2stCFfD7M24wNTi
	LJJZ7AHKMIfZx2EhatOPK
X-Received: by 2002:a05:7022:128e:b0:11f:3483:bbb2 with SMTP id
 a92af1059eb24-1244a72e2c6mr2287226c88.12.1768555516713; Fri, 16 Jan 2026
 01:25:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116091704.3399142-1-Qing-wu.Li@leica-geosystems.com.cn> <20260116091704.3399142-3-Qing-wu.Li@leica-geosystems.com.cn>
In-Reply-To: <20260116091704.3399142-3-Qing-wu.Li@leica-geosystems.com.cn>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 Jan 2026 11:27:58 +0200
X-Gm-Features: AZwV_Qhvgz-kbrRItIaZk0_yMWKQZjkC3dhXXrMaQSnI1xaVYEnm76i5Ds3FryY
Message-ID: <CAEnQRZAz_-S29L66a_ySxGAX-SKAeAvHfKqjanLsGNCZ7_zsAw@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] i2c: imx: add abort path for invalid block length
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	bsp-development.geo@leica-geosystems.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 11:19=E2=80=AFAM LI Qingwu
<Qing-wu.Li@leica-geosystems.com.cn> wrote:
>
> When a block read returns an invalid length (0 or >I2C_SMBUS_BLOCK_MAX),
> the current implementation leaves the bus hanging with SDA held low,
> blocking all further I2C communication on the bus.
>
> Add a dedicated IMX_I2C_STATE_READ_BLOCK_DATA_ABORT state and ISR
> handler to properly terminate the transfer when an invalid block length
> is detected:
>   - Set TXAK and receive the next byte with NACK
>   - On the following interrupt, generate a Stop condition
>   - Read and discard the final byte
>   - Report -EPROTO to the caller
>
> This ensures the bus is released correctly and allows other devices on
> the bus to continue operating normally.
>
> Tested on i.MX 8M Plus with continuous block read operations.
>
> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> ---
>  drivers/i2c/busses/i2c-imx.c | 55 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 85f554044cf1..71457dbffb7a 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -233,6 +233,7 @@ enum imx_i2c_state {
>         IMX_I2C_STATE_READ_CONTINUE,
>         IMX_I2C_STATE_READ_BLOCK_DATA,
>         IMX_I2C_STATE_READ_BLOCK_DATA_LEN,
> +       IMX_I2C_STATE_READ_BLOCK_DATA_ABORT

Please add the comma at the end of the last line so that we still have
nice diffs
next time we add an element at the end of the enum.

