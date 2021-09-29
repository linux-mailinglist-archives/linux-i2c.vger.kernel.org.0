Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B16641CCB3
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 21:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245509AbhI2TkC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 15:40:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:59232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229561AbhI2Tj7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Sep 2021 15:39:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E341A613DA;
        Wed, 29 Sep 2021 19:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632944298;
        bh=GOBvyTpD0F4nGeWotY8TBKZNm9+QO83mGnAM8UC5uNs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kDjqFWIpxjCPDNWMKQJwdhMud6zxRh9EwPUgrPMY4VFp1BOAUJ8aoT28tojFjQ/fS
         sBXSzSEObuv2puP8Z9RKaYnOYmJRzlTPzSPeif/IP0dVPw61UlUkuDG8KTuwa/Fgr6
         JGSJURjP27xt1XdHzO4GS4KHGRFcF1TralHwfe80esBEX+fIFudrS4YrwGXqEAKi0a
         DxegozEs+iLQXarRQNMbA4ZDWWvCQTK/LCmATpnKY57w/b+IIF7EqZLp6KIYAr7UI5
         CdVFgibU3+MDUEtq+IKmHgUEsgwbLbiNcBSBTNdPT3YfKHT6qovU55RmRMQ8Yf5OSW
         DTe312KTh8wlg==
Date:   Wed, 29 Sep 2021 21:38:15 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 4/9] i2c: i801: Improve is_dell_system_with_lis3lv02d
Message-ID: <YVTAp0EIW715Z3d5@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <effeb0c0-36cb-afc4-4d9a-7ef348c928ae@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DAVbrDck1vMSakIJ"
Content-Disposition: inline
In-Reply-To: <effeb0c0-36cb-afc4-4d9a-7ef348c928ae@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DAVbrDck1vMSakIJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 06, 2021 at 11:15:15PM +0200, Heiner Kallweit wrote:
> Replace the ugly cast of the return_value pointer with proper usage.
> In addition use dmi_match() instead of open-coding it.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--DAVbrDck1vMSakIJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFUwKMACgkQFA3kzBSg
KbabKw/9EZoxONWMgwBhK4Eon6EzLW0QaOlhe7I3d8bFBhDHvuFa4uKu1LJU6/oK
re9xdSWh3hASQM6XJ7UXpWYZoEFAaiyEcw65Jvj0ID2Ko2VrG5hvELmyxy6sWuFA
DUGp1N1l/JbOW2P3JzDCd8IKn+aGiz5DCkWZPchzHqjCwnhH6mWRk+0Ztpy0SqAZ
V5XzDN08sb7Do7iz0joIw9xIKQrYB+/PMwCSOi3OD5gQlvNrwG7yZVYwFXvfqnyL
WB/bRRUFl/gAN9xXVx+1VlmdnQADm+H9rrjNLK4k5ka2SekAXbIAQHtsCE4qhyip
pnPIekQkRLwMXgeLOhNNZr2kBHdWH5kJ/W/o9Du0iaEiv1no131pwWFzgMYALHxv
IuiaMXfu3OvRztLMVP4z9DfR0RHVGcY0yW2BNe9IDilgi/dwa9rD2/qnuzhdevKz
FmQKN8sGuNz4meiEZxkc1umTcxpWVKgkdG6Wni3P8fSp8EOcLSa8jio3u7v+xaAR
ytlgLvYKckwcD+2YW1mqWeLbSr/Tv9zLtnF5Ornjcui7kQ0hwbirdsGWDLTp47Rh
ls6HpgrazwPWEnboaK9fjm7v5XRBB149dO/20okzS7K1wAbcpKLd6ZyMVBnh5r/1
/W7+GVWcfP4Taq8BKaeURPZ6BtPMw/OSmEFXBTogvsGigw+8hTA=
=2XlF
-----END PGP SIGNATURE-----

--DAVbrDck1vMSakIJ--
