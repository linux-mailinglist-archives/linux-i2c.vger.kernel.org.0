Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9A991E6714
	for <lists+linux-i2c@lfdr.de>; Thu, 28 May 2020 18:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404800AbgE1QGk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 May 2020 12:06:40 -0400
Received: from www.zeus03.de ([194.117.254.33]:42712 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404688AbgE1QGi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 May 2020 12:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=yJ3BGJ5b2cmv9J+raiUpUj/6sloG
        umi9V7Y0NlOOLYM=; b=MXmNUwHu37JQQujq3vksVT1rUAoY8tXj/6OSMP/1CD2S
        9HQrzoYgvJ8EPSJ4YXgUok445g9RVLhhb2GX3LTOPtdrgiO6LrGDrxjcF/Z2A43I
        BzvH2M8AdaEoy19NsUpbbKd3O2h3HnO+7tO4wm7rW90lLo5XE0A9J6CGrHOzjWM=
Received: (qmail 3613392 invoked from network); 28 May 2020 18:06:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2020 18:06:37 +0200
X-UD-Smtp-Session: l3s3148p1@K8Rig7em1sQgAwDPXxGPADozvWpVH4oj
Date:   Thu, 28 May 2020 18:06:35 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjorn.ardo@axis.com>
Subject: Re: [PATCH 2/2] i2c: slave-eeprom: update documentation to recent
 changes
Message-ID: <20200528160635.GC2875@ninjato>
References: <20200525095934.3058-1-wsa+renesas@sang-engineering.com>
 <20200525095934.3058-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Izn7cH1Com+I3R9J"
Content-Disposition: inline
In-Reply-To: <20200525095934.3058-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Izn7cH1Com+I3R9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2020 at 11:59:34AM +0200, Wolfram Sang wrote:
> Support for 16-bit addresses has been added, so remove it from the todo
> list. Also, in the introductory sentence, may clear we talk about "slave
> IP cores" to make reading easier.
>=20
> Fixes: 82d514815441 ("i2c-eeprom_slave: Add support for more eeprom model=
s")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--Izn7cH1Com+I3R9J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7P4YoACgkQFA3kzBSg
KbZSlhAAnN5Ob72SGez8aBa2fN5gZQGIZ4CnrnZvs6I4mWCqrm4WIoYtx9wkqHW1
LqewFSCXQcBXS6iJGxYg5yxdZwSYjz/4DqAtWG3YJ9eaUISXGF0NjvOWtgS9KVmf
w9ViUNolAuJnFupNYTu6rL5ZdNXMBkzSAbu4oQfj48eMlly+vsecccyZnPyWSjWz
nZjAg3WxiPvvM/jNb3ohBnJcp+sNWzBXVmbvTtvcJutmrSETIB/+fCrl1VsIrJI0
C78unN0O+vJ4sQzhJpU7ORZg7PjZyfRi4u0N/Eii/xUkSV5d22Yt7oO2anFIgOx4
iXsouIngBpRY4/gfBTM9xdNlrPkfQ5H2DtRZjjaC1kVvaqcWAwEsfqNGxvBlf3v5
z6w/VkOH6D+joDzKQ1njCA0cgplkUkDa7dNWNiesY2+YVlqhfNoyUydFXvvbZCHT
hvGOxwK1fhJQdXU1z+OaTlx8RDO7CIwyAjuqorzNecj+Tsxf7zGpJhg/rkhQ8Cz5
l35ny6hmnIlTJnvY0R+i9oerIm8pn573o5zF+v7BKG2mRHXcq2xLceepMI0cGsDl
7+0QikZ3/OTcDicJK5MDJXZ7rD/Cn0SAzqDmRMKx/9DR6T8g9JD1u0klifoKYOJv
6h2KIGUZktqNhmYOkj5Q5bNAH1aC/meAP4lK02M35swm3Gu0JbU=
=ouGr
-----END PGP SIGNATURE-----

--Izn7cH1Com+I3R9J--
