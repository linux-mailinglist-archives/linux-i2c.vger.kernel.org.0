Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF05CA3769
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2019 14:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbfH3M7u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Aug 2019 08:59:50 -0400
Received: from sauhun.de ([88.99.104.3]:53684 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727522AbfH3M7u (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Aug 2019 08:59:50 -0400
Received: from localhost (p54B335BE.dip0.t-ipconnect.de [84.179.53.190])
        by pokefinder.org (Postfix) with ESMTPSA id 9444D2C0095;
        Fri, 30 Aug 2019 14:59:48 +0200 (CEST)
Date:   Fri, 30 Aug 2019 14:59:48 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Ray Jui <ray.jui@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>
Subject: Re: [PATCH v1 2/2] i2c: iproc: Add full name of devicetree node to
 adapter name
Message-ID: <20190830125948.GE2870@ninjato>
References: <1565235473-28461-1-git-send-email-rayagonda.kokatanur@broadcom.com>
 <1565235473-28461-3-git-send-email-rayagonda.kokatanur@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5xSkJheCpeK0RUEJ"
Content-Disposition: inline
In-Reply-To: <1565235473-28461-3-git-send-email-rayagonda.kokatanur@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5xSkJheCpeK0RUEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 09:07:53AM +0530, Rayagonda Kokatanur wrote:
> From: Lori Hikichi <lori.hikichi@broadcom.com>
>=20
> Add the full name of the devicetree node to the adapter name.
> Without this change, all adapters have the same name making it difficult
> to distinguish between multiple instances.
> The most obvious way to see this is to use the utility i2c_detect.
> e.g. "i2c-detect -l"
>=20
> Before
> i2c-1 i2c Broadcom iProc I2C adapter I2C adapter
> i2c-0 i2c Broadcom iProc I2C adapter I2C adapter
>=20
> After
> i2c-1 i2c Broadcom iProc (i2c@e0000) I2C adapter
> i2c-0 i2c Broadcom iProc (i2c@b0000) I2C adapter
>=20
> Now it is easy to figure out which adapter maps to a which DT node.
>=20
> Signed-off-by: Lori Hikichi <lori.hikichi@broadcom.com>
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>

Applied to for-next, thanks!


--5xSkJheCpeK0RUEJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1pHcQACgkQFA3kzBSg
KbabhRAAqkAUPTyDcgsxg6iBp9wHBqOf4Tvov5KX9lLAKKkdBJPIHlplIbc932uT
UFFRU/aU4B/IezQYOlq6e3vLCH0gqjXb3lTqUJNEQYxZAFKHZIHjawk8aFeFsRXo
xaMNNLBzOggSzZSSIRetueIlvz5VK3UiTBR5jNLJ8RKAjEWeP7xSBLn2SJOCgfY5
U+XLVMWw7MC+URR+0f/JICFexPkf4guujDe40MjLHLziEWUauGpDpAGKyx6n5KYG
GjSM88vlK8TYmACciAa5avC3HUC2wrzvjoXoSkF57wupss35t3gi5KHaAbOZL4kc
LocZMGDmEdTxM9aEEqWkeX/z3zH89TNuRIHv49V94OkoWzOpwl2Vxv5iJiapSW8W
BNxGoI6ELmHx+dOEP3rDwq588XL0i5MlLE+sPHabWZvbUwSdibiUZ6UyuELRv/iV
ynZLprkU2jQaMnmSflUbPKlfe4g4ugrA7ABySopWjcAZYkOjHmJKYQArmTipH9Zo
ju7cNo6jhQPxpypMCLWkfrm+fmPQsUWDBtqcIRqyQBFcrtpcdZkww0gHLmo4BQ8L
7HEgIIameZ2NfJ3S047grLxUz0gwYhYj69v5KwOm+q5sqfaJgGWMs75EsfQ/Gs3Y
E5sMlpq7v32WuhRu9fRTHCo747TVWh7tYWlihBI+zsUr7Xi8q5A=
=KZnX
-----END PGP SIGNATURE-----

--5xSkJheCpeK0RUEJ--
