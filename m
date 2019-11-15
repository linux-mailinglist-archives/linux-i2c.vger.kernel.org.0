Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 305DAFE6BC
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2019 22:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbfKOVCE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Nov 2019 16:02:04 -0500
Received: from sauhun.de ([88.99.104.3]:43742 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726550AbfKOVCE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 Nov 2019 16:02:04 -0500
Received: from localhost (p54B33606.dip0.t-ipconnect.de [84.179.54.6])
        by pokefinder.org (Postfix) with ESMTPSA id 185802C03E3;
        Fri, 15 Nov 2019 22:02:02 +0100 (CET)
Date:   Fri, 15 Nov 2019 22:02:01 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wen Yang <wenyang@linux.alibaba.com>
Cc:     zhiche.yy@alibaba-inc.com, xlpang@linux.alibaba.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: core: fix use after free in of_i2c_notify
Message-ID: <20191115210201.GB8973@kunai>
References: <20191108083648.56503-1-wenyang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Content-Disposition: inline
In-Reply-To: <20191108083648.56503-1-wenyang@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 08, 2019 at 04:36:48PM +0800, Wen Yang wrote:
> We can't use "adap" after it has been freed.
>=20
> Fixes: 5bf4fa7daea6 ("i2c: break out OF support into separate file")
> Signed-off-by: Wen Yang <wenyang@linux.alibaba.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Applied to for-current, thanks!


--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3PEkkACgkQFA3kzBSg
KbaqzBAAoQV5GxF7KrMUwnwhRzNrDaYURGV+A1ny13BABQ40jF9rK8gRwDGurOg1
NG765QeVNZBNUIsOYlJsUxfJb5MdMIDhDS1+O4TizvEodpJVu9z9j4fMfxvxKGtW
prFwnUxvFYVySpfo2zbreBgQ1zX1DO0J1TX50wxnm53IXcl4lqz/KKKNH5J3EYmc
vs68S/3iwjU50xGFecnmBlojog35sXWtXZbLu0FXrR5R0lqzMOS30jzeHi6SoIzw
giL+CQoDqbLv2ucQXFsSI4PIhTVEniSgr1lOiouNkAMEkfTH/ByhugNtQZkh8QcZ
KjfwmKXTcbzngK0QubQOQo7v2sAxIs7fPoi6HUrFeTWKaw6LRjQ/u3jAR0ag84i8
WO2oN0PYu7DEeI1fNkfeX1jeFU2nCF6poBs/xaMNd08mtFRN8WETb8/CCHcqpDbO
VxWyDqeKorF8/OQWn9YxMuRPwGhFnL0nhwRn6fgHL5eCW2+6ct+tYL+r4jUROGk2
eYRSw+iuYUodcjGdc1Y3VBoNgfREIuLR11ITp/evegrwGPm6UNy3TGCobVyY3AWR
6oXoLO8A0FkbW5Cy5FhdLr1SHmKrfKXUaP6aw96Er+FqysHQRE50zJi48+ev7gjT
e1L66WOhy7QXfn9wP0cyuoSKl5HjjrLPzhlwE2u4D0ZTm5ZSv+I=
=ug3Z
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--
