Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0BD545BD6
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jun 2022 07:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235507AbiFJFuM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jun 2022 01:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231197AbiFJFuL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Jun 2022 01:50:11 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE48FDF;
        Thu,  9 Jun 2022 22:50:07 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id i1so21975750plg.7;
        Thu, 09 Jun 2022 22:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=CyWSAedHHH8WOxnS1FteZqFj5RO4XNsT/w2yY6pNZrc=;
        b=jHR51n/rBZXorS4PRtas+KNzJoLw6JfmAVpo03Uz8XvakGqSmLngXbqd9fTuRdA9Mr
         SUJiTBmkgQqspCzny5lDbppvFmIb4xmVCwdwq4KaC4L8VKtAHugPVxQVarHYSjtI2h7A
         4zPxthNNKz5glgSA0Wv3fIbM3s1VdBIoWclgU+TE9GX1SYQ+PF1Psu/S0FetKS5t47zH
         RccexJgGc1JV5kSPLo1qn9xb1M+u21KSVNu6OiwNN4z3twy3whbFGeX5SEo568BRRVnZ
         yRNqshxv8YKAsFL1nKnoUsDOh58GMLwJ1edKiLjpMXlXvsxUJMM337c29gyT52dlRehf
         T1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CyWSAedHHH8WOxnS1FteZqFj5RO4XNsT/w2yY6pNZrc=;
        b=KJG6epJY+G1jScKIjfO3HslaSk+4BJ+rH2WZyOII32AsIOLwA8QWGi1bXg2ZQa6/R5
         UB287lYgfCar+yELrl+7XrG8AG4HR2/VkhDk+VKEvz6W6luSrrlYghdUXqU3AMm0SBYc
         Q9TJoO6zmOW8giDr0rcZCFOX49mwYelAXyDKpIeAPHnTE65NTtK19N0/CDKl6HqtiXFc
         HBDGXFLxY2calAOT0CCDvQhbOCfe4EamxhlUSjV7DzrPHpo2Ike+8VpQKF+0FPDirob0
         nwcYEhvZk9Iin6Mfk1jQC8aiUJjWD5exvB5lN69bguAeae6NclKHyrxpCu6BAxgP02Po
         ypyQ==
X-Gm-Message-State: AOAM5302xwvX2nUdsx3pRholrh3J7CgmFeFEG1Fngt9jGjCnAYKjUdrm
        OzpvQaNy7tPpVUfRcVfi2Vw=
X-Google-Smtp-Source: ABdhPJxVzUr7NUgjQryDfxWm2iEgiYJMjWQvXvaoZfjKjxdgdkHJ5HjzaHdIlY3E5Izq5281au1t4w==
X-Received: by 2002:a17:90b:4b0a:b0:1e8:6ff0:7ec1 with SMTP id lx10-20020a17090b4b0a00b001e86ff07ec1mr7096038pjb.212.1654840207358;
        Thu, 09 Jun 2022 22:50:07 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id f11-20020aa7968b000000b0051b90ac6c15sm18553977pfk.125.2022.06.09.22.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 22:50:07 -0700 (PDT)
From:   Potin Lai <potin.lai.pt@gmail.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Rayn Chen <rayn_chen@aspeedtech.com>
Cc:     Patrick Williams <patrick@stwcx.xyz>,
        Potin Lai <potin.lai@quantatw.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v4 0/2] Add a property for setting minimum persentage of i2c clock high
Date:   Fri, 10 Jun 2022 13:47:20 +0800
Message-Id: <20220610054722.32229-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Introducing i2c-clk-high-min-percent property for setting minimum
persentage of clock high.

This driver will go through base clock divisor and calculate a set of
high/low clock with duty cycle applied. if driver could not find a suit
high/low clock set, then it will use default duty cycle (50%) recalculate.

LINK: [v1] https://lore.kernel.org/all/20220530114056.8722-1-potin.lai.pt@gmail.com/
LINK: [v2] https://lore.kernel.org/all/20220601041512.21484-1-potin.lai.pt@gmail.com/
LINK: [v3] https://lore.kernel.org/all/20220607163703.26355-1-potin.lai.pt@gmail.com/

changes v3 --> v4:
* rename property to i2c-clk-high-min-percent

changes v2 --> v3:
* discard the properties for manual setting, use duty cycle to calculate
  high/low clock.

changes v1 --> v2:
* update bt-bindings documentation
* use meaningful values for properties instead of acture value in register

Potin Lai (2):
  aspeed: i2c: add clock duty cycle property
  dt-bindings: aspeed-i2c: add properties for setting i2c clock duty
    cycle

 .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  7 +++
 drivers/i2c/busses/i2c-aspeed.c               | 56 +++++++++++++++----
 2 files changed, 52 insertions(+), 11 deletions(-)

-- 
2.17.1

