Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C03217B4BD6
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Oct 2023 08:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235596AbjJBGzs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Oct 2023 02:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235608AbjJBGzq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Oct 2023 02:55:46 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15345FE
        for <linux-i2c@vger.kernel.org>; Sun,  1 Oct 2023 23:55:37 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-53627feca49so6509221a12.1
        for <linux-i2c@vger.kernel.org>; Sun, 01 Oct 2023 23:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1696229735; x=1696834535; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6TmZaDBDxO0hHoZEZr8vY6QJCzw/w5qiVJzIJjc+03Q=;
        b=gh8evyg7LTBFE/MtDbQ/FDsy2BaFYbdeLieBK3K5JCJnsk3cB6SfgMD/BtTnYOBFSC
         UgAG8pxk8XqmgNC2lv8CdqDlxpOdMHKQB4YNrXuWFuNIKhS1y413S07vqNJ9UHRdH35V
         jHrBdzh5xmH1i9yWgbYEHQjPC5IKoNFxyy4Hd1SjnczBm9B7qxkKMrIC9kJs7lHH2ynI
         2EYblX3EMquxDuC07GhUla3MCA3huEdXMUn2TOcid7iJ0zJMLBgTsdgtAYv4xnHOSHdL
         vUnSVlyVqayaEbuir2QcDpRhpvyYYcTKdj/FiS5T6GiumpTARY1vhXLtwccQ/k7TmUUo
         wQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696229735; x=1696834535;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6TmZaDBDxO0hHoZEZr8vY6QJCzw/w5qiVJzIJjc+03Q=;
        b=gvSliHbQB+SZ3jJnoexdd4mdh80xQ+5fMGkKUAXpxhYyG2cRyUUUe+gyp1k2weEMjA
         f/d3mcsA6oR8v6mniZz9Zb+9YpPFKrYh6skxCS3KFSsRUKxfRwstE8ntmXYZcsV7UL9W
         BJCaFAn9gi5+hM39ysJ8Xo/Y+zuHZPvU/e2rAeRHPmZIlTxXOjkDuDhnyHifv6CMlLdQ
         132Copxbp17UPZ80eGavk8NH9LXOTqyqTt+nfrAdtsP25mr8RMcOVstwqrtWPmqN+Ar/
         QZEaU3efstdllsDemeLVpi2WhDdWjWwn3zsA6VE0FTcChbVHMwhj8v9aajY634Dy86gC
         kGOQ==
X-Gm-Message-State: AOJu0YzoMKn0a0ZMNb4L8ygWIlQSn0dLJkr2kD1UqUkk0EOiung6Cajm
        2sx9pl1r3GaCJWTC5EFeWrnVhQ==
X-Google-Smtp-Source: AGHT+IEUGtOCMmgcR0BCOahEbNFl+eAJX7leRq9uLmPsxekK64pJOcOV19ddoTOmQONEc8PrCoV/CA==
X-Received: by 2002:a05:6402:cb1:b0:538:ae5:6138 with SMTP id cn17-20020a0564020cb100b005380ae56138mr4526438edb.34.1696229735452;
        Sun, 01 Oct 2023 23:55:35 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id m7-20020a056402050700b00537f44827a8sm4095557edv.64.2023.10.01.23.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 23:55:35 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] Add CCI support for SC7280
Date:   Mon, 02 Oct 2023 08:55:29 +0200
Message-Id: <20231002-sc7280-cci-v2-0-9333fda4612a@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGFpGmUC/23MQQ7CIBCF4as0sxYzUAPUlfcwXTQwyCyEBgzRN
 L272LXL/yXv26BSYapwHTYo1LhyTj3UaQAXl/Qgwb43KFQjTmoS1RllUTjH4qInpGD9ItFAP6y
 FAr8P7D73jlxfuXwOu8nf+pdpUqCQ2hk/Wh1Qq1tYuKwxJzq7/IR53/cv2eza66gAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the dts nodes for the camera control interface found on the SC7280
SoC. And then enable the CCI nodes in the Fairphone 5 dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Add missing clock constraints in bindings
- Drop enabling cci nodes on fairphone-fp5
- Link to v1: https://lore.kernel.org/r/20230929-sc7280-cci-v1-0-16c7d386f062@fairphone.com

---
Luca Weiss (2):
      dt-bindings: i2c: qcom-cci: Document SC7280 compatible
      arm64: dts: qcom: sc7280: Add Camera Control Interface busses

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 136 +++++++++++++++++++++
 2 files changed, 138 insertions(+)
---
base-commit: c858197a69efe69e1607f4854af42ec338e54e96
change-id: 20230929-sc7280-cci-4690ef8da107

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

