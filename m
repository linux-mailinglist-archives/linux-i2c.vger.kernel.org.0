Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11F6F5773E4
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Jul 2022 05:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232888AbiGQDsR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Jul 2022 23:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbiGQDsJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Jul 2022 23:48:09 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2141717E3D
        for <linux-i2c@vger.kernel.org>; Sat, 16 Jul 2022 20:48:08 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso576142otb.6
        for <linux-i2c@vger.kernel.org>; Sat, 16 Jul 2022 20:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yi8AkrlIqU4lv5oV/rNtUh5JaYHyOIwQpcON7vVHGsA=;
        b=zr9iL6oISXOb1as1eSfmmqY3qOK3BV9grw3z5lf/C/WPw4ac1n1v8ar0WGrTWVBhVi
         vIGNlI8SxWlKUK85JILoOVAnX4f4uK9Ua6tVeWX12b/1yc2RcCI5LS7WJikmdUPEOEOR
         wCRaTAnWuwj46FQLcvRtEW0iqFszCpJmRj2EtpuTF4iq3AWA2/8caHFN+nNsrgpvFyab
         lG+ApzwU4ZSCEPjX9MLHrocKe8TZObRh45ble4Zi78SlEssrh6q4IAwwyyK6QVEKtIK2
         xAq6Nfo64ioTQi+hVFLXsWbVL6i2H8iYxYwE4try/xt9QZsSSuCLPL22RSTGFRWhX0iM
         vUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yi8AkrlIqU4lv5oV/rNtUh5JaYHyOIwQpcON7vVHGsA=;
        b=fiNIDSOAkPoCON732t6/WFC3htps5o+3KWpTfoDx/RpaE7wuBsBcJ8RBLZTdQn6JiM
         4dJimJoC+UCURpdt46qE34BeGPugqyjh02OuwlYx+045SBa4zpdpuo5koYOkDigY7s9B
         kHeZWo6uvFURZq6zfSqFat3kzojxDYl6T+GemG69yoEZHck/4J6i8YwsE+FTvMBGE/zT
         Hvtc1Xhfb1s2lcgTobGdrFoG/2JBPU+7bj1oGDNdrLcTNKXX/WN76DlCvWL9qYy9iquV
         RX1oWr6I7AhJ3TuKB4+6vfGzW7ZBQOEJacSgxikjTXCJOHH4gMYQdjMCjzjKwN8NXQ0M
         AUew==
X-Gm-Message-State: AJIora/sYC9J/O49qpKqW1QSFOb9zfVUGz49tLIq5pABDDcAL4EcF+Ob
        MaywaQ6FOPNtRdYcBiFGWM9hclyULAkYfg==
X-Google-Smtp-Source: AGRyM1uUNBzlqa+eRg79c4zphI886hA7vGx8j8GA62jnmV2U5UdRidnlfYZUfKxTntxitQF3Ies2VQ==
X-Received: by 2002:a9d:198c:0:b0:60c:7ecc:5c19 with SMTP id k12-20020a9d198c000000b0060c7ecc5c19mr8638762otk.160.1658029687487;
        Sat, 16 Jul 2022 20:48:07 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e65-20020aca3744000000b0033a169f9282sm3004515oia.52.2022.07.16.20.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:48:07 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] i2c: qcom-geni: Use the correct return value
Date:   Sat, 16 Jul 2022 20:50:25 -0700
Message-Id: <20220717035027.2135106-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The introduction of GPI support moved things around and instead of
returning the result from geni_i2c_xfer() the number of messages in the
request was returned, ignoring the actual result. Fix this.

Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 6ac402ea58fb..3bec7c782824 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -688,7 +688,7 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	pm_runtime_put_autosuspend(gi2c->se.dev);
 	gi2c->cur = NULL;
 	gi2c->err = 0;
-	return num;
+	return ret;
 }
 
 static u32 geni_i2c_func(struct i2c_adapter *adap)
-- 
2.35.1

