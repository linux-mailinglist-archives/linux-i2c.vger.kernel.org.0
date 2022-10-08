Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEB605F854C
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Oct 2022 15:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiJHNAI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Oct 2022 09:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbiJHNAF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Oct 2022 09:00:05 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9922240B0;
        Sat,  8 Oct 2022 05:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1665233992;
        bh=qrpcnZxITGbZei+xLfbvqkVyHPNnR/BSDOsSK0zO6P0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=CHzSv8KvtCejsdTYaURl0B4YLAH1Ns0BhuOm7XgOujVaWG64jOiKvv93dYIutuiOq
         PymjVARPeU2rG/o1+IpjsJW0Jz5RurP8SZpXYu+ELBO/g3T2b0aV6DGPB7QNionUcC
         mKBxWOJBr9TzHlsNUqKOZJrGIUSUYNkXbUX5tKxo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from probook ([78.35.76.13]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mjj8D-1pRjrg3bsR-00lB8e; Sat, 08
 Oct 2022 14:59:51 +0200
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org
Cc:     =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] i2c: npcm7xx: Annotate register field definitions with longer names
Date:   Sat,  8 Oct 2022 14:59:24 +0200
Message-Id: <20221008125924.1220203-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221008125924.1220203-1-j.neuschaefer@gmx.net>
References: <20221008125924.1220203-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BVtpz2qNRzS11sDXJa30qP9mr0ckzThAxnYrxv7n1H2dEoJLclV
 BuzJm+d0AejkXL/UEHU2yt2T/1zEjWR5U8Kw+FbEtEh2fepQg+1MRKEWuqrH5wXkfH1fgmg
 iNHi3fSrEVnv/k/l99t/fCq4bZGLEb4trtgeulf47VlRFoEX5Rf4Sfoo4uY42nxUKxTqbkm
 /YFt7f2Df1o8aRD27dmBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+vQchtdoOnM=:psMX5yb5Bp6IaRHBHmENO+
 7rN82ANHYiW7VgnJPPlXey2OrHPyAiCHeIgcnxe0NEeaq7H5iYPp+5gQcWqczx/EcTvHMlQrU
 N246N3LdBOnu4wRa5Rs07iDskEgD8hnIvff0RVZACaFHN9MT6KVdH3ymmtI5tSAk0h7rmS9Xw
 LcARCVjaUpzHxwG3QkB57+LadGNx/PMonE93JTWTgp1foFwkGbz0kKkLw9qx/tzkfpxrSdnfS
 UDrKmmbFIGoEQ4ajLlm6uNzDbL1BHBs4mLU/RpxED31epakAC/PPQJVUksz4pbef0RYW0xgOD
 TM4Do+2z6mB3SseCyxg2UJDYxUiDo4K5QAaX3uIfjwnixzfxKXUrD6Tuws5f103Y50uJ1Izia
 Myxlz7zcd8Cg1d3s0+gJtJJZ0Qpf6MdOzKHCimwe9FzUDmelA73KaQNihbf2N3PyQtjdS7FX4
 DXJ0hyT/K3H9m4qA+yoo1dwvxrvdgY4UAG6SbEoYt5ZBVXsKk383we4IJJZIwASvXlmAKC0S8
 WOsuVIt05ebz8sZ9URf2vE5NSi3bwhdCN+sk9HzDfv63BtbsBEzEXeQke4SfVKSchpSewDA3V
 yHiVz9RfQWX2uM8bLjRutRRKUKyOdlxygryf75bJ+r/fPzuyxf73ZeqQ+8HFHix+lxxyuiVtp
 eUJU5p0NDHm9vqomMtn/Kw2u7a611EBnZyKr2fZTZNwjX/yFPxCJxAT6n20ViWSP76ZGzZMQC
 wnQhOgKjXpGGutUTGuXwPtiMmT7AxIvdHwRQMnWPQhnJoyRVZ0xdyFQEW0mmCp9ZSGP/bhkLZ
 E/CFoveT5TX0eGhGC6rfsV4UvXdlsjbBNCw1fmTSBDNxDptZ2QAroDBEL9iCPe6yOcpxhocKP
 NHhb529guCKtGb0eekh3JBGcGw4RbFfGMs0uil+lDNYJkki1BAiZJG14C8Kn7315mkAdc4qSW
 P4VEpeJFHaSDieP56+1Dph8b9TNWa5ncZOJF3ca6Kr6pZPBJTDInghzr+LD/RtcwKZvwufxXX
 +JFcOn6VPhjj/FibgmTxOlGGeLZ8tcdnXeiP9AFEBrdu7D1vmG0oiCG5mZTIAU1rX4nAD5L6b
 c6XWsSTovOchwdDrUDwzDn0Mr5fkv0YvLIvjotloYW20djEdMf79VGAtzt4DzIamnP8d1Q97f
 8hUgjidch7lm8fiyl4eUnK+Ym2AglCScvMb+uSjzgePzs3pZKflJRqPiJQQ6i2CnbbXtub/cZ
 F76fs70SSCe/Y8UzZs3C1ILaellYJF8nkDQ0zqXrRJO1FsWm7a4NB2B/6cj+EDZQKIFThUrSs
 N7UcvCgKrynf4n5nIoWyhDoC/bkzKygWRjCc+AGiQW9F6n44nic8Us3QEWdIbFSujRK3jqvHR
 TASt8Lc9EaFWL1bFzekPpP2O7uBIEMXZ8AuBwpvRdwUr5W/WpnvWLhOL7wJZ63dqiJnnw/8xw
 L32qUyzPn+DM4Z38GPCuwrndqKBHHYMvXchgfOlDzNSQIDjesyygL9QuyPPiFennFSuekNJgC
 cRAWCXwLn/57RPw5gSny1gPW1m5pPxv5I/lAcc1M5rSRK
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

