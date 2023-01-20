Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 968F9675575
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 14:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbjATNSk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 08:18:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjATNSf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 08:18:35 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5DFC41D5
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 05:14:52 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id u19so13819399ejm.8
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 05:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sG3PS8nuni6BtffOEZijtC58vcZHCox57Y1HsnncO6g=;
        b=CiQw79VRaVPPwAXmSYsAJg9G88x6kGxDTJPi/mZf7Hbw6RtuFKFjxBb3K2bBQYA7AH
         dBZhCHB7NryJhy4vXXXU/ON4COaY/Pd0Ssvnhy+B/oOovDwMRcrsEEE6ykROltaW82mT
         YPEjdjTYzJtaePAepi3sXDkAd3gsWy7nt08eGi1NbVq/mdzMkP9bGXjam+d7u5cEOorc
         1v/I7t+0iw0KYrLHEda8+AybPunrbyNEUN+NQc1xqu0MSZlzwcw3Nn2uSx8VbVuSZtXl
         g0+riJ6NkhUN5Iv0ktkAs6YvTQDTZsxyPFsdimAfDLgnTclmeAcZ8jjdPUwSgS0jhFYv
         nDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sG3PS8nuni6BtffOEZijtC58vcZHCox57Y1HsnncO6g=;
        b=IQ3v0sFpe34CE9kxVeKQs70OupBmlo0l+nBK7A5O1iKFpQQWfIQYGw+yg1rQItsI+6
         CRxwj7SYEQTcqfB+bUTLQO+89uc+NPBfwj+i8O2p7/oatYJCeHwhXwKEHL0BXDwNSVyt
         WoGfKME3bskPhvlnPsVheZrB/rpOgwH9gDsAQITGzDIRmMNcPKYreRD3W6xQz/PJFFo9
         Q9L6Sv2FM8yRCrm5WTGb53CIWM3Vqkm0IyDCqfJ2cJsW+Myaz3l/2bcX8A7991OPpHWQ
         N5YibXXBa86RIuk7TR7SfQJznVqhCfNQqmC25tdtArIrJzU5CyrTpt/0keAC/4qjCQkX
         MXmQ==
X-Gm-Message-State: AFqh2kqLB02hntzsxWzDAzQcUO1w3uPylQ3DbxXHC4nDgnsbAjR/mY7d
        mywPgCHf0S+fCrj4BocWClMpGgHutEVhIU9Pzumm3g==
X-Google-Smtp-Source: AMrXdXvwteo+cNreaAuqxl9/M1U7opM9iKY723pc0eH80ss0mePHE8BnN7fzg8jcQMU7uLf3gR1FQQ==
X-Received: by 2002:a17:907:cc03:b0:7c4:f8fb:6a27 with SMTP id uo3-20020a170907cc0300b007c4f8fb6a27mr25051938ejc.0.1674220491112;
        Fri, 20 Jan 2023 05:14:51 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709061be100b0086f40238403sm8063276ejg.223.2023.01.20.05.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 05:14:50 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/4] Add CCI bus support for SM6350
Date:   Fri, 20 Jan 2023 14:13:43 +0100
Message-Id: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIeTymMC/22NzQrCMBCEX6Xs2ZX82KKefA/xkGy3ZqFNSqIBK
 X13g2dPwzfwzWxQOAsXuHYbZK5SJMUG5tABBRefjDI2BqOM0UZbLMtge4VEgvbs3aQvjth6aIJ
 3hdFnFyk0Jb7nuZVByivlz++g6hb3v1tVo0LuR0V2YEWn6TY5yWtIkY+UFnjs+/4FYvniXa0AA
 AA=
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
        Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12-dev-78462
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the camera clock controller node and CCI nodes to sm6350 dtsi and enable
the i2c busses on Fairphone 4 dts.

This is tested using PM8008 regulator patches from the lists which power the
cameras, and using i2cdetect/i2cget/i2cset reading the sensor ID registers.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Correct ordering of attributes in sm6350.dtsi (#*-cells, pinctrl-names,
  bias-*)
- Link to v1: https://lore.kernel.org/r/20221213-sm6350-cci-v1-0-e5d0c36e0c4f@fairphone.com

---
Luca Weiss (4):
      dt-bindings: i2c: qcom-cci: Document SM6350 compatible
      arm64: dts: qcom: sm6350: Add camera clock controller
      arm64: dts: qcom: sm6350: Add CCI nodes
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable CCI busses

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 141 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  20 +++
 3 files changed, 163 insertions(+)
---
base-commit: 1578f85d549045aac441821064e7953732460e51
change-id: 20221213-sm6350-cci-38baf19ace3b

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

