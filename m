Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6465337B4
	for <lists+linux-i2c@lfdr.de>; Wed, 25 May 2022 09:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233895AbiEYHsv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 May 2022 03:48:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235723AbiEYHst (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 May 2022 03:48:49 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E087A805;
        Wed, 25 May 2022 00:48:46 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id i40so25975249eda.7;
        Wed, 25 May 2022 00:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EPynCkzORF20XuMD0bXtGUG6EP2A5Zo3+FVMietPcZE=;
        b=GjqqkGiRRZblEkRH2U6xkeHVGMYUun9iTgUsZ+Pa+GD8goBEWkreCgNtYz9dDfGQxt
         Zd9X5kG43LsTCMslMecPruEpYViBwpM+CriKB5Rk/ArGEU2Ds/4uZoshU2LdoYWk/pgw
         2u9IpeyM0HhEeLklfuoLDg/geyvr4K8jSzg/N5ORQ8y3RnQWv03DPg7IEBmLz+tymMLu
         rBwzzmB1m8VCqj3mcMzXkCtehD8mCf+yar4HVam9bSIprwZCAPZLHDDFMFeC6VhAPvBe
         mNnrQHskxxhS5VMOVbA8Ilw8n2y0CQESgIGQBsz7ISHXNb3IAMHT5Qa5PZAzu5GgDhg4
         LSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EPynCkzORF20XuMD0bXtGUG6EP2A5Zo3+FVMietPcZE=;
        b=1xfKAXNr0JNiUS8Mb17jl4WUyWMbQhJRHMXi1K0WcBKRiE3hFBBqLqfhP7sF7BLu/E
         06DNJXn4f0tpSMnG0/cmm57SVK5TjV/x5AM09AHOiX/PlhdbtT0ZiHZvRItzl7ebhkme
         UtoEhdADFs1adjL3QJHYjcp6xrU8rpIJwFPyQD8VkBlnHh703ejrpywzDLoT8FiVcJp/
         xvSAtVSPhIkvCwVxppkLxlGNe1TFFyR1OBA7SY9WNgcajY0cEZMbctAnglHcFG/QCEbA
         clJReW4shw+j3JmdjxNwEAT3NlXFFYIc/SPAvNGmiNaGA3s3ZObP4Ou/ftGue/cFrdqV
         vWyg==
X-Gm-Message-State: AOAM531/F64w5/2P/kq/pvVs2/rxzDd5KlzPJyQH436IYsIEApvdNjY5
        FP8T1J2AKXbGrSRRU+TfgDE=
X-Google-Smtp-Source: ABdhPJxGPyhSLiXKVkPe2sk+qtaGDafwnLFhLiBhQLBcT7f1HHCHojo13Uc+eZdwaWjmoAoEzHKfpg==
X-Received: by 2002:a05:6402:509:b0:42a:b6c9:eac with SMTP id m9-20020a056402050900b0042ab6c90eacmr32170452edv.225.1653464925492;
        Wed, 25 May 2022 00:48:45 -0700 (PDT)
Received: from localhost.localdomain (109-186-136-71.bb.netvision.net.il. [109.186.136.71])
        by smtp.googlemail.com with ESMTPSA id v1-20020aa7d641000000b0042acd78014esm10230533edr.11.2022.05.25.00.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 00:48:45 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com, wsa@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, champagne.guillaume.c@gmail.com,
        mathieu.gallichand@sonatest.com,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v1 2/5] HID: ft260: improve i2c write performance
Date:   Wed, 25 May 2022 10:47:54 +0300
Message-Id: <20220525074757.7519-3-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220525074757.7519-1-michael.zaidman@gmail.com>
References: <20220525074757.7519-1-michael.zaidman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patch improves i2c writing performance by about 30 percent by revising the
sleep time in the ft260_hid_output_report_check_status() in the following ways:

1. Reduce the sleep time and start to poll earlier:

  Before:
    $ sudo ./i2cperf -f 2 -o 2 -s 32 -r 0-0xff 13 0x51 -S

      Fill block with increment via i2ctransfer by chunks
      -------------------------------------------------------------------
      data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
      -------------------------------------------------------------------
      40510           80             256           8           32

  After:
    $ sudo ./i2cperf -f 2 -o 2 -s 32 -r 0-0xff 13 0x51 -S

      Fill block with increment via i2ctransfer by chunks
      -------------------------------------------------------------------
      data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
      -------------------------------------------------------------------
      52584           80             256           8           32

2. Do not sleep when the calculated sleep time is below 2 ms:

  Before:
    $ sudo ./i2cperf -f 2 -o 2 -s 16 -r 0-0xff 13 0x51 -S

      Fill block with increment via i2ctransfer by chunks
      -------------------------------------------------------------------
      data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
      -------------------------------------------------------------------
      26707           73             256           16          16

  After:
    $ sudo ./i2cperf -f 2 -o 2 -s 16 -r 0-0xff 13 0x51 -S

      Fill block with increment via i2ctransfer by chunks
      -------------------------------------------------------------------
      data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
      -------------------------------------------------------------------
      37034           73             256           16          16

Link to the i2cperf - https://github.com/MichaelZaidman/i2cperf

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index a35201d68b15..44106cadd746 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -345,7 +345,7 @@ static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
 static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 						u8 *data, int len)
 {
-	int ret, usec, try = 3;
+	int ret, usec, try = 100;
 	struct hid_device *hdev = dev->hdev;
 
 	ret = ft260_hid_output_report(hdev, data, len);
@@ -356,10 +356,14 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 		return ret;
 	}
 
-	/* transfer time = 1 / clock(KHz) * 10 bits * bytes */
-	usec = 10000 / dev->clock * len;
-	usleep_range(usec, usec + 100);
-	ft260_dbg("wait %d usec, len %d\n", usec, len);
+	/* transfer time = 1 / clock(KHz) * 9 bits * bytes */
+	usec = len * 9000 / dev->clock;
+	if (usec > 2000) {
+		usec -= 1500;
+		usleep_range(usec, usec + 100);
+		ft260_dbg("wait %d usec, len %d\n", usec, len);
+	}
+
 	do {
 		ret = ft260_xfer_status(dev);
 		if (ret != -EAGAIN)
-- 
2.25.1

