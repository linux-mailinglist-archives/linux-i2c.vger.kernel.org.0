Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5F34187F2
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Sep 2021 11:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhIZKBP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Sep 2021 06:01:15 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:59893 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229755AbhIZKBP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Sep 2021 06:01:15 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9036A580FBA;
        Sun, 26 Sep 2021 05:59:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 26 Sep 2021 05:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=mlHm6qJaY97xGTZYEJ3J85Alc/
        WY1AV0Z5CGewPFjJw=; b=UhHGVNovPleofpk5mVBeMMls1i4coOXmt80/bw0HyF
        HjTu8qNJvqq54MN3sIsFDgJESrj0RNMZQVjzoyzhPwXCLgqc0z0JmbbLEf6pOre9
        c+CcG+SVsywGs5PAldJ2a19z4ybEbY9jo7cJ7LmvMxxNT5vvrukSFYw4cwEMS01R
        ujwGvMLLRCnSKa/DRCd2Mud3MJCQjQEHYpbTww5DLoJydbzYNGM2Uat+qlrN4Vvc
        HTAZVNJR+hLdwKt3idxcKDhuexrgtTNidldPmydKEvSsdif0gGL/ryQY2S8iPOHa
        1tUSNKw5fCCbzKo/NMvy6jcyHy/OuadCOfIaoil20A9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=mlHm6qJaY97xGTZYE
        J3J85Alc/WY1AV0Z5CGewPFjJw=; b=C+k4X3XQGbpbimAylv7MAWKQt8i7EYeJd
        KdPdfizHnI9ca95NaiC5zhGAh+s06MsAY/W7fz6IAOQZHhxdFjoeiIYMbtN7iZF1
        Ovo0e/8qWR3+72b7d1rRJ7mgkmj1eCNdR3cVm9BybT1zlt67tDINx4ykXpKmY8yM
        JVNF/Ye9/8XQ6iUxeOD5WoFtECxUhs5IEUAkEgMSOsuUwhTZiQbBmoNsYxHjqqs3
        ltzsJUwRyQ+zA7eRECsryljZeAfH58l2UkGQINKWiu3PdayRIOMr8w9DfCIikwli
        S+PpgH20QrEse5AvL8boFEyi9QWK7dHGT2JmgoD3NpuvxxhPhn0Wg==
X-ME-Sender: <xms:h0RQYRXZiAuQLxu98WuzRA1GKAKo7lZ5TgkHGPzE6jQ_RBzvwyZAjA>
    <xme:h0RQYRlon3kvGEoGf8ssQ7Zr1ey56tbFFgnGdcDxRNPSumxF69qUnFWqK00ncitYi
    LsShmwu_tbpWd_H-tI>
X-ME-Received: <xmr:h0RQYdYg0pyTyOsKq3dK4O0NYOPQTSq6_Ax9sMCZBEqLU6pz76G356hdZh7X5njEYyAw7XtCz49jYFnf-OFZGmxeRE6KUfM9VMGsMswQIJix3SDJH7PH8fs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejiedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcurfgv
    thgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epuefgleekvddtjefffeejheevleefveekgfduudfhgefhfeegtdehveejfefffffgnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghnse
    hsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:h0RQYUWrI63n8st0IdGclKMwCsJ2qe7WGMSWb8aBL4Oq9tGwek7vmg>
    <xmx:h0RQYbmu77l-RqrKLv9zxNFr5a5FHhgHbDfRXpOzobmf3klJAaIMOw>
    <xmx:h0RQYRc3eoOzr42riAK7LCsVqofgE7BFY_vL0oBPd6mcaWQdO45vFw>
    <xmx:ikRQYVkJatlsCRiix6nVZAl1km8f-nsgg35hdbY_krP7h4iwIZmTeg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Sep 2021 05:59:33 -0400 (EDT)
From:   Sven Peter <sven@svenpeter.dev>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>
Cc:     Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] Add Apple M1 support to PASemi i2c driver
Date:   Sun, 26 Sep 2021 11:58:37 +0200
Message-Id: <20210926095847.38261-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

This series adds support for the I2C controller found on Apple Silicon Macs
which has quite a bit of history:

Apple bought P.A. Semi in 2008 and it looks like a part of its legacy continues
to live on in the M1. This controller has actually been used since at least the
iPhone 4S and hasn't changed much since then.
Essentially, there are only a few differences that matter:

	- The controller no longer is a PCI device
	- Starting at some iPhone an additional bit in one register
          must be set in order to start transmissions.
	- The reference clock and hence the clock dividers are different

In order to add support for a platform device I first replaced PCI-specific
bits and split out the PCI driver to its own file. Then I added support
to make the clock divider configurable and converted the driver to use
managed device resources to make it a bit simpler.

The Apple and PASemi driver will never be compiled in the same kernel
since the Apple one will run on arm64 while the original PASemi driver
will only be useful on powerpc.
I've thus followed the octeon (mips)/thunderx(arm64) approach to do the
split: I created a -core.c file which contains the shared logic and just
compile that one for both the PASemi and the new Apple driver.

Now unfortunately I don't have access to any old PASemi hardware and
cannot confirm that my changes haven't broken anything for those.
I believe Hector was in contact with Olof a few months ago who
said that he might still have an old machine on which he could
test this.
I'd very much appreciate if he (or anyone else for that matter :-)) 
could give this series a quick test on the old PASemi machines.


Best,

Sven

Sven Peter (10):
  dt-bindings: i2c: Add Apple I2C controller bindings
  i2c: pasemi: Use io{read,write}32
  i2c: pasemi: Remove usage of pci_dev
  i2c: pasemi: Split off common probing code
  i2c: pasemi: Split pci driver to its own file
  i2c: pasemi: Move common reset code to own function
  i2c: pasemi: Allow to configure bus frequency
  i2c: pasemi: Refactor _probe to use devm_*
  i2c: pasemi: Add Apple platform driver
  i2c: pasemi: Set enable bit for Apple variant

 .../devicetree/bindings/i2c/apple,i2c.yaml    |  61 +++++++++
 MAINTAINERS                                   |   2 +
 drivers/i2c/busses/Kconfig                    |  11 ++
 drivers/i2c/busses/Makefile                   |   3 +
 drivers/i2c/busses/i2c-pasemi-apple.c         | 122 ++++++++++++++++++
 .../{i2c-pasemi.c => i2c-pasemi-core.c}       | 114 +++++-----------
 drivers/i2c/busses/i2c-pasemi-core.h          |  21 +++
 drivers/i2c/busses/i2c-pasemi-pci.c           |  85 ++++++++++++
 8 files changed, 334 insertions(+), 85 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-pasemi-apple.c
 rename drivers/i2c/busses/{i2c-pasemi.c => i2c-pasemi-core.c} (77%)
 create mode 100644 drivers/i2c/busses/i2c-pasemi-core.h
 create mode 100644 drivers/i2c/busses/i2c-pasemi-pci.c

-- 
2.25.1

