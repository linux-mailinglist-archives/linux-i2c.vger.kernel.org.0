Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5647DA6FE
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Oct 2023 14:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjJ1MfB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Oct 2023 08:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjJ1MfB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Oct 2023 08:35:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCACB4;
        Sat, 28 Oct 2023 05:34:59 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A956C433C8;
        Sat, 28 Oct 2023 12:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698496498;
        bh=p7/kVm22CneRRAqwEGgytP+JuiIpjltRjwiPqlsMYMU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jzG2ctY45APflwmer9GE1gm4JAsUBnv6IOzTCBmJnaUz9YpHwp9GV8PqZOH/5kwiP
         W6gB9cVxM+Og9YYoCUkRkQFLqupt7ocTdB2fS7E93gMDyZP/Q97LxujofnPcyJG+oS
         b5rB68/sGVGHX2a8YQllppM0ynwwPCWkTTQvlUDUHF8cdnX+ivJn+Qp+wHVpLG2f/i
         5xRyY9qIFLvb9XseogGvdAgt3EeBjGMSt7wkNMltbkP83gUqhIVqOdzwL8x+EnmwaP
         leWTdoxWk5qTEkk0OFYbhq0ebkD7c4e3q6m1yVARTBYlcQiiR9lcJgkUzZ/GAGAHql
         rSqx8fexiqaDA==
Date:   Sat, 28 Oct 2023 14:34:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: axxia: eliminate kernel-doc warnings
Message-ID: <ZTz/721T79wA4e1I@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20231026053918.17347-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UcUZCVDFWYcPKrvP"
Content-Disposition: inline
In-Reply-To: <20231026053918.17347-1-rdunlap@infradead.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UcUZCVDFWYcPKrvP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 10:39:18PM -0700, Randy Dunlap wrote:
> Add kernel-doc for 'slave' and 'irq' in struct axxia_i2c_dev.
> Drop kernel-doc notation ("/**") for static functions since they
> are not usually documented with kernel-doc.
>=20
> Prevents these kernel-doc warnings:
>=20
> i2c-axxia.c:150: warning: Function parameter or member 'slave' not descri=
bed in 'axxia_i2c_dev'
> i2c-axxia.c:150: warning: Function parameter or member 'irq' not describe=
d in 'axxia_i2c_dev'
> i2c-axxia.c:172: warning: Function parameter or member 'ns' not described=
 in 'ns_to_clk'
> i2c-axxia.c:172: warning: Function parameter or member 'clk_mhz' not desc=
ribed in 'ns_to_clk'
> i2c-axxia.c:172: warning: No description found for return value of 'ns_to=
_clk'
> i2c-axxia.c:271: warning: Function parameter or member 'idev' not describ=
ed in 'axxia_i2c_empty_rx_fifo'
> i2c-axxia.c:271: warning: No description found for return value of 'axxia=
_i2c_empty_rx_fifo'
> i2c-axxia.c:303: warning: Function parameter or member 'idev' not describ=
ed in 'axxia_i2c_fill_tx_fifo'
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/all/202310181049.Vo62moV1-lkp@intel.com/
> Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: linux-i2c@vger.kernel.org

Applied to for-next, thanks!


--UcUZCVDFWYcPKrvP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU8/+8ACgkQFA3kzBSg
Kbbt3w/+Oa8WEC0nS6eEPdPAfaGtDcQ310leFDm4/6/HUTit1rlLze3Cue2955Yp
KQagXs3xfN7eHkX5aStDSqtbqFn5yAoG0Ye3+fSVEq4jec5M7AAv9DWLCTON2mss
mMvJMDMag0cmh+n6s4Dck06qGW721IWvRH0zjf4afDYwwKBYAGIUgPUiNCI50hJo
VAIvmE1TihQVIE7Wy/RASGjgbuAQl3xi624iypGsxiKXQ2nvw4gM32qQbcghK/83
q8VIegQVRC3imBEZx1fYOd9DPS6gwSxDuX+MmNFWYiPgyZ2Bs+S30RZhB0V43l2i
9YSQUgt3v9fIvY5riZA09S2Rm0QY/Hh+akDzgOW1/WJWomv+D09J0Ok+sfqvWl5r
QGoeJ7WInlrn+qY+CSdbQjwxt11uvr1ZInWmb3s7xhED/Jnjh6tOfYyfmiLn4ffb
T4mNYSn2IJw2iUGjPvj0Y17/jIuTesnLlX9Og5tPtJUI7GHbvfxqFs0hehTLntqX
GfFDRlvyZpCnPg9MG0m/iVsHojhq6kEmWusbkKeNU+lo0GZbwnefoj8ZhrpGKIGG
vkCQRusVBs5prlx26GGlVQzxsSGXZeQeXwfu5uMG3APwVT9vH2Ni83fuwW/pCKq2
2kc1ot94Kl83ClwaoaoW7DLd6BLZZmemPATKj4JnjX5/JfJQUko=
=tkAU
-----END PGP SIGNATURE-----

--UcUZCVDFWYcPKrvP--
