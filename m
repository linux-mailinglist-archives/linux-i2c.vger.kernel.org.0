Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4F53E06F1
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2019 17:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727531AbfJVPDy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Oct 2019 11:03:54 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:44082 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfJVPDx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Oct 2019 11:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=RmIdZzkMlhT4XIZZALZZtiYeWB4cN5wVHBIJe3nZc3s=; b=CbPOtXprnRODc2crZ2YG669z+
        N9F+6veJtoCzxuqP1cvJImzecTk+fMk39UW8bN8nFhvVr726A7cy0lmUd9AyUG79P3TkdlAoRYXU2
        8/zobJ6IeCJInQcGNcC1KjJB8PeCG7w94nhsLLVI1V0+8obMuOeftzD2JpD+viyy6tJlM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iMvhL-0006rk-Qc; Tue, 22 Oct 2019 15:03:47 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 029B42743259; Tue, 22 Oct 2019 16:03:46 +0100 (BST)
Date:   Tue, 22 Oct 2019 16:03:46 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4] misc: eeprom: at24: support pm_runtime control
Message-ID: <20191022150346.GF5554@sirena.co.uk>
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
 <CAMpxmJUrY9YK==6Mf5MoRTUDwmXJ6v5EM-VLXCNXJ8ZNK+xHyA@mail.gmail.com>
 <CAAFQd5BEcE0m7Jg1ZnmrF+jwH6Yn8+vYqT1L2wc2zkZ5vRCRAg@mail.gmail.com>
 <CAMpxmJU_Vws0oGf+GQCEbs-NHFCniO8c2CbXrKy9oEVC_KUhMQ@mail.gmail.com>
 <CAAFQd5D=T+x7j+Lst8AQt0epLckPJv_bXtNGs3Dk=kbdbfw53Q@mail.gmail.com>
 <20191022111908.GC5554@sirena.co.uk>
 <CAMpxmJUtYjF7L7W_OG6AP6CuLeW_1JPcgNxyBj201GJKfb+H9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Zi0sgQQBxRFxMTsj"
Content-Disposition: inline
In-Reply-To: <CAMpxmJUtYjF7L7W_OG6AP6CuLeW_1JPcgNxyBj201GJKfb+H9w@mail.gmail.com>
X-Cookie: Whip it, whip it good!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Zi0sgQQBxRFxMTsj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2019 at 02:13:29PM +0200, Bartosz Golaszewski wrote:
> wt., 22 pa=C5=BA 2019 o 13:19 Mark Brown <broonie@kernel.org> napisa=C5=
=82(a):

> > The ambiguously named regulator_get_optional().  This should *only* be
> > used for regulators that may be physically absent in the system, other
> > regulators should use normal regulator_get().  It is vanishingly
> > unlikely that all the supplies for a device will be optional.

> I take it that this driver should also use regular regulator_bulk_get() t=
hen?

It's really up to whoever maintains the driver but I'd recommend it
since it tends to be easier.

> I think the question about the return value of
> regulator_resolve_supply() still stands though: is it normal that it
> returns EPROBE_DEFER if it can't resolve the supply on systems without
> full_constraints? This will cause the driver to loop on probe
> deferral, right?

Yes, that's right.  The idea is that anything using regulators will call
that once it's finished setting up constraints, if you're not using
regulators at all you should compile out the API entirely.

--Zi0sgQQBxRFxMTsj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2vGlIACgkQJNaLcl1U
h9BSugf9GL1Zv61ZSplUSbs5M8h3CYM/EfV5MBdouqJ7QLGNTmLpLfB8etUMgmoI
1Fs4m45SEFdmURyu3kM8LtTZ+FIRg2ogGl1L4YxoCpQh9crlQydPV+UwwTVe+u+E
eDo1x26RBf/wG4z1NT01m+V2dH6wtYQ0U0/hD/m2pq1SJP/GGQjhdTBr6eLNOelN
gTj+LKhEC1nBa/yCfpYW5/3QFfg6RH+9YikhL8ZJMVMREuQ80R3pyk9MJJC7hckC
ArgpkaHd5AUqOu1rgCck3a73CVyf5FTP0kNn5Tvi7bDYD3R86mUTPzFQSHoIlbY3
ES6VFJ3VNlF/DQy1aWyP+RLuWlfgqg==
=iRfU
-----END PGP SIGNATURE-----

--Zi0sgQQBxRFxMTsj--
