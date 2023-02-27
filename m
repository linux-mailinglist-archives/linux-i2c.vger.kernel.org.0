Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFEBD6A4AD5
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Feb 2023 20:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjB0T1h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Feb 2023 14:27:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbjB0T1g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Feb 2023 14:27:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 317B91D92C;
        Mon, 27 Feb 2023 11:27:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C0F1F60F10;
        Mon, 27 Feb 2023 19:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1CFC433EF;
        Mon, 27 Feb 2023 19:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677526055;
        bh=yI3bbjrUbLDm4OLo56sfS3pR6G2PMmi8VaJew1uvf6U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Blt44YsXf0cHA91DOFFMY/83HYZvIsHqG25aZCvZyQVX21qtcPDXEaxVGpv+GGYkV
         MtBvr+LD5qaC/9/zG1QEoZhzppfRm5T+acuXI9A8HU9ffMCE4vTwwFG0a3Nmdwl4NM
         HN0L4VjYwdsyit8i8UrABevvvljsE2t1ip3xMv/0L+BNqChXhW8t2SCinpx2DZGQln
         e6nq+ab9eYRf/HoonGXQTYsINWOXBELliJwmkz+y46havP7q6ZAFcNV8vRVz3NyoFT
         GG1BmW3teiQhUUC+hkJHpLaNnORS+AGKNcBhsJ23uce4qz1hYlu5pD6m0cXuhPnE/9
         v6cOxVIcOf7+A==
Date:   Mon, 27 Feb 2023 20:27:29 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, Dell.Client.Kernel@dell.com,
        Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: Accelerometer lis3lv02d is present on SMBus but its address is
 unknown, skipping registration
Message-ID: <Y/0EIRsycj8EWjrz@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, Dell.Client.Kernel@dell.com,
        Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
References: <97708c11-ac85-fb62-2c8e-d37739ca826f@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RE4VCg2Wt9d2EaYd"
Content-Disposition: inline
In-Reply-To: <97708c11-ac85-fb62-2c8e-d37739ca826f@molgen.mpg.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RE4VCg2Wt9d2EaYd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

> What can a user do about this? It looks like the I2C addresses need to be
> added to `dell_lis3lv02d_devices[]` in `drivers/i2c/busses/i2c-i801.c`.

Complain to Dell about the missing address ;)

Until then:

> [   20.631866] i801_smbus 0000:00:1f.4: SPD Write Disable is set

# cd /sys/bus/pci/drivers/i801_smbus/0000\:00\:1f.4
# ls -d i2c-?

The last digit of the printout is the bus number. Then:

# modprobe i2c-dev
# i2cdetect <bus_number>

And post the output here. If you are brave and see that the address 0x1d
or 0x29 are printed in your output, you could try adding an entry to the
array you already mentioned above with the address you found. It may be
safer to do some sanity checking before, though.

Happy hacking,

   Wolfram


--RE4VCg2Wt9d2EaYd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmP9BB0ACgkQFA3kzBSg
KbarTw/6A0lxRj2mfln6FHflA3y0KfQtN1SahYzcXOPxe+VuTe6HK//eQf8Wpn5e
Q5g7dY1uTK+tb7c6g+5e4jR34TOsSZERNL0QvzlQtxUxPFqCzPk9PyY23jJWEWe1
IjovfzRIFZSpVzqLS7OCBZTLrMHkN2Ae+o0KNG2HKblS+in0A6reTRUDVbBpO7pc
ho/92IXBKmvJqz2+sVhBneYEhuV7JteGQbvuept0j2ThI6t2o8wz19NZjKNutGph
T3fSS9szx62f3kbJsVuIREAZ0nDdrxFZqaacolMV/9Cl7/6ofxu1Lw3gZjQRZx1t
o3IRj6DO3Qv0Y+tyyvFWq2SIwdjp9Wi4dWmBV2Se63FbqewvsJ7oox96HsabXdk9
7hKsOA+u9eHMZD2LGK41hyylHXDg1E3Os6FCxJCaeH3sNN3NoDj5YGB7MLJJgI0r
4r/iq+EY5O/bzVcKvRCw+oPVKCXCxExGS9YJdetlsrBHUfGKpm+R1dppzpR+5anP
P6Vn2+UZJXJjf6SPaEf6kJL8OAcoNqi38PC2QmlZuhaKanf/uhjsA9ZXLjXMKg6P
g74ookxfCL6pya6FTIDWIIT1kxKbeAuG95TcnO/2QWD5DZb2TPTsGcgnz+XMVjko
EAw2Wg0EopPbhQRDYzA7v7VdNjtmNQhjyzN2d4wmHW++ZhAnub4=
=O4Pe
-----END PGP SIGNATURE-----

--RE4VCg2Wt9d2EaYd--
