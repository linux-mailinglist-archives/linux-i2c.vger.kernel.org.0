Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26EC34612B2
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 11:42:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346013AbhK2KpT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 05:45:19 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:60544 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348541AbhK2KnS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 05:43:18 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 940E5B80E80;
        Mon, 29 Nov 2021 10:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD8CC53FAD;
        Mon, 29 Nov 2021 10:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638182399;
        bh=dEEOcQfEB95yM+DcjkZPRT2lrjVYea8Y1lBzvzrExkw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lqEICburaTXd7FBOJ8WP1mTsl3Lpk/QJjgwNPL6h4TTf/8aj3FQRIkWnzhSMwz99p
         VQftEDF43EG7hots65fgIwZeVSe8Wk31sszc+P5Au/1VWro6T10ftJ4Ow8ucvKpTT7
         nqOm8ubVUh5TsjYs9V78G+H0Fw/n1SocH27DNOguHiYLuRUAbWZ/44HfFO/yepNTP+
         wyAGK6IDY2viPPbTjJTLFz4EHh4TKDAY9sUFrIgcY5blD9tKz4ZkS47lx9Qy6i7rBC
         isYruR6GPBLAjxTfaBuPI1ImH38EIGALZ2jb1mR+gM4VfOrvVA2TOuJq44nmqAJrfO
         hoSmK05UEGQ/w==
Date:   Mon, 29 Nov 2021 11:39:56 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        andrew@sanpeople.com, mhoffman@lightlink.com, khali@linux-fr.org
Subject: Re: [PATCH 1/3] i2c: at91: move i2c_recover_bus() outside of
 at91_do_twi_transfer()
Message-ID: <YaSt/CXWmZGmt+te@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        andrew@sanpeople.com, mhoffman@lightlink.com, khali@linux-fr.org
References: <20210727111554.1338832-1-codrin.ciubotariu@microchip.com>
 <20210727111554.1338832-2-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3OthpyYLRMGfk6Jx"
Content-Disposition: inline
In-Reply-To: <20210727111554.1338832-2-codrin.ciubotariu@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3OthpyYLRMGfk6Jx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Codrin,

sorry for the super-long delay. There is an issue here with regard to
bus recovery which affetcs more drivers and I can't make up my mind how
to handle it...

> Fixes: d3d3fdcc4c90 ("i2c: at91: implement i2c bus recovery")

Sidenote: I don't think this is a fix.

> +	if (ret < 0) {
> +		/*
> +		 * some faulty I2C slave devices might hold SDA down;
> +		 * we can send a bus clear command, hoping that the pins will be
> +		 * released
> +		 */
> +		i2c_recover_bus(&dev->adapter);
> +	} else {
> +		ret = num;
> +	}

So, one issue is more straightforward. Bus recovery is applied on all
errors. It should only be called when SDA is stuck.

The other issue is that bus recovery is applied after a transfer. The
I2C specs mention bus recovery only at the beginning of a transfer when
SDA is detected low. I think it also makes more sense because the bus
may also be stuck because of a misbehaving bootloader etc. This will be
caught when the check is done at the beginning.

However, moving the detection to the beginning leaves room for a
regression, because your driver already does it at the end of a
transfer. However, I'd think all regressions coming up need seperate
fixing anyhow. Unless I overlooked something, of course.

So, I think it should be moved to the beginning of a transfer, but I am
open for discussion, so we get the best possible bus recovery in Linux.

Happy hacking,

   Wolfram


--3OthpyYLRMGfk6Jx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGkrfgACgkQFA3kzBSg
KbY+Fw//XBnb5n5/XOjcc6s8oJlvjKElkgzd8bDBmXWnRC8XyQPjiWNO4+oXLhOu
UkkIaGzL7RcQEc0Bc1JswFqCK8PKdQQDGCJ+BIpk0e9Yfz0Srwg066PJWBuXtNlw
L+11VKeIPG/18dwrk9HFxP/rQV6mu7hjTAFDUNvUrc7WKR0V/O1ll6ci8RUJ72Vq
y86v+YF3eTOaBhy61AvttrTitCGyVb0m0TWt3i5nYY+BMKVLns96COqw/UE5GA7c
jkhRaScyYy+QWhj3o5myWB3K6ynika+5kh1OhHFYsV9xkrdngAR1bLgroeV9PJ91
EcOZkFJ6fbbaDKBWNeGi4f3UDCpvSyQlPy8uAHXsmF2hGI5SUiW7mWXlezUbQzyk
i3yFNtlsCQ6lY7qM+iA4JXtRSu1vB2wR69kK67RgpNl+K71mFYdutKVPZcDYHAza
yOIB6Su6VYge1G2EaBAhdfopBUJyfDqMIBRgowQqd73urdHT4qcFLhRhnnhssvX6
W2OW7kY3uQvN5Kx1zoxbZGprdMGw/tMIosCesVWWOn+iGNYXiUxpDOr3yyLMvhz2
u1Rpq8Mn99tnA8TSwmuJnlvW7TTsKFY1y5kpbj3U6Uh49FAPyQMeS2jqT0L7fd58
rrWJ3M8BUS05ISoyfWvrqaOmW6YjIMCqYGOgmxLdEkyd9uppPTM=
=dQkj
-----END PGP SIGNATURE-----

--3OthpyYLRMGfk6Jx--
