Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5754649CA
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Dec 2021 09:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242034AbhLAIkV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Dec 2021 03:40:21 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:47274 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbhLAIkV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Dec 2021 03:40:21 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C4E2ACE1D8E;
        Wed,  1 Dec 2021 08:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E18C53FAD;
        Wed,  1 Dec 2021 08:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638347817;
        bh=0r8PNYjq/xETqwefEYYzo7Go50/kfd/ULqE+AtWUr9A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XddpXuJ3Kz9o67WoS2Cd3zbBanFcKc9WGcDNGoubc/3nctB73ouZ2bUEV5gdA5zj8
         BQ2//Di8Vhs9zEc8eJL80qVPPQ5xjrWUG7RatbwznxGakwSVDd9rT7inibzSiETaBf
         AAb5roWSFSl5Rp08mgX7z1Z2k8nFgjeiN4rARop0upoaxUog2wH4DL9TJLjeMRUrzW
         ZDSPbqZ9HOGVwVhVcyfSGrgJ10NRtj5JoFfZwG1EBM54dPD1l3T93lTjZBOd3Fw4wz
         TWPrc2vrHgdjLc0kCE/V4EXvV3okGxz4E4F8ev8n2rzugcekeRlBey5Y+YivtXWjHg
         9kwFpe68UHZfw==
Date:   Wed, 1 Dec 2021 09:36:54 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Senthil, Bala" <bala.senthil@intel.com>,
        "N, Pandith" <pandith.n@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>
Subject: Re: [PATCH v1 1/2] i2c: designware-pci: Add support for Fast Mode
 Plus and High Speed Mode
Message-ID: <Yac0JgqrEdUJcfsf@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Senthil, Bala" <bala.senthil@intel.com>,
        "N, Pandith" <pandith.n@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>
References: <20211109103552.18677-1-lakshmi.sowjanya.d@intel.com>
 <YaUGV3lEmW9qtP+3@kunai>
 <042d2c9f-4333-44b1-09c0-b0953a51c176@linux.intel.com>
 <DM6PR11MB36609A77B3F5D7730FA16A52C4689@DM6PR11MB3660.namprd11.prod.outlook.com>
 <4a420cc0-d18a-32db-ed58-f611336c99ec@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xYZNg0PaPDDvvjVD"
Content-Disposition: inline
In-Reply-To: <4a420cc0-d18a-32db-ed58-f611336c99ec@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xYZNg0PaPDDvvjVD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> See the comments from Andy. Recent enough Elkhart Lake BIOS and his patches
> from last year already provide the timing parameters. Feeling embarrassed I
> forgot them :-(

But the u16 conversion of the existing parameters is still useful?


--xYZNg0PaPDDvvjVD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGnNCIACgkQFA3kzBSg
KbY1yw//Rmo0A84SWyUvYjzlB1U+Szvr7cDXMYt+e8AhjEtRicAQ99h+X5G85Vb/
eJwI5fxz2ll/UObf2R+B52+IyVMNGoL5cyeFvTWv9oyp2oLypMwYjXQQrBFky0e+
rpsAKGlidjUsZashm+1MmDdNg4MLIs8xO9YsUTVPSWIrtFWoSR5jX3+K2v7qhcnk
7T24BjoD808Cfc6yjbHU1jCv7u+TRDp0lkGi481hHF4thSYANih44lTxCcZYfZwF
//Qgb94pOCgA9ZeS4wFwyoUgYvE2apzH9npy/DwDr4JOhAoQ0tutmeRmW6lEL/Mj
U9RFQS/1jBPUPThX0WpNRbq+6OVCFCoosWSzorj4DW9ycGKaBGckYQqOT8PYFhyv
dEdTjEwtuQzzq5hH9KzfntvdxI/uvVXrHqn6bjOta5aw03AZVuXiIhPmVyGJ1vuM
qamja6AZNKTlrBTNIsx9XVwT8qXhi4oxSXAhVWRGcNVRb1iWneyKwwIPgzGbNHk4
A5m3fJOHfH9HQbOdFs5I5OZ9VBSww9TOgZj6ektiENtESfh7n4Cm/dVECOXb6flo
lP3AJjyC/y6d0Q4ONODEwluIGYzzRNY84fVSkh1Us7KcjOsvAZ9jNHfR/ttmDgEy
z/0POHLm9KqfsRA8rysmxBKdIEORNsagC+8rqird38GqBSGddtw=
=THSo
-----END PGP SIGNATURE-----

--xYZNg0PaPDDvvjVD--
