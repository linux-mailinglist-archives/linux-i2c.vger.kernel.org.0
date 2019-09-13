Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53C35B21ED
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2019 16:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730442AbfIMO2X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Sep 2019 10:28:23 -0400
Received: from sauhun.de ([88.99.104.3]:36100 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbfIMO2X (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 13 Sep 2019 10:28:23 -0400
Received: from localhost (234.77.63.94.rev.vodafone.pt [94.63.77.234])
        by pokefinder.org (Postfix) with ESMTPSA id 1ED402C3115;
        Fri, 13 Sep 2019 16:28:22 +0200 (CEST)
Date:   Fri, 13 Sep 2019 15:28:21 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>, alokc@codeaurora.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, vkoul@kernel.org,
        linux-i2c@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [RESEND v3 1/1] i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630
Message-ID: <20190913142821.GD1022@kunai>
References: <20190905192412.23116-1-lee.jones@linaro.org>
 <5d71ef95.1c69fb81.6d090.085d@mx.google.com>
 <20190906061448.GJ26880@dell>
 <20190906065018.GA1019@kunai>
 <20190906075600.GL26880@dell>
 <20190906102355.GA3146@kunai>
 <20190906105445.GO26880@dell>
 <20190906183139.GB19123@kunai>
 <CAF6AEGsHOaR1dRf8xGH5sRa38=S+Y3NvNiAJ9DpMkddWoLBw8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5gxpn/Q6ypwruk0T"
Content-Disposition: inline
In-Reply-To: <CAF6AEGsHOaR1dRf8xGH5sRa38=S+Y3NvNiAJ9DpMkddWoLBw8g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5gxpn/Q6ypwruk0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 07, 2019 at 10:56:34AM -0700, Rob Clark wrote:
> On Sat, Sep 7, 2019 at 9:17 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> >
> >
> > > Does this mean you plan to have this merged for v5.4?
> >
> > Only if the machine DTS is expected to land in 5.4. But Stephen said it
> > is not in liunx-next yet?
> >
>=20
> It appears to be in arm-soc for-next:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/log/?h=3D=
for-next

Still not in linux-next. Please ping me or resend this patch once it
hits linux-next.


--5gxpn/Q6ypwruk0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl17p4UACgkQFA3kzBSg
KbYW9BAAmbuD7qUfL9wWm1m0gAjG2VvKTbyG22SMQKbxK1tBv+lIn7Bam5Q/j6zm
FnceT8ZkX4guUKWODkVOJoqrgU8AYuMOHqacTP08myUU3D9AfdmHZ7i3Hw9thNXl
evtohMN5ncbd8Pq6Rny7UqZZ/LV/IHOnEFvSNgtAFWCl91d6ID3kBi0sdmqbgUj7
/3HNJmFtHqdeC61yMcpsbGmCh4vaZ4tv+MwIKOF7goLCubzvsUaicvCF4yVFlqls
5xYSNBUuGvDbAra/q6IB6i754p8+4SVV7hzCpz3wquHZRaVV7PE8+gbLtTrulgpc
A20gW2KOdpS6vsAN3+NqxCx1yMFgBw4Yh5MYxKw7HQS37Z6/fM3mtDTxTGGYHAol
3ywiNokvKi+sDDWnqk4qUhJnIc4/CSeAktlbp7GgE1hK6IeJB3vFpLWql8lCXqxs
KbK71ULKAgFKfvQuj7U9j9gaydVMmLXwDmFLKzHJSrEhMq9Z8zpldXK3LNHpUMTT
KCTp++JE+tYRqpYY8n4RTiEa11l0OHTp7G+e0SdTF+7FijkaHjLYWdoH0us6vZgu
VKbn2y1JnprMW3Awwiwy/2FgFJtMOq4/kJrv/JozlDJeLhxVDtHSi0/l3LdR9KS/
NZockGBMx40MlBpM5eOtgjLZlFEQkdCSMdB60rG0kPL6a+SCpPM=
=AHNK
-----END PGP SIGNATURE-----

--5gxpn/Q6ypwruk0T--
