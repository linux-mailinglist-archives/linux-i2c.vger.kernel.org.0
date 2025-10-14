Return-Path: <linux-i2c+bounces-13482-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B487BD9F64
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 16:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DF96543998
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 14:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A77E315D22;
	Tue, 14 Oct 2025 14:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6782QOK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344CC30F94E
	for <linux-i2c@vger.kernel.org>; Tue, 14 Oct 2025 14:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760451204; cv=none; b=UzAlLkRMOKuw4Gbs5J0M/J5PmMRdQZ5j67iJCY1j9xPbTTFbW8CZUyWBx8mWtqBiyx69hvv3XE4cm2wr5KPtxK2wf938EUH+lOPNoOXHNksiesXngNHV+hY/ZorEgbFP8OlXxxBQ9UEzeTa+9Zk6GUfc7Q7acFvHqcr8MnMZbDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760451204; c=relaxed/simple;
	bh=mTYnJPNoAg22IY/krKLRgI2oWuAXT8sxqyIgCxPtuLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tngGn5ljBbI2Zr1oxWPdxWIw3Ui2T2k93Apm7/p3Nbk4qiCP2pi4Kc/krta+JD2zJWv80Sg5Y6cZIYnyG/xwH09PgZMqnVJPVrdkFESSSjM/YRZOVh/CkjOgIyMmBJirg2p4b8gXZoYDy3xhNpuJQxMu69sJ1oPX2elcPAMkTik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6782QOK; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-368348d30e0so46434381fa.1
        for <linux-i2c@vger.kernel.org>; Tue, 14 Oct 2025 07:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760451201; x=1761056001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z2MtCooci01DsFhVORv2Xd0IZSv5uSvTDLsmJesa9HE=;
        b=R6782QOKWahnMzCBSDZ3I/6Og/BtAXbVoNhVTZpYVq9eXxHoMbfEZAdBeJZsIqi3H9
         DZBT0fJpGT3/g0xxXcbkH5w2DRYkqN+SA7uSJUTOAFqxL0NG1N2I4EwwucYBmXx7o8l4
         Xlfyu9U22eFq5kR57UnD1ipIMdi6FRaSJZPzNvAehejdFjwCvCU8ixmvk/tZ36TX6/6U
         o68XxSWOoVHHcpBJ0KlhMPmHq35XRcu1UKhRqXnIUVvXLmFkEIwkCpDkZio2jHFQhTD7
         Jo5n8CrBKaII4ry8bbvs9ArNBwgVNRgxlfwNngb6FnU7oeh+dJOagDG7By+/qAS+9Jgo
         anag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760451201; x=1761056001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2MtCooci01DsFhVORv2Xd0IZSv5uSvTDLsmJesa9HE=;
        b=ljWEoyihl3K41SVygs6O+AS7MWx0Sy6dtJyFEd8+bej+FPTRd3R3cIs8TPPqJwXVY4
         DhbDjjYhA3DurX1/EVyX7knfacv8bYEldJErf/NS9C2T11Ebq/uycc2oGyWF/d5/WBFW
         GYIg080R0RZ5dth0naofOuw4C8ESVcIk4DE0NwVGGAsfb47PRooK6ZyFE3uiDeP8n03h
         Ty3PWynRQni16sDrnjb2u9M4SyqlnFXrdKCZefgosyxVxf2FRw1mmead7pfRExDb+cvT
         5Hf5zXKLDkpOIIC+P7VX+r6C2+6dznd9za3oPBvvBOvHM+Qnyuj80Ser5AlbPMzFqwbE
         4+dg==
X-Gm-Message-State: AOJu0YwfN9NgYJ4m47tKIB0BJVrJIO8kV/DqbFZD7oOYTooT2RNTnXE5
	RWY3sn6MpuG5NPw0P2DTp7oB892lTpBJVqbzEiLX4ktC1U5DCTtp4YNO
X-Gm-Gg: ASbGncvLN7fZA4pKiE0F329rZjuklT/aaEBC94+pzEMCMUgnLNWIAe5GPiswv14Z65+
	D2x3NqF/tolazESV0tEGlaAXkPQcsI17ISUZeoMyWibcRRjczjBwRK2QyHI6z/CJuYlS2vvTHh8
	5MmGBM1TwMnDWYgYSdee/RsH8nj9tX0EkNXN/kwi4FBefFVvDTx/O561K34KORBubLvHQxXKX8b
	fXC9ScKiHAnBBT8fUXz3MW11xI5gqfpF6dV+1582WmgYT38hQXxZf5wBeyF7ozNqiv48usgjovE
	VHQL+0wfRykRPKPQ3UtaahQj1yXmpXMFhLM1euhAOMfBwZpArVHFWUsq6a6pA4WQKba3D+YSJMY
	cCfW/fTuMjg2B9eaB0PVB9LT3JrcPT+sUde+JutosBT9c0y63zKmXB1yKzscbZaYK0NaPsxkik1
	xwNU2CAynJiqha
