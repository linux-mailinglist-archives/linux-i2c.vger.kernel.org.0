Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9950AAACF9
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 22:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387822AbfIEU1r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 16:27:47 -0400
Received: from sauhun.de ([88.99.104.3]:60714 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731823AbfIEU1q (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 5 Sep 2019 16:27:46 -0400
Received: from localhost (p54B335F6.dip0.t-ipconnect.de [84.179.53.246])
        by pokefinder.org (Postfix) with ESMTPSA id 0003C2C00C0;
        Thu,  5 Sep 2019 22:27:44 +0200 (CEST)
Date:   Thu, 5 Sep 2019 22:27:44 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjorn.ardo@axis.com>
Cc:     linux-i2c@vger.kernel.org,
        =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>
Subject: Re: [PATCH] i2c-eeprom_slave: Add comment about address handling
Message-ID: <20190905202744.GB8989@ninjato>
References: <1567695026-20108-1-git-send-email-bjorn.ardo@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Content-Disposition: inline
In-Reply-To: <1567695026-20108-1-git-send-email-bjorn.ardo@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 04:50:26PM +0200, Bj=C3=B6rn Ard=C3=B6 wrote:
> The behaviour of the EEPROM in the case where we only send in a
> 8bit address to a 16bit address EEPROM is not defined. Added comment
> about that the slave-eeprom behaves diffrently from how an actuall
> device does (only one model measured).
>=20
> Signed-off-by: Bj=C3=B6rn Ard=C3=B6 <bjorn.ardo@axis.com>

Fixed spelling mistakes in the commit message, slightly reworded and
applied to for-next, thanks!


--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1xb8AACgkQFA3kzBSg
KbZhkA//VAm7qgsKQbdzkYVOgeDCKfwo0X2pIRY+Quv6sTQ9kEZgRqYc0wvmpek5
cS1b5ChX6SrXk+gPaqR5gcb0cXeCUk8sLj+3V5F5cQlFb7v7VYzNl+9TLMxGxlmq
A7Lgru8IJcQ/KVuGxxMP1UsqmoGotPzRGN83pCoDsp3/shCWDkzr9AFGOO4TYSaL
0qr4pSQdyCiKRP0mYE2PcrBq8QdRsh6LaLJ4foUCTrl38JIncDwfIGJF59RidblZ
pPobZ4WWeU2pYFZLb6PxT1Ex5Otyt05HRh2gfwp6ZnXjLE7XZoRQrfoD8KplKO9L
FM4Sqp8p8b76yPL0puZHrQ+RkzJec3HhP/yYNj+KQtW2iZ5TjMHzLPq4JisSNtaE
4DVyLBxMunFGLNPMZBA1OmADiOA8R8cZ8re2WSJpJ69eiupK7btUXHIokn8K80y+
BM3XQVjfcDrpQaA4Yboa1Kfz1TknFoQzU1aAsLDFc5w4QNHGdPUcvPyotLAMjEUL
sWkiKKcP8q55wWzWR+bfHcMcZ2OamUp2X/RmrutNZfEM+Wmelw7nRhq4ZvYAXPuo
qNFNYbll5BdzvfKeHymqGBZy3m/NoLWl4b+jvUJHzDqJJ0hr+p2xZQSXMd8INZYk
wxZTswtvQpOY8eE4amYgz0hXrL13v5NGZwR/csbSY3yyUdzxl8w=
=bdpD
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--
