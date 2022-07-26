Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A14E6581BAA
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Jul 2022 23:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbiGZV3X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Jul 2022 17:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiGZV3W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Jul 2022 17:29:22 -0400
X-Greylist: delayed 600 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 26 Jul 2022 14:29:19 PDT
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ABC4C32BA4;
        Tue, 26 Jul 2022 14:29:19 -0700 (PDT)
Received: from localhost (dynamic-089-204-139-108.89.204.139.pool.telefonica.de [89.204.139.108])
        by pokefinder.org (Postfix) with ESMTPSA id C85A9A40D9D;
        Tue, 26 Jul 2022 23:13:09 +0200 (CEST)
Date:   Tue, 26 Jul 2022 23:13:08 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Xu Wang <vulab@iscas.ac.cn>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: Fix a potential use after free
Message-ID: <YuBY5K9n/mRfeuzz@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Xu Wang <vulab@iscas.ac.cn>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1577439272-10362-1-git-send-email-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iiUYzZUHPi8reSBH"
Content-Disposition: inline
In-Reply-To: <1577439272-10362-1-git-send-email-vulab@iscas.ac.cn>
X-Spam-Status: No, score=1.5 required=5.0 tests=BAYES_20,RCVD_IN_SORBS_WEB,
        SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iiUYzZUHPi8reSBH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2019 at 09:34:32AM +0000, Xu Wang wrote:
> Free the adap structure only after we are done using it.
> This patch just moves the put_device() down a bit to avoid the
> use after free.
>=20
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>

Applied to for-next, thanks!


--iiUYzZUHPi8reSBH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLgWOQACgkQFA3kzBSg
KbZbtg//ePaYx2QwCxG4EjHTERcnAmpuPHra/o50Mww+g5pS52KhFLDTv+VyMAOy
Yi+2RA0/mgQ6ZCWtVAOwHdbGJU5JU/fbsPwUfxPl9ZL5gwbWILURRhKFfW6FEWXM
MEyICRudH74takwQ8wz9ZUdFQ//7OPe8cVMP0CFXVk8ijmM3VN4TGtv7UrOIF4P4
pDvSIZYR++d66NY9VznFzwnqOrLoQBjbUPc/N85sXhhH53rTuw6fK9Mp0wz/BAX3
3SB4JOtyw+Sdz1GJCyilVNLcMHwGjvAuHovVEyOtCJUSYMOyBVKcgzzigwTQfWZp
6YybbZH3KY2xizu1dutj/0VrojsEtGRvLWU5ppjqLZSiWZG44SvNMLdLya7xoB7i
JLMMPTe8EkIwMOcgyJeKSSSFSkevspXImAbF0sRng7syJO8Z4pSIeJs4CrrO+Wd1
ur2dgXnWlqeaQs0f56fKhxWC+x6+Q5fCJOVvoQTfOEKmboFt1L1SJF4K7TK7Z8eK
K+B2gr0uRwcDxfjxIe8VtkdMuqsW7irrPEBHHVVIrDNLZMkcEIXLFLRvAb81lvuY
qXfoGYrim/QT0tP83iyRqo5+WZPmlVEJ94zWkw8T3TsXabmO0z/5rNEE+Kk/UKwa
W0K8/eAq03+h6gN63EuElwXY0xjaP+3StgToBCNQgCQO9UgnWRo=
=rsWM
-----END PGP SIGNATURE-----

--iiUYzZUHPi8reSBH--
