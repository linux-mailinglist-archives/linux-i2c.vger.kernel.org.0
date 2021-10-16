Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0B7A43024B
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Oct 2021 13:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236005AbhJPLGa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Oct 2021 07:06:30 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:34907 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244205AbhJPLGa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Oct 2021 07:06:30 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id 0686E32009DF;
        Sat, 16 Oct 2021 07:04:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 16 Oct 2021 07:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=2Qy5WepVKDYgDPKSs+FFAQm9TP
        1zfOYWpZSciejJiJg=; b=jlpFw8/W8iLLJygFqsu3WovRnG47CqYRUThE0qCQGY
        cgCfKN1bmgBWnf1HgSqdsyqRgVw1dlPOlq26ibBFj+cKtCnaKaj/gaA/XoJ2ek+c
        U1nCslOSqNUNZ03NICYzvOLa78zDYI5QBj6Rn0Zy1BCz+1HzXVswO0XMG+jIte/2
        JMtvy8cAukwL4dwDkVmCr/IOR2W8wyNRaTRuIyLG7S0CInL1ozAVmqyPE43P/eTl
        Z0fPzBcziP42OMAdyT0+wIX9dAT8qgEn74JQK4FanwFxVvCXPIrr8366kO0QTy0K
        xFlrMr4GmoyiNwQRb6Hq+rHdnX9SJNJ5uck7103vuYOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2Qy5WepVKDYgDPKSs
        +FFAQm9TP1zfOYWpZSciejJiJg=; b=j3zAA3dZ0wp6lipEDpNTDsBSOWUlboHFV
        xrmFZI+lJUaDtsXkt5C+IsI4W+aNeOlCT0VStumONAPlTEDd2fmgzRXU4nBUOY8c
        +HbuLyUiLK1nQyiSGjRAiNmayJYKXUQprEpC7sqJuJ2yi8zX8s0Cr/uBNQxCkYZk
        bdBCzIzdNciGbzLpVgSybskh90Ng8XoP1Pwj8VoCLWZ6AgJYm8XlSVMsExHu/2uO
        2Boal0qDzHyvYJ6YIR7IPiu9md3PRlBqElPoZTgdQJbnxfjhUwgCYbSnUA/84TRD
        kF75CY7jyLU91pMLRyv9ZvG5vMdYwdiyJqSnNrcatr0b//7QjQ//Q==
X-ME-Sender: <xms:tbFqYQHhRFOZZKNK2R5TefLOq-Q55-pvmwvLr8uZPdgUvhpJXZpm2g>
    <xme:tbFqYZXPXOkNuVYINXrPkgNxdkVqznLoG220PwevkS8tEi_O4fDm5-UsjoFeGoON2
    VrDFzDxxKFeJAWwEuc>
X-ME-Received: <xmr:tbFqYaKYwElJRxDveENDD05LQ0Nh44hTY6FvakoLSc8oClTESpe2PVqNi0UHGVZi1LJye47rdQpt6ThqKrZEoYJnThyaBsBdW7bapC7MoktTdO2f4cW4ZvZXRiOD0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdduiedgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcurfgv
    thgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epgeevffdthfdutdekhefhteeuueefgeeuffffkeeijeeikeduhfejgeekueevtdeunecu
    ffhomhgrihhnpehgihhthhhusgdrtghomhdpohhfthgtrdhnvghtnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvght
    vghrrdguvghv
X-ME-Proxy: <xmx:tbFqYSH1XeY2p0ISpzxIfiekz3nxLFjFasRqr0asky8T8Zt2T1NAPQ>
    <xmx:tbFqYWXJ7FTeLKotFO9d8kgFK27hUpdQrZQ_7tWnX22u3BIJttMvhw>
    <xmx:tbFqYVMaxaWNcd1kBXrITqFrOFCON0b7kqgO5KWLGevcPFYoSVf-xw>
    <xmx:tbFqYYcs9j8scEyegW0KRHeDu5X-WYUH13oRcZkpK2Fd-75rbUohKg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Oct 2021 07:04:20 -0400 (EDT)
From:   Sven Peter <sven@svenpeter.dev>
To:     Wolfram Sang <wsa@kernel.org>, Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add pasemi i2c to ARM/APPLE MACHINE
Date:   Sat, 16 Oct 2021 13:03:44 +0200
Message-Id: <20211016110344.53509-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the pasemi i2c platform and core files to the ARM/APPLE MACHINE
entry in MAINTAINERS.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
As discussed in the i2c series, here are the MAINTAINER changes.
Hector will take this commit through his tree.

 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ad62687a0b3c..ecf239ac427e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1729,10 +1729,13 @@ B:	https://github.com/AsahiLinux/linux/issues
 C:	irc://irc.oftc.net/asahi-dev
 T:	git https://github.com/AsahiLinux/linux.git
 F:	Documentation/devicetree/bindings/arm/apple.yaml
+F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
 F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	arch/arm64/boot/dts/apple/
+F:	drivers/i2c/busses/i2c-pasemi-core.c
+F:	drivers/i2c/busses/i2c-pasemi-platform.c
 F:	drivers/irqchip/irq-apple-aic.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h
-- 
2.25.1

