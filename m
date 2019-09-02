Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2867FA5378
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 11:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729788AbfIBJ4w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 05:56:52 -0400
Received: from sauhun.de ([88.99.104.3]:36616 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729489AbfIBJ4v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 2 Sep 2019 05:56:51 -0400
Received: from localhost (p54B337C1.dip0.t-ipconnect.de [84.179.55.193])
        by pokefinder.org (Postfix) with ESMTPSA id BCFA12C0165;
        Mon,  2 Sep 2019 11:56:49 +0200 (CEST)
Date:   Mon, 2 Sep 2019 11:56:49 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bjorn Ardo <bjorn.ardo@axis.com>
Cc:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c-eeprom_slave: Add support for more eeprom models
Message-ID: <20190902095649.GA1024@kunai>
References: <1565675708-15434-1-git-send-email-bjorn.ardo@axis.com>
 <20190831132256.GG1032@ninjato>
 <6b5554ce-1d43-5f03-d030-adc234ffc56d@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <6b5554ce-1d43-5f03-d030-adc234ffc56d@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bj=C3=B6rn,

> This is the i2c-controller in the ARTPEC-6 system. The driver itself is n=
ot
> yet upstreamed.

Thanks for the info.

> My line of though here was that the previous code used a flag called
> "first_write" to keep track of which part of the write is the address. Wi=
th
> 16 bit addresses we need to keep track of both the first and the second
> write, thus a variable that keeps track of which write it is (first, seco=
nd,
> third, etc..), thus the name "write_nbr". What would be a better name,
> "write_cnt", "initial_write_cnt"?

Ah, 'nbr' is not an acronym and simply stands for 'number'. I understood
what the variable does, but not the name. I'd prefer 'idx_write_cnt' but
'initial_write_cnt' is OK, too.

> > until Tuesday. What kind of tests did you perform?
> >=20
> The use case we have is to have this code running on one system and
> load the virtual eeprom with a static file. Then another system will
> read this data over i2c. This scenario is the one we tested the most.
> During development I also tested to connect this device to another i2c
> port on the same system and cat files to the entries in /sys in both
> directions and verify that they are the same. I have not run any
> extensive test-suit that tested every possible combinations of read
> and write commands.

I don't think we need to test every possible combination, but focus on
the stuff you changed. Reading the above, I think plain reading/writing
various files has been tested and works fine. One new thing which could
happen now is that for a 16 bit address pointer, only 8 bit get sent
before a repeated start switches to reading data. This can be easily
simulated with the 'i2ctransfer' tool from i2c-utils.  TBH, I have no
idea how real EEPROMs react to this situation. Our driver currently uses
the pointer with only 8 bits fed and the upper 8 bits being 0. This
could be valid. Do you have a real EEPROM to check against?

Regards,

   Wolfram


--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1s51wACgkQFA3kzBSg
KbZgfBAAlIGkDKWgzP/Kau8IBX/Ct9eUhjefsFVTHqtpMIElLCOfXV0kW9T6XySj
nyOdMusayHZaPHQZUaS/GaQSx7zVLr6DpJpyGHnyBdWtUAKvT6ILULTqURoU8PiY
LyHixvvmLzG65P/NwsDxYW0SHJv1h43rbRAVUh+dDDp1e6x5mjXzkc7HOjF9BSqw
Zx2Y2Co51WBHzCe/XjJUCzUsvNbK55rKL1b4+tbXi97TYJfB2fIT2WjIYb6JtQtv
bxBH4yOMqb6Mv7Lr+2jh6WwfQ8Cl+ZoGjsCWiw0i0MGLFmdiYkUKRPHYJ5Uf+Is2
i/lU/D0hEEIOQbdJS6rWpUfTEElkf2qCDqy1EYd7gj4f2dm7uvluZZ6vQvQYQ5qw
PtL4dpja7eePYkvi94+JyzFKkhV+NNWPzBtTtX8JoAan9M3Jyy6Tf2xL3wEcEQwU
hq9KiYjYZhmMJ2uPs7gEwfisG/efc68SySG1AkdGAk3dS9r7sMX1WOMSM5FK1/cp
yeYGBmbqx7AFMbiHO6vWsrl0f+LHRIwIte4pgThTtZf4ERG4xrzJyKCxVdESUqjb
JqcHlBAc81JrAUkFPC9qAAkU7+i4XCTTHYheRibc9/OszVg+nPzC0sLd3UeyRTFH
97FOZGKYb94fm6hmqlGNGJn/J5syh7vwVF4ourZ2VG4ByGE+oXc=
=ykB3
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
