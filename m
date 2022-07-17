Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C10E5773E2
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Jul 2022 05:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232796AbiGQDsR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Jul 2022 23:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232844AbiGQDsL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Jul 2022 23:48:11 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC5217E37
        for <linux-i2c@vger.kernel.org>; Sat, 16 Jul 2022 20:48:09 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id a14-20020a0568300b8e00b0061c4e3eb52aso6683120otv.3
        for <linux-i2c@vger.kernel.org>; Sat, 16 Jul 2022 20:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9yMrdTNz9TTOLl7s7jHHhG7B/YYZk6CJYXUwzk1dI3M=;
        b=ojxV7iM7RNRpmnF4Ddf3tRMA1d3afYJgBfK4CQcHVm151J/5qSdRUhgeia5Y37HgpO
         7C8Ut3XvMa80UdS9jOM/9WM9KRJJCoA+YI3PM0vZMlQYLlci1exQS9pwLtXnaeZFimk3
         6xd6MDz/nFA84xmZSZdxKqp0diYVF48+bxdLeUgnXowp/Z4w1N6CG9DxlL3Z1MYyXRhp
         zEtsOYro6cjT06H6vLkzKlTdvzK/Bm1qVXjcbrwGJi4mZVQDh3QO6euzx2TDkJ+zzNtz
         F8snJuW98CVRqUzXcM67xfDmQmN0yoptX29ZSRDZyENwXsOrWnl2EOsJdtowtXw4HoZP
         QriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9yMrdTNz9TTOLl7s7jHHhG7B/YYZk6CJYXUwzk1dI3M=;
        b=GpBK6XB9ubMpac8juazTBJsxZv5BfdD1lUkk03CYfjdLXQ5+8ilFGz+LMXg1/aZYqr
         LAcn+CDcM4R2IM1E9lDO/DbfXnAr80zMI22WbCUHzYqtzHOsJ2B2LdloObD6NOHa3MVI
         kGFTDH8pMZRiGh+75ZOrx7IHTbKAew1ikPwJE48CsWoSwGmVnQe+qlfe3wROD7rxOZnk
         cbrgoGJzOb1tXMPYeuO0KP9KzhwWNDVD0kDEuZ5m132pgPCLuVjLd9Gkryubtvj9Y2fY
         XfyoSBYSDzkidZb0jhCuBUQ/qR2Go0oAxGbQdRAQTAN+ECoxMGihM3yOVBpiaosInkcs
         Z1hw==
X-Gm-Message-State: AJIora/6LrTnHJxcCYjwp2QJagjRde8h1LZMYX7mhXewTj4zf7ad1Dt/
        IBEffI22rWnkxAECz+88ZEdE1g==
X-Google-Smtp-Source: AGRyM1sgyhUmhZEF6CCSDj84K5hnyMkfRoi9L85LXbJYYnWZwIhGZwDNCqTTANv1CNtXtXju7yL0iw==
X-Received: by 2002:a9d:2602:0:b0:61c:30c1:fa03 with SMTP id a2-20020a9d2602000000b0061c30c1fa03mr8841527otb.86.1658029689329;
        Sat, 16 Jul 2022 20:48:09 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e65-20020aca3744000000b0033a169f9282sm3004515oia.52.2022.07.16.20.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:48:08 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] i2c: qcom-geni: Silence NACK and GENI_TIMEOUT
Date:   Sat, 16 Jul 2022 20:50:27 -0700
Message-Id: <20220717035027.2135106-4-bjorn.andersson@linaro.org>
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

Turn NACK and GENI_TIMEOUT into debug prints to silence the kernel log
when running things such as i2cdetect to scan the bus.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index e212e7ae7ad2..6ac179a373ff 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -208,6 +208,10 @@ static void geni_i2c_err(struct geni_i2c_dev *gi2c, int err)
 	case GENI_ABORT_DONE:
 		gi2c->abort_done = true;
 		break;
+	case NACK:
+	case GENI_TIMEOUT:
+		dev_dbg(gi2c->se.dev, "%s\n", gi2c_log[err].msg);
+		break;
 	default:
 		dev_err(gi2c->se.dev, "%s\n", gi2c_log[err].msg);
 		geni_i2c_err_misc(gi2c);
-- 
2.35.1

