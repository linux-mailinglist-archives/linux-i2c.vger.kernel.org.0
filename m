Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72594486519
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jan 2022 14:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239505AbiAFNTe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 08:19:34 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:40986 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239461AbiAFNT3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jan 2022 08:19:29 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8098A61BF4
        for <linux-i2c@vger.kernel.org>; Thu,  6 Jan 2022 13:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEEAC36AE3;
        Thu,  6 Jan 2022 13:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641475169;
        bh=wKuEoVv5rbyWcmO8++Qxz4AkeaE80dj+SWwCTOuy0js=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kdz2Yz0HwhaUQ2JDf/kPiDN9mFb8r4PtvOrh33nVrSBnET/FgIjBdJLDQ2uPpjP/g
         IkTGjdCKy61Z0SeSwFJc61IA6WxwKewj0dcHuA4qGGmZZfb2gmG1Z1mDsDZz+Gax0Q
         zArEtuJ5zLZKAMtqsZWOIJZXVrYcAfVzBKz2UIJslAvlENt0bVtJxKaB68RzS7p06D
         ppTuEu/E8jItdMrqQwiKU9qifR8X/QaBDhWK+UheHJizut146gwmq3JCOzZO63STJ9
         RKMiJXdfxZAqLudRNkMuwTq+Kn4gH41ijbusxtqbd7L0UXFeaVYPosYikoGFam9aX9
         DpDr07356e5AA==
Date:   Thu, 6 Jan 2022 14:19:26 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andrea Ippolito <andrea.ippo@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: Touchpad bug affecting several laptops
Message-ID: <YdbsXkRuysOQLT9s@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andrea Ippolito <andrea.ippo@gmail.com>, linux-i2c@vger.kernel.org
References: <CAGhUXvAPb6KXbs3ux+NUvH2v0N5k3nqz_kNcNLuOco=oHQhzVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xXcNxlIWLq9HT4qg"
Content-Disposition: inline
In-Reply-To: <CAGhUXvAPb6KXbs3ux+NUvH2v0N5k3nqz_kNcNLuOco=oHQhzVQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xXcNxlIWLq9HT4qg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrea,

> I have reported an issue here:
> https://bugzilla.kernel.org/show_bug.cgi?id=214597

Thanks for doing that!

> But it seems like it has not been inspected by any i2c expert yet,
> hence many users see their Linux experience on a laptop completely
> spoiled for months now.

It is still like Hans mentioned the last time you reported it:

https://lore.kernel.org/r/70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com

It is complicated and someone needs to tackle it. I have hopes that
Miroslav Bendik is that brave hero because his issue sounds similar to
the one you have:

https://lore.kernel.org/r/CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com

Let's hope for the best there!

Kind regards,

   Wolfram


--xXcNxlIWLq9HT4qg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHW7F0ACgkQFA3kzBSg
KbackhAAiABIWA+eDkhBW6ZErkSOKX+kPmzG6SOJyievIvT1LhwLLCJsu2Jm7jNF
9bqH42tFa6l7CgiGwFJ2gF4rw0Fh9TwgtSEDkStk6DDRzmCuAZVtBPtaz3Oyw635
Szi97D2l763zMF8+3scGrvPKhUXCDkjO07aXazeUcILT1C2pZllRrhOhEoGoqaUV
xinosZBAhp74s260HPp5gnRdOg75fnrJ4IDpbcv6UNYmkY5bv2Bcryd2dGLCYYB1
hx4kiPQ7yhNvxqFnSMEsarGRwp1uJ9OXaQgplGfqs+DwersmwWI/onepzsIK40mQ
2oDAqA18I0Vc/BpT5UFbrEv+bSa0GxvYfa+Wbe2ia6Uxpjy4bRespdkzsf5AW4XR
MvLIbbxTXP3cpVEp+VeUP2Cam1g25Dv5B1WJ574pDDNKxZD9HkuqnmDDgkyGiDPk
7UAwoxJDScwIFgzws24t2OXRr5re9SMmTCJNc9Q6/zGXUo4oaPMEySuStU9bmcUo
uUluzasDMXG6p146QZjuyyohOfiMYo8L8Wzklzum9/hCZmH3CX0c9cSsiYrwy80G
7aoczexOsTx3gNvrxVHh4RL3x+BJ4aqTYq6EHHTfxsk6FhkIWuTtuun9NuNmyLWM
cnIS3scYx6UPDxP8B0H9WZfJrRNTPqULEoF4KpiFnzMQedD6aZE=
=ayf2
-----END PGP SIGNATURE-----

--xXcNxlIWLq9HT4qg--
