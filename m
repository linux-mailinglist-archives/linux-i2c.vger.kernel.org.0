Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64680263D1D
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 08:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727893AbgIJGSU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 02:18:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:46054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727087AbgIJGSR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Sep 2020 02:18:17 -0400
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F2E2F207DE;
        Thu, 10 Sep 2020 06:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599718696;
        bh=Yb+E0PRlu6XWp+SFCdFVy2QdpRJHcT0DRIae7I/j2nU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ypEc5ZDDVu4Jqu+/NmndRj9tWWySD60+6jffn47aHxMEJQ34N4cl3EAvUrfCpZvm/
         pSVMLC3N59ozyXKy2DtvxdSH5Tmk2sTbYbdpQI0DD2jLUmlvEBDXMMbyTPIjR2/lWU
         Ctun7fviFDUDrBFo8iukZrJb68jtd1tlkbpDYrvk=
Date:   Thu, 10 Sep 2020 08:18:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, joel@jms.id.au, andrew@aj.id.au,
        benh@kernel.crashing.org, brendanhiggins@google.com,
        rentao.bupt@gmail.com, ryan_chen@aspeedtech.com
Subject: Re: [PATCH v3 3/5] i2c: aspeed: Mask IRQ status to relevant bits
Message-ID: <20200910061813.GB1031@ninjato>
References: <20200909203059.23427-1-eajames@linux.ibm.com>
 <20200909203059.23427-4-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Content-Disposition: inline
In-Reply-To: <20200909203059.23427-4-eajames@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 03:30:57PM -0500, Eddie James wrote:
> Mask the IRQ status to only the bits that the driver checks. This
> prevents excessive driver warnings when operating in slave mode
> when additional bits are set that the driver doesn't handle.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Tao Ren <rentao.bupt@gmail.com>

I reconsidered and applied it now because this helps whenever slave mode
is used. So, applied to for-current, thanks!


--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9ZxSUACgkQFA3kzBSg
KbY4lA/7BPR/KKPe3DlbFxWjisVzVubyppY3DMDQn/HM5WbyLRuMQN0Szncjq0TS
dQyx/bBDZSUtxRL7P+IXHPJW+4LdR/kkl9Cd5uruSnD5gy2wlgpUeNu7Ox7EoTJ4
GQU76iXiCKwwLr+LXO3FUinO7CV3Q6Id1oItp0i0GaYnkN1BEU612x674yoC0TLg
szWdRfum2fEFik2wH1OONrtQLiua7RxrOAQ8IrW9vuba0ArztdYiioupM/Sph2as
PFnvXEZNZ4Lqag9Yu7RTZ69umjjsvQ0PCMGmyW6gPdXWUt+9erKFlCUpo2APnjHQ
hLz+d1zY6VI57Xy7vM5eVaBXAADLf1p4EtviUHQK2YnBuKt7dvEQkkSzCowShcxS
ykWscCRrAw2cMl6uXZATUQwV71XI8QOotXr0Do76FEuzlLTUWIxtfPsdvj4qVfW4
HkgvnVnUgMINM2WPx910RAi5QxskMuzbqLEgSrSNapUa6xrev3y2cgEvkSe34+fE
6tkdMMtFbXV7opN7JW9xj8iG04p/OzBKvXEG2g4rdZyLnwPziIOc88IexLB/dbej
mAOQjBVwndmjroCqjeTB7G94KQe16y9nh0fHt24driD/txSzPjSAM2qWDhbJWbCE
1M7fIH5V55rFJVtP8BhVGzzcpVzEaF4ATg4KG78srwnwxe9K0ho=
=Eqed
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--
