Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C92EE787A52
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 23:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243648AbjHXVYj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Aug 2023 17:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243686AbjHXVYL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Aug 2023 17:24:11 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A27911BCA
        for <linux-i2c@vger.kernel.org>; Thu, 24 Aug 2023 14:24:09 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-64a5bc53646so1595936d6.2
        for <linux-i2c@vger.kernel.org>; Thu, 24 Aug 2023 14:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1692912248; x=1693517048;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xiom1rS+mZNiClrRMzUDudrC8yXQM9uR+m5JDJFGA0g=;
        b=ES6YI43/C5zM7weJJ1WLWYLX+s+Mqo+jFNcmyrc5s8RWLG9+918qytFiKe3g4SJ4R5
         aXge+q/QBgRwU5Kfzcluh8CTvdfBCGOK2XVvUVFeFCVNxttU6RYeP71zjn/Uo/kdRBid
         BxiLLgbNUGspyoNMGUqpzobjeJWUPHbmGgW2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692912248; x=1693517048;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xiom1rS+mZNiClrRMzUDudrC8yXQM9uR+m5JDJFGA0g=;
        b=hz6w8Nb623ccSrs3glP/7aIye3QBhcEf7CQc3Sg+IxMVqVKCLOEuqSiVFilRjGN8bC
         iqVb1IyvFrVHiSpnuU7ex4zIlUYVY7Z95BiQ2lzq6lnqVgnwDtp/CyDEF5WbBT1IYb2D
         8ycLSgVnkFmU+Eikc40eXyltPIZ031HkqODRNk9fOxT91/ZsGH9sx1gUBmGvEMeYbQkt
         45Hl3iDElkLYK3IQUwmTT1cF5oC5m6pKb62FMD49ta2O0HF1pLn7IS+M0JK2JaWUHOZW
         Nk5saU4fypWszYOK9AlUHOgZEuNVrio6t5MFLZsPPD5Ok3B/51K0jSlI51eEawGdDDJC
         eEug==
X-Gm-Message-State: AOJu0YyMZk8vnjE2X4A6C8HDXcsDAs2HY8S8HWXT78p4dxt6EHBBC14L
        6nY1c+cWpPYXoI7BILezgLk2L61m7oUIfhuOFOFZ4FdItGhgSXqtEp9kbnH3u4U01jwrNGGWTMS
        i32K+wKqRHTsUi80ff913dOJvZkk=
X-Google-Smtp-Source: AGHT+IGWCYDrAVN1oLpPDbDF+nFArybQctWBj3Hy38VvwWk0SHX6eJ20UUVcTL/OVWcTHYiAvOgdlw==
X-Received: by 2002:ad4:5149:0:b0:631:f426:a4ab with SMTP id g9-20020ad45149000000b00631f426a4abmr16429962qvq.49.1692912248472;
        Thu, 24 Aug 2023 14:24:08 -0700 (PDT)
Received: from HDYH7M3.Broadcom.net ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id j15-20020a0ce00f000000b0064713c8fab7sm75769qvk.59.2023.08.24.14.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 14:24:07 -0700 (PDT)
From:   roman.bacik@broadcom.com
To:     andi.shyti@kernel.org, rjui@broadcom.com, sbranden@broadcom.com
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Roman Bacik <roman.bacik@broadcom.com>
Subject: [PATCH] i2c: iproc: handle invalid slave state
Date:   Thu, 24 Aug 2023 14:23:51 -0700
Message-Id: <20230824212351.24346-1-roman.bacik@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000394ddb0603b1d931"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--000000000000394ddb0603b1d931
Content-Type: text/plain; charset="US-ASCII"

From: Roman Bacik <roman.bacik@broadcom.com>

Add the code to handle an invalid state when both bits S_RX_EVENT
(indicating a transaction) and S_START_BUSY (indicating the end
of transaction - transition of START_BUSY from 1 to 0) are set in
the interrupt status register during a slave read.

