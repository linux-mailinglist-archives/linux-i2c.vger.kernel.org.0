Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2437422DF7F
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jul 2020 15:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgGZNfz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Jul 2020 09:35:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:33630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726042AbgGZNfz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Jul 2020 09:35:55 -0400
Received: from localhost (p5486c93f.dip0.t-ipconnect.de [84.134.201.63])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB5132065F;
        Sun, 26 Jul 2020 13:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595770554;
        bh=jCCV8VYmRNQqNG2Se8e8SaJMyZBek/JWVtyEKyzac8k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LH68B0WJmnEaWbSDySqWttA4aypHw/aroEDcF5ZyW4HmwzuIHR99ugDY8963RLMxQ
         Y7P0Rtg5N1eOaRONHKGXrqe2f37KzqbDfvSb77jK68iWRKMVeRVkOfc8gVfYho1omX
         2gtnFBXQw72CRawIIPFNCzchjV6UMEx51g12JSVM=
Date:   Sun, 26 Jul 2020 15:35:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     pierre-yves.mordret@st.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH v2 1/2] i2c: smbus: add core function handling SMBus
 host-notify
Message-ID: <20200726133551.GC16169@ninjato>
References: <1593776168-17867-1-git-send-email-alain.volmat@st.com>
 <1593776168-17867-2-git-send-email-alain.volmat@st.com>
 <20200725202733.GA946@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Content-Disposition: inline
In-Reply-To: <20200725202733.GA946@kunai>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +void i2c_free_slave_host_notify_device(struct i2c_client *client)
> > +{
> > +	i2c_slave_unregister(client);
> > +	kfree(client->dev.platform_data);
> > +	i2c_unregister_device(client);
> > +}
> > +EXPORT_SYMBOL_GPL(i2c_free_slave_host_notify_device);
>=20
> Sidenote: With my recent series "i2c: slave: improve sanity checks when
> un-/registering" this code became NULL-safe (and IS_ERR safe, too).

Stupid me, it is not NULL safe. The functions are. But, we deregister
'client' on our own. It probably makes sense to add some sanity checking
of the parameters of the exported functions.


--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8dhrMACgkQFA3kzBSg
KbbyGxAAqCXGbq/i0jvy+gmv+JJk5HTVXYtglHm52P7iDw0zolpXRm0OEmF4+yRt
4MmbRDeEeQLeR2TvtaziN1q+LNQ2CObxbbVoyjcgNuc9pyo/zoM4No2JNnFqKWUt
k5gl0nzVKXIlmJy2zb0EJT/xoyX+rae4hamgve7t3TvdQC3DS+sFJcReM9AmmMtN
XHdPkrSbwHUhEUfDzmKw63CJZ46ExLmM03Ev08nkxW6YDkpZJeLMmloL54e8aVz7
KEYKO24PUZ4/fzgtvHK7H1baBmALgIn4sR2R6UqgIDE0BDGKP9a6XXUz2S+ZDuja
vmJXZYwwKMgNPjFN5vFku1vxLUQRTNnQGy3cjX0PYW9AVMFcqLt7AOR7qHzNCZv7
t0MFewm19NOJMztPP+iLDPVOTACbuinF9NK4DptHwiBlEF2CIRYmBifJyLFjERW1
Q/S6T1k7u9EQ7ya9Rc6J8j9qk3GU9q6xU6DJtGlMGM94MvqNwdOrhzN9ysrJso7U
tvfiv2lw0yDkQysl1QgtR68xpI2PLBZwahv5t+11M/7A14bd4LAWr+6kZ7Oc8G08
GeCpGIu1Ja1rMV/zPptp4IrxC1BA5GyVYaX6n01B59mK5GZMorzASUv18thLWNtq
k64ubcie8Ka+C6YNvNPe9hs3egA3En5BHIXrZJidbM11PhZjY34=
=AW42
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--
