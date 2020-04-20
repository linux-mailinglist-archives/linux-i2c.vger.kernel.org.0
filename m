Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C441B1226
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 18:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgDTQqV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 12:46:21 -0400
Received: from sauhun.de ([88.99.104.3]:47836 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbgDTQqV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Apr 2020 12:46:21 -0400
Received: from localhost (p54B335B8.dip0.t-ipconnect.de [84.179.53.184])
        by pokefinder.org (Postfix) with ESMTPSA id BB8642C1F4C;
        Mon, 20 Apr 2020 18:46:19 +0200 (CEST)
Date:   Mon, 20 Apr 2020 18:46:19 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Patrick Williams <alpawi@amazon.com>
Cc:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjorn.ardo@axis.com>,
        Patrick Williams <patrick@stwcx.xyz>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: slave-eeprom: support additional models
Message-ID: <20200420164619.GE3721@ninjato>
References: <20191001164009.21610-1-alpawi@amazon.com>
 <20191001164009.21610-2-alpawi@amazon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J4XPiPrVK1ev6Sgr"
Content-Disposition: inline
In-Reply-To: <20191001164009.21610-2-alpawi@amazon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--J4XPiPrVK1ev6Sgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2019 at 11:40:06AM -0500, Patrick Williams wrote:
> Add support for emulating the following EEPROMs:
>     * 24c01  - 1024 bit
>     * 24c128 - 128k bit
>     * 24c256 - 256k bit
>     * 24c512 - 512k bit
>=20
> The flag bits in the device id were shifted up 1 bit to make
> room for saving the 24c512's size.  24c512 uses the full 16-bit
> address space of a 2-byte addressable EEPROM.
>=20
> Signed-off-by: Patrick Williams <alpawi@amazon.com>

Do you really need them or is it just nice to have?

I am undecided. I definately don't want all the EEPROM types which
exist, but the full 16 bit address range makes sense...

More opinions welcome.


--J4XPiPrVK1ev6Sgr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6d0dsACgkQFA3kzBSg
KbZJPw/+NdXm3WE71qSKQADHq85s60wK3LSN5JMDbI9Y8JfRHwdi7aAzteGbmvm3
sxQVvBCfpmGvZgFo+G57neBJH9DmDxM9uHyFiUWDGC5CoJNCpd2XwBHrFLYMi3IV
MkzbNbyAbByX2snG50QkXMfsvpO0BRFWnelVKrHJ8Z920P7wNLH16ppsgsXU6pEd
hDgLAV4xy8nJi4Yt7pHE/mb5H5XfAEd5lEPsNTOdI8DRIMgoOH0spsqc7YM+ZDWN
/j5zVwWfJ97cSe4DFvBieH3i6uI62X/Xui6UIiu0B/VAf2oXnZXp2YaHGMySwDXS
wji8G8xaNjxqFyqrLbOi3tPNE41gydxAO43Es1rlgx9ILotA2PQYfwr2NMf5QKVz
9AfiHZ8IrpOD/CwKGxi3RqtXlH8EvRa6cnqfrLdPiZBu9+iZzjFXXGjxGzQ3goPm
pPn9CdPqmHbcrKdPkMULrp0KuJTIVdWfa/zB9216dIgHcouLEalZ0p1kutAX+Cum
8scoAe9FZcp3dgU+MTJ5hb1EJ/jLfKyAZYcYLMKxal0bRo2sCtTAC706OM0StVWP
NBRj4LYGpjfg7AJ2umDkzWgb9vKftUJgo9JQIbUkbDQIeRmNYYWQoUH1VQE27gsG
6QEQqirWCb1N/iI8j4zwNtWJNgiSsSBchjHz4ETCVfjmHdUN3rA=
=cWlw
-----END PGP SIGNATURE-----

--J4XPiPrVK1ev6Sgr--