Signed-off-by: Roman Bacik <roman.bacik@broadcom.com>
Fixes: 1ca1b4516088 ("i2c: iproc: handle Master aborted error")
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 133 ++++++++++++++++-------------
 1 file changed, 75 insertions(+), 58 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 05c80680dff4..68438d4e5d73 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -316,26 +316,44 @@ static void bcm_iproc_i2c_slave_init(
 	iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
 }
 
-static void bcm_iproc_i2c_check_slave_status(
-	struct bcm_iproc_i2c_dev *iproc_i2c)
+static bool bcm_iproc_i2c_check_slave_status
+	(struct bcm_iproc_i2c_dev *iproc_i2c, u32 status)
 {
 	u32 val;
+	bool recover = false;
 
-	val = iproc_i2c_rd_reg(iproc_i2c, S_CMD_OFFSET);
-	/* status is valid only when START_BUSY is cleared after it was set */
-	if (val & BIT(S_CMD_START_BUSY_SHIFT))
-		return;
+	/* check slave transmit status only if slave is transmitting */
+	if (!iproc_i2c->slave_rx_only) {
+		val = iproc_i2c_rd_reg(iproc_i2c, S_CMD_OFFSET);
+		/* status is valid only when START_BUSY is cleared */
+		if (!(val & BIT(S_CMD_START_BUSY_SHIFT))) {
+			val = (val >> S_CMD_STATUS_SHIFT) & S_CMD_STATUS_MASK;
+			if (val == S_CMD_STATUS_TIMEOUT ||
+			    val == S_CMD_STATUS_MASTER_ABORT) {
+				dev_warn(iproc_i2c->device,
+					 (val == S_CMD_STATUS_TIMEOUT) ?
+					 "slave random stretch time timeout\n" :
+					 "Master aborted read transaction\n");
+				recover = true;
+			}
+		}
+	}
+
+	/* RX_EVENT is not valid when START_BUSY is set */
+	if ((status & BIT(IS_S_RX_EVENT_SHIFT)) &&
+	    (status & BIT(IS_S_START_BUSY_SHIFT))) {
+		dev_warn(iproc_i2c->device, "Slave aborted read transaction\n");
+		recover = true;
+	}
 
-	val = (val >> S_CMD_STATUS_SHIFT) & S_CMD_STATUS_MASK;
-	if (val == S_CMD_STATUS_TIMEOUT || val == S_CMD_STATUS_MASTER_ABORT) {
-		dev_err(iproc_i2c->device, (val == S_CMD_STATUS_TIMEOUT) ?
-			"slave random stretch time timeout\n" :
-			"Master aborted read transaction\n");
+	if (recover) {
 		/* re-initialize i2c for recovery */
 		bcm_iproc_i2c_enable_disable(iproc_i2c, false);
 		bcm_iproc_i2c_slave_init(iproc_i2c, true);
 		bcm_iproc_i2c_enable_disable(iproc_i2c, true);
 	}
+
+	return recover;
 }
 
 static void bcm_iproc_i2c_slave_read(struct bcm_iproc_i2c_dev *iproc_i2c)
@@ -420,48 +438,6 @@ static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
 	u32 val;
 	u8 value;
 
-	/*
-	 * Slave events in case of master-write, master-write-read and,
-	 * master-read
-	 *
-	 * Master-write     : only IS_S_RX_EVENT_SHIFT event
-	 * Master-write-read: both IS_S_RX_EVENT_SHIFT and IS_S_RD_EVENT_SHIFT
-	 *                    events
-	 * Master-read      : both IS_S_RX_EVENT_SHIFT and IS_S_RD_EVENT_SHIFT
-	 *                    events or only IS_S_RD_EVENT_SHIFT
-	 *
-	 * iproc has a slave rx fifo size of 64 bytes. Rx fifo full interrupt
-	 * (IS_S_RX_FIFO_FULL_SHIFT) will be generated when RX fifo becomes
-	 * full. This can happen if Master issues write requests of more than
-	 * 64 bytes.
-	 */
-	if (status & BIT(IS_S_RX_EVENT_SHIFT) ||
-	    status & BIT(IS_S_RD_EVENT_SHIFT) ||
-	    status & BIT(IS_S_RX_FIFO_FULL_SHIFT)) {
-		/* disable slave interrupts */
-		val = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
-		val &= ~iproc_i2c->slave_int_mask;
-		iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
-
-		if (status & BIT(IS_S_RD_EVENT_SHIFT))
-			/* Master-write-read request */
-			iproc_i2c->slave_rx_only = false;
-		else
-			/* Master-write request only */
-			iproc_i2c->slave_rx_only = true;
-
-		/* schedule tasklet to read data later */
-		tasklet_schedule(&iproc_i2c->slave_rx_tasklet);
-
-		/*
-		 * clear only IS_S_RX_EVENT_SHIFT and
-		 * IS_S_RX_FIFO_FULL_SHIFT interrupt.
-		 */
-		val = BIT(IS_S_RX_EVENT_SHIFT);
-		if (status & BIT(IS_S_RX_FIFO_FULL_SHIFT))
-			val |= BIT(IS_S_RX_FIFO_FULL_SHIFT);
-		iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, val);
-	}
 
 	if (status & BIT(IS_S_TX_UNDERRUN_SHIFT)) {
 		iproc_i2c->tx_underrun++;
@@ -493,8 +469,9 @@ static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
 		 * less than PKT_LENGTH bytes were output on the SMBUS
 		 */
 		iproc_i2c->slave_int_mask &= ~BIT(IE_S_TX_UNDERRUN_SHIFT);
-		iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET,
-				 iproc_i2c->slave_int_mask);
+		val = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
+		val &= ~BIT(IE_S_TX_UNDERRUN_SHIFT);
+		iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
 
 		/* End of SMBUS for Master Read */
 		val = BIT(S_TX_WR_STATUS_SHIFT);
