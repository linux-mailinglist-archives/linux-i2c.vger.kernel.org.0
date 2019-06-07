Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C83C38A25
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 14:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbfFGMZS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 08:25:18 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:42220 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727693AbfFGMZS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 08:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3nVP9gDt3txHjX/lfTqySJ7jSSOdn9odNMlx6IhTVmc=; b=JuDfiZ2OfBP8f3n7ucWRTln2A
        CThNBOTxMcmvdExyUMl0txARRA7/4iyy3UhKCBqEE7AoIzbJajFb53FBkUDGQsY1tLGUdRP0ifdkS
        NjjqHr3VN5lP6bjJDUvMPCRrcrXWbPcuBksDVnVLe+t0iNovbaQ+K9WO+q/76x+qLBK1U=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hZDvi-0002A1-Iw; Fri, 07 Jun 2019 12:25:10 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 099CB440046; Fri,  7 Jun 2019 13:25:09 +0100 (BST)
Date:   Fri, 7 Jun 2019 13:25:08 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Vitor Soares <Vitor.Soares@synopsys.com>
Cc:     linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, rafael@kernel.org,
        bbrezillon@kernel.org, Joao.Pinto@synopsys.com,
        lorenzo.bianconi83@gmail.com
Subject: Re: [PATCH v2 1/3] regmap: add i3c bus support
Message-ID: <20190607122508.GG2456@sirena.org.uk>
References: <cover.1559831663.git.vitor.soares@synopsys.com>
 <ff5e96bdd6b2789122afe1980bb20cfa22900760.1559831663.git.vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V+NFTlk1jviwRvZ9"
Content-Disposition: inline
In-Reply-To: <ff5e96bdd6b2789122afe1980bb20cfa22900760.1559831663.git.vitor.soares@synopsys.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--V+NFTlk1jviwRvZ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 06, 2019 at 05:12:02PM +0200, Vitor Soares wrote:
> Add basic support for i3c bus.
> This is a simple implementation that only give support
> for SDR Read and Write commands.

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-i3c

for you to fetch changes up to 6445500b43129baac36c56d629cf1dd9e1104167:

  regmap: add i3c bus support (2019-06-07 13:09:55 +0100)

----------------------------------------------------------------
regmap: Add I3C bus support

----------------------------------------------------------------
Vitor Soares (1):
      regmap: add i3c bus support

 drivers/base/regmap/Kconfig      |  6 +++-
 drivers/base/regmap/Makefile     |  1 +
 drivers/base/regmap/regmap-i3c.c | 60 ++++++++++++++++++++++++++++++++++++++++
 include/linux/regmap.h           | 20 ++++++++++++++
 4 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 drivers/base/regmap/regmap-i3c.c

--V+NFTlk1jviwRvZ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz6V58ACgkQJNaLcl1U
h9Bgrwf/RXFqk+t+LK0ZAHmeClzyFdvIjZIVL4GILktZ8eCNYn2qztVNFZFCen7N
w6a1vXa3vIwsMEKzreQRjalsBa/8GwnKtnXfJNKME9CVnuK9W9QYxSEocYRvllWk
ZqNj1fYGVsaGDxQ8KQAWZIP3bCF5z/aEZF3F2P+F29OuFVXuyER25r6IojVWO6mx
6ZQySCocUFPeEWj0iin552BqmHTsOjfzUaBz9SIJAjfkxRY8vsROqKcSAfO4dqDV
ZDLAqtE+b8mTsHPDjaEpJXN+rWZtwEahCgAUEBHLgYbAFPhnxwou+LhDv5zMZAYN
iCswU76fTiqPiH3IkR1gE2AN+IExXA==
=gpGF
-----END PGP SIGNATURE-----

--V+NFTlk1jviwRvZ9--
