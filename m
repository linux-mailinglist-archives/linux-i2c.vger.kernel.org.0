Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 851255F854A
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Oct 2022 15:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbiJHNAC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Oct 2022 09:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiJHNAB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Oct 2022 09:00:01 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5368620193;
        Sat,  8 Oct 2022 05:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1665233991;
        bh=wzkOTYnJQKJYkJPxnzoMHSSdhcxZrVekKaBn/Bl517U=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=jfO4Bz9BadsN2h/gVBAIYdevJ6yX7eIooph61TA5UAEvfaNlMiGmB4NIYcL16Yemk
         x1Jn03lTvopT1nCsUJlxMhRAA/wdmVORhAwJ7DmBEfC19CwnEjV8oOpXQbMW5VBLzW
         r98QGcOEFgzDNy6TD7st3ZEbag6WZx91yiILfV3I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from probook ([78.35.76.13]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MoO6M-1pVqL10f8a-00ojil; Sat, 08
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
Subject: [PATCH 1/2] i2c: npcm7xx: Group bank 0/1 registers together for readability
Date:   Sat,  8 Oct 2022 14:59:23 +0200
Message-Id: <20221008125924.1220203-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vLFtaXSUpnsPqk8nKHwmrlqL/rgkq/uCsXKdEwerEcLTrnaAezt
 QaPocI9atXsckbUe1sgysEnMY0VSdrGd+NeMe0OSOZ0x0lZi9BMLozPbX0uQXwLohCg4+7O
 sh2oY6fXBamsjeGn2VUX9pODlG0oKE/9MbiuKeCjTh3oYMcwupZ9rQcNrVZjtRIlaxizon/
 5Lp5h1HIJ5Ron8U6Av+YA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qpyn37DlYkk=:7mKvHz2SWowFMhZgWrWs1o
 wthtQf/+ql3h9F+stipNW6AXa07KjIpomD3pEu6KpPXTPacmwB6A01s+ultXDcQHoYi9YRMS4
 ONzx8B5T7oeqXfsxzbIiP4S6vNCBdqm7jHsDhEaH+IVa+dbHztzl55kuVhgLn6ruO+SkrBci/
 6yVY3AqRLQYM+ovmf1+dknsmpi7N+SlAJLQo11n5uTzluSU47Wd5BC2vgubM3UWEUtUA4EtkD
 9Y4xeDotYeZZBiQ/0apDHIFasio9DCoAnvWpPY5ajFYl8zzM7WhB675LCNE0IDL4gyrGkX3Fl
 OIIoH/0CrYN7q8Bsm4MuY5KKsJ6hDatJiw8jyq1vdR4EwdwhSw8gzGuluJ9lLfpDLpTHed1et
 r8rhlRWKkivEqcLfaB5J6l4dJjn4idmSbFvaDBxMOlDrsw7h3oGnLd8I2LCcUevYp/HJIunav
 aYV0NKFJqovnJOPWozE7/kKSJ2ag5xVkf58+0cWTaNEjKpumrE1ZdVkmeyaxaVuwYzQev8anG
 9mQKRznuGeyrMYVqEqgXN4nBIhoi4IcPr3UNCgYibTGWfjPiQwOJuurclCc3jWLwlOtsfbFgD
 cA41xsjmms/a4QxxatQE7bFrZugYNPq+whQkPcn2Z0AmknJSvmkR4cm+nI/9NGr+uWtjqEF22
 YFcEGL11Anm4pSnWCr/QfbMnJR4EOpkRt6d+yNAqvMp5r9aeA66nUdxrqS4nMeWB41LiQaH3a
 oD6ZUZQJe34aRjp1K8qs1OXDJq1EHGy1ZRSVODfd0JDQJvP+tDZxdBwWiOkUI1u7x9vw//Ode
 z/7ZyNDdnTIMBQKSYWr19zu4NJNSQ8Po/9IuRXCjK3UR52HSlRkaNAno0nEYLqoqgVrLjq0b6
 xh49ugXk3Q/XGf+oIzz9Q1FKGXExXs5nOxTCQOUvuJuCRFK9vGVhMdW7COiBxlFVO2BW1NOJL
 K4dObjlCkt75anGzjsmb1U6RCFoc7NpU+E3v27yJKVvO4oZjp4Wn2882XKNxl/XD41C6TU+ez
 eilhHt4gx1Z+vQM9+sGHn5PEQg9EO0lAXrt/dyzROR0aPlFPZIefUbuWrkdhLolnQYvwDvLxw
 OdQZWahevg2evAoPLv5f54HeTKqm+QVdru+tIEwJDWu26xvtV4C9b6jOHe801/65i15/CBvsT
 qHpd/zhgOdozlKRfhbQr7ROYJq4Tz4ZLwu/1dC+vgAX+L9JMsfE5INxegQfmqHTOsGMH4d5aQ
 pElUn7gbBt07M+C40VhInln754bgriEfX/HksKyF8kT4wWN184pYSxNdHzOGQLEvEzFpPzcPN
 PYbfUE7W+O3Gdrd0LExPcv4EB5WkVGFBCGnB6mE6Ge0hKbMwSS2xOI0sZg0SW6t5uiymvEq9R
 0Y1OQHCVEAOBqbW6hhpzciOTOL4NUVLVehSn/HDYNVmlxs5VwHQzdypbjb+Mm4lxjPiplPSSf
 J/yA1K0sbhfxsuTlxc0rVQ0y/IQ3HgXE5/N6pwgc0Nv/ftUsHC5HwvddbG6OJQXjAAlW6Gjw2
 fsASkysiyLNjGV3Wl/AtlToGhY6mIhUM80FRa+I8GPSzZ
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The unlabelled registers NPCM_I2CCTL4 to NPCM_I2CSCLHT overlap with the
bank 1 registers below, and they are accessed after selecting bank 0, so
they clearly belong to bank 0.

Move them together with the other bank 0 registers, and move the
unrelated definition of npcm_i2caddr down to keep the banked registers
in one piece.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/i2c/busses/i2c-npcm7xx.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npc=
m7xx.c
index 0c365b57d9572..9a7a2d0bf5765 100644
=2D-- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -106,7 +106,7 @@ enum i2c_addr {
 #define NPCM_I2CCST3			0x19
 #define I2C_VER				0x1F

-/*BANK0 regs*/
+/* BANK 0 regs */
 #define NPCM_I2CADDR3			0x10
 #define NPCM_I2CADDR7			0x11
 #define NPCM_I2CADDR4			0x12
@@ -115,6 +115,20 @@ enum i2c_addr {
 #define NPCM_I2CADDR9			0x15
 #define NPCM_I2CADDR6			0x16
 #define NPCM_I2CADDR10			0x17
+#define NPCM_I2CCTL4			0x1A
+#define NPCM_I2CCTL5			0x1B
+#define NPCM_I2CSCLLT			0x1C /* SCL Low Time */
+#define NPCM_I2CFIF_CTL			0x1D /* FIFO Control */
+#define NPCM_I2CSCLHT			0x1E /* SCL High Time */
+
+/* BANK 1 regs */
+#define NPCM_I2CFIF_CTS			0x10 /* Both FIFOs Control and Status */
+#define NPCM_I2CTXF_CTL			0x12 /* Tx-FIFO Control */
+#define NPCM_I2CT_OUT			0x14 /* Bus T.O. */
+#define NPCM_I2CPEC			0x16 /* PEC Data */
+#define NPCM_I2CTXF_STS			0x1A /* Tx-FIFO Status */
+#define NPCM_I2CRXF_STS			0x1C /* Rx-FIFO Status */
+#define NPCM_I2CRXF_CTL			0x1E /* Rx-FIFO Control */

 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 /*
@@ -131,21 +145,6 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] =3D {
 };
 #endif

-#define NPCM_I2CCTL4			0x1A
-#define NPCM_I2CCTL5			0x1B
-#define NPCM_I2CSCLLT			0x1C /* SCL Low Time */
-#define NPCM_I2CFIF_CTL			0x1D /* FIFO Control */
-#define NPCM_I2CSCLHT			0x1E /* SCL High Time */
-
-/* BANK 1 regs */
-#define NPCM_I2CFIF_CTS			0x10 /* Both FIFOs Control and Status */
-#define NPCM_I2CTXF_CTL			0x12 /* Tx-FIFO Control */
-#define NPCM_I2CT_OUT			0x14 /* Bus T.O. */
-#define NPCM_I2CPEC			0x16 /* PEC Data */
-#define NPCM_I2CTXF_STS			0x1A /* Tx-FIFO Status */
-#define NPCM_I2CRXF_STS			0x1C /* Rx-FIFO Status */
-#define NPCM_I2CRXF_CTL			0x1E /* Rx-FIFO Control */
-
 /* NPCM_I2CST reg fields */
 #define NPCM_I2CST_XMIT			BIT(0)
 #define NPCM_I2CST_MASTER		BIT(1)
=2D-
2.35.1

