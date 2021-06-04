Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEF339B57C
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 11:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhFDJIP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 05:08:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:51044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229955AbhFDJIO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Jun 2021 05:08:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DAE1613E9;
        Fri,  4 Jun 2021 09:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622797588;
        bh=hz2yLbMIN04mVcnLPlTJJ4FivtW2CO0lFJxtHSFzefs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PbAm2aA/Wwm/Dl33Eb1EKv08lX1DNWUdWwUHDBUVLfD7YzCy9/SCHnuBTESQPrFJ+
         4fHlWbNmmZkhvZDbygNnt9Xe+rXW1EJHNgvfWG7yASigR/Fcx9S1jCe1coMANKWDyP
         6/sBsH0GA14NoSmdoGngZOEbCONbHBGTAyD3exMvQEeqfznADsO2gv5a9vIVJN/OPO
         Z7LhtpZa3z5cf7Zrq3PT7XFXkcGiUwiaMKYzbX8uLTkM/aKbQJuy0h/wWZQKjB45mt
         c48nD7nAP9H5ccTQKBKavMUgz3Z5mRWkBMqOnqjEZCoeQ7Upd08w6USP0rbgz0koz3
         +IZQpYPUFqOYQ==
Date:   Fri, 4 Jun 2021 11:06:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marek Vasut <marex@denx.de>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/16] i2c: busses: i2c-mxs: Demote barely half complete
 kernel-doc header
Message-ID: <YLntC+Sl8MaFFZw4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, Marek Vasut <marex@denx.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-10-lee.jones@linaro.org>
 <YLk7qcWTZnQmLGkW@kunai>
 <20210604084710.GG2435141@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HVpMPg5ody15+ki9"
Content-Disposition: inline
In-Reply-To: <20210604084710.GG2435141@dell>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HVpMPg5ody15+ki9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> IMHO, we wouldn't want to foster the impression that it's okay to
> provide a non-determined effort, safe in the knowledge that someone
> will come along later and finish the job for them at a later date.

Right.

The first lesson from that is that maintainers should require
documentation of the fields when they get added. This was my oversight
because it was back then not reported by checkers, probably. I am sorry.
It annoys me, too.

If I notice that someone updates a driver which doc-errors, then I ask
if that could be fixed by this person, too. It usually works. Not for
drivers without attention, of course. But this is why I don't mind
doc-errors to stay.

If this is considered problematic, then I'd suggest to remove the kernel
doc headers like you did, but add a comment like:

 * FIXME: add missing fields and reenable kernel-doc

To make sure, it is obvious even by glimpsing through the code that
there is work needed.

Can we agree on that?


--HVpMPg5ody15+ki9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmC57QgACgkQFA3kzBSg
KbYAOQ/8C+scGQC4p3+r5I80G/gbqE/SSyxiCum+NVbnGI56Wg7w/LZrg41lB9Cc
50vbSPBv7NTcoewFNfFY+ISV325Y0oeyuAuwF1BVJ/IYvc50cI18PxPYBD5Vn81K
ll1PI/Ue+j/cCRg3a+KpdpNH5/+jQwO5P8tI4m9UgybAXMp+EzgQ+t+MZgXRzsLS
aiQSvmZh1AGgQyo0P0b4GoocuPTQ+tF90+DSH/gVwE17rmN30qXtTm6N6m2kxoyT
7bbdLfOOKaOZPTznB93ZiKPxgz8MTQi3UIWFj3Hid7gbKKYj5+3vjlbLl4CM6eoF
8acl8OdtA4vSM7OmUcN1PWMDGVUyKNyfAGpLwU+5aR2Js9WC0CPg6STfsjW4il1d
/aFLozmv5erxYVSWVs5L6Ss1/PJok5R5HmyLt5DMjBFemjyUYz3H3+En7LEELnr4
WGi7qUaEfsiWJ8av36uyrZlakEo9mfDZwril4XB7skNp7LiK866+w61jdvgVoFbN
AQzTWIrkycPS7awZsrimMOmq5hnTY1zDL3nc3LI7O+04GmzBzNxNIo7x6IF3gajI
k+BoNmoXf84C3l+/wLeK3gqcSADqTteZkkBzJt0M5wIYSk3sMh8ab3I/IBQUJkkR
pnNTLTV5Tl+kdwkEh4PK+FI+SOpQIjqmZVAFGRmUFF7WK4IBW04=
=lxjk
-----END PGP SIGNATURE-----

--HVpMPg5ody15+ki9--
