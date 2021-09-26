Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92BE4187FE
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Sep 2021 11:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbhIZKBc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Sep 2021 06:01:32 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:58061 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230085AbhIZKB2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Sep 2021 06:01:28 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 962BB580FCE;
        Sun, 26 Sep 2021 05:59:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 26 Sep 2021 05:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=eD+NxnkyU+/hP
        i/UKgsnf10rLOiXfMOCvTD3jf1t0H0=; b=BbJWmL9rIELiwqAwkx6ZdyYYfQ/yc
        gbZPgM6U8kt3QtDCO9OTwmAUoIwiPAk96YQ8fQ+ZIOi8uVmFs3W/D71ZZriQNx1r
        cXocC+U5BX4YoQUTLL/ctglzTQQmr5hQgKqPVdjq6lxYMBDhULMZ3x5hyCzZxJFm
        FGlE5Jovf2dqAaFpm+y6PwN7vcxIZ0MtVTVWrT3vmngvY2aYXafr7vmhD75iQ2uQ
        dg0CEpX5XWwneyPMralb7AhVnwERjkLW3JNhCfeU1WM4PFPTynYE6xdldhvp8Kuv
        CRnCNuL78vrbvUi+ESBD+FFUmjccbdF0ToCUcPiVh9pxvz9wFJ4PDa7fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=eD+NxnkyU+/hPi/UKgsnf10rLOiXfMOCvTD3jf1t0H0=; b=tlJ4Jm/6
        XztkdtKC5bTdpdVe+6urPNE09FbmC+da3/py9U7aW7aYIT5v+zwc8izm6wYIk2aJ
        YuX78NBhoTc3cKCFU6s1D13/y5O+ssgUO+fLz6UAbQDMOfXvNwULRbhTSJHME4lE
        aXzmWfsqXFJVi9721iWz2a35yQZZap53anvFUhfuA+5o2p0vEvkZMtBZ2Ge7yqu3
        OgHLjldgUiyL6qFLeAdpkTIeRD7zZEp5N5B+WQ0MJFCyzAIddf9rpqPERHQ/iIXv
        Bu7tb5Ecf3+blBfhoYy8y6cDJRq33Xk9SofZbOlSo4FyNI7CeB8lmOxRU3NhFOnQ
        QMQkCiMKIY1Tog==
X-ME-Sender: <xms:mERQYRwWrwEJGOkbaWyT7cEV1oQlGD97QfB1M0U2E6HVJVm4KuoIxA>
    <xme:mERQYRSuL_c5Po3r29uAnBZO8vndx2go1PvNv2sAjX58GBUjPbAXPrhEEs-pYCggg
    Z614hqGSmlOuAcMoOM>
X-ME-Received: <xmr:mERQYbVug99n-5x8w10C55Lu0t0XSGv4CIoM2zd4XtvuamXhH7mmjNMqF7PYnXE9R_km3WUIe5POQPpnyVE5OsoZssjJeblJ-vbcSe4QSLiDGnlaypx-d_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejiedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcu
    rfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvg
    hrnheptedvkeetleeuffffhfekteetffeggffgveehieelueefvddtueffveevlefhfeej
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepshhvvg
    hnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:mERQYTgtLIrWcCNTABwrKXXbmTDP46CpPRoartB8DARknw9HnEmJXA>
    <xmx:mERQYTBVUwHn54k2KUZYMpRITvZQgUIIejQb2ZaLcVoh1vzrplVWgA>
    <xmx:mERQYcIBKxhh-tExdra-RkjP-lQX_IhpclYB0QkF_X3K5z7dhKWjnw>
    <xmx:mERQYTym48A0z-_1z7XG8weB9IhjOmjdVZqQZk21rtgfjTxIKmfOiA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Sep 2021 05:59:50 -0400 (EDT)
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
Subject: [PATCH 06/10] i2c: pasemi: Move common reset code to own function
Date:   Sun, 26 Sep 2021 11:58:43 +0200
Message-Id: <20210926095847.38261-7-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210926095847.38261-1-sven@svenpeter.dev>
References: <20210926095847.38261-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Split out common reset call to its own function so that we
can later add support for selecting the clock frequency
and an additional enable bit found in newer revisions.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 3eda5e375fa2..7c6715f5dbb8 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -61,6 +61,12 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 #define TXFIFO_WR(smbus, reg)	reg_write((smbus), REG_MTXFIFO, (reg))
 #define RXFIFO_RD(smbus)	reg_read((smbus), REG_MRXFIFO)
 
+static void pasemi_reset(struct pasemi_smbus *smbus)
+{
+	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
+		  (CLK_100K_DIV & CTL_CLK_M)));
+}
+
 static void pasemi_smb_clear(struct pasemi_smbus *smbus)
 {
 	unsigned int status;
@@ -135,8 +141,7 @@ static int pasemi_i2c_xfer_msg(struct i2c_adapter *adapter,
 	return 0;
 
  reset_out:
-	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
-		  (CLK_100K_DIV & CTL_CLK_M)));
+	pasemi_reset(smbus);
 	return err;
 }
 
@@ -302,8 +307,7 @@ static int pasemi_smb_xfer(struct i2c_adapter *adapter,
 	return 0;
 
  reset_out:
-	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
-		  (CLK_100K_DIV & CTL_CLK_M)));
+	pasemi_reset(smbus);
 	return err;
 }
 
@@ -335,8 +339,7 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 	/* set up the sysfs linkage to our parent device */
 	smbus->adapter.dev.parent = smbus->dev;
 
-	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
-		  (CLK_100K_DIV & CTL_CLK_M)));
+	pasemi_reset(smbus);
 
 	error = i2c_add_adapter(&smbus->adapter);
 	if (error)
-- 
2.25.1

