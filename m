Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF81C481BD5
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Dec 2021 12:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239062AbhL3L5z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Dec 2021 06:57:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235195AbhL3L5z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Dec 2021 06:57:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01526C061574;
        Thu, 30 Dec 2021 03:57:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 920E561694;
        Thu, 30 Dec 2021 11:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C05C36AE9;
        Thu, 30 Dec 2021 11:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640865474;
        bh=vMqHk8ghipqUen+vprV5cKzarEz6IMW/lwm1I9ywHxQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HniHpQN0tq2sPsW5VGo1aiGHgAUaDndroaS2R7SSRMJ0/QPo8LJdsnS8sHt/LxI6Z
         4xurloKI/BsRBjWdgYXJ/vnzxGNvKAhjbpo2JHRHlcxwA0ZuRLVM7Jy0zVyLGszAMk
         z6bjG+mcp96ESAST4Lq6INk3X8FJsmN/J14kCM+LzGt/UZ0/Y5KPILQft9TvPPQcni
         UTtaf8zhN5eRjJ2VbykKaEZgIVBvuCCR0SzzlljDRAuTXhrCrqmPla53ifavlza+OC
         Fpqae7Uj3Dxox4Rgy2Zliqmo5Il/dOqQ6wjOKgwIrp/OdznPwaDLVtOx+qQM/hKn8Y
         fN1EI2o95PD8w==
Date:   Thu, 30 Dec 2021 12:57:43 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-i2c@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH 00/12] ACPI / pdx86: Add support for x86 Android tablets
 with broken DSDTs
Message-ID: <Yc2et4jHuAErcx+H@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-i2c@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        linux-serial@vger.kernel.org
References: <20211229231431.437982-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+2rVaTgfBnyNr7DK"
Content-Disposition: inline
In-Reply-To: <20211229231431.437982-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+2rVaTgfBnyNr7DK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

> The ACPI core changes are in patches 1-3 of this series. Since the
> i2c and serdev ACPI enumeration changes are very small and depend on
> patch 1, I believe it would be best for patches 1-3 to all be merged
> through Rafael's ACPI tree.

OK.

> Greg and Wolfram, may we have your acks for this please?

I don't know the gory details of ACPI, that's why we thankfully have I2C
ACPI maintainers. If they are happy, I am, too.

Kind regards,

   Wolfram

--+2rVaTgfBnyNr7DK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHNnrMACgkQFA3kzBSg
KbYSZxAAm72a4Vgkgdhyaa5oOUOV359a9Q8s44WB8ITlFIZkuKQF/bpvt2d789J7
rJ4Dxz/ehx55g6LjDP5pIOMpnB17esDZon0QUCbceGBE50CsPUFJJeFO3/dEusa3
U91dQeKRAZBH5fY1H5MLw2AdzzYvKKOEdGIHvVf+H782e64pxTi2aobdX+Taj93l
h0BfmQToqXRVixx8cN255/D7D+3SLSoh/BqIP0Vletfc3IA4WjA1DbFfFiK3hVGh
IWXDCpxG2dNfeQwBbp2hN3nPYQB4+t0hgAW/6BxWORz7QXAKu22xerVNOQui9Zui
ZSEoJ8uNgcWqaUIhhNxQlpCDaEwLeHfu4Edipzz1Y5oEPkOarHr/eZQhYnug4urt
jBZX8AR5P53ym22c2mWaL2AWs96XoJZJec45a5ZwSfQUY9BYF/wsSYmoFQqfYmc/
fQ8xhjHO9sLc/jOLsUh1ysIomG6INDzipNcLTS+DAfdjOluog0mxKQ/KtfATttiY
uNYudvPX2LsL1QAUycXHnoPUnWDJ/NuRf4zdW+EgwvBTHP1brWkRX9whA2gaQoA5
emuOC9P4X0WljorAdPjsQx62ybjKtkj7JFMBlYuFdtcMpq2Vj4MXMMHxDPtRd+rw
8XX5LsgWW8Ey6CYHfJ7TXNX+9Lomi9zR4Wn1SEVbeZ5q5lUYWgQ=
=7afY
-----END PGP SIGNATURE-----

--+2rVaTgfBnyNr7DK--
