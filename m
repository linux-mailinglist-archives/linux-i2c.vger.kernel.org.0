Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6AF32881E0
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Oct 2020 07:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730568AbgJIF6x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Oct 2020 01:58:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:55084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727311AbgJIF6x (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 9 Oct 2020 01:58:53 -0400
Received: from localhost (p54b3328c.dip0.t-ipconnect.de [84.179.50.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 436482222F;
        Fri,  9 Oct 2020 05:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602223132;
        bh=l+Cv82ziFzL3JZ462cYIhu0k3jJuSCv3WaXT5NlGa2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oOYVNeHhzLav+at6aRTLv0Nh5vNphzztK8v/FijOvDMNxberaEwb+qKRUPb9/JWqF
         NZFG1H84zntpl5dyQCiH9y0BvBDHF95SNENspuoL9BBNWZZ2weEH7P0rr6GxBsXAQe
         kRu2fno4Mfx/rvSoGpBKamP2W72tXf3TC1RPdJU0=
Date:   Fri, 9 Oct 2020 07:58:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Caleb Connolly <caleb@connolly.tech>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] i2c: geni: sdm845: dont perform DMA for the oneplus6
Message-ID: <20201009055846.GA1335@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Caleb Connolly <caleb@connolly.tech>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201007174736.292968-1-caleb@connolly.tech>
 <20201007174736.292968-6-caleb@connolly.tech>
 <bf04cb91-5b2a-c30e-ac85-0437b2aaad23@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <bf04cb91-5b2a-c30e-ac85-0437b2aaad23@codeaurora.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 09, 2020 at 10:56:15AM +0530, Akash Asthana wrote:
> On 10/7/2020 11:19 PM, Caleb Connolly wrote:
> > The OnePlus 6/T has the same issues as the c630 causing a crash when DMA
> > is used for i2c, so disable it.
> >=20
> > https://patchwork.kernel.org/patch/11133827
>=20
> Reviewed-by: Akash Asthana <akashast@codeaurora.org>

Thanks!

Acked-by: Wolfram Sang <wsa@kernel.org>

So, this patch can go in via whatever tree seems apropriate. Let me know
if I should take this patch individually.


--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9//BIACgkQFA3kzBSg
KbbdEhAAoRhxswLC/SuW0GxkobvU9YChQ6TYH3kAocc8NN8xgF9p27u1+rhNj0Wx
UfSCxPTAZ/z+XNmCdqKkKZ8rCuY7KBr/2SWxiNyrXlM2KtMS02OfrzWfKvKJuD+Q
SPZMC1FHgt1rCuhi+TCMJ4eCVbyRK/iFTjLHXHo2HRE4nyJ3MkYFIna88o/oBsPu
tiBMZq8GPbSdp+fQ8+mfZbfgmqQLs+xzUH/SAcVALALyOJVFrIuK8EKqJxBzZoj4
LINYsCkytB9jumElkTgTHbfiFEFbLlvrMtlTi+q3u3qbG4AkpGxrMB8zHX128C9j
sjJGm4OhRPbHds64OuenB2gjJN9aW96BffObWuZZqQ1OA8kJWOjfJvDL8VJJJ5w3
E8NNPP6bmhJNSAhD8hoDKJ4+KM70xyql2ldoMFvQ8+6HBHwZRYquleMyENrAi059
DhEuRS+5MRtHb3Wispur9xuThNpjQ9S0MB+yW9tGzQ860aMCkzRq7rmOm9Uazj7y
/7L6BKeGCL+QhMaSfbXSB8JAKjYGHxpE0umomOd2cVHd4R0/r7zhGlSCyIxLoDto
95uc7mTb/U6wzXCyF+1P7Apy7nXjJopW85h8BY+E8hbTQ8cwRSVEsuQMLsL7ZCkq
rz0us7wmU9IBN3Rmv9BYbPH+aVFjthBn8/0AdaoDEEIM1NqL70s=
=tBda
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
