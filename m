Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E119D271F08
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 11:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgIUJjI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 05:39:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:59828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726474AbgIUJjH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 05:39:07 -0400
Received: from localhost (p5486cf2a.dip0.t-ipconnect.de [84.134.207.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2C1002151B;
        Mon, 21 Sep 2020 09:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600681146;
        bh=FB9gmrtsPTmm2+oEdcUPVmACiV0h7uL+URx6rj0YMDQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cHc0Uz13XkSIy8AQVkBJwIgP1suUUXe1ytVxn32kA4FSnYQsTT6Wd6ETrayDF2SRU
         SR4bHvmrRyEeqcwU/6AilZkh3q7XHaa6EcLzGv8nSrMOZjqL0d3UFLls2S9GQBUHxj
         mhPOhzl3Txg0ze3J34vdfwUFjohjmipI0AEbOO0s=
Date:   Mon, 21 Sep 2020 11:39:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "Mukesh, Savaliya" <msavaliy@codeaurora.org>
Cc:     Barry Song <song.bao.hua@hisilicon.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] i2c: busses: replace spin_lock_irqsave by spin_lock in
 hard IRQ
Message-ID: <20200921093903.GI1840@ninjato>
References: <20200909041001.5612-1-song.bao.hua@hisilicon.com>
 <268c12c2-c72d-809c-9ecc-520ef274c1c3@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LYw3s/afESlflPpp"
Content-Disposition: inline
In-Reply-To: <268c12c2-c72d-809c-9ecc-520ef274c1c3@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LYw3s/afESlflPpp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2020 at 11:48:02PM +0530, Mukesh, Savaliya wrote:
>=20
> On 9/9/2020 9:40 AM, Barry Song wrote:
> > The code has been in a irq-disabled context since it is hard IRQ. There
> > is no necessity to do it again.
> >=20
> > Cc: Gregory CLEMENT <gregory.clement@bootlin.com>
> > Cc: "Andreas F=C3=A4rber" <afaerber@suse.de>
> > Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Cc: Akash Asthana <akashast@codeaurora.org>
> > Cc: Mukesh Savaliya <msavaliy@codeaurora.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> > ---
> Reviewed-by: Mukesh Kumar Savaliya <msavaliy@codeaurora.org>

Thanks! Did you review the whole patch or only the qcom-geni part?
(and please don't include the full message when you only reply to a part
of it).


--LYw3s/afESlflPpp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9odLMACgkQFA3kzBSg
KbYMgRAAr7VDQjXeRo9RUQBho8zeCTQYGoeDV/CgZsNbMfA1PTDQ8cCDs5zSNLV6
6BY6597BhKIXrjuiV/5ROCW+VKNbvhVl73KQfeGPlY9JSoR+al93Xijb4YneFjjK
x7GH9p/Tx9O+Y50LHQOAG5xuLLNurSjKlAXSpI4anZwt0BYP9lqoYl20sUZ10MdY
LnYT9jgJyc1ImQVoCKBwEkUzglvcHuyZUl7fsI3VFSSAZAc9mayMfrvOKgTgJD9H
jAoXhU0xIg+bBZI/kdnj0W6S+/AUU9XJJ3bHwdlGZGtpQ9G3wABIpo5GPPXDNAMU
Hc6LXEAaHLWRgkA76Btia7At3UXhIng+fb6MXXdiNq2n7Q66CLEFMUua3Wm1f+86
h13gCbSsz9Yw80JKw1QFSMBzHcXYSpp4hYXJxqtqaThgSfK5htfB93W7zSn0EP1A
8G3BYvYd3JoxQXs6GZRNlAYYvJSGlZ9a/fp9bCMHY5WorxGrOSVBqiOTPTVHeLt9
ewli/CRZhKYgXGgS/Z9gyme5sHrqWlKvtAxKa8ZeO4eMsYKGGFv2WxJAHMJRaONr
Ui/PNlY0fHvQwIap3VdBS4wSB5O9M7nv+lFxYo6lEX6hkhOXy9uh6r5sehh475Ho
vb2QhGQDxOIEa3HhmOHdQ9DYHentKi16gQRyN2coQUr9r16wWiM=
=JACI
-----END PGP SIGNATURE-----

--LYw3s/afESlflPpp--
