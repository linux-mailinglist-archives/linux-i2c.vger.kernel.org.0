Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82DA8274104
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Sep 2020 13:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbgIVLg7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 07:36:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:46778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726522AbgIVLgv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 22 Sep 2020 07:36:51 -0400
Received: from localhost (p54b332c9.dip0.t-ipconnect.de [84.179.50.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9165D22574;
        Tue, 22 Sep 2020 11:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600774610;
        bh=DMjnXJT5pUIL2x6gmtXF97o0/LW9XS6SHEJq5VqC4Uo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hZZGrBvmKd5K8YqDxKwLig70vjELHxzmw+Zz6/rNGfYMRlH5huKEiiNe9fCgDtAz7
         0l2yaTtWlLp7VmiXLvPGrQIKVG1sbXHpoKB/VrYEMWBJMlhX46AzK4tqVTfeQAEcyP
         sXSaUgN5keWS8MPDjAOqVzaC5ITyBYxjzfNLDEIo=
Date:   Tue, 22 Sep 2020 13:36:47 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Sultan Alsawaf <sultan@kerneltoast.com>, linux-i2c@vger.kernel.org,
        aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com,
        jarkko.nikula@linux.intel.com, kai.heng.feng@canonical.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com
Subject: Re: [PATCH v2 0/4] i2c-hid: Save power by reducing i2c xfers with
 block reads
Message-ID: <20200922113646.GA6731@ninjato>
References: <20200917052256.5770-1-sultan@kerneltoast.com>
 <nycvar.YFH.7.76.2009221118150.3336@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2009221118150.3336@cbobk.fhfr.pm>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Hans, Benjamin, could you please give this patchset some smoke-testing? I=
t=20
> looks good to me, but I'd like it to get some testing from your testing=
=20
> machinery before merging.

Please give me some more days. I am not fully convinced yet that this
use of I2C_M_RECV_LEN is not broken on some controllers.

Plus, I'd favor if this could go via I2C tree. It is within I2C where
the non-trivial changes are. The HID part is just the final bit. Can we
agree on that?


--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9p4csACgkQFA3kzBSg
Kbb4Fw/+JxENn5QNY+ByGfl2QuhEVSUt9E2ZnVcISGm9WVX09c9+Xa13sRL9uw4A
UPVDQOIj7iDNfGw3c8oIXEk8r72pJqxUVeAp61P3xVlui4TzQiESHospv+Ib/ohz
Tf491w51UbWfOiHFvye88nLJrmOYv/1t+3jLKuO35IKxV1LGxAioBW9t2JisF5rN
PcDWDsfxy8YhM/S5+QHe8PIg2OycDcoEi+U3nyJwFa4lKIlAkPQ60T8ZXKl+D8y4
Y57k7lwSqe49aPvFbZLTV99aDvdTTQwWkSNFqf+4ajXy3Chbthqj/ghDUoTKn7/M
TbgFh7C7YrgQknfyIjfNne5oAjQDXhSCPmNnFlH7QXIh04/mZxWP5hfkYdvkMgfb
2G63XrJmMhCtHQ1jBfUh0/hwsNre3r55tI/3xYu3EpHlP3V/Zb1r3qNWXVwZwfig
MCHc9fHOLtA/HJQLFKWD3uIZs4Z4O3Fs9pvxe1cWGjDhXWS5MvxuTN+GjSEe2lDk
qTrWTMaSNBzM4xCFLmEzuk/ID0ThwHChRYLOTwFR/jMPS4lCLHjOAgXIgRZaSr7B
AYm0SD5FU737N2ZXesCVOuEyWeb065Q9Dmc0a9ONlZm/qhJwegXaZFCZr/tN+jgp
r5IIpdgbVbhL/FDtrFwpHUrfrAouT71TPbV96DOf+S8mn0YGX6Q=
=zhtE
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
