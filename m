Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033191DE8AA
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 16:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729916AbgEVOUc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 10:20:32 -0400
Received: from sauhun.de ([88.99.104.3]:60976 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729771AbgEVOUc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 May 2020 10:20:32 -0400
Received: from localhost (p5486cea4.dip0.t-ipconnect.de [84.134.206.164])
        by pokefinder.org (Postfix) with ESMTPSA id 9DD722C203F;
        Fri, 22 May 2020 16:20:30 +0200 (CEST)
Date:   Fri, 22 May 2020 16:20:29 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        srv_heupstream@mediatek.com,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: core: fix NULL pointer dereference in
 suspend/resume callbacks
Message-ID: <20200522142029.GB5670@ninjato>
References: <CGME20200522101524eucas1p1aeef4a054a80b5d822ed3dc4b16139d7@eucas1p1.samsung.com>
 <20200522101327.13456-1-m.szyprowski@samsung.com>
 <34736047-3fc8-385b-cdea-79b061deb7b4@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Content-Disposition: inline
In-Reply-To: <34736047-3fc8-385b-cdea-79b061deb7b4@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2020 at 01:15:12PM +0200, Marek Szyprowski wrote:
> Hi All,
>=20
> On 22.05.2020 12:13, Marek Szyprowski wrote:
> > Commit 6fe12cdbcfe3 ("i2c: core: support bus regulator controlling in
> > adapter") added generic suspend and resume functions for i2c devices.
> > Those functions unconditionally access an i2c_client structure assigned
> > to the given i2c device. However, there exist i2c devices in the system
> > without a valid i2c_client. Add the needed check before accessing the
> > i2c_client.
>=20
> Just one more comment. The devices without i2c_client structure are the=
=20
> i2c 'devices' associated with the respective i2c bus. They are visible=20
> in /sys:
>=20
> ls -l /sys/bus/i2c/devices/i2c-*
>=20
> I wonder if this patch has been ever tested with system suspend/resume,=
=20
> as those devices are always available in the system...

There was another issue with this patch. Although it is not clear yet,
if the patch itself is the culprit or if it just unshadows something
else, however, I am considering to just revert it until these issues are
fixed.


--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7H360ACgkQFA3kzBSg
KbZxwA//XrAA5EoLsXd9wAeV/TJMdqTuVPon4p5jh8DNGzh32u175zocF6eFD/p+
cAaHO/M1JoKGVIZp/emSN+9RVS3HoBCm682QsOGU0jlhKsYm7aWsNW8fD7wakPh0
cWrJ/WlkGqlMxRdozW63mL7UtbPPxvceBFFLv5gI/uW1BJNRhf/cJZDdGwaDAST7
U9NlWQGIheQUwOKVGI0qwfnqcNcZ719fNmBIvdsrKaoRXV4i0BRflXs+NRvtk7gB
BxcRBtEv2NXHGlfYkAmB4qwZF171V/5/jLLaCkcEikibCKS+geCCDuSqiFwDfpJ8
NMVmZSAm1PPopxkTknfum+eJZ4KVwQDhCCeeoUTmvdVNECzEkErDZagh2CPdusYQ
4gPU0X2tMbHRzZZOZ44IogMvExRwsRUxppnpMjiMtYgZL4ayxpgSzfTy7F1i4puc
YlJnwyT5xNl5bL0krBM8eXlQQP+QnIa7pxbmyST4DVI7voPgdhBR5xW1OU1baDqF
l4CSM64EGSTUy+pEP6zlrrGNVFV4HDSc1dvbu8Bha62Wmr6GkmMrRKufzcDlzZzl
gkXZkVgTellll1dPQPVWid+Zci8aJEIrmJmZRpTR7KbdXPiIn7xXjv/PtiS5om5u
hM/kOcHV1seezhDUrRZANyfx+ClPCsjyz4uYjYlDCjZMkOwiPLg=
=cMqr
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--
