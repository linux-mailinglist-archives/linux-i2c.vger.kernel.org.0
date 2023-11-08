Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E565F7E528B
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 10:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235526AbjKHJUK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 04:20:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235475AbjKHJUJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 04:20:09 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83C0610A;
        Wed,  8 Nov 2023 01:20:07 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56ACC433C7;
        Wed,  8 Nov 2023 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699435207;
        bh=cXx073rFQpuH5k631XKojmOybq3UcDQwzxYaqykG97E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ioxvr99r0Rtu6CEzJ4flkbU+DUiSQNXqPqQUT2ft/KHm6mghW/G0gtYz7zHtGvIo1
         C3a5RMkl6GacIiHYNORYQWDL0/SPvK/jdJVPLWLy828aVYhJtBS+FmeyUrXWzAfmMR
         i7yxmLE+xd5iWbkZ1BfoRVn0KKz/1eoZpOfWWaXeo1ZOqueAesEjXZCHCOd9ivrU5n
         +pfe5N9DaXeW15SJGLBgK5SPagAcL680UNZEgLC470eVz57dRxudnvLRNwQu86A/TR
         lYb/7+Ba9bm0FmVNvlhJNBCP4ZCYccaFrSohjAm1tcFTdCN2gMIt96uSDaDTpscmGE
         k/snSZLE8wNVw==
Date:   Wed, 8 Nov 2023 10:20:04 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, chuong@os.amperecomputing.com,
        darren@os.amperecomputing.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Disable TX_EMPTY irq while waiting
 for block length byte
Message-ID: <ZUtSxNviS1w+yVYV@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tam Nguyen <tamnguyenchi@os.amperecomputing.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, chuong@os.amperecomputing.com,
        darren@os.amperecomputing.com, stable@vger.kernel.org
References: <20231102033009.4555-1-tamnguyenchi@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3FWqOI7f1tKbk44/"
Content-Disposition: inline
In-Reply-To: <20231102033009.4555-1-tamnguyenchi@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3FWqOI7f1tKbk44/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2023 at 10:30:08AM +0700, Tam Nguyen wrote:
> During SMBus block data read process, we have seen high interrupt rate
> because of TX_EMPTY irq status while waiting for block length byte (the
> first data byte after the address phase). The interrupt handler does not
> do anything because the internal state is kept as STATUS_WRITE_IN_PROGRES=
S.
> Hence, we should disable TX_EMPTY IRQ until I2C DesignWare receives
> first data byte from I2C device, then re-enable it to resume SMBus
> transaction.
>=20
> It takes 0.789 ms for host to receive data length from slave.
> Without the patch, i2c_dw_isr() is called 99 times by TX_EMPTY interrupt.
> And it is none after applying the patch.
>=20
> Cc: stable@vger.kernel.org
> Co-developed-by: Chuong Tran <chuong@os.amperecomputing.com>
> Signed-off-by: Chuong Tran <chuong@os.amperecomputing.com>
> Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>

Applied to for-current, thanks!


--3FWqOI7f1tKbk44/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVLUsQACgkQFA3kzBSg
KbY3mQ//TCqtokgPOJEAbu32xFeJt4qPYJPbmp2grGxCc/ThK8NU5YvjevMfYBfu
iQB+nbHSgNpVXyzNK77YMDD7RNQBFnJgDpcvC6rXj8N8NaHThhAcEy+iGbDW37cI
aA4eZ6xflK1nflWMu+LzFutfqNXEOLvbVGyrUb/e/aISn88DlHUyQCOrUVuBXRbp
+sqrNr+P1GlP77hsZQwuomnNnIQKDeRhHNQTCqoGEbB7ddoZseCFpYXldTaIXJVY
8AUaBnBGZ6b9fDm7524DeoZJiErHLVWidb3clHyaSBR/yzehfd0ZdfktD+Xvs0L3
5tQ2BfrDCxzk3JHhG2dLWTGBdkP9KwEtftiFnszMjWPRaYnXGcqBeGMH+TOZyXgH
UxzJvZLgiY59j1BkUDKftYUXSXuIh8sMcwnHYT4OhwpjGNyQx5JTr9saIPdWzcnD
9wtpPlK9E+a5NAh81rq9H10ODf97PnZyT9RoMRmEAZLo3DUxx1uM5qZ+q/eJbkjL
cLXmQA5UAH3Er08bomNb4dPnWM6EWUruWKJJrg3ze8wUxFUp2R+vYK1RmHNbGuHQ
m3pTlwvXbmSUZL/nBmJBSNbsscrmEvBPG4RWy+I+d6Q9e6+YYlabyPWTkdtqroyV
RYmAKh3yL6CYPtBEWEwdh3Bm+R8642Euv7WBT7Fa9BrHQeshCsE=
=t/rL
-----END PGP SIGNATURE-----

--3FWqOI7f1tKbk44/--
