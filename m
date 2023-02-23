Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3037F6A0F41
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Feb 2023 19:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbjBWSME (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Feb 2023 13:12:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjBWSMD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Feb 2023 13:12:03 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9894518A8B;
        Thu, 23 Feb 2023 10:12:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2320DB81AB8;
        Thu, 23 Feb 2023 18:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E14C433EF;
        Thu, 23 Feb 2023 18:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677175919;
        bh=0Seu0U8ciCMS/h7f2Zc8dBNZJz8tn/Y414DP+2xQaoc=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=IBn/3dElpRkiX1n0r/Pd7dft86+/JvagJ46du20D+Tjz6voTbwYjmgm0yzFjWYVtf
         rAT4RrPpjPti7+qHRqZamriW8Pov/VQmtanTI2FghAPO2Vt+JvAjMQblH1/dm+0PdN
         6BuCyjpxLn5F+GncrY3NKJAR9dEEJDZkAHmpVmFMo6OUTzp4SEVasttZVQwE4sGiCc
         I6eMM4mQcO7dnRxax1paC8kTIhm4gCNY6mzAF44UgPYsh1Fva9PPXy9rOKXye9USES
         YEXbV5ex9q/AwgzGycxHvEpHAxk/sME0RHvqxuiUWIyCY7YVmLVGBjRYuRendeVRwP
         QZoAd9yR5UkKQ==
Date:   Thu, 23 Feb 2023 19:11:56 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PULL REQUEST] i2c-for-6.3-rc1
Message-ID: <Y/esbFf25ss0N+Z5@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <Y/esAfKcQpM77Gql@sai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+bWfF7cXenbtC5Hw"
Content-Disposition: inline
In-Reply-To: <Y/esAfKcQpM77Gql@sai>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+bWfF7cXenbtC5Hw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I2C for 6.3:
>=20
> * new drivers for HPE GXP and Loongson 2K/LS7A
> * bigger refactorings for i801 and xiic
> * gpio driver gained ACPI and SDA-write only support
> * the core converted some OF helpers to fwnode helpers
> * usual bunch of driver updates

Forgot to mention: linux-next reported two merge conflicts in the
MAINTAINERS file, but they should be trivial to resolve.

Thanks, Wolfram


--+bWfF7cXenbtC5Hw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmP3rGwACgkQFA3kzBSg
KbbY9w/+ML/VhoHotebhSQ1f68MTZYft8WxiZwncNxG4UwYfLLGdUFMSr2iUVjY0
+BWKIPn5x8BoW/v0aEUVIILYqBs5GCXg/V9T2sy3IyipAyTH9fTAfdIFdKUGs8RT
e4ZGlyY5lMDx4JRgiqheDvSWEbIM775NzJp0HKYO+Qqqfb/4KAOutSoABaLIFkaH
WWKx5XjTf3N2xwUBWv28PDZoAwxdkBTZSXc49y2JAti4E1iY55rQjAJhtVma9Tgr
hJIu06oMSPIB9WgxFPdwMojwJBTFh5Wwt6HD5dHaQtSPuiDgGkCxarPLfKzl7yQI
j86jJFoqaWbZ00HmKv6881yqfSsAfbfdovAQkbkcL+ZWZaNUu7l4xhObLX5jpK+f
5B8ttXnn4mAvmjQwSS2SFMs2NMwrnRkg51BtTG0YwDNDtaqvtEhfiIhaejRMwCXh
nxRURIGsz5IZYZLkHsI3Yek0uEVUiRcmYgSJNHh+MJyytYdInuFAzT30SD79j9vN
4LyfVvTV30oud2PM6w4sYyVE5xC2bo9mRNibHGNbYcgeYEkcY8HnxXnCZje/yoIl
QprVr0GTMKiJpb0JJEz0P1qi8v8SmRdKh+ZEultBv+9i7RttEM+etQeuLpx2HsjR
VuNRxs6A+/8tL1gfCNDR09Hd49k84qsFvg45jxROiArc6X5BFZY=
=oMJt
-----END PGP SIGNATURE-----

--+bWfF7cXenbtC5Hw--
