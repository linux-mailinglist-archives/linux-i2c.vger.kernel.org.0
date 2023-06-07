Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 530A0725A7E
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 11:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240067AbjFGJct (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 05:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240068AbjFGJcq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 05:32:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD6131BC0;
        Wed,  7 Jun 2023 02:32:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 70AAB60C35;
        Wed,  7 Jun 2023 09:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DD5C433EF;
        Wed,  7 Jun 2023 09:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686130361;
        bh=6HdKydcDGyl10FBeTZZvPW+Drkz6eVn8TxMuBDI/8mM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Szf7/zHbUc+bcIxayOMOk99sWDBrDSlv+nEbTpAMWdVEqEUvhvX0dKiH1I4tJ5N4r
         ezyDvI7HnnraLkDUQvmGINL3I+q1bce80xvb0VWrR04LoHJfoKBw2Cfa1eKf8tTOON
         6oa4Bd3eJD7G2cEw45RfIDXD3cX6YRpCkEt8i8p6Zdv6WbQc97ufv+vmu8ImBKVFw6
         buXHUVXYOs6XuworD9vHCyJZl86GHmTi0ZSb3pqwiXZa9EMQyVZyNQuKs7aZL3RAz5
         +UEKFjvF0jF+Pzu0cFkgw01nGkE33D1LdJf0ccybVeH0R3JOnebeHOEQUaVnzC60Ma
         QnsmmC9KpSH7g==
Date:   Wed, 7 Jun 2023 11:32:38 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andrew Davis <afd@ti.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: davinci: Use platform table macro over
 module_alias
Message-ID: <ZIBOtodqqGCH7ztr@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, Andrew Davis <afd@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230515175042.495377-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xE+vMF0UrOqo82GW"
Content-Disposition: inline
In-Reply-To: <20230515175042.495377-1-afd@ti.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xE+vMF0UrOqo82GW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Mon, May 15, 2023 at 12:50:41PM -0500, Andrew Davis wrote:
> Generates the same platform module alias. More standard usage.
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>

Could you kindly rebase this to my i2c/for-mergewindow branch? It seems
it conflicts with the "callback returning void" conversion.

Thanks,

   Wolfram


--xE+vMF0UrOqo82GW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSATrYACgkQFA3kzBSg
Kba9oxAAknMBo+jB6mxlqPLSRixoik/LDv/9vkHZq/wD6dKlj+UPeKmpUyzuLSIk
5T7NBOtQGVlSk0qbnXpGln9y/AFLCO4v0Mu6i/wLLadCuIufYrHNr+xLmkccLtgm
T6bjNi9Xdd4FdrnAtSTgsaJmOk+oC8PhMpxOMaUSXjcvqglAjKVOakq65gZ09gIv
VGxtDcjapjrqT5QymwPKDIWqe8RF/oZs3fEeie5X4tH/1I6cgzss7XvJZxKIXFNL
hdEG3t8BOm5GVVHBQKlUmEyvk8mcbMP9Da1A/cG0U/5vSEkZrYKg3bnhGmVAQOqU
tkbXRSdfBzjaOrSyuuYCVPKeIFMbv2kQqqHg2rBVA2O1NWAFke7uO2bfJVlBqUrf
e0bkh37PDIgCiTNbHy5nZy72EDrlfc+hjaA9lc8FDKXzMpAtmO0/1awNsAikokpF
HVxESc+Wb7R0pExraDOizun4UCQ5DCVtydrpPmiIdv7NBzIt63YoeNFviAkLKEmE
rKsau4gOL7RjDb0qdvvj8yR6Bpvsy/bm5ITlc7IuUiyluk4sHuPQxSYU4sYyjDwG
oUOcjnObo9rkM7dTW4odz5dIka1SXhfUM6YahoHpFRr9F5OJg3AVXX3cmxHj0zXW
V3vhI/RHM45LrEaHm+uDzKVW2bLN5YFTP0q6sjVAhE12rhLGzRI=
=hjcO
-----END PGP SIGNATURE-----

--xE+vMF0UrOqo82GW--
