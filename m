Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9EB5214FD8
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Jul 2020 23:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgGEVTV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Jul 2020 17:19:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:48970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728127AbgGEVTV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 5 Jul 2020 17:19:21 -0400
Received: from localhost (p54b33111.dip0.t-ipconnect.de [84.179.49.17])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A7012070C;
        Sun,  5 Jul 2020 21:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593983961;
        bh=FXD/gdqH/jHGhEBRKaYO9nmQwAaJALykDOo4d+tiwKI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zJrD/WhKQvQM9K0YdRRYSccut3EH6g1w44mSgI1XULmSMftn8UlPtahgwxx/eLWzf
         sGJSLIll1SUNeQ2BSksMfRtJCuWr2t+xHs5Fzb/J/L/73OF1Gr6bnFJNeYJDzaU90q
         nqjW/VuIOQOoisJvokXOyQWSt4FLzlUbH5fiDpjw=
Date:   Sun, 5 Jul 2020 23:19:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, ludovic.desroches@microchip.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        linux@armlinux.org.uk, kamel.bouhara@bootlin.com
Subject: Re: [RFC PATCH 1/4] dt-binding: i2c: add generic properties for GPIO
 bus recovery
Message-ID: <20200705211918.GB1055@kunai>
References: <20200619141904.910889-1-codrin.ciubotariu@microchip.com>
 <20200619141904.910889-2-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Content-Disposition: inline
In-Reply-To: <20200619141904.910889-2-codrin.ciubotariu@microchip.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +- pinctrl
> +	add extra pinctrl to configure SCL/SDA pins to GPIO function for bus
> +	recovery, call it "gpio" or "recovery" state

I think we should stick with "gpio" only. That is what at91 and imx have
in their bindings. pxa uses "recovery" as a pinctrl state name but I
can't find any further use or documentation of that. PXA is not fully
converted to the best of my knowledge, so maybe it is no problem for PXA
to switch to "gpio", too? We should ask Russell King (cced).

Russell, do you object naming the pinctrl state for bus recovery in
the pxa i2c driver from "recovery" to "gpio"?


--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8CQ9YACgkQFA3kzBSg
KbYoRg//ZxZViaVZepqw01C0FCm0DHBR5SSlYyULTUSzOVePCmPpJtU4bvWeCYs1
iZbPIKOhi1knWRAhWjhDLaZuriLs/8T1gjOrGM5EnpqLOf5nnOHFHXFb5orvixx0
AMLdnn9aXghktZcMf59K1NgC2DbesMNz3cLPW5CxAoszQruKkzdKwGjsrtZ51qoa
dLyPfeZCUkpwP54g9lwVUQnZ+kn2korFh1mpNKDJdFCnTg7X97g92mUmd5mPhZDl
ej1CkmoAliY4HU13NQKPkbfFBVMqb/nrDVDLoJ4tlrmZTwDXLGPU+uZQpkmk5CdR
rLv7Tz7Muww6ExONj0PlolI5qI6wvgttEMj6Jae6l1suGZMhDDecxuDnZpIK9ZiR
cdfN3t9G1sU6js5yfgSMRP325jTBKhy/zTp1dzLNjsvFhpeeakprOAU/saL+MF67
5r5XLkfrzFJsBRzA4AF8tNdVmQ5TjFpkrmv4MufP9F16Dna++naUfnGnh8uwj/ua
bdjK7EYf8uB13Mo2eFrsdKcMsMY/v2k+wGbrGsu3G3XySV53rj+jVhmgoDG1EhjN
LyXHMImbay87zbyi0tL6tsHLNsb+7RcKGQBjx/8zKwimHwXOalv2S3uCODtZ+Qiu
1eymP0oyJlxX7e84UnayNQosl1hTiezAXHCKWfnBD/RAX/bd4n8=
=2lo3
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--
