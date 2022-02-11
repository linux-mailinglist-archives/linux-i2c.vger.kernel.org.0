Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1AE4B2EAA
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 21:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353396AbiBKUny (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 15:43:54 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239197AbiBKUnx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 15:43:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C0201A2;
        Fri, 11 Feb 2022 12:43:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DC527B82C8C;
        Fri, 11 Feb 2022 20:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C99C340E9;
        Fri, 11 Feb 2022 20:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644612229;
        bh=mXMa9ZUQphYRbJnD+grWFSam29E/b+kEAveY07tHbZM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SvdcM79ulLZdSc2lufdGwMsPQRYYoVmadl8EDemmMMzbDqQpEy0EbrdZvyb1Hz8w+
         zEIFRIqvbJxQLdDo+IYolCYwH54fc2pyI9RSyFF9NIxFfQCUboUFCVGkbpdMgHu3nn
         clLJS9bOzYTy0+awDhQ8Lkkoe1nkno/+t2kti8LIKTKBX7JBBknwnwU6CuPwwLyx8y
         5un7CBKQJYnEku1A0rmKUR2JQUBx+uJfL6823uQBnptMt75VY/CDAByu8rzyLe6Git
         X9V+IuOGfvjV7CBBgkcRThC2PMie08cN049XXsqtxhRuKKWYjxDQo9t6nflnE3kuzZ
         fpsJ8gaOPmxLg==
Date:   Fri, 11 Feb 2022 21:43:45 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/9] i2c: qcom-cci: fixes and updates
Message-ID: <YgbKgaEDvnSMhaoO@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Foss <robert.foss@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <Ygahuyi+/m8T/5cZ@kunai>
 <db11d120-0f9c-177d-66a0-18cab7297445@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eK/eJvcjL3QiJR2o"
Content-Disposition: inline
In-Reply-To: <db11d120-0f9c-177d-66a0-18cab7297445@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--eK/eJvcjL3QiJR2o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Reusing is nice, of course, but I hope you noticed that I needed to
> > revert this feature:
> >=20
> > a19f75de73c2 ("Revert "i2c: core: support bus regulator controlling in =
adapter"")
>=20
> yes, I've seen it, and as far as I understand it's expected to get it
> back after the regression fixes.

True, but work on this has stalled, sadly. I am gathering interested
parties for the topic here :)

> Wolfram, can you please share your opinion on device tree binding name and
> placement for an SDA/SDC pull-up controlled by a regulator?

For efficiency reasons, not before bus regulator has been applied again
because the above question depends on it IIUC. Until then, I'll work on
other items of my too long todo list.


--eK/eJvcjL3QiJR2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIGyn0ACgkQFA3kzBSg
Kba1TRAAgNR1H6cx5HWBZliqaJMdkq1St/G7R6opa30EbhjRLzZTVO7nMPJn4cbx
dAs9TOCWH5hUDirCI1/Ao9YEhsWv7ySsxaOuRv+okh3s9Mm7K0dbjCoY5yuDZaQt
HiIEHSxAvDWbJy9+ZWX5EN5LzZCp/fbcLDUPzwUycOdWismEpZtCCVMud0aYFEEn
TgCBi62MdfEiLy4TrxKZVm31ubjS3/FaRolbe70ZMFc9NPGJAuzyt01TFXN7g++i
LCdEe182xVZimDplhNqrXpkquuCP4OqLUrindJGJ317g8I55GFJlozxwmmYSfrBy
tYOZiNcNDVga8bw0VgxJNNvhDsq2laapNtVHobIBMEXtVLGv20tI6HtHz7p4A2iR
4C3cqtG6vK4Gg8jCe1HRmP+DK1Jscb5SVDLejFGwod4iGPZ8tNqzFssuBVJUr6pG
oFi+/qIe0lPX/KZexi8JEMEr6+wQi6pDaoxHpJl2hba1IJZPazkh/xEshg72pDwg
tHG8lyE3kD4TyXGiQDPiqYF6Cwcy8vGwhmUH7M8yPn9sQQVxMpGxKaHwhjvM8r4b
Kb4nDWON3Oy0uVHiacj4beQQTTzYNq7TOA6bZxHgCnVHg6/BLdfz6h++n1SHMVra
ZNVqsazJNA9EOgDuyc3HJLqNR4kg3TGfuzptQnvIjDTP6Egf/5A=
=ixCM
-----END PGP SIGNATURE-----

--eK/eJvcjL3QiJR2o--
