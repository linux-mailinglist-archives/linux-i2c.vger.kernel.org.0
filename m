Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0F8797CBF
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Sep 2023 21:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237767AbjIGTbb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Sep 2023 15:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244281AbjIGR15 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Sep 2023 13:27:57 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 491731710;
        Thu,  7 Sep 2023 10:27:26 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31f737b8b69so645300f8f.3;
        Thu, 07 Sep 2023 10:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694107597; x=1694712397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26DcFGzDOHLTIiLeHWKpfXHidOy7/CEGyz2eAxmSs7g=;
        b=qQONLOK4TWURG9P9wA/Zu6HpecZhSeybNYUZnJf65mlMjDs9nijGzryCayf1uDoyb6
         rQWmt9rE/KgGvQ7Y95E7QyIIZUp29GEl9JcbRiO6CRyc7raEXdHnATlDl53RyqLKqWOA
         OxPWIPJ6Xux9wMRpNXmD0KoZ+DGfwmJCksPIlh7VhS2NrlwSjKdI5ansB02iQBlQx2YI
         m1d2imOEWwmlywCBI/uk9JVy2uFz/sCSNSsv1icrXqu1/4NjR3JVzaMxwX54uBdGGSyO
         xyhx3gRAb8zVCSdG6ehhYUF0S0PwjxRkYs8TELezXumz53XwfTB8myIcQOcyaixCj8Gt
         06Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694107597; x=1694712397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26DcFGzDOHLTIiLeHWKpfXHidOy7/CEGyz2eAxmSs7g=;
        b=NdY2Cv79lXqVtXyZIhlMe/9G5iRkqytQfbmaTrz5ST2V4IJ0H6nYCL77di6xcvX2lh
         MoJlwa8T1BKP8T7Aeg8JBRjEj5YGUbjMpDgi2axWNMBiohWe0pRv0Jyk65Gse/0FrmYu
         RcE68UdW/7zmslz/iPXyLmI9bEv+WYZZA7MbI8Q85QMi+ut0MjJjY/I2UGVI7bfX2pw5
         wRBD+KvEvV+79KQ9uOBw6pUpnHWw4IvXvtheizg1cLQWyh1Xo79ACbE1scwJ2sXfBn8b
         BfHpW1UejoW2nuhWwtjSxu2R9YY8GB9ZXB14l1nMJAYmrlWlsv2Qz3W9ZeVZpmQjiMCL
         LN/Q==
X-Gm-Message-State: AOJu0YyE8LfaX5DnyCVS6EYxySSJRVqbG0yk4a82Br//jfzYlO6aTPwV
        ZvK2Cp9GOuPoD6O27X1owm7gx7eaJfyKMK9s
X-Google-Smtp-Source: AGHT+IGmdbnP2IiRkh2YShm8FU8AlrM8Iy3LYwqc2f08IbVFyuZjViTL76t1BpmUinhyYoKIpv2l/g==
X-Received: by 2002:adf:dd86:0:b0:317:5e55:f06f with SMTP id x6-20020adfdd86000000b003175e55f06fmr4617335wrl.10.1694074839361;
        Thu, 07 Sep 2023 01:20:39 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id n10-20020adfe78a000000b0031aca6cc69csm22772438wrm.2.2023.09.07.01.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 01:20:38 -0700 (PDT)
From:   Benjamin Bara <bbara93@gmail.com>
To:     lee@kernel.org
Cc:     bbara93@gmail.com, benjamin.bara@skidata.com,
        dmitry.osipenko@collabora.com, jonathanh@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, nm@ti.com, peterz@infradead.org,
        rafael.j.wysocki@intel.com, richard.leitner@linux.dev,
        stable@vger.kernel.org, treding@nvidia.com,
        wsa+renesas@sang-engineering.com, wsa@kernel.org
Subject: Re: [PATCH v7 0/5] mfd: tps6586x: register restart handler
Date:   Thu,  7 Sep 2023 10:20:32 +0200
Message-Id: <20230907082032.478027-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230728103446.GK8175@google.com>
References: <20230728103446.GK8175@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Lee,

On Fri, 28 Jul 2023 at 12:34, Lee Jones <lee@kernel.org> wrote:
> On Fri, 28 Jul 2023, Lee Jones wrote:
> > On Sat, 15 Jul 2023 09:53:22 +0200, Benjamin Bara wrote:
> > > The Tegra20 requires an enabled VDE power domain during startup. As the
> > > VDE is currently not used, it is disabled during runtime.
> > > Since 8f0c714ad9be, there is a workaround for the "normal restart path"
> > > which enables the VDE before doing PMC's warm reboot. This workaround is
> > > not executed in the "emergency restart path", leading to a hang-up
> > > during start.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/5] kernel/reboot: emergency_restart: set correct system_state
> >       commit: 60466c067927abbcaff299845abd4b7069963139
> > [2/5] i2c: core: run atomic i2c xfer when !preemptible
> >       commit: aa49c90894d06e18a1ee7c095edbd2f37c232d02
> > [3/5] kernel/reboot: add device to sys_off_handler
> >       commit: db2d6038c5e795cab4f0a8d3e86b4f7e33338629
> > [4/5] mfd: tps6586x: use devm-based power off handler
> >       commit: 8bd141b17cedcbcb7d336df6e0462e4f4a528ab1
> > [5/5] mfd: tps6586x: register restart handler
> >       commit: 510f276df2b91efd73f6c53be62b7e692ff533c1
>
> Pull-request to follow after built tests have completed.

What's the current state of this series?

Thanks & regards
Benjamin
