Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB6D01E91C7
	for <lists+linux-i2c@lfdr.de>; Sat, 30 May 2020 15:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728769AbgE3Nmj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 May 2020 09:42:39 -0400
Received: from sauhun.de ([88.99.104.3]:33346 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727851AbgE3Nmj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 30 May 2020 09:42:39 -0400
Received: from localhost (p5486c6a9.dip0.t-ipconnect.de [84.134.198.169])
        by pokefinder.org (Postfix) with ESMTPSA id 6016B2C206B;
        Sat, 30 May 2020 15:42:37 +0200 (CEST)
Date:   Sat, 30 May 2020 15:42:30 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: core: Fix compiler warning in
 i2c_generic_scl_recovery
Message-ID: <20200530134230.GA17392@kunai>
References: <20190404130306.13896-1-hdegoede@redhat.com>
 <20190424160349.cxaugkros4gtnytb@ninjato>
 <a4459f0e-67d2-f991-1364-bd5f5c43b139@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <a4459f0e-67d2-f991-1364-bd5f5c43b139@redhat.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Note I'm seeing this with gcc-9.0.1, I've no idea why earlier gcc
> versions did not hit this.

gcc (Debian 9.3.0-10) 9.3.0 currently here. I never noticed this
warning. Do you still see it? Maybe it was just because of the early 9.0
version?


--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7SYsIACgkQFA3kzBSg
KbZWCQ//SeIpoh2v1GhejXHilsCMUI8QDNPf71teK+O3msDMzOT86/N809J3RiuC
MoCBMRZjU/2VcG9z3h299s66new26m5oRXNsaXdk8dL1o8HT8WhoF1DaRAoLh9dd
OxIweq25lxtNktw88b0aZWaSDeMMTL8/x6cEmvzR/WLx1u4SJUWkAUVE6GWvcrJa
sq2jAh+iobuLvO+fd908zaEGo753lc1ReDDeTUHX2sqYqYSFhCFEoypBuCoMvmmO
ubu95h+VGQ3Svd8ufe3RIlm0RLgujQPW+FI/GMuRjSBXUvSbhX7c2Qjm48i9Lok3
biNvW+oHYuECF5TqZ4PCE5GnnySO1WHuOICP8ucS0nWSimV85suaC3rhhqLdKE4c
MH7TMKSjqvIL0nVBpvOQEcVJK5jNuhkiMxR9TtHmbKMH8G854VF6ZLJ4Dg8uqFpP
+KK/+oGKL04BfBjcOF3UCK3v9DOVgAqDN8cMJ579BEWu12ryQjIUvmL8Rv0m6mVw
gPXG/NIDEg55FQgIZKj6OX22fsY9EECq1tag1JjukdTNC32UEMCHdNl/mg+Xn8OY
KYCAynne+i+s/BQL2PXY5sSiDnGMpRf/r323YOKeUadUpvw23JDBW84TkhAfwkhF
UQiqOOPYRwM6Pihybp8iczbdcE8A6ZXidlgfgf/QHIe2AjY3s48=
=CF/9
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
