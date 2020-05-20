Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3501DADDB
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 10:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgETIqY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 04:46:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:53360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgETIqY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 04:46:24 -0400
Received: from localhost (p5486cd24.dip0.t-ipconnect.de [84.134.205.36])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2DE49207ED;
        Wed, 20 May 2020 08:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589964383;
        bh=Silh4uiFP/rOvrfHZl8iggW/x+FV4IseIF0sqI2sylY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XKdQslMcOXkvOGqB9lnydlVM3gpZZdf8X3Pt3KmWQC8wX6InNl56hD7XtIFEnGCez
         /SHPFYe21eMrnqAGvuj0oxm1L5DAomqmQ8NCCsFnZ3Ymd8X1OYe0QiWwdVKMjOupch
         4lw+aWl2ybwvszvB8uOswj1bdyAyz4FedKyucjzk=
Date:   Wed, 20 May 2020 10:46:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Qii Wang <qii.wang@mediatek.com>
Subject: Re: linux-next: Tree for May 19 (i2c/busses/i2c-mt65xx.o)
Message-ID: <20200520084617.GA1328@ninjato>
References: <20200520040354.3e619918@canb.auug.org.au>
 <e7aa1258-6c54-03bd-3252-20cefe88b87d@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <e7aa1258-6c54-03bd-3252-20cefe88b87d@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 05:24:30PM -0700, Randy Dunlap wrote:
> On 5/19/20 11:03 AM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > News: there will be no linux-next release tomorrow.
> >=20
> > Changes since 20200518:
> >=20
>=20
> on i386:
>=20
> ERROR: modpost: "__udivdi3" [drivers/i2c/busses/i2c-mt65xx.ko] undefined!
> ERROR: modpost: "__divdi3" [drivers/i2c/busses/i2c-mt65xx.ko] undefined!

Qii Wang is working on that.


--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7E7lYACgkQFA3kzBSg
KbZ0VhAAmoMUCg8sZDw0aJsOLnmv3gXchguyF0/vevAnrr6KwIkVQ8EuTBlNFO+E
zv8TzTEB47qNmFL9CO2WIU5kbiGdfkbe5u8DOnVJhN+6/VEeEp84WRmUkJoh/3gE
I1oKB7sELQyTj8mzM1fCr6nrj+AoDv5rD69eej2eS0WbmndmqnRMJsIoy41XGOI3
LfXbDxFKE3uNuKS3IIncn1baeUT5Ygmp94pmw0ZZVnP7AHXNoaDP6WfmVSDyL3iJ
hMtUDUvPZHZjDTHybBgp32I19Doh/iMLEjYtA5VpnCu34CIeE763GNdZiJTG4sik
WsX0zlxZTZZ7oAhXxrKn4AtDm3tSYG3kAH4VCKT4zRY+ZryQA+onb83Cws5UPKSu
tQZ8Mia8NanFdxrMFsRcBps6DNZrbvyafP7qm+iYy3s1OgiCGZHvMP6bhploCkkD
UTDTLQKA/oXxMYmG1VsH9q2u7a2dl7sryF5FdcrptGCKyjROtYWijNimchZlhvDl
Exp6dOpq0KeGKGpg6RzCDr5kesVgAYVqkHzkh207Nx4PshCaITuKw1Y6nWPaVfaB
cJUzW8Ab+Q8rQ0pfk0/FJG6nHr4xQiE7dkRysLcsVIr39VN0ib3oUGKuHDasRmu0
DZknFd6Ad4AhofYfKdoEYUj4LkmixoiXR9pSRjhK6PtwTZSVJXo=
=Dw1m
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