X-Google-Smtp-Source: AGHT+IFeEMUY1hlZMIO7vaQDHfSuMopLPItnuGA64biSepIE+VCQtt3fHMYNGXlZMqO0KMdKPxM+lQ==
X-Received: by 2002:a2e:a9a8:0:b0:355:e2d9:9c83 with SMTP id 38308e7fff4ca-37609cea115mr65031261fa.8.1760451201065;
        Tue, 14 Oct 2025 07:13:21 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37634aed265sm38378101fa.8.2025.10.14.07.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 07:13:20 -0700 (PDT)
Date: Tue, 14 Oct 2025 16:13:18 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/5] I2C Mux per channel bus speed
Message-ID: <aO5afkSgjvDViMId@gmail.com>
References: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UtyZG84lIxvJbmRv"
Content-Disposition: inline
In-Reply-To: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>


--UtyZG84lIxvJbmRv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, Oct 02, 2025 at 04:41:31PM +0200, Marcus Folkesson wrote:
> This was a RFC on how to implement a feature to have different bus
> speeds on different channels with an I2C multiplexer/switch.
> As no major complaints on the design came up during the review, I
> decided to submit the series without the RFC tag.
>=20
> The benefit with this feature is that you may group devices after
> the fastest bus speed they can handle.
> A real-world example is that you could have e.g. a display running @400kHz
> and a smart battery running @100kHz using the same I2C controller.
>=20
> There are many corner cases where this may cause a problem for some
> hardware topologies. I've tried to describe those I could think of
> in the documentation, see Patch #5.
>=20
> E.g. one risk is that if the mux driver does not disconnect channels
> when Idle, this may cause a higher frequency to "leak" through to
> devices that are supposed to run at lower bus speed.
> This is not only a "problem" for changing bus speed but could also be
> an issue for potential address conflicts.
>=20
> The implementation is split up into several patches:
>=20
> Patch #1 Introduce a callback for the i2c controller to set bus speed
> Patch #2 Introduce functionality to adjust bus speed depending on mux
>          channel.
> Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
> Parch #4 Implement set_clk_freq for the i2c-davinci driver
> Parch #5 Update documentation with this feature

Any more comments on this series?

Thanks,
Marcus Folkesson


--UtyZG84lIxvJbmRv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmjuWnkACgkQiIBOb1ld
UjKh+xAAkkGlqFuabpDZx0DeOU2tT5KZTfA5XMjR9YkT64Z+9kug4zZ4NxpjjnrN
2+zg81cG9ca1QqErpq0jM5SSp+KxhZJLFElsecig905+4D+oSsDL4XyU59Krwv/s
M59mcKQMKRTsr9D+J7WWoNuPa84qbG3nNusgqZRmHaS/59B5FGOtmWwnpkDbEyg5
sgBupn0y0idAIV+RDoh4YjFXZsXndEmr9lkRDHhmChL5tHC970dsq183ttJSG/tQ
K0kUQ3ilst6ZnDoZ+VIdsTRX60IRzxntAL6N2cay+NNxk1J7NGX2CDZUJpllmzhJ
JER+LjODXPGz86zi7yRCYRiLAQvZbCgrElk0IglfwdGpFWohh+9LD8Q5gmh8Nn9P
X1eDcrR+FFzmSkBt9O4BGsuBZ6U/Op62fpccLooibFbFWuCyKjfZHxVn3MgeJveY
Z9spR5F/G117fESQj+Dn8daAQCwjmMbgUtPKvPSoeh0mPoTXgk8lWx1twsAl9gzL
qJ4/AHjkH0M4bjUkxC6RL3p+GbF/22jgig176Fu3WUSnfjceZK96EmuCsAslGTBC
itO0Grs7yFsWBa5W/EmYKEktqUnrbRPkNkBvqt0Hq/czG88/HkJc0WucI3y0njX0
1vD6sIQ+wdRvx1C+fjVJC5wmGYOLX8VTpuVj0r0vvOQBWry3wEU=
=4xG5
-----END PGP SIGNATURE-----

--UtyZG84lIxvJbmRv--

