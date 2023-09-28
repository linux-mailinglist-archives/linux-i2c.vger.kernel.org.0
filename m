Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 709C17B2089
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 17:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231422AbjI1PJn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 11:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbjI1PJm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 11:09:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB36194
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 08:09:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6B6C433C7;
        Thu, 28 Sep 2023 15:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695913780;
        bh=1maoz3BQXab5ZKT1O+OhGKF62v/ir0fizM/saLxJt1c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QKxspuzZbVEueCls7+dNJJrEoLGNwj5Cr/AfyyPx/CYET39uzJzrPGmsnpBrpoTUd
         3sqf0aBVZ1p1OKUd340JzXkInsxuwRquaGQV1WyJ0lu3+sJt1xK7nVlZYIMD6lNNNy
         UucOax6+CQt9xhVN9eFcnOe75lftR7Muudg5Sp5XYUZ9rEgI7/hoHTZK78wSSILidm
         rFd2bLdGyd6YMSrZoWyJjWZnYzrHbOl4ZwuPfMOYRLc7dyLFQe+qDI+DosNIzf5c7E
         S+CB6visnKdngVRng1X8Rd5qDrrOgn69T8s7y8MT2AlzeIYyeKVhcULN4rJWOtvVL5
         gXl1PHKYeD+gg==
Date:   Thu, 28 Sep 2023 17:09:37 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2] i2c: Drop legacy muxing pseudo-drivers
Message-ID: <ZRWXMRpkO3tOwW1Z@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
References: <20230928101655.47d3dd2a@endymion.delvare>
 <20230928150323.7modfno7snqccpzd@zenone.zhora.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wfKrrA4JOO2LclxN"
Content-Disposition: inline
In-Reply-To: <20230928150323.7modfno7snqccpzd@zenone.zhora.eu>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wfKrrA4JOO2LclxN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I think I commented here that I had double thoughts on this. I

Didn't you get Jean's and my reply?


--wfKrrA4JOO2LclxN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUVlzEACgkQFA3kzBSg
KbZwWg/9GRUdpUc7f5o25bIg7P1KvjB7F2azvS6ucBo7lNqdm96vT71R1UUBMhfO
H0m1vLDVzh012Q2KXHxGem+hjPqdszzgF6w2evTHj+Pvk0zOqgQy7Bkk3sqkIDm+
LQ1pbK0cUV6w9R9XthOofIdI978t37ZT68fDSjJ/l0AeW4aj6bHQg6eLUL++MF5t
TImNYIRm5aAtZWdkXzPlrqwGrick2eYgKXepS+2hobzdJx6mXkvJ0yw4FJG9I2Zk
GRU0BgHXmDSIeF0y7fKzy4GOztRGiNGqei89FC7Acnt/g7wYxhhdyFhuZ+aYiYfZ
wA67Dodfd+YV+65gHyWkr/R+qOlSxJL68qU4vUn9qRbP2Uh3SOYmmOYhu3Pte4Rn
+fBxHcL1h/d6823W7dd2/gBmnvJ6QlJwV/A0wqSCJv8bOYf6ErK89pu4e69+HAVs
+AsBGWlepdGlxzd14iQn1RdP7zg4wLI53ujGydQJWbq4vVCxHY7E106+wyeMJjjq
VM2Ig93oHwuOeehydK/DBiEYNNf24+Pd3oqoEtyXbuUQl6Tpc1Bf0ZYWDOIadod0
BeOrMExA7BDHCj4PuDRN+QPwTWsNM7bAdusnt9c/vJmhwL6RKL/J3Gtwoh6EpF7I
ORZd/Ujly8pJGa9A4QZ/2yzcZ6EUk4kEP99xa55iBtWDHIY/aA4=
=GX+W
-----END PGP SIGNATURE-----

--wfKrrA4JOO2LclxN--
