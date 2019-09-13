Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB49B23F5
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2019 18:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387594AbfIMQRv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Sep 2019 12:17:51 -0400
Received: from sauhun.de ([88.99.104.3]:37026 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730605AbfIMQRv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 13 Sep 2019 12:17:51 -0400
Received: from localhost (234.77.63.94.rev.vodafone.pt [94.63.77.234])
        by pokefinder.org (Postfix) with ESMTPSA id 110E32C3115;
        Fri, 13 Sep 2019 18:17:49 +0200 (CEST)
Date:   Fri, 13 Sep 2019 17:17:48 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Rob Clark <robdclark@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>, alokc@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, vkoul@kernel.org,
        linux-i2c@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [RESEND v3 1/1] i2c: qcom-geni: Disable DMA processing on the
 Lenovo Yoga C630
Message-ID: <20190913161748.GF1022@kunai>
References: <5d71ef95.1c69fb81.6d090.085d@mx.google.com>
 <20190906061448.GJ26880@dell>
 <20190906065018.GA1019@kunai>
 <20190906075600.GL26880@dell>
 <20190906102355.GA3146@kunai>
 <20190906105445.GO26880@dell>
 <20190906183139.GB19123@kunai>
 <CAF6AEGsHOaR1dRf8xGH5sRa38=S+Y3NvNiAJ9DpMkddWoLBw8g@mail.gmail.com>
 <20190913142821.GD1022@kunai>
 <20190913161345.GB8466@tuxbook-pro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sDKAb4OeUBrWWL6P"
Content-Disposition: inline
In-Reply-To: <20190913161345.GB8466@tuxbook-pro>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sDKAb4OeUBrWWL6P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> It seems linux-next is now pulling from the soc.git, rather than
> arm-soc.git, but Arnd is still pushing patches to arm-soc.git.

Can you ask them to fix this?

> Arnd says that the patch will be in v5.4 and I merged Arnd's tree and
> gave it a spin here and this patch makes it boot. So please merge this
> patch for v5.4 as well.

No worries, this is clearly a bugfix. So it will easily go in with the
same release as the DTS file.

> Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks!


--sDKAb4OeUBrWWL6P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl17wSwACgkQFA3kzBSg
Kbal/w//aXNof3lkVpfTmIhhGgkjv8YayEMRqV7utAriywrHmijJe0W6x14U0Cnu
qVa787uJ9IWZIXiw/oEAWJCZ35wJsmieSsFbjLSv1X879bUck4Ns+A2WPQuelpXe
pc5NbHkB2wrN+oVWcTaNWozRp+RbNBjoMDX4rzE9p6crx3kIQ4notA5DyDICfzih
jG7zhNRXln3Y7RShZm4zzQk1fN3L9v/2B028aS/97EdjZspCSdWdirzGOCfSSGLx
bnYou6JkrIYW0+77NnjXo/NFvo2nG2m4X88AlzA2443YKm/qYbfyviMluTnSq/de
Mqj+G4aOC3sT7Go0wpX3EumT4NXmYKXPl2UsHKwqFZ2Bp1MQUE8RIh8KffRMXhUd
mpYn/naRlU1DdiBj0VnRPPjSeW3NPp18TqQ8Q5taM+AvCX1X0/HBzWH8Kl22kkye
ZlNq1ypePu5l9dr0SS9cBfVCYYZc6EpFeWNHvcfIY7v3F/L6ce8EOAXSaiwE5bnP
FMQPyr8hrLrAnAiVP2h9QYN61n01LwRWQOWywyo1pHd6Z56ogae7bkgT4xBi+HI2
nxP8d4OKPoHhXeHoiqA/86+j1BY8Yriqsg/lFlH3UteEFxj+8VHNi0JyzqW34EBE
6MUipiry/etmVPg0T1dACsYYNYYTLx56HcQ0rX4cPDp+c+pvMtE=
=jq+N
-----END PGP SIGNATURE-----

--sDKAb4OeUBrWWL6P--
