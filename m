Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9611F8A6B
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 21:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgFNTp2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 15:45:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:44000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726648AbgFNTp2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 14 Jun 2020 15:45:28 -0400
Received: from localhost (p5486c990.dip0.t-ipconnect.de [84.134.201.144])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 42C48206D7;
        Sun, 14 Jun 2020 19:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592163927;
        bh=UexIJE1+BmMAW/xu2aV7gUtjucQdSnzoJ3+eYVvNeAE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zlJvdYZ1wnExQsLhG3teV++fgTn+Dy1YeyJiBu0GrKBaq6/eZbwuUDu5irsMU1BEf
         sFN2Wu3K7627UqR+cLX8pxEipTVzWwv0BCLLsr3KaxdruqRC4zm3efBGgtrqWpL2JM
         +zXJyFItD5+9YbGOko2sNvGi7WreBA9X/9HUA2aM=
Date:   Sun, 14 Jun 2020 21:45:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Daniel =?utf-8?Q?Sch=C3=A4fer?= <daniel@danielschaefer.me>
Cc:     linux-i2c@vger.kernel.org, git@danielschaefer.me
Subject: Re: [PATCH 1/1] Documentation/i2c: SMBus start signal is S not A
Message-ID: <20200614194525.GA7423@kunai>
References: <20200614182355.19742-1-git@danielschaefer.me>
 <8972d446-2c69-787d-f98d-2d565a44c014@danielschaefer.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <8972d446-2c69-787d-f98d-2d565a44c014@danielschaefer.me>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2020 at 08:57:30PM +0200, Daniel Sch=C3=A4fer wrote:
> On 6/14/20 8:23 PM, git@danielschaefer.me wrote:
> > From: Daniel Schaefer <git@danielschaefer.me>
> >=20
> > Just like all other I2C/SMBus commands, the start signal for the SMBus
> > Quick Command is S, not P.
>=20
> Oops, should be 'not A' here, like in the commit title. Will you fix
> that up while applying please, or should I send a new patch?

I will fix it. And congrats for catching this typo which exists longer
than the git history!


--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7mflEACgkQFA3kzBSg
KbYfMA/+KeUiJfbl2tAcAZwfhYQFA4t/8mWnfCt3nQ4t4uXfhwNVbYwmX98OgBr5
DvGVeBk62444gfl3NSuVQl2Am4xSyozqPNK0/ogreVoOpe3szet601yW+Z0R+gqW
cF6gHqsy8ijheE9qwrRGUowev6Y/nhPctzO+1q3ruEJa2hheE/ZgUc0HB6Gl6ezA
OSZNSEW/U77Z2GKnQ0TMBQatdu4P+TvSVJoMPT01qWqYJckloaielz/ANXsi/o5e
8Sg49Io+2zXDmi1HzxXmLtSDW9NebM2lep2I5UaZomwIN7yP1YT/gHk3IVcOBPvv
nuB1iBB6y3yZCQVl1hE07XmuVnf3qLmU6MNjcJJSh9GF/Qa/i4c89or5skqoOrKW
vRj7JrR07lCgIJpCMq8dil5BQpI7est/urJMMKQksGiV+cGKE9JChq6Ejb8pFHE3
+rni2yS163qQsLujJi3A3X+L8N6/pbNn3KDuJyG0DQKYaw1mxe0w3q/Jtz0Drl/N
vhDPwOE6NrIZruJRfg1w9+3EQ8SOCXIOReRsTw2HPhJerMnbtBD+YfaK+XdMqhh9
N+zaZ/W11fUB3AjCilW7xy/S/YA+0X9OIWY2DKrXdVtCHTRrBjPBzIDWaotGXcME
95sWFcA3HuCwegwnvSYWy8y+btWC3yNW8AXx3XDMCx2hT/rv5Tg=
=wnd0
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