@@ -515,9 +492,49 @@ static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
 				 BIT(IS_S_START_BUSY_SHIFT));
 	}
 
-	/* check slave transmit status only if slave is transmitting */
-	if (!iproc_i2c->slave_rx_only)
-		bcm_iproc_i2c_check_slave_status(iproc_i2c);
+	/* if the controller has been reset, immediately return from the ISR */
+	if (bcm_iproc_i2c_check_slave_status(iproc_i2c, status))
+		return true;
+
+	/*
+	 * Slave events in case of master-write, master-write-read and,
+	 * master-read
+	 *
+	 * Master-write     : only IS_S_RX_EVENT_SHIFT event
+	 * Master-write-read: both IS_S_RX_EVENT_SHIFT and IS_S_RD_EVENT_SHIFT
+	 *                    events
+	 * Master-read      : both IS_S_RX_EVENT_SHIFT and IS_S_RD_EVENT_SHIFT
+	 *                    events or only IS_S_RD_EVENT_SHIFT
+	 *
+	 * iproc has a slave rx fifo size of 64 bytes. Rx fifo full interrupt
+	 * (IS_S_RX_FIFO_FULL_SHIFT) will be generated when RX fifo becomes
+	 * full. This can happen if Master issues write requests of more than
+	 * 64 bytes.
+	 */
+	if (status & BIT(IS_S_RX_EVENT_SHIFT) ||
+	    status & BIT(IS_S_RD_EVENT_SHIFT) ||
+	    status & BIT(IS_S_RX_FIFO_FULL_SHIFT)) {
+		/* disable slave interrupts */
+		val = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
+		val &= ~iproc_i2c->slave_int_mask;
+		iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, val);
+
+		if (status & BIT(IS_S_RD_EVENT_SHIFT))
+			/* Master-write-read request */
+			iproc_i2c->slave_rx_only = false;
+		else
+			/* Master-write request only */
+			iproc_i2c->slave_rx_only = true;
+
+		/* schedule tasklet to read data later */
+		tasklet_schedule(&iproc_i2c->slave_rx_tasklet);
+
+		/* clear IS_S_RX_FIFO_FULL_SHIFT interrupt */
+		if (status & BIT(IS_S_RX_FIFO_FULL_SHIFT)) {
+			val = BIT(IS_S_RX_FIFO_FULL_SHIFT);
+			iproc_i2c_wr_reg(iproc_i2c, IS_OFFSET, val);
+		}
+	}
 
 	return true;
 }
