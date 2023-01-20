Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79232675324
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 12:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjATLMd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 06:12:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjATLMa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 06:12:30 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D607808BD
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 03:12:28 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id bk15so13023393ejb.9
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 03:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2RXu2CTf5qqejj8lbgLBVRfpf8P5U0FJ4fIWSUv6pnU=;
        b=stX3538Eyi9291zlurX4ljF3jqI6Nr3N2fsHoJKaQLpUcfQldpvxYHSefLVREEOExx
         4APxPs1YH/PhmSrTN2jjpLyzyqCkrSURucrwtfX/D0wKIdBJEB4rYCKDldQNCoaCxIdA
         uG8eUAsO2TGsSfVXgjp/DqbGZXxvEs0WRw1si4jc3HZ0UCqdT+CPQnLKs9I8m/ag82pH
         2AuN5pdAwtsZwq+rYT6PtYC4dFZPL+NHm1hEEJGwc4bfo33ZhgAxDmE11RfpOl6i6gfc
         S3Jpc7Glgfnh6pz/7t+fA7aN5nBJPSRB3SaLP4HzwR7V6iqePM/O3vNPY3szI632bwLK
         DY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RXu2CTf5qqejj8lbgLBVRfpf8P5U0FJ4fIWSUv6pnU=;
        b=C+5qVuPOFtFD4j8bHrLjNSnT+sjv/Id4Mew8bnvoKnYihr8Owe3q0bNCToDZlMjecT
         8vpQuzexE36VpFrb7ZBCwlZDbtDNRWS7guMZh+p0Ri7Epqv79/LzwWlZHr86/rDOZUnO
         b39y/9blzlzPvj8xE9DgpvUVHs7ir7g9hRejgaasomcqyxuyiqi4dpm6Oq/Isk1u6mt7
         HVXHYFQIme36oJZBWlBBKf/AcCtHzx74qGxRm2pRSA5xRKHLQHM6f9N1SIwDwwFVAQYF
         gBjx4jxvik86jvbUm4JFpkxDHZE7tPEjTfVrvg6hpJWTU8c6LjiSUiz+S+7R9WpVPGs0
         nyxA==
X-Gm-Message-State: AFqh2kqSppcD5LzTF40N+MrdSHg5cg5lpXwlJ2eohbOQftTDBxixQIJp
        qOu5hTjIJuGlzhtKfphxxK0dgg==
X-Google-Smtp-Source: AMrXdXvfUH6HAo/MBe66mt/NA7W75XIbcII4n4yAGpx/0n5qQ2QbdK1OFAiODowDr111N2f95NYHaw==
X-Received: by 2002:a17:906:a0ce:b0:86e:7683:422b with SMTP id bh14-20020a170906a0ce00b0086e7683422bmr13505335ejb.68.1674213146831;
        Fri, 20 Jan 2023 03:12:26 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id du1-20020a17090772c100b0084bfd56fb3bsm17667492ejc.162.2023.01.20.03.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 03:12:26 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 20 Jan 2023 12:11:54 +0100
Subject: [PATCH 2/4] arm64: dts: qcom: sm6350: Add camera clock controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221213-sm6350-cci-v1-2-e5d0c36e0c4f@fairphone.com>
References: <20221213-sm6350-cci-v1-0-e5d0c36e0c4f@fairphone.com>
In-Reply-To: <20221213-sm6350-cci-v1-0-e5d0c36e0c4f@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.11.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a node for the camcc found on SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8224adb99948..300ced5cda57 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1435,6 +1435,15 @@ usb_1_dwc3: usb@a600000 {
 			};
 		};
 
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,sm6350-camcc";
+			reg = <0 0x0ad00000 0 0x16000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm6350-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x64>;

-- 
2.39.1
