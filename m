Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF67B68B0
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2019 19:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfIRRJ7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Sep 2019 13:09:59 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:43762 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727243AbfIRRJ7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Sep 2019 13:09:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=H2TiSbCkuglf2I9jOUFe26893CVHAZYtLkhZApl8OdA=; b=pTEQ57emX3/HDj8yosPbbcfJy
        DvKwdE/lJDmvM8seGg04Ejj5N3atlZjzti9xhkXAQgtO2h4lRmfF6mVsFa8jIjrPnmmoyHuV/H/ub
        Nq2BpXqQxgCiT48mNofGVkHgBLExjRLSoI4+eKtYN/+sWYD8Zw64+DWjjKfPw9qCEg1xQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAdSj-0006P6-Jy; Wed, 18 Sep 2019 17:09:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id E41692742927; Wed, 18 Sep 2019 18:09:52 +0100 (BST)
Date:   Wed, 18 Sep 2019 18:09:52 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Greg KH <greg@kroah.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the driver-core tree
Message-ID: <20190918170952.GT2596@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="++alDQ2ROsODg1x+"
Content-Disposition: inline
X-Cookie: The devil finds work for idle glands.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--++alDQ2ROsODg1x+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the driver-core tree, today's linux-next build
for arm64 allmodconfig failed like this:

/home/broonie/next/next/drivers/i2c/i2c-core-acpi.c: In function 'i2c_acpi_find_adapter_by_handle':
/home/broonie/next/next/drivers/i2c/i2c-core-acpi.c:352:10: error: 'i2c_acpi_find_match_adapter' undeclared (first use in this function); did you mean 'i2c_acpi_find_bus_speed'?
          i2c_acpi_find_match_adapter);
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
          i2c_acpi_find_bus_speed
/home/broonie/next/next/drivers/i2c/i2c-core-acpi.c:352:10: note: each undeclared identifier is reported only once for each function it appears in

Caused by commit

  644bf600889554210 ("i2c: Revert incorrect conversion to use generic helper")

In yesterday's -next that function existed but it appears to have been
removed in Linus' tree as part of the merge:

  4feaab05dc1eda3 ("Merge tag 'leds-for-5.4-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds")

by the commit

  00500147cbd3fc5 ("drivers: Introduce device lookup variants by ACPI_COMPANION device")

(ie, the commit that the failing commit was trying to revert.)  I
suspect this is confusion caused by things going into Linus' tree in
different orders.  I've fixed this up by re-adding the function.

--++alDQ2ROsODg1x+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2CZN8ACgkQJNaLcl1U
h9CK5wf+LSPVgpYCM6eyOPVq2Ck7uZKNd6iI6NX4ELVYJ0TUIsXqhASEQAhKxBqx
aLnwiJOciQQT3G+N81Gv5BbAP3ip4coXMHIp+rL4HN89L6nRzh8s2sUSfxfoG62Y
VAO/TxeyqCujNstzf/TcmkL6ahDoh6nByPoD9hfXlja5feNGUhkPoARpINCRk6bC
tTtFRExjCemrIzMucLbaawpnb0RWUPUSVJaLN0YKhbHflzzrBYLTVorbfkG9hjOF
KYg35WZIJmOEqThrybghmAJ8/e2WkuFFxNpPH4XfQMXS08WJ5Nt0SWrRDdkDBrCQ
/KAGhmjhotCLL/TUTPfJ5erbmYLf3A==
=V/kw
-----END PGP SIGNATURE-----

--++alDQ2ROsODg1x+--
