Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 558EC4CB114
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 22:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245240AbiCBVPl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Mar 2022 16:15:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245173AbiCBVPe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Mar 2022 16:15:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85CBDD973
        for <linux-i2c@vger.kernel.org>; Wed,  2 Mar 2022 13:14:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 09385B82233
        for <linux-i2c@vger.kernel.org>; Wed,  2 Mar 2022 21:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 521F9C340E9;
        Wed,  2 Mar 2022 21:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646255610;
        bh=r7ysaE58gXGG8A2AYKLjWLSZzhVdsDkFtnToEWucDi4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=e50oxGzEkaDYv5knIhYoCOc68X6QnVJhcB7EbtqlqPyQp0ZGNDss/AWrOfrYUm6gH
         y1IhMcmC+6ygpzvhqofYJSm48YayiE7M00FtloPw6ISRXyM+FDXQLhwCYNQTZFQ8UQ
         V3vw81gkTlaSqe7hJzMOm82RBHnM/QKpfL1nSI/o9DHU4W0wRQwkquQKeemiywcGgr
         NU57Q9D3NomRYgebkbELqexWW7eAfh8p7vPjSul3RZYIAdWH8MYvPvK6KJDYTCQ9me
         HawxZtHFKrMAVUuakN3uZ73CYvnm6siCtq8R1CkiV5pht6q7CA2g48JsNLoGN6CAxm
         HL9zK5eYw4L5w==
Date:   Wed, 2 Mar 2022 22:13:27 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] i2c: i801: Drop useless masking in i801_access
Message-ID: <Yh/d92DazP4LUp7H@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="F6lPFSv7gkkJFmt1"
Content-Disposition: inline
In-Reply-To: <20220301173937.636a21ce@endymion.delvare>
 <20220301172859.5593309a@endymion.delvare>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--F6lPFSv7gkkJFmt1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 05:28:59PM +0100, Jean Delvare wrote:
> I went all the way back to kernel 2.6.12 and that masking was never
> needed. I suppose it was there in anticipation of software PEC
> support, but that was never added to the driver (and never will be,
> as this is made obsolete by hardware PEC).
>=20
> I'm also removing initialization to 0, which is not needed either,
> and would prevent the compiler from reporting an actual usage of
> uninitialized variables.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Applied to for-next, thanks!

Jean, there are still some patches pending for i801, mainly from Heiner
and an interesting one from Hector. Do you have time for these?

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D&submitter=3D&=
state=3D&q=3Di801&archive=3D&delegate=3D


--F6lPFSv7gkkJFmt1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIf3fcACgkQFA3kzBSg
Kbb4YA/9HQRntmOzPDWRYJEf3SpYmTV6yYOX3cicEOkE5reC/iQ/nZjEKWnLAISQ
+xEmDGi96W3672TQ5v1kptcz67NC+YtQHN7iyYRMk0P9Ps5YsaRgj/eo7LbSVZyh
vD4YJxLMAq2cZ4qivuRq5op32gcvs9wkCne2ZTopxG+nO3068F93bZoLVcegzp4n
70vFMlFiryQ5q8MtT9THfI/+k+K2N7tMrLIJ9gJZHhle0E69XD/x7Vb26vTYC5t7
2FEnHMoR8YzsOMmsXqVGVezLWUriAuDMTjwCbrOmPsh22MJYizNB0ycJedGoXZOT
qqnKFqJiz+WvTTmmiMpKjNkuswFA+JeRMrEP4ZzZacK+iy053GMJurv46Ztt1L3t
QZ0mpo/V4DUGvOqklv/TzEzxiuMwvB5qwPislQtSreurbkLdfWr2IotHz1qBn9Ga
Al/SuyzhvPr2N1lb+42V0DaYDKoVlfzg0kg3EIFCB59qejxuieOzlmnxQJH3a3Zv
DamyCRXROOXfZd7LqwNv8fRN/2DBqFTCzMzXszBoQQF0VDGN4l36bzxH3ye9DSOQ
x92KZyDmXCOyXG3b7RLLO8ND0OFQKy1kgh5cAQ3fGx1SjhOA79fSeXbQjEzUX7b3
pwZJ11LddrBdsvskaZz+LzRlT269wlpqlltp5zTb29wC7zd+2js=
=vEPp
-----END PGP SIGNATURE-----

--F6lPFSv7gkkJFmt1--
