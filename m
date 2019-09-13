Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20DB8B219E
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2019 16:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388489AbfIMOJK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Sep 2019 10:09:10 -0400
Received: from sauhun.de ([88.99.104.3]:35842 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388084AbfIMOJK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 13 Sep 2019 10:09:10 -0400
Received: from localhost (234.77.63.94.rev.vodafone.pt [94.63.77.234])
        by pokefinder.org (Postfix) with ESMTPSA id C763F2C3115;
        Fri, 13 Sep 2019 16:09:08 +0200 (CEST)
Date:   Fri, 13 Sep 2019 15:09:08 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjorn.ardo@axis.com>
Cc:     linux-i2c@vger.kernel.org,
        =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>
Subject: Re: [PATCH v3] i2c: slave-eeprom: Add read only mode
Message-ID: <20190913140907.GA1022@kunai>
References: <1567778769-25485-1-git-send-email-bjorn.ardo@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <1567778769-25485-1-git-send-email-bjorn.ardo@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 06, 2019 at 04:06:09PM +0200, Bj=C3=B6rn Ard=C3=B6 wrote:
> Add read-only versions of all EEPROMs. These versions are read-only
> on the i2c side, but can be written from the sysfs side.
>=20
> Signed-off-by: Bj=C3=B6rn Ard=C3=B6 <bjorn.ardo@axis.com>

Applied to for-next, thanks!


--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl17ov8ACgkQFA3kzBSg
KbaNcQ//YVJOSPz/Khsth+9fS36m5lwXvbyxxvka4p3tecrZnsKtYEz5HMi33FgO
MZAsmWrxmOn3DLiRHvYkdmsTD5v2ZNDPfmdUqdDu9/IZ72LbZ8LKYtsqJQBMgm7B
BbSG2wwKeiaMvgQIGwN+DIZllzC07sKUes7YMYTFl/VBq4wbHZoUDpkCrPDT6C2K
TAMrTz7YLij2jXzvEsY3ab0zsfb17792ChYxPso+ErRtUH27kNbtbKnMMSMXPF7o
P6MQBp3zILQxAdunWOKDYGsJUO6pq5JHYVhhxGvW52azyist6Eoh+t3PBjqOQOXW
fmJ7xf/xMnW30USvlOELFz/LeH08d9VUUDmBxlmXXeT4DaYB86vBOmsP6t902q76
rc2vXE5pGvfR+IP6nxpRKOWD8sJw9TtdzUMkJx3B5D6jAdhCR8Pf8qn96+c/aAfx
LqoA+zIDKYe8J1QH+M/AJMDcNevfl9Wc1552UklUM4Pi6cKuSBF3V7W6FXiZwWXp
GPFIW2pX9+IWTEwds+poxwBEKYlflVDtHWUJoD6H431LhmNJ2pXEddIuH1bJWSnT
3yRCy3VYevj+FA9Pwx8kK6d+TPojcDNRleUz6mFtmq79oomlh/5xYFRowQz741HT
DvRMChsczKvAHry1jYPiqAup6x2IARkOG1qCC0REkMBVNS3aYBA=
=aC7/
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
