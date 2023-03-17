Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E50EC6BF193
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Mar 2023 20:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjCQTSu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Mar 2023 15:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjCQTSt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Mar 2023 15:18:49 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10081DCA40
        for <linux-i2c@vger.kernel.org>; Fri, 17 Mar 2023 12:18:44 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id r4so3260189ilt.8
        for <linux-i2c@vger.kernel.org>; Fri, 17 Mar 2023 12:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679080723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNyqPnjPM6N9FSs6YBQxZ2x4/vS8WMo8VSoqSexsTZk=;
        b=BHx3Zy1PVjKo0fBmpJ6/8Z+06pjd45FyUK9csS3AxNrD19etcpUppie58ByAzXPKKf
         zo5y4bRQZGPQI4pPcWZND85bOuIqREQS3V0X5hsEurdwsco1EbKG731fdoYekmsamDyx
         Eho9WTRU0Obv4A2Q/jxJE+BKYAjAXoWQgRoCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679080723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNyqPnjPM6N9FSs6YBQxZ2x4/vS8WMo8VSoqSexsTZk=;
        b=0GN+pdBnaTiIbUOToL04D80WP9zpgFJAwSt036VijE3QQpnDYXBB/MaL4jzn7EjFuQ
         8wHoPzeDQziOl14UrefwIdHMWtUvbG9itJ9UGA4dL6PjS9d0jodwunKFXelGFHoT0yPG
         qWdewf7KFIOV4jHX+XGpIcMD1929+yQu7ydUIxYhy+QPs+0wjOSuJRAJDapC5yMte6u9
         cc0HB9E7UzHhWpHiM6xtbcABHaFDUyTv6jTxwxbRaSWzd2p+Yyib8pWhDQH2F47wQyce
         nWtivmEX0jAbaFnwu/nNR8gn23HHYpj9gpMiQiTMLzMB4cfabAPRSZH6mke3rEAhmMtC
         GTFg==
X-Gm-Message-State: AO0yUKWNf65+kfqfRJGsPHQi3gBKixoHGwA/zntaJQCtTGQysG6zfJa1
        tH/B+vQuSwndP/j2sGv3KbTuJA==
X-Google-Smtp-Source: AK7set9chDGhcsD/yWOUfEXjdOD46c7r6BRZzFv5h9gUYsgKbDj51dORwteGVrWLT/AX/I9Yax6quw==
X-Received: by 2002:a92:6b06:0:b0:316:e6e4:570b with SMTP id g6-20020a926b06000000b00316e6e4570bmr308718ilc.11.1679080723406;
        Fri, 17 Mar 2023 12:18:43 -0700 (PDT)
Received: from markhas1.roam.corp.google.com (174-16-151-48.hlrn.qwest.net. [174.16.151.48])
        by smtp.gmail.com with ESMTPSA id g8-20020a056e02130800b003230c7d6a3csm805813ilr.67.2023.03.17.12.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 12:18:43 -0700 (PDT)
From:   Mark Hasemeyer <markhas@chromium.org>
To:     jsd@semihalf.com
Cc:     andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        mario.limonciello@amd.com, rrangel@chromium.org,
        upstream@semihalf.com, wsa@kernel.org, dabros@google.com
Subject: [PATCH -next 2/2] i2c: designware: Add support for new SoCs in AMDPSP driver
Date:   Fri, 17 Mar 2023 13:18:34 -0600
Message-Id: <20230317191834.186690-1-markhas@chromium.org>
X-Mailer: git-send-email 2.40.0.rc2.332.ga46443480c-goog
In-Reply-To: <20220916131854.687371-3-jsd@semihalf.com>
References: <20220916131854.687371-3-jsd@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-	/* Status field in command-response buffer is updated by PSP */
-	status = READ_ONCE(req->hdr.status);
+	if (req) {
+		/* Status field in command-response buffer is updated by PSP */
+		status = READ_ONCE(req->hdr.status);
+	} else {
+		status = psp_smn_read(PSP_MBOX_CMD_OFFSET, &status);
+		status &= ~PSP_MBOX_FIELDS_READY;
+	}

The value of the mbox cmd register is getting clobbered by the return value
from psp_smn_read. This can cause bus arbitration to fail as the driver will
think it can grab the bus when it's actually in use by the PSP.
