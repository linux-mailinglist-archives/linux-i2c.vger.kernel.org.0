Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 847425337B2
	for <lists+linux-i2c@lfdr.de>; Wed, 25 May 2022 09:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbiEYHsl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 May 2022 03:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235342AbiEYHsk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 May 2022 03:48:40 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F60C79388;
        Wed, 25 May 2022 00:48:38 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id ck4so35693617ejb.8;
        Wed, 25 May 2022 00:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2AYrAMF95CPo8AD2JvS7RbUi+CKSBPj2EiLmCaRwAeU=;
        b=BWrP+3mdMfbeAHYIP3Sm1ueeCOYZkJi2DdsdtEqe7VEClk6tx4qgmKNVskLquoMlz5
         q7llWA87EWTgd/oMUn7f+829MNufvs2HEvi0CzhAzZqW8sObJnKfEbD2ZPkAOYV4UWwa
         pS581PB9rI7iZqMMpbIiUy0r8Hk3tXbRyvXXWo5gUzsP23x1by3FHtQ69m/a92k7PMF6
         pjP+LNPwCFfDYMLOzq2yQBOwSwncZo7W5k3Qwan6cdfAWFkQyyonB0+UalA1tWExSAtX
         OFXleX79ZnI7aOMufS4hjPljZ/tqXudMDEB6cnFbeGHRHGDFr5MpA5+jMMKeB84QGYZt
         w1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2AYrAMF95CPo8AD2JvS7RbUi+CKSBPj2EiLmCaRwAeU=;
        b=E9TnADONFaCF518Pgetp8nlBcVgB19ZT+cDjtc07Pi3iXOntCs8bZnrGbz3DFCR07Q
         yppx7KoMLVlUXlUEVQq+fAvZ7gMxt4OqzpdclFE9n18/3VspX96tmqio2bq0+HGYm1rH
         QDtmR6qdmE9xCVGLpMSxG0M91rcCpJtbtsdt5VJdpNu2iPAhoKj0y1DZ68x8gley6xA7
         0P0HrqpAVA+Kc2TpRH26dewqxiw0jDU//vMOzFkWyhqkJkgHVPqfMwsod8I/07jHEk4j
         RTeCu7D3AwSv68+JKTv50dvkk4MaMrRDAjw2jGcJMAjKj4guZ+ykHxiYObOw2Ki3WU88
         ELnw==
X-Gm-Message-State: AOAM533Gkio2pxyaCNKa7J62+YcfWV2PTn3u9x2pxN2ZDYxRK3foHHez
        QuE7ZAJ64WtlPcExMU1eR7A=
X-Google-Smtp-Source: ABdhPJyy3txtTKRLcUJIJN/8lquQLBSMMuP+BaaBzmN7fVBmrLIOQvA6THIWfe8l1dUw1vcw+5BxfQ==
X-Received: by 2002:a17:907:7b9b:b0:6fe:dedf:6414 with SMTP id ne27-20020a1709077b9b00b006fededf6414mr12921201ejc.88.1653464917491;
        Wed, 25 May 2022 00:48:37 -0700 (PDT)
Received: from localhost.localdomain (109-186-136-71.bb.netvision.net.il. [109.186.136.71])
        by smtp.googlemail.com with ESMTPSA id v1-20020aa7d641000000b0042acd78014esm10230533edr.11.2022.05.25.00.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 00:48:37 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com, wsa@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, champagne.guillaume.c@gmail.com,
        mathieu.gallichand@sonatest.com,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v1 0/5] HID: ft260: fixes and performance improvements
Date:   Wed, 25 May 2022 10:47:52 +0300
Message-Id: <20220525074757.7519-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This patchset contains fixes and performance improvements to the
hid-ft260 driver posted for review and feedback on the GitHub
https://github.com/MichaelZaidman/hid-ft260 about three months ago.

Michael Zaidman (5):
  HID: ft260: ft260_xfer_status routine cleanup
  HID: ft260: improve i2c write performance
  HID: ft260: support i2c writes larger than HID report size
  HID: ft260: support i2c reads greater than HID report size
  HID: ft260: improve i2c large reads performance

 drivers/hid/hid-ft260.c | 230 +++++++++++++++++++++-------------------
 1 file changed, 120 insertions(+), 110 deletions(-)

-- 
2.25.1

