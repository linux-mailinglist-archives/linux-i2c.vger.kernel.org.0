Return-Path: <linux-i2c+bounces-1419-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4CE836C22
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 17:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68CD3287EA1
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 16:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBAE546B85;
	Mon, 22 Jan 2024 15:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VkWjM9Lx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD16A4655A
	for <linux-i2c@vger.kernel.org>; Mon, 22 Jan 2024 15:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705937518; cv=none; b=ToZjZ7XhDTDR154MlZ+dPhr67UOdP0j0x19SJxF8jHIYfdNp720N6May/vebUaGH+uO1eJHSJr7gD7uBV15OCyp7niIFZw7RPlTsMpgxbJOk1sh4tN0tY5tNBU6KKpAp7Q9PDwSXwhmtvmmkPrlllap2iqEGZKdyP9S1czwHx8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705937518; c=relaxed/simple;
	bh=D8noVwkJbNFmPqK4QAu8yfNP4zdZTow0yqFrOd9rct8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tAzJ0Rn4GArRsGL8LC49/uVVFuli3D5+ZwMwfr35hEv3yeoUEMJW10dnKqUOAnuuXssS5+qIygeXkngBY3l1z6ZrmFsHD+IFbro4kcX0TlykZ61eRtaYArB0B6hMKSb6ZkM8LY8+pNBBeq4SMpEY0Lsxj4TBqZcfF/vszyPD4Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VkWjM9Lx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49CF1C433B1
	for <linux-i2c@vger.kernel.org>; Mon, 22 Jan 2024 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705937518;
	bh=D8noVwkJbNFmPqK4QAu8yfNP4zdZTow0yqFrOd9rct8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VkWjM9LxRHTMDjO5n7LOZXU20gi+Rhaa+1IZe42qX0FSxU4DQswh6rjsXGtyB0ii/
	 h1kTMa0jspsYdsmmCAE7ROk9sU9l72iVXmrWHDOOV34c14+UMoxWRFxfQR2dka4C4m
	 e4xqZq7O4eT4rHVyi+jbLOcHY8bjKyK0xAbJ4JU09RHHhNMUUQZWRyapzfOYALhnK7
	 pTZcbpRlrqNN0SLIFgCcRZ98Ddvo+RTlVFWkSed6QM6Iw3Jha3pCyhtUG+oZmqD7EO
	 ulC8G4KpqxxQtdtwnXOuhBJzRAVSEnsjj4+dAvGvqtacDsNYxJCxMXI1JzVzUylcjZ
	 DZQaU3RRTVDpw==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc25da95c96so2248336276.0
        for <linux-i2c@vger.kernel.org>; Mon, 22 Jan 2024 07:31:58 -0800 (PST)
X-Gm-Message-State: AOJu0YzwJp86HshA8hNbbcB4mc+qxS2XDtjHpFhHAJVObPUoKdY92ufe
	HuLKd/2GQM6S9MGKBkJiO4zcuNMnIpXURnTgAhh2wr79bGncXcm9cvz9Iq3W/Sqj0uanFNdTgu5
	dL7UsgLQ5BG8B8c0minGJQr8G0ubnrD/hHN/bJw==
X-Google-Smtp-Source: AGHT+IGacHQ2jjBe3z+ou1J6C3EfhjG0Tf1WNr+KFO3I8aWqbXNgOFC5++PenZAwL8K7yrYNRAbtGSMgwN7ecVW7x+0=
X-Received: by 2002:a25:8885:0:b0:dbd:ac60:bcd4 with SMTP id
 d5-20020a258885000000b00dbdac60bcd4mr2355277ybl.75.1705937517525; Mon, 22 Jan
 2024 07:31:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231119101445.4737-1-hkallweit1@gmail.com> <20231119101445.4737-12-hkallweit1@gmail.com>
In-Reply-To: <20231119101445.4737-12-hkallweit1@gmail.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 22 Jan 2024 16:31:46 +0100
X-Gmail-Original-Message-ID: <CAN6tsi4HmKF6tnnjD6qsi=+nj_1wWhGio+WYzUs972wMCWbSNQ@mail.gmail.com>
Message-ID: <CAN6tsi4HmKF6tnnjD6qsi=+nj_1wWhGio+WYzUs972wMCWbSNQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/20] drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:
 remove I2C_CLASS_DDC support
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 19, 2023 at 11:15=E2=80=AFAM Heiner Kallweit <hkallweit1@gmail.=
com> wrote:
>
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
>
> Preferably this series should be applied via the i2c tree.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |    1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 52d91a0df..aca5bb086 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -515,7 +515,6 @@ static struct i2c_adapter *dw_hdmi_i2c_adapter(struct=
 dw_hdmi *hdmi)
>         init_completion(&i2c->cmp);
>
>         adap =3D &i2c->adap;
> -       adap->class =3D I2C_CLASS_DDC;
>         adap->owner =3D THIS_MODULE;
>         adap->dev.parent =3D hdmi->dev;
>         adap->algo =3D &dw_hdmi_algorithm;
>

Acked-by: Robert Foss <rfoss@kernel.org>

