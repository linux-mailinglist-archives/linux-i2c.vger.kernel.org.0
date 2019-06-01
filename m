Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8878631B98
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2019 13:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbfFALkg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Jun 2019 07:40:36 -0400
Received: from sauhun.de ([88.99.104.3]:49354 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726134AbfFALkf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 1 Jun 2019 07:40:35 -0400
Received: from localhost (unknown [91.64.182.124])
        by pokefinder.org (Postfix) with ESMTPSA id 34A202C54BC
        for <linux-i2c@vger.kernel.org>; Sat,  1 Jun 2019 13:40:34 +0200 (CEST)
Date:   Sat, 1 Jun 2019 13:40:33 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 0/6] i2c: add DT binding docs to MAINTAINERS
Message-ID: <20190601114033.GC1993@kunai>
References: <20190521081509.2586-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8NvZYKFJsRX2Djef"
Content-Disposition: inline
In-Reply-To: <20190521081509.2586-1-wsa@the-dreams.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8NvZYKFJsRX2Djef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2019 at 10:15:03AM +0200, Wolfram Sang wrote:
> Some I2C drivers entries in MAINTAINERS miss their DT bindings docs.
> This series fixes that. Because they are all dedicated I2C drivers
> entries, I suggest I pick them up via my I2C tree.

Series applied to for-current!


--8NvZYKFJsRX2Djef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzyZDEACgkQFA3kzBSg
KbZC0RAAndMtxn+Yq1Eem6mmDmrEV+P0dyHfGAy6Cpfg7CNpi7Y4Rsk6pLbkk5+F
bh+XgEXKw78QGa9nqFesfcKNLN+hvSc10UcZCI0ndsA2dwEXeErfO1RlE/3XDK1m
0sgnTf75777J1JjulY+JHhQ4erhbLRqQ1fFBglzDSIWn9beQ3rOdw28XkTXaRRZg
O6GNbBQs44LuO8qq4jfGsaFYqRKyBLbKJDmDxoTksjvguBW9E6BDI6cdz8bLS8n/
REOTkqCuzFq+Y3qieYU/cnJDj35SZ3Ajukuk+htiVzhZHgHM852giNv8JDC5ICtA
PYks5tB0fU2Wf7AEWh+5DOe9n8YG6HYbMfCJ++GsPwQqsN6tJfLzIHiBfeaRJQ6Y
XnTR+dtkx6Z43TyF9+lHxqVipsPovl64Niuci3l/CcewphGE4Cp9cHlDrZ+UprgK
hP1jVHJ5NacIRT/IpD+6y4W3VudH6TYp2OXuOrFn0OfJvhkWLAcCC/uqxGfxJTaI
kvJ54ymqaawiV6Pdv+/UA1krIYvR60KuCIUTUbqDqFAuH0MHVARFfEV6ccg2TDYd
mfs4ndHxOG8s+YdlgrTA7/QqvrPwFW8MzsRi08zIWGgHNEAuaCSNm9Z0LU8Egy/h
Al7X1SVKYMsl34Nbc0T5Wq0/oxWO6E4Kj1jHGF7eSboZuJKlZYw=
=xhWi
-----END PGP SIGNATURE-----

--8NvZYKFJsRX2Djef--
