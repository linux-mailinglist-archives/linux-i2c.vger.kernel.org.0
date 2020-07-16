Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C30B2223D8
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 15:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728418AbgGPNZa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jul 2020 09:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbgGPNZa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jul 2020 09:25:30 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD04BC061755;
        Thu, 16 Jul 2020 06:25:29 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id b15so4750402edy.7;
        Thu, 16 Jul 2020 06:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wxDSUON4bNQ6a2DQonZlCF9UZpyQ3jf0SfINVAYmQXU=;
        b=jF5pPaRocAv8Pi3B4xGhssM0BpOzI3j6YCD/OOsmRsMquFLHOM1HvMCbYCf5zcmu2b
         cDO0BJoqyYlROSbHTyY44VTdT0oAIKPx24QLOMwQtBa22eje3SsI0cZlCvXTBRv35PDd
         X0uIf2KbhEbJj18/GVjaBXAw8HNHJ1uMAi83s9oGEzchQgMA9A3B8IyB0fFdFRAgePr0
         2JjsKAGb3a9ZxYvBmVGPSJgqXOlWVnBKmi23dtc73RFMXyXMJe5fc+sGSm22Ir8+CZGt
         DIFs10STo/22lI3Faa22k5075FaY4Mt+C9fQR7Mpp42tznRfBunL4lHnQtYLBmYmqU67
         JZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wxDSUON4bNQ6a2DQonZlCF9UZpyQ3jf0SfINVAYmQXU=;
        b=ODaghb9Zuc4006n52xiXOgTHR/1aMk7JpWaJsP5/KM6MsHds2TCFP9QaHmoi+cmGlF
         AZon0xELbniz8RfoN1kGAHmz1gewq+lA/weCknOQowd6mSI08mFUP4118CKVYroNZUdb
         tgMCdrQqT+YGrPmXUxTiqTNtXLEryOV2qCQ+8SW7LXM1cbavywq6Ict9Q/F9Mqt7RFMo
         ZtH9Tag8jfyZSDnAtKAZTnRrjSdnYCeW8d2Jm4uAFugAJY+bJx7FcPLXOBtTUztVNFcL
         MyE8KejZ+Hfu92Q8QEEOaLZJH7DzW6xeAsbnqIG4lCVGAAsv5dPdppHxTNSEVRiy7Zyu
         voBQ==
X-Gm-Message-State: AOAM531ZzG11dllp7J8ED+LTOWS1je/v7afkuTzpyvxn69FG327SNMlB
        tzq6oXtll/aGL6XEBX3fHXs=
X-Google-Smtp-Source: ABdhPJzFCwsmj6Poe1kED2sdOGgcqVM/kYiz85OwlXHByRn0j+A8T91V658Sx1AmmSYRuO0HG6FDcQ==
X-Received: by 2002:a50:8d5a:: with SMTP id t26mr4682313edt.282.1594905928521;
        Thu, 16 Jul 2020 06:25:28 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id bs18sm5369038edb.38.2020.07.16.06.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 06:25:26 -0700 (PDT)
Date:   Thu, 16 Jul 2020 15:25:25 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com,
        digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH v3 02/18] arm64: tegra: Add missing clocks and
 power-domains to Tegra210 VI I2C
Message-ID: <20200716132525.GI535268@ulmo>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
 <1594786855-26506-3-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J+eNKFoVC4T1DV3f"
Content-Disposition: inline
In-Reply-To: <1594786855-26506-3-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--J+eNKFoVC4T1DV3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2020 at 09:20:39PM -0700, Sowjanya Komatineni wrote:
> Tegra210 VI I2C is in VE power domain and i2c-vi node should have
> power-domains property.
>=20
> Current Tegra210 i2c-vi device node is missing both VI I2C clocks
> and power-domains property.
>=20
> This patch adds them.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied, thanks.

Thierry

--J+eNKFoVC4T1DV3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8QVUUACgkQ3SOs138+
s6F3SA//ZjtMB7xBZ6HBUcP64/WJge+YF7WI2y+H5sKJfBeM0U1C8alR16PQq11z
F96RGmLb3MXmS7xe1GldWEsybS+L6p0earsr70YTyylfbH/n5Y7O/lGIIyuh+GI4
uye1Mzg18tuNCdnc2M/b8guscVfhYYpKROQTEUGOipxUmvW+i0s2A323W6glfBEY
Q2e02KK/6m1wm0YF8I4wwdOBUn0Crel/ojaFeAO/HL21prKj8a+inJPicD2GSn4X
ADDWtoMfHkOaL5zcr8bC05QFZuSRvIajdKKeuJ5xtVGqrTCuLJR1LOfw0xLH7daV
eLxTYcBWRJ/bkNBlUpnluibploP+2bVEHTRDQqhpTFMZoGn30hwL67amumDALk/4
ytsF+tZyXr+ixMzA/iuv76T+GnkFWKm7/qe9bhnNgyV/GooJ26xMOog+m0BUQvbE
D749ofyu7TlH08Y9vkGjXRztqLoXyisyTnNLHaifoUBoMY7W4xROUSScHIZWc6sI
PEZlt+9JJt8uT+1GWWdzphv2Fr1OI1FoWQ645E3dM+GhlqTh/4qde0yAM3iA7MdK
Ihp7UQXIbtiThykIrvMbrSxB0JpIyiXpol9HxXSlyk/HvRqstcc2DgbfDARkPlcb
H4PXNn4diPdJp9ow+yyqHIsDAx6b9YpTO2YBO2aEMjA3CT1ivzY=
=gsdR
-----END PGP SIGNATURE-----

--J+eNKFoVC4T1DV3f--
