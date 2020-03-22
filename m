Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC6B318EC79
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Mar 2020 22:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbgCVVMo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Mar 2020 17:12:44 -0400
Received: from sauhun.de ([88.99.104.3]:54376 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726741AbgCVVMo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 22 Mar 2020 17:12:44 -0400
Received: from localhost (p54B33042.dip0.t-ipconnect.de [84.179.48.66])
        by pokefinder.org (Postfix) with ESMTPSA id 3A7F72C0064;
        Sun, 22 Mar 2020 22:12:41 +0100 (CET)
Date:   Sun, 22 Mar 2020 22:12:40 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Kurtz <djkurtz@chromium.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot <syzbot+ed71512d469895b5b34e@syzkaller.appspotmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] i2c: i801: Fix memory corruption in i801_isr_byte_done()
Message-ID: <20200322211240.GD11260@ninjato>
References: <0000000000009586b2059c13c7e1@google.com>
 <20200114073406.qaq3hbrhtx76fkes@kili.mountain>
 <20200222124523.GI1716@kunai>
 <20200320145748.GD1282@ninjato>
 <20200322190813.39b92de2@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline
In-Reply-To: <20200322190813.39b92de2@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Can you please bounce the previous messages in this thread to me? I was
> apparently not Cc'd so I'm missing the context.

Sure, done. Your email address in the thread was sadly the outdated one.


--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl531MQACgkQFA3kzBSg
KbZrig//XkLniI4xzcvSyK2d/ebWUqOdHu3LqisAoXONXpToBiyz16VVPBOHYCNZ
lqXFFAuz1N9qkh8zroAuRkr45OjAKEGd3LFeDIvmTozwrjytfry0OwGxuqp/LZUA
w+9i8JqcofTra/7GPXkVgGwd7KrGQe+tlYKfd+7xDDV6xVy1OW7eaD/81TC15qTF
Zdwuew5Wh7eUILvolCChodFHFOZjqZwSFouBgLQESynJdEeCqb5IEe8olvru2Lf2
BfaIaKnHaEuEG1uvjzk4uxL5AVHebgUs6VENOpw5dogEJGm/vpt8QkccWMMI4jVH
/0nXcVZbyRt1zqkMIrrn0S3ZoDDUFtpijNXjylwFqZZ1ZLZ8fvvTqcktSOM69i4y
dh3dljazaku9if0NGhRPEnLE4lbyZTmUohcE/tlHiPCSpWkcjvU1j/NeETyJIO4a
Ac3PJCJiEfVsbSM9sigr1sEpcS1QVYqe7fckxM7JyLRyMddWLjblo785KHQID4I/
xNVrAU1nq0YjVVHPNtKey3SWZoj8m0u2ogPFUoAehVAnnrVPnpvHKpMBWSVOG8xC
iM2tuX5HkVgXfpD7Be8RgnxVmli9ooLGcuvzivQbWLaoPApjl5tlO1l+TR4Bo/8A
kgVJee2W5ykMRnNBPAPQqC3F2YR3Uh5HqZU7QuLfv2mxVrjdOLI=
=ls6/
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
