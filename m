Return-Path: <linux-i2c+bounces-8984-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D35A06276
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 17:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 442427A1C7C
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 16:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1811FF1AC;
	Wed,  8 Jan 2025 16:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYOUvnJj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172A5259483;
	Wed,  8 Jan 2025 16:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736354848; cv=none; b=BFIh8ovG/E3BkOGisHhaJ3WVnHm9bIoQCBR1NGHLX4ZYEmhDtKvDLiWiiX3STVl3KgYLWYNZgB94hvL3I6th1fZIz1rgHrxiB9rxmHAG2aV2eUmZMdY+VPxzTKO0s/wJY2eW6w+gsj9+soy2ijXz/YZBVzwVMPqY6ntzInedm+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736354848; c=relaxed/simple;
	bh=zdV/M7Np2stMDNGq8YRpW5+Q3zPhTBUvXX+ADFmGbsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qux32mMINEXDqKWy1oMhUQewHWdDetpPxhYr0qUS3gR6GKrFvodaP8P/OrAu35/3isivAdVtavAJ6MMGFuJdybQIoABSjztmh1fqax2mAjxD8xiIruIZuPAK+8ssuTBFFDPWnZv9KuH8DzdsjxNa57t5F1L/0txhCY4u0WJrDLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYOUvnJj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436341f575fso423925e9.1;
        Wed, 08 Jan 2025 08:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736354845; x=1736959645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5rXefMrWPTKahrImn25QCTd36X5louJMKwXjlHttGp8=;
        b=hYOUvnJj6cM7l85mCm74CbMlIYVj8TNboXzU7O2Z+EjmZmjsgvZV4dUD7kLSmX8MUN
         gIhXk4YY40Jlck1iPBmttoAKnfGhUpt6hiY1CwTAdV6aMpeI9Yo0Uc+eNs9RHwRWwuNK
         hhZdqXkCzOvRh1p2mbutFQ8m7SFPfoT5S3+it2k0SIknFkXRVSkn3zMLtlSTRUTzQ/Ny
         JxwVFcIu+UfnO9WIaCx/Urn4D83lt0PmXzbJA6Zm/NG0YWDar3accE/6sW+4ZLC4oRZm
         BNb8Lo8utCwl0mmxLE4lY4y6vXgp23yJHGWneaCYoV+1AYxllAwC+qJijAT3u9S6m8PA
         ySxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736354845; x=1736959645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rXefMrWPTKahrImn25QCTd36X5louJMKwXjlHttGp8=;
        b=W2hLef5pczLJ/OTY4PH0Ekhan+intjzJaZYOXsRcpS8SBU9eMlBlLFc6wFrsOcOtZy
         HIYjUi4YdTyFZCTtst7XseaqcFTYW01vXkM3sSNF7UPbGQZC0dyfJlvwUED2LgglAPAH
         l6vLFnuHeI2o8jIVirEM9kQtbG/S6mYylvTSlOJh/NyMPtU73trAuRhmadBilNeXmTlm
         W86+pcEaohBrRJeDwjOGVd07kYVTfMLErqXS91PHOiM0GTLPAokwdDf8yHbRHEwvoyfJ
         s/IdvQo9fRGB+ZepA6GRD49GKpdBmhHL9WUc0QUTi2Rlh4s67wOOgb4dEAFqdxYRssAV
         hORA==
X-Forwarded-Encrypted: i=1; AJvYcCU8IJBugp7k6EB6pkGAG4OyyDDB7NCzldmaGUfpQR1z/gZepLGjccvrea1UcXDTvh0T6w85pTmQC+xadjY=@vger.kernel.org, AJvYcCW/GwDGdnU+ElR6S4i8V7fWfgsSziYbKjvJCf3a+J4gidJrXElJVyrAY/iXL9omZCjzhr8EM3CIyY2Q@vger.kernel.org, AJvYcCWuCoQpe+vQep08N+G/XNSjwFuWmWyqo9d/2YXOjHfT0s61+wjlZ/grsEOgk4k6nuvZcH/LJuHCrWt+gbud@vger.kernel.org, AJvYcCXGGTI63SNu7nw6FLWMREmMp4TwXSSpUE49zEMNuZ+lHBv07oNx2PW+QSSCk8lFy77hML8EehodVfcL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3i7GRxx43xGnnrWOw0sJt1POnMhFV2ZSvZw3rO85lOW4kA6e7
	XxuwpVfTR8HTDlCpJ7lAi1PBM0oJ0mz4YB4qR9zdhfXZvosuwajl
X-Gm-Gg: ASbGncsm/4VkgnF/p9xHgTIRbWwC8Y9ofHQdNGsDLbHYM0pOCgFPs2MyUSyD6GV2JbW
	7NbOcLghqY0NHRkR+QoplHxCMStuUTfivA830xATCPEckpuepb+HDwQF1KKW7mlyiJc4Qd5NiaJ
	f7oFPsFYItzgQkhhlCpW7LEIrHOqnD8rqbE5Qa0qjK3K9zdl6ALNtENwNeV878Wbt1K1dbmpqPd
	jMzz4C2Ckc28p4yxBnd85Err2ZyLHbM3f8druf8I4ERQWzo6AlKN+YqXw4FE4gMwY9UL+VZ80ue
	dCjEwyGtmYurZM7mQZ1AkxREg1wrawLX8JwwXhuQ2oI=
