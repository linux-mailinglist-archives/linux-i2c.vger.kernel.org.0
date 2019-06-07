Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D10723984A
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 00:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730029AbfFGWKp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 18:10:45 -0400
Received: from sauhun.de ([88.99.104.3]:46370 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729685AbfFGWKp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Jun 2019 18:10:45 -0400
Received: from localhost (p5486CE26.dip0.t-ipconnect.de [84.134.206.38])
        by pokefinder.org (Postfix) with ESMTPSA id 8DE643E43BA;
        Sat,  8 Jun 2019 00:10:43 +0200 (CEST)
Date:   Sat, 8 Jun 2019 00:10:43 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH v5 0/5] usb: typec: ucsi: ccg: add runtime pm support
Message-ID: <20190607221043.GA869@kunai>
References: <20190607163423.31860-1-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <20190607163423.31860-1-ajayg@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2019 at 09:34:18AM -0700, Ajay Gupta wrote:
> Hi Heikki and Wolfram
> The latest set (v5) fix comments from Wolfram on further refactoring
> master_xfer() function in i2c-nvidia-gpuc.c file and removing extra comme=
nts
> in patch 2/5.
>=20
> Patches can go through either usb or i2c tree but since there are 3 out o=
f 5
> patches from i2c so may be better they go through i2c. They all should go
> together.
>=20
> Thanks
> Ajay

Applied the series to i2c/for-next, thanks!


--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz64N4ACgkQFA3kzBSg
KbaMlA/+KDJUsy/5JMpILnXLRwhbYakhkPJLFi1egK+T4DxVjDXfX6enZ0gpuakO
wHWOcHmhXb96uhVkPYHzv72T2c74HsiuPDIuhKXtU+eFcBJAAg6lruwMDtHrhroM
uFX7s7M2bP6bxgCtfMZdZEMjQTA0FCGaPQ9OX+z4AdT0kPAeJQX2dxB/+MvQbPxs
aWGBQtPJBxzyE5oG1Xn2wTYvjeY1uDUixL26fvgGtKlSE+HOANZP6ttwN+tkT6EK
c4zFTDN5N2aAek3bpmxnTFMeMM1CQZarzuFPCC7iihkUcs3K3NrMwG3wv5YZ0s4t
xwDym0PTB8LCc5eNX/kBD9a13Mk02I/qcRdDO2ADpIT8JFY4OjveQB9CWNobyw4A
Irir6r4VPk+yFfHLJX8bVqTQGsmOm5WBkQ1lH6XdTl0FUsStEZQkMaci+8ZMaF7N
m6GMXlE9xtVVRd6WMgCMxtUq0NzR2SNMqhehD3B7KqMQCdB7k2reOFvwPzTY0554
TPKRTbDkorWPlBpfEmh3iVYlhg8yW/C0dVvKzmZmik2ILdWthZQF8O82qfKjEA8t
dialiA7wbUnbshaQdjYgLNdI7XXMcSRL3yeRHLwyOrHUXgQS4tll9MCB7p9YYtOU
/ygVSPilZ9OhpvLMNwB4d7Rq1xpdi/15m7R1YKnHO8MFGMF9mJk=
=luhQ
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
