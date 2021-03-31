Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D71350892
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 22:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232682AbhCaUzX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 16:55:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:50686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232690AbhCaUzU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 16:55:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19D5361075;
        Wed, 31 Mar 2021 20:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617224119;
        bh=pJT5gjTTfqCWP+YyIpkhXwfsnZvDOF+ZqFbwATowrqM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vQrYsoDAjcr28337pzGluXdg4Hodfa27jANRxL+5PMPmPnD9gP4XfFlLQGigrLSIF
         5M8PFYJMcyiKoSbfOKgOqw/w8svms2e4ISL3J2I9G6uEkFr4gFLgSZQPtRdli5oGNx
         Nqb+Q3pAxOSbEPOW1Cmp8QuLHHPzOw3T5CPpmEJ/6gSwEtHOP6lYokR8uLXxobTiXJ
         ymf9wmeBrKDgd64Zkxn/obBV9kZQDjDiHnUbORtPlsgRx/udEp6RBsl+MM4puYn4Ud
         x2GoX/XOnhoWOVKhdFrGe5yhvbT4OW3xoy/0pYNZ0zqPhEGlzvQsgJb5R6qIsl1JpJ
         rA/CVGbQXc+RQ==
Date:   Wed, 31 Mar 2021 22:55:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] Adding i2c-cp2615: i2c support for Silicon Labs'
 CP2615 Digital Audio Bridge
Message-ID: <20210331205513.GA994@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210318115210.2014204-1-bence98@sch.bme.hu>
 <20210318115210.2014204-3-bence98@sch.bme.hu>
 <20210331095820.GA29323@ninjato>
 <CACCVKEHYdUgx1QuJqUz3=OettOJHQWuA1O+ve1ZUDPAWz+n0aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <CACCVKEHYdUgx1QuJqUz3=OettOJHQWuA1O+ve1ZUDPAWz+n0aA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > drivers/i2c/busses/i2c-cp2615.c:78:5: warning: symbol 'cp2615_init_iop_msg' was not declared. Should it be static?
> > drivers/i2c/busses/i2c-cp2615.c:96:5: warning: symbol 'cp2615_init_i2c_msg' was not declared. Should it be static?
> > drivers/i2c/busses/i2c-cp2615.c:102:5: warning: symbol 'cp2615_check_status' was not declared. Should it be static?
> I can forward declare these (copying from the header I used in v1 of
> the patch), but I'm not sure I understand the rationale behind these
> warnings...

Just make them static and all is good.

> > drivers/i2c/busses/i2c-cp2615.c:212:27: warning: symbol 'cp2615_i2c_quirks' was not declared. Should it be static?
> Especially this. I think I will make this static instead, since it
> won't ever be exported to any other module.

Exactly.

> > The missing 'static' are what buildbot also reported and are correct.
> The lkp bot complained about MODULE_DEVICE_TABLE and MODULE_AUTHOR,
> which, again, I don't see what is wrong with it.

Yeah, that may be a false positive.

> I will now send an updated patch, with  few additions too.

Cool, thanks!


--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBk4a4ACgkQFA3kzBSg
Kbazzw//aMs/GVJGCLrvn9s+1KBViH7ko8NtKI9KLzbIkMKT2YWYHHbej3w+ZNTc
Lh0wnDo0A2g5UR3ncn1TkAVF1XJALVPfod1wC7ffD8sElw9mpf9sQZOlMo61f3k7
SFPa+gIYEZXxbFH1AEz6OY44frroBj5f5m4nVTuggzv1zLftntC90UN5c9gyGO5f
BTNy72vzZEoovq9ZwK5nJoEhUYkF2GrZMrOf+jpk7+g2Yf1mZs0v6iYy/YL3HzbC
w6ifLeFECp9CyIgnpeFWJx6xFu06ZpxTi38sSc4abZQ95gE73pbXJSBoX6/CeZYD
aX+UmUZV97cEORG4DsDof6Kui5h5JYrVHHAZrRxhyDJgQMBcV6eS/ey6bChAIoct
Gu03pcs1GOXh458kOjlrzVEFJKfB6qbHu6f3O5fPp6Nf67grAqwvjesnYjvIYK5/
AqN3cULx33FYfdI6HZalLHzbJt3e6p7Rc5JNwlKw9mpLwxu19r05+h0AvrBDCuFF
vT6upSNgdSVY8yKhDuZXFIBNBUiXFJMoptYO4NG02c/Xw9ASjx3fWeIpGqklvv6y
uSoGMdTR/FJXpJtgZwjmXL3T+teTYWPVkfLMcbBu1PSTa2KFZiWTienkY4CB66YQ
hz6UbHWcko3Qn0ztrCschk2scEva+MLxX+7cEChm0lfIZiwysFU=
=pTwX
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
