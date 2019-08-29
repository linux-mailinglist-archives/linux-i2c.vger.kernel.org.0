Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D621FA27CE
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 22:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbfH2UTo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 16:19:44 -0400
Received: from sauhun.de ([88.99.104.3]:43196 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726935AbfH2UTo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 16:19:44 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id C2A0D2C001C;
        Thu, 29 Aug 2019 22:19:41 +0200 (CEST)
Date:   Thu, 29 Aug 2019 22:19:41 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Andrew Cooks <acooks@rationali.st>,
        linux-acpi@vger.kernel.org, platypus-sw@opengear.com,
        "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
Subject: Re: [PATCH v5 1/3] i2c: piix4: Fix port selection for AMD Family 16h
 Model 30h
Message-ID: <20190829201941.GQ3740@ninjato>
References: <20190802145109.38dd4045@endymion>
 <20190802145246.76c90f20@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NEaRsfQExFH3jWtg"
Content-Disposition: inline
In-Reply-To: <20190802145246.76c90f20@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NEaRsfQExFH3jWtg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2019 at 02:52:46PM +0200, Jean Delvare wrote:
> From: Andrew Cooks <andrew.cooks@opengear.com>
>=20
> Family 16h Model 30h SMBus controller needs the same port selection fix
> as described and fixed in commit 0fe16195f891 ("i2c: piix4: Fix SMBus port
> selection for AMD Family 17h chips")
>=20
> commit 6befa3fde65f ("i2c: piix4: Support alternative port selection
> register") also fixed the port selection for Hudson2, but unfortunately
> this is not the exact same device and the AMD naming and PCI Device IDs
> aren't particularly helpful here.
>=20
> The SMBus port selection register is common to the following Families
> and models, as documented in AMD's publicly available BIOS and Kernel
> Developer Guides:
>=20
>  50742 - Family 15h Model 60h-6Fh (PCI_DEVICE_ID_AMD_KERNCZ_SMBUS)
>  55072 - Family 15h Model 70h-7Fh (PCI_DEVICE_ID_AMD_KERNCZ_SMBUS)
>  52740 - Family 16h Model 30h-3Fh (PCI_DEVICE_ID_AMD_HUDSON2_SMBUS)
>=20
> The Hudson2 PCI Device ID (PCI_DEVICE_ID_AMD_HUDSON2_SMBUS) is shared
> between Bolton FCH and Family 16h Model 30h, but the location of the
> SmBus0Sel port selection bits are different:
>=20
>  51192 - Bolton Register Reference Guide
>=20
> We distinguish between Bolton and Family 16h Model 30h using the PCI
> Revision ID:
>=20
>   Bolton is device 0x780b, revision 0x15
>   Family 16h Model 30h is device 0x780b, revision 0x1F
>   Family 15h Model 60h and 70h are both device 0x790b, revision 0x4A.
>=20
> The following additional public AMD BKDG documents were checked and do
> not share the same port selection register:
>=20
>  42301 - Family 15h Model 00h-0Fh doesn't mention any
>  42300 - Family 15h Model 10h-1Fh doesn't mention any
>  49125 - Family 15h Model 30h-3Fh doesn't mention any
>=20
>  48751 - Family 16h Model 00h-0Fh uses the previously supported
>          index register SB800_PIIX4_PORT_IDX_ALT at 0x2e
>=20
> Signed-off-by: Andrew Cooks <andrew.cooks@opengear.com>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: stable@vger.kernel.org [v4.6+]

Applied to for-current, thanks!


--NEaRsfQExFH3jWtg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oM10ACgkQFA3kzBSg
KbaAWQ//cejX5wNmq/86VgH0HBL8vaGsiIXXyk31ubybf2Cy+49BTQSoqEZzLksD
Wt4lMuy5g82KrzHfv0EBhfFky3f+CepSj/+SVaMdA6qukenIV1KkwfXOX8r1eeaj
gU4VXujIFpsul77gH0IhujLLFE6uJJbAaZxv1T0MGy1jv1rV32vFB/9iKrCBGrYo
z2Oc3JWt1HKSU6gFVcU802W77tSxiJXi1YQawR5iR+elQuf6G0bZEeQxMOlrAX7G
2yIcnaJjg7ggHzjmcxddSLoXhEP91KctbNkMDTCJON4uxFE0uPcW/7kHl/3839bc
WxTElRHBrJ82xjvNIuVqgvC0qjo2E4QWzY+dSpWWnac0pKCVeFbSRu4BPY5eY/zk
vEjNRuuHXKTWlWCXtayprTQeC7NLyT3dW2jKzGw+ZoBkmgZYlwGm1MWR6vwHT+41
3AduNlYf0C9B8jbQUl28MbRr+YUaF1Mp0JiL3R1Fv9ab9m79iRzPUAqWgya7Bgqs
2nwOM28Fbh1fRGysNqOJcSLrVw5hPp/SG/m+mTyR05a5aZaTtEdPyKw7DGTJtjru
V/usRVQMsmh9jEuUM35KDQT3wU50fogSlnYRShDpCvXA+qdqEHoTZ/xUr4ZYqitF
peda7N2EH/j9BsHoVgbi9I14rbN9jkEa8T0kLB67zOHJCue2v2w=
=nshq
-----END PGP SIGNATURE-----

--NEaRsfQExFH3jWtg--
