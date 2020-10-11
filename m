Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 854D428A941
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Oct 2020 20:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgJKSXr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Oct 2020 14:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728037AbgJKSXq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Oct 2020 14:23:46 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE64FC0613D0
        for <linux-i2c@vger.kernel.org>; Sun, 11 Oct 2020 11:23:46 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id k8so11357188pfk.2
        for <linux-i2c@vger.kernel.org>; Sun, 11 Oct 2020 11:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rcbsc/1J4W8O0d1WiXAmXcjfIjIcVIIJizY6ArnnXkc=;
        b=BjtMSORTBjnleDjOj6v/EPwGkkG0FKf2/HxY8qOegxezOzYATC2OxatKSa96RwccKT
         rdCWceIU+tYXqE9yXClGU+UOExFX1pH3S4HBvYJW039DbQ0No/1hnJO3fqw8RAwV1+rb
         pNXjtfz1ZXCaA7Wq9YsHp3UeWy1gk/YWwlr/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rcbsc/1J4W8O0d1WiXAmXcjfIjIcVIIJizY6ArnnXkc=;
        b=SNv+lOpF42olb1MLaeEP+3klfQy4Skgz7UAJVuJ9DLCbQ4bK5rHizLlZf4xtlBrdwx
         15cO0SVjD5PwaX4wv7A2G/bDI4rLcTZbxhdPMEnXYsWAMBn0LSwmhiHjey9/8WdplFrL
         doCViQ3IVWXTpcxPMnma0Sol7lUv7p/nsStaOAcfp/87xRClDeKTDNDS7KQYLBP0TT2E
         29mUs3Rl8aW/6G9denV+Vr05OE9Bu7dwhM0g/FRH4HQ6MpmjEeV/dF56eG06pm2ziHao
         epU57GJHuTcgSgbrfsSdqHV9iCC9rAyRi03qa0av6Szhr49wyy/vIFkBlViyUh0OCSnW
         zx1w==
X-Gm-Message-State: AOAM533roQO/7G5vcbK8oN0Zs6TyiLpKoAw/U0F8B3658KM9WGDjl7g4
        VrqiaTvK3CNikmCF0E1JDUDfKw==
X-Google-Smtp-Source: ABdhPJwiPkPIRutiD+wEZcKaT5iyTgQwGU99qofX02YE0IylWUiazA2+6/4CEU/kdq/c+uXJjI5d3Q==
X-Received: by 2002:a17:90b:3882:: with SMTP id mu2mr16471333pjb.29.1602440626183;
        Sun, 11 Oct 2020 11:23:46 -0700 (PDT)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id g1sm21977807pjj.3.2020.10.11.11.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 11:23:45 -0700 (PDT)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: [PATCH v1 2/6] i2c: iproc: handle only slave interrupts which are enabled
Date:   Sun, 11 Oct 2020 23:52:50 +0530
Message-Id: <20201011182254.17776-3-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201011182254.17776-1-rayagonda.kokatanur@broadcom.com>
References: <20201011182254.17776-1-rayagonda.kokatanur@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="00000000000053fc0105b16948cc"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--00000000000053fc0105b16948cc

Handle only slave interrupts which are enabled.

The IS_OFFSET register contains the interrupt status bits which will be
set regardless of the enabling of the corresponding interrupt condition.
One must therefore look at both IS_OFFSET and IE_OFFSET to determine
whether an interrupt condition is set and enabled.

