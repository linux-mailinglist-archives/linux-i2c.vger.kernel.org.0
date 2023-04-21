Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB91E6EA4DE
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Apr 2023 09:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjDUHeF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Apr 2023 03:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbjDUHeE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Apr 2023 03:34:04 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A406093CC;
        Fri, 21 Apr 2023 00:33:35 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-94f910ea993so171079966b.3;
        Fri, 21 Apr 2023 00:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682062413; x=1684654413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGwnlKy2Sja27XE0ZBomwxPY6V53HKBwQXmqryvAafY=;
        b=ET3ZA/RAkN7yG/zkgqutVZFIvB6S8meood0Wt6uFgi7Ec0YsGXzXCyf5ci4kbxVZYV
         VRdMeRy3bZYP38EJi6C/bZx92BCKPVGFsgzQT0jnBIxSlHe66pIZk/ORNMoHdLyXurH5
         a2L4+nowY/OLW2/Ym3Cwm81HW0Orwe4udOPdLTwPypfiOoRjy6zGTuUsxloJAmh74qNs
         i24cgBi1ckkV1QZDdh1ek8y6/O2ckjYnRmuaFHc1o8M6qmgWCKzBExxiyXHcSXk0aUh8
         Vm9MErDH74avZqhTpVT21ZJ8BDoE24XYRfetDBne0P/Xijwo8ObOR1wtiHuu2oz3UJGD
         cI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682062413; x=1684654413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGwnlKy2Sja27XE0ZBomwxPY6V53HKBwQXmqryvAafY=;
        b=ZgOidc/IP9EKMZpQhlLhIu4C5FRgHHHGv2zQB0hBF3zL7Mm8VzaiGiQxIwZg76ul7D
         U5lh4TJV+txqxxk5g3Mi4+MOKwyhk/pSpQy7Kucby8toTkAX0oogEmotEJywULOf5wXS
         iFZSl9MtYsXXFqgUxG7Sm89ZrXFBAY7ngmW814igHv9kHrdC3V30a1Au4M5Wcyeet7ac
         26Bu5dEQwpEi4oFCHTDiMX/Y2m3iRzTR1pUBaCbKPKtlFfuYx8LIDyq6zm6nm14ir+e8
         IZVjTdsMVdvb7FzmKztkjPjH51nIrQeMeq4BGaUdacgQkP4WI4urXccw2leD2Gng/VNd
         k48Q==
X-Gm-Message-State: AAQBX9da4qs8kK/LOpUCyu4ThXl6LDx3qswhHnkiL8yiQ6KbOQJ4kcUt
        I9RrYnnaPHzClDCEoKA3rPQ=
X-Google-Smtp-Source: AKy350YJ8Aa/CHQ/wW9SaESeihBVmiXqak1Loi6EJomlWK2IE579AGneOdV0Qc+iSyhNPvBaz/+nKA==
X-Received: by 2002:a17:906:5a5d:b0:94a:6071:d613 with SMTP id my29-20020a1709065a5d00b0094a6071d613mr1305761ejc.64.1682062413271;
        Fri, 21 Apr 2023 00:33:33 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id jy7-20020a170907762700b00947740a4373sm1710568ejc.81.2023.04.21.00.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 00:33:33 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
To:     lee@kernel.org
Cc:     bbara93@gmail.com, benjamin.bara@skidata.com,
        dmitry.osipenko@collabora.com, jonathanh@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, peterz@infradead.org,
        rafael.j.wysocki@intel.com, richard.leitner@linux.dev,
        treding@nvidia.com, wsa@kernel.org
Subject: Re: [PATCH v5 6/6] mfd: tps6586x: register restart handler
Date:   Fri, 21 Apr 2023 09:32:50 +0200
Message-Id: <20230421073250.1203077-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421072507.GK996918@google.com>
References: <20230421072507.GK996918@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 21 Apr 2023 at 09:25, Lee Jones <lee@kernel.org> wrote:
> The confusing part for me, the reader, was that both say "will take at
> least 10ms" or words to that effect, but they sleep for a different
> amount of time.

Yep, got it. For the next version, I will rewrite to:
"Put the PMIC into * state. Data sheet states that this takes at least 20ms.
As this is board-specific, add some buffer to prevent the timeout error."
and change to -ETIMEDOUT instead of -ETIME.

Thanks!
