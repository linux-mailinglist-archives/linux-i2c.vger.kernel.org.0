Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2936427D71B
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Sep 2020 21:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbgI2TmP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 15:42:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:40362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727740AbgI2TmP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Sep 2020 15:42:15 -0400
Received: from localhost (p54b3311a.dip0.t-ipconnect.de [84.179.49.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F254420774;
        Tue, 29 Sep 2020 19:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601408534;
        bh=JIZhwPve3Mi1IGC1oczxYPHxPllsJSq8vchO7C2xFDE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Op/Fa70DBWQ33OIwm5D/RA9825RjbqiyqvUfTFfpQkbvF4rmv4tb/y+fCwVDkYBbP
         eVhzcnKl/g3YgZ6HhAAGcIMd/H+Ofr5XGba6mRQFl+wsxUPvXWOlzlbvDPU9ed/hhN
         6MwqkW8eGCRmVC/d4NwF03U0JhvYCIF2dOUu43AA=
Date:   Tue, 29 Sep 2020 21:42:11 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Barry Song <song.bao.hua@hisilicon.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxarm@huawei.com, Gregory CLEMENT <gregory.clement@bootlin.com>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] i2c: busses: replace spin_lock_irqsave by spin_lock in
 hard IRQ
Message-ID: <20200929194211.GD2010@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Barry Song <song.bao.hua@hisilicon.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20200909041001.5612-1-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Content-Disposition: inline
In-Reply-To: <20200909041001.5612-1-song.bao.hua@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 04:10:01PM +1200, Barry Song wrote:
> The code has been in a irq-disabled context since it is hard IRQ. There
> is no necessity to do it again.
>=20
> Cc: Gregory CLEMENT <gregory.clement@bootlin.com>
> Cc: "Andreas F=C3=A4rber" <afaerber@suse.de>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Akash Asthana <akashast@codeaurora.org>
> Cc: Mukesh Savaliya <msavaliy@codeaurora.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>

Applied to for-next, thanks!


--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9zjhMACgkQFA3kzBSg
KbbrIQ/9GNfwgXDfzhJXoRxRQ+qol/m15D4ZUHfjG7HayRBsGrYEoTT+feO67CG3
vcoEWYLDDAewu7Q2QhP2IUNulMJvDVuEutLN+RmzIsQLHIKmOB+sFiHdfQvoAe1t
KQVu4mp8+yEkDsjzLrDRJCf2NglBmmCVEPq2L86mrxe87mJpBIr/E9nm4c9FUTyA
ZRDDNTsMkyAxnXjOBGz3hMsmyDKnwhA8BBFFLu5WZaGeNvrAk+waUKLRY87ZUA15
ZtBMyldh4zWMXCvFFMf1WtXwKXhVdMDXX4crwGDSeMyZg2ccE9eo9spZdICpso3X
kkZVW5vHzBa9VFJyfKbZbHwi9gtDt7c3cB1aQn/B67fXsTLhbW5E6c/5AMqA68oS
QO4874An6wTjYEddKCrsLlCN9eh6W4RJXhSEJ8lg4clHUk66xq5rPwhyYTBjTIFO
2Xr1ywsNH7YEPA2vQVWXHZUH2ycZy448AQM7LaTL8ffcXF0R9Qtg4uI9JLvTRnSU
DzovnUnuaPNlVGUDDSyQcMaMijUnEPvip4tT36fuYz3L7Haydm8onmBWand9ywsO
Xmv0PGI2RjkG7Lx2jSJl+fhckz73+7oPr4yf8uzZi3Q1u+8l3047OL6cNILYDZDj
K6jlmKVB0vSQOV3qxA2VmShIJGJLw8WNUzkUqLq0dfTN6oNe8nM=
=mYcU
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--
