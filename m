Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6082873EA
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Oct 2020 14:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725871AbgJHMTi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 08:19:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:54764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbgJHMTi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Oct 2020 08:19:38 -0400
Received: from localhost (p54b3300d.dip0.t-ipconnect.de [84.179.48.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F9B020B1F;
        Thu,  8 Oct 2020 12:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602159577;
        bh=fiqDhCMV8n0MQQAK3+HhaM5O8Q7sYp1IPV9oFOCkGkM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ddW8H0o0niAGS4BCnJQdIbJXPI9ZpVGFsLr4OEkhSVahL33fMwrO5tmcyCT/y8R4z
         CdOk9YEfciDL2R7Ic02Tc88dTEIuFhklyFAaBDo2mkRD3RInpc4fVzEZYgBXrB1+6S
         Hf76KAd/Qy9wRlM2sLMK2/s7CaqTmvQeRXiijqxU=
Date:   Thu, 8 Oct 2020 14:19:32 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH 5/5] i2c: geni: sdm845: dont perform DMA for the
 oneplus6
Message-ID: <20201008121932.GA897@ninjato>
References: <20201007174736.292968-1-caleb@connolly.tech>
 <20201007174736.292968-6-caleb@connolly.tech>
 <20201008100352.GF76290@ninjato>
 <27ffa058-c800-4ce7-4db5-8896ad136abf@connolly.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
In-Reply-To: <27ffa058-c800-4ce7-4db5-8896ad136abf@connolly.tech>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2020 at 10:46:05AM +0000, Caleb Connolly wrote:
> On 2020-10-08 11:03, Wolfram Sang wrote:
> > On Wed, Oct 07, 2020 at 05:49:35PM +0000, Caleb Connolly wrote:
> >> The OnePlus 6/T has the same issues as the c630 causing a crash when D=
MA
> >> is used for i2c, so disable it.
> >>
> >> https://patchwork.kernel.org/patch/11133827/
> >> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> > May I ask for a quick review here, so we can get this into 5.9 if
> > qcom-geni maintainers agree this is good to go?
>=20
> Sorry it wasn't mentioned in my first message, this patch depends on the=
=20
> rest in the series found here:=20
> https://lore.kernel.org/linux-arm-msm/20201007174736.292968-1-caleb@conno=
lly.tech/#r

Ah, so the device is not upstream yet and there is no hurry. Good to
know. Thanks!


--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9/A9AACgkQFA3kzBSg
KbaAdRAAiLf1VXITCS45WVKXM7QITSNtCiswN+R+RFL3n18cgTEpjKOoN4fqqUPy
ngVwYlcFd3/qszlZ1KDkUHm5TvTzxWB4cANL9BhnXhB7DfPgsONGix6CBBm0oBzm
dUrl9Li/aZElj43tHXPsntDbqWhQQc8SMGZXl4p/gPdB6OqgQ81El+0h8M0rDPzp
plErJXs2DryZ85hzXgvhyGfxmFpmqmzJAnhpEbCwX9H9+U/YYSBokYL5jK9cX6dK
n9SCAslPphTszQutta3jN/XvR78kZgQFpPs77o0gm4w/DQc5BKVQ1GURy2p/CrJg
taYqvxy1MsWbRj4KfkkgOGR23mflPHnk/+WXcRB/9L/JUmifo/PpAGlGiaQis6H+
gxxqsqqhub51V8VE55mnkfEpfSGR2t+sTs5FgKQG4/wb+K0gUuXU2Qr219/P8UWB
T5yC9NOew5tpFqJGDfw1aezkW+U/kHz7lG5bLOGwHQCTA6v4TgFaPamiqIPBcXT4
qPyOzP9QSF8ETdqC3PCpTFllpHXn+/0r812DPvJTYww9TyE5dPEEG+B+OR/54/ZJ
Pu++c1Kr0P1VPeT8Akh9ezA9ezQM2DX0eqmB9sGmREXlddPbJldOvniJ5uUT2rM1
TZzwF+AN/yL8oDOPkD9BrkiBCmARZCFkp67w980dyofMtjhzatk=
=2INH
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
