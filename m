Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 356F57DB88
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2019 14:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730344AbfHAMbd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Aug 2019 08:31:33 -0400
Received: from sauhun.de ([88.99.104.3]:52418 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728800AbfHAMbd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Aug 2019 08:31:33 -0400
Received: from localhost (p54B333D2.dip0.t-ipconnect.de [84.179.51.210])
        by pokefinder.org (Postfix) with ESMTPSA id 029702C2817;
        Thu,  1 Aug 2019 14:31:30 +0200 (CEST)
Date:   Thu, 1 Aug 2019 14:31:30 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Ray Jui <ray.jui@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v1 1/1] i2c: iproc: Fix i2c master read more than 63 bytes
Message-ID: <20190801123130.GE1659@ninjato>
References: <1563956907-21255-1-git-send-email-rayagonda.kokatanur@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2hMgfIw2X+zgXrFs"
Content-Disposition: inline
In-Reply-To: <1563956907-21255-1-git-send-email-rayagonda.kokatanur@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2hMgfIw2X+zgXrFs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2019 at 01:58:27PM +0530, Rayagonda Kokatanur wrote:
> Use SMBUS_MASTER_DATA_READ.MASTER_RD_STATUS bit to check for RX
> FIFO empty condition because SMBUS_MASTER_FIFO_CONTROL.MASTER_RX_PKT_COUNT
> is not updated for read >=3D 64 bytes. This fixes the issue when trying to
> read from the I2C slave more than 63 bytes.
>=20
> Fixes: c24b8d574b7c ("i2c: iproc: Extend I2C read up to 255 bytes")
>=20
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>

Applied to for-current, thanks!


--2hMgfIw2X+zgXrFs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1C26IACgkQFA3kzBSg
Kba85w//WB/fT1rfNyJzzedg2jVwLmdiaCcBYk4Y+Sz9sKRE3/SAdPulfp/wRUcb
Q0YUiC2cRjunfZK0voZ5EUSFU+pBvM8dIRuTIWon/qdi1+6tDDAFIuXcswulFf1d
09hBq1/aSOad318mNt2k4qJmUNyLvDaeYFHDCLwic1K48FWFqTWzgLpFn0idKxYq
wIqINQz9dl6Qg0t81emc4xX0MB202LoaDriix4ERwHFjLsQuseqr4IeDrbXtGvLN
7msFGGu7cgru2AUNXKPYWpZP3NItfZexR7AVhYKvuvDECy/jk/f+3DSyxj7qvrnS
1Am4aRNQI6BQRzpfVCZwOEdOTpsx9SCQTEKpWkj6P5sde01ghq/oQzp8ENb9qoj7
cuqGUJ3jf02dSLLFXusgfqywUEmLktGX+1gUvicURBykEYEecUV2xgCjnB3e7cTf
v3/IJxTqDRpeCIbMkD0W4MN3WVoFISnn/Vl50oH7GiwoxVJ4TnFdNOZ8TmWfV1TG
EoQf9yQR3vcmz13HUwyF8W27wJwWJ8u0iWLyqxeCgDaKtHRrL5HG8bEPu3rdLafE
6n5ksnQpABRPshtd18hRQyGVqWaqNDUjKLJgGJVhqK3kbnvgGg0Z8qrcQHOA7tl+
HMquJaDbDdS3AMUD3N0JHWqTr236PF05THzOH1X4hXIfsRtnPF0=
=L7tj
-----END PGP SIGNATURE-----

--2hMgfIw2X+zgXrFs--
