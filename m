Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC0D243EFB
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Aug 2020 20:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgHMSmX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Aug 2020 14:42:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:46344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726174AbgHMSmX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Aug 2020 14:42:23 -0400
Received: from localhost (p54b330f0.dip0.t-ipconnect.de [84.179.48.240])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BEFA32078B;
        Thu, 13 Aug 2020 18:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597344143;
        bh=LVhei2pZyPXNA9yHJhBvVTvhphsyWDdUfJi2hl5PCSU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f2jrACc0ns1TaKSHTw/hKKSlrV1qY6nD7vTXW1Kb96+UAdlgSEeMB+ybWc+u5G0oj
         s6EL97G2XHPqYIShfMte2e0dY6p9+F+jYg1JhzkGoBp+lGnwNPIqfq1rcR7bficZOj
         t7CQD/qPxHjWzYRLwNhKWmrWY1G5W54Xx8sWlsAQ=
Date:   Thu, 13 Aug 2020 20:42:20 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Peter Korsgaard <peter@korsgaard.com>
Cc:     Mohammed Billoo <mab@mab-labs.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: ocores: add gaisler to platform data
Message-ID: <20200813184220.GB30119@ninjato>
References: <20200811134426.7613-1-mab@mab-labs.com>
 <87lfii7i18.fsf@dell.be.48ers.dk>
 <CALkjhPpF9wqaZGWQSZ9FphtcXD_obYubFX4te9xtcDdOP4M_gg@mail.gmail.com>
 <CALkjhPrz=0q+sKsB9Y=i4LCCuFVg-bGSzGDyAHaE-XE=qBrVXQ@mail.gmail.com>
 <87h7t67bn5.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Content-Disposition: inline
In-Reply-To: <87h7t67bn5.fsf@dell.be.48ers.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> It does. Perhaps you need to subscribe to be able to post? My earlier

Nope.


--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl81iYUACgkQFA3kzBSg
KbYp+RAAhC5wLVAV4bfeQso0z1s/B4Q7th6ebZpq1MlEdcel+Q6IL3Vjv+WjmHhh
MhBojeLlC6hgNzhxiPVduVN5tUQXxqolldA6H4pAR6XqKIiHutCFPB8kym/Qwg7/
6iEzOVz0iL0yhgsd8WfbAiUrxIP1cBKe4rebu6ayWXLfiDfFThrb0+Br8Np9necI
vR3ArFJfGe3cM97gPyHHHqBhIGfjB6WX9+Y36gH9QW8m2IiFslk7hKxSKAOxYhIA
NKB7HbCzi+Q8SHE/34gQ2NdJjstF7/sXneOD98F2y5Yd+GOQ1RFbMw49fEuREhGg
vfV8cMPULbI89Sg1QC/p8+LPt8jQxKcWNnT9QBcbXarv0b/f8emHBTH6a5A5CHSR
Z5m6daNNW8QojD5Jhhc33bGWhBwlBFT+kWaH5D1xocbPDPkPSzeL8xlJGaR67q1l
8mKiNPnQiaOuCcWX6jKIOG8oKm3ex0v6oHONKpfhxpmaACQfKmouVZeqhQEVF6Rq
6SxdEwiR1xnWWlcJkqUx9B4sAULujNwMwYQbFYId0njyqdO48cB5gOvnN/UDDH77
XKuOqeuPSt98cdF7UKfVbwk1+KdBV5lJgqQoaYkvSf6Ft87iQvWU90RqQwlf4Rp6
MaBZAu6H4ps5fACIecb9ERasqKZp3ypCqKY8v9Siz5KBCuZBl7g=
=/3KI
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--
