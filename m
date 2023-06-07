Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7FE472593D
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 11:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239387AbjFGJCo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 05:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238729AbjFGJCF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 05:02:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 930FD26BE;
        Wed,  7 Jun 2023 02:00:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2E16663090;
        Wed,  7 Jun 2023 09:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3842DC433D2;
        Wed,  7 Jun 2023 09:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686128426;
        bh=Jd7UEs8fqHBU7hWrOaHsCTE7SW9fdFTN6F9Xghvhqbk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VjZ6CiNC66Mi2wkrPfHKk9qALGkWlYfNi/YLhQHPiqnbcXW/VYYVQB8BkOSvEbV7A
         5Hj2ZMu8EbPkClGUL1bzNjNsZGi9J6MHCWpMwlZWcrd4oePR4WDZpnaGOgy8gSZfP+
         o0FcWKvqdcvRdZ+1If5dek2uUrvogrGg5MgVNWXTbASKtglBOGj0b0hEueAu2fFYYE
         9yMzJ5ghORm9BAsR1sukmvxqqJPdyiQ554h4DH0BPZ6NmH10nC46gUzHplKNBfTXv/
         wzQ+W43X/3M166i9xW8MjopPDHmkow6uBkQZ7qe7R2xEebN6eMFsjgF6wO8Iup0M+m
         8QbO2WZIFHSGA==
Date:   Wed, 7 Jun 2023 11:00:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] i2c: Add i2c_get_match_data()
Message-ID: <ZIBHJ9XdvX0FUQKz@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20230606130519.382304-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QdJc6Nk4Ep+50OXu"
Content-Disposition: inline
In-Reply-To: <20230606130519.382304-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QdJc6Nk4Ep+50OXu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2023 at 02:05:19PM +0100, Biju Das wrote:
> Add i2c_get_match_data() to get match data for both I2C and
> DT-based matching, so that we can optimize the driver code that
> uses both.
>=20
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3:
>  * Added support for getting match data for both I2C and DT-based
>    matching.
>  * Added Rb tag from Geert and retained the Rb tag as change is trivial.

Not so trivial, I think. Codewise yes, but the scope of the function
changed as it includes DT now. So, in deed, I would appreciate a comment
=66rom Geert if he is okay with this change.

I personally think it looks good.


--QdJc6Nk4Ep+50OXu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSARycACgkQFA3kzBSg
KbY1Sg//QMCYFQxe1ZWzz1KuZ9w45u3JvK4mLx6q8iG8SPTaA338w11LvWFai93y
fWuJ8jilN2VLTeCY+ffDYCVrVd5orqnJ2P9fkjLixjirsTxvkJ/kST145hvmgICC
R/Z8UHgur5yGhp9gciWJhJ8NhVP3WVjHa1TIZiMIn05CNMu/6rv3tFvTaJC5LtX2
0e0GRH+rXxd+wFf3svk1trZRtvsxbIObidMkui93UyDGSMAJ56bpV20jJskdFuMq
17hhpSveajQXeOW35vnbQOPYbyxVv3QkctWn+Yt+Sb1WqwstMIcbc+one7o6N4Z4
Fsy5SNzhgiZZ+zfvxIsmRsYBD11r4KTR4iww7Eru/P/GNNxmc4Dblan7z5nBvSH6
EvCRp8MMuMpZs6qdsDLk6Lj5ef/TwCAKewvlVj14mM6J96QR8cmR0847bhDhELmf
JCEmMnz4nWJ+/yoF12Pa5Jq8hgpHVYz2vDeluP8XTgJWLi3LDUoWTkq1sHoTsolQ
HCjoYJ0trZN+1IOtEKofBf0RI11vfDqUnVhcoZxGSYJZwKjPDW24Cy0REPDaNRQ+
ZZTTXljdLV9wkjp9UEycanB8YwcBYbaGokGY34bAvUAIamAi3qyc327icqEbbefC
QPaK1ZHqgc2vQynyu+gEGG8ovrPqNMqZV2w26QEzh1Z31DDuiSs=
=J4wS
-----END PGP SIGNATURE-----

--QdJc6Nk4Ep+50OXu--
