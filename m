Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F25016D3D92
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 08:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbjDCGuY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Apr 2023 02:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjDCGuX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Apr 2023 02:50:23 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0DE2727;
        Sun,  2 Apr 2023 23:50:20 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id n14so27338425qta.10;
        Sun, 02 Apr 2023 23:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680504619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UY7uVDKavnayiHsQEjZEIVpvQWztlTClif0OZXNLtJQ=;
        b=YHXAtup2LEtNpxWLo4CQ2SLwadUFQuQOszkc3qRBVI4DoIbAGcRZEs40NdPhwvp7CY
         EDRpvksBm6tMNFaHqG1EKq/UkFgtAZE70gw9W3Jh64LRGGQkbewJon7Vp/gCl7i1hmmq
         L3gc2OM/SiAXxFFDTeIB3DNbgb8RI0uvxR+4xHGhogZe36zUKlzWfNAAUw8fSWisT2UL
         H5bBd379pL9RNS/NOqng6DbLVVBPOmGe5iQI7XOSr4aER+7nMn8Y1VDAvI7WeFYAx7v8
         YZ9gHrW20FJg3MjcZoeQ9AzPUDu7TDLPEfI9SdxE7tGZYzefLN69VhJq78oWlloQo/UO
         Yy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680504619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UY7uVDKavnayiHsQEjZEIVpvQWztlTClif0OZXNLtJQ=;
        b=WhuNyT4/imuAIrRVlB7Y3tNf3S7BqDef8Zrjsk3IihdqB/eLhx2HSfXlOrdfO9spIK
         cpep/82R0jkFAAMgX3sC9X6Iqcwx4veO+TH/HW0Jz8L1SOs7hEjHKYJX/Nqu0npQTNif
         kV2k7adphNPW5UDDcAbGGVgAQ0ntiDbIBEXPwTRYYmAvFX++gKELOmLrZsQBa5tiTeUl
         1i0d7dUsg5LHDfJCimKSuu1csHOblCdpmvQ7Dwuxu7AOwYbriZfWpOkmRnVQZEofUAxv
         m80JMKkcY4p223jaWLZVpnxE2eWd37enxRcSrKLlZLGBkkPTVBnO8lrPtZKEqhDUYsPl
         KMbw==
X-Gm-Message-State: AO0yUKVv7Jefl0xG4PW0EMmvDtJk3pVBguKKOvmKi1vS3THtpRLNIfB5
        7NNoGiE0Yz5wcbKKfDr+tOM=
X-Google-Smtp-Source: AK7set9M9SUD7QQ3peFVgNl8rJ4f7gXXjOnpkvefFqRWiS+AQHrpCwPjMXzZfPhpBOskHm66i45zcw==
X-Received: by 2002:a05:622a:1983:b0:3e0:3d65:19d2 with SMTP id u3-20020a05622a198300b003e03d6519d2mr57959747qtc.20.1680504619179;
        Sun, 02 Apr 2023 23:50:19 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id d70-20020a376849000000b007467a4d8691sm2569782qkc.47.2023.04.02.23.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 23:50:18 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
To:     dmitry.osipenko@collabora.com
Cc:     bbara93@gmail.com, benjamin.bara@skidata.com, jonathanh@nvidia.com,
        lee@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        rafael.j.wysocki@intel.com, richard.leitner@linux.dev,
        treding@nvidia.com, wsa@kernel.org
Subject: Re: [PATCH v3 4/4] mfd: tps6586x: register restart handler
Date:   Mon,  3 Apr 2023 08:50:13 +0200
Message-Id: <20230403065013.520339-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6abaa803-1639-b949-3af5-05a341f9b459@collabora.com>
References: <6abaa803-1639-b949-3af5-05a341f9b459@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks for the feedback!

The DS states: "When the reboot request state is set an internal timer TWAIT
(10ms typ) is started. The reboot request ends when t > TWAIT."

Therefore, my intention was to wait a little bit before starting the next
handler in the chain. I can do some tests without the mdelay, but otherwise
will reduce it to 15ms in the next patch. What do you think about it?

BR,
Benjamin
