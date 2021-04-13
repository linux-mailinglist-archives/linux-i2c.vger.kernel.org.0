Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D229B35E756
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 21:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbhDMTzr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 15:55:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:44418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231802AbhDMTzr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 15:55:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67865613C6;
        Tue, 13 Apr 2021 19:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618343727;
        bh=jcDBFMxs7e2ByQlDmJU/xrTyUFGMSJkzOGBGyVot8FQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NolWkkk7ZZ4xRyuQD3bH5utbBSW9l+JWZYhy3YnwovMkTm4nelhEe0TmEBkWEQ5gH
         RoymIhVPbdpFIvoAIzXH6r4y3nhu8DR2B8J5Z16z1+hg3dgu0P3qpJUEhWsE9erjgz
         SLY33/DPDU24JDv4E2kMkOKlk8JFtF2C7XuWVrZNZIQ4MqpkSYDgAKcvG9kQ97OA3E
         ciJvcD6KkUo51/RhlnQFZs9wh/2onyTKFs8WBeQ/v4IpXSMK/OercBvEl4LxzPEBl0
         cKfWCGWQxFyZqo3onjulIAH5av6oWWEpZgATvOgVckXc81fEGlPHhrJOa0KpX56oYU
         H3sPppM6UhktA==
Date:   Tue, 13 Apr 2021 21:55:21 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     kdasu.kdev@gmail.com, f.fainelli@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: busses: remove unused including <linux/version.h>
Message-ID: <20210413195521.GA2751@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yang Li <yang.lee@linux.alibaba.com>, kdasu.kdev@gmail.com,
        f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <1618307301-72925-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
In-Reply-To: <1618307301-72925-1-git-send-email-yang.lee@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 05:48:21PM +0800, Yang Li wrote:
> Fix the following versioncheck warnings:
> ./drivers/i2c/busses/i2c-xgene-slimpro.c: 22 linux/version.h not needed.
> ./drivers/i2c/busses/i2c-brcmstb.c: 25 linux/version.h not needed.
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Thanks, but a similar patch is already in -next.

https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git/commit/?h=3Di=
2c/for-next&id=3D660f58b6d290417828680f417f43d7b810fa9138


--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB19yUACgkQFA3kzBSg
KbYycBAArL2OPVVu8CURLWz4tmmSl+zhLf/qBNv50++VK/bGgsN4/EaxlT3tAFCa
p9F3jzCM3fZTpWdxty6MGiYulLb6limWqoFRycK7CnIerwdKmd83lIL5elmlaGNP
gmkD+McwFiEgChuu+c8FEQq17nzjmxlekeYPCRb7IyWWPxhOdiLgLOW7gMmewLeK
nRag/VnRrwSnxLdBy6Z3AYebLbrP7HfWhn1DxtV2paKfogwXcQCSfwi9NY0IWw7t
XhhXYVJTsPUhciwrFour/OFodP74hqZ7SDosz9vBo97l6Nr/PCBzKBbe7HgvX2lf
4RTositNbk4u7ROIQGgmsPpaS8uADKKruaNQAKL/h+ZJNRcEvKH/DveEB8nTLLex
gnFacmF1dLQXUB6P+NWPMAvawPxzk/L4XHqPILdRKRDNK8bBfWZGbjDM/PFVvmAo
e5J1GBr0bG7YJuoUoK9NFUgcR5s5gJWQDrznctdudSbsXNoqOLm4QLmPs6osvAQa
jfDI0nefCWiN0I2rMlLddD4lPVTrYeHd3QIzmC/gXRHVU0J1rk9x5EFnP9CviwMg
EIw4y3lX4ilF/DA5g5txMdGtehpGJUy+Ww5e/jXkgrXlVQskKP5YPTaqINfgDuMW
uIanPkXMQhOfJz3KCcnc3U6W/aip/Wvl5/ItOibPxk1lwJj8pEk=
=/zqh
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
