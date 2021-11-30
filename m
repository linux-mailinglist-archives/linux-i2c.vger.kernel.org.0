Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30E8746406F
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 22:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240696AbhK3Vpa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Nov 2021 16:45:30 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:59250 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344325AbhK3VpE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Nov 2021 16:45:04 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 9ECCCCE1C5D
        for <linux-i2c@vger.kernel.org>; Tue, 30 Nov 2021 21:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192C9C53FCC;
        Tue, 30 Nov 2021 21:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638308500;
        bh=EmUZcpafmX5TsFiIq/04znbXzCnRq3pY+sxp6gOGOWc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NrYVac+gKeA8hXaeujMSIpbujRfSQ860qaDHplwXIJyuY+/e7Jaowo2B3s7YRqpjx
         wGW69d8xfEBmJoHEOUV4aIJAPTGmfww5OsYeAsCzCEn458x2hIO0TGNDRr40QvF7oH
         7BXogOWtUhrdV7auVjlQ6ApLMdPcZ5Pwghiu4Sg8wvecwsyv4rQGIjPLJG9E6494rx
         rKq6D48KDmeKYoNEzBrB4m3HwUXQ0JjbS0cT98n89mtdttJl/eO/4TEfiC25fREcuD
         +3Hr52011jfFVWewhpr4g44t/4YjMHjSIFpGL4gHNPEgSG/fjnvR9fhTEjvtQY9pdg
         8hrvi2naGZZlw==
Date:   Tue, 30 Nov 2021 22:41:37 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        pierre-yves.mordret@foss.st.com
Subject: Re: [PATCH] i2c: stm32f7: remove noisy and imprecise log messages
Message-ID: <YaaakSa16Dun6b+h@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        pierre-yves.mordret@foss.st.com
References: <20211130093816.12789-1-wsa@kernel.org>
 <20211130162534.GA813993@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XbDZKjp4LqR3YEbT"
Content-Disposition: inline
In-Reply-To: <20211130162534.GA813993@gnbcxd0016.gnb.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XbDZKjp4LqR3YEbT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> - looking at this area of code again, it appears that the function stm32f7_i2c_release_bus
> is ALWAYS returning 0. So it should actually be a void function.  I thus
> propose, if you agree with that, that I propose, and apply a patch PRIOR to your/this patch
> to change that and remove the error checking of the stm32f7_i2c_release_bus function since it is useless.
> Is that fine for you ?

Well, I'd think we can also apply this patch first and then make the
function void, but I don't really care about the order. But we should do
both, I agree.


--XbDZKjp4LqR3YEbT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGmmpEACgkQFA3kzBSg
KbaTaA//RK0kf1EZFsMoMMztOOqBXBe902lbsT1t37s9bqJBJ4I9EiYTSf+AbZjU
rkYmP+gQdR09f+lF0/pAhBYrHJaQMklFgagR6FbZb2+Y1hL2schKU8pPI8YCsc7w
yL26hg30CZeTY26KB2uaFJBf0Wmj1ljyfvBW7uYi5ySINAx2AbzJhYqIOdp0MlC9
jnCKyq30vKmlO4V487RpbrvYeK+PCoqPQSDVVZO2VH92+6RTSJ62pwj3bacWOe1b
FGUmSaTPr26Xar32qRWL//llo2BxJ1IJgu3zeUc/pFXc9z22jIJTayV6BC1UzZCn
f3aN11a7Q1kH6kHinV73YMjfEdvAAIc/ck5TolEoOOMmbMJYyY96wNXOIrzXgyYr
6wlBTZ1NMh0Ry44qWEVqUZhzUKnRJp4/W0OpniepXUuJPAel/gDJTUUfSJ0LYkcR
t/0jSwOyLBCNXJZVPWzVj36KPyR8mlQexegSWWh+doWPot77YkfPntsBYF0o6lw8
Puh02JCr+OS29Om3IBHJvPOzqbfbXFJd1P+MSx7pR0raV/5mDmxI9qaQHm9BrQ3v
qP6gIwkqrGhq66Eco2TWGZSFsTbl6ZupOmL/ya7JP0x17ivSVobC93KXOTVDedXd
aph1M53kFn0VNF6D4AEbbvJpVVRmPvj0c9xPVj34tOlzVVRH/j4=
=9bj8
-----END PGP SIGNATURE-----

--XbDZKjp4LqR3YEbT--
