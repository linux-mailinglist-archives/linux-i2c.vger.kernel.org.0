Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B67C14642B
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 10:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbgAWJMa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 04:12:30 -0500
Received: from sauhun.de ([88.99.104.3]:50972 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbgAWJMa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Jan 2020 04:12:30 -0500
Received: from localhost (p54B335E9.dip0.t-ipconnect.de [84.179.53.233])
        by pokefinder.org (Postfix) with ESMTPSA id 0D5DA2C084A;
        Thu, 23 Jan 2020 10:12:29 +0100 (CET)
Date:   Thu, 23 Jan 2020 10:12:28 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg KH <greg@kroah.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] i2c: Enable compile testing for some of drivers
Message-ID: <20200123091228.GB1105@ninjato>
References: <1578384779-15487-1-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline
In-Reply-To: <1578384779-15487-1-git-send-email-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  config I2C_ZX2967
>  	tristate "ZTE ZX2967 I2C support"
> -	depends on ARCH_ZX
> -	default y
> +	depends on ARCH_ZX || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC))
> +	# COMPILE_TEST needs architectures with readsX()/writesX() primitives

The list of archs neither looks pretty nor very maintainable. My
suggestion is that we leave this out of COMPILE_TEST until we have
something like ARCH_HAS_READS or something. What do you think?

> +	default y if ARCH_ZX



--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4pY3wACgkQFA3kzBSg
Kba1NA/9H0SEGYIvfDABmnfbNf6aGYleN3ezYXuNVZcg94mKdl/OS4UHpGthKu2D
ksZt3e2KI/77paY9AXrIlhbrEP8WBJbfvvMwocmv1ce+gy13O6QmFIbEOE42KexE
wtBOdC/gdzqEGJh647HpDIm6ayAYQRCUbuLUSgjbCdVZ0pD51VpHqpEtdUVY0G7d
HyQlHNGuzGztEKwU9TojdYg5dUClxTqAbZdBae3PdDuher3njrsFGlhUTideR0H/
0ZG/aZs5dZLhgTf52AZvgjpuXNIYUO2h5TEd1FN31jbMrTqCty1vfA5ruLzFZPFD
YDwN2Z6nsxiV3vwlevoB71yuPbxMQbBmzYqx9/JBZxjzJuBjaKz/yKkekoWoEpeX
ZYToFGjNYxuIfynfKUDwdz9Lpyui+R2NZ32YWEoYpy9pt7qBUDWGN50db6A8b69G
KkTJpEI2AU0q9fq07GNwZNxv8HW8rAGaJp5lgezQ49N7b8mvNdj/D4EBpAO7dmhn
0p3veACJQv8si5U5PLyq4/771qJJm6qpV/giPMOGiLQl8E+xw96STJdeSOQu6wON
8ne1TGbMKMjydsdk6OWfejgrhuFpF6+m/qyGCkv8TXPrGQ4hJcxW06t5JGEYtOKR
bkUCp38s+dmxnaH1FNWwan0tM3VTQJdl1Qw4TsGsNglxAyyNVME=
=tSe9
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
