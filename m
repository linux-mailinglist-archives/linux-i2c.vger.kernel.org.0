Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA7EC210819
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 11:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729402AbgGAJ26 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 05:28:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:55580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729371AbgGAJ26 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Jul 2020 05:28:58 -0400
Received: from localhost (p54b334c2.dip0.t-ipconnect.de [84.179.52.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E3C8A20722;
        Wed,  1 Jul 2020 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593595737;
        bh=FSnQ2a8GUJDvhomIUsm53eTUGDIgmLPigf6cM5vfcg8=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=1gDt5ZbBIXbOA73DhArXDo5CAeqAhAuw6gbRad41B77bWC3qpD+LfNtzWHIyVzd2r
         uSuVHB7ZI1DUC8qwfHady2THrYQn/jsfEIRM6fivtJfphoc/QlhaRVMDAQwJCBC4he
         IJq6F4NqiXlf858nImJukIifLhjXDOxQ9w7OtQM8=
Date:   Wed, 1 Jul 2020 11:28:54 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH v2 0/4] stm32-f7: Addition of SMBus Alert / Host-notify
 features
Message-ID: <20200701092854.GE2261@ninjato>
References: <1593070769-9106-1-git-send-email-alain.volmat@st.com>
 <20200630160500.GA2394@kunai>
 <20200701092138.GB3457@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Uwl7UQhJk99r8jnw"
Content-Disposition: inline
In-Reply-To: <20200701092138.GB3457@gnbcxd0016.gnb.st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Uwl7UQhJk99r8jnw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I've just prepared the 1st new serie with only the HostNotify bits in it.
> (basically, the core part, the dt-bindings with the enable-host-notify, and
> the usage within i2c-stm32f7).

Cool, thanks!

> You mentioned in the other thread that you still have some more review comment
> I believe. Is that right ? If that is so, I'll wait for those comment and
> then push that new serie for review.

Yes, for the core part. Please wait for these comments.


--Uwl7UQhJk99r8jnw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl78V1YACgkQFA3kzBSg
KbbdKRAApTeTI+l9N3GO5hhdEtH3C/r7NIC7rj5lCU56vD4Z1/UP0QIQ9FoweiYL
4f5BBOxcJdhK65aeXxhntHC3CBlcAKKAmhdBPY8fu/ha493odmvI4EZx3iF3TVwQ
lVvhSJHXirwu4GNkS0cgdqWtypy1rari2fG2H0Ar5VcOn+imSu24KN4+gcs/3l/Q
Ze+5ey5B/E4o8C2PbumRaAlYuObRRLsHY+z727s07uaEvgpCvBqmfMk+5+3/vIkA
JCVrZ8lDzLaAy1vY3elqHFvlNaaUpMJMVLrnaCvte+Qj8fcE2aO6i/5DwAgivtYB
z1yZbaHbOIVkgDY4PqfcZct7F6mkQXq8zjx/BNocKUeT+wKZYPwzRb6NaubuH/MB
ukFjgQQ7Q0MS4TLdjey5GWbHG91bBjGbG1sCzMvqT6h0+Ik/UXCFZiPW0sRZ3voo
cUQMYvD6BqawtldBkRlVtbqnhGtTCNU1FT8alH2LbesOwdKTlQzYIUxsZTHNnuwL
CjJU2VX/AVrgE981dsE4N2YFhlmnZCJrjMFezsY6+zcWAxqb0WtQKamHuF6fbCYI
4+Oy/1TVSGHtPf/B9kLHo+PyPDnaXofmiL7yC4HkbVVNwhjbHcV7+kbJLkEUv/hN
1NVfAQQPJPrO0hYyJ70fjTeY9foxR3PDVy4chuB1IsLkbzKWziw=
=szi4
-----END PGP SIGNATURE-----

--Uwl7UQhJk99r8jnw--