Fixes: c245d94ed106 ("i2c: iproc: Add multi byte read-write support for slave mode")
Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 834a98caeada..b54f5130d246 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -507,12 +507,17 @@ static void bcm_iproc_i2c_process_m_event(struct bcm_iproc_i2c_dev *iproc_i2c,
 static irqreturn_t bcm_iproc_i2c_isr(int irq, void *data)
 {
 	struct bcm_iproc_i2c_dev *iproc_i2c = data;
-	u32 status = iproc_i2c_rd_reg(iproc_i2c, IS_OFFSET);
+	u32 slave_status;
+	u32 status;
 	bool ret;
-	u32 sl_status = status & ISR_MASK_SLAVE;
 
-	if (sl_status) {
-		ret = bcm_iproc_i2c_slave_isr(iproc_i2c, sl_status);
+	status = iproc_i2c_rd_reg(iproc_i2c, IS_OFFSET);
+	/* process only slave interrupt which are enabled */
+	slave_status = status & iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET) &
+		       ISR_MASK_SLAVE;
+
+	if (slave_status) {
+		ret = bcm_iproc_i2c_slave_isr(iproc_i2c, slave_status);
 		if (ret)
 			return IRQ_HANDLED;
 		else
-- 
2.17.1


--00000000000053fc0105b16948cc
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
xVUYGnc0GLrYeHC2X4wJbUsgi+UFM/rVW0RKe5Sg4xmLXWc/rBhXDBVPeFVdN2dYsk5MyDRM/fXj
cAA+xTX+SQGoND8CAwEAAaOCAdcwggHTMA4GA1UdDwEB/wQEAwIFoDCBngYIKwYBBQUHAQEEgZEw
gY4wTQYIKwYBBQUHMAKGQWh0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzcGVy
c29uYWxzaWduMnNoYTJnM29jc3AuY3J0MD0GCCsGAQUFBzABhjFodHRwOi8vb2NzcDIuZ2xvYmFs
c2lnbi5jb20vZ3NwZXJzb25hbHNpZ24yc2hhMmczME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0
MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNV
HRMEAjAAMEQGA1UdHwQ9MDswOaA3oDWGM2h0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NwZXJz
b25hbHNpZ24yc2hhMmczLmNybDArBgNVHREEJDAigSByYXlhZ29uZGEua29rYXRhbnVyQGJyb2Fk
Y29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBRpcoJiMWeVRIV3kYDEBDZJ
nXsLYTAdBgNVHQ4EFgQU1rE7oQJ7FiSTADFOqokePoGwIq4wDQYJKoZIhvcNAQELBQADggEBAD8I
VcITGu1E61LQLR1zygqFw8ByKPgiiprMuQB74Viskl7pAZigzYJB8H3Mpd2ljve+GRo8yvbBC76r
Gi5WdS06XI5vuImDJ2g6QUt754rj7xEYftM5Gy9ZMslKNvSiPPh1/ACx5w7ecD1ZK0YLMKGATeBD
XybduRFIEPZBAjgJ5LOYT2ax3ZesfAkan1XJ97yLA93edgTTO2cbUAADTIMFWm4lI/e14wdGmK0I
FtqJWw6DATg5ePiAAn+S0JoIL1xqKsZi2ioNqm02QMFb7RbB3yEGb/7ZLAGcPW666o5GSLsUnPPq
YOfL/3X6tVfGeoi3IgfI+z76/lXk8vOQzQQxggJvMIICawIBATBtMF0xCzAJBgNVBAYTAkJFMRkw
FwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTMwMQYDVQQDEypHbG9iYWxTaWduIFBlcnNvbmFsU2ln
biAyIENBIC0gU0hBMjU2IC0gRzMCDDw+ri+StHzo6PJZ/DANBglghkgBZQMEAgEFAKCB1DAvBgkq
hkiG9w0BCQQxIgQgoL/ykBZWJDxom7teAAlDjbpZTcaIx5Ft2w6r8St6HkEwGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAxMDExMTgyMzQ2WjBpBgkqhkiG9w0BCQ8x
XDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsG
CSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBACL6
3yb0GfRBO8nSgo6ImrzNIPib6MCZZrETrFByq3eMMtrJIkvQ436ipFkZQP2Y7gZ+TzOsGYNpdYNG
xU7/BqQkyZOSCcOskU6i1i7zAObsjGw/+eR0zE2UZvvtLR0c+4mefpO2CegwPDGhPRPjiA//+dpa
aaT24sz9ub8jWCpKrTXN1RBloMJiOilEboDoSAIqQqios7Qke9mQY+7wnGnuDacSQN20xve84VBP
UweWVdoxCluV2GJa3vP1Rr4QaVjOGC4RjuJXGgEOl1jcsncWva7pzRtMPCArFHPdHEXg7RAhfasp
NoKPmi8RjzOswW6cCKPjKF/r3kjTC/GePdU=
--00000000000053fc0105b16948cc--
