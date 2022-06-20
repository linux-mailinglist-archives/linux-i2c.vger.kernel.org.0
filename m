Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A73B552241
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jun 2022 18:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236396AbiFTQ2x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jun 2022 12:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244553AbiFTQ2u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jun 2022 12:28:50 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBB9BE0C;
        Mon, 20 Jun 2022 09:28:50 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25KDDo2h010544;
        Mon, 20 Jun 2022 16:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2021-07-09; bh=UPuXuwaATnCiD95hRgHKAmygUc1xM5cEW1R932PHfNc=;
 b=dg7RELv6yPPnxOGDkTR5jTbbt/a4uBWvKqvW6rVBDSmyfiYqNcxvJ6hbGeK5fSQW87I4
 aYhAOH7NvJxVs/sZYDrjPyFXRf5ifmiit0SjiJvrCTQCkKrzVdtwpPJV1PIktm75QrFd
 pcScMHs3Ez6s+nMaB8Of+ioRXmijOHKKdBKbCI2vOmdjrL6gujVzusIthL9WQ2TJAiZS
 gc8gm8sEUYtERkHexZGWR8I5TGuvfOWRMnFk2rmZq0OVU23VMGOFBSH6eFJuEQbR36vS
 4lEhgX2BV/sk37X9JmtDmVb2bKLZTCWLZSYwGTMvsfoMkbiktPiAqAT03bkdPn5jBur5 dA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs78tunpu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Jun 2022 16:28:43 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25KGKfjN000850;
        Mon, 20 Jun 2022 16:28:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gtg5tjd40-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Jun 2022 16:28:42 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25KGSf6Y019345;
        Mon, 20 Jun 2022 16:28:41 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.147.25.63])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gtg5tjd3a-1;
        Mon, 20 Jun 2022 16:28:41 +0000
From:   Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc:     harshit.m.mogalapalli@oracle.com, dan.carpenter@oracle.com,
        Rishi Gupta <gupt21@gmail.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] HID: mcp2221: prevent a buffer overflow in mcp_smbus_write()
Date:   Mon, 20 Jun 2022 09:28:24 -0700
Message-Id: <20220620162824.58937-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: m7rxXkTFRvbfervoWggKeeMRoHZOjazw
X-Proofpoint-ORIG-GUID: m7rxXkTFRvbfervoWggKeeMRoHZOjazw
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Smatch Warning:
drivers/hid/hid-mcp2221.c:388 mcp_smbus_write() error: __memcpy()
'&mcp->txbuf[5]' too small (59 vs 255)
drivers/hid/hid-mcp2221.c:388 mcp_smbus_write() error: __memcpy() 'buf'
too small (34 vs 255)

The 'len' variable can take a value between 0-255 as it can come from
data->block[0] and it is user data. So add an bound check to prevent a
buffer overflow in memcpy().

Fixes: 67a95c21463d ("HID: mcp2221: add usb to i2c-smbus host bridge")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
I believe I2C_SMBUS_BLOCK_MAX (32) is the appropriate limit to use here
but the &mcp->txbuf[5] array could actually fit 59 bytes which is the
destination in this case. I don't know why the buffer is larger than
expected.

 drivers/hid/hid-mcp2221.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 4211b9839209..de52e9f7bb8c 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -385,6 +385,9 @@ static int mcp_smbus_write(struct mcp2221 *mcp, u16 addr,
 		data_len = 7;
 		break;
 	default:
+		if (len > I2C_SMBUS_BLOCK_MAX)
+			return -EINVAL;
+
 		memcpy(&mcp->txbuf[5], buf, len);
 		data_len = len + 5;
 	}
-- 
2.31.1

