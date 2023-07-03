Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 210F47463CF
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jul 2023 22:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbjGCUPo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jul 2023 16:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbjGCUPl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jul 2023 16:15:41 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 803CEE6A
        for <linux-i2c@vger.kernel.org>; Mon,  3 Jul 2023 13:15:37 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f95bf5c493so7275643e87.3
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jul 2023 13:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688415336; x=1691007336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+0Um8zkakhdQHFaLy4JG6zS9o5SW/WZINmwineS6iY=;
        b=oIno9YTSJcr2s/iZYSWkADwp8wpZZgE2zikU0u4uKaZK7P62MuSX1H4Okij4uEX8Gj
         giXa9VPCekrlpz5n+CZD5IaHPsMJg0PWa7zFklrghaKmvdEj4LCu8yFvAu57ypdXZkMU
         4usoBTqyKAbZxmGk5P2Mnfw+kkkAXtVV3wN/NIcRv0sUtZ8uszPu3vpG2muPEBf89zhC
         9nfHOgNKaaZB1mKDzg8UDz4NmXK9SOVAg0hDX/rEpgXW6XED+tjMggSCULh4vAKjf/8N
         Znw+o+AzHMTmBygXFgye73CcCI0dNfxR568nj9zB+azvGFEWgsSjq3DQz2GLodD/KOR7
         axLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688415336; x=1691007336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+0Um8zkakhdQHFaLy4JG6zS9o5SW/WZINmwineS6iY=;
        b=EevPSpxZyv8oQpx7QVsXO2Eg2/K6QCCen/LDpDk/nvXLgWXxTT+ZZQfBttUg8GmHIJ
         47+XpEh2cfc3v8erm8XMKWzV5wHbOBQpRfT8LBbv5unDt3SvR8IUn33r8BLa38Ca4Q95
         hQU5HH9zoKB3wpZ2qg/31tQ6513vmVg/36J9XXEbYv3AxiQZ1Vhm9z9OAoLRygJUwn1L
         vLm/7AoT2Ih6GLH4RvxTck11TKlr0DXBiIzOiWyxURoywelqW46q1kUseCqPfe2UMgIj
         YzOXbcDXE1UnqeJHsVqo3HnnY+kJqe/erWiHsToMkp1RSDtl4YnetaAX3Tmi6Mt2aWpX
         NNqg==
X-Gm-Message-State: ABy/qLYlweZfmkZYfyItFmPwtEVJBMKYQFL81051Phb9jX1cq9sfjumG
        nGsnxOz6phSZCok1gitpnN5v4Q==
X-Google-Smtp-Source: APBJJlG5QQvvhnO7g/GSNHkZIMR2UvS/wvgZpurNTkaQTkdgLJI0pMd9FM8cmNOy4/pwpr85zP0ajA==
X-Received: by 2002:a05:6512:3b85:b0:4fb:7447:e71a with SMTP id g5-20020a0565123b8500b004fb7447e71amr9811909lfv.63.1688415335807;
        Mon, 03 Jul 2023 13:15:35 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id w27-20020a05651204db00b004fba7edc6cesm1991365lfq.7.2023.07.03.13.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 13:15:35 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 03 Jul 2023 22:15:26 +0200
Subject: [PATCH v2 2/4] dt-bindings: interconnect: qcom,sm8250: Add QUP
 virt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230703-topic-8250_qup_icc-v2-2-9ba0a9460be2@linaro.org>
References: <20230703-topic-8250_qup_icc-v2-0-9ba0a9460be2@linaro.org>
In-Reply-To: <20230703-topic-8250_qup_icc-v2-0-9ba0a9460be2@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688415328; l=756;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yyzfqYZ10PKIe62KfbudaQ05rBY4VRIJaeEdNY1khEY=;
 b=HWANWfdD0EIElBwKwBgOmfuYoYX+pCwe1CQHmKFdH3hV07lEIE+vuiJ0rAXd1rLXanbPDsIZl
 V3f120n1ZiPDYDXbeG68vy/f/SfgwLhh2SnCvBy1lUkUOuMTln0Hxc+
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the required defines for QUP_virt nodes.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 include/dt-bindings/interconnect/qcom,sm8250.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/dt-bindings/interconnect/qcom,sm8250.h b/include/dt-bindings/interconnect/qcom,sm8250.h
index a4af5cc19271..2a656c02df4b 100644
--- a/include/dt-bindings/interconnect/qcom,sm8250.h
+++ b/include/dt-bindings/interconnect/qcom,sm8250.h
@@ -166,4 +166,11 @@
 #define SLAVE_QDSS_STM			17
 #define SLAVE_TCU			18
 
+#define MASTER_QUP_CORE_0		0
+#define MASTER_QUP_CORE_1		1
+#define MASTER_QUP_CORE_2		2
+#define SLAVE_QUP_CORE_0		3
+#define SLAVE_QUP_CORE_1		4
+#define SLAVE_QUP_CORE_2		5
+
 #endif

-- 
2.41.0

