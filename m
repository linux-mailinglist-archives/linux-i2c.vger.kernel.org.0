Return-Path: <linux-i2c+bounces-5830-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9306E960CE3
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 16:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE5381C225EB
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 14:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62701BC9E6;
	Tue, 27 Aug 2024 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCyoGDxv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE2C1E487;
	Tue, 27 Aug 2024 14:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724767417; cv=none; b=FGHpsYoQKvYm5HYSbNVd4qU+lhsIVtbAgqr7dshvDzCsmM2JlcTIVNZj4F9ZmgOKuDBT1QtbikS1O4eiIYUZ71gw03GHhKOgJ/3nl8gjkfGTV87sRGgVIfNeQsxrF6gx+FGNGazd296GZCEgcy3wEcIqoI3LyvLSqN2WASGUXyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724767417; c=relaxed/simple;
	bh=Zd3UWEQAWdW9Qd64mpZsUzcJ28EFLpA0WpggxzlgmdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgRKomLBkH8vL9WVy9TSn0sSHcQY111lPlyZlVNGMhxFm04ZoEKs7fPLmkMWHszWZn2wm33HdaaJvBtVOLu58CvWxmacp4j/kTLkFnRo8W5kljpOjMUN0LnZnefZ2zyUnch0ykCOOcQBd+z5F7u8jOU08Bv+LJlCU5rema8EV9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCyoGDxv; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5334c4d6829so7690310e87.2;
        Tue, 27 Aug 2024 07:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724767414; x=1725372214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8JWeiRXxJGI0Vclv4nm6xJV1hNbj4TAmtzDNg1YoNwM=;
        b=QCyoGDxvEZLWmzHK22fx/W+OfBlzT5wYR6Q0KIQRjR2In8HbIZqEMK4Q7KgSmZIE09
         cCS6U0+nLlD0M7fh2OidbI630upP4CJcHJZJ1dZTN62NAgJ5xc9p6x1BbTR3qnacNBkZ
         29GoTEygH9erYvSz9O/wk/J7SA8/5lk6QYtjbNUpaa0vUpkWXa1K7r9KMOPpnyvSXPnh
         Sfj7VzNiNXF4n/62zpiEg+VGToHXOPJ4xOvgWnjmPgzCo1Qo6DB2dMMyhdyIFL0fuf/d
         SixfoVOQsnfCz7OQ/XhmVOW13Lg1HEFiboIRECydQWEHcu7XryX9frg8NnDpCD9INcan
         38fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724767414; x=1725372214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JWeiRXxJGI0Vclv4nm6xJV1hNbj4TAmtzDNg1YoNwM=;
        b=Ge2dm94jG+1/s1/ZVHEboJYkePDV3rvptOjnWhEK17sWhM9gqOXhdCaWrefW7DB3hb
         Llj1cjZofSdKCMlerJKVC99ozTpyWd/c3UkyCVrpD8QNTC0VI9Cr8JZPTW/d3nGO6YYh
         LjEnd2vEC1ZvT0/NlaPEvuhYljr5jcSRnljs4LEmcoKXUshbFZxhgxFAeqxc6kw1O2Z0
         oITWq0MogUuX2TMu9HILCB26tU+vPWnD4RUPKgq2ZvColQTRyWGfXcAepp1ZaK8yM73Q
         WSx4YpvJfKBEIK0mub51zK2kvIjLJoJKx+NZv58EApUVBNz++9ybTYtofZMP9y2Hgcqo
         AVVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKv5uu7u3LuiJHRJLoSXxMiukIZO7IKz6rIB7T5lxXZlswb/MDGzYxAPEuos2hnZ0y9yHHpj2OUQdGtbXy@vger.kernel.org, AJvYcCVeJQ4Bkox6dO1z2tBCD4P7FSpZ123ox7eBRjtAD6eXqSa9ElaakXSuxrukp5HpSkWrm/jq3HnExC07GrI=@vger.kernel.org, AJvYcCWCoBRDt4fa59AffJcnSKPD6bH6N51rj824/ICoGo7TEqLQJh7eayj8w3TBxmYHWH1eMlrZPpaVK978@vger.kernel.org, AJvYcCWaNbo8LAl3rR0HyK2szqL522vEnsLbWh6Cc7+8gogWLEALiKBWhYKCHu8b4pjMJnwBJt8ayzVtI8fM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhk7+z7YQsTmj/BJJfrGoBJBEOYDh9JmD0VNQBTvpLlBWehtX6
	X2UTiF/9ca1Az1QJ+YP18Ypauf3R0VseAF/S+i4/4Y59t0VOMxRm
