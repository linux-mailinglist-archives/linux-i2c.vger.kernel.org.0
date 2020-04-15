Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1DE1A9BCA
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 13:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393931AbgDOLJ3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 07:09:29 -0400
Received: from sauhun.de ([88.99.104.3]:52766 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393925AbgDOLJS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 07:09:18 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id 958422C1FF1;
        Wed, 15 Apr 2020 13:09:16 +0200 (CEST)
Date:   Wed, 15 Apr 2020 13:09:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH v2 2/2] i2c: i2c-stm32f7: allows for any bus frequency
Message-ID: <20200415110916.GO1141@ninjato>
References: <1585226661-26262-1-git-send-email-alain.volmat@st.com>
 <1585226661-26262-3-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Iys0Un1O+0sigPHU"
Content-Disposition: inline
In-Reply-To: <1585226661-26262-3-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Iys0Un1O+0sigPHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alain,

On Thu, Mar 26, 2020 at 01:44:21PM +0100, Alain Volmat wrote:
> Do not limitate to the 3 (100KHz, 400KHz, 1MHz) bus frequency but
> instead allows any frequency (if it matches timing requirements).
> Depending on the requested frequency, use the spec data from either
> Standard, Fast or Fast Plus mode.
>=20
> Hardcoding of min/max bus frequencies is removed and is instead computed.
>=20
> The driver do not use anymore speed identifier but instead handle
> directly the frequency and figure out the spec data (necessary
> for the computation of the timing register) based on the frequency.

Useful improvement!

> +static struct stm32f7_i2c_spec *get_specs(u32 rate)

This is quite a generic namespace. Can we prefix stm32f7_<sth> here?

> +		if (rate <=3D i2c_specs[i].rate)
> +			return &i2c_specs[i];

Same for i2c_specs here?

> +static u32 get_lower_rate(u32 rate)

Here, too.

Rest looks good to me.

Regards,

   Wolfram


--Iys0Un1O+0sigPHU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W61wACgkQFA3kzBSg
KbZhDA//QrjQyZGByv+sQkmvBPGnIsAXz2Nca2UGy56ln4/UAfHo1NvwTx3mqBJ3
ovBURYObhG5pCwDi0hi/T0jQTXjTHy5KsA/F/OoF/KnJwruXcUa+vLGfcWztPc3c
B/n22uncMOcZ84AadcTWe6wBQOQojeV25sEjfkSMMuFvfzRM/r5NXARqxDdIqsV0
lEtTPBe6ol9wwAZJwYZR3ErrDkic3GBE9aMP8TQzfvsvmMgN/qBWlSEI5Sp9930e
XSVymfMPebXhdUH6cbfTUZ8S+0+c5i/l3KA/BpV1weltc/EueYz9HH/fCsF2FHNW
5RNWV9XHSzkhe0f9ryVPmuNuTFNz9/GRzR1TIio3n/VTemC7cZxCVUQo5VURHWc0
D87DMgOz5dFL48zHLessi8n8/vOpOpweDgMHtPfYzEsIfZIRCjJxXEO+QIMD7cSp
PT26ks9/zK36lqydCx6Jpo1TLTDNlr/dJY8ag6iQjjSWgxQxm354yFTavOds15Ua
i1bGeKwYXkhFyH/TsnzX0I503nQpebW+StiPCIUOnKWS5pWA/8YvDVOAdAULOp0s
pJags5YBAv0Bd8v/mCVnbbzUKXbTuZDIT2f1rbQxl2T4//AfeLhMJ5UPVmczr4DH
08VuS7rAy0VGCvxXrWnoBgcR99qkXG8jHyecTgZzVVPHLVLT5uo=
=rnTO
-----END PGP SIGNATURE-----

--Iys0Un1O+0sigPHU--
