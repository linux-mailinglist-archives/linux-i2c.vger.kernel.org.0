Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D283A586287
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Aug 2022 04:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237027AbiHACV7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 31 Jul 2022 22:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238052AbiHACV6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 31 Jul 2022 22:21:58 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B212D644F;
        Sun, 31 Jul 2022 19:21:56 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id e132so8507644pgc.5;
        Sun, 31 Jul 2022 19:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Ehq7dTcBoIiSAWS81tPxnxHhs2Ec6oGHRx49Ht7lOaU=;
        b=XNl1M4L801OvnBAtwNmvEobXEsNYizhONpb+pgfCWaRJ52+kHIENMc9ORqVrpbEV1K
         Uv3EPQXc8NZYNdh62qquypDi5eNTo+3sI0YyzeB/XiBaa7UclFdp/soisIpBSgRIRJpH
         hIY1xACAiHWmZmD9gKUq8Uz1rTUKOfwIc43B/UcD3RmYwDcs74T8s7kXeySw/IOfdrwW
         Y9ZmRYSxYWfzDPbpQa9F6H+2LahpBxJ4lkYMF+zclRvZvX5CSBfltW/h9X5dwWwL9ebn
         VrnEuLmYrRBD62k4WjTI066DAg1ANC+4imuswbuR1jPlMs9CmWP+u57hv1TnXx1zgoTt
         zrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Ehq7dTcBoIiSAWS81tPxnxHhs2Ec6oGHRx49Ht7lOaU=;
        b=BLSNTzvJL9gUoNtZORyb1DOeRQ4BA6frDqiv479+e6Ib72frdxCK+Usl1KNrekz4FI
         OIwuQuoaIUcDCv2mW95BGBbl2Xmx4rAt8k2gbjTQIqd9jVwJHA9InFDz9CQTFz/Y+Zdv
         ZO9ggu4aTzw8iWYa7XvN41i4xnxrEuD7nNmRU5cexuegBTrrUuz2ItuoYVuhTvSk16bJ
         WTOIz84g3pRNFz1am4BOPOTcSgSgfIaSsFwhMkltJXt+Img8dFxAXvoi7z15AroxjKFh
         Pbaozg+D/LI5MGT4Nglamo5oAem36PDBQ5j4iJkvBUQsFoEuD2ZgP7cpyfrnhR08WLZu
         6Ffg==
X-Gm-Message-State: AJIora9PR+XW+uQ+Tjd7JhIMG8YA6lAeR/NQbW6aqJixQgak7c2HHkOr
        wlYpTQ6lNfVCJvvOLomt5IxgkYlmT8I=
X-Google-Smtp-Source: AGRyM1uwpvpbDnyxnTL4uaFAXWfbQ8ffnB2llGsnwcl5empDN6IG13tytJnL2iKl8NzJnJbsRE3/Xg==
X-Received: by 2002:a63:1c24:0:b0:41b:40c5:f114 with SMTP id c36-20020a631c24000000b0041b40c5f114mr11575815pgc.3.1659320516126;
        Sun, 31 Jul 2022 19:21:56 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902f7c400b0016a6cd546d6sm8045800plw.251.2022.07.31.19.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 19:21:55 -0700 (PDT)
From:   cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To:     linux-kernel@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, ye xingchen <ye.xingchen@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] i2c: qcom-geni:using the pm_runtime_resume_and_get to simplify the code Using pm_runtime_resume_and_get() to instade of  pm_runtime_get_sync  and pm_runtime_put_noidle.
Date:   Mon,  1 Aug 2022 02:21:51 +0000
Message-Id: <20220801022151.1594273-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: ye xingchen <ye.xingchen@zte.com.cn>

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 6ac179a373ff..7d185959bc64 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -678,10 +678,9 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 
 	gi2c->err = 0;
 	reinit_completion(&gi2c->done);
-	ret = pm_runtime_get_sync(gi2c->se.dev);
+	ret = pm_runtime_resume_and_get(gi2c->se.dev);
 	if (ret < 0) {
 		dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
-		pm_runtime_put_noidle(gi2c->se.dev);
 		/* Set device in suspended since resume failed */
 		pm_runtime_set_suspended(gi2c->se.dev);
 		return ret;
-- 
2.25.1
