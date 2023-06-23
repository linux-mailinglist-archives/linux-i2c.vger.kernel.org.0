Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4CB73B06B
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 07:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbjFWFzO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 01:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbjFWFyv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 01:54:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17308118;
        Thu, 22 Jun 2023 22:54:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A0CB36198B;
        Fri, 23 Jun 2023 05:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E69C433C8;
        Fri, 23 Jun 2023 05:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687499688;
        bh=4x5m2NOkm1ONDQeEAk8U0GRj1u+DD6HZrCVOefa7O8M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GN/DoF3jS29lcU/sishaTObRTVn/oy4Ud/smQzbtCGRZwcnCjteGPVGPnxvpTbn0J
         4z/HcpHAgbR+ywgupRY1BTSdUMvAUztIxwyuKqoDP+w1J3OCdm2IiSEo1SEakOtqpQ
         nqqPl+9UiDFv16Z4o9XmeBADIf0RY9gJvRZERIe/dUzPXe8h0LpiZkVJ7PeSM9ShzG
         y1AzNBUn6bb4fWf/9pKfeyqAYkwYQRGgaEboQhQdK90KKt8+BaSKTj/4qNKQEnHf2d
         yyTnRmfG0KL+NjMbofhke/5iaeDfaef2yvW/Ih3H1XJy62oAZOEusqw+mU21ANENpn
         4fFJTkgJ5x5YQ==
Date:   Fri, 23 Jun 2023 07:54:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, acpica-devel@lists.linuxfoundation.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Robert Moore <robert.moore@intel.com>
Subject: Re: [PATCH v2 2/2] ACPI: platform: Move SMB0001 HID to the header
 and reuse
Message-ID: <ZJUzpKZhxbMQGxIs@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, acpica-devel@lists.linuxfoundation.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Robert Moore <robert.moore@intel.com>
References: <20230621151652.79579-1-andriy.shevchenko@linux.intel.com>
 <20230621151652.79579-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gSCcacDj0iRH67vA"
Content-Disposition: inline
In-Reply-To: <20230621151652.79579-2-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gSCcacDj0iRH67vA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 06:16:52PM +0300, Andy Shevchenko wrote:
> There are at least two places in the kernel that are using
> the SMB0001 HID. Make it to be available via acpi_drivers.h
> header file. While at it, replace hard coded one with a
> definition.
>=20
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Link: https://lore.kernel.org/r/20230620163534.1042-2-andriy.shevchenko@l=
inux.intel.com
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--gSCcacDj0iRH67vA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSVM6QACgkQFA3kzBSg
KbZMaBAAj1LX4jZ3OETdw1s8CLGCo5c/TWL6kqnV3KBLSvLK56w707AqjY2AmUP8
3aCHS0EQWr/xsgr/CRsbxS8fV7Bo9O8f3MwI0TvL0TXNZ+e0aYZsMzd8X5cldcSc
g/4pVzFb6sMX1hK9q2u+i5Cvkv1e9LO5znvFaUzfkbq4qVpOjNMaTHC+SPyXNNh+
Qcl4wTLzZ4SoQUfujrK73P2mlXu66AH5z4E05l6lsQvsERkb2WTYf3tDDfwg6arT
cwaLNxg85B4k0u5md117Or4mXa5+yprYk/Im2JYLNUs8+KsjVUzGYdjgLCNJmuf6
Pno+kFehoxJ3h5g3+Vtsv/vG6pMBn5/2G3CXoufy5zSvWEZND+DO0s+zazAqBok9
hkeFkwVxnlQuDoEFtM/RtnfJMEs3+h43sgALO0tsSvfuyMbKJnVswvkTFqn7wqBD
5OMlclP+WPfvz7nKTvVupWkN9Fuiss70EzTllDLZfldL2567JIWa3ODrdcLc4Y2S
GZc55h1UeB5oPAyAI+KJgtQe91VeGgKhKoqnXAUb9vUtZtk1DriYkCZXjP8zfcpB
ct5Qdl6QvYpijEg9L74+OYklgUJM9TwsPuMzviR741b7/bfTVPfon16pizt+VwAB
5GUcXDp1Ur9hv+QZROq02qzNg+YwZNwlF7KaYlR87U1RUbDg6cA=
=+g1q
-----END PGP SIGNATURE-----

--gSCcacDj0iRH67vA--
