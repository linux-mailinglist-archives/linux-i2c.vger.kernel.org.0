Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 691A46ECBC8
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 14:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbjDXMIC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 08:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbjDXMIC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 08:08:02 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20171F2;
        Mon, 24 Apr 2023 05:08:01 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-94f4b911570so627432366b.0;
        Mon, 24 Apr 2023 05:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682338079; x=1684930079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmddoLYvCrZv1MC7Bp3ofoIZr5sc+qWYnHRXko8H0X0=;
        b=eB47Y0UCBp8S8qbwzeSOlc6qVVUEqSWthYWnnlSsAj2vLBGJ3NM9MJxjC8sSXRijrs
         /g4rnl55w+aXZ8t1HJ/llqzRRB01xCRr3EPvlB+t+PQU//7Mjpq4KU/COmG041ixAeEJ
         meL4vM9PMead3qBsCfVjF2ZS7sSiCofewFiiT4o6l0TG1ekq4q/glneuijHa/Yd1EgSk
         MgS8/TUDAzw+0DfHrEdQbFfFT8StwkiapHH426I2bEmwH142SDziKbk2eeYWtlGxHGKZ
         PyUZrKa0JPDP7GXjhmdNBZ1xcdGpwpBN4LT5vsgGxBUMDS0QoK+wwjSbL6vKP6kfMIX6
         qqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682338079; x=1684930079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmddoLYvCrZv1MC7Bp3ofoIZr5sc+qWYnHRXko8H0X0=;
        b=V0JPIS6C299dC94kj2jr/yyiveyP6hpwewRgA1GbP2hNM1DBkC7e1lDjDJRgZfOiJr
         H4xiA+qM7uShLswPKrdHkIAZ6K+s3KUvvS2HpRo6e+l3qqeAVwfmMrl37fAhUatLYjR4
         JORCHupk2pn/90euD7J2lbBRA6LWLOoCTjegKs8Cm8g5gWwnzyQ5S7zAQFb1XDzixfD/
         B5g55s/Wn3wKT8MLnhljhO3nyLDl3BAwZHxF9yIk4sdZKCPLHBZo9ODiDvF7uXjrQnVW
         xnANDZbnde7OhB7/NJs4W3uoFT2/V/5KEYyoPP1z9UqFCeB3pU6C9jqGL/HaFAN50M1P
         RmhQ==
X-Gm-Message-State: AAQBX9dqZI1Jv8ZrIe9p76S+KuBF2fUQa22GlZs0O1A1bK7NVUntNpK4
        GCFwpBwHGLMrEnnPPR4jTR0=
X-Google-Smtp-Source: AKy350Y1ZV+uZUzG6NOMeuRU7tZ1ZJbsz59Vwq/vljFPXMuo5gRLms8A8kYR88dLnoG8E55Uj+yAyA==
X-Received: by 2002:a17:906:8687:b0:94e:e1c7:31b4 with SMTP id g7-20020a170906868700b0094ee1c731b4mr9333679ejx.48.1682338079377;
        Mon, 24 Apr 2023 05:07:59 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id ho17-20020a1709070e9100b0094edfbd475csm5342630ejc.127.2023.04.24.05.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 05:07:59 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
To:     dmitry.osipenko@collabora.com
Cc:     bbara93@gmail.com, benjamin.bara@skidata.com, jonathanh@nvidia.com,
        lee@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        peterz@infradead.org, rafael.j.wysocki@intel.com,
        richard.leitner@linux.dev, treding@nvidia.com, wsa@kernel.org
Subject: Re: [PATCH v4 3/4] mfd: tps6586x: use devm-based power off handler
Date:   Mon, 24 Apr 2023 14:07:13 +0200
Message-Id: <20230424120713.1288281-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7213c148-5cf8-c251-b809-c6ff59292cad@collabora.com>
References: <7213c148-5cf8-c251-b809-c6ff59292cad@collabora.com>
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

On Mon, 24 Apr 2023 at 12:42, Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> In general and in case of this driver, it should be more reliable and
> cleaner to abort the reboot on a error that shall never happen.

Thanks! Then I will drop my 4/6 of v5 [1].

[1] https://lore.kernel.org/all/20230327-tegra-pmic-reboot-v5-4-ab090e03284d@skidata.com/
