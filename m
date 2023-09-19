Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 635F17A6BE9
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 21:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbjIST6g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 15:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232400AbjIST6f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 15:58:35 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9263AF0;
        Tue, 19 Sep 2023 12:58:29 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36ADC433C7;
        Tue, 19 Sep 2023 19:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695153509;
        bh=u5J60Ej28pkPmBREqk2gvlRHjHeyOQZbOqVKESDiB38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nPK4IEa+cHBjYn+8qMhyyX9boPLxquwqbGt5MMT6vE1lF23feceMSYAlIaxgjheBW
         dkmzu/tDku+jgNs8XUX6Bl+wKUaCy14qoMUPpxbqJ8Vd8Lgbep+zNdo+XUT71MzVJm
         9wjM0yAkcrOX5mTV+7XViirdryXol77c0xfYRAYqWS9M0YrnU4DkYmBG0sLtRceNoX
         ++ymTbFgMv10j434XPxYi1vdTOXl6Og+9MhiIjoHkF+vVHpaaODISwYI02GHkI0Zjp
         jM4URh/vSoflyeeCSPhuCPPFuQxfKReG5NbFbc7/0WNrq3XULa0kcfhUiKvtm89mYT
         tqE55FP1h/WEg==
Date:   Tue, 19 Sep 2023 21:58:26 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yann Sionneau <ysionneau@kalray.eu>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Julian Vetter <jvetter@kalrayinc.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Borne <jborne@kalray.eu>
Subject: Re: [PATCH v4] i2c: designware: fix __i2c_dw_disable() in case
 master is holding SCL low
Message-ID: <ZQn9YtgWKQpUM4od@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
        Julian Vetter <jvetter@kalrayinc.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Borne <jborne@kalray.eu>
References: <20230911140749.32386-1-ysionneau@kalray.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="szkZFZrLxc3RDUOO"
Content-Disposition: inline
In-Reply-To: <20230911140749.32386-1-ysionneau@kalray.eu>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--szkZFZrLxc3RDUOO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2023 at 04:07:49PM +0200, Yann Sionneau wrote:
> The DesignWare IP can be synthesized with the IC_EMPTYFIFO_HOLD_MASTER_EN
> parameter.
> In this case, when the TX FIFO gets empty and the last command didn't have
> the STOP bit (IC_DATA_CMD[9]), the controller will hold SCL low until
> a new command is pushed into the TX FIFO or the transfer is aborted.
>=20
> When the controller is holding SCL low, it cannot be disabled.
> The transfer must first be aborted.
> Also, the bus recovery won't work because SCL is held low by the master.
>=20
> Check if the master is holding SCL low in __i2c_dw_disable() before trying
> to disable the controller. If SCL is held low, an abort is initiated.
> When the abort is done, then proceed with disabling the controller.
>=20
> This whole situation can happen for instance during SMBus read data block
> if the slave just responds with "byte count =3D=3D 0".
> This puts the driver in an unrecoverable state, because the controller is
> holding SCL low and the current __i2c_dw_disable() procedure is not
> working. In this situation only a SoC reset can fix the i2c bus.
>=20
> Co-developed-by: Jonathan Borne <jborne@kalray.eu>
> Signed-off-by: Jonathan Borne <jborne@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>

Applied to for-current, thanks!


--szkZFZrLxc3RDUOO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUJ/WEACgkQFA3kzBSg
KbY3DQ/8CVPVpHGcdgEAUE9igmoNvHYnDkPsuowZoT3tvE/iGYd80gU63jiUzL7v
nG1XWLhDQPUho+HJHVPNAAbxM/CDZLtEnhTrsyqeZWmI1zsIffb2hDN+wpyHGOCZ
am5S8M78n3IilV+83zvX5TVxHvkIYqS8xDebPXQgBfO1bZ/0MkKI3XF3FsObj/Wc
RC7UjZsHNrlsnFDK7+xImFzXHXjLnK6BZYzt4urGgE2gffkyUKMfVaydztyZGeeC
SCox2f+jBMso3XnYprMamK5QlszvsyUgZ6OZJ0SI6BPJJbfFdlSXkOdgxOQWacBn
aYpa/gtUIv0vOFwdV/bIIxUfzEXsUua5OTu1L3jdJjlnhyzQX6a4U/IKWuKrTUqC
v8blCTXa7HcCvDrAe8ZNKPIaph+LZii9zPj4c20DWVaXDMQOvBEPr+mK/OLkst0s
tS2qdZ0kAljCBkNaYwrAqQXYnf5pF+DlpW7WB+zxLUew11K+mUsKR4Ewe0HcpnQa
0LRG68Hlm0h2YwbLiOMC2wJeweexOKwIMIt7Gxu01u9ZfvRV4gI2LdENZ0q0mNhR
yQdu4hboFZRDL5k3TEoy95031+O/3BGB1UWubAKJV82jdJ9aC6SfdeExYiyxqZlo
juHJ95PkHUX2zOcMrZzBg7p7l6WOwJ+4xKtlXKRp87uTUycSHSY=
=trD0
-----END PGP SIGNATURE-----

--szkZFZrLxc3RDUOO--
