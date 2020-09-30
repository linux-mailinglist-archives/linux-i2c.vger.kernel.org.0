Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A72DD27E08C
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 07:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725320AbgI3FoL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Sep 2020 01:44:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:38646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgI3FoL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 30 Sep 2020 01:44:11 -0400
Received: from localhost (p54b333e6.dip0.t-ipconnect.de [84.179.51.230])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3EE58206DB;
        Wed, 30 Sep 2020 05:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601444650;
        bh=dCp5BvHqwy9gWRuLy6GX+0629Fd22LBIyYCZMBh7p+M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OW1qYNN7fV+OMc3HO/X0DFy4Qnw7CgQGK+HyklkYURDFtHLUrQ4ACyy+HKqQ6hofw
         5r5cn0TqDY1aKasmv21+67YG697aRFsNsnQdbhvtKzf1S3upego6QqX7eqnHq5Mw04
         Z/MqHojJD35ucXYk/EPMeG10oqeafKeCQiT4GMQ0=
Date:   Wed, 30 Sep 2020 07:44:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Khalil Blaiech <kblaiech@nvidia.com>
Cc:     Rob Herring <robh@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: Re: [PATCH v11 2/2] dt-bindings: i2c: I2C binding for Mellanox
 BlueField SoC
Message-ID: <20200930054407.GB1305@ninjato>
References: <cover.1600804577.git.kblaiech@mellanox.com>
 <cce96d20e0bb258ad84c6ed52c49b957f0fa3452.1600804577.git.kblaiech@mellanox.com>
 <20200927135710.GD7298@kunai>
 <MN2PR12MB361651014BE6D69C6792A805AB320@MN2PR12MB3616.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Content-Disposition: inline
In-Reply-To: <MN2PR12MB361651014BE6D69C6792A805AB320@MN2PR12MB3616.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Our driver supports both ACPI and devicetree. However, the platform
> firmware running on our platform implements ACPI and doesn't
> really rely on devicetree. Do you think we should keep the devicetree
> support? Or should I get rid of it before we apply the patch?

Usually, I'd say, if it is not used, remove it. If it would be used in
the near future, then we could keep it. But that you know better than I
do :)


--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl90GycACgkQFA3kzBSg
KbYv6w//btWEklK8FQRb+CS0GuoXmW1L/T2or3Ci5IVV1rBhCDBkBuSr5tuLGrL7
Shj9YBKANogOteRCJUFEJ8j101/UAIcJE2J9hMnXerI5AhCdv+b+Z7WS3t9/hs5f
ZvxCrtT6PfITZzksf5tdLY8BoIB9bJGgOUG9W9gJVj/F/Esy9022mHB3kz6/lcJo
FElqcBzEwE4o57aTl1vp9lxHGSZ8abtYjWhcw9UGzdq2NGjvzW/YmH8wAi0Mdo+r
tzaIEK6KqeaGr0jDFhzEYCzXQDQqLXgYdS0EmznZ9DdCxXJH09vtjZ6ctgzauc94
4/PjfsOXJsnODaZb6wotoNbKicPcj3Vxa4sksrysMywL/yZ2EEbZWAxDO4Cs1x0P
UGDF5krlFlFQyQ041I5A9Imng8SEElfutBYMitxdwdj+/yf01GOQqZULNF3QfsVn
7L/VK8KfxZOiszqJ8FpGM5xizN5TYwN5syCfGTQ1gxzfRNK4qGxjA8pDkR0djxq8
E72Y3jUnge0GaD+IhF7Rs10y8J9c0z+/XgxfKi69RuSUDbYXw1iTjdOsuu142wgq
80H/k2WeeglrGa2cMVdAjz0aZJ0OqK6MT5CJRr7B2ULW9Ak3iPpEhmH6bL8XRQaB
GSMhgCHZ9fTv+mmlIhgHvwS3lD8mkfWWXCAeffjGcu5ckrqZhb0=
=KZ4S
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--
