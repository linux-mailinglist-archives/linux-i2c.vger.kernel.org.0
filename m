Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B75BE2CC112
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 16:41:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728560AbgLBPke (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 10:40:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:34760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728356AbgLBPkd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 10:40:33 -0500
Date:   Wed, 2 Dec 2020 16:39:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606923592;
        bh=tw5DkCya9IdrreTTGxGQ2i9vcONt8rYBYXAc/zTW7aw=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=tx4WE/AwKWpQEuQm5deyIjTPuMNiGnmk3N1+J2p1EqvzEPJ3Vg09GVFLubmX7ehnW
         b5KiDymIB7gnqdJ+PCKCvlr45a4FklEDHuUiQo74oc12w4d8ZfOvhe2V2fezErG95V
         m6CEf/xgdh7bkOyyppPc82koic0bCDM0ArJNHXDY=
From:   Wolfram Sang <wsa@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] i2c: geni: sdm845: dont perform DMA for OnePlus 6
 devices
Message-ID: <20201202153949.GI874@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Caleb Connolly <caleb@connolly.tech>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201112161920.2671430-1-caleb@connolly.tech>
 <20201112161920.2671430-6-caleb@connolly.tech>
 <20201122034709.GA95182@builder.lan>
 <72a37c8c-12e4-eb51-2644-3436d19cf314@connolly.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="17/8oYur5Y32USnW"
Content-Disposition: inline
In-Reply-To: <72a37c8c-12e4-eb51-2644-3436d19cf314@connolly.tech>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--17/8oYur5Y32USnW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> >> -	if (!of_machine_is_compatible("lenovo,yoga-c630"))
> >> +	if (!of_machine_is_compatible("lenovo,yoga-c630") &&
> >> +	    !of_machine_is_compatible("oneplus,oneplus6"))
> > This hack seems to have been working around two separate issues. First
> > with iommu active the GENI wrappers needs to have their stream mapping
> > configured. Secondly there was a bug in the transaction setup that was
> > recently fixed by Doug Anderson.
> >
> > So can you please give the following patch a go? I've yet to test it on
> > the Lenovo machine, but I think it allows us to remove the quirk.
> >
> > https://lore.kernel.org/lkml/20201122034149.626045-1-bjorn.andersson@linaro.org/T/#u

Please don't top-post. I fixed it this time.

> It looks like I still have the same issue even with this patch applied.

So we still need your patch, am I reading correctly?


--17/8oYur5Y32USnW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/HtUUACgkQFA3kzBSg
KbbcvBAAm1IMmcYBVNhAR105L1xiq05+MOhaygfiuncBdAUdaik+2eHW5Xo769H/
2D92cO1VZnhSVfksy6KQ8HAc5XCDMRwAySZr0RwOuWNrHACT6ILO2ScF3FI2dK3j
As+ffGZ5I9x0kni1PKzyNMBPc80VTa59hp8fGE4EblfTHzpLYt0pUPSSpPK4fyC8
hNybhwshofUSijxw0PS+65cpC+Jsd4b+oxc7uGLcAyAMeEBBWYuXJTT5t9CjHr4a
2b2pfEi0J9mH6arWWOoTs9kST1bxaW9DcDTQ30B4V5NGS0/NsQOwxFXqYojYPNNO
Z52ldgeHdwZ4SNnHAKdVJKWQWMvsL+paHgHtxmwg5pIrhf6FziG2lCS1/v0JxEJi
Kg3y4gatIC4yzWTaf9keiq8cLeVuHCJq2cWUn+LpYUZIQwVXayaO747wivmgNo8r
f0JtjdJTHgpA8rFqqZJMMlpTajNWlqNnCIDsSx0W5T44uwGcFm/875OqDOIFSOv/
8c6VzWCkD7SyZrJ/fkm3ferqraOPL/pTOM7ZxVE+t6L5XTVup3iMDSFEcb4Yyzi3
xDFeMKVEtveK4aaCpb/t/u4f8MZy6vs6hN8I18BD3TgHNoS0cmioSdZ0DwrtVADP
vDkTX0vBF3/lGPJoN30Fa/C3RBZaGf4kzusSLuJXMU3MqHPaLpE=
=oGeI
-----END PGP SIGNATURE-----

--17/8oYur5Y32USnW--
