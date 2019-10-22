Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33202E02B1
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2019 13:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387795AbfJVLTP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Oct 2019 07:19:15 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:33278 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387405AbfJVLTO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Oct 2019 07:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=qr4z6oo7+Ton4jDBY5r2uXEtGOqskUXoAvq8PxTdUVk=; b=ZuOmX8stWnXGunirZHU1q4j3k
        ay81XB280IBkZfnGDl22OZu5tQRwnWkZo+UdYaElANVOV4nNu4y15+N60Zyi2nxCaWmztdRUeF08f
        XVlT2e+s2zY8s82Ik3WuUJxyKRZtzhKCIespxxhwqBZgyeoW0AjoMWfyCxnsvpXr5OzvM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iMsBx-0006S8-FB; Tue, 22 Oct 2019 11:19:09 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 715442743259; Tue, 22 Oct 2019 12:19:08 +0100 (BST)
Date:   Tue, 22 Oct 2019 12:19:08 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4] misc: eeprom: at24: support pm_runtime control
Message-ID: <20191022111908.GC5554@sirena.co.uk>
References: <20191018082557.3696-1-bibby.hsieh@mediatek.com>
 <CAMpxmJUrY9YK==6Mf5MoRTUDwmXJ6v5EM-VLXCNXJ8ZNK+xHyA@mail.gmail.com>
 <CAAFQd5BEcE0m7Jg1ZnmrF+jwH6Yn8+vYqT1L2wc2zkZ5vRCRAg@mail.gmail.com>
 <CAMpxmJU_Vws0oGf+GQCEbs-NHFCniO8c2CbXrKy9oEVC_KUhMQ@mail.gmail.com>
 <CAAFQd5D=T+x7j+Lst8AQt0epLckPJv_bXtNGs3Dk=kbdbfw53Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H8ygTp4AXg6deix2"
Content-Disposition: inline
In-Reply-To: <CAAFQd5D=T+x7j+Lst8AQt0epLckPJv_bXtNGs3Dk=kbdbfw53Q@mail.gmail.com>
X-Cookie: Whip it, whip it good!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--H8ygTp4AXg6deix2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 22, 2019 at 07:33:54PM +0900, Tomasz Figa wrote:
> On Tue, Oct 22, 2019 at 6:00 PM Bartosz Golaszewski

> > > I can see that the core returns the dummy regulator if
> > > have_full_constraints() [1]. That is always true for DT systems, but
> > > for others it's false by default, unless someone explicitly calls
> > > regulator_has_full_constraints() [2].

ACPI systems are also always marked as having full constraints, only
systems with board files will see this.

> > Not tested yet, but from the code it looks like it will then keep
> > returning EPROBE_DEFER which doesn't sound right really, especially
> > since we're printing an error message too. Shouldn't it be -ENODEV?

> That's an interesting finding. Liam, Mark, what's the proper way to
> bulk get optional regulators?

The ambiguously named regulator_get_optional().  This should *only* be
used for regulators that may be physically absent in the system, other
regulators should use normal regulator_get().  It is vanishingly
unlikely that all the supplies for a device will be optional.

--H8ygTp4AXg6deix2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2u5asACgkQJNaLcl1U
h9AI3gf8COsJvW+lx7Lpb6/0susCMMK1GWIj6oVow1u666q9ibEgppq/FkU7GN39
F2GCBXXn6YIwykHAsYTA/WjJuwjzQWjYJTO84MQT5HSNq6WUsKOoIBfzHVV3o6Od
8AcmZbpv7tlMbhxZR/wdByOlH4ulTixx8G8hpzykLpcMzf05NzlWPDBuYgrDVTPH
hu2GkxZLiWrVknzE1aFOpE4X636PIPIFz/e1gAA3VNiWjts9kuC2lpL+jhDO1QOf
oVlnSn7TUvOFazxIeMSmLPsOap3dOcFcpXreyQxRD9d6tvgZ8IR/cOCP5f+468Wn
/5ZyzRHMaUjaP3TuIXnIfjmaZmBePg==
=KAhK
-----END PGP SIGNATURE-----

--H8ygTp4AXg6deix2--
