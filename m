Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B53F200BE
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2019 09:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfEPH6w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 May 2019 03:58:52 -0400
Received: from sauhun.de ([88.99.104.3]:36972 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726393AbfEPH6w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 16 May 2019 03:58:52 -0400
Received: from localhost (p54B334EA.dip0.t-ipconnect.de [84.179.52.234])
        by pokefinder.org (Postfix) with ESMTPSA id 3A3302C04C2;
        Thu, 16 May 2019 09:58:49 +0200 (CEST)
Date:   Thu, 16 May 2019 09:58:48 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Annaliese McDermond <nh6z@nh6z.net>
Cc:     Eric Anholt <eric@anholt.net>, stefan.wahren@i2se.com,
        f.fainelli@gmail.com, swarren@wwwdotorg.org,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, team@nwdigitalradio.com
Subject: Re: [PATCH v2] i2c: bcm2835: Model Divider in CCF
Message-ID: <20190516075848.GA1033@kunai>
References: <20190508071227.18609-1-nh6z@nh6z.net>
 <4174B26B-4E3A-4CCA-A5ED-BE62A3B5E66A@nh6z.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <4174B26B-4E3A-4CCA-A5ED-BE62A3B5E66A@nh6z.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Annaliese,

On Wed, May 15, 2019 at 10:37:03PM -0700, Annaliese McDermond wrote:
> I=E2=80=99m just following up on this since I haven=E2=80=99t heard anyth=
ing since I submitted the
> v2 patch a week ago.  Wolfram, does this look like a sane approach?  Stef=
an,
> were my changes in v2 acceptable?

There is a bit of overhead involved, but conceptually it looks like an
elegant solution to me. However, I am not an expert of CCF. Grepping
through kernel sources, I don't see many clocks defined outside
drivers/clk. So, I'd appreciate if we could get some ack/feedback from
one of the CCF experts/maintainers.

> I=E2=80=99m happy to go back to the drawing board to change things if the=
re=E2=80=99s a better
> answer to the problem.
>=20
> Thanks for everyone=E2=80=99s patience with me trying to work through the=
 proper
> process.

Thanks for working on this one!

Kind regards,

   Wolfram


--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzdGDQACgkQFA3kzBSg
KbYQWg/5AdfmRi/ctOOZd7sOQgmD0lEnr9/6ymkWQRAGt5Q9ydawpT6Naol0J+wP
3V/a6n6NCsrzRl+8U2SfV6TUPIPGhEz32NwWx3rnbPSG0JKJcoWA3rkPbnZOFWzh
/4jojbUzI6TJQiOpizOKzGex+Pyjb1mo3oSw7mgYPQ13wHISa4gZdy84fjGeQeUf
2XGHQqkPJII47O4inWLXGc81IQfnWld1CGgY87EgY7YgzmwYXDqH/uzfnxVo8CTU
CU5UNiPBnIgdcC9zbkajNqIbPn5OXbZ2AwnNekIXKzAseJcjfciAAJKyo4Wrx8Aa
5HkbkCYxl2FudXhJLhNv+aEl2wOgCi17aujJgMYseDZlfPPL7NZYJ1KSVIbCdam9
XrkOb1ukxbdu4jh+bzQSRkmQoPlcPCV1UVvJOU4yvSzpjqzUKIwqY1OLLAJDvZh2
qNPcI52UWiv1NQLyYflcHWAgweQl7DmxMOVbF8P4FGvkIfY2AJhor1i05KbNzdW2
QMaOjAEE5EHhSARBK2365kfucjpcib3tDrVC+pZsE0uISVUp1Eabs8JeAu+1Vy2Y
HI/3R1BfvgIjhnwv1jPAdD1qND0dD0px5PeQ0Sl/vqx4eW597pHNxUUItHcUpKfU
QhXINFxHkoP45ozosW2YyrVfHFPKDGm0Bf3ZnZcqev5A+GaDQSM=
=XauL
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