To make the code easier to understand, add longer names to the
definitions of register fields. These longer names are based on source
code published by DELL/AESS for WPCM450, but should apply just as well
to NPCM7xx and NPCM8xx.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/i2c/busses/i2c-npcm7xx.c | 56 ++++++++++++++++----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npc=
m7xx.c
index 9a7a2d0bf5765..bbc7359e67f74 100644
=2D-- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -146,50 +146,50 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] =3D =
{
 #endif

 /* NPCM_I2CST reg fields */
-#define NPCM_I2CST_XMIT			BIT(0)
-#define NPCM_I2CST_MASTER		BIT(1)
-#define NPCM_I2CST_NMATCH		BIT(2)
-#define NPCM_I2CST_STASTR		BIT(3)
-#define NPCM_I2CST_NEGACK		BIT(4)
-#define NPCM_I2CST_BER			BIT(5)
-#define NPCM_I2CST_SDAST		BIT(6)
-#define NPCM_I2CST_SLVSTP		BIT(7)
+#define NPCM_I2CST_XMIT			BIT(0)	/* Transmit mode */
+#define NPCM_I2CST_MASTER		BIT(1)	/* Master mode */
+#define NPCM_I2CST_NMATCH		BIT(2)	/* New match */
+#define NPCM_I2CST_STASTR		BIT(3)	/* Stall after start */
+#define NPCM_I2CST_NEGACK		BIT(4)	/* Negative ACK */
+#define NPCM_I2CST_BER			BIT(5)	/* Bus error */
+#define NPCM_I2CST_SDAST		BIT(6)	/* SDA status */
+#define NPCM_I2CST_SLVSTP		BIT(7)	/* Slave stop */

 /* NPCM_I2CCST reg fields */
-#define NPCM_I2CCST_BUSY		BIT(0)
-#define NPCM_I2CCST_BB			BIT(1)
-#define NPCM_I2CCST_MATCH		BIT(2)
-#define NPCM_I2CCST_GCMATCH		BIT(3)
-#define NPCM_I2CCST_TSDA		BIT(4)
-#define NPCM_I2CCST_TGSCL		BIT(5)
-#define NPCM_I2CCST_MATCHAF		BIT(6)
-#define NPCM_I2CCST_ARPMATCH		BIT(7)
+#define NPCM_I2CCST_BUSY		BIT(0)	/* Busy */
+#define NPCM_I2CCST_BB			BIT(1)	/* Bus busy */
+#define NPCM_I2CCST_MATCH		BIT(2)	/* Address match */
+#define NPCM_I2CCST_GCMATCH		BIT(3)	/* Global call match */
+#define NPCM_I2CCST_TSDA		BIT(4)	/* Test SDA line */
+#define NPCM_I2CCST_TGSCL		BIT(5)	/* Toggle SCL line */
+#define NPCM_I2CCST_MATCHAF		BIT(6)	/* Match address field */
+#define NPCM_I2CCST_ARPMATCH		BIT(7)	/* ARP address match */

 /* NPCM_I2CCTL1 reg fields */
-#define NPCM_I2CCTL1_START		BIT(0)
-#define NPCM_I2CCTL1_STOP		BIT(1)
-#define NPCM_I2CCTL1_INTEN		BIT(2)
+#define NPCM_I2CCTL1_START		BIT(0)	/* Generate start condition */
+#define NPCM_I2CCTL1_STOP		BIT(1)	/* Generate stop condition */
+#define NPCM_I2CCTL1_INTEN		BIT(2)	/* Interrupt enable */
 #define NPCM_I2CCTL1_EOBINTE		BIT(3)
 #define NPCM_I2CCTL1_ACK		BIT(4)
-#define NPCM_I2CCTL1_GCMEN		BIT(5)
-#define NPCM_I2CCTL1_NMINTE		BIT(6)
-#define NPCM_I2CCTL1_STASTRE		BIT(7)
+#define NPCM_I2CCTL1_GCMEN		BIT(5)	/* Global call match enable */
+#define NPCM_I2CCTL1_NMINTE		BIT(6)	/* New match interrupt enable */
+#define NPCM_I2CCTL1_STASTRE		BIT(7)	/* Stall after start enable */

 /* RW1S fields (inside a RW reg): */
 #define NPCM_I2CCTL1_RWS   \
 	(NPCM_I2CCTL1_START | NPCM_I2CCTL1_STOP | NPCM_I2CCTL1_ACK)

 /* npcm_i2caddr reg fields */
-#define NPCM_I2CADDR_A			GENMASK(6, 0)
-#define NPCM_I2CADDR_SAEN		BIT(7)
+#define NPCM_I2CADDR_A			GENMASK(6, 0)	/* Address */
+#define NPCM_I2CADDR_SAEN		BIT(7)		/* Slave address enable */

 /* NPCM_I2CCTL2 reg fields */
-#define I2CCTL2_ENABLE			BIT(0)
-#define I2CCTL2_SCLFRQ6_0		GENMASK(7, 1)
+#define I2CCTL2_ENABLE			BIT(0)		/* Module enable */
+#define I2CCTL2_SCLFRQ6_0		GENMASK(7, 1)	/* Bits 0:6 of frequency divisor=
 */

 /* NPCM_I2CCTL3 reg fields */
-#define I2CCTL3_SCLFRQ8_7		GENMASK(1, 0)
-#define I2CCTL3_ARPMEN			BIT(2)
+#define I2CCTL3_SCLFRQ8_7		GENMASK(1, 0)	/* Bits 7:8 of frequency divisor=
 */
+#define I2CCTL3_ARPMEN			BIT(2)	/* ARP match enable */
 #define I2CCTL3_IDL_START		BIT(3)
 #define I2CCTL3_400K_MODE		BIT(4)
 #define I2CCTL3_BNK_SEL			BIT(5)
=2D-
2.35.1

