Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8FDB426F13
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Oct 2021 18:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbhJHQiU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Oct 2021 12:38:20 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:38295 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229673AbhJHQiK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Oct 2021 12:38:10 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id AB54B580FD5;
        Fri,  8 Oct 2021 12:36:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 08 Oct 2021 12:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=cHX2rY9rskeE1+fRnngpouQp+f
        owWM3d9LCqW9L1Z+0=; b=TqkAafPNpdb94tkYSGI5CqyYCj7IfvR/jOKRt7WVvv
        1YidtBYXtoK9qwTjJfxhR1tIS2LS/UkEQvs0D/+Im47XmW4ojwJOPQLp2UYmEn9O
        HjeVfl0lsa/kznsJKi/uTZGZh+97pwXZVEoIIeiGZyMFzEMuEQKkPVXhl0U96GQD
        B0wcKHB4kbCYitFbQO4dwYSZEi2dMPTIZz4ZQpY2aZhlZJjWxoVxOibZ/gMPHg29
        AxrWvbvVsCh90YlY3U07DiE0D91Ql1174hgFU2VbJYuoQjjlrUBrV+iF8XvTJdas
        h43MIAP7NOHmQyn74UUPAnc+2VkJRfwVOAYbaUa+QZ0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cHX2rY9rskeE1+fRn
        ngpouQp+fowWM3d9LCqW9L1Z+0=; b=Vu6xa+sbSYGmBVWHV6njmWP5ItJrJuLsa
        lkZCT6DVC/STDr/vRMwYcl/uVkoREkZAWt2bJ6E98drt/GHnJDLdeRhWS6N7W1zR
        n2pu6hBl5J3P0DQxLBVA6S2DWGCqva0vKa1kqp0fWIRZGa5922O0aYdE+6WVRUt1
        a2eP5dvma2I6mnlxKmbhZPkhIoyawxCG3bM6lzBbZYBYcMSX0W1Ld4dgPp71INJt
        I0NH3xQytIf+jFpxnTVjxpXUkI9vp+tnJadw8jZn/w1KT1PmQlyXUHYnGLSSqAXH
        oFUxypulkbpx6V2Jvrns9K6GPIF0OAuWnx9C1IJzzzmarMtn/2gzA==
X-ME-Sender: <xms:fHNgYRGhSbb2_A03eRnhnmJ4hYC3aqcXn4fDPCYJ49XNYEdrGyweJg>
    <xme:fHNgYWX2sEUGK8ofeM9D9quwu8eZxOYZh5VasJpShBwI7WRbzBCJvQSNG0tmBxmKb
    tVIUYw648rhAnjBjiA>
X-ME-Received: <xmr:fHNgYTL_M1zCLtPdkjqVs1l5M5bpiy7sOyb5legnwXp5I4_nwWFoPfkp2v0UqVTy7P5Im-SBgRBH824Au12DG3avEv6aAwkw9BdL1_ZsDZuXYUqvxzbGaQs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcurfgv
    thgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epfeehudeftddvhfehvdduhedtjeejheeuudfftdfgvdekvdelleeuveelgfeflefgnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:fHNgYXEAZtwSPee01aEdBUgDIppK-UvoTXCATjnTVw_GDfpBsg2aPg>
    <xmx:fHNgYXV6Qx6reGY3CCQohojgUPf-Y-f0Nohe20_WS7Zg9heHVm3ZCA>
    <xmx:fHNgYSPegl3F_vB5tfZBjtGzueleqniMgprxVCIsRtcXvBWRuC1mAg>
    <xmx:fXNgYQUrEUkBPZ4ZgygCfMavyjnSHXh3Pwdjenz_Vn-YHf6kDKd8ZQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 12:36:09 -0400 (EDT)
From:   Sven Peter <sven@svenpeter.dev>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/11] Add Apple M1 support to PASemi i2c driver
Date:   Fri,  8 Oct 2021 18:35:21 +0200
Message-Id: <20211008163532.75569-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

v1: https://lore.kernel.org/linux-i2c/20210926095847.38261-1-sven@svenpeter.dev/

Changes for v2:
 - Added reviewed-by/acks
 - Switched from ioport_map to pci_iomap as suggested by Arnd Bergmann
 - Renamed i2c-pasemi-apple.c to i2c-pasemi-platform.c as suggested by
   Wolfram Sang
 - Replaced the ioport number in the adapter name with dev_name to be
   able to identify separate busses in e.g. i2cdetect.

I still don't have access to any old PASemi hardware but the changes from
v1 are pretty small and I expect them to still work. Would still be nice
if someone with access to such hardware could give this a quick test.


And for those who didn't see v1 the (almost) unchanged original cover letter:

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


Best,

Sven

Sven Peter (11):
  dt-bindings: i2c: Add Apple I2C controller bindings
  i2c: pasemi: Use io{read,write}32
  i2c: pasemi: Use dev_name instead of port number
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
 .../{i2c-pasemi.c => i2c-pasemi-core.c}       | 114 +++++-----------
 drivers/i2c/busses/i2c-pasemi-core.h          |  21 +++
 drivers/i2c/busses/i2c-pasemi-pci.c           |  85 ++++++++++++
 drivers/i2c/busses/i2c-pasemi-platform.c      | 122 ++++++++++++++++++
 8 files changed, 334 insertions(+), 85 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 rename drivers/i2c/busses/{i2c-pasemi.c => i2c-pasemi-core.c} (77%)
 create mode 100644 drivers/i2c/busses/i2c-pasemi-core.h
 create mode 100644 drivers/i2c/busses/i2c-pasemi-pci.c
 create mode 100644 drivers/i2c/busses/i2c-pasemi-platform.c

-- 
2.25.1

