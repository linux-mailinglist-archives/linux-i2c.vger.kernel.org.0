Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F523260B42
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 08:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728501AbgIHGwX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 02:52:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:33426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728479AbgIHGwX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Sep 2020 02:52:23 -0400
Received: from localhost (p5486cc72.dip0.t-ipconnect.de [84.134.204.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E0FA21532;
        Tue,  8 Sep 2020 06:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599547943;
        bh=OI39OScBqM4ld3JAsC3290WgMwvhZyuaXUCR5m2o3t0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xusxH04xop6ChPXtl4awONVjWQaI0vMi+8s6HkO8h1kcMq6erbtuTvvtoKDDSHhAr
         cYZ7PGJ3gq0lPtT8smHsFbolZ6h3i8/3hYp4e8EywB5fmEzjmm0JRGjncBKKUS3lJQ
         lxIIq1nTdIIZ/1EzdB/IkK4gu3bn5T+MqF7p0dPc=
Date:   Tue, 8 Sep 2020 08:52:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] libi2c: Add a manual page to document the API
Message-ID: <20200908065219.GB5936@ninjato>
References: <20200903120927.482b6eae@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Content-Disposition: inline
In-Reply-To: <20200903120927.482b6eae@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2020 at 12:09:27PM +0200, Jean Delvare wrote:
> It is good practice for a library to come with a complete API description.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Didn't review it, but glad you made it!


--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9XKiMACgkQFA3kzBSg
KbYwBw/+MDeySEzfMPrU2vymB6TrQLzta23LbMJxGl+INarzlqwURwa6mGbe5I55
jP/L38y5bUJtuvq15AKCEPEwd9n6Qdwl3d/Jb5hlguUFCwObWwU1TfxMlDHfvz+j
585k/uqfJxpM8DKJk5fTfywieJmp5Qe7x0lZwt6VYBFbNaIAYg/q5RrefufpACRg
sr7ACVr3JxTId88SiiWi3BZB3CtbMBKNug4JURRKjgdu321KVoXbErIRUZBwRHS3
I93EDk9O8cCh13HLFueFFaDAvaaJzFy+pb8/dsZGx+JILAnQ3K6O2sl9TwL8sHNH
YlJ+OP8LB+DTk7wQB/TrTXgekLneC6fj5j2z9GET978Mf318xgzTnT6dPsor3SF1
Twt5hd9LOIJsQYrBvW9SbB7Z8XSQHg8fDNcG+rZmgFx8GT6tkIrPZbNV7FyuS+bw
a7rb4Vv9wqz2otd/GRCIJ+Ud7o93UxMqEHJ42R/WzAF+z+MxasEfqlXr07SKrckZ
nPQGt6dkj0jhWjPuiDoZ5b+zl/AoRuWXXk11mXIO+ReBdU7x8Ao6HnBO0on7ll9B
1oUjB+Y0LRLwrRg4dDr3hYsPnGvMRZcm0iE0vAoTB3HR8GQC1Z9zyEFM5SmGuKEC
/sbITgEoMYWQcvVbxBked8ruIBea69XiN7MXumCPwxs49d94hXo=
=e8s1
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--
