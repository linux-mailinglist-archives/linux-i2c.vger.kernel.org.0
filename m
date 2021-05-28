Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFF74393E73
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 10:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235665AbhE1INC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 04:13:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:43314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230187AbhE1INB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 04:13:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE723613D4;
        Fri, 28 May 2021 08:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622189487;
        bh=nTpZYj8T50obfP/gOWNJZOk7cTQMZWYDkJeXsHFzFt4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hAuswPccSd5PNajb21LhrXERffLP1B2ZQPKooIljM6YgSYm+/U9IVAhYOhPZ8rh/R
         7WaGTPIX17NIS5GT06DuRHz+osEnYdWgdcxllLr3fKZ4HQvsj6ept6lbQH3nt0zf6n
         qKKikdcVHcP/XBjvjpugzqf5wOXEYFGfNcq6h4N2V6ldAVNktj/uEd1YJ+uM1apKx8
         DeW9erXiKubD6XycrnX/J2JW2El1OBguew5Ndl7MJoKPyGwdKqE9I6GVkk+rUX203p
         Vgl82LbpUpN/U+R/am3yP+I3ydncLSmDNibwQfyb8G/7kycyIzBai3vuvHrYsSwyeB
         Oe9T85pZO+ffw==
Date:   Fri, 28 May 2021 10:11:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, skananth@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V11 1/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
Message-ID: <YLClq6hZKUA1Y4ZW@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>, swboyd@chromium.org,
        dianders@chromium.org, saiprakash.ranjan@codeaurora.org,
        gregkh@linuxfoundation.org, mka@chromium.org,
        skananth@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
References: <20210525131051.31250-1-rojay@codeaurora.org>
 <20210525131051.31250-2-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ek337UlQrmDDG+TY"
Content-Disposition: inline
In-Reply-To: <20210525131051.31250-2-rojay@codeaurora.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ek337UlQrmDDG+TY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 06:40:50PM +0530, Roja Rani Yarubandi wrote:
> If the hardware is still accessing memory after SMMU translation
> is disabled (as part of smmu shutdown callback), then the
> IOVAs (I/O virtual address) which it was using will go on the bus
> as the physical addresses which will result in unknown crashes
> like NoC/interconnect errors.
>=20
> So, implement shutdown callback for i2c driver to suspend the bus
> during system "reboot" or "shutdown".
>=20
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm=
 GENI I2C controller")
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>

Do we need patch 1 after patch 2 was applied? I always thought all
devices are suspended before shutdown/reboot?

Nice to see that 'mark_adapter_suspended' becomes useful again!


--ek337UlQrmDDG+TY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwpasACgkQFA3kzBSg
KbYxaQ//ZoP6wYYkxIedf6wA51iLmKm16cI2fTF5PkMosb8js+bEB0ffK5NryrVX
zPdkmFNLHC9TsKp003YeBSdfJIAv8QQwdB9gHq4rscCcZyuFRgmjGxPPOlZzL7ce
qddFnVVond15qVi1DcdW/gap6OqK0QvjX4ZMEDhi38QpXtLC+cZEiZgjQkqNxwXG
eeVYE/nEO5I368PBfIfTRtjWSlVoJnWKYzfEoysm+cgkaANQwxp2ElI3c2P3qXTU
VwCPZFAS2cDk1LQSdmMq4ugqEyekBkBFxubTFDeCPQR7XBlNE1VqecTF1h5GGU+X
ZgCHltEjukcPyPbr1ocY7gtUnH8xpwDjyWa1yKjariIO9IwtMAgSgYI+Nt0ieQZv
3snvjuVVcvmFYteRfXf4u4CK+/52bSLKsie/bcI3Nhrk58hC0zdTO2OXyvr9LeBg
GzcIQoRbc+PIS0auopwnSXehNDesDLhVO3E0KQ1qu+et2z1vCchypCJVauzT97Al
n4JuK0KTBvVejTy2Z/VaMQBHBbjkFcP+X64jyezJMvyV4NMjkBOWZ44ckHWjfxbs
/7C6YPhC+BLxcQN82lpZrK/+cPAjaqga7i1OJyKit1iWWowHpU8lRsYMySUAf97w
L7N/etgPoDeIjotZNWZ0GUeXilAH3/CaczUuh7lLe+kL9Vsb1O0=
=3DXB
-----END PGP SIGNATURE-----

--ek337UlQrmDDG+TY--