-- 
2.41.0


-- 
This electronic communication and the information and any files transmitted 
with it, or attached to it, are confidential and are intended solely for 
the use of the individual or entity to whom it is addressed and may contain 
information that is confidential, legally privileged, protected by privacy 
laws, or otherwise restricted from disclosure to anyone else. If you are 
not the intended recipient or the person responsible for delivering the 
e-mail to the intended recipient, you are hereby notified that any use, 
copying, distributing, dissemination, forwarding, printing, or copying of 
this e-mail is strictly prohibited. If you received this e-mail in error, 
please return the e-mail to the sender, delete it from your computer, and 
destroy any printed copy of it.

--000000000000394ddb0603b1d931
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
kVemjZNSIF6M0772/HY5U+poXfKriD5OwRc4OQKNOj5JPlWbPqGsBLPV3V84TEHFB/HS8b9kLhFt
/xJ8Oeq/cEcWTmUM3U7zxYP7gTg2ZyQhjuU7R8c3AgMBAAGjggHZMIIB1TAOBgNVHQ8BAf8EBAMC
BaAwgaMGCCsGAQUFBwEBBIGWMIGTME4GCCsGAQUFBzAChkJodHRwOi8vc2VjdXJlLmdsb2JhbHNp
Z24uY29tL2NhY2VydC9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcnQwQQYIKwYBBQUHMAGG
NWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwME0G
A1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxz
aWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEkGA1UdHwRCMEAwPqA8oDqGOGh0dHA6Ly9j
cmwuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3JsMCMGA1UdEQQc
MBqBGHJvbWFuLmJhY2lrQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSME
GDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQU6LrAS5I+9MU+uZwBN1CpwPA8t/cw
DQYJKoZIhvcNAQELBQADggEBAFiR/8JScXcG5YSdUPk9otK4e6MFHqMm34r8qarOQZhvIHcQjzIc
dSiFQXZ1rzMKLBkCEl5Rk72sXriIx3Wq0e20xrYGPgl2XG416Az6wrq9s8t0+BhtmMHy5+x3qORa
yboad+vil8QhKeW3km9+fuK/s4hKXBn/S+0sxxgA8FcGod8oCC0kBeLLVL28uXkbSg6JFiIbEVvq
8wipUVlpKabf+g30ppnXT/3yGzraM/w8j/b2YbX4ZXrLRAyn0Gp2V+dHicsFy5Yqtd1IgU/xOw97
cBjJw8R9iSSnZYz3GrNX3DlIknplnG7jYK6OgWWuVdXi/TpH2muDOK2P8YF1+TsxggJtMIICaQIB
ATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhH
bG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgxQq66/g6f3ySKbXX0wDQYJ
YIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIH+HHG3HLlKAeuMxRDnaj2VpvJ/ARR8fleXQ
Xs05ek2eMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMDgyNDIx
MjQwOFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFl
AwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATAN
BgkqhkiG9w0BAQEFAASCAQAe9vhrb935VRJEYUuHOFwbzn760UkI1ReWYsPL3f1OimU6b94Fb4rK
TIEN1nAdtNLyXUUXYlEehkW94h5rYAwV/bt1+OLkp8AgDMr1aq8T7lav96vPdat1Hr2WiszpM/j8
c+3hg/fetnAmFfnsI2E4gRE2ob0Fjtmz3/DVa4egd8N4It2DLDjueFqJV5/XHQ/is5VzSB14W4F7
sbC2j9UmKXBFqkdQNz99rXJmxLRTVfU/ELgCbDpA+sViKGGJ6cPSPRoG/xPvW2BrX4XT8bdEjwyG
KsfLcKBWmvlTNu3dUWFSK/vKy3oXuqa724aQPPkloizUCsZTVeHJrFb86DRA
--000000000000394ddb0603b1d931--
