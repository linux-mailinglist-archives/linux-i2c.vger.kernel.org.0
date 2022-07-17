Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A266A5773DD
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Jul 2022 05:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232865AbiGQDsP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Jul 2022 23:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232421AbiGQDsI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Jul 2022 23:48:08 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21BBF17E2E
        for <linux-i2c@vger.kernel.org>; Sat, 16 Jul 2022 20:48:07 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1013ecaf7e0so15702106fac.13
        for <linux-i2c@vger.kernel.org>; Sat, 16 Jul 2022 20:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=21HY6wtQkPpfHZFWbTa1qvE3zEmY6IOji3PebPAf2LQ=;
        b=bXo2IQlDVKcOFaIH1yTcLSmJgZp7Kecvs+uL31en3QWnmh+vQxvOYgRdAN9+BD2cb6
         zrA2sBxbony9HyHcTYLVAuMn6njcPP1kb7ynSX9faXXxqVjbqyN8ZlSM1Jm0kmHd9IPp
         wcmfWaiIb3BdZfENiEo5UGOVXLXaKE8fyTJNK+DxDGDo2L+qZn7UdvVyjKaxIKLGjioz
         0EVcjFa7/DM4gr+LWir8I842j3evv/7KHOD0vxcuc37FkzFPQ/L0z7qXm++r4DKMY2Is
         fTXJztpomi7COkPo1P9vbvQZVcjbJ+tepYIQ2w1Hnwe6/A0oPK1/tZhOfec2iAhSpEvX
         mVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=21HY6wtQkPpfHZFWbTa1qvE3zEmY6IOji3PebPAf2LQ=;
        b=DvpLijskSrT/A1ZTmpJPwZsv+6O9BQpkhr0edsE3B6GVN/YCg2vRIlQKUo8okYyD1I
         SaxXUTBCNGgyUhUziYWB8D2sdHQ/7VwcJIjtIKAD5heUrG9FKq8sJD9V22VA1XSHOjHx
         Z7JGlV02QbfSO05iUGYatNESM84kKRwhJ3cC6aCSD0dEV8Oj8qnqfEVNTXZRTgJApU1U
         l3W1FNPIodqMWoQUz4zd+vPDjlFteU1Omn99tvw21MOHA/Uxi5fAnzuDvtFzwCOXTJpO
         fNmSfhJZVu3Yr6xvtATDE+1kOLbA884qYe3Ly6Q2U1ugjSI/WXzqNJgJTpwkxACPhX1o
         20fQ==
X-Gm-Message-State: AJIora/BJ5OfCBTHMc/70tlEXNUE1Z/EfBaUSulR0s656WdM4CPacbfc
        LA47cQXhSWJ4FC34L+uenYmEhw==
X-Google-Smtp-Source: AGRyM1vUXPqKpA3j1kJ9W3eCSQbkpxW5XsuAg+p2hZ2dj/OQ74TkuMJpU/O6VVmho4mMOW7a14HciA==
X-Received: by 2002:a05:6808:23d4:b0:33a:1441:bf0 with SMTP id bq20-20020a05680823d400b0033a14410bf0mr13921813oib.26.1658029686511;
        Sat, 16 Jul 2022 20:48:06 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e65-20020aca3744000000b0033a169f9282sm3004515oia.52.2022.07.16.20.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:48:05 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] i2c: qcom-geni: Make it possible to run i2cdetect
Date:   Sat, 16 Jul 2022 20:50:24 -0700
Message-Id: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Attempting to run i2cdetect shows that error handling in the GENI I2C driver
could be better.

The first issue is that errors aren't returned from the driver. Following this
is an issue that if a timeout occurs the current operation is aborted, but the
abort code races with the isr so the abort times out as well. Lastly when this
happens, the driver is quite noisy, making it impossible to run i2cdetect on
the serial console.

With this series in place, I was able to run i2cdetect on the db845c and two
sc8180x devices - and get useful output.

Bjorn Andersson (3):
  i2c: qcom-geni: Use the correct return value
  i2c: qcom-geni: Propagate GENI_ABORT_DONE to geni_i2c_abort_xfer()
  i2c: qcom-geni: Silence NACK and GENI_TIMEOUT

 drivers/i2c/busses/i2c-qcom-geni.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

-- 
2.35.1

