Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E27D4B670A
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 10:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbiBOJKW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 04:10:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbiBOJKW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 04:10:22 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4BC13DC0;
        Tue, 15 Feb 2022 01:10:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E2FB4616A1;
        Tue, 15 Feb 2022 09:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3F7C340EC;
        Tue, 15 Feb 2022 09:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644916212;
        bh=suJ3VlnFKPJ2Ze7Qe8vaxeMRr35IuOsHoJUMz2ulquY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fhjGBHvs+Cj0p2HMmI2Vzf6zb6g8oalR5NvjafZQ+ZfebIynJ5844I0TA9EHD8w20
         adPE9HU8X/uq1cqdYFIL5UP3WBiYoCq7206fwULOS+w/x/oLHrBWj/k81bAPZZsKvj
         QhvnQdyRB6Ada2Dt4z32wSKdyPcAFjqsJjWwpnS8uzXKKaF89Svay8g1oXKG3fxmto
         ngR76XzAUBbHqpguTWLHRbmaf9WmOSTDZY9tKvRLP8baubyBkWZMk1uDNsL7+tMdli
         /KC4Sjrrf4Hb0+WGluDIdz5+dU/NDCTN58yinUVB9dgb4Kn+2QBbffxxj4OXgL6LWi
         tmuOvxbGZRnHA==
Date:   Tue, 15 Feb 2022 10:10:09 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>,
        Amit Cohen <amcohen@nvidia.com>,
        Nikolay Aleksandrov <nikolay@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 1/5] i2c: Introduce common module to instantiate CCGx
 UCSI
Message-ID: <Ygtt8c+s7LiAuI6C@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>,
        Amit Cohen <amcohen@nvidia.com>,
        Nikolay Aleksandrov <nikolay@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>
References: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
 <Ye7AhqMsOkfvHOAg@smile.fi.intel.com>
 <YgEa/blO2UMzztCq@smile.fi.intel.com>
 <YgEpYE2VNc05XhpG@shikoro>
 <YgEvEQ7BRc4KhOcF@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XxhwZy5TBIl7Y8Gn"
Content-Disposition: inline
In-Reply-To: <YgEvEQ7BRc4KhOcF@smile.fi.intel.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XxhwZy5TBIl7Y8Gn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Okay, I have Cc'ed this message to the people whose addresses I found in =
the
> changes in the Git history of the vanilla kernel with most frequent appea=
rance.
>=20
> The Q is who is on nVidia side is responsible now for I=C2=B2C controller=
 driver?

I applied your series now. But the question where Ajay is or who now
maintains the i2c-nvidia-gpu driver still remains...


--XxhwZy5TBIl7Y8Gn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmILbfEACgkQFA3kzBSg
KbYZRA//Xy3qOUAXX5SqWnN0vMVYaUvAMGQL6tyXaJDmDw+EkCAkAvIoEiw/4UbT
Dfpj20ailTrWIpKrjxrXC1l5P3GE0H03wrE6sNxd1uMIKOF0yotZWECnr7bYRObQ
P0DBN1bOk0uBy4ghdjDjMGtGfIRW7Pncwp8GYvZ46HT/2ZHUtKtufYTUemnA8F4H
4Wy8TibV7L5w2yPVVyDY8E+/L6b4a8QfBifAgpAa+fEkKoXbnx0fdDWu4k0XMn1Q
ZaVdNBKtmFj9QVMfg7coMDz86IRtXYQjuyB0KE+OChlQnIm5WajE6Qkf04ENXTbs
FPOrQhkTJMHllbFuxwWD2JNZ7+GKHsgOGgjAziB66vqNQpKQVXz44hIBqV3U9g06
AF+XsO07E3QxnQMoDpsj0jK2wN491xKBbL036gUxKlpVJXA8pJqeFh0InU6yPpJ0
ZF8dUL4Rc9rjtWCWLFMBFf7Sk4BMohZIhAs2tXMmp+RICoN+eTUK6oT16OXeq3bT
ojTbhe0AJB/IplLYLCUgWs33jx7USOTJPI1zHyN902TjRr7fiQAc+HyBBwH+Zxw3
XlgeooGLpvg0PjG6LQrqManfXodeYJFCAiBcsh2snsrOht6xzF9IN80tofW3iQrv
DrpqYya2BtZq+h+V6Z06N8WMrSOrrNJlYZAJiRFg0QuvtmnVmEo=
=Xxo7
-----END PGP SIGNATURE-----

--XxhwZy5TBIl7Y8Gn--
