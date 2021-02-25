Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73AFB32534D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Feb 2021 17:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbhBYQNq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Feb 2021 11:13:46 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:39751 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233337AbhBYQMQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Feb 2021 11:12:16 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 641EA393;
        Thu, 25 Feb 2021 11:11:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 25 Feb 2021 11:11:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=zCyulOslmsnRM2+FXI1RljXS1g
        nSnXPzjh3ubaYGKh4=; b=PJzmMFnqwiyFBpw1uRfnOXIR2+Gr4stxLgxgneG6DS
        97gxyM3QtUVmowFvL9Ip0qVj30Ij+2nSLhX2T7s4FEYz2dcAEKZpBdFmbplOTok2
        6MQxaM7RHo2ga5n6vPfW9o70KrDxk1lO4HdjStmgqVpt/Ed5c+c0byeaFRq0vUQK
        YBTN1YFkFN1Qejz+pkGaGemTHnDs4M9fRWR5ADk70tjj10+reTB37EC6l8oxRRjV
        4XCimgJqmVAASnGXsCJWWWuGImq2pUNju6hm2B4Fk4bvkhjgCOqJdtySoVoK9i6Q
        UiAHqoyKJKFTeOEN9/4nhF8+3JexauvI2VMNf32Zb05g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zCyulOslmsnRM2+FX
        I1RljXS1gnSnXPzjh3ubaYGKh4=; b=MNyOU9xAI1tMmQOiwHq3uzLCqRygbZmEJ
        8e8hguS410X6nfBWB0ALVuMkDEhyG4+6S/yxzAiN6Z/c1mk1S+j6HWSNFxPbpjkL
        KQ3jmATEP0EWM/XQV/IkB1uiSQ3F6Q2NATV0K3HOlSJlfzRZjKON18+YOqbIKmns
        7KBBFN9aRF1pZ5y5lptGl6LnJcsgbsj9gPAk4N7FMSGD2CeEMynZPpp2cwQDUF36
        mWd0qIQFN/YKtW2j1EHZXPtNRHoRU8jvmAZDOASY25Zr1OYTrLsfaacQpB12rmOk
        Qj58hZQ+oEQh8MLrI+FiEmx1UmyGL53JPKPorMmy06veWqJeZGbaQ==
X-ME-Sender: <xms:F8w3YAW5POm6ogWrCvUR93IWMKy7kB1dPjWeXGvwjxwfVqaPnLmy8A>
    <xme:F8w3YOP3RZ-WJawBb16a48y34viA-g3asYiAn2pCWSRk5H-bc3jeYkXHj2hsJeI_J
    goqzG3J8CnDptUBlqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
    ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
    hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
    ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:F8w3YEZ1lr7LJ4qA6hnn4ADxtSm22-4kTO8bQMd3FTUayo16I6xnWA>
    <xmx:F8w3YCrbclhSD8pvDTqrHxjtsBhIIKPhxo9psLKCaLFwdOq9Hwkz2w>
    <xmx:F8w3YIaQUTlWXge3sORJA-iqvTezW2RftIbYxPGH5AfUgD8bKWRTlQ>
    <xmx:Gcw3YKQlD0N-4umilnHASUEKeHZpfzbzZX2Poddk5C0acURQVZZcHg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id B88111080064;
        Thu, 25 Feb 2021 11:11:03 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH] i2c: brcmstb: Fix brcmstd_send_i2c_cmd condition
Date:   Thu, 25 Feb 2021 17:11:01 +0100
Message-Id: <20210225161101.1856192-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The brcmstb_send_i2c_cmd currently has a condition that is (CMD_RD ||
CMD_WR) which always evaluates to true, while the obvious fix is to test
whether the cmd variable passed as parameter holds one of these two
values.

Reported-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/i2c/busses/i2c-brcmstb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index d4e0a0f6732a..ba766d24219e 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -316,7 +316,7 @@ static int brcmstb_send_i2c_cmd(struct brcmstb_i2c_dev *dev,
 		goto cmd_out;
 	}
 
-	if ((CMD_RD || CMD_WR) &&
+	if ((cmd == CMD_RD || cmd == CMD_WR) &&
 	    bsc_readl(dev, iic_enable) & BSC_IIC_EN_NOACK_MASK) {
 		rc = -EREMOTEIO;
 		dev_dbg(dev->device, "controller received NOACK intr for %s\n",
-- 
2.29.2