X-Google-Smtp-Source: AGHT+IHH9z8y8Jk5Y64/VlH603lmLgxAmUx7lLlMa6oGyFIoPdeLX9VWwC2ME5CuoIZXp9TP/ncQ/w==
X-Received: by 2002:ac2:4c4e:0:b0:530:ad9f:8757 with SMTP id 2adb3069b0e04-5344e4ee3ebmr2220148e87.45.1724767412915;
        Tue, 27 Aug 2024 07:03:32 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e5878066sm114044666b.151.2024.08.27.07.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 07:03:32 -0700 (PDT)
Date: Tue, 27 Aug 2024 16:03:29 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] dt-bindings: i2c: nvidia,tegra20-i2c: minor cleanups
Message-ID: <rzf7wiv7hvalx4svnnxxsu7z2ciprujxfdwbr7te7cqtmi6xkc@757xhotlbren>
References: <20240820-dt-bindings-i2c-nvidia-v1-0-2763e9a9a1b0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ly2bvxqd2gxrtnkp"
Content-Disposition: inline
In-Reply-To: <20240820-dt-bindings-i2c-nvidia-v1-0-2763e9a9a1b0@linaro.org>


--ly2bvxqd2gxrtnkp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 10:44:23AM GMT, Krzysztof Kozlowski wrote:
> Simple cleanups for nvidia I2C.
>=20
> Best regards,
> Krzysztof
>=20
> ---
> Krzysztof Kozlowski (3):
>       dt-bindings: i2c: nvidia,tegra20-i2c: combine same if:then: clauses
>       dt-bindings: i2c: nvidia,tegra20-i2c: restrict also clocks in if:th=
en:
>       dt-bindings: i2c: nvidia,tegra20-i2c: define power-domains top-level
>=20
>  .../bindings/i2c/nvidia,tegra20-i2c.yaml           | 27 ++++++++++++----=
------
>  1 file changed, 15 insertions(+), 12 deletions(-)

It wasn't clear who you wanted to pick these up, so I've applied them to
the Tegra tree. Shout if anybody wants to take them through a different
tree.

Thanks,
Thierry

--ly2bvxqd2gxrtnkp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbN3LEACgkQ3SOs138+
s6FJLw/9EJKxOGUx2MDN7GO2ZxPMUOTq635/VpYp1fCu+A42npdhNZcNizZ5EIgB
C6ArhW11k+WzmrxEYelzOUEq+VRMwQcFYQGkyEwvvLnj2+YWa+dEUrJNNBGS/6j4
3cGj9dk6dahHDiUDpuHCRyVW7ZQnDBaoZDWIXwhSoqJh3rAJJv1XHLF/1Wer8vtv
4VJ9wTaF0dCh2cK4rWCKXgvethTSHz/Ppnny1CocQ/EjtzEy4K3YtMVLl+cFEann
D0nPl5eczy7VtrSBf3hpJq8LKDyE0F3yVe1JeFZeJxYxBPhBFIki26nQLK7uk0hY
oMGqUK96s8Qj6zEr7fXunZHSNFe/liM4L9Gk+H2RLcfVfuy5OqvFP9A1Z1bHdSFf
Kq/1NtmeASnbVuUYXKJOtO9QdAjQ1IYz/Wwt6eY5cFt36vPOadTNbCjITij4z45Y
CWAs4XGRLTIqAK5sGZ86F3XUU6ePAQllV/s9xAsjKCthAETO2gvtEHyN/Kv23rFa
wOXjWzJNmUirPyt6vRLh6YdsedsNTxCEo5xDe2Zr1LHmvetbXUmfUHDPrPY90/AN
aWswEHm68xTsfTRpHQ3M5B1ImPS9eac5biYqOftgq0Bj4ZKYy9JPPMQxFW6BoEEo
VNvm6DhUy+IDObZuC/JqGi15xJFd9VSyqtDTmBx/Is61A23UqJg=
=wWXh
-----END PGP SIGNATURE-----

--ly2bvxqd2gxrtnkp--

