Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE501F96F3
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 14:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbgFOMqg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 08:46:36 -0400
Received: from sauhun.de ([88.99.104.3]:37664 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728285AbgFOMqg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 08:46:36 -0400
Received: from localhost (p54b333b6.dip0.t-ipconnect.de [84.179.51.182])
        by pokefinder.org (Postfix) with ESMTPSA id 787C62C204E;
        Mon, 15 Jun 2020 14:46:32 +0200 (CEST)
Date:   Mon, 15 Jun 2020 14:46:28 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "qiangming.xia" <qiangming.xia@mediatek.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH] i2c: mediatek: Add i2c support for continuous mode
Message-ID: <20200615124628.GA4423@kunai>
References: <20200508071809.10187-1-qiangming.xia@mediatek.com>
 <1592217629.22302.4.camel@mbjsdccf07>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <1592217629.22302.4.camel@mbjsdccf07>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 15, 2020 at 06:40:29PM +0800, qiangming.xia wrote:
> Hi, Wolfram
> 	Do you have time to take a look at this? Thanks.

Please resend and CC Qii Wang who is now the maintainer of this driver.


--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7nbaAACgkQFA3kzBSg
KbYpPA/+Pw8TxeQKArxUAcaWTX/EPixqO5I46dmHVtb8dLEURvVjQSN7sZ2WuELD
8LoBIuzYwvGXEFQvZzIgVy4iPB+91icdaz9TpugxSPQD9EOLfIabqUxJXKZz8H+D
y/gw0Zng3NVWO0L0b4qscEBaeEa+uoTtSh5xuxZ2rTqYErBTUnrPbvioaFrUV7/2
uCynxVcXd5u7VRyFGZAkzNyOn/kaWOBY5IRU1dxTIUajrvHH2B4qOPzTpEvjatnG
8968n1FRfIXucBtn1nK3uhbiCA1DAjNb1bvuhDm2gy7sBkDWk0Viz0+1REn5KaCJ
xvoW1UQONvRvR3AYGM2ws9ywhcKlfU/mdFlXbDPDYl2rqgQ11vTE+zIAGztFtw5l
kOPbDyV+svGqYPaRwzu7pPNQ6q/XZkFMdYhc8kW7Pwk/gcfxbE9af2fvSPik0RcO
75++PPLviGvmyO8H+rgeZiGbILKBwMjgdLZL2rbGZ+X24oyP7MskhikWbgoe+KiO
BznRPjs6ZU6Kx7WJp/V/IakiW2YxzRhZD282VHmlTiLGFGLTgTPz67t9SX7iVkSk
iysMA5DaY4t86G0IJVnAqzLCNiWTb+7iSbfywEF4PtebRvsvg1KkrkLNDSuyJ5sM
0PLQWDl+ORX3Fk7+3CZ917VMR7jbe2XdJ7Ja9rQ0uhhr6npJkuw=
=AqiD
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
