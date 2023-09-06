Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 161097938C5
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 11:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237567AbjIFJsC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 05:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234907AbjIFJsB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 05:48:01 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D20171D
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 02:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=a1yT
        0IOFHp9HSU2CcA4+eKpH1I+x1AeVbpr+1yuKAJA=; b=CQfHl6+WuVMWepsgbUKx
        OSs6kFzihlQG7CVZLXWb83uKQxmr77GFw+Ol6kYKv7DdgnWEiRxOkBaJ2IrrcoqE
        KAMBEtu4z031Lkizs6jZVe2ZuAcMI7bseatQ3c2HxDh5au/q960ACYookQjGeMnR
        ZvYe28vzaf+JeFRmhXsMtsPoxn5n4UFdFvFJGAO935F+EZ5yXEdBAoCdT9buCRF6
        ZBhwQfLZXTjBrAcF/8gEGTe80s06pYc2b+IpHeAxUxGmNQ+ZT5eW1tlaChz6JmgA
        s1GJbf2iIg98dTmhk2AlKxSRP1K/KaK0tv/bqCO0JrnYbzY3ex4uB60EVK15E8Db
        xA==
Received: (qmail 2773979 invoked from network); 6 Sep 2023 11:47:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2023 11:47:50 +0200
X-UD-Smtp-Session: l3s3148p1@JxD7oq0E41wucrHM
Date:   Wed, 6 Sep 2023 11:47:50 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: rcar: introduce Gen4 devices
Message-ID: <ZPhKxsj6VTmIlKUY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
 <20230904135852.12146-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdUJnKeLJu4-CuDEFty8oW0p9M-D5mcuDv+fFxo-fHvvaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UHvLJwySjydpKWhy"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUJnKeLJu4-CuDEFty8oW0p9M-D5mcuDv+fFxo-fHvvaQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UHvLJwySjydpKWhy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

thank you for the review!

> Note that R-Car Gen4 (incl. R-Car S4) has ICFBSCR bits related to
> Slave Clock Stretch Select (which is not yet supported by the driver).

Thanks for the heads up. I'd need more information about the use case of
these bits. Seperate task.

> According to the Programming Examples in the docs for R-Car Gen3,
> R-Car V3U, S4-8, and V4H, I2C must be reset "at the beginning of
> transmission and reception procedure", so not only for DMA.

Sadly, this is vague. If you look at the example for a combined
write-then-read transfer, then you see that only one reset is done,

i.e.: reset -> write -> rep_start -> read

That would mean that we don't need a reset per read/write message of a
transfer. But a reset per transfer then? I would wonder why because we
could also have a super long transfer with lots of read/write messages
in it. Do we need a reset then inbetween? Or is it really dependant on
the STOP bit being transferred? I guess these are all questions for the
HW team, though.

I was reluctant to add the reset too often because my measurements back
then showed that it costs around 5us every time. Annoying. Maybe I
should take it easy and follow the documentation. But then I am still
not sure if a large transfer with way more than two messages are OK
without reset? I will ask the HW team.

> Also, you didn't the touch the checks in rcar_i2c_cleanup_dma():
=2E..
> and rcar_i2c_master_xfer():
=2E..
>=20
> Don't these apply to R-Car Gen4? I can't easily find where this quirk
> is documented (perhaps just as a commit in the BSP?), but at least the
> "Usage note for DMA mode of Receive Operation" looks identical for
> R-Car Gen3 and for the various R-Car Gen4 variants.

My memory played a trick on me here. I asked Shimoda-san about this
issue on Gen4. I thought I got an answer that it was fixed, so I left
the code Gen3 only. But he actually never got a reply and I forgot to
ping about it.

The latest documentation has now a "usage note for DMA mode" about it
implying that the issue is still present on Gen4 :(

> BTW, depending on the answers to my questions above, you may want to
> replace the rcar_i2c_type enum by a feature mask...

That might be an option. I need to reshuffle my I2C patches first,
though. I'll send some cleanups first to have them out of the way. Then,
I will respin Gen4 support and take care of the DMA RX issue and the new
reset handling there. Thank you for your input!

All the best,

   Wolfram


--UHvLJwySjydpKWhy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmT4SsIACgkQFA3kzBSg
KbaPxQ/+KZOE7Fq3lIvqI/wCRiVaZFK5dgwrxK8nUwOoyjh6dfU7ZRzxZYAVrz0/
cm0gRbcuUFzLigeNmnUK0AgHmyJOIsLRV1EXzsFO6KELiUn1GTd2XU7F9DW9CqNC
p6OOCyCKgqKpp70WO9Xf8n6BnixeqeyqUvfMO/V/PU2YSDKopmov6mQHYRBa3JCh
xfTHRl6pAe7aRuWILXuwR/beasQ9yzLS/wndH5r3OVjzeXwZLZ8IeoTA6zqknE/a
ePQSd2XsJvaA3mS+saKOBsyBkzzpC60SNX0ug7MSAzuTytX2VCWzDo6rIMlIalG4
Hk/VTevu2t+MhI8WJ/TG5WUfgylL1D5X40+cRww3FoVo4vlsWWkOFhZViJMtC8IO
HuO84qxIaBEWxd3DH0N+cfXRa+V2my4KsX4xBWATaevTte8Vm+MDMYJQqoFC9jTq
DMocmVnAIbkTyLgMG9B0jj2VMzF4pL6+y/Otk3w65pMIL5gx/futpwRucJSwdUoh
szzC37/7Hym1pqRhLmRZ8sZv4+yAr1ncJNcveT2ulhJOxS7QCPTsZVxzERVpeXxN
ZLW0jODfwTc0Ge8mShdUfXNt6b86W6UtTrCjDLVHjKJsHJFpZAjzIAXfCR9jlIbe
33O7pN98NxE+d0CEcP6OwvePdF6c9pr5X6AJqDVO+Kk7D9NWOLQ=
=yjCj
-----END PGP SIGNATURE-----

--UHvLJwySjydpKWhy--