X-Google-Smtp-Source: AGHT+IH18Qfx1uUgL5R70xhP3eywXiJpDARDOJjtc/m8FEYMSl5cZ8w2/GbFupU2fdQfHHlw9o7SpQ==
X-Received: by 2002:a05:600c:4586:b0:434:f817:4492 with SMTP id 5b1f17b1804b1-436e26f47f9mr36229975e9.31.1736354845277;
        Wed, 08 Jan 2025 08:47:25 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c833155sm52785990f8f.24.2025.01.08.08.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:47:24 -0800 (PST)
Date: Wed, 8 Jan 2025 17:47:22 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: akhilrajeev@nvidia.com, andi.shyti@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, jonathanh@nvidia.com, ldewangan@nvidia.com, 
	digetx@gmail.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: i2c: nvidia,tegra20-i2c: Document
 Tegra264 I2C
Message-ID: <s3jcfkbfffbvumolt7rewbxfysr6q5kcmgsywfhnfshgjumv3b@j4ft2l4ux33q>
References: <20250108110620.86900-1-kkartik@nvidia.com>
 <20250108110620.86900-3-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="osjsxycq7fkl7q5n"
Content-Disposition: inline
In-Reply-To: <20250108110620.86900-3-kkartik@nvidia.com>


--osjsxycq7fkl7q5n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/5] dt-bindings: i2c: nvidia,tegra20-i2c: Document
 Tegra264 I2C
MIME-Version: 1.0

On Wed, Jan 08, 2025 at 04:36:17PM +0530, Kartik Rajput wrote:
> Tegra264 has 17 generic I2C controllers, two of which are in always-on
> partition of the SoC. In addition to the features supported by Tegra194
> it also supports a MUTEX register to allow sharing the same I2C instance
> across multiple firmware.
>=20
> Document compatible string "nvidia,tegra264-i2c" for Tegra264 I2C.
>=20
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>  .../devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yam=
l b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> index b57ae6963e62..2a016359328e 100644
> --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> @@ -80,6 +80,12 @@ properties:
>            support for 64 KiB transactions whereas earlier chips supporte=
d no
>            more than 4 KiB per transactions.
>          const: nvidia,tegra194-i2c
> +      - description: |
> +          Tegra264 has 17 generic I2C controllers, two of which are in t=
he AON
> +          (always-on) partition of the SoC. In addition to the features =
=66rom
> +          T194, a MUTEX register is added to support use of the same I2C

Maybe spell out Tegra194 above for consistency?

> +          instance across multiple firmware.

I don't know if this last sentence makes much sense in a DT bindings
document, but doesn't hurt either. Maybe s/firmware/firmwares/.

Thierry

--osjsxycq7fkl7q5n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmd+rBoACgkQ3SOs138+
s6GcDA/9HHFFe0+JGPUx3tuZJhwCd1DqETeTaSp8bsmnFD/DixmM9/RB5M6oJ6UQ
z/G1/qQKaNzbv2Bk0RnCzCbbuncyPsw+ShFzviqeCvFouwWkxJEgKdwuXUmyGFI4
xtR/Jih6MQig9TpSfFxuQMiSFyjQ3iAA9CDNKOR4C/p8+ZoAuuzFohSKvpRSy4Fg
2acBdyi1bsLKiJsP1Qi1wVJx5YgNmQ79wM59k2Ctpuo54zAUbkL8T1YJcn3GnYbZ
B7ig4zcCsY8nyDHtxpNroFLDwNJEbUcNOFxu8ZumK29AqSpK2PBrjwc5QzZmKKcD
HtOSwUMhuu8zULr+4/coV7peX+oSWWdaULw1jeCbjNQ9wroceo3TWG9nWdRPDJwr
OpoPzUNQd+aiugilNDnXvdI0Np3eh94+H3Iw3dJRf9VDy07FBSMy5pzcE2cjqbzs
Oi/wUAh1smiHlikmyNk02v28vfuT7Lr1kNvFKxoF7NeDCt8gi2VTl0GzFAGXoYt+
dUDW888SeyKs0s9ZHkpmuMNsRrETqsFC4jommlvd+hSivqpGIAb7Q2M0VX9IwVfA
QwrE3MZnvA0WvHUzN42bbYbqTS/0Q+55V4FkIC31wHpIvR5b4NkmB7uiO1SAGRjj
KvD0lpU6a+BtCrWtNvPZ3E9b6iioh3cyq4YN0sUG329ST4+E27Y=
=K0zq
-----END PGP SIGNATURE-----

--osjsxycq7fkl7q5n--

