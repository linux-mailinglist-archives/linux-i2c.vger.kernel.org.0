Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 787345F22EB
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 13:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiJBL2y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Oct 2022 07:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiJBL2x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Oct 2022 07:28:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EFB22A731;
        Sun,  2 Oct 2022 04:28:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1A633B80884;
        Sun,  2 Oct 2022 11:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126CBC433C1;
        Sun,  2 Oct 2022 11:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664710129;
        bh=TtIDDL4wBXtCvgef+3dOu9MZeXfNc0gFZw+7TG/tx5w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pl3N7MvLZL7usFt1HjGhxvuMBLY7BbB7VXGd4CrrgqLi1qSLpjsG+qobogoFVg0ca
         QNcWr+rWx42UW+wrwC6Y+vg2KBzgPWJ2TATpXt3EaYcTR9vc7VR2OLOrkqPIjeRaON
         f41CXJAhc7dTcWt1ZGA0G1BrwueFuslv35guVY0zCZb8CJooxHJhjNv/HxVj4k7gFC
         hnZB1iYRbavvjjYZWy+p/lbs86Srh9ar0TvLoeT9j7YIeyrAfaNKsHv59/7p05/672
         upZOz9AU3iE77wYRDM8XXiRUY9lXQOl4VN2cp7IuG6F8+9QLCNjg2snuvyK+QrG1TQ
         rU42VU8BHf8/A==
Date:   Sun, 2 Oct 2022 13:28:41 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Arminder Singh <arminders208@outlook.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        asahi@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Hector Martin <marcan@marcan.st>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Darren Stevens <darren@stevens-zone.net>,
        Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [PATCH v2] i2c/pasemi: PASemi I2C controller IRQ enablement
Message-ID: <Yzl16W6+poH8/8h4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sven Peter <sven@svenpeter.dev>,
        Arminder Singh <arminders208@outlook.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, asahi@lists.linux.dev,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Hector Martin <marcan@marcan.st>, Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Darren Stevens <darren@stevens-zone.net>,
        Christian Zigotzky <chzigotzky@xenosoft.de>
References: <MN2PR01MB535821C8058C7814B2F8EEDF9F599@MN2PR01MB5358.prod.exchangelabs.com>
 <88f8c24a-70df-4b47-a3e8-033f6580d0d4@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GOnV7v5ujai9iybn"
Content-Disposition: inline
In-Reply-To: <88f8c24a-70df-4b47-a3e8-033f6580d0d4@app.fastmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GOnV7v5ujai9iybn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

some comments from me. Thanks for the patch and review!

> > This version of the patch has been tested on an M1 Ultra Mac Studio,
> > as well as an M1 MacBook Pro, and userspace launches successfully
> > while using the IRQ path for I2C transactions.
> >
> > Tested-by: Arminder Singh <arminders208@outlook.com>
>=20
> I think it's usually implied that you tested your own patches ;)

Yes, the tag is superfluous. The paragraph before is nice, though, to
learn which testing has been applied.

> > make sure to be more responsive this time around! Also wasn't sure whet=
her
> > the v1 changelog belonged before or after the '---' so I put it after
> > to keep the commit changelog short and concise.
> > (This is just one patch, didn't think it needed a cover letter)

Both assumptions are correct.

Happy hacking,

   Wolfram


--GOnV7v5ujai9iybn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM5dekACgkQFA3kzBSg
Kba9hRAArC/cG2qh7P6bWfW6JgLnIYB1MLq7cfQvyoZCE1h7il8NeGSxuWzD9lEB
X3NXWRWGS2lzrOTCVly+fOUGG2Fni/a25zgUimzIruLhhZCFZnNHJXOQFkIGQhrF
TalkPbFiVyp48qOtdFfHTdhdSApo/MkiBvScAOGhjmJj9ZTLsohnwToaFeUL9mnm
Rv+PiFGPAiZFV20NVvRDml0VCyYtn107jWFYvVSTKslX8vzm6APnOZeQb5zx3bde
17xagxTkZdQOby/WS0MmZNClh3CnTbnFMFhyD0npPER9MKGK6kFSl4AJ7mu9y7Ja
fuCJU2O1JQbaAk/r5WNUAkTme3jz5m95T40YaC+UNTeaKASMYakiEDsyKusU+HYg
d72Sdu4XS2ZzSVB0fD6o8aMWdsAWiN7p4FSQWsa9vmwgegKB9dIGCJplDTh3rnAh
G8gw8IhkgnaFD65/O17foP9wfJTHbnIel5n282qa6HOU7lVjiCOkgW5+fX9LamcP
GBvoc1t5GgM/NgAWvtcNXQhxtzC6dov6RLprd7qGGCSB3OnrETkiupDCsvjVmFKT
Jy039lzZghKmHLUopeuUFJdu0FEWNmY5VRnW8MaGP/ZZmHQHu22IAtKctPMZ7nkN
ngest2RL+l1RRABNYJPTcb++Z/wNCPQrgBPVaHxvQ/SaxuBrFZ0=
=iPSU
-----END PGP SIGNATURE-----

--GOnV7v5ujai9iybn--
