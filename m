Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEFBF24071B
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Aug 2020 16:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgHJOBk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Aug 2020 10:01:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:56030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbgHJOBi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Aug 2020 10:01:38 -0400
Received: from localhost (p54b3345b.dip0.t-ipconnect.de [84.179.52.91])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 794D720729;
        Mon, 10 Aug 2020 14:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597068098;
        bh=ozzlIOEoLX+gjwBMiSFazOCYHVq62zd4+ksVu4HA5Zo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cl9A375sVSL97XtiyCHrZc43oV5aQlLdIle/TQUJocpV4+rLildqkG5f1HyUbqQCJ
         wrf8BCqkI9igEjwfg/Jeem/nudegoAaXeoNqX3zbnx34npyAYUBJCPJwqzsW2IUXAP
         kjt62544nlhnHC/NGLJiOpSU2Xfn1SfWuR0rlQiU=
Date:   Mon, 10 Aug 2020 16:01:35 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
        Tomoya MORINAGA <tomoya.rohm@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 1/2] i2c: eg20t: Drop PCI wakeup calls from
 .suspend/.resume
Message-ID: <20200810140135.GA3923@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
        Tomoya MORINAGA <tomoya.rohm@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200805165611.GA516242@bjorn-Precision-5520>
 <20200805193616.384313-1-vaibhavgupta40@gmail.com>
 <20200805193616.384313-2-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <20200805193616.384313-2-vaibhavgupta40@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 01:06:15AM +0530, Vaibhav Gupta wrote:
> The driver calls pci_enable_wake(...., false) in pch_i2c_suspend() as well
> as pch_i2c_resume(). Either it should enable-wake the device in .suspend()
> or should not invoke pci_enable_wake() at all.
>=20
> Concluding that this driver doesn't support enable-wake and PCI core calls
> pci_enable_wake(pci_dev, PCI_D0, false) during resume, drop it from
> .suspend() and .resume().
>=20
> Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Applied to for-next, thanks!


--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8xUzUACgkQFA3kzBSg
KbbVVw/5Afnt1eYRB6Rom/xFdNwBnxwUyukASNVrJsWtIYfCqUGG1LonmrRXMsE+
LA9mmsPHiFhrFnQXeJE9PD2YushTsR97U50NBuMRvz3OuyoLTZErdyZZH7+yMoKF
HsJ7n+ZtrQ/x3Ca2c0ePRd/8qOy6/4zCa7zvpsG8IKoHo6w4iJ3U8PrkYI+40SGp
N8MC0Ja3fc4AUL+YJoFuNVfs3pWmMSm7BUc8W7L457tSHw9pkSFuMauvYy2hMGez
o1bXhYpT0DSK3EKYaviPvCl2csCx2j+kUrU0kXh6XuXHmom1ScMzWMiVFPq5yNmr
6GusaohaNgI2sZyKW9BK5YW1pf6On2RnDsonj6rnAigaY+E6gPFVe/eDfurmBNyF
t7bU7rCIazTNU3B0R8cLmS9mYm1TfSiy930+lounooNu2N/xLKYKpbKtnIxM+0/4
Jxa9vZqYMuglRCi72KnNBW5tnLFaHrAsQQ2ZAhtJIopkPt6SJRmfmTkJAsuokYIp
mT1rgGGMBWbtMCsKuqo/cK3rsfcbG9t4U0DYbe4lt//q+s1L137Qp3ogJonH3/kp
Jf244WG3ITpgKC1EHNyleH9AYZsmzX2s+CHJIOrjunhXxQi49JRhAp2jwQiaHRCX
tOAWUIAIPdQL2ffk2C6hQxDsbVBUcOHb3X29uUVNbHY034IpV/c=
=uBOB
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
